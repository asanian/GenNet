/*
 * EcrireXml.java 
 * Version 1.0 
 * Created on 4 mai 2004, 17:14
 */


import java.awt.Color;
import java.io.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

 
/**
 * Enregistre les donn�es sur l'automate dans le fichier XML
 *
 * @version 1.0
 * @author  Nicolas Peres
 */
public class WriteFile {
    
    
    String destination;
    private Automate auto = new Automate();
    private StateGraphAutomate autoStateGraph = new StateGraphAutomate();
    
    public void writeFile(String destination, Automate auto) {
        this.destination = destination;
        this.auto = auto;
    }
    
    public void writeFile(String destination, StateGraphAutomate autoGE) {
        this.destination = destination;
        this.autoStateGraph = autoGE;
    }
    public void writeParams(){
        try {
            PrintWriter file = new PrintWriter(new FileWriter(destination));
       
   for(int i=0;i<auto.vEntity.size();i++){
       Entity en=(Entity)auto.vEntity.get(i);
       file.println("--------------------------------");
       file.println("  Parameters of :  "+en.label);
       file.println("--------------------------------");
       for(int j=0;j<en.Ks.size();j++){
         file.println( en.Ks.get(j).toString());
       }
   }
            file.close();
        } catch (IOException ex) {
            Logger.getLogger(WriteFile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void clearFile(){
        try {
            PrintWriter file = new PrintWriter(new FileWriter("Deleted.XML"));
           file.write("");
           file.close();
        } catch (IOException ex) {
            Logger.getLogger(WriteFile.class.getName()).log(Level.SEVERE, null, ex);
        }
         
    }
    public void treatment() {
        try {
            PrintWriter file = new PrintWriter(new FileWriter(destination));
            file.println("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
            file.println("<Network>");
            file.println("    <genes>");
            for(int i=0; i<auto.vEntity.size() ; i++) {
                Entity entity = (Entity) auto.vEntity.get(i);
                file.println("        <gene>");
                file.print("            <number>");
                file.print(entity.num);
                file.println("</number>");
                file.print("            <name>");
                file.print(entity.label);
                file.println("</name>");
                file.print("            <x>");
                file.print(entity.x);
                file.println("</x>");
                file.print("            <y>");
                file.print(entity.y);
                file.println("</y>");
                file.print("            <tempsPlus>");
                file.print(entity.tempsP);
                file.println("</tempsPlus>");
                file.print("            <tempsMinus>");
                file.print(entity.tempsM);
                file.println("</tempsMinus>");
                file.print("            <tempsUnknown>");
                if (entity.incP == true) {
                    if (entity.incM == true) {
                        file.print(1);                        
                    } else {
                        file.print(2);                          
                    }
                } else {
                    if (entity.incM == true) {
                        file.print(3);                          
                    } else {
                        file.print(4);                          
                    }    
                }
                file.println("</tempsUnknown>");
                file.println("            <Ks>");
                for(int j = 0; j < entity.Ks.size() ; j++) {
                    K kCt = (K) entity.Ks.get(j);
                    file.println("                <K>");
                    file.print("                    <value>");
                    file.print(kCt.value);
                    file.println("</value>");
                    for(int k = 0; k < kCt.predec.size() ; k++) {
                        Integer I = (Integer) kCt.predec.get(k);
                        file.print("                    <predecessor>");
                        file.print(I.intValue());
                        file.println("</predecessor>");
                    }
                    file.println("                </K>");
                }
                file.println("            </Ks>");
                file.println("        </gene>");
            }
            file.println("    </genes>");
            file.println("    <interactions>");
            for(int i=0; i<auto.vTrans.size() ; i++) {
                Trans trans = (Trans) auto.vTrans.get(i);
                file.println("        <interaction>");
                file.print("            <sign>");
                file.print(trans.getSign());
                file.println("</sign>");
            	file.print("            <threshold>");
                file.print(trans.getThreshold());
                file.println("</threshold>");
                file.print("            <numInitialEnt>");
                file.print(trans.getNumInitialEnt());
                file.println("</numInitialEnt>");
                file.print("            <numFinalEnt>");
                file.print(trans.getNumFinalEnt());
                file.println("</numFinalEnt>");
                if(trans.points.size()>=1){
                file.println("            <points>");
                ////////////////////////////kanwal///////////////////////////
                
                 System.out.println("........ Write XML.............." );
                System.out.println("No of Points: "+ trans.points.size() );
                       
                
                //////////////////////////////////////////////////////////////
                for (int j = 0 ; j < trans.points.size() ; j = j + 1) {
                     System.out.println("X: "+((Point)trans.points.get(j)).x+" Y: "+((Point)trans.points.get(j)).y);
                    Point p = (Point) trans.points.get(j);
                    file.println("                <points>");
                    file.print("                    <x>");
                    file.print(p.x);
                    file.println("</x>");
                    file.print("                    <y>");
                    file.print(p.y);
                    file.println("</y>");
                    file.println("                </points>");
                }
                file.println("            </points>");
                }
                file.println("        </interaction>");
            }
            file.println("    </interactions>");
            file.println("</Network>");
            file.close();
        } catch (Exception e) {
                e.printStackTrace();
        }
    }
    
    public void treatmentStateGraph() {
        try {
            PrintWriter file = new PrintWriter(new FileWriter(destination));            
            file.println("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>");
            file.println("<StateGraph>");               
            file.println("    <genes>");
            for(int i=0; i<autoStateGraph.vGeneNames.size() ; i++) {
                String nomGene = autoStateGraph.vGeneNames.get(i);
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
            file.println("    <states>");
            System.out.println("autoStateGraph.vStates: "+ autoStateGraph.vStates.size());
            for(int i=0; i<autoStateGraph.vStates.size() ; i++) {
                State etat = (State) autoStateGraph.vStates.get(i);
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
                if(etat.couleurPuit==Color.red) {
                	file.print("true");
                }
                else {
                	file.print("false");
                }
                file.println("</puit>");
                file.println("        </state>");
            }           
            file.println("    </states>");              
            file.println("    <transitions>");
            for(int i=0; i<autoStateGraph.vTranStates.size() ; i++) {
            	TransState transEtat = (TransState) autoStateGraph.vTranStates.get(i);
                file.println("        <transition>");                
                file.print("            <numInitialEnt>");
                file.print(transEtat.getNumInitialState());
                file.println("</numInitialEnt>");
                file.print("            <numFinalEnt>");
                file.print(transEtat.getNumFinalState());
                file.println("</numFinalEnt>");
                if(transEtat.points.size()>1){
                file.println("            <points>");
                for (int j = 0 ; j < transEtat.points.size() ; j = j + 1) {
                    Point p = (Point) transEtat.points.get(j);
                    file.println("                <point>");
                    file.print("                    <x>");
                    file.print(p.x);
                    file.println("</x>");
                    file.print("                    <y>");
                    file.print(p.y);
                    file.println("</y>");
                    file.println("                </point>");
                }
                file.println("            </points>");
               }
                file.println("        </transition>");
            }            
            file.println("    </transitions>");
            file.print("<comment>");
            file.print(autoStateGraph.comment);
            file.println("</comment>");
            file.println("</StateGraph>");
            file.close();
        } catch (Exception e) {
                e.printStackTrace();
        }
    }
}