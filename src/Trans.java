/*
 * Trans.java
 * 
 * Version 1.0
 *
 * Created on 28 avril 2004, 18:16
 */


import java.awt.* ;
import javax.swing.* ;
import java.awt.event.* ;
import java.util.* ;
import java.lang.Math;

/**
 * Repr�sentation d'une transition
 *
 * @version 1.0
 * @author  Olivier Mansion
 */
public class Trans {
    
    // Etiquette de la transition
  
    private int threshold; // thesho;d value
    private int sign;  //"+"->1, "-"->0
    
    // Lien avec les �tapes
    private int numInitialEnt;   // Num�ro de l'�tape initiale
    private int numFinalEnt;   // Num�ro de l'�tape d'arriv�e
    
    int initailEntX;
    int initailEntY;
    int finalEntX;
    int finalEntY;
    
    Vector points;   // containing point
    
    Matrix plot;
    
    int selected;//1->selectionn�e, 0->pas selectionnee
    
    /**
     * Cr�e une nouvelle instance de Trans
     * @param etiquette etiquette de la transition ||etiquette label of the transition
     
     * @param numEtIni num�ro de l'�tape initiale
     * @param numEtFin num�ro de l'�tape finale
     * @param xEtapeIni abscisse de l'�tape initiale
     * @param yEtapeIni ordonn�e de l'�tape initiale
     * @param xEtapeFin abscisse de l'�tape finale
     * @param yEtapeFin ordonn�e de l'�tape finale
     * @param clou vecteur contenant les pointss
     */
    public Trans(int sign, int threshold, int numEtIni, int numEtFin, int xEtapeIni, int yEtapeIni, int xEtapeFin, int yEtapeFin, Vector clou) {
        this.sign = sign;
        this.threshold = threshold;
        this.numInitialEnt = numEtIni;
        this.numFinalEnt = numEtFin;
        this.initailEntX = xEtapeIni;
        this.initailEntY = yEtapeIni;
        this.finalEntX = xEtapeFin;
        this.finalEntY = yEtapeFin;
        this.points = clou;
        selected = 0;
    }
    
    // Obtenir les caract�ristiques de la transition

    
    /**
     * permet de recuperer l'�tiquette2 de la transition
     * @return retourne l'�tiquette2 de la transition
     */    
    public int getSign() {
        return this.sign;
    }
    
    /**
     * retourne le num�ro de l'�tape initiale
     * @return retourne le num�ro de l'�tape initiale
     */    
   
    /**
     * @return the threshold
     */
    public int getThreshold() {
        return threshold;
    }

    /**
     * @param threshold the threshold to set
     */
    public void setThreshold(int threshold) {
        this.threshold = threshold;
    }
    
    /**
     * permet de changer l'�tiquette2 de la transition
     * @param etiquette2 nouvelle �tiquette
     */    

    
    /**
     * permet de dessiner les pointss
     * @param g Graphics sur lequel l'�tiquette se dessine
     * @param c couleur du dessin
     */       
    public void drawPoints(Graphics g, Color c) {
        g.setColor(c);
        int i;
        for (i = 0; i < points.size(); i = i + 1) {
            Point p = (Point) points.get(i);
            p.drawPoint(g, c);
        }
    }
    
