import java.awt.Color;
import java.awt.Graphics;
import java.util.Vector;

/*
 * Modifications R�my : les noms avec "�tape" qui resultaient d'un copier-coller
 * ont �t� renomm�s avec "�tat"
 */

public class TransState {

	// Lien avec les �tapes
	private int numInitialState;   // Num�ro de l'�tat initial
	private int numFinalState;   // Num�ro de l'�tat d'arriv�e

	int xInitialState;
	int yInitialState;
	int xFinalState;
	int yFinalState;

	Vector points;

	Matrix plot;

	int selected;//1->selectionn�e, 0->pas selectionnee
	//
	int selectedGreen;
	//
	Color pathColor=Color.black;
	
	
	
  

	/**
	 * Cr�e une nouvelle instance de TransEtat
	 * @param etiquette etiquette de la transition
	 * @param numEtIni num�ro de l'�tat initiale
	 * @param numEtFin num�ro de l'�tat finale
	 * @param xEtapeIni abscisse de l'�tat initiale
	 * @param yEtapeIni ordonn�e de l'�tat initiale
	 * @param xEtapeFin abscisse de l'�tat finale
	 * @param yEtapeFin ordonn�e de l'�tat finale
	 * @param clou vecteur contenant les pointss
	 */
	public TransState(int numEtIni, int numEtFin, int xEtatIni, int yEtatIni, int xEtatFin, int yEtatFin, Vector clou) {
		this.numInitialState = numEtIni;
		this.numFinalState = numEtFin;
		this.xInitialState = xEtatIni;
		this.yInitialState = yEtatIni;
		this.xFinalState = xEtatFin;
		this.yFinalState = yEtatFin;
		this.points = clou;
		selected = 0;
	}

	// Obtenir les caract�ristiques de la transition
	/**
	 * permet de recuperer le seuil de l'interaction
	 * @return retourne le seuil de l'interaction
	 */    

	/**
	 * retourne le num�ro de l'�tape initiale
	 * @return retourne le num�ro de l'�tape initiale
	 */    
	public int getNumInitialState() {
		return this.numInitialState;
	}

	/**
	 * permet de r�cuperer le num�ro de l'�tape finale
	 * @return retourne le num�ro de l'�tape finale
	 */    
	public int getNumFinalState() {
		return this.numFinalState;
	}

	/**
	 * permet de changer le num�ro de l'�tape initiale
	 * @param numInitialState nouveau num�ro de l'�tape initiale
	 */    
	public void setNumInitialState(int numInitialState) {
		this.numInitialState = numInitialState;
	}

	/**
	 * permet de changer le num�ro de l'�tape finale
	 * @param numFinalState nouveau num�ro de l'�tape finale
	 */    
	public void setNumFinalState(int numFinalState) {
		this.numFinalState = numFinalState;
	}

