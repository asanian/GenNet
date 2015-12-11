/*
 * MenuEditer.java
 *
 * Version 1.0
 *
 * Created on 27 avril 2004, 13:59
 */


import java.io.*;
import java.awt.*;

import javax.swing.*;

import java.awt.event.*;
import java.util.*;

import javax.swing.filechooser.*;
import javax.swing.JOptionPane;
import javax.swing.JDialog;
import javax.swing.JButton;
import javax.swing.JRadioButton;
import javax.swing.ButtonGroup;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import javax.swing.BoxLayout;
import javax.swing.Box;
import javax.swing.BorderFactory;
import javax.swing.border.Border;
import javax.swing.JTabbedPane;
import javax.swing.JPanel;
import javax.swing.JFrame;

import java.beans.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.image.BufferedImage;

import javax.swing.Timer;

import java.util.Properties;
import java.lang.Math;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Thjs class contajns the appljcatjon menu
 *
 * @version 1.0
 * @author  Oljvjer Mansjon
 */
public class MenuEditer extends JMenuBar implements ActionListener, MouseListener, MouseMotionListener {

	// a StatusBar parameter in order to display information in response to the events of mouse movements
	private StateBar bar;

	// representation de l'automate
	private Automate auto;
	Automate saveAuto=new Automate();
	// zone graphique
	private GraphicZone graphicZone;
	public BufferedImage image;

	//Fenetre prncipale
	MainFrame mf;
	// Variables analyzed for orders// Jamil Ahmad
	/*---------------------------------------------------------*/
	public  boolean  rf;
	public  boolean cyc, twocyc, pat, exi, ent, stasta, nonstasta ;
	public int fs,ls;

	public String strcom, par,fc,lc,inivar;
	Combination comb;
	public HashMap<Vector, LinkedList<Vector>> Lines ; //addition lines, can find cycles
	/*-------------------------------------------------------*/
	// le conteneur
	Container container;

	// menu fichier
	JMenu menuFile;
	JMenuItem New;
	JMenuItem Open;
	JMenuItem Save;
	JMenuItem SaveAs;
	JMenuItem ExportToDot;
	JMenuItem ExportToHytech;
	JMenuItem StateGraph;
	JMenuItem Print;
	JMenuItem Exit;

	// menu entities
	JMenu menuEntities;
	JMenuItem newEntity;
	JMenuItem dltEntity;
	JMenuItem modifyEntity;

	// menu transitions
	JMenu menuTrans;
	JMenuItem newTrans;
	JMenuItem dltTrans;
	JMenuItem modifyTrans;

	// menu pipline
	JMenu menuPipe;
	JMenuItem strtPipe;

	// menu parameteres
	JMenu menuParameters;
	JMenuItem assignDefaultParam;
	JMenuItem saveParam;

	// menu ?
	JMenu menuHelp;
	JMenuItem Help;
	JMenuItem about;

	// popup menu
	JPopupMenu popupEntity;
	JMenuItem popupDltEntity;
	JMenuItem popupEntityProp;

	JPopupMenu popupTrans;
	JMenuItem popupDltTrans;
	JMenuItem popTransProp;
	JMenuItem popTransAddPoint;

	JPopupMenu popupPoint;
	JMenuItem popupPointDlt;

	JPopupMenu popupNull;
	JMenuItem popupNewEntity;
	JMenuItem popupNewTrans;
	JMenuItem popupUndo;

	// file chooser
	JFileChooser fileChooser;

	Timer time;
	boolean test = true;
	String destination;