    /**
     * can draw the transition
      * @ Param g Graphics to draw the label is
      *param c color drawing
     */       
    public void drawGraph(Graphics g, Color c) {        
        Color col = c;
        if (selected == 1) {
            col = Color.blue ;
        }
        g.setColor(col);
        if (points.isEmpty() == true) {
            g.drawLine(initailEntX, initailEntY, finalEntX, finalEntY);
          // Calculates the arrow
//           We try the midpoint
            int x, y;
            if (initailEntX > finalEntX) {
                x = finalEntX + (initailEntX - finalEntX) / 2;
            } else {
                x = initailEntX + (finalEntX - initailEntX) / 2;
            }
            if (initailEntY > finalEntY) {
                y = finalEntY + (initailEntY - finalEntY) / 2;
            } else {
                y = initailEntY + (finalEntY - initailEntY) / 2;
            }

            // we seek the coefficient of the straight line connecting the two entities
            float coeff = - (float) ((float) initailEntY - (float) finalEntY)/((float) initailEntX - (float) finalEntX);


            // Director of the perpendicular coefficient
            float cPerp = - 1 / coeff;

            float xDep = 0;
            float yDep = 0;

            while (xDep * xDep + yDep * yDep < 5 * 5) {
                xDep = xDep + 1;
                yDep = xDep * cPerp;
            }

            // point 1 & 2
            int xP1;
            int yP1;
            int xP2;
            int yP2;
            int xs;
            int ys;
            xDep = 0;
            yDep = 0;
            xDep = xDep + 1;
            yDep = xDep * Math.abs(cPerp);
            while (xDep * xDep + yDep * yDep < 5 * 5) {
                xDep = xDep + 1;
                yDep = xDep * Math.abs(cPerp);
            }
            if (yDep > 5) {
                xDep = 5 / Math.abs(cPerp);
                yDep = 5;
            }
            if (finalEntX > initailEntX) {
                if (finalEntY < initailEntY) {
                    xP1 = x - (int)Math.round(xDep);
                    yP1 = y - (int)Math.round(yDep);
                    xP2 = x + (int)Math.round(xDep);
                    yP2 = y + (int)Math.round(yDep);
                    xs = xP2 + Math.abs(xP1 - xP2) / 4;
                    ys = yP2 + Math.abs(yP1 - yP2) / 4 + 10;
                } else {
                    xP1 = x + (int)Math.round(xDep);
                    yP1 = y - (int)Math.round(yDep);
                    xP2 = x - (int)Math.round(xDep);
                    yP2 = y + (int)Math.round(yDep);
                    xs = xP1 + Math.abs(xP1 - xP2) / 4;
                    ys = yP1 - Math.abs(yP1 - yP2) / 4;
                }
            } else {
                if (finalEntY < initailEntY) {
                    xP1 = x + (int)Math.round(xDep);
                    yP1 = y - (int)Math.round(yDep);
                    xP2 = x - (int)Math.round(xDep);
                    yP2 = y + (int)Math.round(yDep);
                    xs = xP1 + Math.abs(xP1 - xP2) / 4;
                    ys = yP1 - Math.abs(yP1 - yP2) / 4;
                } else {
                    xP1 = x - (int)Math.round(xDep);
                    yP1 = y - (int)Math.round(yDep);
                    xP2 = x + (int)Math.round(xDep);
                    yP2 = y + (int)Math.round(yDep);
                    xs = xP2 + Math.abs(xP1 - xP2) / 4;
                    ys = yP2 + Math.abs(yP1 - yP2) / 4 + 10;
                } 
            }

            // point 3
            int xP3;
            int yP3;
            xDep = 0;
            yDep = 0;
            xDep = xDep + 1;
            yDep = xDep * Math.abs(coeff);
            while (xDep * xDep + yDep * yDep < 10 * 10) {
                xDep = xDep + 1;
                yDep = xDep * Math.abs(coeff);
            }
            if (yDep > 10) {
                xDep = 10 / Math.abs(coeff);
                yDep = 10;
            }
            if (finalEntX > initailEntX) {
                if (finalEntY < initailEntY) {
                    xP3 = x + (int)Math.round(xDep);
                    yP3 = y - (int)Math.round(yDep); 
                } else {
                    xP3 = x + (int)Math.round(xDep);
                    yP3 = y + (int)Math.round(yDep); 
                }
            } else {
                if (finalEntY < initailEntY) {
                    xP3 = x - (int)Math.round(xDep);
                    yP3 = y - (int)Math.round(yDep);
                } else {
                    xP3 = x - (int)Math.round(xDep);
                    yP3 = y + (int)Math.round(yDep);
                } 
            }

            int[] ptX = {xP1, xP2, xP3};
            int[] ptY = {yP1, yP2, yP3};
            
            g.fillPolygon(ptX, ptY, 3);

            String etiquette = Integer.toString(getThreshold());
            if (getSign() == 0) {
                etiquette = etiquette + "-";
            } else {
                etiquette = etiquette + "+";
            }
            g.drawString(etiquette, xs, ys);

        } else {
 
            for(int i=0;i<plot.getRowDimension()-1;i++) {
                g.drawLine((int)Math.round(plot.get(i,0)), (int)Math.round(plot.get(i,1)), (int)Math.round(plot.get(i+1,0)), (int)Math.round(plot.get(i+1,1))); 
            }
            int dim = (int) plot.getRowDimension() / 2;
            float x1 = (float) plot.get(dim, 0);
            float y1 = (float) plot.get(dim, 1);
            float x2 = (float) plot.get(dim + 1, 0);
            float y2 = (float) plot.get(dim + 1, 1);
            
            // point 1
            int xP1 = (int)Math.round(x2);
            int yP1 = (int)Math.round(y2);
            
            //we seek the coefficient of the straight line connecting the two entities
            float coeff = Math.abs((y2 - y1)/(x2 - x1));
            
            // point2
            int xP2;
            int yP2;
            float xDep = 0;
            float yDep = 0;
            xDep = xDep + 1;
            yDep = xDep * Math.abs(coeff);
            while (xDep * xDep + yDep * yDep < 10 * 10) {
                xDep = xDep + 1;
                yDep = xDep * Math.abs(coeff);
            }
            if (yDep > 10) {
                xDep = 10 / Math.abs(coeff);
                yDep = 10;
            }
            if (x1 > x2) {
                if (y1 < y2) {
                    xP2 = xP1 + (int)Math.round(xDep);
                    yP2 = yP1 - (int)Math.round(yDep); 
                } else {
                    xP2 = xP1 + (int)Math.round(xDep);
                    yP2 = yP1 + (int)Math.round(yDep); 
                }
            } else {
                if (y2 < y1) {
                    xP2 = xP1 - (int)Math.round(xDep);
                    yP2 = yP1 + (int)Math.round(yDep);
                } else {
                    xP2 = xP1 - (int)Math.round(xDep);
                    yP2 = yP1 - (int)Math.round(yDep);
                } 
            }
            
//             point 3 & 4
            int xP3;
            int yP3;
            int xP4;
            int yP4;
            int xs;
            int ys;
            float cPerp = 1 / coeff;
            xDep = 0;
            yDep = 0;
            xDep = xDep + 1;
            yDep = xDep * Math.abs(cPerp);
            while (xDep * xDep + yDep * yDep < 5 * 5) {
                xDep = xDep + 1;
                yDep = xDep * Math.abs(cPerp);
            }
            if (yDep > 5) {
                xDep = 5 / Math.abs(cPerp);
                yDep = 5;
            }
            if (x2 > x1) {
                if (y2 < y1) {
                    xP3 = xP2 - (int)Math.round(xDep);
                    yP3 = yP2 - (int)Math.round(yDep);
                    xP4 = xP2 + (int)Math.round(xDep);
                    yP4 = yP2 + (int)Math.round(yDep);
                    xs = xP4 + (Math.abs(xP4 - xP3))/4;
                    ys = yP4 + (Math.abs(yP4 - yP3))/4 + 10;
                } else {
                    xP3 = xP2 + (int)Math.round(xDep);
                    yP3 = yP2 - (int)Math.round(yDep);
                    xP4 = xP2 - (int)Math.round(xDep);
                    yP4 = yP2 + (int)Math.round(yDep);
                    xs = xP3 + (Math.abs(xP4 - xP3))/4;
                    ys = yP3 - (Math.abs(yP4 - yP3))/4;
                }
            } else {
                if (y2 < y1) {
                    xP3 = xP2 + (int)Math.round(xDep);
                    yP3 = yP2 - (int)Math.round(yDep);
                    xP4 = xP2 - (int)Math.round(xDep);
                    yP4 = yP2 + (int)Math.round(yDep);
                    xs = xP3 + (Math.abs(xP4 - xP3))/4;
                    ys = yP3 - (Math.abs(yP4 - yP3))/4;
                } else {
                    xP3 = xP2 + (int)Math.round(xDep);
                    yP3 = yP2 + (int)Math.round(yDep);
                    xP4 = xP2 - (int)Math.round(xDep);
                    yP4 = yP2 - (int)Math.round(yDep);
                    xs = xP3 + (Math.abs(xP4 - xP3))/4;
                    ys = yP3 + (Math.abs(yP4 - yP3))/4 + 10;
                } 
            }            

            int[] ptX = {xP1, xP4, xP3};
            int[] ptY = {yP1, yP4, yP3};
            
            g.fillPolygon(ptX, ptY, 3);
            
            String label = Integer.toString(getThreshold());
            if (getSign() == 0) {
                label = label + "-";
            } else {
                label = label + "+";
            }
            g.drawString(label, xs, ys);
       }
        
        if (selected == 1) {
            drawPoints(g, Color.red );
        }
    }
    
