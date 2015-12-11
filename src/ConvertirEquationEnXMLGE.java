import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;
import java.util.StringTokenizer;
import java.util.TreeMap;
import java.util.Vector;

import javax.swing.JFileChooser;

public class ConvertirEquationEnXMLGE {

	protected static StateGraphFrame stateGraphFrame;
	
	/**
	 * This class is used to convert a file. Txt  that contains the equations in an XML graph of states

	 */
	public ConvertirEquationEnXMLGE(StateGraphFrame sgFrame) {
		this.stateGraphFrame=sgFrame;
	}
	
	/**
	 * This recursive function to list all conceivable states �
	 * From the list of threshold	
	 * @param list : the list contains the maximum levels of genes
	 * @param tree : the state has a tree map combining resources
	 */
	public static void possibleStates(TreeMap tree, ArrayList<Integer> list, String stateTemp) {
            
		String state = "";
		int cpt = 0;
		int cpt2 = 0;

		if (list.size() == 1) {
			for (cpt = 0; cpt < list.get(0) + 1; cpt++) {
				state = stateTemp + " " + cpt;
				tree.put(state, new ArrayList<Integer>());
			}
		} else {
			while (cpt2 < list.get(0) + 1) {
				ArrayList<Integer> sousListe = new ArrayList<Integer>();
				for (int i = 0; i < list.size() - 1; i++) {
					sousListe.add(list.get(i + 1));
				}
				state = stateTemp + " " + cpt2;
				possibleStates(tree, sousListe, state);
				state = "";
				cpt2++;
			}
		}
	}

	/**
	 * This method allows a stateResources position from the different states
	 * 
	 * @param etatRessource : the tree map that contains the different states as well as related resources  */

    /**
     * This method allows a stateResources position from the different states
     * @param etatRessource : the tree map that contains the different states as well as related resources
     */
    public static ArrayList<State> createStates(TreeMap etatRessource) {
		// Pour les positions
		double sqrRootCombSize = Math.floor(Math.sqrt(etatRessource.size()));
		int columnMAX = (int) sqrRootCombSize;
		int line = 1;
		int column = 1;
		// Pour le numero on utilise un compteur
		int cpt = 0;
		ArrayList<State> vState = new ArrayList<State>();
		TreeMap stateResource = new TreeMap(etatRessource);
		// Recherche des �tiquette et des num�ros
		while (stateResource.isEmpty() == false) {
			String s = (String) stateResource.firstKey();
                        
			// treatment of string s to a more suitable label
                        
			String delimiters = " ";
			StringTokenizer st = new StringTokenizer(s, delimiters);
			String label = st.nextToken();
			while (st.hasMoreTokens()) {
				String mot = st.nextToken();
				label = label + "," + mot;
			}
			// x et y
			vState.add(new State(label, 100 * line, 100 * column, cpt,
					false));
			// Incrementation
			stateResource.remove(stateResource.firstKey());
			column++;
			if (column > columnMAX) {
				column = 1;
				line++;
			}
			cpt++;
		}
		return vState;
	}

	/**
	 * Basic method with cin to return the value of thetas
	 * @param lesTheta : a treemap that contains the different coefficients theta
	 */
	public static void evalTheta(TreeMap lesTheta) {
		FrameTheta ft = new FrameTheta(stateGraphFrame, lesTheta);		
		lesTheta = ft.theta;		
	}

	/**
	 * This method converts a string like s {n, x, theta (x, y)} in an integer of 0 or 1 
	 * @param s :the character string type s {n, x, theta (x, y)}
	 * @param level :where the level is x
	 * @param lesThetas : contains the values ​​of various coefficients thetas
	 * @return result :the integer 0 or 1, in accordance with the adopted modeling
	 */
	public static int evalS(String s, int level, TreeMap lesThetas) {
		// Initialisation
		int result = 0;
		int cpt = 0;
		String sign = "";
		String gene = "";
		int thetaValue = 0;
		String temp = "";
		// Information Retrieval
		String delimiteurs = " { } , ";
		StringTokenizer st = new StringTokenizer(s, delimiteurs);
		while (st.hasMoreTokens()) {
			String mot = st.nextToken();
			if (cpt == 1) {
				sign = mot;
			}
			if (cpt == 2) {
				gene = mot;
			}
			if (cpt == 3) {
				temp = mot + ",";
			}
			if (cpt == 4) {
				thetaValue = (Integer) lesThetas.get(temp + mot);
			}
			cpt++;
		}
		// Calculs
		if (sign.equals("p")) {
			if (level >= thetaValue) {
				result = 1;
			}
		}
		if (sign.equals("n")) {
			if (level < thetaValue) {
				result = 1;
			}
		}
		return result;
	}

