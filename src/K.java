/*
 * K.java
 *
 * Created on 26 octobre 2004, 20:40
 */

import java.util.* ;

/**
 *
 * @author  Olivier Mansion
 */
public class K {
    int value;
   
    int gene;
    public Vector<Integer> predec;  //Integer vector corresponding to the numbers of predecessors
    //public Vector<Predecessor> pred;
    String descriptif;
    String descriptifPlusValue;
    Automate auto;

    /** Creates a new instance of K */
    public K(int gene, int value, Automate auto) {
        this.gene = gene;
        this.value = value;
        this.auto = auto;
        predec = new Vector();
        descriptif = "";
      
    }
    public K(int gene,int val, Vector<Integer> pre,Automate auto){
        this.gene = gene;
         this.auto = auto;
        predec=pre;
          if(predec.size()==0)
            value=0;
          else
        value=val;
       
    }
    public K(int gene, int value) {
        this.gene = gene;
        this.value = value;
        descriptif = "";
    }
    
    public int getValue() {
        return this.value;
    }
    
    public void add(int i) {
        Integer I = new Integer(i);
        predec.add(I);
    }
    
    public void delete(int i) {
        for (int j = 0; j < predec.size(); j = j + 1) {
            Integer I = (Integer) predec.get(j);
            if (i == I.intValue()) {
                predec.removeElementAt(j);
            }
        }
    }
    
    public String toString() {
         descriptifPlusValue ="";
        String result = "K ( ";
        for (int j = 0; j < auto.vEntity.size(); j = j + 1) {
            Entity etapeCt = (Entity) auto.vEntity.get(j);
            if (etapeCt.getNum() == gene) {
                result = result + etapeCt.label + " , { ";
            }
        }
        int count = predec.size();
        for (int j = 0; j < auto.vEntity.size(); j = j + 1) {
            Entity etapeCt = (Entity) auto.vEntity.get(j);
            for (int k = 0; k < predec.size(); k = k + 1) {
                Integer I = (Integer) predec.get(k);
                if (etapeCt.getNum() == I.intValue()) {
                    result = result + etapeCt.label;
                    if (count > 1) {
                        result = result + " , ";
                    }
                    count = count - 1;
                }
            }
        }
        result = result + " } ) = ";
        descriptif = result;
        result = result + Integer.toString(value);
        descriptifPlusValue = result;
        return result;
    }
   
}
