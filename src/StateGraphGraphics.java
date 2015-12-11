import java.awt.Color;
import java.awt.Cursor;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.image.BufferedImage;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.SwingUtilities;

public class StateGraphGraphics extends JPanel implements MouseMotionListener, MouseListener, ActionListener{

	private static final long serialVersionUID = 1L;
	//public boolean creationEtatEnCours;
	public String label;
	public StateGraphAutomate auto;
	public StateBar bar;
	public StateGraphFrame frame;    

	// Variables necessary to move a state
	boolean moveState;
	int stateMoved;    

	// Variables necessary to displacement of a point
	boolean movePoint;
	int numTransPoint;
	int pointPosition;    

	//variable to remove a point
        
	int numPoint;//position of Transition in vector
	int posOfPoint;//position of point in the vector  
	
	//add a point
	int pointX;//abscisse du nouveau points
	int pointY;//ordonne du nouveau points
	TransState tranStatePoint;// transition point is added
	// D�finition des curseurs utiles
	Cursor cross;
	Cursor hand;
	Cursor move;    
	//element selectionn�s
	State stateSelected;//etape selectionnee
	TransState transSelected;//transition selectionnee
	int etatEtat;//0->non selectionn�e, 1->selectionnee
	int tranState;//0->non selectionn�e, 1->selectionnee     

	Color cDraw = Color.black;

	//***********
	//add a point
	TransState transAddClou;// transition point is added

	boolean creationTransEtatEnCours;
	Vector vPoints;
	//************

	public StateGraphGraphics(StateGraphAutomate automate, StateBar bar, StateGraphFrame frame) {
		this.setBackground(Color.white);
		auto=new StateGraphAutomate();
		auto=automate;
		this.bar=bar;		
		moveState = false;
		movePoint = false;        
		//****
		creationTransEtatEnCours = false;
		vPoints = new Vector();
		//*****

		this.frame=frame;

		cross = new Cursor(Cursor.CROSSHAIR_CURSOR);
		hand = new Cursor(Cursor.HAND_CURSOR);
		move = new Cursor(Cursor.MOVE_CURSOR);        
		// d�finition du type de curseurs
		setCursor(cross);            
		// la zone graphique est receptrice des �v�nements de la souris
		addMouseMotionListener(this);
		addMouseListener(this);        
                
	}
public void displayGeneOrder(){
    JTextArea jTxtParam = new JTextArea();
                jTxtParam.setEditable(false);
		jTxtParam.setBackground(Color.WHITE);
                String str="Genes Order:   ";
                for(int i=0;i<auto.vGeneNames.size();i++){
                    str=str+auto.vGeneNames.get(i)+" , ";
                }
		jTxtParam.setText(str.substring(0,str.length()-2));
                jTxtParam.setBounds(3, 3, 300, 200);
                jTxtParam.setBackground(Color.lightGray);
        Font font = new Font("Verdana", Font.CENTER_BASELINE, 16);
        jTxtParam.setFont(font);
       jTxtParam.setForeground(Color.black);
        jTxtParam.setAlignmentY(JTextArea.LEFT_ALIGNMENT);
                this.add(jTxtParam);
}
	public void mouseMoved(MouseEvent e) {
		bar.displayCoor(e.getX(), e.getY());
		// Change l'apparence du curseur
		if ((moveState == false) && (movePoint == false)) {
			int k; // compteur
			setCursor(cross);
			boolean inVoid=true;
			boolean state = false;
			for (k = 0; k < auto.vStates.size(); k = k + 1) {
				State stateCt = (State) auto.vStates.get(k);
				if (stateCt.zoneInfluence((int)(e.getX()/Zoom.coef), (int)(e.getY()/Zoom.coef)) == true && state == false) {
					setCursor(hand);
					if (bar.can == true) {
						bar.displayInfo("Gene " + stateCt.label);
					}
					state = true;
					inVoid=false;
				}
			}
			if (state == false) {
				for (k = 0; k < auto.vTranStates.size(); k = k + 1) {
					TransState transCt = (TransState) auto.vTranStates.get(k);
					if ((transCt.zoneInfluence((int)(e.getX()/Zoom.coef), (int)(e.getY()/Zoom.coef)) == true) && (state == false)) {
						setCursor(hand);
						if (bar.can == true) {                        	
							bar.displayInfo("Transition");
						}
						state = true;
						inVoid=false;
					}            
				}
			}
			if (inVoid){
				bar.displayInfo(frame.frameName);
			}
		}        
	}