	/**
	 * Returns the gene concerned in s {...}
	 * 
	 * @param s
	 * @return
	 */
	public static String returnGene(String s) {
		// Initialisation
		int cpt = 0;
		String gene = "";
		// Recherche d'information
		String delimiters = " { } , ";
		StringTokenizer st = new StringTokenizer(s, delimiters);
		while (st.hasMoreTokens()) {
			String mot = st.nextToken();
			if (cpt == 2) {
				gene = mot;
			}
			cpt++;
		}
		return gene;
	}

	/**
	 * This method allows you to convert an equation in the form of a String Arraylist containing important elements of the equation the last 4 elements of the list is removed
	 * les 4 derniers �l�ments de la liste, ie ceux qui correspondent � " -
	 * gamma(gene) * x.gene" En efet, la division par gamma(gene) � la fin est
	 * inutile
	 * 
	 * @param equaString : l'equation sous forme de string
	 * @return equaList : l'equation sous forme de ArrayList
	 */
	public static ArrayList<String> equaStringToEquaList(String equaString) {
		ArrayList<String> equaList = new ArrayList<String>();
		String equaStringModified = equaString;
		// On insere des token dans equaStringModified
		equaStringModified = equaStringModified.replace("+", "$+$");
		equaStringModified = equaStringModified.replace("-", "$-$");
		equaStringModified = equaStringModified.replace("*", "$*$");
		// Le decoupage en liste d'�l�ments peut maintenant se faire avec un
		// String Tokenizer
		String delimiters = " $ ; ";
		StringTokenizer st = new StringTokenizer(equaStringModified,delimiters);
		while (st.hasMoreTokens()) {
			String mot = st.nextToken();
			equaList.add(mot);
		}
		for (int i = 0; i < 4; i++) {
			equaList.remove(equaList.size() - 1);
		}
		return equaList;
	}

	/**
	 * This method allows, from an equation containing only reels and operators (!), To assess the value of the equation. 1/On
	 * through the list and all multiplications are performed. 2/On
	 * through the list and any additions are made. 3/La 
         * list is now limited to a single reel which is the result
	 * @param equaList :equation as ArrayList. That contains only DESR eels and operators !!
	 * @return
	 */
	public static String evalEquaList(ArrayList<String> equaList) {
		ArrayList<String> equaList2 = new ArrayList<String>();
		equaList2 = equaList;
		// les multiplications
		for (int i = 0; i < equaList2.size(); i++) {
			if (equaList2.get(i).equals("0")) {
				if (i >= 2) {
					if (equaList2.get(i - 1).equals("*")) {
						equaList2.remove(i - 2);
						equaList2.remove(i - 2);
						i = 0;
					}
				} else if (i + 1 < equaList2.size()) {
					if (equaList2.get(i + 1).equals("*")) {
						equaList2.remove(i + 1);
						equaList2.remove(i + 1);
						i = 0;
					}
				}
			}
			if (equaList2.get(i).equals("1")) {
				if (i >= 2) {
					if (equaList2.get(i - 1).equals("*")) {
						equaList2.remove(i - 1);
						equaList2.remove(i - 1);
						i = 0;
					}
				} else if (i + 1 < equaList2.size()) {
					if (equaList2.get(i + 1).equals("*")) {
						equaList2.remove(i);
						equaList2.remove(i);
						i = 0;
					}
				}
			}
		}
		// les additions(/soustractions) de 0
		for (int i = 0; i < equaList2.size(); i++) {
			if (equaList2.get(i).equals("0")) {
				if (i >= 2) {
					if (equaList2.get(i - 1).equals("+")
							|| equaList2.get(i - 1).equals("-")) {
						equaList2.remove(i - 1);
						equaList2.remove(i - 1);
						i = 0;
					}
				} else if (i == 0 && equaList2.size() > 1) {
					if (equaList2.get(i + 1).equals("+")) {
						equaList2.remove(0);
						equaList2.remove(0);
						i = 0;
					}
				}
			}
		}
		String result = "";
		for (int i = 0; i < equaList2.size(); i++) {
			result = result + equaList2.get(i);
		}
		return result;
	}

