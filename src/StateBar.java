/*
 * StateBar.java
 * 
 * Version 1.0
 *
 * Created on 27 avril 2004, 12:01
 */


import java.awt.* ;
import javax.swing.* ;
import java.awt.event.* ;
import java.util.* ;

/**
 * Barre d'etat de l'application
 *
 * @version 1.0
 * @author  Olivier Mansion
 */	
class StateBar extends JPanel {

    private JLabel coord, info ;

    boolean can;
    
    /**
     * Cr�e une nouvelle instance de BarreEtat
     */
    public StateBar() {

        this.setBackground(Color.lightGray) ;

        // definition d'une mise en page 1 ligne 2 colonnes
        this.setLayout(new GridLayout(1, 2)) ;

        // ajout des composants dans les cellules du "layout"
        this.add(info = new JLabel()) ;
        this.add(coord = new JLabel()) ;


        // message d'invitation
        this.displayInfo (" Genotech") ;

        can = true;
    }
    
    /**
     *Permet d'afficher les coordonn�es de la souris dans la barre d'�tat
     *@param x coordonn�e en x de la souris
     *@param y coordonn�e en y de la souris
     */
    public void displayCoor(int x, int y) {
            coord.setText("mouse coordinates / x : " + x + " y : " + y) ;
    }
    
    /**
     *permet d'afficher des informations dans la barre d'�tat
     *@param message message � afficher dans la barre d'�tat
     */
    public void displayInfo(String message) {
            info.setText(" " + message);
    }
    
    /**
     *resets the display in the status bar
     */
    public void displayDefo() {
            info.setText("Genotech");
    }
}