	public void mouseDragged(MouseEvent e) {
		bar.displayCoor(e.getX(), e.getY());

		if (moveState == true) {
			State etapeCt = (State) auto.vStates.get(stateMoved);
			int xDep = e.getX() - etapeCt.getX();
			int yDep = e.getY() - etapeCt.getY();
			etapeCt.setX((int)(e.getX()/Zoom.coef));
			etapeCt.setY((int)(e.getY()/Zoom.coef));
			int k;
			for (k = 0; k < auto.vTranStates.size(); k = k + 1) {
				TransState transCt = (TransState) auto.vTranStates.get(k);  
				if (transCt.getNumInitialState() == etapeCt.getNum()) {
					transCt.xInitialState = (int)(e.getX()/Zoom.coef);
					transCt.yInitialState = (int)(e.getY()/Zoom.coef);
					transCt.calculate();
				}
				if (transCt.getNumFinalState() == etapeCt.getNum()) {
					transCt.xFinalState = (int)(e.getX()/Zoom.coef);
					transCt.yFinalState = (int)(e.getY()/Zoom.coef);
					transCt.calculate();
				}
				if ((transCt.getNumInitialState() == etapeCt.getNum()) && (transCt.getNumFinalState() == etapeCt.getNum())) {
					transCt.xFinalState = (int)(e.getX()/Zoom.coef);
					transCt.yFinalState = (int)(e.getY()/Zoom.coef);
					transCt.xInitialState = (int)(e.getX()/Zoom.coef);
					transCt.yInitialState = (int)(e.getY()/Zoom.coef);
					for (int q = 0; q < transCt.points.size(); q = q + 1) {
						Point p  = (Point) transCt.points.get(q);
						p.x = p.x + xDep;
						p.y = p.y + yDep;  
					}
					transCt.calculate();
				}
			}
			draw();

		}
		if (movePoint == true) {
			TransState transCt = (TransState) auto.vTranStates.get(numTransPoint);
			Point p = (Point) transCt.points.get(pointPosition);
			p.x =(int)(e.getX()/Zoom.coef);
			p.y = (int)(e.getY()/Zoom.coef);
			transCt.calculate();
			draw();
		}
	}

	public void mouseClicked(MouseEvent e) {
	}

	public void mouseEntered(MouseEvent e) {
	}

	public void mouseExited(MouseEvent e) {
	}

	public void mousePressed(MouseEvent e) {
		if ((moveState == false) && (movePoint == false) && (bar.can == true)) {
			boolean etat2=false;			
			int k;
			Graphics2D g = (Graphics2D) this.getGraphics();
			boolean etat = false;
			for (k = 0; k < auto.vStates.size(); k = k + 1) {
				State etapeCt = (State) auto.vStates.get(k);
				if ((etapeCt.zoneInfluence((int)(e.getX()/Zoom.coef), (int)(e.getY()/Zoom.coef)) == true) && (etat == false)) {
					selectState(etapeCt);
					etat = true;
				}
			}  
			if (etat == false) {
				for (k = 0; k < auto.vTranStates.size(); k = k + 1) {
					TransState transCt = (TransState) auto.vTranStates.get(k);
					if ((transCt.zoneInfluence((int)(e.getX()/Zoom.coef), (int)(e.getY()/Zoom.coef)) == true) && (etat == false)) {
						selectTranState(transCt);
						etat = true;
					}       
				}
				if (etat == false) {
					selectNull();
				}
			}
			draw();
			if (SwingUtilities.isRightMouseButton(e)) {
				for (k = 0; k < auto.vStates.size(); k = k + 1) {
					State etatCt = (State) auto.vStates.get(k);
					if ((etatCt.zoneInfluence((int)(e.getX()/Zoom.coef), (int)(e.getY()/Zoom.coef)) == true) && (etat == false)) {
						etat = true;
					}
				}     			
				for (k = 0; k < auto.vTranStates.size(); k = k + 1) {					
					TransState transCt = (TransState) auto.vTranStates.get(k);
					int m;
					for (m = 0; m < transCt.points.size(); m = m + 1) {
						Point p = (Point) transCt.points.get(m);	
						if ((p.zoneInfluencePoint((int)(e.getX()/Zoom.coef), (int)(e.getY()/Zoom.coef)) == true) ) {
							(frame.pointPopup).show(this,e.getX(), e.getY());
							etat = true;
							etat2=true;
							numPoint = k;
							posOfPoint = m;
						}
					}
				}
				if (tranState == 1 & etat2 == false) {
					for (k = 0; k < auto.vTranStates.size(); k = k + 1) {
						TransState transCt = (TransState) auto.vTranStates.get(k);
						if ((transCt.zoneInfluence((int)(e.getX()/Zoom.coef), (int)(e.getY()/Zoom.coef)) == true)) {
							(frame.popupTrans).show(this,e.getX(), e.getY());
							pointX = (int)(e.getX()/Zoom.coef);
							pointY = (int)(e.getY()/Zoom.coef);
							transAddClou = transCt;
							etat = true;
						}
					}
					if (etat == false) {
						(frame.popupNull).show(this,e.getX(), e.getY());
					}
				}
		
				
			} 
			//****
			draw();
			//****
			if (etat) {
				for (k = 0; k < auto.vStates.size(); k = k + 1) {
					State etatCt = (State) auto.vStates.get(k);
					if (etatCt.zoneInfluence((int)(e.getX()/Zoom.coef), (int)(e.getY()/Zoom.coef)) == true) {
						moveState = true;
						bar.can = false;
						stateMoved = k;
						setCursor(move);
						bar.displayInfo("Drag to displace, release to fix");
					}
				}
				for (k = 0; k < auto.vTranStates.size(); k = k + 1) {
					TransState transCt = (TransState) auto.vTranStates.get(k);
					int m;
					for (m = 0; m < transCt.points.size(); m = m + 1) {
						Point p = (Point) transCt.points.get(m);
						if (p.zoneInfluencePoint((int)(e.getX()/Zoom.coef), (int)(e.getY()/Zoom.coef)) == true) {
							movePoint = true;
							bar.can = false;
							numTransPoint = k;
							pointPosition = m;
							setCursor(move);
						bar.displayInfo("Drag to displace, release to fix");
						}
					}
				}
			}
		}
	}

