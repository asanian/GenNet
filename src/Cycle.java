import java.util.HashMap;
import java.util.LinkedList;
import java.util.Vector;
/**
 * 
 * @author Michael PIERRE
 *
 */

/**
 *
 * @author Michael PIERRE
 */
public class Cycle {

	public LinkedList<LinkedList<Vector>> cycles; // stock des cycles trouv�s

	public Cycle(HashMap<Vector, LinkedList<Vector>> Liens, Combination comb) {
		cycles= new LinkedList<LinkedList<Vector>>();
		for (Vector state: comb.vSaveComb)
		{
			Path searchPath = new Path (Liens, state, state);
			addCycles(searchPath.paths);
		}
	}
	
	public Cycle(HashMap<Vector, LinkedList<Vector>> Liens, Vector<Vector<Integer>> combinaisons) {
		cycles= new LinkedList<LinkedList<Vector>>();
		for (int i = 0; i < combinaisons.size(); i++) {
			Path path = new Path (Liens, combinaisons.get(i), combinaisons.get(i));
			addCycles(path.paths);
		}
	}

	private void addCycles(LinkedList<LinkedList<Vector>> paths) {

		if (cycles.size()==0 && paths.size()!=0)
		{
			cycles.add(paths.getFirst());
		}
		LinkedList<LinkedList<Vector>> cyclesTemp= new LinkedList<LinkedList<Vector>>();
		
		for (LinkedList<Vector> path : paths)
		{
			boolean test=false;
			
			for (LinkedList<Vector> cycle : cycles)
			{

				if (path.size()==cycle.size())
				{
					if (path.contains(cycle.getFirst()))
					{
						boolean contains = true;
						int i=0;
						while (contains && i+path.indexOf(cycle.getFirst())<path.size())
						{
							if (!path.get(i+path.indexOf(cycle.getFirst())).equals(cycle.get(i)))
							{
								contains=false;
							}
							i++;
						}
						if (contains)
						{
							int j=0;
							while (contains && i-1+j<cycle.size())
							{
								if (!path.get(j).equals(cycle.get(i-1+j)))
								{
									contains=false;
								}
								j++;
							}
						}
						
						if (contains)
						{
							test=true;
						}
					}
				}
			}
			if(!test)
			{
				cyclesTemp.add(path);
			}
		}
		
		for (LinkedList<Vector> newCycles : cyclesTemp)
		{
			cycles.add(newCycles);
		}

	}


}