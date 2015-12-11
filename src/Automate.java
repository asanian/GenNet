/*
 * Automate.java
 *
 * Version 1.0
 *
 * Created on 28 avril 2004, 18:11
 */


import java.util.* ;
import java.awt.* ;
import javax.swing.* ;
import java.awt.event.* ;
import java.awt.RenderingHints.*;

/**
 * Contains all the Entities and all transitions
 *
 * @version 1.0
 * @author  Olivier Mansion
 */
public class Automate {
    
    /**
     * entities Vector
     */    
    public Vector vEntity;
    /**
     * Predecessorransitions Vector
     */    
    public Vector vTrans;
    
    // see if the controller t changed since the last backup
    // modif  = false if it was not modified t, true otherwise
    boolean modif;
    
    final static int nbrCharEntityLabel = 10;
    final static int nbrCharTransLabel = 4;
 
    /** Creates a new instance of Automate */
    public Automate() {
        vEntity = new Vector();
        vTrans = new Vector();
        modif = false;
    }
    public Automate(Automate a){
       vEntity = new Vector();
        vTrans = new Vector();
       for(int i=0;i<a.vEntity.size();i++){
           Entity en=(Entity)a.vEntity.get(i);
           Entity en2=new Entity(en.num,en.label,en.x,en.y,en.Ks);
          this.vEntity.add(en2);
       }
       for(int i=0;i<a.vTrans.size();i++){
           Trans tr=(Trans)a.vTrans.get(i);
           Trans tr2=new Trans(tr.getSign(),tr.getThreshold(),tr.getNumInitialEnt(),tr.getNumFinalEnt(),tr.initailEntX,tr.initailEntY,tr.finalEntX,tr.finalEntY,tr.points);
          this.vTrans.add(tr2);
       }
       this.setPredecessor();
       this.setParameters();
     this.toString();
    }
    
    /**
     * Add an entity in the Entity Vector
     * @param entity etape � ajouter
     */
    public void addEnity(Entity entity) {
        vEntity.add(entity);  
    }
    
    /**
     * Remove All Enitities
     */
    public void deleteEntity() {
        vEntity.removeAllElements();
    }
    
    /**
     * returns true if the entity bearing the numEntity number is in the vector
     * @param entityNo num�ro de l'�tape � tester
     * @return renvoie vrai si l'�tape est pr�sente
     */
    public boolean entityPresent(int entityNo) {
 
        boolean res = false;
        for (int i = 0; i < vEntity.size(); i ++) {
            Entity etapeCt = (Entity) vEntity.get(i);
            if (entityNo == etapeCt.getNum()) {
                res = true;
            }
        }
        return res;
    }
        
    /**
     * Adds a transition in the transition vector
     * @param trans transition � rajouter
     */
    public void addTrans(Trans trans) {
        vTrans.add(trans);  
    }
    
    /**
     * Removes all transitions
     */
    public void deleteTrans() {
        vTrans.removeAllElements();
    }
    
    /**
     * provides the state of the boolean change
     * @return retourne l'�tat de modif
     */    
    public boolean getModif() {
        return modif;
    }
    
    /**
     * can change the state of Modified
     * @param b nouvelle valeur de modif
     */    
    public void modif(boolean b) {
        this.modif = b;
    }
    
    /**
     * allows the controller to draw the graphics area
     * @param g Graphics de la zone graphique
     * @param c couleur dont doit etre dessin� l'automate
     */    
    public void drawGraphics(Graphics g, Color c) {
        //g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
  
        for (int j = 0; j < vTrans.size(); j++) {
            Trans transCt = (Trans) vTrans.get(j);
            transCt.drawGraph(g, c);
        }
        for (int i = 0; i < vEntity.size(); i++) {
            Entity etapeCt = (Entity) vEntity.get(i);
            etapeCt.drawGraphics(g, c);
        }
    }
    
