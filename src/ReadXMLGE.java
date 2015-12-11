/*
 * LireXML.java
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
 * R�cup�re l'adresse  du fichier XML contenant les caract�ristiques
 * de l'automate, et lance le parser SAX qui permet de le parcourir.
 *
 * @version 1.0
 */

public class ReadXMLGE {
    
    
    
    
    static private Writer out;
    StateGraphAutomate auto;
    StateGraphGraphics stateGraphGraphics;
    String args;
    
    /**
     * Lance l'application.     *
     * @param args nom du fichier XML cible
     * @param auto objet o� sont enregistr�es les caract�ristiques de l'automate
     */
    public ReadXMLGE(String args, StateGraphAutomate auto, StateGraphGraphics zg) {
        this.auto = auto;
        this.args = args;
        this.stateGraphGraphics = zg;
    }
    // il est inutile de traiter le cas d'une adresse erron�e, puisque
    // ceci a d�j� �t� effectu� lors de l'ouverture du fichier.
    
    /**
     * Lance le parser
     */
    public void parse() {
    	TestXMLHandlerGE handler = new TestXMLHandlerGE(auto, this.stateGraphGraphics);
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