	/**
	 * To open a FileChooser
	 * 
	 * @return target : address or load the Gen
	 */
	public static String openingGen() {
		String target = "";
		// Select the file. Gen convert to xml
		JFileChooser fileChooser = new JFileChooser();
		fileChooser.addChoosableFileFilter(new FiltreGen());
		fileChooser.setDialogTitle("Gen Charger with Equations");
		int returnVal = fileChooser.showOpenDialog(fileChooser);
		if (returnVal == JFileChooser.APPROVE_OPTION) {
			File file = fileChooser.getSelectedFile();
			target = file.getAbsolutePath();
			Utils extension = new Utils();
			if (extension.getExtension(file) == null) {
				target = target + ".dot";
			}
		}
		return target;
	}

	/**
	 * 
	 * @return destination : address o save the XML
	 */
	public static String safeguardXML() {
		String destination = "";
		/** The name of the xml file*/
		String name = "";
		// save the xml file
		JFileChooser fileChooser2 = new JFileChooser();
		fileChooser2.addChoosableFileFilter(new FiltreXml());
		fileChooser2.setDialogTitle("Register in XML");
		int returnVal2 = fileChooser2.showSaveDialog(fileChooser2);
		if (returnVal2 == JFileChooser.APPROVE_OPTION) {
			File file = fileChooser2.getSelectedFile();
			destination = file.getAbsolutePath();
			name = file.getName();
			Utils extension = new Utils();
			if (extension.getExtension(file) == null) {
				destination = destination + ".xml";
			}
		}
		return destination;
	}

	/**
	 * Basic method with cin to enter the final vector
	 * 
	 * @param lesTheta :
	 *            a treemap that contains the different coefficients theta
	 */
	public static TreeMap evalVecteur(TreeMap stateResources) {
		FrameResources fr = new FrameResources(stateGraphFrame, stateResources);		
		stateResources = fr.stateResources;			
		return fr.stateResources;
	}