	/**
	 * Cr�e une nouvelle jnstance de MenuEdjteur
	 * @param mf fenetre prjncjpale de l'appljcatjon
	 * @param auto automate de l'appljcatjon
	 * @param bar barre d'�tat
	 * @param zg zone graphjque
	 * @param ct Contajner de la fenetre prjncjpale
	 */
	public MenuEditer(MainFrame mf, Automate auto, StateBar bar, GraphicZone zg, Container ct) {

		this.auto = auto;
		this.bar = bar;
		this.graphicZone = zg;
		this.mf = mf;
		this.container = ct;
		Lines=new HashMap<Vector, LinkedList<Vector>>();
		addMouseListener(this);
		addMouseMotionListener(this);

		// on cr�e le menu fichier
		menuFile = new JMenu("File");
		menuFile.setMnemonic(KeyEvent.VK_F);   

		New = new JMenuItem("New");
		New.setMnemonic(KeyEvent.VK_N);
		New.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_N, ActionEvent.CTRL_MASK));
		New.addActionListener(this);
		New.addMouseListener(this);

		Open = new JMenuItem("Open");
		Open.setMnemonic(KeyEvent.VK_O);
		Open.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_O, ActionEvent.CTRL_MASK));
		Open.addActionListener(this);
		Open.addMouseListener(this);

		Save = new JMenuItem("Save");
		Save.setMnemonic(KeyEvent.VK_E);
		Save.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_E, ActionEvent.CTRL_MASK));
		Save.addActionListener(this);
		Save.addMouseListener(this);

		SaveAs = new JMenuItem("Save As...");
		SaveAs.setMnemonic(KeyEvent.VK_S);
		SaveAs.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_S, ActionEvent.CTRL_MASK));
		SaveAs.addActionListener(this);
		SaveAs.addMouseListener(this);


		//****************
		ExportToDot = new JMenuItem("Export to Dot format");
		ExportToDot.setMnemonic(KeyEvent.VK_D);
		ExportToDot.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_D, ActionEvent.CTRL_MASK));
		ExportToDot.addActionListener(this);
		ExportToDot.addMouseListener(this);

		StateGraph = new JMenuItem("State graph");
		StateGraph.setMnemonic(KeyEvent.VK_G);
		StateGraph.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_G, ActionEvent.CTRL_MASK));
		StateGraph.addActionListener(this);
		StateGraph.addMouseListener(this);
		//****************

		ExportToHytech = new JMenuItem("Export to Hytech format");
		ExportToHytech.setMnemonic(KeyEvent.VK_H);
		ExportToHytech.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_H, ActionEvent.CTRL_MASK));
		ExportToHytech.addActionListener(this);
		ExportToHytech.addMouseListener(this);

		Print = new JMenuItem("Print");
		Print.setMnemonic(KeyEvent.VK_I);
		Print.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_I, ActionEvent.CTRL_MASK));
		Print.addActionListener(this);
		Print.addMouseListener(this);


		Exit = new JMenuItem("Exit");
		Exit.setMnemonic(KeyEvent.VK_Q);
		Exit.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Q, ActionEvent.CTRL_MASK));
		Exit.addActionListener(this);
		Exit.addMouseListener(this);

		menuFile.add(New);
		menuFile.addSeparator();
		menuFile.add(Open);
		menuFile.addSeparator();
		menuFile.add(Save);
		menuFile.add(SaveAs);
		menuFile.addSeparator();
		menuFile.add(ExportToDot);
		menuFile.add(ExportToHytech);
		menuFile.addSeparator();		
		menuFile.add(StateGraph);
		menuFile.addSeparator();
		menuFile.add(Print);
		menuFile.addSeparator();
		menuFile.add(Exit);

		this.add(menuFile);
		menuFile.addMouseListener(this);

		// on cr�e le menu etapes
		menuEntities = new JMenu("Gene");
		menuEntities.setMnemonic(KeyEvent.VK_G);

		newEntity = new JMenuItem("New");
		newEntity.setMnemonic(KeyEvent.VK_N);
		newEntity.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_A, ActionEvent.CTRL_MASK));
		newEntity.addActionListener(this);
		newEntity.addMouseListener(this);

		dltEntity = new JMenuItem("Delete");
		dltEntity.setMnemonic(KeyEvent.VK_S);
		dltEntity.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_B, ActionEvent.CTRL_MASK));
		dltEntity.addActionListener(this);
		dltEntity.addMouseListener(this);

		modifyEntity = new JMenuItem("Proprerties");
		modifyEntity.setMnemonic(KeyEvent.VK_P);
		modifyEntity.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_C, ActionEvent.CTRL_MASK));
		modifyEntity.addActionListener(this);
		modifyEntity.addMouseListener(this);

		menuEntities.add(newEntity);
		menuEntities.add(dltEntity);
		menuEntities.addSeparator();
		menuEntities.add(modifyEntity);

		this.add(menuEntities);
		menuEntities.addMouseListener(this);

		// on cr�e le menu transitions
		menuTrans = new JMenu("Interaction");
		menuTrans.setMnemonic(KeyEvent.VK_I);

		newTrans = new JMenuItem("New");
		newTrans.setMnemonic(KeyEvent.VK_N);
		newTrans.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_T, ActionEvent.CTRL_MASK));
		newTrans.addActionListener(this);
		newTrans.addMouseListener(this);

		dltTrans = new JMenuItem("Delete");
		dltTrans.setMnemonic(KeyEvent.VK_S);
		dltTrans.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_U, ActionEvent.CTRL_MASK));
		dltTrans.addActionListener(this);
		dltTrans.addMouseListener(this);

		modifyTrans = new JMenuItem("Proprerties");
		modifyTrans.setMnemonic(KeyEvent.VK_P);
		modifyTrans.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_V, ActionEvent.CTRL_MASK));
		modifyTrans.addActionListener(this);
		modifyTrans.addMouseListener(this);   

		menuTrans.add(newTrans);
		menuTrans.add(dltTrans);
		menuTrans.addSeparator();
		menuTrans.add(modifyTrans);

		this.add(menuTrans);
		menuTrans.addMouseListener(this);

		menuPipe = new JMenu("Pipline");
		menuPipe.setMnemonic(KeyEvent.VK_N);

		strtPipe = new JMenuItem("Start Piplining");
		strtPipe.setMnemonic(KeyEvent.VK_P);
		strtPipe.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_P, ActionEvent.CTRL_MASK));
		strtPipe.addActionListener(this);
		strtPipe.addMouseListener(this);

		menuPipe.add(strtPipe);
		this.add(menuPipe);
		menuPipe.addMouseListener(this);
		menuPipe.addActionListener(this);

		menuParameters = new JMenu("Parameters");
		menuParameters.setMnemonic(KeyEvent.VK_P);

		assignDefaultParam = new JMenuItem("Assign default parameters");
		assignDefaultParam.setMnemonic(KeyEvent.VK_D);
		assignDefaultParam.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_D, ActionEvent.CTRL_MASK));
		assignDefaultParam.addActionListener(this);
		assignDefaultParam.addMouseListener(this);

		saveParam = new JMenuItem("Save parameters");
		saveParam.setMnemonic(KeyEvent.VK_L);
		saveParam.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_L, ActionEvent.CTRL_MASK));
		saveParam.addActionListener(this);
		saveParam.addMouseListener(this);

		menuParameters.add(assignDefaultParam);
		menuParameters.add(saveParam);

		this.add(menuParameters);
		menuParameters.addMouseListener(this);


		// on cr�e le menu ?
		menuHelp = new JMenu("Help");
		menuHelp.setMnemonic(KeyEvent.VK_H);

		Help = new JMenuItem("Help");
		Help.setMnemonic(KeyEvent.VK_I);
		Help.addActionListener(this);
		Help.addMouseListener(this);

		about = new JMenuItem("About");
		about.setMnemonic(KeyEvent.VK_A);
		about.addActionListener(this);
		about.addMouseListener(this);

		//menuHelp.add(Help);
		//menuHelp.addSeparator();
		menuHelp.add(about);

		this.add(menuHelp);
		menuHelp.addMouseListener(this);

		//definition des menus popups
		popupEntity = new JPopupMenu();
		popupDltEntity = new JMenuItem("Delete");
		popupDltEntity.addActionListener(this);
		popupDltEntity.addMouseListener(this);
		popupEntity.add(popupDltEntity);
		popupEntity.addSeparator();
		popupEntityProp = new JMenuItem("Properties");
		popupEntityProp.addActionListener(this);
		popupEntityProp.addMouseListener(this);
		popupEntity.add(popupEntityProp);

		popupTrans = new JPopupMenu();
		popupDltTrans = new JMenuItem("Delete");
		popupDltTrans.addActionListener(this);
		popupDltTrans.addMouseListener(this);
		popupTrans.add(popupDltTrans);
		popupTrans.addSeparator();
		popTransProp = new JMenuItem("Properties");
		popTransProp.addActionListener(this);
		popTransProp.addMouseListener(this);
		popupTrans.add(popTransProp);
		popupTrans.addSeparator();
		popTransAddPoint = new JMenuItem("Insert a point");
		popTransAddPoint.addActionListener(this);
		popTransAddPoint.addMouseListener(this);
		popupTrans.add(popTransAddPoint);  

		popupPoint = new JPopupMenu();
		popupPointDlt = new JMenuItem("Delete a point");
		popupPointDlt.addActionListener(this);
		popupPointDlt.addMouseListener(this);
		popupPoint.add(popupPointDlt);  

		popupNull = new JPopupMenu();
		popupNewEntity = new JMenuItem("New gene/protein");
		popupNewEntity.addActionListener(this);
		popupNewEntity.addMouseListener(this);
		popupNull.add(popupNewEntity);
		popupNull.addSeparator();
		popupNewTrans = new JMenuItem("New interaction");
		popupNewTrans.addActionListener(this);
		popupNewTrans.addMouseListener(this);
		popupNull.add(popupNewTrans);       
		popupNull.addSeparator();
		popupUndo = new JMenuItem("Undo");
		popupUndo.addActionListener(this);
		popupUndo.addMouseListener(this);
		popupNull.add(popupUndo);       

		majMenus();
	}

	/**
	 * djff�rentes acontajnerjons r�aljs�es sujvant le cljc de l'utjljsateur sur le menu
	 * @param e evenement declench� par le cljc de la sourjs
	 */    

	public String SaveAs()
	{
		String path="";
		bar.can = false;
		bar.displayInfo("Saving  file");
		//fileChooser = new JFileChooser();
		//fileChooser.addChoosableFileFilter(new FiltreXml());
		//int returnVal = fileChooser.showSaveDialog(this.graphicZone);
		//if (returnVal == JFileChooser.APPROVE_OPTION) 
		//{
		File file =new File("GRN.xml");// fileChooser.getSelectedFile();
		WriteFile m = new WriteFile();
		path=destination = file.getAbsolutePath();
		m.writeFile(destination, auto);
		m.treatment();
		test = false;
		mf.frameName = file.getName();
		bar.displayInfo(mf.frameName);
		auto.modif(false);
		//}
		bar.can = true;
		majMenus();
		return path;
	}

	public void actionPerformed(ActionEvent e) {
		Object source = e.getSource();
		if (bar.can == true) { 
			if (source == New) {
				bar.can = false;
				boolean modif = auto.getModif();
				if (modif == false) {
					auto.deleteEntity();
					auto.deleteTrans();
					graphicZone.draw();

					mf.frameName = "New document";
					bar.displayInfo(mf.frameName);
					test = true;
				} else {
					int n = JOptionPane.showConfirmDialog(this.mf, "The current document has not been saved since the last modification.\nYou want to continue ?","New document",JOptionPane.YES_NO_OPTION);
					if (n == JOptionPane.YES_OPTION) {
						auto.deleteEntity();
						auto.deleteTrans();
						graphicZone.draw();
						mf.frameName = "New document";
						bar.displayInfo(mf.frameName);
						test = true;
					} 					
				}
				bar.can = true;
				majMenus();
			} else if (source == Open) {
				bar.can = false;
				bar.displayInfo("Opening a file");
				boolean modif = auto.getModif();
				if(Global.pipe)
				{
					System.out.println("Opening");
					opening();
				}
				else
				{

					if (modif == false) {
						fileChooser = new JFileChooser();
						fileChooser.addChoosableFileFilter(new FiltreXml());
						int returnVal = fileChooser.showOpenDialog(this.mf);
						if (returnVal == JFileChooser.APPROVE_OPTION) {
							opening();
						} 
					} else {
						int n = JOptionPane.showConfirmDialog(this.mf, "The current document has not been saved since the last modification.\nYou want to continue ?","New document",JOptionPane.YES_NO_OPTION);
						if (n == JOptionPane.YES_OPTION) {
							fileChooser = new JFileChooser();
							fileChooser.addChoosableFileFilter(new FiltreXml());
							int returnVal = fileChooser.showOpenDialog(this.mf);
							if (returnVal == JFileChooser.APPROVE_OPTION) {
								opening();// opening
							} 
						}
					}
				}
				bar.can = true;                  
				graphicZone.revalidate();				
				majMenus();
			} else if ((source == Save) && (test == false)) {
				bar.can = false;
				bar.displayInfo("Saving file");
				WriteFile m = new WriteFile();
				m.writeFile(destination, auto);
				m.treatment();
				bar.displayInfo(mf.frameName);
				bar.can = true;
				auto.modif(false);
				majMenus();
			} 
			else if ((source == SaveAs) || ((source == Save) && (test))) 
			{
				SaveAs();
				//				Save the file to Dot
			} else if ((source == ExportToDot)) {
				bar.can = false;
				bar.displayInfo("Saving file in Dot format");
				fileChooser = new JFileChooser();
				fileChooser.addChoosableFileFilter(new FiltreDot());
				int returnVal = fileChooser.showSaveDialog(this.graphicZone);
				if (returnVal == JFileChooser.APPROVE_OPTION) {
					File file = fileChooser.getSelectedFile();
					FileGen m = new FileGen();
					destination = file.getAbsolutePath();
					Utils extension = new Utils();
					if (extension.getExtension(file) == null) {
						destination = destination + ".dot";
					}
					m.writeDotAutomate(destination, auto);
					m.treatmentDotAutomate();
					test = false;
					mf.frameName = file.getName();
					bar.displayInfo(mf.frameName);
					auto.modif(false);
				}
				bar.can = true;
				majMenus();

				//pour convertir le fichier en Hytech
			} 
			// Kanwal Naz
			else if((source== assignDefaultParam))
			{
				bar.can = false;
				auto.setParameters();
				bar.displayInfo("Assign Default Value");
				bar.can = true;
				majMenus();

			}
			else if(source== saveParam){
				fileChooser = new JFileChooser();
				fileChooser.addChoosableFileFilter(new FiltreDot());
				int returnVal = fileChooser.showSaveDialog(this.graphicZone);
				if (returnVal == JFileChooser.APPROVE_OPTION) {
					File file = fileChooser.getSelectedFile();
					FileGen m = new FileGen();
					destination = file.getAbsolutePath();
					Utils extension = new Utils();
					if (extension.getExtension(file) == null) {
						destination = destination + ".txt";
					}
					WriteFile f = new WriteFile();
					f.writeFile(destination, auto);
					f.writeParams();

					mf.frameName = file.getName();
					bar.displayInfo("Save all Parameters");

				}


			}

			else if ((source == ExportToHytech)) {
				bar.can = false;
				bar.displayInfo("Saving in Hytech format");
				sauvegardeHytech(false);	
				bar.displayInfo(mf.frameName);
				bar.can = true;

				// Pour generer le graphe d'etats || to generate the state graph
			} else if ((source == StateGraph)) {
				bar.can = false;
				bar.displayInfo("Generating state graph");				
				String destination1="temporaire.hy";
				String destination2="temporaire.txt";
				File file=new File(destination1);
				try {
					PrintWriter printWriter = new PrintWriter(new FileWriter(destination1));
					PrintWriter printWriter2 = new PrintWriter(new FileWriter(destination2));
					calculate(true, file, printWriter, printWriter2);
					File f = new File(destination1);
					f.delete();
					File f2 = new File(destination2);
					f2.delete();

				} catch (Exception e1) {	
					e1.printStackTrace();
				}				
				bar.displayInfo(mf.frameName);
				bar.can = true;
			}
			// Pour Print...
			else if (source == Print){
				bar.can = false;
				bar.displayInfo("Printing Interation graph...");

				new Printer(this.graphicZone, "Interation graph: "+mf.frameName);

				bar.can = true;
				bar.displayInfo(mf.frameName);
				majMenus();

			} else if (source == Exit) {
				int n = JOptionPane.showConfirmDialog(this.mf, "The cuurent document has not backup since the last modification \n Do you want to continue ?","Exit",JOptionPane.YES_NO_OPTION);
				if (n == JOptionPane.YES_OPTION) {
					System.exit(0);
				}
				bar.can = true;
				majMenus();
			} else if ((source == newEntity) || (source == popupNewEntity)) {
				bar.can = false;
				new EntityCreator(mf, graphicZone, auto, bar);
				majMenus();				
				bar.can = true;				
			} 
			else if (source== popupUndo){
				//  this.auto.deleteAutomata();
				//graphicZone.draw();
				//   this.auto=new Automate(saveAuto);
				//   this.auto.toString();
				this.undo();
				graphicZone.revalidate();
				majMenus();
			}

			else if ((source == dltEntity) || (source == popupDltEntity)) {

				saveDeletedAutomata();
				if (graphicZone.isEntitySelected == 1) {

					int num = graphicZone.entitySelected.getNum();
					graphicZone.selectNull();
					auto.modif = true;
					auto.removeEntity(num);// kanwal
					auto.toString();
					graphicZone.draw();
				} else {
					JOptionPane.showMessageDialog(this.mf, "No selected gene .", "Deleting a gene", JOptionPane.WARNING_MESSAGE);
				}
				majMenus();
			} else if ((source == modifyEntity) || (source == popupEntityProp)) {				
				bar.can = false;


				if (graphicZone.isEntitySelected == 0) {
					JOptionPane.showMessageDialog(this.mf, "No selected gene  .", "Properties of a gene", JOptionPane.WARNING_MESSAGE);
				} else {
					new EntityModifier(mf, graphicZone, auto, bar);				
				}	
				bar.can = true;
				majMenus();								
			} else if ((source == newTrans) || (source == popupNewTrans)) {
				bar.can = false;
				if (this.auto.vEntity.size() < 1) {
					JOptionPane.showMessageDialog(this.mf, "There must be at least one state for creating a transition", "Adding a transition", JOptionPane.WARNING_MESSAGE);
				} else {
					new TransCreator(mf, graphicZone, auto, bar);
				}
				bar.can = true;
				majMenus();
			} else if ((source == dltTrans) || (source == popupDltTrans)) {
				if (graphicZone.isTransSelected == 1) {
					graphicZone.selectNull();
					auto.modif = true;
					int i, j;
					for (i = 0; i < auto.vTrans.size(); i = i + 1) {
						Trans transCt = (Trans) auto.vTrans.get(i);
						if (transCt == graphicZone.transSelected) {
							auto.removeTransAt(i);
						}
					}
					graphicZone.draw();
				} else {
					JOptionPane.showMessageDialog(this.mf, "No selected interaction.", "Deleting an interaction", JOptionPane.WARNING_MESSAGE);
				}
				majMenus();
			} else if ((source == modifyTrans) || (source == popTransProp)) {
				bar.can = false;
				if (graphicZone.isTransSelected == 0) {
					JOptionPane.showMessageDialog(this.mf, "No selected interaction.", "Properties of an interaction", JOptionPane.WARNING_MESSAGE);
				} else {
					new TransModifier(mf, graphicZone, auto, bar);		
				}
				bar.can = true;
				majMenus();
			} else if (source == popupPointDlt) {
				auto.modif = true;
				(((Trans)(auto.vTrans.get(graphicZone.numpoint))).points).removeElementAt(graphicZone.posTwoPoint);
				((Trans)auto.vTrans.get(graphicZone.numpoint)).calculates();
				graphicZone.draw();
				majMenus();
			} else if (source == popTransAddPoint) {
				Trans transCt = graphicZone.addTransPoint;
				Point point = new Point(graphicZone.pointX, graphicZone.pointY);
				Point memoire = new Point(-100, -100);
				boolean affecte = false;
				int i = 0;
				int numPoint = 0;
				while (affecte == false) {
					int x = (int)Math.round(transCt.plot.get(i,0));
					int y = (int)Math.round(transCt.plot.get(i,1));
					if ((graphicZone.pointX >= x - 5) && (graphicZone.pointX <= x + 5) && (graphicZone.pointY >= y - 5) && (graphicZone.pointY <= y + 5)) {
						if (numPoint == transCt.points.size()) {
							transCt.points.add(point);
						} else {
							transCt.points.insertElementAt(point, numPoint);
						}
						affecte = true;
					}
					if ((affecte == false) && (transCt.points.size() > numPoint)) {
						Point pointCt = (Point) transCt.points.get(numPoint);
						if ((pointCt.x >= x - 5) && (pointCt.x <= x + 5) && (pointCt.y >= y - 5) && (pointCt.y <= y + 5) && (pointCt != memoire)) {
							numPoint++;
							memoire = pointCt;
						}
					}
					i++;
				}
				auto.modif = true;
				transCt.calculates();
				graphicZone.draw();
				majMenus();
			} else if (source == Help) {
				Properties sys = System.getProperties();
				String os = sys.getProperty("os.name");
				Runtime r = Runtime.getRuntime();
				String sep = java.io.File.separator;
				try {	
					if (os.endsWith("NT")||os.endsWith("2000")||os.endsWith("XP")||os.endsWith("Vista")) {
						r.exec("cmd /c start " + getClass().getResource("Tuto_Genotech.pdf"));

					} 
					else {						
						r.exec("start " + getClass().getResource("Tuto_Genotech.pdf"));
					}
				}
				catch (IOException ex) {
				}
				majMenus();
			}
			if (source == about) {
				new About();
			}
			else if(source == strtPipe)
			{
				Thread t1 = new Thread(new Runnable() {
					public void run()
					{					
						mf.output(SaveAs());
					}});  t1.start();

			}
		} else {
			JOptionPane.showMessageDialog(this.mf, "Operation is already in process.\nPlease wait.", "Operation in process", JOptionPane.WARNING_MESSAGE);
		}
		majMenus();
	}


	/**
	 * permet d'affjcher les djff�rentes jnformatjons dans la barre d'�tat
	 * @param e evenement d�clench� par l'entr�e de la sourjs sur un menu
	 */    
	public void mouseEntered(MouseEvent e) {
		Object source = e.getSource();
		if (source == New) {
			bar.displayInfo("Creat a New document");
		} else if (source == Open) {
			bar.displayInfo("Open an exisisting file");   
		} else if (source == Save) {
			bar.displayInfo("Save the current file");
		} else if (source == SaveAs) {
			bar.displayInfo("Save the current file As");
		} else if (source == ExportToDot) {
			bar.displayInfo("Save the file in Dot format");
		} else if (source == ExportToHytech) {
			bar.displayInfo("Save the file in Hytech format");
		} else if (source == StateGraph) {
			bar.displayInfo("State graph");
		} else if (source == Exit) {
			bar.displayInfo("Close the application");
		} else if ((source == newEntity) || (source == popupNewEntity)) {
			bar.displayInfo("Create a new gene");
		} else if ((source == dltEntity) || (source == popupDltEntity)) {
			bar.displayInfo("Delete  a selected gene");
		} else if ((source == modifyEntity) || (source == popupEntityProp)) {
			bar.displayInfo("Show the properties of a selected gene");
		} else if ((source == newTrans) || (source == popupNewTrans)) {
			bar.displayInfo("Create a New interaction");
		} else if ((source == dltTrans) || (source == popupDltTrans)) {
			bar.displayInfo("Delete  the selected interaction");
		} else if ((source == modifyTrans) || (source == popTransProp)) {
			bar.displayInfo("Show the properties of a selected interaction");
		}else if(source== assignDefaultParam){
			bar.displayInfo("assign Default Parameters to BRN");
		} 
		else if(source== saveParam){
			bar.displayInfo("Save parameters in a file");
		}
		else if (source == Help) {
			bar.displayInfo("Display User Guide");
		} else if (source == about) {
			bar.displayInfo("Show the properties of program");
		} else if (source == popupPointDlt) {
			bar.displayInfo("Delete a selected point ");
		} else if (source == popTransAddPoint) {
			bar.displayInfo("Insert a point on the selected interaction");
		}
		else if (source == strtPipe||source==menuPipe) {
			bar.displayInfo("Start piplining tools...");
		}
	}

	/**
	 * resets to jts jnjtjal state the status bar
	 * @param e event trjggered by the output of the mouse menu
	 */    
	public void mouseExited(MouseEvent e) {}

	// finds levels
	public LinkedList<Integer> findLevels(){
		LinkedList<Integer> level=new LinkedList<Integer>();
		for (int i=0; i<auto.vEntity.size(); i++)
		{
			level.add(0);
		}
		for (int i=0; i<auto.vTrans.size(); i++)
		{
			int Actual=((Trans) auto.vTrans.get(i)).getNumInitialEnt()-1;
			int Valeur=Math.abs(((Trans) auto.vTrans.get(i)).getThreshold());
			int Value=level.get(Actual);
			if (Valeur>Value)
			{
				level.set(Actual, Valeur);
			}
		}

		return level;
	}

	public void mouseClicked(MouseEvent e) {
	} 

	public void mousePressed(MouseEvent e) {
	}

	public void mouseReleased(MouseEvent e) {  
	}  

	public void mouseDragged(MouseEvent e) {
	}

	public void mouseMoved(MouseEvent e) { 
	}
	// opening
	public void opening() {
		auto.deleteAutomata();
		File file =Global.pipe?new File("GRN.xml"):fileChooser.getSelectedFile();		
		test = false ;
		destination = file.getAbsolutePath();

		ReadXML m = new ReadXML(destination, auto, this.graphicZone);
		m.parse();
		for(int a=0;a<m.gz.auto.vTrans.size();a++)
			System.out.println("Size of points........................"+((Trans) m.auto.vTrans.get(a)).points.size());
		mf.frameName = file.getName();
		bar.displayInfo(mf.frameName);
		//    System.out.println("..............In MenuEditer......................");
		int maxX = 0;
		int maxY = 0;
		for ( int i = 0; i < auto.vEntity.size(); i++) {
			Entity entityCt = (Entity) auto.vEntity.get(i);
			if (entityCt.getX() > maxX) {
				maxX = entityCt.getX();
			}
			if (entityCt.getY() > maxY) {
				maxY = entityCt.getY();
			}
		}
		//     System.out.println("maxX of Entity: "+maxX + "and maxY of Entity:"+maxY);
		for (int i = 0; i < auto.vTrans.size(); i++)  {
			Trans transCt = (Trans) auto.vTrans.get(i);


			transCt.calculates();
			for (int j = 0; j < transCt.points.size(); j++) {
				Point p = (Point) transCt.points.get(j);
				if (p.x > maxX) {
					maxX = p.x;
				}
				if (p.y > maxY) {
					maxY = p.y;
				}
			}
			//  System.out.println("maxX of Point: "+maxX + "and maxY of Point:"+maxY);
		}

		for (int i = 0; i < auto.vTrans.size(); i = i + 1)  {
			Trans transCt = (Trans) auto.vTrans.get(i);
			for (int j = 0; j < transCt.plot.getRowDimension(); j = j + 1) {
				if ((int)Math.round(transCt.plot.get(j,0)) > maxX) {
					maxX = (int)Math.round(transCt.plot.get(j,0));
				}
			}
			for (int j = 0; j < transCt.plot.getColumnDimension(); j = j + 1) {
				if ((int)Math.round(transCt.plot.get(j,1)) > maxY) {
					maxY = (int)Math.round(transCt.plot.get(j,1));
				}
			}
		}
		int abs = maxX + 60;
		int ord = maxY + 60;
		int vuX = mf.x;
		int vuY = mf.y;
		if (abs <= vuX) {
			if (ord <= vuY) {
				graphicZone.setPreferredSize(new Dimension(vuX - 3, vuY)); 
				graphicZone.revalidate();
			} else {
				graphicZone.setPreferredSize(new Dimension(vuX - 3, ord)); 
				graphicZone.revalidate();
			}
		} else {
			if (ord <= vuY) {
				graphicZone.setPreferredSize(new Dimension(abs, vuY)); 
				graphicZone.revalidate();
			} else {
				graphicZone.setPreferredSize(new Dimension(abs, ord)); 
				graphicZone.revalidate();
			}
		}

		graphicZone.draw();
		test = false;
		auto.modif(false);
	}


	public void saveDeletedAutomata(){
		WriteFile m = new WriteFile();
		m.clearFile();
		m.writeFile("Deleted.XML", auto);
		m.treatment();
	}
	public void undo() {
		auto.deleteAutomata();
		ReadXML m = new ReadXML("Deleted.XML", auto, this.graphicZone);
		m.parse();
		int maxX = 0;
		int maxY = 0;

		for ( int j = 0; j < auto.vEntity.size(); j++) {
			Entity entityCt = (Entity) auto.vEntity.get(j);
			if (entityCt.getX() > maxX) {
				maxX = entityCt.getX();
			}
			if (entityCt.getY() > maxY) {
				maxY = entityCt.getY();
			}
		}
		//     System.out.println("maxX of Entity: "+maxX + "and maxY of Entity:"+maxY);
		for (int i = 0; i < auto.vTrans.size(); i++)  {
			Trans transCt = (Trans) auto.vTrans.get(i);


			transCt.calculates();
			for (int j = 0; j < transCt.points.size(); j++) {
				Point p = (Point) transCt.points.get(j);
				if (p.x > maxX) {
					maxX = p.x;
				}
				if (p.y > maxY) {
					maxY = p.y;
				}
			}
			//  System.out.println("maxX of Point: "+maxX + "and maxY of Point:"+maxY);
		}

		for (int i = 0; i < auto.vTrans.size(); i = i + 1)  {
			Trans transCt = (Trans) auto.vTrans.get(i);
			for (int j = 0; j < transCt.plot.getRowDimension(); j = j + 1) {
				if ((int)Math.round(transCt.plot.get(j,0)) > maxX) {
					maxX = (int)Math.round(transCt.plot.get(j,0));
				}
			}
			for (int j = 0; j < transCt.plot.getColumnDimension(); j = j + 1) {
				if ((int)Math.round(transCt.plot.get(j,1)) > maxY) {
					maxY = (int)Math.round(transCt.plot.get(j,1));
				}
			}
		}
		int abs = maxX + 60;
		int ord = maxY + 60;
		int vuX = mf.x;
		int vuY = mf.y;
		if (abs <= vuX) {
			if (ord <= vuY) {
				graphicZone.setPreferredSize(new Dimension(vuX - 3, vuY)); 
				graphicZone.revalidate();
			} else {
				graphicZone.setPreferredSize(new Dimension(vuX - 3, ord)); 
				graphicZone.revalidate();
			}
		} else {
			if (ord <= vuY) {
				graphicZone.setPreferredSize(new Dimension(abs, vuY)); 
				graphicZone.revalidate();
			} else {
				graphicZone.setPreferredSize(new Dimension(abs, ord)); 
				graphicZone.revalidate();
			}
		}

		graphicZone.draw();
		test = false;
		auto.toString();
		auto.modif(false);

	}
	public void majMenus() {

		// file Menu
		New.setEnabled(true);
		Open.setEnabled(true);
		if (test == false) {
			Save.setEnabled(true);
		} else {
			Save.setEnabled(false);
		}
		SaveAs.setEnabled(true);
		Print.setEnabled(true);
		Exit.setEnabled(true);

		// Entity Menu
		newEntity.setEnabled(true);
		if (graphicZone.isEntitySelected == 0) {
			dltEntity.setEnabled(false);
			modifyEntity.setEnabled(false);
		} else {
			dltEntity.setEnabled(true);
			modifyEntity.setEnabled(true);
		}

		// menu transitions
		if (auto.vEntity.size() == 0) {
			popupNewTrans.setEnabled(false);
			newTrans.setEnabled(false);
			assignDefaultParam.setEnabled(false);
			saveParam.setEnabled(false);
		} else {
			newTrans.setEnabled(true);
			popupNewTrans.setEnabled(true);
			assignDefaultParam.setEnabled(true);
			saveParam.setEnabled(true);
		}
		if (graphicZone.isTransSelected == 0) {
			dltTrans.setEnabled(false);
			modifyTrans.setEnabled(false);
		} else {
			dltTrans.setEnabled(true);
			modifyTrans.setEnabled(true);
		}

		menuHelp.setEnabled(true);
		Help.setEnabled(true);
		about.setEnabled(true);

		// popup menu
		popupEntity.setEnabled(true);
		popupDltEntity.setEnabled(true);
		popupEntityProp.setEnabled(true);

		popupTrans.setEnabled(true);
		popupDltTrans.setEnabled(true);
		popTransProp.setEnabled(true);
		popTransAddPoint.setEnabled(true);

		popupPoint.setEnabled(true);
		popupPointDlt.setEnabled(true);

		popupNull.setEnabled(true);
		popupNewEntity.setEnabled(true);
		popupUndo.setEnabled(true);
		if (bar.can == false) {
			New.setEnabled(false);
			Open.setEnabled(false);
			Save.setEnabled(false);
			SaveAs.setEnabled(false);
			Exit.setEnabled(false);
			newEntity.setEnabled(false);
			dltEntity.setEnabled(false);
			modifyEntity.setEnabled(false);
			popupNewTrans.setEnabled(false);
			newTrans.setEnabled(false);
			dltTrans.setEnabled(false);
			modifyTrans.setEnabled(false);
			popupEntity.setEnabled(false);
			popupDltEntity.setEnabled(false);
			popupEntityProp.setEnabled(false);
			popupTrans.setEnabled(false);
			popupDltTrans.setEnabled(false);
			popTransProp.setEnabled(false);
			popTransAddPoint.setEnabled(false);
			popupPoint.setEnabled(false);
			popupPointDlt.setEnabled(false);
			popupNull.setEnabled(false);
			popupNewEntity.setEnabled(false);
		}
	}

	public static void  addSpaces(int n, String mot, PrintWriter fichier){
		if (mot.length()<n)
		{
			for (int i=mot.length(); i<=n; i++)
			{
				fichier.print(" ");
			}
		}
	}

	public void sauvegardeHytech(boolean ge) {		
		fileChooser = new JFileChooser();
		fileChooser.addChoosableFileFilter(new FiltreHyT());
		int returnVal = fileChooser.showSaveDialog(this.graphicZone);
		if (returnVal == JFileChooser.APPROVE_OPTION) {
			File file = fileChooser.getSelectedFile();
			destination = file.getAbsolutePath();
			//Ajout variable destination2 pour le d�tail (resources liens etc...) Michael 6/02/07
			String destination2=destination+".txt";
			//------------------
			if (Utils.getExtension(file) == null) {
				destination = destination + ".hy";
			}
			try {
				PrintWriter fichier = new PrintWriter(new FileWriter(destination));
				PrintWriter fichier2 = new PrintWriter(new FileWriter(destination2));
				calculate(ge,file, fichier,fichier2);				
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}

	// calculation      
	public void calculate(boolean ge, File file, PrintWriter printWriter, PrintWriter printWriter2) throws Exception {
		System.out.println("comes here in hytech");
		printWriter.println("-- File " + file.getName());
		printWriter.println("");
		Entity entity;
		int i;
		par="k ";	
		int n=8;
		printWriter2.println("Details of Link ");
		printWriter2.println();
		for(int j=0; j<auto.vEntity.size() ; j = j+1) {
			printWriter2.print(((Entity) auto.vEntity.get(j)).getLabel());
			addSpaces(n, ((Entity) auto.vEntity.get(j)).getLabel(), printWriter2);
		}
		printWriter2.print("| ");
		for(int j=0; j<auto.vEntity.size() ; j = j+1) {
			printWriter2.print("W"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase());
			addSpaces(n+7, "W"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase(), printWriter2);
		}
		printWriter2.print("| ");
		for(int j=0; j<auto.vEntity.size() ; j = j+1) {
			printWriter2.print("K"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase()+"(W"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase()+")");
			addSpaces(n+5, "K"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase()+"(W"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase()+")", printWriter2);
		}
		printWriter2.print("| LINKS   ");
		printWriter2.println();
		printWriter2.println();
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			if (!entity.incP) {
				printWriter.println("--define(dp" + entity.getLabel() + ", " + entity.tempsP + ") -- temps caract\u00E9ristique positif du g\u00E8ne  " + entity.getLabel());
			}
			if (!entity.incM) {
				printWriter.println("--define(dn" + entity.getLabel() + ", " + entity.tempsM + ") -- temps caract\u00E9ristique n\u00E9gatif du g\u00E8ne  " + entity.getLabel());
			}
			par=par+",dp" + entity.getLabel();
		}
		printWriter.println("");
		printWriter.println("var");
		i=0;
		inivar="";
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			printWriter.println("-- gene name" + entity.getNum() + " = " + entity.getLabel());
		}
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			printWriter.print("h" + entity.getLabel());
			par=par+",h" + entity.getLabel();
			inivar=inivar + "&h"+ entity.getLabel()+"=0"; 
			if (i<auto.vEntity.size()-1) {
				printWriter.print(",");
			} else {
				printWriter.println(" -- temps relatifs � chacun des g\u00E8nes");
			}
		}
		printWriter.println("  : analog;");
		boolean ttt = false;
		printWriter.print("k,");
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			if (!entity.incP) {
				if (ttt) {
					printWriter.print(", ");
				}
				ttt = true;
				printWriter.print("dp" + (i+1));
			}
			if (!entity.incM) {
				if (ttt) {
					printWriter.print(", ");
				}
				ttt = true;
				printWriter.print("dp" + entity.getLabel());
			}
			if (!entity.incM) {
				if (ttt) {
					printWriter.print(", ");
				}
				ttt = true;
				printWriter.print("dn" + entity.getLabel());
			}
		}
		if (ttt) {
			printWriter.println("");
			printWriter.println("  : parameter;");
		}
		printWriter.println("");
		printWriter.println("-- --------------------------------------------------------------------*)");
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			printWriter.println("-- gene no" + entity.getNum() + " = " + entity.getLabel());
		}
		printWriter.println("");
		printWriter.println("automaton reseau");
		printWriter.println("synclabs: ;");
		printWriter.println("");		
		printWriter.print("initially "+fc);
		printWriter.print(" & True & state="+fs);
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			printWriter.print(" & h" + entity.getLabel() + "=0");
		}
		printWriter.println(";");
		printWriter.println("");






		Combination comb = new Combination();

		SearchComb cc = new SearchComb(findLevels(), comb, printWriter, printWriter2);
		Lines.clear();
		for (int h=0; h<comb.vSaveComb.size(); h++)
		{
			Lines.put((Vector)comb.vSaveComb.get(h), new LinkedList<Vector>());
		}
		cc.treatment(auto, comb, this);
		printWriter.println();
		printWriter.println("end");
		printWriter.println();
		if(ge==true) {
			StateGraphFrame FGE = new StateGraphFrame(Lines, comb.vSaveComb, mf.frameName, this);
			Vector<String> genesNames = new Vector<String>();
			for (int j = 0; j < auto.vEntity.size(); j++) {				
				Entity et  = (Entity) (auto.vEntity.get(j));
				genesNames.add(et.getLabel());
			}
			FGE.automate.setAuto(auto);
			FGE.automate.setVGeneNames(genesNames);
			FGE.stateGraphGraphics.displayGeneOrder();

		}
	}
	/*   public void calculateCycles(File file,PrintWriter printWriter, PrintWriter printWriter2, StateGraphFrame FGE){


		Cycle listeCycles=new Cycle(FGE.lines,FGE.combinasion);
                System.out.println(listeCycles.toString());
		printWriter.println("var");
		for(int h=1; h<=listeCycles.cycles.size(); h++){
			printWriter.print("cycle"+h);
			if (h<listeCycles.cycles.size()) printWriter.print(",");
		}
		printWriter.println(" :region;");
		for(int h=1; h<=listeCycles.cycles.size(); h++){
			printWriter.print("cycle"+h+":=");
			for (int hh=0; hh<listeCycles.cycles.get(h-1).size(); hh++){
				printWriter.print("state=");
				for (int hhh=0; hhh<listeCycles.cycles.get(h-1).get(hh).size(); hhh++){
					printWriter.print(listeCycles.cycles.get(h-1).get(hh).get(hhh));
				}
				if (hh<listeCycles.cycles.get(h-1).size()-1) printWriter.print("|");
			}
			printWriter.println(";");
		}
		printWriter2.println();
		printWriter2.println("Il existe "+listeCycles.cycles.size()+" cycle(s)");
		printWriter2.println();
		for (int c=0; c<listeCycles.cycles.size(); c++)
		{
			printWriter2.println(listeCycles.cycles.get(c));
		}
		printWriter2.println("");
		//-----------

		//fichier.println("-- --------------------------------------------------------------------*)");
		printWriter.println("");
		rf=true;
		cyc=true;
		twocyc=true;
		printWriter.println("prints\"Checking\";");
		printWriter.println("");
		printWriter.println("-- -------------------Les  variables----------------------------------------*)");
		printWriter.println("");
		strcom="var init_reg, reach_forward,acces ";
		// Pour les vriables de region
		if (nonstasta==true) {
			strcom=strcom + ",non_stable_states";
		}
		if (stasta==true) {
			strcom=strcom + ",stable_states,nods";
		}
		// Pour le cycle
		if (cyc==true) {
			strcom=strcom + ",cycle";
		}
		// Pour les vars  de deux cycles
		if (twocyc==true) {
			strcom=strcom + ",witrepcyc,ncs,cs,rfexits,cyc1,cyc2";
		}
		printWriter.println("");
		// Entrances and exits to the
		if (exi==true || ent==true) {
			strcom=strcom + ",nonrs,post_sta_witout_cycle,nr,exits,pre_sta_witout_cycle,sta_witout_cycle,init_reg,nods, ini_con,post_init_con,pre_init_con,entrances, post3";
		}
		// Pour les vars de path
		if (pat==true) {
			strcom=strcom + ",first_state, laste_state,constraints,path3,old3,acc3,reached3,fr,path2,old2,acc2,reached2,d1,d2,chemin,acc,rbb, rb,rf,ir,path, reached,reached,old,bogus";
		}
		strcom=strcom + ";";
		printWriter.println(strcom);
		printWriter.println("");
		//------------------by Jamil AHmad
		printWriter.println("init_reg := loc[reseau] = " +fc+ inivar+   "&  state=" + fs)  ;
		// The commands of the analyzed // Jamil Ahmad
		printWriter.println("-- -------------------Les  variables----------------------------------------");
		printWriter.println("");
		printWriter.println("acces := reach forward from init_reg endreach;");
		printWriter.println("");
		printWriter.println("acces := reach forward from init_reg endreach;");
		printWriter.println("");
		printWriter.println("acces:=hull(acces);");
		printWriter.println("");
		printWriter.println("prints\"Etats accessibles\";");
		printWriter.println("print hide" + par +" in acces endhide;");
		printWriter.println("");
		// For the function of non-steady states
		if (nonstasta==true) {
			printWriter.println("non_stable_states := acces & hide k in pre(acces & conf=k) & ~(conf=k)  endhide;");
			printWriter.println("");
			printWriter.println("non_stable_states:=hull(non_stable_states;");
			printWriter.println("");
			printWriter.println("if empty(non_stable_states) then");
			printWriter.println("");
			printWriter.println("prints \"No non stable states\";");
			printWriter.println("");
			printWriter.println("else");
			printWriter.println("");
			printWriter.println("prints \"the reachable non stable states are:\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in non_stable_states endhide;");
			printWriter.println("");
			printWriter.println("endif ;");
			printWriter.println("");
		}
		// Function for stable staes
		if (stasta==true) {
			printWriter.println("nods :=  hull(conf=k | non_stable_states);") ;
			printWriter.println("");
			printWriter.println("stable_states :=hull(acces & ~nods);");
			printWriter.println("");
			printWriter.println("if empty(stable_states)");
			printWriter.println("");
			printWriter.println("then prints \"No stable states ... !!!\";");
			printWriter.println("");
			printWriter.println("else");
			printWriter.println("");
			printWriter.println("prints \"The reachable stable states are:\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in stable_states endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println(""); 
		}
		// For the function of cycle
		if (cyc==true) {
			printWriter.println("cycle := hide k, sx1, sx2, sy1, kx0, ky0, kyx, kxx, kxy, kxxy, x,y");
			printWriter.println("");
			printWriter.println("in (conf=k)  & acces & (reach forward from ( post(acces & conf=k) & ~(conf=k) )  endreach) endhide;");
			printWriter.println("");
			printWriter.println("prints \"Cycle=\"; print cycle;");
			printWriter.println("");
		}
		// For the function of two cycles
		if (twocyc==true) {
			printWriter.println("---------------------Algorithem for separating cycles-------------------");
			printWriter.println("");
			printWriter.println("witrepcyc:= cycle &  ~hull( conf=k | cycle ) ;");
			printWriter.println("");
			printWriter.println("-- First find the non common states (ncs)");
			printWriter.println("");
			//-------------------Modif Beno�t -------------------------
			printWriter.println("ncs:= hide" + par + "  in (cycle)  & ~ reach forward from ( pre( cycle & rf ) ) ");
			printWriter.println("");
			printWriter.println("endreach  endhide;");
			printWriter.println("");
			printWriter.println("ncs:=hull(ncs);");
			printWriter.println("");
			printWriter.println("-- To find the common states (cs)");
			printWriter.println("");
			printWriter.println("cs:=cycle & ~ncs;");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("--RF from exits");
			printWriter.println("");
			printWriter.println("rfexits:=hide" + par + "  in rf & reach forward from (post(  exits & rf) & ~ exits) & ~cs & ~ sta_witout_cycle  endreach  endhide;");
			printWriter.println("");
			//-----------------------------------------------------------
			printWriter.println("--cycle 1");
			printWriter.println("");
			printWriter.println("rfexits:=rfexits | cs;");
			printWriter.println("");
			printWriter.println("cyc1:=hull(rfexits);");
			printWriter.println("");
			printWriter.println("--Remove repeatition");
			printWriter.println("");
			printWriter.println("nods:=hull( conf=k | rfexits);");
			printWriter.println("");
			printWriter.println("--cycle 2");
			printWriter.println("");
			printWriter.println("cyc2:=hull(cycle & ~nods) | cs ;");
			printWriter.println("");
			printWriter.println("if empty(cyc1)");
			printWriter.println("");
			printWriter.println("then prints\"First cycle not detected\";");
			printWriter.println("");
			printWriter.println("else prints  \"The first cycle consits of the following states :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in cyc1 endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
			printWriter.println("if empty(cyc2)");
			printWriter.println("");
			printWriter.println("then prints \"Second cycle not dtected\";");
			printWriter.println("");
			printWriter.println("else prints  \"The second cycle consits of the following states :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"  in cyc2  endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
		}
		// For the function of exit
		if (exi==true) {
			printWriter.println("---------------------Algorithem to find the exits of a cycle---------------");
			printWriter.println("");
			printWriter.println("--To find the set of states which will be the exits for the cycle");
			printWriter.println("");
			printWriter.println("--First find the difference of all states and cycle's  states");
			printWriter.println("");
			printWriter.println("sta_witout_cycle:=  hull(rf & ~cycle);");
			printWriter.println("");
			printWriter.println("--To find the predecessors of the states not included in the cycle");
			printWriter.println("");
			printWriter.println("pre_sta_witout_cycle:=rf &  pre(rf & sta_witout_cycle )& ~sta_witout_cycle;");
			printWriter.println("");calculate
			printWriter.println("pre_sta_witout_cycle:=hull(pre_sta_witout_cycle);");
			printWriter.println("");
			printWriter.println("--To find exits state now");
			printWriter.println("");
			printWriter.println("exits:= (pre_sta_witout_cycle & cycle) ;");
			printWriter.println("");
			printWriter.println("--exits:= (non_stable_states & cycle_states) ;");
			printWriter.println("");
			printWriter.println("--Print the result");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("--Print the result");
			printWriter.println("");
			printWriter.println("if empty(sta_witout_cycle)");
			printWriter.println("");
			printWriter.println("then prints \"No states\";");
			printWriter.println("");
			printWriter.println("else prints \"states without cycle  are :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"  in sta_witout_cycle  endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("--Print the result");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("if empty(pre_sta_witout_cycle)");
			printWriter.println("");
			printWriter.println("then prints \"No pre\";");
			printWriter.println("");
			printWriter.println("else prints \"pre-states witout actual states  are :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in pre_sta_witout_cycle  endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("if empty(exits)");
			printWriter.println("");
			printWriter.println("then prints \"No Exits states in the cycle\";");
			printWriter.println("");
			printWriter.println("else prints  \"The Exits states are :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in exits endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
			printWriter.println("-------------- To find interance of a cycle------------------");
			printWriter.println("");
			printWriter.println("--To find the set of states which will be the exits for the cycle");
			printWriter.println("");
			printWriter.println("--First find the difference of all states and cycle's  states");
			printWriter.println("");
			printWriter.println("sta_witout_cycle:=  hull(rf & ~cycle);");
			printWriter.println("");
			printWriter.println("--To find the successors  of the states not included in the cycle");
			printWriter.println("");
			printWriter.println("post_sta_witout_cycle:=rf &  post(rf & sta_witout_cycle )& ~sta_witout_cycle;");
			printWriter.println("");
			printWriter.println("post_sta_witout_cycle:=hull(post_sta_witout_cycle);");
			printWriter.println("");
			printWriter.println("--To find Entrance states now");
			printWriter.println("");
			printWriter.println("entrances:= (post_sta_witout_cycle & cycle) ;");
			printWriter.println("");
			printWriter.println("if empty(entrances)");
			printWriter.println("");
			printWriter.println(" then prints \"No Entrance states in the cycle\";");
			printWriter.println("");
			printWriter.println("else prints  \"The Entrance states are :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"  in entrances endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
		}
		// For the function of entrances
		if (ent==true) {
			printWriter.println("-------------- To find interance of a cycle------------------");
			printWriter.println("");
			printWriter.println("--To find the set of states which will be the exits for the cycle");
			printWriter.println("");
			printWriter.println("--First find the difference of all states and cycle's  states");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("sta_witout_cycle:=  hull(rf & ~cycle);");
			printWriter.println("");
			printWriter.println("--To find the successors  of the states not included in the cycle");
			printWriter.println("");
			printWriter.println("post_sta_witout_cycle:=rf &  post(rf & sta_witout_cycle )& ~sta_witout_cycle;");
			printWriter.println("");
			printWriter.println("post_sta_witout_cycle:=hull(post_sta_witout_cycle);");
			printWriter.println("");
			printWriter.println("--To find Entrance states now");
			printWriter.println("");
			printWriter.println("entrances:= (post_sta_witout_cycle & cycle) ;");
			printWriter.println("");
			printWriter.println("if empty(entrances)");
			printWriter.println("");
			printWriter.println("then prints \"No Entrance states in the cycle\";");
			printWriter.println("");
			printWriter.println("else prints  \"The Entrance states are :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"  in entrances endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
		}
		// For the function of path
		if (pat==true) {
			printWriter.println("first_state:=state=fs;");
			printWriter.println("");
			printWriter.println("laste_state:=state=ls;");
			printWriter.println("");
			printWriter.println("init_reg := loc[reseau] = " +fc+ "&"+  "first_state;");
			printWriter.println("");
			printWriter.println("-- & constraints;");
			printWriter.println("");
			printWriter.println("------------------Reach forward-----------------------------------");
			printWriter.println("");
			printWriter.println("rf := constraints & reach forward  from init_reg endreach;");
			printWriter.println("");
			printWriter.println("-----------To print the required path---------");
			printWriter.println("");
			printWriter.println("--Note: To find the path between two states first modify the variables ir,fr, first_state, and  laste_state;");
			printWriter.println("");
			printWriter.println("ir := loc[reseau] = " +fc+ "&"  +"first_state  ;");
			printWriter.println("");
			printWriter.println("--& constraints;");
			printWriter.println("");
			printWriter.println("fr := loc[reseau] = "+lc +"&"  +"laste_state  ;");
			printWriter.println("");
			printWriter.println("--& constraints;");
			printWriter.println("");
			printWriter.println("reached:=ir ;");
			printWriter.println("");
			printWriter.println("path:=ir;");
			printWriter.println("");
			printWriter.println("acc:=path;");
			printWriter.println("");
			printWriter.println("chemin:=first_state;");
			printWriter.println("");
			printWriter.println("old:= iterate old  from  ir  using{");
			printWriter.println("");
			printWriter.println("old:= rf & post(old );");
			printWriter.println("");
			printWriter.println("path:=old & ~path;");
			printWriter.println("");
			printWriter.println("acc:=acc | path;");
			printWriter.println("");
			printWriter.println("old:=weakdiff(old, reached)");
			printWriter.println("");;
			printWriter.println("reached:=reached | old;");
			printWriter.println("");
			printWriter.println("if empty(path &  laste_state)");
			printWriter.println(""); 
			printWriter.println("then bogus:=first_state ;");
			printWriter.println("");
			printWriter.println("else");
			printWriter.println("");
			printWriter.println("");	
			printWriter.println("reached2:= laste_state ;");
			printWriter.println("");
			printWriter.println("path2:=  laste_state;");
			printWriter.println("");
			printWriter.println("acc2:=path2;");
			printWriter.println("");
			printWriter.println("old2:= iterate old2  from  fr using{");
			printWriter.println("");
			printWriter.println("old2:=  pre(old2 & rf ) & acc;");
			printWriter.println("");
			printWriter.println("path2:=old2 & ~path2;");
			printWriter.println("");
			printWriter.println("acc2:=acc2 |  path2;");
			printWriter.println("");
			printWriter.println("old2:=weakdiff(old2, reached2);");
			printWriter.println("");
			printWriter.println("reached2:=reached2 | old2;");
			printWriter.println("");
			printWriter.println("reached2:=  first_state;");
			printWriter.println("");
			printWriter.println("path2	:=  first_state;");
			printWriter.println("");
			printWriter.println("acc3:=path2;");
			printWriter.println("");
			printWriter.println("old3:=path2;");
			printWriter.println("");
			printWriter.println("prints \"=======================================\";");
			printWriter.println("");
			printWriter.println("prints \"Path=\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in ir endhide ;");
			printWriter.println(""); 
			printWriter.println("old2:= iterate old2  from  ir using{");
			printWriter.println("");
			printWriter.println("old2:=  post(old2 & rf ) & acc2;");
			printWriter.println("");
			printWriter.println("path2:=old2 & ~path2& constraints;");
			printWriter.println("");
			printWriter.println("path3:=path2 & ~  laste_state& constraints;");
			printWriter.println("");
			printWriter.println("path3:=path3 & ~  first_state & constraints;");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in path3 endhide ;");
			printWriter.println("");
			printWriter.println("acc3:=acc3 |  path2;");
			printWriter.println("");
			printWriter.println("old2:=weakdiff(old2, reached2);");
			printWriter.println("");
			printWriter.println("reached2:=reached2 | old2;");
		};	
		printWriter.close();
		printWriter2.close();
	}
	 */

	public LinkedList<LinkedList<Vector>> calculateCycle(boolean ge, File file, PrintWriter printWriter, PrintWriter printWriter2, StateGraphFrame FGE) throws Exception {
		printWriter.println("-- File " + file.getName());
		printWriter.println("");
		Entity entity;
		int i;
		par="k ";	
		int n=8;
		printWriter2.println("Details of Link ");
		printWriter2.println();
		for(int j=0; j<auto.vEntity.size() ; j = j+1) {
			printWriter2.print(((Entity) auto.vEntity.get(j)).getLabel());
			addSpaces(n, ((Entity) auto.vEntity.get(j)).getLabel(), printWriter2);
		}
		printWriter2.print("| ");
		for(int j=0; j<auto.vEntity.size() ; j = j+1) {
			printWriter2.print("W"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase());
			addSpaces(n+7, "W"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase(), printWriter2);
		}
		printWriter2.print("| ");
		for(int j=0; j<auto.vEntity.size() ; j = j+1) {
			printWriter2.print("K"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase()+"(W"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase()+")");
			addSpaces(n+5, "K"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase()+"(W"+((Entity) auto.vEntity.get(j)).getLabel().toLowerCase()+")", printWriter2);
		}
		printWriter2.print("| LINKS   ");
		printWriter2.println();
		printWriter2.println();
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			if (!entity.incP) {
				printWriter.println("--define(dp" + entity.getLabel() + ", " + entity.tempsP + ") -- temps caract\u00E9ristique positif du g\u00E8ne  " + entity.getLabel());
			}
			if (!entity.incM) {
				printWriter.println("--define(dn" + entity.getLabel() + ", " + entity.tempsM + ") -- temps caract\u00E9ristique n\u00E9gatif du g\u00E8ne  " + entity.getLabel());
			}
			par=par+",dp" + entity.getLabel();
		}
		printWriter.println("");
		printWriter.println("var");
		i=0;
		inivar="";
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			printWriter.println("-- gene name" + entity.getNum() + " = " + entity.getLabel());
		}
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			printWriter.print("h" + entity.getLabel());
			par=par+",h" + entity.getLabel();
			inivar=inivar + "&h"+ entity.getLabel()+"=0"; 
			if (i<auto.vEntity.size()-1) {
				printWriter.print(",");
			} else {
				printWriter.println(" -- temps relatifs � chacun des g\u00E8nes");
			}
		}
		printWriter.println("  : analog;");
		boolean ttt = false;
		printWriter.print("k,");
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			if (!entity.incP) {
				if (ttt) {
					printWriter.print(", ");
				}
				ttt = true;
				printWriter.print("dp" + (i+1));
			}
			if (!entity.incM) {
				if (ttt) {
					printWriter.print(", ");
				}
				ttt = true;
				printWriter.print("dp" + entity.getLabel());
			}
			if (!entity.incM) {
				if (ttt) {
					printWriter.print(", ");
				}
				ttt = true;
				printWriter.print("dn" + entity.getLabel());
			}
		}
		if (ttt) {
			printWriter.println("");
			printWriter.println("  : parameter;");
		}
		printWriter.println("");
		printWriter.println("-- --------------------------------------------------------------------*)");
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			printWriter.println("-- gene no" + entity.getNum() + " = " + entity.getLabel());
		}
		printWriter.println("");
		printWriter.println("automaton reseau");
		printWriter.println("synclabs: ;");
		printWriter.println("");		
		printWriter.print("initially "+fc);
		printWriter.print(" & True & state="+fs);
		for(i=0; i<auto.vEntity.size() ; i = i+1) {
			entity = (Entity) auto.vEntity.get(i);
			printWriter.print(" & h" + entity.getLabel() + "=0");
		}
		printWriter.println(";");
		printWriter.println("");






		Combination comb = new Combination();
		SearchComb cc = new SearchComb(findLevels(), comb, printWriter, printWriter2);
		Lines.clear();
		for (int h=0; h<comb.vSaveComb.size(); h++)
		{
			Lines.put((Vector)comb.vSaveComb.get(h), new LinkedList<Vector>());
		}
		cc.treatment(auto, comb, this);
		printWriter.println();
		printWriter.println("end");
		printWriter.println();
		Cycle listeCycles=new Cycle(Lines, comb);
		printWriter.println("var");
		for(int h=1; h<=listeCycles.cycles.size(); h++){
			printWriter.print("cycle"+h);
			if (h<listeCycles.cycles.size()) printWriter.print(",");
		}
		printWriter.println(" :region;");
		for(int h=1; h<=listeCycles.cycles.size(); h++){
			printWriter.print("cycle"+h+":=");
			for (int hh=0; hh<listeCycles.cycles.get(h-1).size(); hh++){
				printWriter.print("state=");
				for (int hhh=0; hhh<listeCycles.cycles.get(h-1).get(hh).size(); hhh++){
					printWriter.print(listeCycles.cycles.get(h-1).get(hh).get(hhh));
				}
				if (hh<listeCycles.cycles.get(h-1).size()-1) printWriter.print("|");
			}
			printWriter.println(";");
		}
		printWriter2.println();
		printWriter2.println("Il existe "+listeCycles.cycles.size()+" cycle(s)");
		printWriter2.println();
		for (int c=0; c<listeCycles.cycles.size(); c++)
		{
			printWriter2.println(listeCycles.cycles.get(c));
		}
		printWriter2.println("");
		//-----------
		if(ge==true) {

			FGE.lines=Lines;
			FGE.combinasion=comb.vSaveComb;

			Vector<String> genesNames = new Vector<String>();
			for (int j = 0; j < auto.vEntity.size(); j++) {				
				Entity et  = (Entity) (auto.vEntity.get(j));
				genesNames.add(et.getLabel());
			}
			FGE.automate.setVGeneNames(genesNames);
		}
		//fichier.println("-- --------------------------------------------------------------------*)");
		printWriter.println("");
		rf=true;
		cyc=true;
		twocyc=true;
		printWriter.println("prints\"Checking\";");
		printWriter.println("");
		printWriter.println("-- -------------------Les  variables----------------------------------------*)");
		printWriter.println("");
		strcom="var init_reg, reach_forward,acces ";
		// Pour les vriables de region
		if (nonstasta==true) {
			strcom=strcom + ",non_stable_states";
		}
		if (stasta==true) {
			strcom=strcom + ",stable_states,nods";
		}
		// Pour le cycle
		if (cyc==true) {
			strcom=strcom + ",cycle";
		}
		// Pour les vars  de deux cycles
		if (twocyc==true) {
			strcom=strcom + ",witrepcyc,ncs,cs,rfexits,cyc1,cyc2";
		}
		printWriter.println("");
		// Entrances and exits to the
		if (exi==true || ent==true) {
			strcom=strcom + ",nonrs,post_sta_witout_cycle,nr,exits,pre_sta_witout_cycle,sta_witout_cycle,init_reg,nods, ini_con,post_init_con,pre_init_con,entrances, post3";
		}
		// Pour les vars de path
		if (pat==true) {
			strcom=strcom + ",first_state, laste_state,constraints,path3,old3,acc3,reached3,fr,path2,old2,acc2,reached2,d1,d2,chemin,acc,rbb, rb,rf,ir,path, reached,reached,old,bogus";
		}
		strcom=strcom + ";";
		printWriter.println(strcom);
		printWriter.println("");
		//------------------by Jamil AHmad
		printWriter.println("init_reg := loc[reseau] = " +fc+ inivar+   "&  state=" + fs)  ;
		// The commands of the analyzed // Jamil Ahmad
		printWriter.println("-- -------------------Les  variables----------------------------------------");
		printWriter.println("");
		printWriter.println("acces := reach forward from init_reg endreach;");
		printWriter.println("");
		printWriter.println("acces := reach forward from init_reg endreach;");
		printWriter.println("");
		printWriter.println("acces:=hull(acces);");
		printWriter.println("");
		printWriter.println("prints\"Etats accessibles\";");
		printWriter.println("print hide" + par +" in acces endhide;");
		printWriter.println("");
		// For the function of non-steady states
		if (nonstasta==true) {
			printWriter.println("non_stable_states := acces & hide k in pre(acces & conf=k) & ~(conf=k)  endhide;");
			printWriter.println("");
			printWriter.println("non_stable_states:=hull(non_stable_states;");
			printWriter.println("");
			printWriter.println("if empty(non_stable_states) then");
			printWriter.println("");
			printWriter.println("prints \"No non stable states\";");
			printWriter.println("");
			printWriter.println("else");
			printWriter.println("");
			printWriter.println("prints \"the reachable non stable states are:\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in non_stable_states endhide;");
			printWriter.println("");
			printWriter.println("endif ;");
			printWriter.println("");
		}
		// Function for stable staes
		if (stasta==true) {
			printWriter.println("nods :=  hull(conf=k | non_stable_states);") ;
			printWriter.println("");
			printWriter.println("stable_states :=hull(acces & ~nods);");
			printWriter.println("");
			printWriter.println("if empty(stable_states)");
			printWriter.println("");
			printWriter.println("then prints \"No stable states ... !!!\";");
			printWriter.println("");
			printWriter.println("else");
			printWriter.println("");
			printWriter.println("prints \"The reachable stable states are:\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in stable_states endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println(""); 
		}
		// For the function of cycle
		if (cyc==true) {
			printWriter.println("cycle := hide k, sx1, sx2, sy1, kx0, ky0, kyx, kxx, kxy, kxxy, x,y");
			printWriter.println("");
			printWriter.println("in (conf=k)  & acces & (reach forward from ( post(acces & conf=k) & ~(conf=k) )  endreach) endhide;");
			printWriter.println("");
			printWriter.println("prints \"Cycle=\"; print cycle;");
			printWriter.println("");
		}
		// For the function of two cycles
		if (twocyc==true) {
			printWriter.println("---------------------Algorithem for separating cycles-------------------");
			printWriter.println("");
			printWriter.println("witrepcyc:= cycle &  ~hull( conf=k | cycle ) ;");
			printWriter.println("");
			printWriter.println("-- First find the non common states (ncs)");
			printWriter.println("");
			//-------------------Modif Beno�t -------------------------
			printWriter.println("ncs:= hide" + par + "  in (cycle)  & ~ reach forward from ( pre( cycle & rf ) ) ");
			printWriter.println("");
			printWriter.println("endreach  endhide;");
			printWriter.println("");
			printWriter.println("ncs:=hull(ncs);");
			printWriter.println("");
			printWriter.println("-- To find the common states (cs)");
			printWriter.println("");
			printWriter.println("cs:=cycle & ~ncs;");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("--RF from exits");
			printWriter.println("");
			printWriter.println("rfexits:=hide" + par + "  in rf & reach forward from (post(  exits & rf) & ~ exits) & ~cs & ~ sta_witout_cycle  endreach  endhide;");
			printWriter.println("");
			//-----------------------------------------------------------
			printWriter.println("--cycle 1");
			printWriter.println("");
			printWriter.println("rfexits:=rfexits | cs;");
			printWriter.println("");
			printWriter.println("cyc1:=hull(rfexits);");
			printWriter.println("");
			printWriter.println("--Remove repeatition");
			printWriter.println("");
			printWriter.println("nods:=hull( conf=k | rfexits);");
			printWriter.println("");
			printWriter.println("--cycle 2");
			printWriter.println("");
			printWriter.println("cyc2:=hull(cycle & ~nods) | cs ;");
			printWriter.println("");
			printWriter.println("if empty(cyc1)");
			printWriter.println("");
			printWriter.println("then prints\"First cycle not detected\";");
			printWriter.println("");
			printWriter.println("else prints  \"The first cycle consits of the following states :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in cyc1 endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
			printWriter.println("if empty(cyc2)");
			printWriter.println("");
			printWriter.println("then prints \"Second cycle not dtected\";");
			printWriter.println("");
			printWriter.println("else prints  \"The second cycle consits of the following states :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"  in cyc2  endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
		}
		// For the function of exit
		if (exi==true) {
			printWriter.println("---------------------Algorithem to find the exits of a cycle---------------");
			printWriter.println("");
			printWriter.println("--To find the set of states which will be the exits for the cycle");
			printWriter.println("");
			printWriter.println("--First find the difference of all states and cycle's  states");
			printWriter.println("");
			printWriter.println("sta_witout_cycle:=  hull(rf & ~cycle);");
			printWriter.println("");
			printWriter.println("--To find the predecessors of the states not included in the cycle");
			printWriter.println("");
			printWriter.println("pre_sta_witout_cycle:=rf &  pre(rf & sta_witout_cycle )& ~sta_witout_cycle;");
			printWriter.println("");
			printWriter.println("pre_sta_witout_cycle:=hull(pre_sta_witout_cycle);");
			printWriter.println("");
			printWriter.println("--To find exits state now");
			printWriter.println("");
			printWriter.println("exits:= (pre_sta_witout_cycle & cycle) ;");
			printWriter.println("");
			printWriter.println("--exits:= (non_stable_states & cycle_states) ;");
			printWriter.println("");
			printWriter.println("--Print the result");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("--Print the result");
			printWriter.println("");
			printWriter.println("if empty(sta_witout_cycle)");
			printWriter.println("");
			printWriter.println("then prints \"No states\";");
			printWriter.println("");
			printWriter.println("else prints \"states without cycle  are :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"  in sta_witout_cycle  endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("--Print the result");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("if empty(pre_sta_witout_cycle)");
			printWriter.println("");
			printWriter.println("then prints \"No pre\";");
			printWriter.println("");
			printWriter.println("else prints \"pre-states witout actual states  are :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in pre_sta_witout_cycle  endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("if empty(exits)");
			printWriter.println("");
			printWriter.println("then prints \"No Exits states in the cycle\";");
			printWriter.println("");
			printWriter.println("else prints  \"The Exits states are :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in exits endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
			printWriter.println("-------------- To find interance of a cycle------------------");
			printWriter.println("");
			printWriter.println("--To find the set of states which will be the exits for the cycle");
			printWriter.println("");
			printWriter.println("--First find the difference of all states and cycle's  states");
			printWriter.println("");
			printWriter.println("sta_witout_cycle:=  hull(rf & ~cycle);");
			printWriter.println("");
			printWriter.println("--To find the successors  of the states not included in the cycle");
			printWriter.println("");
			printWriter.println("post_sta_witout_cycle:=rf &  post(rf & sta_witout_cycle )& ~sta_witout_cycle;");
			printWriter.println("");
			printWriter.println("post_sta_witout_cycle:=hull(post_sta_witout_cycle);");
			printWriter.println("");
			printWriter.println("--To find Entrance states now");
			printWriter.println("");
			printWriter.println("entrances:= (post_sta_witout_cycle & cycle) ;");
			printWriter.println("");
			printWriter.println("if empty(entrances)");
			printWriter.println("");
			printWriter.println(" then prints \"No Entrance states in the cycle\";");
			printWriter.println("");
			printWriter.println("else prints  \"The Entrance states are :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"  in entrances endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
		}
		// For the function of entrances
		if (ent==true) {
			printWriter.println("-------------- To find interance of a cycle------------------");
			printWriter.println("");
			printWriter.println("--To find the set of states which will be the exits for the cycle");
			printWriter.println("");
			printWriter.println("--First find the difference of all states and cycle's  states");
			printWriter.println("");
			printWriter.println("");
			printWriter.println("sta_witout_cycle:=  hull(rf & ~cycle);");
			printWriter.println("");
			printWriter.println("--To find the successors  of the states not included in the cycle");
			printWriter.println("");
			printWriter.println("post_sta_witout_cycle:=rf &  post(rf & sta_witout_cycle )& ~sta_witout_cycle;");
			printWriter.println("");
			printWriter.println("post_sta_witout_cycle:=hull(post_sta_witout_cycle);");
			printWriter.println("");
			printWriter.println("--To find Entrance states now");
			printWriter.println("");
			printWriter.println("entrances:= (post_sta_witout_cycle & cycle) ;");
			printWriter.println("");
			printWriter.println("if empty(entrances)");
			printWriter.println("");
			printWriter.println("then prints \"No Entrance states in the cycle\";");
			printWriter.println("");
			printWriter.println("else prints  \"The Entrance states are :\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"  in entrances endhide;");
			printWriter.println("");
			printWriter.println("endif;");
			printWriter.println("");
		}
		// For the function of path
		if (pat==true) {
			printWriter.println("first_state:=state=fs;");
			printWriter.println("");
			printWriter.println("laste_state:=state=ls;");
			printWriter.println("");
			printWriter.println("init_reg := loc[reseau] = " +fc+ "&"+  "first_state;");
			printWriter.println("");
			printWriter.println("-- & constraints;");
			printWriter.println("");
			printWriter.println("------------------Reach forward-----------------------------------");
			printWriter.println("");
			printWriter.println("rf := constraints & reach forward  from init_reg endreach;");
			printWriter.println("");
			printWriter.println("-----------To print the required path---------");
			printWriter.println("");
			printWriter.println("--Note: To find the path between two states first modify the variables ir,fr, first_state, and  laste_state;");
			printWriter.println("");
			printWriter.println("ir := loc[reseau] = " +fc+ "&"  +"first_state  ;");
			printWriter.println("");
			printWriter.println("--& constraints;");
			printWriter.println("");
			printWriter.println("fr := loc[reseau] = "+lc +"&"  +"laste_state  ;");
			printWriter.println("");
			printWriter.println("--& constraints;");
			printWriter.println("");
			printWriter.println("reached:=ir ;");
			printWriter.println("");
			printWriter.println("path:=ir;");
			printWriter.println("");
			printWriter.println("acc:=path;");
			printWriter.println("");
			printWriter.println("chemin:=first_state;");
			printWriter.println("");
			printWriter.println("old:= iterate old  from  ir  using{");
			printWriter.println("");
			printWriter.println("old:= rf & post(old );");
			printWriter.println("");
			printWriter.println("path:=old & ~path;");
			printWriter.println("");
			printWriter.println("acc:=acc | path;");
			printWriter.println("");
			printWriter.println("old:=weakdiff(old, reached)");
			printWriter.println("");;
			printWriter.println("reached:=reached | old;");
			printWriter.println("");
			printWriter.println("if empty(path &  laste_state)");
			printWriter.println(""); 
			printWriter.println("then bogus:=first_state ;");
			printWriter.println("");
			printWriter.println("else");
			printWriter.println("");
			printWriter.println("");	
			printWriter.println("reached2:= laste_state ;");
			printWriter.println("");
			printWriter.println("path2:=  laste_state;");
			printWriter.println("");
			printWriter.println("acc2:=path2;");
			printWriter.println("");
			printWriter.println("old2:= iterate old2  from  fr using{");
			printWriter.println("");
			printWriter.println("old2:=  pre(old2 & rf ) & acc;");
			printWriter.println("");
			printWriter.println("path2:=old2 & ~path2;");
			printWriter.println("");
			printWriter.println("acc2:=acc2 |  path2;");
			printWriter.println("");
			printWriter.println("old2:=weakdiff(old2, reached2);");
			printWriter.println("");
			printWriter.println("reached2:=reached2 | old2;");
			printWriter.println("");
			printWriter.println("reached2:=  first_state;");
			printWriter.println("");
			printWriter.println("path2	:=  first_state;");
			printWriter.println("");
			printWriter.println("acc3:=path2;");
			printWriter.println("");
			printWriter.println("old3:=path2;");
			printWriter.println("");
			printWriter.println("prints \"=======================================\";");
			printWriter.println("");
			printWriter.println("prints \"Path=\";");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in ir endhide ;");
			printWriter.println(""); 
			printWriter.println("old2:= iterate old2  from  ir using{");
			printWriter.println("");
			printWriter.println("old2:=  post(old2 & rf ) & acc2;");
			printWriter.println("");
			printWriter.println("path2:=old2 & ~path2& constraints;");
			printWriter.println("");
			printWriter.println("path3:=path2 & ~  laste_state& constraints;");
			printWriter.println("");
			printWriter.println("path3:=path3 & ~  first_state & constraints;");
			printWriter.println("");
			printWriter.println("print hide" + par +"   in path3 endhide ;");
			printWriter.println("");
			printWriter.println("acc3:=acc3 |  path2;");
			printWriter.println("");
			printWriter.println("old2:=weakdiff(old2, reached2);");
			printWriter.println("");
			printWriter.println("reached2:=reached2 | old2;");
		};	
		printWriter.close();
		printWriter2.close();
		return listeCycles.cycles;
	}


	private void emptySet(Set<Set<Integer>> resultingCombinations) {
		resultingCombinations.add(new HashSet<Integer>());
	}

	private Integer popLast(Vector<Integer> elementsExclusiveX) {
		return elementsExclusiveX.remove(elementsExclusiveX.size()-1);
	}

}
