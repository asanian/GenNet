/*
 * Utils.java
 *
 * Version 1.0
 *
 * Created on 27 avril 2004, 13:59
 */


import java.io.File;
import javax.swing.ImageIcon;

/**
 * Recupere l'extension d'un fichier
 *
 * @version 1.0
 * @author  Olivier
 */
public class Utils {
	//public final static String gen = "gen";
	public final static String dot = "dot";
    public final static String xml = "xml";
    public final static String pdf = "pdf";
    public final static String hy = "hy";
    /** Obtenir l'extension d'un fichier
     * @return retourne l'extension du fichier
     * @param f Fichier dont on veut l'extension
     */    
    public static String getExtension(File f) {
        String ext = null;
        String s = f.getName();
        int i = s.lastIndexOf('.');

        if (i > 0 &&  i < s.length() - 1) {
            ext = s.substring(i+1).toLowerCase();
        }
        return ext;
    }
}