	/**
	 * The function that converts equations Gen in an XML file containing the graph state
	 */
	public static void convertEquaToGE() throws IOException {

		/** The target is. Txt convert Gen*/
		String target = openingGen();
		/** The destination is where we will store the XML graph of State */
		String destination = safeguardXML();
		/** The names of genes */
		ArrayList<String> listGenes = new ArrayList<String>();
		/** The list of maximum levels */
		ArrayList<Integer> listThreshold = new ArrayList<Integer>();
		/** list of equations */
		ArrayList<String> listEqua = new ArrayList<String>();
		/** The list of states a priori possible */
		TreeMap stateResources = new TreeMap();
		/**
		 * Boolean that indicates that one traverses the part of ocument on equations diferentielles
		 */
		boolean equa = false;
		/**
		 * This string contains the text of equations that should be kept as a comment
		 */
		String comment = "";
		boolean isComment = false;
		/** true if a gene is treated */
		boolean isGene = false;
		/**
		 * This treemap contains thetas Associs each gene in an arraylist
		 */
		TreeMap lesThetas = new TreeMap();
		/** used to determine the thresholds and equations */
		boolean readingEqua = false;
		boolean approx = false;
		int cpt = 0;
		String equation = "";
		/** For transitions between states */
		ArrayList<TransState> vTranState = new ArrayList<TransState>();

		/* Read equation.txt and retrieve relevant information */
		String delimiters = " . : ? ! [ ] / \"";
		try {
			BufferedReader in = new BufferedReader(new FileReader(target));
			String line = in.readLine();
			while (line != null) {
				StringTokenizer st = new StringTokenizer(line, delimiters);
				while (st.hasMoreTokens()) {
					String mot = st.nextToken();

					//System.out.println(mot);

					// Activation / deactivation of boolean equation
					if (mot.equals("$ed")) {
						equa = true;
					}
					if (mot.equals("$fed")) {
						equa = false;
					}
					// To keep the text comment
					if (isComment == true) {
						comment = comment + " " + mot;
					}
					if (mot.equals("Commentaire")) {
						isComment = true;
						comment = "Commentaire" + " ";
					}
					if (equa = true) {
						// Retrieving names and numbers of genes
						if (isGene) {
							listGenes.add(mot);
							isGene = false;
						}
						if (mot.equals("gene")) {
							isGene = true;
						}
						// Retrieving maximum thresholds and theta
						if (approx == true & mot.contains("theta")) {
							lesThetas.put(mot, 0);
						}
						if (mot.equals("thetas")) {
							approx = true;
						}
						if (approx == true & mot.equals("lt")) {
							cpt++;
						}
						if (approx == true & mot.equals(";")) {
							approx = false;
							listThreshold.add(cpt + 1);
							cpt = 0;
						}
						// reading equation
						if (readingEqua == true) {
							equation = equation + mot;
						}
						if (readingEqua == true & mot.equals(";")) {
							readingEqua = false;
							listEqua.add(equation);
							equation = "";
						}
						if (mot.equals("=")) {
							readingEqua = true;
						}
					}
				}
				line = in.readLine();
			}
			in.close();
		}
		// Recuperation des exceptions
		catch (FileNotFoundException e) {
			System.out.println("..." + e);
		} catch (IOException e) {
			System.out.println("..." + e);
		}
		// Creation de la liste des �tats a priori possibles
		possibleStates(stateResources, listThreshold, "");
		// Placer les etats a partir de stateResources
		ArrayList<State> vStates = createStates(stateResources);
		// Passage des String �quations aux Listes equations
		ArrayList<ArrayList<String>> equasListes = new ArrayList<ArrayList<String>>();
		for (int i = 0; i < listEqua.size(); i++) {
			equasListes.add(equaStringToEquaList(listEqua.get(i)));
		}
		// Donner une valeur aux diff�rents th�tas. Pour l'instant on met 0.5
		// partout
		evalTheta(lesThetas);
		// Tant qu'il reste des �tats � traiter on traite la premiere key du
		// treemap
		TreeMap stateResources2 = new TreeMap(stateResources);
		while (stateResources2.isEmpty() == false) {
			ArrayList<String> value = new ArrayList<String>();
			// Pour chaque g�ne de l'�tat on calculate la valeur
			for (int i = 0; i < listGenes.size(); i++) {
				ArrayList<String> equaListTemp = new ArrayList<String>(
						equasListes.get(i));
				// On veut remplacer tous les s{...} de equaListTemp par 0 ou 1
				// : parcours de la liste
				for (int j = 0; j < equaListTemp.size(); j++) {
					// si on tombe sur un s{...}
					if (equaListTemp.get(j).substring(0, 1).equals("s")) {
						String s = returnGene(equaListTemp.get(j)); 
						// trouvage de l'index du gene
						int indexOfGene = -1;
						// trouvage du niveau
						int level = 0;
						for (int k = 0; k < listGenes.size(); k++) {
							if (listGenes.get(k).equals(s)) {
								indexOfGene = k;
							}
						}
						level = Integer.parseInt(stateResources2.firstKey()
								.toString().substring(2 * indexOfGene + 1,
										2 * indexOfGene + 2));
						// on �value le s
						equaListTemp.set(j, ((Integer) evalS(equaListTemp
								.get(j), level, lesThetas)).toString());
					}
					// si le mot est un gene, ce qui correspond au niveau du
					// g�ne, faut l'�valuer
					for (int k = 0; k < listGenes.size(); k++) {
						if (equaListTemp.get(j).equals(listGenes.get(k))) {
							int indexOfGene = -1;
							// trouvage du niveau
							int level = 0;
							indexOfGene = k;
							level = Integer.parseInt(stateResources2
									.firstKey().toString().substring(
											2 * indexOfGene + 1,
											2 * indexOfGene + 2));
							equaListTemp
									.set(j, ((Integer) level).toString());
						}
					}
				}
				value.add(evalEquaList(equaListTemp));
			}
			stateResources.put(stateResources2.firstKey(), value);
			stateResources2.remove(stateResources2.firstKey());
		}

		
		stateResources = evalVecteur(stateResources);

		/*
		 * Allocation des ressources (les valeurs relatives aux etats=key)
		 */		
		// Pour chaque etat
		for (Iterator<String> i = stateResources.keySet().iterator() ; i.hasNext() ; ){
			String state = i.next();				
			// Pour chaque gene
			for (int j = 0; j < ((ArrayList<String>)stateResources.get(state)).size(); j++) {
				int concentrationGene = Integer.parseInt(state.substring(2*j, 2*j+1));
				ArrayList<String> v = (ArrayList<String>)stateResources.get(state);
				int concentrationVoulue = Integer.parseInt(v.get(j));				
				if (concentrationGene != concentrationVoulue) {					
					String labelSearch="";
					if (concentrationGene > concentrationVoulue) {
						// On va vers un etat de moindre concentration
						labelSearch = state.substring(0, 2*j)+(concentrationGene-1)+state.substring(2*j+1, state.length());
					}
					if (concentrationGene < concentrationVoulue) {
						// On va vers un etat avec une plus grande concentration
						labelSearch = state.substring(0, 2*j)+(concentrationGene+1)+state.substring(2*j+1, state.length());
					}			
					int numInitialEnt=0;
					int numFinalEnt=0;
					// trouver l'�tat de depart					
					for (int k = 0; k < vStates.size(); k++) {						
						if (state.equals(vStates.get(k).getEtiquette())) {							
							numInitialEnt = vStates.get(k).getNum();
						}
					}
					// trouver l'�tat d'arriv�					
					for (int k = 0; k < vStates.size(); k++) {						
						if (labelSearch.equals(vStates.get(k).getEtiquette())) {
							numFinalEnt = vStates.get(k).getNum();
						}
					}

					TransState trans = new TransState(numInitialEnt, numFinalEnt, 0, 0, 0, 0, null);
					vTranState.add(trans);
				}				
			}			
		}	
		/*
		 * Ecrire dans le XML
		 */

		PrintWriter file = new PrintWriter(new FileWriter(destination));
		file.println("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
		file.println("<StateGraph>");

		// Noms des g�nes
		file.println("    <genes>");
		for (int i = 0; i < listGenes.size(); i++) {
			file.println("        <gene>");
			file.print("            <number>");
			file.print(i + 1);
			file.println("</number>");
			file.print("            <name>");
			file.print(listGenes.get(i));
			file.println("</name>");
			file.println("        </gene>");
		}
		file.println("    </genes>");
		// les etats
		file.println("    <states>");
		for (int i = 0; i < vStates.size(); i++) {
			State etat = vStates.get(i);
			file.println("        <states>");
			file.print("            <number>");
			file.print(etat.num);
			file.println("</number>");
			file.print("            <name>");
			file.print(etat.label);
                        file.println("</name>");
			file.print("            <x>");
			file.print(etat.x);
			file.println("</x>");
			file.print("            <y>");
			file.print(etat.y);
			file.println("</y>");
			/*
			 * Genotech ncalculatele pas les puits; Il faut donc ici chercher tous
			 * ls �tats n'ayant pas de succeseurs et les indiquer en tant que
			 * puit
			 */
			file.print("            <puit>");
			boolean isPuit = true;
			for (int j = 0; j < vTranState.size(); j++) {
				if (etat.num == vTranState.get(j).getNumInitialState()) {
					isPuit = false;
				}
			}
			if (isPuit) {
				file.print("true");
			} else {
				file.print("false");
			}
			file.println("</puit>");
			file.println("        </state>");
		}
		file.println("    </states>");
		file.println("    <transitions>");
		for (int i = 0; i < vTranState.size(); i++) {
			TransState transEtat = (TransState) vTranState.get(i);
			file.println("        <transition>");
			file.print("            <numInitialEnt>");
			file.print(transEtat.getNumInitialState());
			file.println("</numInitialEnt>");
			file.print("            <numFinalEnt>");
			file.print(transEtat.getNumFinalState());
			file.println("</numFinalEnt>");
			file.println("            <points>");
			file.println("            </points>");
			file.println("        </transition>");
		}
		file.println("    </transitions>");
		file.print("<comment>");
		file.print("        " + comment);
		file.println("</comment>");
		file.println("</StateGraph>");
		file.close();

	}

}
