/*
 * Point.java
 *
 * Version 1.0
 *
 * Created on 1 mai 2004, 13:15
 */

import java.awt.* ;
import javax.swing.* ;

/**
 * un clou
 * @author Olivier
 */
public class Point {
    
    int x;
    int y;
    
    /**
     * Cr�e une nouvelle instance de Point
     * @param x abscisse du point
     * @param y ordonn�e du point
     */
    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    public void drawPoint(Graphics g, Color c) {
        g.setColor(c);
        g.drawLine((int)Zoom.coef*(x - 5), (int)Zoom.coef*y, (int)Zoom.coef*(x + 5), (int)Zoom.coef*y);
        g.drawLine((int)Zoom.coef*x, (int)Zoom.coef*(y - 5), (int)Zoom.coef*x, (int)Zoom.coef*(y + 5));
    }
    
    /**
     * permet de savoir si un point est dans la zone d'influence du point
     * @param xI abscisse du point a tester
     * @param yI ordonn�e du point � tester
     * @return retourne vrai si le point ets dans la zone d'influence du point
     */    
    public boolean zoneInfluencePoint(int xI, int yI) {
        if ((xI >= x - 5) && (xI <= x + 5) && (yI >= y - 5) && (yI <= y + 5)) {
            return true;
        } else {
            return false;
        }
    } 
}
