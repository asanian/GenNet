/*
 * GraphicZone.java
 *
 * Version 1.0
 *
 * Created on 28 avril 2004, 11:50
 */

import java.awt.*; // import des composants awt 
import java.awt.image.*; // import des m�thodes d'imagerie 
import javax.swing.* ;
import java.awt.event.* ;
import java.util.* ;
import javax.swing.Timer;

import java.awt.Graphics;
import java.awt.Canvas;
import java.awt.Component;
//import java.awt.image.BufferStrategy;
import java.awt.RenderingHints.*;


/**
 * Graphic area of ​​the application
 *
 * @version 1.0
 * @author  Olivier Mansion
 */
public class GraphicZone extends JPanel implements MouseMotionListener, MouseListener, ActionListener {
	public StateBar bar;
	public Automate auto;
	public MainFrame mf;
	public MenuEditer menu;
	int hight;
	int width;

	// Necessary variables creating entity
	boolean createEntity;
	int entityNumber;
	String label;
	Entity entity;

	// Necessary variables creating transition
	boolean createTrans;
	int threshold;// threshold
	int sign;// sign + or -
	int step; // know where we are in the creation of the transition
	int numInitialEnt; // initial
	int numFinalEnt; // Final
	Vector vPoints;
	int xInitialEntity, yInitialEntity, xFinalEntity, yFinalEntity;
	Trans trans;

	// Variables necessaires au d�placement d'une �tape
	boolean deplacementEntity;
	int entityDeplacee;

	// Variables necessaire au deplacement d'un points
	boolean deplacementPoint;
	int numTransPoint;
	int posPoint;

	// On definit les couleurs du dessin
	Color cBackGround = Color.white;
	Color cDrawing = Color.black;
	Color cTrans = Color.red;

	// D�finition des curseurs utiles
	Cursor cross;
	Cursor hand;
	Cursor move;

	//elements selectionn�s
	Entity entitySelected;//etape selectionnee
	Trans transSelected;//transition selectionnee
	int isEntitySelected;//0->non selectionn�e, 1->selectionnee
	int isTransSelected;//0->non selectionn�e, 1->selectionnee

	//variable pour supprimer un points
	int numpoint;//place de la transition dan sle vecteur
	int posTwoPoint;//place du points dans le vecteur

	//ajouter un points
	int pointX;//abscisse du nouveau points
	int pointY;//ordonne du nouveau points
	Trans addTransPoint;//transition ou l'on ajoute le points
        JScrollPane scrollpane_jtxtParam;

	/**
	 * Creates a new instance of workspace
	 * @param auto automate
	 * @param bar barre d'�tat
	 */
  	public GraphicZone(Automate auto, StateBar bar) {

		// Definition de la couleur de fond
		this.setBackground(Color.white);        
		this.auto = auto;
		this.bar = bar;

		vPoints = new Vector();

		createEntity = false;
		createTrans = false;
		deplacementEntity = false;
		deplacementPoint = false;

		isEntitySelected = 0;
		isTransSelected = 0;

		cross = new Cursor(Cursor.CROSSHAIR_CURSOR);
		hand = new Cursor(Cursor.HAND_CURSOR);
		move = new Cursor(Cursor.MOVE_CURSOR);


		// d�finition du type de curseurs
		setCursor(cross);

		// graphic area is RECEIVING of mouse events
		addMouseMotionListener(this);
		addMouseListener(this);
	}

	public void draw() {
		repaint();   
	}

	public void paintComponent(Graphics g){

		super.paintComponent(g);

		((Graphics2D)g).setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

		Font helvetica12Normal = new Font("Helvetica",Font.PLAIN,12);
		g.setFont(helvetica12Normal);

		auto.drawGraphics(g, cDrawing);

		if (createTrans == true) {
			for (int k = 0; k < vPoints.size(); k = k + 1) {
				Point pointCt = (Point) vPoints.get(k);
				pointCt.drawPoint(g, Color.red);
			}
		}
	}
        
	public void createEntity(String label) {
		this.createEntity = true;
		this.label = label;
		int attribNum = auto.assignNo();
		entity = new Entity(attribNum, this.label, -100, -100/*, attribImSelected(), attribImNotSelected()*/);
		auto.addEnity(entity);
		selectNull();
		draw();
		menu.majMenus();
	}

