import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Vector;

import javax.swing.*;

public class SimpleFenetre extends JFrame implements ActionListener{

	/**
	 * 
	 */
	public LinkedList<LinkedList<Vector>> cycles;
	private static final long serialVersionUID = 1L;
	private JPanel container = null;//D�claration de l'objet JPanel	
	private FlowLayout layout = null ;//D�claration de notre layout
	private JComboBox oneState = null ;
	private Object[] listOneState;
	private JComboBox twoStates = null ;
	private Object[] listTwoStates;
	private JComboBox cyclesBox = null ;
	private Object[] listCycles;
	private TextArea textCycle = new TextArea() ;
	private JButton btnCycle = null;//D�claration du bouton
	private JButton btnPath = null;
	private JButton btnReset = null;
	StateGraphGraphics stateGraphGraphics;
	HashMap<Vector, LinkedList<Vector>> lines;
	Vector<Vector<Integer>> combinasion;


	public SimpleFenetre(LinkedList<LinkedList<Vector>> cycles, StateGraphGraphics zoneGraphique, HashMap<Vector, LinkedList<Vector>> liens, Vector<Vector<Integer>> combinaisons){
		super();
		stateGraphGraphics=zoneGraphique;
		this.lines=liens;
		this.combinasion=combinaisons;
		listCycles = new Object[cycles.size()] ;
		listOneState = new Object[combinaisons.size()] ;
		listTwoStates = new Object[combinaisons.size()] ;
		this.cycles=cycles;
		for (int i=0; i<combinaisons.size(); i++)
		{
			listOneState[i]=combinaisons.get(i).toString();
			listTwoStates[i]=combinaisons.get(i).toString();
		}

		for (int j=0; j<cycles.size();j++)
		{
			listCycles[j]="cycle No"+j;
		}
		build();//On initialise notre fen�tre
	}

	private void build(){
		this.setTitle("Choice"); //On donne un titre � l'application
		this.setSize(650,350); //On donne une taille � notre fen�tre
		this.setLocationRelativeTo(null); //On centre la fen�tre sur l'�cran
		this.setResizable(false) ;
		this.setContentPane(getContainer());
	}

	private JPanel getContainer(){
		layout = new FlowLayout(); //Instanciation du layout
		layout.setAlignment(FlowLayout.CENTER);//On centre les composants

		container = new JPanel() ; //On cr�e notre objet
		container.setLayout(layout); //On applique le layout

		
		textCycle.setEditable(false);
		textCycle.setPreferredSize(new Dimension(600,200)) ;
		for (int k=0; k<cycles.size(); k++)
		{
			textCycle.setText(textCycle.getText()+"Cycle no"+k+" :"+cycles.get(k).toString()+"\n"+"\n"); //On lui donne un texte
			container.add(textCycle);//On l'ajoute au container
		}

		
		btnPath = new JButton () ;//Cr�ation du bouton
		btnPath.setPreferredSize(new Dimension(200,25)) ;//On lui donne une taille
		btnPath.setText("Show path") ;//On lui donne un texte
		btnPath.addActionListener(this);//On ajoute la fen�tre en tant qu'�couteur du bouton
		container.add(btnPath);//On l'ajoute � la fen�tre

		oneState = new JComboBox(listOneState);//On cr�e la liste en lui donnant un tableau d'op�rateurs
		oneState.setPreferredSize(new Dimension(140,25));//On lui donne une taille
		container.add(oneState); //on l'ajoute � la fen�tre

		twoStates = new JComboBox(listTwoStates);//On cr�e la liste en lui donnant un tableau d'op�rateurs
		twoStates.setPreferredSize(new Dimension(140,25));//On lui donne une taille
		container.add(twoStates); //on l'ajoute � la fen�tre

		btnCycle = new JButton () ;//Cr�ation du bouton
		btnCycle.setPreferredSize(new Dimension(300,25)) ;//On lui donne une taille
		btnCycle.setText("Show cycle") ;//On lui donne un texte
		btnCycle.addActionListener(this);//On ajoute la fen�tre en tant qu'�couteur du bouton
		container.add(btnCycle);//On l'ajoute � la fen�tre

		cyclesBox = new JComboBox(listCycles);//On cr�e la liste en lui donnant un tableau d'op�rateurs
		cyclesBox.setPreferredSize(new Dimension(120,25));//On lui donne une taille
		container.add(cyclesBox); //on l'ajoute � la fen�tre

		btnReset = new JButton () ;//Cr�ation du bouton
		btnReset.setPreferredSize(new Dimension(400,25)) ;//On lui donne une taille
		btnReset.setText("Clear") ;//On lui donne un texte
		btnReset.addActionListener(this);//On ajoute la fen�tre en tant qu'�couteur du bouton
		container.add(btnReset);//On l'ajoute � la fen�tre


		return container ;
	}

	public void actionPerformed(ActionEvent e) {

		if(e.getSource() == btnReset)
		{
			stateGraphGraphics.auto.decolore();
			stateGraphGraphics.repaint();
		}

		if(e.getSource() == btnCycle)
		{
			stateGraphGraphics.auto.decolore();
			stateGraphGraphics.auto.colore(cycles.get(cyclesBox.getSelectedIndex()), true);
			stateGraphGraphics.repaint();
		}

		if(e.getSource() == btnPath)
		{
			stateGraphGraphics.auto.decolore();
			Path path=new Path(lines, combinasion.get(oneState.getSelectedIndex()),combinasion.get(twoStates.getSelectedIndex()));
			if (path.paths.size()!=0)
			{
				for (int i=0; i<path.paths.size(); i++)
				{
					stateGraphGraphics.auto.colore(path.paths.get(i), false);
				}
			}
			for (State etat : stateGraphGraphics.auto.vStates)
			{
				if (etat.label.equals(combinasion.get(oneState.getSelectedIndex()).toString()) || etat.label.equals(combinasion.get(twoStates.getSelectedIndex()).toString()))
					etat.couleurFond=Color.green;
			}
			stateGraphGraphics.repaint();
		}


	}

} 