    public void drawGraph(Graphics g, Color c) {        
        Color col = c;
        //
        if (selectedGreen == 1) {
            col = Color.green ;
        } 
        //
        if (selected == 1) {
            col = Color.blue ;
        } 
        g.setColor(col);
        if (points.isEmpty() == true) {
            g.drawLine((int)(Zoom.coef*xInitialState), (int)(Zoom.coef*yInitialState), (int)(Zoom.coef*xFinalState), (int)(Zoom.coef*yFinalState));
            // calculate de la fleche
            // on cherche le point milieu
            int x, y;
            if (xInitialState > xFinalState) {
                x = xFinalState + (xInitialState - xFinalState) / 2;
            } else {
                x = xInitialState + (xFinalState - xInitialState) / 2;
            }
            if (yInitialState > yFinalState) {
                y = yFinalState + (yInitialState - yFinalState) / 2;
            } else {
                y = yInitialState + (yFinalState - yInitialState) / 2;
            }

            // on cherche le coefficient directeur de la droite liant les 2 �tapes
            float coeff = - (float) ((float) yInitialState - (float) yFinalState)/((float) xInitialState - (float) xFinalState);


            // coefficient directeur de la droite permendiculaire
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
            if (xFinalState > xInitialState) {
                if (yFinalState < yInitialState) {
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
                if (yFinalState < yInitialState) {
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
            if (xFinalState > xInitialState) {
                if (yFinalState < yInitialState) {
                    xP3 = x + (int)Math.round(xDep);
                    yP3 = y - (int)Math.round(yDep); 
                } else {
                    xP3 = x + (int)Math.round(xDep);
                    yP3 = y + (int)Math.round(yDep); 
                }
            } else {
                if (yFinalState < yInitialState) {
                    xP3 = x - (int)Math.round(xDep);
                    yP3 = y - (int)Math.round(yDep);
                } else {
                    xP3 = x - (int)Math.round(xDep);
                    yP3 = y + (int)Math.round(yDep);
                } 
            }

            int[] ptX = {(int)(Zoom.coef*xP1), (int)(Zoom.coef*xP2), (int)(Zoom.coef*xP3)};
            int[] ptY = {(int)(Zoom.coef*yP1), (int)(Zoom.coef*yP2), (int)(Zoom.coef*yP3)};
            
            g.fillPolygon(ptX, ptY, 3);



        } else {
 
            for(int i=0;i<plot.getRowDimension()-1;i++) {
                g.drawLine((int)(Zoom.coef*(int)Math.round(plot.get(i,0))), (int)(Zoom.coef*(int)Math.round(plot.get(i,1))), (int)(Zoom.coef*(int)Math.round(plot.get(i+1,0))), (int)(Zoom.coef*(int)Math.round(plot.get(i+1,1)))); 
            }
            int dim = (int) plot.getRowDimension() / 2;
            float x1 = (float) plot.get(dim, 0);
            float y1 = (float) plot.get(dim, 1);
            float x2 = (float) plot.get(dim + 1, 0);
            float y2 = (float) plot.get(dim + 1, 1);
            
            // point 1
            int xP1 = (int)Math.round(x2);
            int yP1 = (int)Math.round(y2);
            
            // on cherche le coefficient directeur de la droite liant les 2 �tapes
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
            
            // point 3 & 4
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

            int[] ptX = {(int)(Zoom.coef*xP1), (int)(Zoom.coef*xP4), (int)(Zoom.coef*xP3)};
            int[] ptY = {((int)Zoom.coef*yP1), (int)(Zoom.coef*yP4), (int)(Zoom.coef*yP3)};
            
            g.fillPolygon(ptX, ptY, 3);  
        }        
        if (selected == 1) {
            drawPoints(g, Color.red );
        }
    }

	
	public void drawPoints(Graphics g, Color c) {
		g.setColor(c);
		int i;
		for (i = 0; i < points.size(); i = i + 1) {
			Point p = (Point) points.get(i);
			p.drawPoint(g, c);
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
	 * calculate les diff�rents points du lien
	 */    
	public void calculate() {
		Matrix points; 
		int numpoints; 
		Matrix mat;
		Matrix mat2;
		float[] t; //time values 
		int k = 200;
		numpoints = 2+ this.points.size();
		points = new Matrix(numpoints,2); 
		points.set(0,0,(float) xInitialState); 
		points.set(0,1,(float) yInitialState); 
		for(int i = 0; i < this.points.size(); i = i + 1 ) {
			Point p = (Point) this.points.get(i);
			points.set(i + 1,0,(float)p.x); 
			points.set(i + 1,1,(float)p.y);
		}
		points.set(numpoints - 1,0,(float) xFinalState); 
		points.set(numpoints - 1,1,(float) yFinalState);
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
			}
		}
		mat2 = new Matrix(k+1, numpoints);
		for(int i=0;i<mat.getRowDimension();i++) {
			for(int j=0;j<mat.getColumnDimension();j++) {
				mat2.set(j, i, mat.get(i, j));
			}
		}
		plot = mat2.times(points);
	}

	public Color getPathColor() {
		return pathColor;
	}

	public void setPathColor(Color couleurChemin) {
		this.pathColor = couleurChemin;
	}
}