	public void creatTrans(int threshold, int signe) {
		vPoints.removeAllElements();
		this.createTrans = true;
		this.threshold = threshold;
		this.sign = signe;
		bar.displayInfo("Click the gene origin");
		selectNull();
		draw();
		step = 0;
		menu.majMenus();
	}

	public void mouseMoved(MouseEvent e) {
	bar.displayCoor(e.getX(), e.getY());

		// Change l'apparence du curseur
		if ((deplacementEntity == false) && (deplacementPoint == false)) {
			int k; // compteur
			setCursor(cross);
			boolean inVoid=true;
			boolean state = false;
			for (k = 0; k < auto.vEntity.size(); k = k + 1) {
				Entity entityCt = (Entity) auto.vEntity.get(k);
				if (entityCt.zoneInfluence(e.getX(), e.getY()) == true && state == false) {
					setCursor(hand);
					if (bar.can == true) {
						bar.displayInfo("Gene " + entityCt.getLabel());
					}
					state = true;
					inVoid=false;
				}
				
			}
			if (state == false) {
				for (k = 0; k < auto.vTrans.size(); k = k + 1) {
					Trans transCt = (Trans) auto.vTrans.get(k);
					if ((transCt.zoneInfluence(e.getX(), e.getY()) == true) && (state == false)) {
						setCursor(hand);
						if (bar.can == true) {
							String sorte = "";
							if (transCt.getSign() == 1) {
								sorte = "activator";
							} else {
								sorte = "inhibitor";
							}
							bar.displayInfo("Transition " + sorte + " threshold " + Integer.toString(transCt.getThreshold()));
						}
						state = true;
						inVoid=false;
					}            
				}
			}
			if (inVoid){
				bar.displayInfo(mf.frameName);
			}
		}        

		if (createEntity == true) {
			entity.setX(e.getX());
			entity.setY(e.getY());
			draw();
		}
	}

	public void mouseDragged(MouseEvent e) {
		bar.displayCoor(e.getX(), e.getY());

		if (deplacementEntity == true) {
			Entity etapeCt = (Entity) auto.vEntity.get(entityDeplacee);
			int xDep = e.getX() - etapeCt.getX();
			int yDep = e.getY() - etapeCt.getY();
			etapeCt.setX(e.getX());
			etapeCt.setY(e.getY());
			int k;
			for (k = 0; k < auto.vTrans.size(); k = k + 1) {
				Trans transCt = (Trans) auto.vTrans.get(k);  
				if (transCt.getNumInitialEnt() == etapeCt.getNum()) {
					transCt.initailEntX = e.getX();
					transCt.initailEntY = e.getY();
					transCt.calculates();
				}
				if (transCt.getNumFinalEnt() == etapeCt.getNum()) {
					transCt.finalEntX = e.getX();
					transCt.finalEntY = e.getY();
					transCt.calculates();
				}
				if ((transCt.getNumInitialEnt() == etapeCt.getNum()) && (transCt.getNumFinalEnt() == etapeCt.getNum())) {
					transCt.finalEntX = e.getX();
					transCt.finalEntY = e.getY();
					transCt.initailEntX = e.getX();
					transCt.initailEntY = e.getY();
					for (int q = 0; q < transCt.points.size(); q = q + 1) {
						Point p  = (Point) transCt.points.get(q);
						p.x = p.x + xDep;
						p.y = p.y + yDep;  
					}
					transCt.calculates();
				}
			}
			draw();

		}

		if (deplacementPoint == true) {
			Trans transCt = (Trans) auto.vTrans.get(numTransPoint);
			Point p = (Point) transCt.points.get(posPoint);
			p.x = e.getX();
			p.y = e.getY();
		transCt.calculates();
			draw();
		}
	}