    /**
     * Assign a No to entity
     * @param renvoie un numero d'etape libre
     */
    public int assignNo() { // to assign a no to gene
     
        int num = 1;
        boolean isPresent = false;
        while (isPresent == false) {
            for (int i = 0; i < vEntity.size(); i++) {
                Entity entityCt = (Entity) vEntity.get(i);
                if (entityCt.num == num) {
                    isPresent = true;
                }
            }
            if (isPresent == true) {
                isPresent = false;
                num = num + 1;
            } else {
                isPresent = true;
            }
        }
        return num;
    }
    // By Kanwal Naz
    public int getEntityIndex(int num){
        for(int i=0;i<vEntity.size();i++){
          Entity e=(Entity)vEntity.get(i);
            if(e.getNum()==num){
                return i;
            }
             
        }
        System.out.println("Entity selected: -1");
        return -1;
    }
    //Kanwal Naz
    public int getEntityIndex(String name){
    
        for(int i=0;i<vEntity.size();i++){
            Entity en=(Entity)vEntity.get(i);
            if(en.label==name)
                return en.num-1;
        }
        return -1;
    }
    // By Kanwal Naz
    public int getTransIndex(int num){
        Trans trans=(Trans)vTrans.get(0);
        for(int i=0;i<vTrans.size();i++){
            trans=(Trans)vTrans.get(i);
            if(trans.getNumFinalEnt()==num || trans.getNumInitialEnt()==num)
                return i;
             
        }
        return -1;
        
    }
    public void removeTransOfEntity(int num){
        int i=vTrans.size()-1;
        while(vTrans.size()>=0 && i>=0){
          Trans  trans=(Trans)vTrans.get(i);
            if(trans.getNumFinalEnt()==num || trans.getNumInitialEnt()==num)
               removeTransAt(i);
            i--;
        }
    }
    public void removeEntity(int num){ 
          removeTransOfEntity(num);
          removeEntityFromPredList(num);
          removeEntityAt(num);
          this.setPredecessor();
          this.setParameters();
          this.toString();
    }
    public void removeEntityAt(int num){
        int entityIndex=getEntityIndex(num);
        vEntity.removeElementAt(entityIndex);
    }
      public void removeTransAt(int transIndex){
        vTrans.removeElementAt(transIndex);
    }
    public void removeEntityFromPredList(int num){
        for(int i=0;i<vEntity.size();i++){
             Entity ent = (Entity)vEntity.get(i);
             for(int j=0;j<ent.listPredec.size();j++){
             if(ent.listPredec.get(j)==num)
                 ent.listPredec.remove(j);
                 }
        }
        
    }
    
    public void removePredec(int num){
       
     	for (int i = 0; i < vEntity.size(); i = i + 1) {
            Entity etapeCt = (Entity)vEntity.get(i);
		for(int j = 0; j < etapeCt.Ks.size() ; j++) {
			K kCt = (K) etapeCt.Ks.get(j);
			boolean trouve = false;
				for(int k = 0; k < kCt.predec.size() ; k++) {
					Integer I = (Integer) kCt.predec.get(k);
					int val = I.intValue();
					if (val == num) 
					trouve = true;
					}
					if (trouve == true) {
					etapeCt.Ks.removeElementAt(j);
					j--;
							}
						}
					}
    }

    public void resetEntityNo(int num){
        
    for (int i = 0; i < vEntity.size(); i = i + 1) {
        Entity etapeCt = (Entity) vEntity.get(i);
        if (etapeCt.getNum() > num) {
                etapeCt.num = etapeCt.num - 1;
        }
        for(int j = 0; j < etapeCt.Ks.size() ; j++) {
                K kCt = (K) etapeCt.Ks.get(j);
                if (kCt.gene > num) {
                        kCt.gene = kCt.gene - 1;
                }
                for(int k = 0; k < kCt.predec.size() ; k++) {
                        Integer I = (Integer) kCt.predec.get(k);
                        int val = I.intValue();
                        if (val > num) {
                                kCt.predec.removeElementAt(k);
                                I = new Integer(val - 1);
                                kCt.predec.insertElementAt(I, k);
                        }
                     }
             }
        }
    }
   
