import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.*;
import java.util.*;

public class NewYearsResolution
{
	public static void main(String[] args)
	{
		try
		{
			if (args.length != 1 && args.length != 2)
			{
				System.out.printf("Usage: input_file [output_file]\n");
				System.exit(-1);
			}

			List<String> lines = readInput(new File(args[0]));
			PrintWriter pw = null;
			if (args.length > 1)
			{
				pw = new PrintWriter(new FileWriter(args[1]));
			}
			int numProblems = toInt(lines.remove(0));
			for (int i = 0 ; i < numProblems ; i++)
			{
				Problem problem = readProblem(lines);
				boolean b = solveProblem(problem);
				System.out.printf("Case #%d: %s\n", i+1, b ? "yes" : "no");
				if (pw != null)
				{
					pw.printf("Case #%d: %s\n", i+1, b ? "yes" : "no");
				}
			}

			if (pw != null)
			{
				pw.close();
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	private static List<String> readInput(File f) throws IOException
	{
		Path p = f.toPath();
		return Files.readAllLines(p, Charset.defaultCharset());
	}

	private static boolean solveProblem(Problem p)
	{
		Nutrients req = p.getRequirements();
		List<Nutrients> foods = new ArrayList<Nutrients>(p.getFoods());

		// First, clear all the foods that are too much to begin with.
		for (Iterator<Nutrients> iterator = foods.iterator(); iterator.hasNext(); )
		{
			Nutrients n = iterator.next();
			if (n.exceeds(req))
			{
//				System.out.printf("Removing %s for %s\n", n, req);
				iterator.remove();
			}
		}

		// Go over all the possibilities

		int iterations = (int)Math.pow(2, foods.size());
		for (int count = 0 ; count < iterations ; count++)
		{
			Nutrients solution = new Nutrients();
			for (int i = 0; i < foods.size(); i++)
			{
				Nutrients food = foods.get(i);
				// See if this food should count.
				if (((1 << i) & count) != 0)
				{
					solution.add(food);
				}
			}

			if (solution.equals(req))
			{
				//System.out.printf("Solution matches: %s\n", solution);
				return true;
			}
		}
		return false;

	}

	private static int toInt(String s)
	{
		return Integer.valueOf(s.trim());
	}

	private static Problem readProblem(List<String> lines)
	{
		Nutrients req = readNutrientsLine(lines.remove(0));
		List<Nutrients> foods = new ArrayList<Nutrients>();
		int numFoods = toInt(lines.remove(0));
		for (int i = 0 ; i < numFoods ; i++)
		{
			foods.add(readNutrientsLine(lines.remove(0)));
		}

		return new Problem(req, foods);
	}

	private static Nutrients readNutrientsLine(String line)
	{
		String[] parts = line.split(" ");
		if (parts.length != 3)
		{
			throw new IllegalArgumentException("Illegal nutrients line: " + line);
		}

		return new Nutrients(
				toInt(parts[0]),
				toInt(parts[1]),
				toInt(parts[2])
		);
	}


	private static class Problem
	{
		private final Nutrients requirements;
		private final List<Nutrients> foods;

		public Problem(Nutrients requirements, List<Nutrients> foods)
		{
			this.requirements = requirements;
			this.foods = foods;
		}

		public Nutrients getRequirements()
		{
			return requirements;
		}

		public List<Nutrients> getFoods()
		{
			return foods;
		}

		@Override
		public String toString()
		{
			return "Problem{" +
					"requirements=" + requirements +
					", foods=" + foods +
					'}';
		}
	}

	private static class Nutrients
	{
		private int carbs = 0;
		private int protein = 0;
		private int fat = 0;

		public Nutrients(int carbs, int protein, int fat)
		{
			this.carbs = carbs;
			this.protein = protein;
			this.fat = fat;
		}

		public Nutrients()
		{
		}

		public void add(Nutrients o)
		{
			carbs += o.carbs;
			protein += o.protein;
			fat += o.fat;
		}

		@Override
		public boolean equals(Object o)
		{
			if (this == o)
			{
				return true;
			}
			if (o == null || getClass() != o.getClass())
			{
				return false;
			}

			Nutrients nutrients = (Nutrients) o;

			if (carbs != nutrients.carbs)
			{
				return false;
			}
			if (fat != nutrients.fat)
			{
				return false;
			}
			if (protein != nutrients.protein)
			{
				return false;
			}

			return true;
		}

		@Override
		public int hashCode()
		{
			int result = carbs;
			result = 31 * result + protein;
			result = 31 * result + fat;
			return result;
		}

		public boolean exceeds(Nutrients o)
		{
			return carbs > o.carbs || protein > o.protein || fat > o.fat;
		}

		@Override
		public String toString()
		{
			return "Nutrients{" +
					"carbs=" + carbs +
					", protein=" + protein +
					", fat=" + fat +
					'}';
		}
	}
}