	public void mouseClicked(MouseEvent e) {

		if ((deplacementEntity == false) && (deplacementPoint == false) && (bar.can == true) && (SwingUtilities.isLeftMouseButton(e)) && (e.getClickCount() == 2)) {
			if (isEntitySelected == 1) {
				//bar.can = false;
				new EntityModifier(mf, this, auto, bar);
			} else if (isTransSelected == 1) {
				bar.can = false;
				new TransModifier(mf, this, auto, bar);
			}
		}

		// operations relatives � la cr�ation d'�tape
		if (this.createEntity == true) {
			this.createEntity = false;
			bar.can = true;
			int x = e.getX();
			int y = e.getY();
			entity.setY(x);
			entity.setY(y);
			bar.displayInfo(mf.frameName);
			selectEntity(entity);
			draw();
		}

		//operations on creating transitions
		if (this.createTrans == true) {
			if (step == 0) {
				int i;
				for (i = 0; i < auto.vEntity.size(); i = i + 1) {
					Entity etapeCt = (Entity) auto.vEntity.get(i);
					if (etapeCt.zoneInfluence(e.getX(), e.getY()) == true) {
						numInitialEnt = etapeCt.getNum();
						xInitialEntity = etapeCt.getX();
						yInitialEntity = etapeCt.getY();
						bar.displayInfo("Click on the gene arrived or the graphics area to add a point");
						step = 1;
					}
				}
			} else if (step == 1) {
				int i; //compteur
				boolean exit = false;
				for (i = 0; i < auto.vEntity.size(); i = i + 1) {
					Entity etapeCt = (Entity) auto.vEntity.get(i);
					if (etapeCt.zoneInfluence(e.getX(), e.getY()) == true) {
						numFinalEnt = etapeCt.getNum();
						xFinalEntity = etapeCt.getX();
						yFinalEntity = etapeCt.getY();
						Vector points = new Vector();
						int j;
						for (j = 0; j < vPoints.size(); j = j + 1) {
							Point pointCt = (Point) vPoints.get(j);
							points.add(pointCt);
						}

						if (numInitialEnt == numFinalEnt) {
							if (points.size() < 1) {
								int nbr = 0; // compteur
								for (j = 0; j < auto.vTrans.size(); j = j + 1) {
									Trans transLook = (Trans) auto.vTrans.get(j);
									if (transLook.getNumInitialEnt() == numInitialEnt) {
										if (transLook.getNumInitialEnt() == transLook.getNumFinalEnt()) {
											nbr = nbr + 1;
										}
									}
								}
								Point p1 = new Point(xInitialEntity - 16 - nbr * 7, yInitialEntity - 32 - nbr * 20);
								points.add(p1);   
								Point p2 = new Point(xInitialEntity + 16 + nbr * 7, yInitialEntity - 32 - nbr * 20);
								points.add(p2);
							}
						}
						trans = new Trans(sign, threshold, numInitialEnt, numFinalEnt, xInitialEntity, yInitialEntity, xFinalEntity, yFinalEntity, points);

                                                trans.calculates();
						createTrans = false;
						bar.can = true;
						bar.displayInfo(mf.frameName);
						auto.addTrans(trans);
						selectTrans(trans);
						draw();
						step = -1;                     
						exit = true;
					}
				}
				if (exit == false) {
					Point point = new Point(e.getX(), e.getY());
					vPoints.add(point);
					draw();
				}
			}
		}
		menu.majMenus();
	}

	public void mouseEntered(MouseEvent e) {
	}

	public void mouseExited(MouseEvent e) {
	}

