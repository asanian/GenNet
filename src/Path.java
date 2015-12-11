
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
public class Path {
    
    
	public LinkedList<LinkedList<Vector>> paths; //sPathes paths trouv�s
	
	public Path(HashMap<Vector, LinkedList<Vector>> links, Vector<Integer> stateDepart, Vector<Integer> stateArrive) {
		paths= new LinkedList<LinkedList<Vector>>();
		LinkedList<Vector> states=new LinkedList<Vector>(); //list of state on the path being analyzed => Prevents back in a cycle
		LinkedList<Vector> statesAnalysis=new LinkedList<Vector>();
		LinkedList<Vector> accessors=new LinkedList<Vector>();
		Node preNode=new Node(stateDepart);
		buildTree(preNode, states, links, stateArrive,statesAnalysis, accessors); //creation of the model tree reading for all countries to share Depart state
	}

	private void buildTree (Node node, LinkedList<Vector> states, HashMap<Vector, LinkedList<Vector>> links, Vector<Integer> stateArrive, LinkedList<Vector> statesAnalyses, LinkedList<Vector> accessor) {

		/*tree building rcursive with analysis when you cross a sheet*/

		states.add(node.state); //it is reported that the current path analysis contains the new state
		for (int j=0; j<links.get(node.state).size() ; j++){ //for all possible transitions
			if (!statesAnalyses.contains(links.get(node.state).get(j)) || accessor.contains(links.get(node.state).get(j)))
			{
				if (links.get(node.state).get(j).equals(stateArrive)) //si on rencontre l'�tat final d�sir�
				{
					LinkedList<Vector> reversePath = new LinkedList<Vector>(); //liste stoquant le chemin � l'envers
					reversePath.add(stateArrive);
					traverseTree(node, reversePath, statesAnalyses, accessor);
				}
				else  // �crit de cette fa�on, le code impose que l'�tat final d�sir� ne sois pas analyser (�limine les �ventuelles chemin formant un cycle � partir de cet �tat)
				{
					/*Teste pour savoir si on a d�j� rencontr� cet �tat sur le chemin en cours d'analyse*/
					boolean equal=false;
					for (int i=0; i<states.size(); i++)
					{
						if (states.get(i).equals(links.get(node.state).get(j)))
						{
							equal=true;
						}

					}
					if (!equal)  //Si l'�tat l'a pas encore �t� rencontr�
					{
						node.newChild(links.get(node.state).get(j));
						buildTree(node.getFils(node.child.size()-1), states, links, stateArrive, statesAnalyses, accessor);
					}
				}
			}
		}
		remove(states, node.state); // nous avons analys� toutes les transitions partant de cet �tat, les prochains paths analys� partiront d'un �tat ant�rieur
		
		statesAnalyses.add(node.state);
	}

	private void traverseTree(Node node, LinkedList<Vector> reversePath, LinkedList<Vector> statesAnalysis, LinkedList<Vector> accessors) {

		if ((Integer)node.state.get(0)!=-1)
		{
			if (!accessors.contains(node.state)) accessors.add(node.state);
			reversePath.add(node.state);
			traverseTree(node.parent, reversePath, statesAnalysis, accessors); //if we are still in the tree
		}

		else
		{
			LinkedList<Vector> path = new LinkedList<Vector>();
			for (int k=reversePath.size(); k>0; k--) //on d�pile le chemin
			{
				path.add(reversePath.get(k-1));
			}

			paths.add(path); //addition of the new path FOUND
		}

	}

	public static void remove(LinkedList<Vector> etats, Vector etat){ //delete 
		int k=-1;
		for (int i=0; i<etats.size(); i++)
		{
			if (etats.get(i).equals(etat))
			{
				k=i;
			}
		}
		if (k!=-1) etats.remove(k);
	}

}

