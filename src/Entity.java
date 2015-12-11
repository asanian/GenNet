/*
 * Entity.java
 *
 * Versiopn 1.0
 *
 * Created on 28 avril 2004, 18:15
 */


import java.awt.* ;
import javax.swing.* ;
import java.awt.event.* ;
import java.util.* ;

/**
 * Repr�sentation d'une �tape
 *
 * @version 1.0
 * @author  Olivier Mansion
 */
public class Entity {
    
    // Etiquette de l'�tape
    String label;// label
    
    //numero de l'etape
    int num;
    
    // Position dans la fenetre
    int x;
    int y;
    
    int selected;//1 si selectionn�e, 0 sinon
    
    int tempsP;
    boolean incP; // vrai si le temps P est inconnu, faux sinon || ( true if the time P is unknown, false otherwise)
    
    int tempsM;
    boolean incM; // vrai si le temps M est inconnu, faux sinon
    Vector<Integer> listPredec;
    Vector<K> Ks;
    int maxLevel;
   int minVal;// when all resources are inhibitors its 0, else its 1
    
    //Image imSelected;
    
    //Image imNotSelected;
    
    /**
     * Cr�e une nouvelle Etape
     * @param num num�ro de l'�tape
     * @param label label de l'�tape
     * @param x coordonn�e de l'�tape en x
     * @param y coordonn�es en y de l'�tape
     */
    public Entity(int num, String label, int x, int y/*, Image imSel, Image imNotSel*/) {
        this.label = label;
        this.num = num;
        this.x = x;
        this.y = y;
        selected = 0;
        tempsP = 0;
        tempsM = 0;
        incP = true;
        incM = true;
        Ks = new Vector<K>();
        listPredec=new Vector<Integer>();
        maxLevel=0;
        minVal=0;
        //this.imSelected = imSel;
        //this.imNotSelected = imNotSel;
    }

    public Entity(int num, String label, int x, int y, Vector<K> K/*, Image imSel, Image imNotSel*/) {
        this.label = label;
        this.num = num;
        this.x = x;
        this.y = y;
        selected = 0;
        tempsP = 0;
        tempsP = 0;
        tempsM = 0;
        incP = true;
        incM = true;        
        this.Ks = K;   
         maxLevel=0;
        minVal=0;
         listPredec=new Vector<Integer>();
    }
    
    /**
     * permet d'obtenir le numero de l'etape
     * @return retourne le numero de l'etape
     */        
    public int getNum() {
        return num;
    }
    
    /**
     * permet d'obtenir l'�tiquette de l'�tape
     * @return retourne l'�tiquette d el'�tape
     */    
    public String getLabel() {
        return this.label;
    }  
    
    /**
     * permet d'obtenir la coordonn�e en x de l'�tape
     * @return retourne la coordonn�e en x de l'�tape
     */    
    public int getX() {
        return this.x;
    }
    
    /**
     * permet d'obtenir la coordonn�e en y de l'�tape
     * @return retourne la coordonn�e en y de l'�tape
     */    
    public int getY() {
        return this.y;
    }
    
    /**
     * permet de changer l'�tiquette de l'�tape
     * @param label nouvelle �tiquette
     */    
    public void setLabel(String label) {
        this.label = label;
    }
    
    /**
     * permet de fixer une nouvelle coordonn�e en x de l'�tape
     * @param x nouvelle coordonn�e
     */    
    public void setX(int x) {
        this.x = x;
    }
    
    /**
     * permet de changer la coordonn�e en y de l'�tape
     * @param y nouvelle coordonn�e
     */    
    public void setY(int y) {
        this.y = y;
    }
    
    /**
     * permet de dessiner l'�tape
     * @param g Graphics sur lequelle l'�tape doit se dessiner
     * @param c couleur du dessin
     */    
    public void drawGraphics(Graphics g, Color c) {

        Color col = c;
        if ((c != Color.WHITE) && (selected == 1)) {
            col = Color.BLUE;
        }
        
        int posEtX;
        int posEtY;
        
        Graphics2D g2d = (Graphics2D) g;
        
        FontMetrics fontMetrics = g2d.getFontMetrics();
        int length = fontMetrics.stringWidth(label);
        int width = fontMetrics.getHeight();
        
        // it determines the width of the state depending on the length of the character string
        int stringWidth = 32;
        if (length + 8 > stringWidth) {
            stringWidth = length + 8;
        }
        
        posEtX = this.x - stringWidth / 2;
        posEtY = this.y - 16;
        
        if (selected == 1) {
            g.setColor(Color.WHITE);
            g.fillRoundRect(posEtX, posEtY, stringWidth, 32 , 10, 10);
            g.setColor(Color.BLUE);
            g.drawRoundRect(posEtX, posEtY, stringWidth, 32 , 10, 10);
            g.setColor(Color.BLUE);
            g.drawString(label, this.x - length / 2, this.y + 14);
        } else {
            g.setColor(Color.WHITE);
            g.fillRoundRect(posEtX, posEtY, stringWidth, 32 , 10, 10);
            g.setColor(Color.BLACK);
            g.drawRoundRect(posEtX, posEtY, stringWidth, 32 , 10, 10);
            g.setColor(Color.BLACK);
            g.drawString(label, this.x - length / 2, this.y + 14);
        }    
    } 
    
    /**
  
     */    
    public boolean zoneInfluence(int xI, int yI) {
        int lableLength = label.length();
        int nbrLine = 0;

        if ((xI >= (x - 18)) && (xI <= (x + 18)) && (yI >= (y - 17)) && (yI <= (y + 16))) {
            return true;
        } else {
            return false;
        }
    }    
        //seeks the index corresponding to the vector K PREDEC ds Ks
    //Looking index corresponding to the vector K PREDEC ds Ks
    public int correspK(Vector predec_bis) {
        boolean test = false;
        boolean testint;
	K tempK;
        int i = 0;
        int j;
        int temp1, temp2;
        while (!test && i<Ks.size()) {
            Vector vTemp = new Vector();
            tempK = Ks.elementAt(i);
            vTemp = tempK.predec;
            if (predec_bis.size() == vTemp.size()) {
                testint = true;
                for (j=0; j<predec_bis.size(); j++) {
                    temp1 = ((Integer)(predec_bis.elementAt(j))).intValue();
                    temp2 = ((Integer)(vTemp.elementAt(j))).intValue()-1;
                    testint = (testint) && (temp1 == temp2);
                }
                if (testint) {
                    test = true;
                }
            }
            i = i+1;
        }
        if (!test) {
            i = 0;
        }
        return (i-1);
    }
    public String predecString(){
        String pred=this.getLabel()+" , ";
        for(int i=0;i<listPredec.size();i++){
            pred = pred+ listPredec.get(i);
            if(i<listPredec.size()-1)
                pred=pred+" , ";
            else 
                pred=pred+" . ";
        }
        return pred;     
    }
    
    public K getK(int i) {
        return ((K)(Ks.elementAt(i)));
    }
   
}
