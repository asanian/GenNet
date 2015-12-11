/*
 * UtiliseGraphviz.java
 * 
 * Version 1.0
 *
 * Cree le 11 decembre 2007
 * par Remy Clement
 */

import java.awt.Color;
import java.io.*;
import java.util.*;

/**
 * Saves data to the controller in a file. Gen
 * which will be used by Graphviz to gnrer files .dot
 * and the dot. serve to display graphs and can be converted into an image
 *
 * @version 1.0
 * @author  Remy Clement
 */
public class FileGen {
    
    
	String destination;
	private Automate auto = new Automate();
	private StateGraphAutomate autoGraphState = new StateGraphAutomate();

	public void writeDotAutomate(String destination, Automate auto) {
		this.destination = destination;
		this.auto = auto;
	}

	public void writeGenStateGraph(String destination, StateGraphAutomate auto) {
		this.destination = destination;
		this.autoGraphState = auto;
	}

	public void treatmentDotAutomate() {
		try {
			PrintWriter file = new PrintWriter(new FileWriter(destination));

			file.println("digraph G {");
			for(int i=0; i<auto.vTrans.size() ; i++) {
				Trans trans = (Trans) auto.vTrans.get(i);  

				for(int j=0; j<auto.vEntity.size() ; j++){
					Entity etape = (Entity) auto.vEntity.get(j);
					if(etape.getNum()==trans.getNumInitialEnt()) {
						file.print(etape.getLabel());
					}
				}                
				file.print("->");     
				for(int j=0; j<auto.vEntity.size() ; j++){
					Entity etape = (Entity) auto.vEntity.get(j);
					if(etape.getNum()==trans.getNumFinalEnt()) {
						file.print(etape.getLabel());
					}
				}                
				file.print(" [label=\"");
				file.print(trans.getThreshold());

				//recuperation du signe
				if(trans.getSign()==1) {
					file.print("+");
				}
				else {
					file.print("-");
				}              
				file.println("\"];");                    
			}          
			file.println("}");
			file.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void treatmentGenStateGraph() {
		try {
			PrintWriter file = new PrintWriter(new FileWriter(destination));
			// We want color wells in red
			ArrayList<String> lesPuits= new ArrayList<String>();    		
			file.println("digraph G {");
			file.println();

			// Prepare a bubble giving all genes
			file.println("/* Order of genes */");
			file.print("/*$g*/"+"\"");    		 
			for(int j=0;j<autoGraphState.vGeneNames.size();j++){    			
				file.print(autoGraphState.vGeneNames.get(j));  
				file.print(" ; "); 
			}    		
			file.println("\""+"/*$fg*/"+" [color=green,fontcolor=black];");
			file.println();

			// List potential and their position statements
			file.println("/* States and their transitions */");			    		 
			for(int j=0;j<autoGraphState.vStates.size();j++){    	
				file.print("/*$e*/"+"\"");
				file.print(autoGraphState.vStates.get(j).getEtiquette()); 
				file.print("\"");
				// x et y
				file.print("/*x:"+autoGraphState.vStates.get(j).getX()+";y:"+autoGraphState.vStates.get(j).getY()+" $fe*/"); 
				file.println(";");
			}    
			file.println();

			// Recherche des transitions

			/*
			 * A faire : les clous !
			 */

			file.println("/* Transitions */");
			for(int i=0; i<autoGraphState.vTranStates.size() ; i++) {
				TransState trans = (TransState) autoGraphState.vTranStates.get(i);

				file.print("/*$t*/"+"\"");
				for(int j=0; j<autoGraphState.vStates.size() ; j++){
					State state = (State) autoGraphState.vStates.get(j);
					if(state.getNum()==trans.getNumInitialState()) {
						/*
						 * L'�tiquette est de la forme "[0, 1, 2]"
						 * On la veut sous la forme "0,1,2" dans le .gen
						 */ 
						String labelGen = state.getEtiquette();
						labelGen = labelGen.replace("[", "");
						labelGen = labelGen.replace("]", "");
						labelGen = labelGen.replace(" ", "");                		
						file.print(labelGen); 
					}
				}   
				file.print("\"");

				file.print("->");   

				file.print("\"");
				for(int j=0; j<autoGraphState.vStates.size() ; j++){
					State state = (State) autoGraphState.vStates.get(j);                	
					if(state.getNum()==trans.getNumFinalState()) {
						/*
						 * The label is of the form "[0, 1, 2]"
						 * We want it in the form "0,1,2" in the .gen
						 */ 
						String labelGen = state.getEtiquette();
						labelGen = labelGen.replace("[", "");
						labelGen = labelGen.replace("]", "");
						labelGen = labelGen.replace(" ", "");                		
						file.print(labelGen);

						if (state.couleurPuit.equals(Color.red)) {
							lesPuits.add("\""+labelGen+"\"");
						}                 		
					}                	
				}
				file.print("\""+"/*$ft*/");                
				file.println(";");
			}
			file.println();

			// Ecrire dans le .gen les puits, et dire qu'il faudra afficher leur police en rouge
			file.println("/* Stable states */");
			while (lesPuits.isEmpty()==false) {
				String lePuit = lesPuits.get(0);
				file.println("/*$p*/"+lePuit+"/*$fp*/"+" [fontcolor=red];");
				while (lesPuits.contains(lePuit)){
					lesPuits.remove(lePuit);
				}    			
			}
			file.println();
			file.println("}");
			file.println("");
			file.println(autoGraphState.comment);
			file.println("");
			// uncomment 
                        file.println("$ed"); 			
			file.println("gene x");
			file.println("equation : 2 + 3 * s(p,y,theta(x,x))  * s(n,x,theta(x,y)) ;");
			file.println("thetas : theta(x,x) < theta(x,y) ;");
			file.println("gene y");
			file.println("equation : 1 + 2 * s(p,y,theta(y,x)) ;");
			file.println("thetas : theta(y,x) ;");
			file.println("$fed"); 
			file.println("");  
                        
			/* Le systeme d'equation ci-dessous sert pour les tests
			 * Il sera a supprimer
			 */
			//fichier.println("$ed"); 			
			//fichier.println("gene x");
			//fichier.println("equation : 2 + 3 * s(p,y,theta(x,x))  * s(n,x,theta(x,y)) ;");
			//fichier.println("thetas : theta(x,x) < theta(x,y) ;");
			//fichier.println("gene y");
			//fichier.println("equation : 1 + 2 * s(p,y,theta(y,x)) ;");
			//fichier.println("thetas : theta(y,x) ;");
			//fichier.println("$fed"); 
			//fichier.println("");  
			 

			file.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}
}