	public void mousePressed(MouseEvent e) {
		if ((deplacementEntity == false) && (deplacementPoint == false) && (bar.can == true)) {
			int k;
			Graphics2D g = (Graphics2D) this.getGraphics();
			boolean etat = false;
			for (k = 0; k < auto.vEntity.size(); k = k + 1) {
				Entity etapeCt = (Entity) auto.vEntity.get(k);
				if ((etapeCt.zoneInfluence(e.getX(), e.getY()) == true) && (etat == false)) {
					selectEntity(etapeCt);
					etat = true;
				}
			}
			if (etat == false) {
				for (k = 0; k < auto.vTrans.size(); k = k + 1) {
					Trans transCt = (Trans) auto.vTrans.get(k);
					if ((transCt.zoneInfluence(e.getX(), e.getY()) == true) && (etat == false)) {
						selectTrans(transCt);
						etat = true;
					}       
				}
				if (etat == false) {
					selectNull();
				}
			}
			draw();

			etat = false;

			if (SwingUtilities.isRightMouseButton(e)) {
				for (k = 0; k < auto.vEntity.size(); k = k + 1) {
					Entity etapeCt = (Entity) auto.vEntity.get(k);
					if ((etapeCt.zoneInfluence(e.getX(), e.getY()) == true) && (etat == false)) {
						(menu.popupEntity).show(this,e.getX(), e.getY());
						etat = true;
					}
				}
				if (etat == false) {
					for (k = 0; k < auto.vTrans.size(); k = k + 1) {
						Trans transCt = (Trans) auto.vTrans.get(k);
						int m;
						for (m = 0; m < transCt.points.size(); m = m + 1) {
							Point p = (Point) transCt.points.get(m);
							if ((p.zoneInfluencePoint(e.getX(), e.getY()) == true) && (etat == false)) {
								(menu.popupPoint).show(this,e.getX(), e.getY());
								etat = true;
								numpoint = k;
								posTwoPoint = m;
							}
						}
					}
					if (etat == false) {
						for (k = 0; k < auto.vTrans.size(); k = k + 1) {
							Trans transCt = (Trans) auto.vTrans.get(k);
							if ((transCt.zoneInfluence(e.getX(), e.getY()) == true) && (etat == false)) {
								(menu.popupTrans).show(this,e.getX(), e.getY());
								pointX = e.getX();
								pointY = e.getY();
								addTransPoint = transCt;
								etat = true;
							}
						}
						if (etat == false) {
							(menu.popupNull).show(this,e.getX(), e.getY());
						}
					}
				}
			} else {
				for (k = 0; k < auto.vEntity.size(); k = k + 1) {
					Entity etapeCt = (Entity) auto.vEntity.get(k);
					if (etapeCt.zoneInfluence(e.getX(), e.getY()) == true) {
						deplacementEntity = true;
						bar.can = false;
						entityDeplacee = k;
						setCursor(move);
						bar.displayInfo("Drag to move, release to fix");
					}
				}
				for (k = 0; k < auto.vTrans.size(); k = k + 1) {
					Trans transCt = (Trans) auto.vTrans.get(k);
					int m;
					for (m = 0; m < transCt.points.size(); m = m + 1) {
						Point p = (Point) transCt.points.get(m);
						if (p.zoneInfluencePoint(e.getX(), e.getY()) == true) {
							deplacementPoint = true;
							bar.can = false;
							numTransPoint = k;
							posPoint = m;
							setCursor(move);
							bar.displayInfo("Drag to move, release to fix");
						}
					}
				}
			}
		}
		menu.majMenus();
	}

	public void mouseReleased(MouseEvent e) {

		if (deplacementEntity == true) {
			deplacementEntity = false;
			setCursor(cross);
			auto.modif(true);
			bar.can = true;
			bar.displayInfo(mf.frameName);
		}

		if (deplacementPoint == true) {
			auto.modif(true);
			deplacementPoint = false;
			Trans transCt = (Trans) auto.vTrans.get(numTransPoint);
			Point p = (Point) transCt.points.get(posPoint);
			p.x = e.getX();
			p.y = e.getY();
                        transCt.calculates();
			draw();
			setCursor(cross);
			bar.can = true;
			bar.displayInfo(mf.frameName);
		}
		menu.majMenus();
	}

	public void actionPerformed(ActionEvent e) {
	}

	public void selectEntity(Entity e) {
		if (isEntitySelected == 1) {
			entitySelected.selected = 0;
		}
		if (isTransSelected == 1) {
			transSelected.selected = 0;
			isTransSelected = 0;
		}
		isEntitySelected = 1;
		entitySelected = e;
		entitySelected.selected = 1;
		menu.majMenus();
	}

	public void selectTrans(Trans t) {
		if (isEntitySelected == 1) {
			entitySelected.selected = 0;
			isEntitySelected = 0;
		}
		if (isTransSelected == 1) {
			transSelected.selected = 0;
		}
		isTransSelected = 1;
		transSelected = t;
		transSelected.selected = 1;
		menu.majMenus();
	}

	public void selectNull() {
		if (isEntitySelected == 1) {
			entitySelected.selected = 0;
			isEntitySelected = 0;
		}
		if (isTransSelected == 1) {
			transSelected.selected = 0;
			isTransSelected = 0;
		}
		menu.majMenus();
	}

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
}