    /**
     * determine si un point est dans la zone d'influence du lien
     * @param xI abscisse du point a tester
     * @param yI ordonn�e du point � tester
     * @return retourne vrai si le point est dans la zone d'influence
     */        
    public boolean zoneInfluence(int xI, int yI) {
        int i;
        boolean res = false;
        for (i = 0; i < plot.getRowDimension(); i = i + 1) {
            int xC = (int) plot.get(i, 0);
            int yC = (int) plot.get(i, 1);
            if ((xI >= xC - 5) && (xI <= xC + 5) && (yI >= yC - 5) && (yI <= yC + 5)) {
                res = true;
            }
        }
        return res;
    }
    
    /**
     * determine si un point est dans la zone d'influence des pointss
     * @param xI abscisse du point a tester
     * @param yI ordonn�e du point � tester
     * @return retourne vrai si le point est dans la zone d'influence
     */        
    public boolean zoneInfluenceClou(int xI, int yI) {
        int i;
        boolean res = false;
        for (i = 0; i < points.size(); i = i + 1) {
            Point p = (Point) points.get(i);
            if (p.zoneInfluencePoint(xI, yI) == true) {
                res = true;
            }
        }
        return res;
    }
    
    
    /**
     *   
     */    
    public void calculates() {
        Matrix matrix; 
        int numpoints; 
        Matrix mat;
        Matrix mat2;
        float[] t; //time values 
        int k = 200;
        numpoints = 2 + this.points.size();
        matrix = new Matrix(numpoints,2); 
        matrix.set(0,0,(float) initailEntX); 
        matrix.set(0,1,(float) initailEntY); 
        for(int i = 0; i < this.points.size(); i = i + 1 ) {
            Point p = (Point) this.points.get(i);
            matrix.set(i + 1,0,(float)p.x); 
            matrix.set(i + 1,1,(float)p.y);
        }
        matrix.set(numpoints - 1,0,(float) finalEntX); 
        matrix.set(numpoints - 1,1,(float) finalEntY);
        t = new float[k+1]; 
        for(int i=0;i<=k;i++) {
            t[i] = (float)i/(float)k;
        }
        mat = new Matrix(numpoints,k+1);
        float c;
        for(int i=0;i<mat.getRowDimension();i++) {
        for(int j=0;j<mat.getColumnDimension();j++) { 
        c=1; 
        for(int h=0;h<numpoints;h++) {
             if(h!=i) {
             //calculate i,j position of matrix 
             c *= (float)((t[j]-(float)h/(float)(numpoints-1))/ ((float)i/(float)(numpoints-1)- (float)h/(float)(numpoints-1)));
             }}
             mat.set(i,j,c);

        }}

        mat2 = new Matrix(k+1, numpoints);
        for(int i=0;i<mat.getRowDimension();i++) {
            for(int j=0;j<mat.getColumnDimension();j++) {
                mat2.set(j, i, mat.get(i, j));
            }
        }
        plot = mat2.times(matrix);
    }

