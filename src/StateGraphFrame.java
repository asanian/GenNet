import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.HeadlessException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Properties;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.KeyStroke;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

/** * 
 * @author Michael
 Corrig� par R�my et Christian
 */

public class StateGraphFrame extends JFrame implements ActionListener, MouseListener{


	private static final long serialVersionUID = 1L;

	// Objet repr�sentant l'automate
	StateGraphAutomate automate;
	StateBar stateBar;
	StateGraphGraphics stateGraphGraphics;
	int initialWidth;
	boolean check=false;

	//Panel contenant les boutons pour l'affichage des paths et cycles
	private JPanel panelChoice;
	private JButton btnCycle;
	private JButton btnPath; //chemin: path
	private JButton btnNeighbor; // neighbor 
	private JButton btnReset; //reset
	private JComboBox oneState; // one
	private JComboBox twoState; // two
	private JComboBox threeState; // tree
	private JComboBox cyclesBox;
	public LinkedList<LinkedList<Vector>> cycles;
	private Object[] listOneState;
	private Object[] lisTwoSate;
	private Object[] listThreeState;
	private Object[] listCycles;
	private JTextArea jTxtCycle = new JTextArea();
	private JScrollPane scrollpane_texteCycle;
	JButton btnOk = new JButton("OK");

	JDialog inputFrame;
	JTextField initialValue;
	JTextField txFlInitaialClock;
	String frameName;

	//Barre de menu
	JMenuBar menuBar;

	//Menu fichier
	JMenu menuFile;
	JMenuItem open;
	JMenuItem register;
	JMenuItem saveAs;
	JMenuItem print;
	JMenuItem zoom;
	JMenuItem showCycle;
	JMenuItem quite;

	//Menu conversion
	JMenu menuConversion;
	JMenuItem exporterGen;
	JMenuItem convGenEnXML;
	JMenuItem convEquaEnXML;
	// Menu HyTech
	JMenu menuHybridModeling;
	JMenuItem exporterHytech;
	JMenuItem phaver;
	JMenuItem hyTechPathConstraints;
	// menu ?
	JMenu menuAide;
	JMenuItem aide;
	JMenuItem aPropos;

	//taille de la zone graphique
	int x;
	int y;

	JFileChooser fileChooser;
	String destination;

	JPopupMenu pointPopup;
	JMenuItem dltPointPopup;

	JPopupMenu popupTrans;
	JMenuItem popTransAddClou;

	JPopupMenu popupNull;

	//Pour le zoom
	JFrame zoomFrame;
	JButton zoomPlus,zoomMoins;

	// A propos de Gentotech

