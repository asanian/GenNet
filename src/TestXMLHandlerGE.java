import java.io.*;
import java.awt.* ;
import javax.swing.* ;
import java.util.* ;

import org.xml.sax.*;
import org.xml.sax.helpers.DefaultHandler;

import javax.xml.parsers.SAXParserFactory; 
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser; 


/**
 * Classe utilis�e pour g�rer les evenement emis par SAX lors du traitement
 * du fichier XML : on enregistre ces donn�es dans l'automate de graphe d'�tats.
 */
public class TestXMLHandlerGE extends HandlerBase {
	private StateGraphAutomate auto;
	StateGraphGraphics stateGraphGraphics;
	/**
	 * Lance l'application.
	 * @param auto objet dans lequel les caract�ristiques de l'automate GE
	 * vont �tre enregistr�es.
	 */
	public TestXMLHandlerGE(StateGraphAutomate auto, StateGraphGraphics zg) {
		this.auto = auto;
		this.stateGraphGraphics = zg;
	}
	// d�claration de toutes les donn�es que nous allons chercher
	// dans le fichier XML :
	String temp;
	int typeElement;//0->gene, 1->State, 2->transition, 3-> commentaire
	
	//Variables State : number, name, x, y
	int x;
	int y;   
	boolean puit;

	//Variables transition
	int numInitialEnt;
	int numFinalEnt;
	int xInitialState=0;
	int yInitialState=0;
	int xFinalState=0;
	int yFinalState=0;
	Vector points;
	//Vector points = new Vector();

	//Variable partagees
	int number;
	String name;


	/*    
	 */
	public void startDocument() {
		//System.out.println("D�but de chargement du document");
	}


	public void endDocument() {
          System.out.println("Auto v States Size: "+ auto.vStates.size()); 
           System.out.println("Auto v Trans States Size: "+ auto.vTranStates.size()); 
	//System.out.println("Fin de chargement du document");
	}


	public void characters(char[] character, int beginning, int length) {
		String data = new String(character, beginning, length);
		temp = data;
	}

	/**
	 * Actions a r�aliser lors de la detection d'un nouvel element.
	 */
	public void startElement(String name, org.xml.sax.AttributeList atts) {
		if (name == "gene") {
			typeElement = 0;            
		}  else if (name == "state") {
			typeElement = 1;
		}  else if (name == "transition") {
			typeElement = 2;    			
			points = new Vector();
		}  else if (name == "comment") {
			typeElement = 3;
		}   
	}        

	/**
	 * Actions � r�aliser lors de la d�tection de la fin d'un element.
	 *
	 * @version 3.2
	 * @author  Nicolas Peres
	 */
	public void endElement(String name) {			
		if (typeElement == 0) {
			if (name == "name") {
				auto.vGeneNames.add(temp); 
			}      
		}
		if (typeElement == 1) {
			if (name == "number") {
				number = Convert.strToInt(temp);                
			} else if (name == "name") {
				this.name = temp;
			} else if (name == "x") {
				x = Convert.strToInt(temp);
			} else if (name == "y") {
				y = Convert.strToInt(temp);
			} else if (name == "puit") {            	
				if (temp.equals("true")) {
					puit=true;
				} else {
					puit=false;
				}      	       
			} else if (name == "state") {
				State et = new State(this.name, x, y,number,puit);
				auto.addState(et); 
                                //  System.out.println("Auto v States Size after Adding: "+ auto.vStates.size()); 
			}         
		}
		else if (typeElement == 2) {
			if (name == "numInitialEnt") {
				numInitialEnt = Convert.strToInt(temp);  
                              //  System.out.println("Initial Entity Read "+numInitialEnt);
			} else if (name == "numFinalEnt") {
				numFinalEnt = Convert.strToInt(temp); 	
                              //   System.out.println("Final Entity Read "+numFinalEnt);
			} else if (name == "x") {
				x = Convert.strToInt(temp);	                
			} else if (name == "y") {
				y = Convert.strToInt(temp);
			} else if (name == "points") {				
				Point p = new Point(x, y);	                
				 boolean b=true;
                  for(int i=0;i<points.size();i++){
                       Point p1=(Point)points.get(i);
                        if(p1.x==p.x && p1.y==p.y)
                            b=false;
                    }
                if(b==true)
                points.add(p);
			} else if (name == "transition") {
				for (int j = 0 ; j < auto.vStates.size() ; j = j + 1) {
					State etatCt = (State) auto.vStates.get(j);
                                        
					if (etatCt.getNum() == numInitialEnt) {
						xInitialState = etatCt.getX();
						yInitialState = etatCt.getY();
					}
					if (etatCt.getNum() == numFinalEnt) {
						xFinalState = etatCt.getX();
						yFinalState = etatCt.getY();
					} 
				}				
				TransState transState = new TransState(numInitialEnt, numFinalEnt, xInitialState, yInitialState, xFinalState, yFinalState, points);
				//System.out.println("Auto v trans Size after Adding: " + auto.vTranStates.size());
                                if( auto.vTranStates.size()!=0){
                               // System.out.println("vTrans Initail Point: "+auto.vTranStates.get(auto.vTranStates.size()-1).getNumInitialState());
                               //     System.out.println("vTrans Final Point: "+auto.vTranStates.get(auto.vTranStates.size()-1).getNumFinalState());
                                }
                                auto.addTranState(transState);
			}    
                        
		} 
		else if (typeElement == 3) {
			if (name == "comment") {
				auto.setComment(temp);
			}      			
		}
	}
}
