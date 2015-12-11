/*
 * FiltreXml.java
 * 
 * Version 1.0
 *
 * Created on 27 avril 2004, 12:01
 */


import java.io.File;
import javax.swing.*;
import javax.swing.filechooser.*;

/**
 * Allows you to view only . Xml documents lefilechooser
 *
 * @version 1.0
 * @author  Olivier Mansion
 */
public class FiltreXml extends FileFilter {

    //Accept all directories and all xml files.
    public boolean accept(File f) {
        if (f.isDirectory()) {
            return true;
        }

        String extension = Utils.getExtension(f);
        if (extension != null) {
            if (extension.equals(Utils.xml)) {
                    return true;
            } else {
                return false;
            }
        }

        return false;
    }

    //The description of this filter
    public String getDescription() {
        return "xml";
    }
}