	public void mouseReleased(MouseEvent e) {

		if (moveState == true) {
			moveState = false;
			setCursor(cross);
			auto.modif(true);
			bar.can = true;
		}

		if (movePoint == true) {
			auto.modif(true);
			movePoint = false;
			TransState transCt = (TransState) auto.vTranStates.get(numTransPoint);
			Point p = (Point) transCt.points.get(pointPosition);
			p.x = e.getX();
			p.y = e.getY();
			transCt.calculate();
			draw();
			setCursor(cross);
			bar.can = true;
	bar.displayInfo(frame.frameName);
		}
	}

	public void actionPerformed(ActionEvent e) {
	}

	public void selectState(State e) {
		if (etatEtat == 1) {
			stateSelected.selected = 0;
		}
		if (tranState == 1) {
			transSelected.selected = 0;
			tranState = 0;
		}
		etatEtat = 1;
		stateSelected = e;
		stateSelected.selected = 1;
	}

	public void selectTranState(TransState t) {
		if (etatEtat == 1) {
			stateSelected.selected = 0;
			etatEtat = 0;
		}
		if (tranState == 1) {
			transSelected.selected = 0;
		}
		tranState = 1;
		transSelected = t;
		transSelected.selected = 1;
	}

	public void selectNull() {
		if (etatEtat == 1) {
			stateSelected.selected = 0;
			etatEtat = 0;
		}
		if (tranState == 1) {
			transSelected.selected = 0;
			tranState = 0;
		}
	}

	/*public Image attribImSelected() {
        int max = vImSelected.size();
        int val = rd.nextInt(max);
        Image result = (Image) vImSelected.get(val);
        return result;
    }

    public Image attribImNotSelected() {
        int max = vImNotSelected.size();
        int val = rd.nextInt(max);
        Image result = (Image) vImNotSelected.get(val);
        return result;
    }*/

	BufferedImage toBufferedImage(Image image) {
		/** On test si l'image n'est pas d�ja une instance de BufferedImage */
		if( image instanceof BufferedImage ) {
			/** cool, rien � faire */
			return( (BufferedImage)image );
		} else {
			/** On s'assure que l'image est compl�tement charg�e */
			image = new ImageIcon(image).getImage();

			/** On cr�e la nouvelle image */
			BufferedImage bufferedImage = new BufferedImage(image.getWidth(null), image.getHeight(null), BufferedImage.TYPE_4BYTE_ABGR);
			Graphics g = bufferedImage.createGraphics();
			g.drawImage(image,0,0,null);
			g.dispose();

			return( bufferedImage );
		} 
	}

	public void paintComponent(Graphics g){
		super.paintComponent(g);
		((Graphics2D)g).setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		Font helvetica12Normal = new Font("Helvetica",Font.PLAIN,12);
		g.setFont(helvetica12Normal);
                 
		auto.drawGraphics(g, cDraw);
		if (creationTransEtatEnCours == true) {
			for (int k = 0; k < vPoints.size(); k = k + 1) {
				Point pointCt = (Point) vPoints.get(k);
				pointCt.drawPoint(g, Color.red);
			}
		}
	}

	public void draw() {
		repaint();   
	}
}

