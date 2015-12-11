import java.io.*;
import java.awt.*;

import javax.swing.*;

import java.awt.event.*;
import java.util.*;

/**
 * Cette fenetre permet d'ins�rer les valeurs
 * des ressources lors de la conversion d'un fichier txt 
 * contenant des equas diff en un XML de graphe d'�tats
 *
 * @author R�my
 */
public class FrameResources extends JDialog implements ActionListener {   
    
    

	Container content;
	StateGraphFrame frameStateGraph;	

	// Le panel principal
	JPanel panelPrincipal;
	// The panel contains buttons "ok" and "cancel"
	JPanel btJPanel;

	Button cancel;
	Button ok;

	ArrayList<JTextField> values;
	
	/**
	 * Le treemap qui a chaque �tat associe son point focal 
	 */
	TreeMap stateResources;
	/**
	 * A vector which contains the resources user entered
	 * Redundancies have deleted
	 */
	ArrayList<String> userEnteredResources;
	/**
	 * this list is in correspondence with the previous "userEnteredResources"
	 */
	ArrayList<String> correspondingValues;

	/**
	 * Constructeur
	 * @param frameStateGraph : la fenetre de graphe d'�tats
	 * @param stateRessource : le treemap d'entr�e
	 */
	public FrameResources(StateGraphFrame frameStateGraph, TreeMap stateRessource) {

		super(JOptionPane.getFrameForComponent(frameStateGraph), "insert Resource Values", true);

		this.stateResources=stateRessource;
		userEnteredResources = new ArrayList<String>();
		correspondingValues = new ArrayList<String>();
		// Insertion de toutes valeurs a priori possibles
		for (Iterator<String> i = stateRessource.keySet().iterator(); i.hasNext();) {
			String ressource = i.next();	
			for (int j = 0; j < ((ArrayList<String>) stateRessource.get(ressource)).size(); j++) {
				userEnteredResources.add(((ArrayList<String>)stateRessource.get(ressource)).get(j));	
			}							
		}
		//Sorting to eliminate duplicates
		if(userEnteredResources.size()>0) {
			for (int i = 1; i < userEnteredResources.size(); i++) {
				String elementCourant = userEnteredResources.get(i);
				for (int j = 0; j < i; j++) {
					if (userEnteredResources.get(j).equals(elementCourant)) {
						userEnteredResources.remove(i);
						i--;
					}
				}
			}
		}
		//Tri pour �limnier les 0
		if (userEnteredResources.size()>0) {
			for (int i = 0; i < userEnteredResources.size(); i++) {
				if (userEnteredResources.get(i).equals("0")) {
					userEnteredResources.remove(i);
					i--;
				}
			}
		}		

		values = new ArrayList<JTextField>(); 

		content = this.getContentPane();
		content.setLayout(new BorderLayout());
		content.setBackground(Color.lightGray);


		this.setResizable(true);		
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);

		this.frameStateGraph = frameStateGraph;

		panelPrincipal = new JPanel(new GridBagLayout());
		panelPrincipal.setBounds(0, 0, 100, 200);
		panelPrincipal.setBackground(Color.lightGray);
		content.add(panelPrincipal, BorderLayout.NORTH);   

		btJPanel = new JPanel(new GridLayout(1,2,0,0));
		btJPanel.setBackground(Color.lightGray);

		ok = new Button("Ok");
		ok.setBackground(Color.lightGray);
		ok.addActionListener(this);
		cancel = new Button("Cancel");
		cancel.setBackground(Color.lightGray);
		cancel.addActionListener(this);
		btJPanel.add(ok);
		btJPanel.add(cancel); 		
		content.add(btJPanel, BorderLayout.SOUTH);  

		GridBagConstraints gbc = new GridBagConstraints();        
		gbc.anchor = GridBagConstraints.NORTH;
		gbc.fill = GridBagConstraints.HORIZONTAL;        
		gbc.insets = new Insets(5,5,0,5);
		gbc.gridwidth = 1;  			

		/*
		 * Les points focaux relatifs � chaque �tats
		 */
		for (Iterator<String> i = stateRessource.keySet().iterator(); i.hasNext();) {
			String etat = i.next();
			ArrayList<String> valeur = (ArrayList<String>) stateRessource.get(etat);
			panelPrincipal.add(new JLabel(etat+" : "), gbc);    
			gbc.gridwidth = GridBagConstraints.REMAINDER;		
			panelPrincipal.add(new JLabel(valeur.toString()), gbc);    
			gbc.gridwidth = GridBagConstraints.REMAINDER;	
			gbc.gridwidth = 1;  			
		}
		
		/*
		 * Les valeurs � ins�rer
		 */
		for (int i = 0; i < userEnteredResources.size(); i++) {	
			panelPrincipal.add(new JLabel(userEnteredResources.get(i)+" = "), gbc);    
			gbc.gridwidth = GridBagConstraints.REMAINDER;
			JTextField tfEtiquette = new JTextField("", 10);
			values.add(tfEtiquette);
			panelPrincipal.add(tfEtiquette, gbc);					 	
			gbc.gridwidth = 1;  			
		}

		this.pack();
		this.setLocationRelativeTo(this.frameStateGraph);

		JScrollPane scrollPane=new JScrollPane(panelPrincipal);
		this.add(scrollPane);
		
		// rendre la fenetre visible
		setVisible(true);
	}

	/**
	 * diff�rentes actions men�es suivant le choix de l'utilisateur
	 * @param e evenement cr�e par le clic sur ok ou sur annuler
	 */    
	public void actionPerformed(ActionEvent e) {
		Object source = e.getSource();
		if (source == ok) {
			for (int i = 0; i < userEnteredResources.size(); i++) {					
				correspondingValues.add(values.get(i).getText());								
			}			
			//Remplissage d'�tatRessource
			TreeMap apresEval = new TreeMap();			

			for (Iterator<String> i = stateResources.keySet().iterator(); i.hasNext();) {
				String etat = i.next();
				ArrayList<String> valeur = (ArrayList<String>) stateResources.get(etat);
				etat = etat.substring(1);
				etat = etat.replace(" ", ",");
				// Pour chaque gene
				for (int j = 0; j < valeur.size(); j++) {
					// Si on a une valeur differente de 0
					String maString = valeur.get(j);
					for (int k = 0; k < userEnteredResources.size(); k++) {
						if (maString.equals(userEnteredResources.get(k))) {
							valeur.set(j, correspondingValues.get(k));
						}
					}				
				}
				apresEval.put(etat, valeur);
			}			
			stateResources=apresEval;
			this.setVisible(false);
			this.dispose();			
		} else if (source == cancel) {
			this.setVisible(false);
			frameStateGraph.stateGraphGraphics.draw();
			this.dispose();       
		}        
	}  		
}