    public void resetTrans(int num){
    for (int j = 0; j < vTrans.size(); j = j + 1) {
        Trans transCt = (Trans) vTrans.get(j);
        if (transCt.getNumFinalEnt()> num) {
                transCt.setNumFinalEnt(transCt.getNumFinalEnt() - 1);
        }
        if (transCt.getNumInitialEnt()> num) {
                transCt.setNumInitialEnt(transCt.getNumInitialEnt()- 1);
        } 
      }    
        
    }
    public Entity getEntity(int num){
        for(int i=0;i<vEntity.size();i++)
        {
           if(((Entity)vEntity.get(i)).num==num)
            return ((Entity)vEntity.get(i));
        }
        return null;
    }
    public void deleteAutomata(){
        this.deleteEntity();
        this.deleteTrans();
        
    }
    public int getTrans(Entity e1, Entity e2){
     
        for(int i=0;i<vTrans.size();i++){
          Trans trans=(Trans)vTrans.get(i);
            if(trans.getNumFinalEnt()==e2.num || trans.getNumInitialEnt()==e1.num)
               return i;
             
        }
        return -1;
    }
    //Kanwal Naz
      public void setPredecList(int num){
         int index=getEntityIndex(num);
         if(index>=0){
          Entity ent=(Entity)vEntity.get(index);
          ent.listPredec.removeAllElements();
          ent.Ks.removeAllElements();
          for(int i=0;i<vTrans.size();i++){
              Trans tr=(Trans)vTrans.get(i);
              if(tr.finalEntX==ent.x && tr.finalEntY==ent.y){
                  Entity entity=getEntity(tr.getNumInitialEnt());
                 
                 ent.listPredec.add(entity.num);
              }
          }
      }
      }
      // Kanwal Naz
      public void setPredecessor(){
          for(int i=0;i<vEntity.size();i++){
              setPredecList(i);
          }
      }
      
   // Kanwal Naz
     public void setParameters(){
       setPredecessor();
       for(int in=0;in<vEntity.size();in++){
         Entity en=(Entity)vEntity.get(in);
         if(en!=null)
        setParameters(en);
                             }
    }
      public void setParameters(Entity en){
       setPredecList(en.num);
         Vector<Integer> p=en.listPredec;
         Vector<Vector<Integer>> ps = powerset(p);
        findValue(en);
             for(int i=0;i<ps.size();i++){
                  K kPara=new K(en.num,1, ps.get(i),this);
                 if(i==0){
                      kPara=new K(en.num,0, ps.get(i),this); 
                     }
                 if(en.minVal== 1 && i>0){
                    kPara=new K(en.num,en.maxLevel, ps.get(i),this); 
                 }
                 if(en.minVal==0 && i<ps.size()-1){
                     kPara=new K(en.num,0, ps.get(i),this); 
                 }
                 if(en.minVal==0 && i==ps.size()-1){
                     kPara=new K(en.num,en.maxLevel, ps.get(i),this);
                 }
                    System.out.println(kPara.toString());
                     en.Ks.add(kPara);
                            }
                             
    }
    //Kanwal Naz
    public void findValue(Entity e){
        for(int i=0;i<vTrans.size();i++){
            Trans tr=(Trans)vTrans.get(i);
         if(tr.initailEntX==e.getX() && tr.initailEntY==e.y){
            int newVal= tr.getThreshold();
            if(e.maxLevel<newVal)
                e.maxLevel=newVal;
         }
        }
        for(int i=0;i<vTrans.size();i++){
            Trans tr=(Trans)vTrans.get(i);
         if(tr.finalEntX==e.getX() && tr.finalEntY==e.y){
            int newVal= tr.getThreshold();
            if(tr.getSign()==0)
                newVal=newVal*(-1);
            if(newVal>e.minVal){
                 e.minVal=1;
                break;
            }
            if(tr.getSign()==0){
                e.minVal=0;
            }
         }
        }
       
    }

    // Kanwal Naz
public  <Integer> Vector<Vector<Integer>> powerset(Collection<Integer> Vector) {
  Vector<Vector<Integer>> ps = new Vector<Vector<Integer>>();
  ps.add(new Vector<Integer>());   // add the empty set
 
  // for every item in the original list
  for (Integer item : Vector) {
    Vector<Vector<Integer>> newPs = new Vector<Vector<Integer>>();
 
    for (Vector<Integer> subset : ps) {
      // copy all of the current powerset's subsets
      newPs.add(subset);
 
      // plus the subsets appended with the current item
      Vector<Integer> newSubset = new Vector<Integer>(subset);
      newSubset.add(item);
      newPs.add(newSubset);
    }
 
    // powerset is now powerset of list.subList(0, list.indexOf(item)+1)
    ps = newPs;
  }
  return ps;
}
public String KSToString(){
    
   String s="";
   for(int i=0;i<vEntity.size();i++){
       Entity en=(Entity)vEntity.get(i);
       s=s+"--------------------------------\n";
       s=s+"   Parameters of  :"+en.label+"\n";
       s=s+"--------------------------------\n";
       for(int j=0;j<en.Ks.size();j++){
           s=s+en.Ks.get(j).toString()+"\n";
       }
   }
   System.out.println(s);
   return s;
}

}