    /**
     * @param sign the sign to set
     */
    public void setSign(int sign) {
        this.sign = sign;
    }

    /**
     * @return the numInitialEnt
     */
    public int getNumInitialEnt() {
        return numInitialEnt;
    }

    /**
     * @param numInitialEnt the numInitialEnt to set
     */
    public void setNumInitialEnt(int numInitialEnt) {
        this.numInitialEnt = numInitialEnt;
    }

    /**
     * @return the numFinalEnt
     */
    public int getNumFinalEnt() {
        return numFinalEnt;
    }

    /**
     * @param numFinalEnt the numFinalEnt to set
     */
    public void setNumFinalEnt(int numFinalEnt) {
        this.numFinalEnt = numFinalEnt;
    }
public int getInitialEntity(Automate auto){
   for(int i=0;i<auto.vEntity.size();i++){
    Entity e=(Entity)auto.vEntity.get(i);
    if(this.initailEntX==e.x && this.initailEntY==e.y)
        return i;
   }
    return -1;
}
public int getFinalEntity(Automate auto){
     for(int i=0;i<auto.vEntity.size();i++){
    Entity e=(Entity)auto.vEntity.get(i);
    if(this.finalEntX==e.x && this.finalEntY==e.y)
        return i;
   }
    return -1;
}


}
