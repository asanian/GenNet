/*
 * ReadXML.java
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
import org.xml.sax.helpers.ParserFactory;

import javax.xml.parsers.SAXParserFactory; 
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;

/**
 *Recovers the address of the XML file containing the characteristics of the controller, and starts the SAX parser that allows to go.
 * @version 3.2
 * @author  Nicolas Peres
 */

public class ReadXML {
    
    
    
    
    static private Writer out;
    /*private*/ Automate auto/* = new Automate()*/;
    GraphicZone gz;
    String args;
    
    /**
     * Launches the application.
     *
     * @version 3.2
     * @author  Nicolas Peres
     *
     * @param args nom du fichier XML cible
     * @param auto objet o� sont enregistr�es les caract�ristiques de l'automate
     */
    public ReadXML(String args, Automate auto, GraphicZone zg) {
        this.auto = auto;
        this.args = args;
        this.gz = zg;
    }
    // it is unnecessary to deal with the case of erroneous address, since this action performed when opening the file.
    
    /**
     * Starts the parser
     *
     * @version 3.2
     * @author  Nicolas Peres
     */
    public void parse() {
        TestXMLHandler handler = new TestXMLHandler(auto, this.gz);
        // Use an instance of ourselves as the SAX event handler
        // Use the default (non-validating) parser
        SAXParserFactory factory = SAXParserFactory.newInstance();
        try {
            // Set up output stream
            out = new OutputStreamWriter(System.out, "UTF8");
            
            // Parse the input 
            SAXParser saxParser = factory.newSAXParser();
            saxParser.parse(new File(args), handler);
        }
        catch (Throwable t) {
            t.printStackTrace();
        }
    }
}
