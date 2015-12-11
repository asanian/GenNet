/*
 * SearchComb.java
 *
 * Version 2.1
 *
 * Created on 2 mai 2004, 22:12
 */

import java.io.*;
import java.util.*;

/**
 * Scroll through the graph
 * @author  Nicolas Peres
 */
public class SearchComb {
    
    
	private Automate auto = new Automate();
	private Combination comb = new Combination();
	PrintWriter file1, file2;
	public int st;
	public SearchComb(LinkedList<Integer> levels, Combination comb, PrintWriter file1, PrintWriter file2) {

		this.auto = auto;
		this.comb = comb;
//		--------------- modification Michael
		comb.initialise(levels);
		//--------------

		this.file1 = file1;
		this.file2 = file2;
	}

	/** Creates a new instance of SearchComb */
	public void treatment(Automate auto, Combination comb, MenuEditer menu) throws Exception {
		this.auto = auto;
		this.comb = comb;
		int i, j, m, kkk, ii,temp;
		int n=8;

		// if there is still at least a combination deal
		if (comb.getIndex() < comb.vSaveComb.size()) {
			comb.current = (Vector)comb.vSaveComb.elementAt(comb.getIndex());
			for (int t=0; t<comb.current.size(); t++){
				file2.print(comb.current.get(t));
				addSpaces(n, comb.current.get(t).toString(), file2);
			}
			file2.print("| ");
			file1.println("");
			file1.println("-- for the configuration " + comb.current);
			file1.print("loc conf_");
			for(ii=0; ii<auto.vEntity.size() ; ii = ii+1) {
				file1.print((Integer) comb.current.get(ii));
			}
			file1.print(": while True wait {");
//			-----------------Modif Beno�t------------------
			for(ii=0; ii<auto.vEntity.size() ; ii = ii+1) {
				Entity etape = (Entity) auto.vEntity.get(ii);
				file1.print("dh" + etape.getLabel());
				if (ii<auto.vEntity.size()-1) {
					file1.print("=1, ");
				} else {
					file1.println("=1}");
				}
			}
			//------------------------------------------------


			Vector<Integer> Kvalues=new Vector<Integer>();
			for(i=0; i<auto.vEntity.size() ; i = i+1) {
				Vector predec = new Vector();
				for(m=0; m<auto.vEntity.size() ; m = m+1) {
					int currentState = ((Integer)(comb.current.elementAt(m))).intValue();
					//Entity entity = (Entity) auto.vEntity.get(i);
					//int limite = entity.getNum();

					boolean test = false;
					int l = -1;
					while ((!test) && l<auto.vTrans.size()-1) {
						l = l+1;
						Trans trans = (Trans) auto.vTrans.get(l);
						int a1 = trans.getNumInitialEnt();
						int a2 = trans.getNumFinalEnt();
						if (a1-1 == m && a2-1 == i) {
							test = true;
						}
					}
					Trans trans = (Trans) auto.vTrans.get(l);
					int threshold = trans.getThreshold();

					if (test) {
						if (trans.getSign() == 1) {    // activateur
							if (currentState >= threshold) {
								predec.add(new Integer(m));
							}
						}
                                                
                                                  else {                        // inhibiteur
							if (currentState < threshold) {
								predec.add(new Integer(m));
							}
						}
					}
				}
				String source="";
				source+="{";
				if (predec.size()!=0)
				{
					for (int r=0; r<predec.size(); r++)
					{
						source+=((Entity)auto.vEntity.get((Integer)predec.get(r))).getLabel();
						if (predec.size()-r>1) source+=", ";
					}
				}
				source+="}";
				file2.print(source);
				addSpaces(n+7, source, file2);

				// PREDEC is the vector of the names of genes acting on i
				// look for the corresponding parameter K.
				Entity entity = (Entity) auto.vEntity.get(i);
				int indiceK = entity.correspK(predec);
				
				if (indiceK<0) Kvalues.add(indiceK);
				else Kvalues.add(entity.getK(indiceK).getValue());

				if (indiceK<0) {
					// There are currently no corresponding K Parameter
				} else {
					kkk = entity.getK(indiceK).getValue();

					// tests for "rising" link, then "down"
					if ((kkk - ((Integer)(comb.current.elementAt(i))).intValue())>0) {
						for (j=0; j<comb.current.size(); j++) {
							temp = ((Integer)(comb.current.elementAt(j))).intValue();
							comb.setNv(j, temp);
							if (j == i) {
								temp = ((Integer)(comb.newComb.elementAt(i))).intValue() + 1;
								comb.setNv(j, temp);
							}
						}
						// To find the val  of state //Jamil Ahmad
						for(ii=0; ii<auto.vEntity.size() ; ii = ii+1) {
							st = ii;
						}
						// is written in the HyTech
//						-----------Modification Benoit----------
						boolean equal=false;
						for (int p=0; p<comb.vSaveComb.size(); p++)    //ajout d'un test pour ne pas faire apparaitre de nouvel �tat (Michael)
						{
							if (comb.vSaveComb.get(p).equals(comb.newComb))
							{
								equal=true;
							}
						}
						if (equal==true)
						{
							file1.print("         when h" + entity.getLabel() + "=dp" + entity.getLabel() + " do {h" + entity.getLabel() + "'=0 "+",state'=");
							for(ii=0; ii<auto.vEntity.size() ; ii = ii+1) {
								file1.print((Integer) comb.newComb.get(ii));
							}
							file1.print("} goto conf_");
							for(ii=0; ii<auto.vEntity.size() ; ii = ii+1) {
								file1.print((Integer) comb.newComb.get(ii));
							}
							file1.println(";");
							//------------------------------------------

							addLinks(menu, comb.current, comb.newComb); // Michael
						}

//						Michael----- Now useless piece of code, remove-------

					} else if ((kkk - ((Integer)(comb.current.elementAt(i))).intValue())<0) {
						for (j=0; j<comb.current.size(); j++) {
							temp = ((Integer)(comb.current.elementAt(j))).intValue();
							comb.setNv(j, temp);
							if (j == i) {
								temp = ((Integer)(comb.newComb.elementAt(i))).intValue() - 1;
								comb.setNv(j, temp);
							}
						}
						// To find the val  of state //Jamil Ahmad
						for(ii=0; ii<auto.vEntity.size() ; ii = ii+1) {
							st = ii;
						}
						// is written in the HyTech
//						-----------Modification Benoit----------
						boolean equal2=false;
						for (int p=0; p<comb.vSaveComb.size(); p++)    //Adding a test for not appear again state 
						{
							if (comb.vSaveComb.get(p).equals(comb.newComb))
							{
								equal2=true;
							}
						}
						if (equal2==true)
						{
							file1.print("         when h" + entity.getLabel() + "=dp" + entity.getLabel() + " do {h" + entity.getLabel() + "'=0 "+",state'=");
							for(ii=0; ii<auto.vEntity.size() ; ii = ii+1) {
								file1.print((Integer) comb.newComb.get(ii));
							}
							file1.print("} goto conf_");
							for(ii=0; ii<auto.vEntity.size() ; ii = ii+1) {
								file1.print((Integer) comb.newComb.get(ii));
							}
							file1.println(";");
							//------------------------------------------

							addLinks(menu, comb.current, comb.newComb); // Michael
						}
//						Michael----- Morceau de code d�sormais inutile, supprim�-------
					}

				}
			}
			file2.print("| ");
			for (int r=0; r<Kvalues.size(); r++)
			{
				if (Kvalues.get(r)<0) file2.print(" ");
				else file2.print(Kvalues.get(r));
				addSpaces(n+5, " ", file2);
			}
			file2.print("| ");
			file2.println(menu.Lines.get(comb.current));
			comb.incIndex();
			file2.println();
			file2.println();
			treatment(auto, comb, menu);
		}


	}
        // Add link
	public static void addLinks(MenuEditer menu, Vector departtemp, Vector arrivetemp){

		Vector depart=new Vector();
		depart=(Vector)departtemp.clone();
		Vector arrive=new Vector();
		arrive=(Vector)arrivetemp.clone();

		menu.Lines.get(depart).add(arrive);

	}
public static void  addSpaces(int n, String mot, PrintWriter file){
		
		if (mot.length()<n)
		{
			for (int i=mot.length(); i<=n; i++)
			{
				file.print(" ");
			}
		}
	}
}