	JTextArea textAreaAbout;
	MenuEditer menuEditer;
	/*test=true lorsque le graphe d'�tats n'a pas encore �t� enregistr�
	et false lorsqu'il l'a d�ja �t�*/
	boolean test = true;
	String hytechOption="";
	HashMap<Vector, LinkedList<Vector>> lines;
	Vector<Vector<Integer>> combinasion;
	//LinkedList<LinkedList<Vector>> cycles
	public StateGraphFrame(HashMap<Vector, LinkedList<Vector>> lines, Vector<Vector<Integer>> combinasion,  String title, MenuEditer me) throws HeadlessException {
		this.menuEditer=me;
		System.out.println("              ................."+menuEditer.destination);
		this.lines=lines; //links
		this.combinasion=combinasion;
		frameName= title;
		Zoom.coef=1;
		this.setResizable(true);

		automate=new StateGraphAutomate();
		// Cr�ation de la repr�sentation de l'automate
		//automate = new StateGraphAutomate(lines);

		setTitle("Genotech - State graph");
		//		int hauteur = 700;
		//		int largeur = 1500;
		Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
		int hight = (int)screenSize.getHeight()-40;
		int width = (int)screenSize.getWidth()-40;
		int hightPanel=hight-80;
		setBounds(0,0,width, hight);
		setResizable(true);
		setLayout(null);


		//  definiton des composants de la frame
		stateBar = new StateBar();
		stateBar.setBounds(0,hightPanel+5,width,20);
		add(stateBar);

		//la zone graphique
		//zoneGraphique = new StateGraphGraphics(automate, stateBar);
		stateGraphGraphics = new StateGraphGraphics(automate, stateBar, this);
		stateGraphGraphics.setPreferredSize(new Dimension(stateGraphGraphics.getWidth(), stateGraphGraphics.getHeight()));
		stateGraphGraphics.revalidate();
		JScrollPane scroller = new JScrollPane(stateGraphGraphics);
		scroller.setBounds(5,5,(int)(width*3.5/5),hightPanel);
		add(scroller);

		//Construction de la barre de menus
		menuBar=new JMenuBar();

		//Construction du menu fichier
		menuFile= new JMenu("File");
		menuFile.setMnemonic(KeyEvent.VK_F);

		open =new JMenuItem("Open");
		open.setMnemonic(KeyEvent.VK_O);
		open.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_O, ActionEvent.CTRL_MASK));
		open.addActionListener(this);
		open.addMouseListener(this);

		register=new JMenuItem("Save");
		register.setMnemonic(KeyEvent.VK_E);
		register.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_E, ActionEvent.CTRL_MASK));
		register.addActionListener(this);
		register.addMouseListener(this);

		saveAs=new JMenuItem("Save As...");
		saveAs.setMnemonic(KeyEvent.VK_S);
		saveAs.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_S, ActionEvent.CTRL_MASK));
		saveAs.addActionListener(this);
		saveAs.addMouseListener(this);

		print = new JMenuItem("Print");
		print.setMnemonic(KeyEvent.VK_I);
		print.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_I, ActionEvent.CTRL_MASK));
		print.addActionListener(this);
		print.addMouseListener(this);

		zoom = new JMenuItem("Zoom");
		zoom.setMnemonic(KeyEvent.VK_Z);
		zoom.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Z, ActionEvent.CTRL_MASK));
		zoom.addActionListener(this);
		zoom.addMouseListener(this);

		showCycle= new JMenuItem("Show Cycles");
		showCycle.addActionListener(this);
		showCycle.addMouseListener(this);

		quite = new JMenuItem("Close");
		quite.setMnemonic(KeyEvent.VK_Q);
		quite.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Q, ActionEvent.CTRL_MASK));
		quite.addActionListener(this);
		quite.addMouseListener(this);

		menuFile.add(open);
		menuFile.addSeparator();
		menuFile.add(register);
		menuFile.add(saveAs);		
		menuFile.addSeparator();		
		menuFile.add(print);
		menuFile.addSeparator();
		menuFile.add(zoom);
		menuFile.addSeparator();
		menuFile.add(showCycle);
		menuFile.addSeparator();
		menuFile.add(quite);

		menuBar.add(menuFile);

		//Construction du menu exporter
		menuConversion= new JMenu("Conversion");
		menuConversion.setMnemonic(KeyEvent.VK_C);

		convGenEnXML=new JMenuItem("Convert DOT to  XML");
		convGenEnXML.setMnemonic(KeyEvent.VK_N);
		convGenEnXML.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_N, ActionEvent.CTRL_MASK));
		convGenEnXML.addActionListener(this);
		convGenEnXML.addMouseListener(this);

		convEquaEnXML=new JMenuItem("Convert Gene Equations  to XML");
		convEquaEnXML.setMnemonic(KeyEvent.VK_U);
		convEquaEnXML.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_U, ActionEvent.CTRL_MASK));
		convEquaEnXML.addActionListener(this);
		convEquaEnXML.addMouseListener(this);

		exporterGen=new JMenuItem("Export to  DOT format");
		exporterGen.setMnemonic(KeyEvent.VK_G);
		exporterGen.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_G, ActionEvent.CTRL_MASK));
		exporterGen.addActionListener(this);
		exporterGen.addMouseListener(this);

		menuConversion.add(exporterGen);
		menuConversion.addSeparator();
		menuConversion.add(convGenEnXML);
		menuConversion.add(convEquaEnXML);  

		menuBar.add(menuConversion);
		setJMenuBar(menuBar);

		menuHybridModeling= new JMenu("Hybrid Modeling");
		menuHybridModeling.setMnemonic(KeyEvent.VK_I);

		exporterHytech=new JMenuItem("Bio-LHA with rates {-1,0,1} in HyTech Format");
		exporterHytech.setMnemonic(KeyEvent.VK_H);
		exporterHytech.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_H, ActionEvent.CTRL_MASK));
		exporterHytech.addActionListener(this);
		exporterHytech.addMouseListener(this);

		phaver=new JMenuItem("Bio-LHA with rates {-1,0,1} in PhaVer Format");
		phaver.setMnemonic(KeyEvent.VK_P);
		phaver.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_P, ActionEvent.CTRL_MASK));
		phaver.addActionListener(this);
		phaver.addMouseListener(this);

		hyTechPathConstraints=new JMenuItem("Bio-LHA with Clock rates {0,1} in Hytech Format");
		hyTechPathConstraints.setMnemonic(KeyEvent.VK_C);
		hyTechPathConstraints.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_C, ActionEvent.CTRL_MASK));
		hyTechPathConstraints.addActionListener(this);
		hyTechPathConstraints.addMouseListener(this);

		menuHybridModeling.add(exporterHytech);
		menuHybridModeling.add(hyTechPathConstraints);
		menuHybridModeling.add(phaver);

		menuBar.add( menuHybridModeling);
		setJMenuBar(menuBar);


		pointPopup = new JPopupMenu();
		dltPointPopup = new JMenuItem("Delete a point");
		dltPointPopup.addActionListener(this);
		dltPointPopup.addMouseListener(this);
		pointPopup.add(dltPointPopup);  

		popupTrans = new JPopupMenu();
		popTransAddClou = new JMenuItem("Insert a point");
		popTransAddClou.addActionListener(this);
		popTransAddClou.addMouseListener(this);
		popupTrans.add(popTransAddClou);

		popupTrans.add(popTransAddClou);

		//Pour le zoom
		zoomPlus=new JButton("Zoom +");
		zoomMoins=new JButton("Zoom -");
		zoomPlus.addActionListener(this);
		zoomMoins.addActionListener(this);
		zoomFrame=new JFrame("ZOOM");
		zoomFrame.add(zoomPlus, BorderLayout.WEST);
		zoomFrame.add(zoomMoins, BorderLayout.EAST);
		zoomFrame.setBounds(200,50,0,0);
		zoomFrame.pack();
		zoomFrame.setResizable(false);
		zoomFrame.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		btnOk.addActionListener(this);

		// on cr�e le menu ?
		menuAide = new JMenu("Help");
		menuAide.setMnemonic(KeyEvent.VK_H);


		aide = new JMenuItem("Help");
		aide.setMnemonic(KeyEvent.VK_L);
		aide.addActionListener(this);
		aide.addMouseListener(this);

		aPropos = new JMenuItem("About");
		aPropos.setMnemonic(KeyEvent.VK_P);
		aPropos.addActionListener(this);
		aPropos.addMouseListener(this);

		menuAide.add(aide);
		menuAide.addSeparator();
		menuAide.add(aPropos);

		menuBar.add(menuAide);
		menuAide.addMouseListener(this);

		/*
		 * Nombre de combinasion trait�es
		 */
		int K=0; 
		int widthZone=0;
		int hightZone=0;

		HashMap<Vector<Integer>,Vector<Integer>> statePostition=new HashMap<Vector<Integer>,Vector<Integer>>();
		HashMap<Integer,Vector<Integer>> correspondance=new HashMap<Integer,Vector<Integer>>();
		if (combinasion.lastElement().size()==1) //case absurd but good
		{
			int X=1;
			int Y=1;
			for (Vector<Integer> states : combinasion){

				stateGraphGraphics.auto.vStates.add(new State(states.toString(), 100*X, 100*Y, K, lines.get(states).size()==0));
				Vector<Integer> position=new Vector<Integer>();
				position.add(100*X);
				position.add(100*Y);
				position.add(K);
				statePostition.put(states,position);
				correspondance.put(K, states);
				X++;
				K++;
			}
			widthZone=100*(combinasion.size()+2);
			hightZone=100*(Y+1);
		}
		else if (combinasion.lastElement().size()==2)
		{
			for (int second=1; second<=combinasion.lastElement().get(1)+1; second++)
			{
				for (int premier=1; premier<=combinasion.lastElement().get(0)+1; premier++)
				{
					Vector<Integer> state=new Vector<Integer>();
					state.add(premier-1);
					state.add(second-1);
					stateGraphGraphics.auto.vStates.add(new State(state.toString(), 100*premier, 100*second, K, lines.get(state).size()==0));
					Vector<Integer> position=new Vector<Integer>();
					position.add(100*premier);
					position.add(100*second);
					position.add(K);
					statePostition.put(state,position);
					correspondance.put(K, state);
					K++;
				}
			}
			widthZone=100*(combinasion.lastElement().get(0)+2);
			hightZone=100*(combinasion.lastElement().get(1)+2);
		}
		else 
		{
			double sqrRootCombinasionSize=Math.floor(Math.sqrt(combinasion.size()));
			int columns=0; // nombre de colonnes
			int line=0; //nombre de lignes
			double limitVal=Math.min(sqrRootCombinasionSize, combinasion.size()-K);
			while (combinasion.size()-K>0) // Tant qu'il reste des combinasion a traiter
			{
				columns++;				
				for (int lineCounter=1; lineCounter<=limitVal; lineCounter++)
				{
					stateGraphGraphics.auto.vStates.add(new State(combinasion.get(K).toString(), 100*columns, 100*lineCounter, K, lines.get(combinasion.get(K)).size()==0));
					Vector<Integer> position=new Vector<Integer>();
					position.add(100*columns);
					position.add(100*lineCounter);
					position.add(K);
					statePostition.put(combinasion.get(K),position);
					correspondance.put(K, combinasion.get(K));
					K++;
					if(sqrRootCombinasionSize*columns>=combinasion.size()){
						limitVal=sqrRootCombinasionSize-(sqrRootCombinasionSize*columns-combinasion.size());
					}
					else{
						limitVal=sqrRootCombinasionSize;
					}					
					line=Math.max(line,lineCounter);
				}
			}
			widthZone=100*(columns+1);
			hightZone=100*(line+1);
		}

		for (int i = 0; i < automate.vStates.size(); i++) {		
			automate.vStates.get(i).label = automate.vStates.get(i).label.replace("[", "");
			automate.vStates.get(i).label = automate.vStates.get(i).label.replace("]", "");
			automate.vStates.get(i).label = automate.vStates.get(i).label.replace(" ", ""); 
		}

		setVisible(true);

		stateGraphGraphics.setPreferredSize(new Dimension(2*widthZone, 2*hightZone));
		stateGraphGraphics.revalidate();
		validate();
		initialWidth=2*widthZone;

		stateGraphGraphics.auto.correspondance=correspondance;

		for(Vector<Integer> states : combinasion){
			if (lines.get(states).size()!=0)
			{
				for (Vector<Integer> arriv : lines.get(states))
				{
					Vector<Integer> clou=new Vector<Integer>();
					TransState newTrans = new TransState(statePostition.get(states).get(2), statePostition.get(arriv).get(2), statePostition.get(states).get(0), statePostition.get(states).get(1), statePostition.get(arriv).get(0), statePostition.get(arriv).get(1), clou);

					stateGraphGraphics.auto.vTranStates.add(newTrans);

					newTrans.calculate();
				}
			}
		}

		stateGraphGraphics.revalidate();
		validate();
		stateGraphGraphics.auto.drawGraphics(stateGraphGraphics.getGraphics(), Color.black);
		stateGraphGraphics.draw();


		BufferedImage image = (BufferedImage)createImage(getContentPane().getSize().width,getContentPane().getSize().height);
		getContentPane().paint(image.getGraphics());
		Global.image=image;
		if(Global.pipe)
		{
			Global.pipe=false;
			ActionEvent e=new ActionEvent(exporterHytech,3, "");
			actionPerformed(e);
			check=true;
		}//Le panelChoix et ses boutons


	}
	public void actionPerformed(ActionEvent e) {
		Object source = e.getSource();
		if (stateBar.can == true) {
			if (source == open){
				stateBar.can = false;
				stateBar.displayInfo("Opening a file");
				boolean modif = automate.getModif();
				if (modif == false) {
					fileChooser = new JFileChooser();
					fileChooser.addChoosableFileFilter(new FiltreXml());
					int returnVal = fileChooser.showOpenDialog(this);
					if (returnVal == JFileChooser.APPROVE_OPTION) {
						//Charger un graphe d'�tats
						Opening();
					} 
				} else {
					int n = JOptionPane.showConfirmDialog(this, " The current document has not been saved since the last  modification.\n Do you want to continue ?","New document",JOptionPane.YES_NO_OPTION);
					if (n == JOptionPane.YES_OPTION) {
						fileChooser = new JFileChooser();
						fileChooser.addChoosableFileFilter(new FiltreXml());
						int returnVal = fileChooser.showOpenDialog(this);
						if (returnVal == JFileChooser.APPROVE_OPTION) {
							//Charger un graphe d'�tats
							Opening();
						} 
					}
				}
				stateBar.can = true;                  
				stateGraphGraphics.revalidate();	
			}
			else if ((source == register) && (test == false)) {
				stateBar.can = false;
				stateBar.displayInfo("Saving file");
				WriteFile m = new WriteFile();
				m.writeFile(destination, automate);
				m.treatmentStateGraph();
				stateBar.can = true;
				automate.modif(false);
				stateBar.displayInfo(frameName);
			}
			else if ((source == saveAs) || ((source == register) && (test))) {
				stateBar.can = false;
				stateBar.displayInfo("Save a file");
				fileChooser = new JFileChooser();
				fileChooser.addChoosableFileFilter(new FiltreXml());
				int returnVal = fileChooser.showSaveDialog(this);
				if (returnVal == JFileChooser.APPROVE_OPTION) {
					File file = fileChooser.getSelectedFile();
					WriteFile m = new WriteFile();
					destination = file.getAbsolutePath();
					frameName=file.getName();
					Utils extension = new Utils();
					if (extension.getExtension(file) == null) {
						destination = destination + ".xml";
					}
					m.writeFile(destination, automate);
					m.treatmentStateGraph();
					test = false;
					automate.modif(false);
				}
				stateBar.displayInfo(frameName);
				stateBar.can = true;
			}
			else if (source== showCycle){

				System.out.println("shows cycles...............");
				String destination1="temporaire.hy";
				String destination2="temporaire.txt";
				File file=new File(destination1);
				try {
					PrintWriter printWriter = new PrintWriter(new FileWriter(destination1),true);
					PrintWriter printWriter2 = new PrintWriter(new FileWriter(destination2),true);

					cycles= menuEditer.calculateCycle(true, file, printWriter, printWriter2,this);
					File f = new File(destination1);
					f.delete();
					File f2 = new File(destination2);
					f2.delete();
				} catch (Exception e1) {	
					e1.printStackTrace();
				}				



				listCycles = new Object[cycles.size()] ;
				listOneState = new Object[combinasion.size()] ;
				lisTwoSate = new Object[combinasion.size()] ;
				listThreeState = new Object[combinasion.size()] ;
				this.cycles=cycles;
				for (int i=0; i<combinasion.size(); i++)
				{
					listOneState[i]=combinasion.get(i).toString();
					lisTwoSate[i]=combinasion.get(i).toString();
					listThreeState[i]=combinasion.get(i).toString();
				}
				for (int j=0; j<cycles.size();j++)
				{
					listCycles[j]="cycle no"+j;
				}
				Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
				int hight = (int)screenSize.getHeight()-40;
				int width = (int)screenSize.getWidth()-35;
				int hightPanel=hight-80;
				panelChoice = new JPanel();
				panelChoice.setBounds(5+(int)(width*3.5/5),5,(int)(width*1.5/5)-5,hightPanel);
				panelChoice.setLayout(null);

				btnPath = new JButton ("Show path");
				btnPath.setBounds(20,10,300,25);
				btnPath.addActionListener(this);	

				JLabel label= new JLabel("Between the states:");
				label.setBounds(90,40,140,25);
				panelChoice.add(label);

				oneState = new JComboBox(listOneState);
				oneState.setBounds(20,70,140,25);

				label= new JLabel("and");
				label.setBounds(170,70,15,25);
				panelChoice.add(label);

				twoState = new JComboBox(lisTwoSate);
				twoState.setBounds(190,70,140,25);

				btnCycle = new JButton ("Show cycle");
				btnCycle.setBounds(20,130,300,25);
				btnCycle.addActionListener(this);

				cyclesBox = new JComboBox(listCycles);
				cyclesBox.setBounds(100,160,140,25);

				btnReset = new JButton ("Clear") ;
				btnReset.setBounds(20,300,300,25);
				btnReset.addActionListener(this);

				threeState = new JComboBox(listThreeState);
				threeState.setBounds(100,250,140,25);

				btnNeighbor = new JButton ("Show neighboring  states");
				btnNeighbor.setBounds(20,220,300,25);      
				btnNeighbor.addActionListener(this);

				//jTxtCycle.setEditable(false);
				///jTxtCycle.setBackground(Color.WHITE);
				Global.pcycles=new String[cycles.size()+2];
				Global.pcycles[0]="Complete Hybrid Model (-1, 0, 1)";
				Global.pcycles[1]="Complete Hybrid Model (0, 1)";
				for (int k=0; k<cycles.size(); k++)	
				{
					Global.pcycles[k+2]="Cycle no"+k+" :"+cycles.get(k).toString()+"\n"+"\n";
					//jTxtCycle.setText(jTxtCycle.getText()+"Cycle no"+k+" :"+cycles.get(k).toString()+"\n"+"\n");			
				}
				//scrollpane_texteCycle=new JScrollPane(jTxtCycle);
				//scrollpane_texteCycle.setBounds(10,340,(int)(width*1.5/5)-30,300);
				
				final JList listbox;
				listbox = new JList(Global.pcycles);
				JScrollPane scrollPane = new JScrollPane();
				scrollPane.setViewportView(listbox);
				listbox.addListSelectionListener(new ListSelectionListener() {
					@Override
					public void valueChanged(ListSelectionEvent arg0) {
						if (!arg0.getValueIsAdjusting()) {
							Global.index=listbox.getSelectedIndex();
							Global.hfmt=Global.index==1?"hyTechPathConstraints":"exporterHytech";
							//listbox.setEnabled(false);
								actionPerformed(new ActionEvent(btnOk,8,""));		
						}
					}
				});
				scrollPane.setBounds(10,340,(int)(width*1.5/5)-30,300);
				scrollPane.revalidate();			
				
				panelChoice.add(btnPath);
				panelChoice.add(oneState);
				panelChoice.add(twoState);
				panelChoice.add(threeState);
				panelChoice.add(btnCycle);
				panelChoice.add(cyclesBox);
				panelChoice.add(btnReset);
				panelChoice.add(btnNeighbor);
				panelChoice.add(scrollPane);
				add(panelChoice);

				stateGraphGraphics.revalidate();
				validate();			
				stateGraphGraphics.draw();

			}




			else if (source == exporterGen) {
				stateGraphGraphics.auto.decolore();
				fileChooser = new JFileChooser();
				fileChooser.addChoosableFileFilter(new FiltreGen());
				int returnVal = fileChooser.showSaveDialog(this.stateGraphGraphics);
				if (returnVal == JFileChooser.APPROVE_OPTION) {
					File file = fileChooser.getSelectedFile();
					FileGen m = new FileGen();
					destination = file.getAbsolutePath();
					Utils extension = new Utils();
					if (extension.getExtension(file) == null) {
						destination = destination + ".dot";
					}
					m.writeGenStateGraph(destination, stateGraphGraphics.auto);
					m.treatmentGenStateGraph();
				}
				stateGraphGraphics.repaint();
			} else if (source == aide) {
				stateBar.displayDefo();
				Properties sys = System.getProperties();
				String os = sys.getProperty("os.name");
				Runtime r = Runtime.getRuntime();
				String sep = java.io.File.separator;
				try {
					if (os.endsWith("NT")||os.endsWith("2000")||os.endsWith("XP")||os.endsWith("Vista")) {
						r.exec("cmd /c start " + getClass().getResource("Tuto_Genotech.pdf"));
					} else {
						r.exec("start " + getClass().getResource("Tuto_Genotech.pdf"));
					}
				}
				catch (IOException ex) {
				}				
			}
			else if (source==aPropos){
				new About();
			}
			else if (source == exporterHytech || source == hyTechPathConstraints || source== phaver) 
			{

				actionPerformed(new ActionEvent(showCycle, 0, "cycle"));
				if(source==exporterHytech )
					hytechOption="exporterHytech";
				if(source==hyTechPathConstraints )
					hytechOption="hyTechPathConstraints";
				if(source==phaver )
					hytechOption="phaver";

				
							
/*
				inputFrame=new JDialog();
				inputFrame.setName("Hytech Values");
				JPanel ConHytech=new JPanel();
				ConHytech.setPreferredSize(new Dimension(400,100));
				JPanel pnlHytech1=new JPanel();
				JLabel lbInitailaLoca=new JLabel("Initial Location");
				initialValue=new JTextField();
				initialValue.setPreferredSize(new Dimension(200,30));
				pnlHytech1.add(lbInitailaLoca);
				pnlHytech1.add(initialValue);

				JPanel pnlHytech2=new JPanel();
				JLabel lbInitialClock=new JLabel("Initial Clock Region");
				txFlInitaialClock=new JTextField(); 
				txFlInitaialClock.setPreferredSize(new Dimension(200,30));
				pnlHytech2.add(lbInitialClock);
				pnlHytech2.add(txFlInitaialClock);

				JPanel pnlHytech3=new JPanel();

				pnlHytech3.add(btnOk);
				ConHytech.add(pnlHytech1);
				ConHytech.add(pnlHytech2);
				ConHytech.add(pnlHytech3);
				inputFrame.add(ConHytech);

				inputFrame.setBounds(500,500,100,100);
				inputFrame.getContentPane().setPreferredSize(new Dimension(350, 150));
				inputFrame.pack();
				inputFrame.setResizable(false);
				inputFrame.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
				inputFrame.show();
				revalidate();
				repaint();
				//                           if(source == btnOk){
				//				stateGraphGraphics.auto.decolore();
				//				fileChooser = new JFileChooser();
				//				fileChooser.addChoosableFileFilter(new FiltreHyT());
				//				int returnVal = fileChooser.showSaveDialog(this.stateGraphGraphics);
				//				if (returnVal == JFileChooser.APPROVE_OPTION) {
				//					File file = fileChooser.getSelectedFile();
				//					destination = file.getAbsolutePath();
				////					Utils extension = new Utils();
				////					if (extension.getExtension(file) == null) {
				////						destination = destination ;
				////					}					
				//					FileHyTech m = new FileHyTech(initialValue.getText(),txFlInitaialClock.getText(),destination, automate, file) ;
				//                                        inputFrame.dispose();
				//                                       // newHytech m= new newHytech(destination, automate, file) ;
				//                                        if(source== exporterHytech)
				//                                            m.hyTechTreatment();
				//					//m.hyTechTreatment();
				//                                       if(source== phaver)
				//                                            m.hyTechPhaver();
				//                                        if(source == hyTechPathConstraints)
				//                                            m.hyTechTreatment2();
				//				}
				//				stateGraphGraphics.repaint();	
				//                           }
				 * 
				 */
			}
			else if(source == btnOk){
				System.out.println("OK Button");
				if(check)
				{
					check=false;
					File file = new File("GRN.hy");
					destination = file.getAbsolutePath();					
					FileHyTech m = new FileHyTech("","",destination, automate, file) ;
					if(Global.hfmt== "exporterHytech")
						m.hyTechTreatment();
					if(hytechOption== "phaver")
						m.hyTechPhaver();
					if(Global.hfmt == "hyTechPathConstraints")
						m.hyTechTreatment2();
					MainFrame.HyTech();
					this.hide();
				}
				else
				{
					File file = new File("GRN.hy");
					destination = file.getAbsolutePath();					
					FileHyTech m = new FileHyTech("","",destination, automate, file) ;
					if(Global.hfmt== "exporterHytech")
						m.hyTechTreatment();
					if(hytechOption== "phaver")
						m.hyTechPhaver();
					if(Global.hfmt == "hyTechPathConstraints")
						m.hyTechTreatment2();
					JOptionPane.showMessageDialog(null, "Hybrid model saved as GRN.hy in home directory" );
				}
				//inputFrame.dispose();
				stateGraphGraphics.repaint();		 
			}
			else if (source == convEquaEnXML) {
				stateGraphGraphics.auto.decolore();				
				try {
					//***********************
					ConvertirEquationEnXMLGE cve = new ConvertirEquationEnXMLGE(this);
					cve.convertEquaToGE();	
					//					***********************
					//ConvertirEquationEnXMLGE.convertEquaToGE();		

				} catch (IOException e1) {					
					e1.printStackTrace();
				}				
				stateGraphGraphics.repaint();			
			}

			else if (source == convGenEnXML) {
				stateGraphGraphics.auto.decolore();				
				try {
					ConvertirGenEnXMLGE.convertGenToXml();
				} catch (IOException e1) {					
					e1.printStackTrace();
				}				
				stateGraphGraphics.repaint();				
			}

			else if(source == print){
				stateBar.can = false;
				stateBar.displayInfo("Priniting of state graph...");
				new Printer(this.stateGraphGraphics,frameName );
				stateBar.can = true;
				stateBar.displayInfo(frameName);
			}

			else if (source==zoom){
				zoomFrame.show();
			}

			else if (source==zoomPlus && Zoom.coef<5){
				Zoom.coef*=1.1;
				new Zoom(stateGraphGraphics);
			}

			else if (source==zoomMoins && Zoom.coef>=0.7){
				Zoom.coef/=1.1;
				new Zoom(stateGraphGraphics);
			}


			else if (source == dltPointPopup) {
				automate.modif = true;
				(((TransState)(automate.vTranStates.get(stateGraphGraphics.numPoint))).points).removeElementAt(stateGraphGraphics.posOfPoint);
				((TransState)automate.vTranStates.get(stateGraphGraphics.numPoint)).calculate();
				stateGraphGraphics.draw();					
			} else if (source == popTransAddClou) {
				TransState transCt = stateGraphGraphics.transAddClou;
				Point point = new Point(stateGraphGraphics.pointX, stateGraphGraphics.pointY);
				Point memory = new Point(-100, -100);
				boolean affecte = false;
				int i = 0;
				int numPoint = 0;
				while (affecte == false) {
					int x = (int)Math.round(transCt.plot.get(i,0));
					int y = (int)Math.round(transCt.plot.get(i,1));
					if ((stateGraphGraphics.pointX >= x - 5) && (stateGraphGraphics.pointX <= x + 5) && (stateGraphGraphics.pointY >= y - 5) && (stateGraphGraphics.pointY <= y + 5)) {
						if (numPoint == transCt.points.size()) {
							transCt.points.add(point);
						} else {
							transCt.points.insertElementAt(point, numPoint);
						}
						affecte = true;
					}
					if ((affecte == false) && (transCt.points.size() > numPoint)) {
						Point pointCt = (Point) transCt.points.get(numPoint);
						if ((pointCt.x >= x - 5) && (pointCt.x <= x + 5) && (pointCt.y >= y - 5) && (pointCt.y <= y + 5) && (pointCt != memory)) {
							numPoint++;
							memory = pointCt;
						}
					}
					i++;
				}
				automate.modif = true;
				transCt.calculate();
				stateGraphGraphics.draw();

			}			

			stateGraphGraphics.draw();				
		}		

		else if (source == quite) {
			stateBar.can = false;
			boolean modif = automate.getModif();
			if (modif == false) {
				dispose();
			}
			else{
				int n = JOptionPane.showConfirmDialog(this, "The current document has not been saved since the last  modification.\n Do you want to continue  ?","Close",JOptionPane.YES_NO_OPTION);
				if (n == JOptionPane.YES_OPTION) {
					dispose();
				}
			}
			stateBar.can = true;				
		}

		if(source == btnReset)
		{
			stateGraphGraphics.auto.decolore();
			stateGraphGraphics.repaint();
		}

		if(source == btnCycle)
		{
			stateGraphGraphics.auto.decolore();
			stateGraphGraphics.auto.colore(cycles.get(cyclesBox.getSelectedIndex()), true);
			stateGraphGraphics.repaint();
		}

		if(source == btnPath)
		{			
			stateGraphGraphics.auto.decolore();			
			Path path=new Path(lines, combinasion.get(oneState.getSelectedIndex()),combinasion.get(twoState.getSelectedIndex()));
			if (path.paths.size()!=0){

				for (int i=0; i<path.paths.size(); i++)
				{									
					stateGraphGraphics.auto.colore(path.paths.get(i), false);					
				}
			}
			for (State etat : stateGraphGraphics.auto.vStates)	{
				/*
				 * dans combinasion apres le toString on a des '[' ']' et ' ' � remplacer par ""
				 * Il faut effectuer untraitement pour comparer les etiquettes des �tats avec
				 */							
				String aComparerUn = combinasion.get(oneState.getSelectedIndex()).toString();
				String aComparerDeux = combinasion.get(twoState.getSelectedIndex()).toString();
				aComparerUn = aComparerUn.replace("[", "");
				aComparerUn = aComparerUn.replace("]", "");
				aComparerUn = aComparerUn.replace(" ", ""); 
				aComparerDeux = aComparerDeux.replace("[", "");
				aComparerDeux = aComparerDeux.replace("]", "");
				aComparerDeux = aComparerDeux.replace(" ", ""); 						
				if (etat.label.equals(aComparerUn) || etat.label.equals(aComparerDeux)){
					etat.couleurFond=Color.green;
				}
			}			

			stateGraphGraphics.revalidate();
			validate();			
			stateGraphGraphics.draw();
		}		

		if(source == btnNeighbor)
		{
			stateGraphGraphics.auto.decolore();		
			State selectedState=null;	
			ArrayList<Integer> lesIndexDesEtatsAAfficherEnGris = new ArrayList<Integer>(); 
			ArrayList<State> greyStates = new ArrayList<State>(); 
			for (State state : stateGraphGraphics.auto.vStates)	{									
				String aComparerUn = combinasion.get(threeState.getSelectedIndex()).toString();				
				aComparerUn = aComparerUn.replace("[", "");
				aComparerUn = aComparerUn.replace("]", "");
				aComparerUn = aComparerUn.replace(" ", ""); 										
				if (state.label.equals(aComparerUn)){
					state.couleurFond=Color.green;
					selectedState=state;
				}				
			}
			// Pour trouver les transitions a colorer en vert et les etats a coler en gris
			for (int i = 0; i < stateGraphGraphics.auto.vTranStates.size(); i++) {
				if (stateGraphGraphics.auto.vTranStates.get(i).getNumInitialState()==selectedState.getNum()) {					
					stateGraphGraphics.auto.vTranStates.get(i).selectedGreen=1;
					lesIndexDesEtatsAAfficherEnGris.add(stateGraphGraphics.auto.vTranStates.get(i).getNumFinalState());
				}
				if (stateGraphGraphics.auto.vTranStates.get(i).getNumFinalState()==selectedState.getNum()) {					
					stateGraphGraphics.auto.vTranStates.get(i).selectedGreen=1;
					lesIndexDesEtatsAAfficherEnGris.add(stateGraphGraphics.auto.vTranStates.get(i).getNumInitialState());
				}
			}
			// Colorer en gris les etats voisins			
			for (int i = 0; i < stateGraphGraphics.auto.vStates.size(); i++) {
				if (lesIndexDesEtatsAAfficherEnGris.contains(stateGraphGraphics.auto.vStates.get(i).getNum())) {
					stateGraphGraphics.auto.vStates.get(i).couleurFond=Color.gray;
				}
			}			
			stateGraphGraphics.revalidate();
			validate();			
			stateGraphGraphics.draw();
		}

	}


	/**
	 * permet d'afficher les diff�rentes informations dans la barre d'�tat
	 * @param e evenement d�clench� par l'entr�e de la souris sur un menu
	 */ 
	public void mouseEntered(MouseEvent e) {
		Object source = e.getSource();
		if (source == open) {
			stateBar.displayInfo("Open an existing file");   
		} else if (source == register) {
			stateBar.displayInfo("Save the current file");
		} else if (source == saveAs) {
			stateBar.displayInfo("Save as the current file");
		} 
		else if(source==showCycle){
			stateBar.displayInfo("Show Cycles");
		}else if (source == print){
			stateBar.displayInfo("Print state graph");
		} else if (source == zoom){
			stateBar.displayInfo("Zoom");
		}


	}

	/**
	 * permet de remettre la barre d'�tat � son �tat initial
	 * @param e evenement d�clench� par la sortie de la souris du menu
	 */ 
	public void mouseExited(MouseEvent e) {}

	public void Opening() {

		// code pour l'Opening

		automate.deleteState();
		automate.deleteTranState();
		File file = fileChooser.getSelectedFile();
		stateBar.displayInfo(file.getName());
		automate.deleteTransGeneNames();
		test = false ;
		destination = file.getAbsolutePath();
		ReadXMLGE m = new ReadXMLGE(destination, automate, this.stateGraphGraphics);
		m.parse();
		int maxX = 0;
		int maxY = 0;
		int i, j;
		for (i = 0; i < automate.vStates.size(); i = i + 1) {
			State etatCt = (State) automate.vStates.get(i);
			if (etatCt.getX() > maxX) {
				maxX = etatCt.getX();
			}
			if (etatCt.getY() > maxY) {
				maxY = etatCt.getY();
			}
		}
		for (i = 0; i < automate.vTranStates.size(); i = i + 1)  {
			TransState transCt = (TransState) automate.vTranStates.get(i);
			transCt.calculate();
		}

		for (i = 0; i < automate.vTranStates.size(); i = i + 1)  {
			TransState transCt = (TransState) automate.vTranStates.get(i);
			for (j = 0; j < transCt.plot.getRowDimension(); j = j + 1) {
				if ((int)Math.round(transCt.plot.get(j,0)) > maxX) {
					maxX = (int)Math.round(transCt.plot.get(j,0));
				}
			}
			for (j = 0; j < transCt.plot.getColumnDimension(); j = j + 1) {
				if ((int)Math.round(transCt.plot.get(j,1)) > maxY) {
					maxY = (int)Math.round(transCt.plot.get(j,1));
				}
			}
		}
		int abs = maxX + 60;
		int ord = maxY + 60;
		int vuX = this.x;
		int vuY = this.y;
		if (abs <= vuX) {
			if (ord <= vuY) {
				stateGraphGraphics.setPreferredSize(new Dimension(vuX - 3, vuY)); 
				stateGraphGraphics.revalidate();
			} else {
				stateGraphGraphics.setPreferredSize(new Dimension(vuX - 3, ord)); 
				stateGraphGraphics.revalidate();
			}
		} else {
			if (ord <= vuY) {
				stateGraphGraphics.setPreferredSize(new Dimension(abs, vuY)); 
				stateGraphGraphics.revalidate();
			} else {
				stateGraphGraphics.setPreferredSize(new Dimension(abs, ord)); 
				stateGraphGraphics.revalidate();
			}
		}
		oneState.removeAllItems();
		twoState.removeAllItems();
		threeState.removeAllItems();		
		//updating COmbination
		Vector<Vector<Integer>> newComb = new Vector<Vector<Integer>>() ;
		for (int k = 0; k < automate.vStates.size(); k++) {
			Vector<Integer> level = new Vector<Integer>();
			for (int z = 0; z < automate.vGeneNames.size(); z++) {
				level.add(Integer.parseInt(automate.vStates.get(k).getEtiquette().substring(2*z, 2*z+1)));			
			}
			newComb.add(level);
		}
		combinasion=newComb;		
		listOneState = new Object[combinasion.size()] ;
		lisTwoSate = new Object[combinasion.size()] ;
		listThreeState = new Object[combinasion.size()] ;
		for (int y=0; y<combinasion.size(); y++)
		{
			listOneState[y]=combinasion.get(y).toString();
			lisTwoSate[y]=combinasion.get(y).toString();
			listThreeState[y]=combinasion.get(y).toString();
			oneState.addItem(listOneState[y]); 
			twoState.addItem(lisTwoSate[y]); 
			threeState.addItem(listThreeState[y]);
		}			
		//MAj des liens		
		lines.clear();		
		for (int k = 0; k < combinasion.size(); k++) {
			LinkedList<Vector> childNode = new LinkedList<Vector>();
			int stateNum=0;
			String stateLabel=combinasion.get(k).toString();						
			stateLabel=stateLabel.replace("[", ""); 
			stateLabel=stateLabel.replace("]", ""); 
			stateLabel=stateLabel.replace(" ", ""); 
			for (int index1 = 0; index1 < automate.vStates.size(); index1++) {
				if (automate.vStates.get(index1).getEtiquette().equals(stateLabel)) {
					stateNum = automate.vStates.get(index1).getNum();						
				}
			}			
			//Search numbers of son states
			ArrayList<Integer> lesNumEtatsFils = new ArrayList<Integer>();
			for (int index1 = 0; index1 < automate.vTranStates.size(); index1++) {
				if (automate.vTranStates.get(index1).getNumInitialState()==stateNum) {
					lesNumEtatsFils.add(automate.vTranStates.get(index1).getNumFinalState());
				}
			}
			//Search of corresponding states			
			ArrayList<State> lesEtatsFils = new ArrayList<State>();

			for (int index1 = 0; index1 < automate.vStates.size(); index1++) {
				if (lesNumEtatsFils.contains(automate.vStates.get(index1).getNum())) {
					lesEtatsFils.add(automate.vStates.get(index1));
				}
			}								
			for (int index1 = 0; index1 < lesEtatsFils.size(); index1++) {	
				String label = lesEtatsFils.get(index1).getEtiquette();
				for (int index2 = 0; index2 < combinasion.size(); index2++) {
					String aComparer = combinasion.get(index2).toString();
					aComparer=aComparer.replace("[", ""); 
					aComparer=aComparer.replace("]", ""); 
					aComparer=aComparer.replace(" ", ""); 
					if (aComparer.equals(label)) {
						childNode.add(combinasion.get(index2));
					}
				}				
			}					
			lines.put(combinasion.get(k), childNode);
		}			

		//MAJ des corrrespondances
		automate.correspondance.clear();
		for (int k = 0; k < combinasion.size(); k++) {
			automate.correspondance.put(k, combinasion.get(k));
		}	


		//		************************
		// MAJ des cycles
		cycles.clear();	
		Cycle listeCycles = new Cycle(lines, combinasion);
		for (int k=0; k<cycles.size();k++)	{
			listCycles[k]="cycle n�"+k;
			cycles.add(cycles.get(k));
		}
		cycles=listeCycles.cycles;		
		cyclesBox.removeAllItems();
		for (int y=0; y<cycles.size(); y++)
		{			
			cyclesBox.addItem("cycle no"+y);			
		}		

/*
		jTxtCycle.setText("");
		scrollpane_texteCycle.removeAll();
		jTxtCycle.setEditable(false);
		jTxtCycle.setBackground(Color.WHITE);

		for (int k=0; k<cycles.size(); k++)	{
			jTxtCycle.setText(jTxtCycle.getText()+"Cycle no"+k+" :"+cycles.get(k).toString()+"\n"+"\n");			
		}
		Dimension tailleEcran = java.awt.Toolkit.getDefaultToolkit().getScreenSize();		
		int largeur = (int)tailleEcran.getWidth()-35;

		panelChoice.remove(scrollpane_texteCycle);	

		scrollpane_texteCycle = new JScrollPane(jTxtCycle);		
		scrollpane_texteCycle.setBounds(10,340,(int)(largeur*1.5/5)-30,300);
		if (cycles.size()>0){
			panelChoice.add(scrollpane_texteCycle);
		}
*/
		panelChoice.validate();			
		stateGraphGraphics.draw();
		test = false;
		automate.modif(false);
	}


	public void mouseClicked(MouseEvent e) {}
	public void mousePressed(MouseEvent e) {}
	public void mouseReleased(MouseEvent e) {}


}



