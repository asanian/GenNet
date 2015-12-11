/*
 * FiltreHyT.java
 * 
 * Version 1.0
 *
 * Created on 27 avril 2004, 12:01
 */


import java.io.File;
import javax.swing.*;
import javax.swing.filechooser.*;

/**
 * Permet de ne visualiser que les documents .hytech dans lefilechooser
 *
 * @version 1.0
 * @author  Olivier Mansion
 */
public class FiltreHyT extends FileFilter {

    //Accept all directories and all xml files.
    public boolean accept(File f) {
        if (f.isDirectory()) {
            return true;
        }

        String extension = Utils.getExtension(f);
        if (extension != null) {
            if (extension.equals(Utils.hy)) {
                    return true;
            } else {
                return false;
            }
        }

        return false;
    }

    //The description of this filter
    public String getDescription() {
        return "hy";
    }
}
