/*
 * FiltreExa.java
 * 
 * Version 1.0
 *
 * Created on 12 decembre 2007 11:30
 */


import java.io.File;
import javax.swing.*;
import javax.swing.filechooser.*;

/**
 * Permet de ne visualiser que les documents .gen dans lefilechooser
 *
 * @version 1.0
 * @author  Remy Clement
 */
public class FiltreGen extends FileFilter {

    //Accept all directories and all xml files.
    public boolean accept(File f) {
        if (f.isDirectory()) {
            return true;
        }

        String extension = Utils.getExtension(f);
        if (extension != null) {
            if (extension.equals(Utils.dot)) {
                    return true;
            } else {
                return false;
            }
        }

        return false;
    }

    //The description of this filter
    public String getDescription() {
        return "dot";
    }
}

