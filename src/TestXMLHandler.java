/*
 * TestXMLHandler.java
 * 
 * Version 3.2
 *
 * Created on 2 mai 2004, 18:14
 */

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
 * du fichier XML : on enregistre ces donn�es dans l'objet Automate.
 *
 * @version 3.2
 * @author  Nicolas Peres
 */
public class TestXMLHandler extends HandlerBase {
    private Automate auto;
    GraphicZone graphicZone;
    
    /**
     * Lance l'application.
     *
     * @version 3.2
     * @author  Nicolas Peres
     *
     * @ 
     */
    public TestXMLHandler(Automate auto, GraphicZone g) {
        this.auto = auto;
        this.graphicZone = graphicZone;
    }
    
    // d�claration de toutes les donn�es que nous allons chercher
    // dans le fichier XML :
    String temp;

    int typeElement;//0->gene, 1->interaction
    
    //Variables Gene
    int number;
    String name;
    Vector Ks;
    int value;
    Vector predec;
    int tempsP;
    int tempsM;
    int inc;
    
    //Variables Interaction
    int sign;
    int threshold;
    int numInitialEnt;
    int numFinalEnt;
    Vector points;
    
    //Variables Partagees
    int x;
    int y;
    
    
    /**
     * Action � r�aliser au d�but de la lecture du document XML.
     *
     * @version 3.2
     * @author  Nicolas Peres
     */
    public void startDocument() {
        //System.out.println("D�but de chargement du document");
    }
    
    /**
     * Action � r�aliser � la fin de la lecture du document XML.
     *
     * @version 3.2
     * @author  Nicolas Peres
     */
    public void endDocument() {
        //System.out.println("Fin de chargement du document");
    }

    /**
     * Actions � r�aliser sur les donn�es
     *
     * @version 3.2
     * @author  Nicolas Peres
     */
    public void characters(char[] character, int beginning, int length) {
            String data = new String(character, beginning, length);
            //System.out.println(" valeur = *" + donnees + "*");
            temp = data;
        }

    /**
     * Actions a r�aliser lors de la detection d'un nouvel element.
     *
     * @version 3.2
     * @author  Nicolas Peres
     */
    public void startElement(String name, org.xml.sax.AttributeList atts) {
        if (name == "gene") {
            typeElement = 0;
            Ks = new Vector();
        } else if (name == "interaction") {
            typeElement = 1;
            points = new Vector();
        } else if (name == "K") {
            predec = new Vector();
        }
    }        
    
    /**
     * Actions � r�aliser lors de la d�tection de la fin d'un element.
     *
     * @version 3.2
     * @author  Nicolas Peres
     */
    public void endElement(String name) {
        //System.out.println("Fin tag " + name);
        if (typeElement == 0) {
            if (name == "number") {
                number = Convert.strToInt(temp);
            } else if (name == "name") {
                this.name = temp;
            } else if (name == "x") {
                x = Convert.strToInt(temp);
            } else if (name == "y") {
                y = Convert.strToInt(temp);
            } else if (name == "gene") {
                Entity etp = new Entity(number, this.name, x, y, this.Ks/*, graphicZone.attribImSelected(), graphicZone.attribImNotSelected()*/);
                auto.addEnity(etp);
                etp.tempsP = tempsP;
                etp.tempsM = tempsM;
                if (inc == 1) {
                    etp.incP = true;
                    etp.incM = true;
                } else if (inc == 2) {
                    etp.incP = true;
                    etp.incM = false;                    
                } else if (inc == 3) {
                    etp.incP = false;
                    etp.incM = true;
                } else if (inc == 4) {
                    etp.incP = false;
                    etp.incM = false;
                }
            } else if (name == "value") {
                value = Convert.strToInt(temp);
            } else if (name == "predecessor") {
                Integer I = new Integer(temp);
                predec.add(I);
            } else if (name == "K") {
                K kCt = new K(this.number, this.value);
                kCt.auto = this.auto;
                kCt.predec = this.predec;
                Ks.add(kCt);
            } else if (name == "tempsPlus") {
                tempsP = Convert.strToInt(temp);
            } else if (name == "tempsMinus") {
                tempsM = Convert.strToInt(temp);
            } else if (name == "tempsunknown") {
                inc = Convert.strToInt(temp);
            }
        } else if (typeElement == 1) {
            if (name == "sign") {
                sign = Convert.strToInt(temp);
            } else if (name == "threshold") {
                threshold = Convert.strToInt(temp);
            } else if (name == "numInitialEnt") {
                numInitialEnt = Convert.strToInt(temp);
            } else if (name == "numFinalEnt") {
                numFinalEnt = Convert.strToInt(temp);
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
            } else if (name == "interaction") {
                int xEtapeIni = 0, yEtapeIni = 0, xEtapeFin = 0, yEtapeFin = 0;
                for (int j = 0 ; j < auto.vEntity.size() ; j = j + 1) {
                  Entity etapeCt= (Entity) auto.vEntity.get(j);
                    if (etapeCt.getNum() == numInitialEnt) {
                        xEtapeIni = etapeCt.getX();
                        yEtapeIni = etapeCt.getY();
                    }
                    if (etapeCt.getNum() == numFinalEnt) {
                        xEtapeFin = etapeCt.getX();
                        yEtapeFin = etapeCt.getY();
                    }
                }     
                ///////////////////////////////////////
//                           System.out.println("..............In TestXMLHandler......................");
//                     for (int i = 0; i < auto.vTrans.size(); i++)  {
//			Trans transCt = (Trans) auto.vTrans.get(i);
//                        
//                        System.out.println("No of Points: "+ transCt.points.size() );
//                        System.out.println("X: "+((Point)transCt.points.get(0)).x+" Y: "+((Point)transCt.points.get(0)).y);
//                         System.out.println("X: "+((Point)transCt.points.get(1)).x+" Y: "+((Point)transCt.points.get(1)).y);
//		
//		}
                //////////////////////////////////////////
                  
                Trans trans = new Trans(sign, threshold, numInitialEnt, numFinalEnt, xEtapeIni, yEtapeIni, xEtapeFin, yEtapeFin, points);
                auto.addTrans(trans);
     
     
                
                
                
            }                
        }
    }
    
}