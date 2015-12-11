/*
 * Intro.java
 *
 * Version 1.0
 * 
 * Created on 1 mai 2004, 15:17
 */


import java.awt.* ;
import javax.swing.* ;
import java.awt.event.* ;
import java.util.* ;
import javax.swing.Timer;

/**
 * JWindow contenant le JPanel APropos
 * @author Olivier Mansion
 */
public class Intro extends JDialog {
    
    GraphicZone graphicone;
    MainFrame mf;
    StateBar bar;
    Image im;
    Timer time;
    int delay = 4000; //milisecond

    
    /**
     * Cr�e une nouvelle instance de APropos1
     * @param mf Fenetre principale de l'application : permet de centrer la JWindow
     * @param zg Zone graphique
     * @param bar Barre d'�tat
     */
    public Intro(MainFrame mf, GraphicZone zg, StateBar bar) {
        
        super(JOptionPane.getFrameForComponent(mf), "SplashScreen", true);
        
        im = zg.toBufferedImage(getToolkit().getImage(getClass().getResource("images/intro.jpg")));
       
        this.mf = mf;
        this.graphicone = zg;
        this.bar = bar;
        
        this.setSize(600, 450);
        
        setBackground(Color.white);
        
        bar.displayDefo();
        
        setResizable(false); 
        
        setLocationRelativeTo(mf);
       
        time = new Timer(delay, new Fermeur(this));
        time.start();
        
        setVisible(true);


    }
    
    /**
     * permet de peindre le composant avec le graphics g
     * @param g graphics avec lequel la fenetre est peinte
     */    
    public void paint(Graphics g){
        super.paint(g);
        g.drawImage(im, 0, 0, this);
    } 
}

class Fermeur implements ActionListener {

    JDialog jd;

    public Fermeur(JDialog jd) {
        this.jd = jd;
    }

    public void actionPerformed(ActionEvent e) {
        jd.dispose();
    }

}