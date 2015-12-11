/*
 * Convert.java
 *
 * Version 1.1
 *
 * Created on 2 mai 2004, 22:12
 */

import java.awt.* ;
import javax.swing.* ;
import java.awt.event.* ;
import java.util.* ;

/**
 * Can convert a string into integer and r�ciproquement.
 * @author  Nicolas Peres
 */
public class Convert {
    
    /** Creates a new instance of Convert */
    public Convert() {
    }
    
    /**
     * To convert a String to Integer
     *
     * @version 1.1
     * @author  Nicolas Peres
     *
     * @param s cha�ne de caract�res � convertir.
     */
    public static int strToInt(String s) {
        Integer ger = new Integer(s);
        int i = ger.intValue();
        return i;
    }
    
    /**
     * Pour convertir un Integer vers String
     *
     * @version 1.1
     * @author  Nicolas Peres
     *
     * @param i entier � convertir.
     */
    public static String intToStr(int i) {
        String texte = new String();
        texte = texte.valueOf(i);
        return texte;
    }
}
