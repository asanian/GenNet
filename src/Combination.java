/*
 * Combination.java
 * 
 * Version 1.0
 */


import java.util.* ;

/**
 * Representation of a Combination
 */
public class Combination {

	public Vector<Integer> current,newComb;
	//public Vector<Integer> newComb;
	public Vector<Vector<Integer>> vSaveComb;
	//public int index;
	//--------------- Ajout Michael
	public int traverseCombination, index;
	//-----------------

	public Combination() {
		current = new Vector<Integer>();
		vSaveComb = new Vector<Vector<Integer>>();
		newComb = new Vector<Integer>();       
	}

	public void addEnC(int i) {
		current.addElement(new Integer(i));
	}
	public void setEnC(int place, int i) {
		Integer I = new Integer(i);
		current.set(place, I);
	}
	public void addNv(int i) {
		newComb.addElement(new Integer(i));
	}
	public void setNv(int place, int i) {
		Integer I = new Integer(i);
		newComb.set(place, I);
	}

	public int getIndex() {
		return this.index;
	}

	public void incIndex() {
		index = index+1;
	}

	// ajoute la nouvelle combinaison|| Adds new combinations
	public void addComb() {
		Vector<Integer> temp = new Vector<Integer>();
		for(int i=0; i<newComb.size() ; i++) {
			temp.add(newComb.elementAt(i));
		}
		vSaveComb.addElement(temp);
	}

	//-------------- Ajout Michael
	public void initialise(LinkedList<Integer> level)
	{
		LinkedList<Integer> combinaison=new LinkedList<Integer>();
		for (int i=0; i<level.size(); i++)
		{
			combinaison.add(new Integer(0));
		}
		Vector<Integer> newCombi=new Vector<Integer>();
		for (int i=0; i<combinaison.size(); i++)
		{
			newCombi.add(new Integer(combinaison.get(i)));
		}
		vSaveComb.add(newCombi);
		traverseCombination=level.size()-1;
		while (!combinaison.equals(level))
		{

			createComb(combinaison, level);
		}
		for(int i=0; i<level.size() ; i++) {
			current.add(new Integer(0));
			newComb.add(new Integer(0));
		}
		index=0;
	}
	public LinkedList<Integer> createComb(LinkedList<Integer> combinaison, LinkedList<Integer> level)
	{
		if (combinaison.get(traverseCombination)<level.get(traverseCombination))
		{
			combinaison.set(traverseCombination, combinaison.get(traverseCombination)+1);
			for (int j=traverseCombination+1; j<combinaison.size(); j++)
			{
				combinaison.set(j, 0);
			}
			traverseCombination=combinaison.size()-1;
			Vector<Integer> newCombi=new Vector<Integer>();
			for (int i=0; i<combinaison.size(); i++)
			{
				newCombi.add(new Integer(combinaison.get(i)));
			}
			vSaveComb.add(newCombi);
		}
		else if (traverseCombination==0)
		{
			for (int j=traverseCombination+1; j<combinaison.size(); j++)
			{
				combinaison.set(j, 0);
			}
			traverseCombination=combinaison.size()-1;
			Vector<Integer> newComb=new Vector<Integer>();
			for (int i=0; i<combinaison.size(); i++)
			{
				newComb.add(new Integer(combinaison.get(i)));
			}
			vSaveComb.add(newComb);
		}
		else {
			traverseCombination-=1;
		}
		return combinaison;
	}
	//---------------------------- (fin ajout Michael)
}
