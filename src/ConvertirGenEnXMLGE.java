import java.awt.Color;
import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.TreeMap;

import javax.swing.JFileChooser;


public class ConvertirGenEnXMLGE {

	public static void convertGenToXml() throws IOException {

		/**
		 * The target is .gen convert to XML
		 */
		String target="";
		/**
		 * The destination is the place where you will store the XML
		 */
		String destination="genToXMLGE.xml";
		/**
		 * The name of the xml file
		 */
		String name="";
		/**
		 * The names of genes
		 */
		ArrayList<String> genesName = new ArrayList<String>();
		/**
		 * The list of States
		 */
		ArrayList<State> vStates = new ArrayList<State>();
		/**
		 * The list of puits: if a state is in, it is a puits
		 */
		ArrayList<String> vPuits = new ArrayList<String>();	
		/**
		 * The list of transition: a list of initial state, a list in parallel
		 * final states, has the index i vTransEtatI is an initial state,
		 * has the index i VTrans State is target
		 */
		ArrayList<Integer> vTranStateI = new ArrayList<Integer>();	
		ArrayList<Integer> vTranStateF = new ArrayList<Integer>();	

		/**
		 * Counts the number of states and store settings
		 */
		int cptEtat=0;
		String label="";
		int x=0;
		int y=0;
		boolean isComment=false;
		String comment="/* Comment */"+"\n"+"        ";
		
		/*
		 * Select the file. Gen convert to xml		 * 
		 * to do: the file chooser should display: "load" and not "save"
		 */				
		JFileChooser fileChooser = new JFileChooser();	
		fileChooser.addChoosableFileFilter(new FiltreGen());
		fileChooser.setDialogTitle("Loading DOT");

		int returnVal = fileChooser.showOpenDialog(fileChooser);
		if (returnVal == JFileChooser.APPROVE_OPTION) {			
			File file = fileChooser.getSelectedFile();			
			target = file.getAbsolutePath();
			Utils extension = new Utils();
			if (extension.getExtension(file) == null) {
				target = target + ".dot";
			}
		} 

		/*
		 * save the xml file
		 * to do: change the default name which for the moment is not .gen .hy
		 */			
		JFileChooser fileChooser2 = new JFileChooser();
		fileChooser2.addChoosableFileFilter(new FiltreXml());
		fileChooser2.setDialogTitle("Save in XML format ");
		int returnVal2 = fileChooser2.showSaveDialog(fileChooser2);
		if (returnVal2 == JFileChooser.APPROVE_OPTION) {
			File file = fileChooser2.getSelectedFile();			
			destination = file.getAbsolutePath();
			name=file.getName();
			Utils extension = new Utils();
			if (extension.getExtension(file) == null) {
				destination = destination + ".xml";
			}
		} 					

		/*
		 * Lire le .gen et recuperer les informations utiles
		 */		
		String delimiters = " . ' ; : - = ? ! [ ] { } / * \"";		
		try
		{	
			BufferedReader in = new BufferedReader(new FileReader(target));
			boolean estGene=false;	
			boolean estEtat=false;
			boolean estPuit=false;
			boolean estTransEtatI=false;
			boolean estTransEtatF=false;

			String line = in.readLine();
			while (line != null) {
				StringTokenizer st = new StringTokenizer(line, delimiters);			
				while (st.hasMoreTokens()) {
					String mot = st.nextToken();					
					
					if(mot.equals("$fg")) {						
						estGene=false;
					}
					if(estGene==true) {
						genesName.add(mot);
					}
					if(mot.equals("$g")) {						
						estGene=true;
					}
					// Recuperations des etats					
					if(mot.equals("$fe")) {	
						State etat = new State(label,x,y,cptEtat,false);
						vStates.add(etat);
						estEtat=false;						
						cptEtat++;
					}
					if(estEtat==true) {
						if (mot.equals("x")) {
							x=Integer.parseInt(st.nextToken());
						}
						if (mot.equals("y")) {
							y=Integer.parseInt(st.nextToken());
						}						
					}
					if(mot.equals("$e")) {						
						estEtat=true;
						label=st.nextToken();
					}
					// Recuperation des transitions
					if(mot.equals("$ft")) {						
						estTransEtatF=false;
					}
					if(estTransEtatF==true&&mot.equals(">")==false) {
						int index=0;						
						for (int i = 0; i < vStates.size(); i++) {
							if (vStates.get(i).getEtiquette().equals(mot)) {
								index=i;
							}
						}
						vTranStateF.add(index);
						estTransEtatF=false;
					}
					if(estTransEtatI==true) {
						int index=0;
						for (int i = 0; i < vStates.size(); i++) {
							if (vStates.get(i).getEtiquette().equals(mot)) {
								index=i;
							}
						}
						vTranStateI.add(index);
						estTransEtatI=false;
						estTransEtatF=true;
					}	
					if(mot.equals("$t")) {						
						estTransEtatI=true;						
					}
					//Recuperation des puits dans vPuits
					if(mot.equals("$fp")) {						
						estPuit=false;
					}
					if(estPuit==true) {
						vPuits.add(mot);
					}
					if(mot.equals("$p")) {						
						estPuit=true;
					}
					/*
					 * Recuperation du commentaire apres la } qui ferme le
					 * digraph
					 */ 
//					Recuperation des puits dans vPuits
					if (isComment==true) {
						// Faire attention aux caracteres speciaux dans le XML 
						if (mot.equals("<")) {
							mot="&lt;";
						}
						comment=comment+" "+mot;
					}
					/*
					 * Recuperation du commentaire
					 */
					if(mot.equals("Comment")) {	
						isComment=true;
						delimiters=" ";
					}										
				}
				line = in.readLine();
			}	
			in.close();
		}

		// Recuperation des exceptions				
		catch (FileNotFoundException e)
		{
			System.out.println("..."+e);
		}		
		catch (IOException e)
		{
			System.out.println("..."+e);
		}

		/*
		 * Ecrire dans le XML
		 */		
		PrintWriter file = new PrintWriter(new FileWriter(destination));		
		file.println("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
		file.println("<StateGraph>");  
		// Noms des g�nes
		file.println("    <genes>");
		for(int i=0; i<genesName.size() ; i++) {
			String nomGene = genesName.get(i);
			file.println("        <gene>");
			file.print("            <number>");
			file.print(i+1);
			file.println("</number>");
			file.print("            <name>");
			file.print(nomGene);
			file.println("</name>");
			file.println("        </gene>");                             
		}
		file.println("    </genes>");  
		// states
		file.println("    <states>");
		for(int i=0; i<vStates.size() ; i++) {
			State etat = vStates.get(i);
			file.println("        <state>");
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
			file.print("            <puit>");
			boolean isPuit=false;
			for (int j = 0; j < vPuits.size(); j++) {
				if (vPuits.get(j).equals(etat.getEtiquette())) {
					isPuit=true;
				}				
			}
			if(isPuit) {
				file.print("true");
			} else {
				file.print("false");
			}
			file.println("</puit>");
			file.println("        </state>");
		}           
		file.println("    </states>");   
		// Les transitions
		file.println("    <transitions>");
		for(int i=0; i<vTranStateI.size() ; i++) {        	
			file.println("        <transition>");                
			file.print("            <numEtIni>");
			file.print(vTranStateI.get(i));
			file.println("</numEtIni>");
			file.print("            <numEtFin>");
			file.print(vTranStateF.get(i));
			file.println("</numEtFin>");
			file.println("            <points>");
			
			/*
			 * A faire ulterieurement 
			 */
			
			/*            for (int j = 0 ; j < transEtat.clou.size() ; j = j + 1) {
                Point p = (Point) transEtat.clou.get(j);
                fichier.println("                <clou>");
                fichier.print("                    <x>");
                fichier.print(p.x);
                fichier.println("</x>");
                fichier.print("                    <y>");
                fichier.print(p.y);
                fichier.println("</y>");
                fichier.println("                </clou>");
            }*/
			file.println("            </points>");
			file.println("        </transition>");
		}            
		file.println("    </transitions>");
		   file.println("<comment>");
           file.println("        "+comment);
           file.println("</comment>");

		file.println("</StateGraph>");
		file.close();		
	}
	
}
