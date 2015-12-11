import java.io.*;
import java.awt.*;

import javax.swing.*;

import java.awt.event.*;
import java.util.*;

/**
 * This window allows you to insert values ​​thtas
 * contained in. text that contains the equations
 *
 * @author : R�my
 */
public class FrameTheta extends JDialog implements ActionListener {   

	Container content;
	StateGraphFrame frameStateGraph;	

	JPanel panelPrincipal;
	JPanel btJPanel;

	Button cancel;
	Button ok;

	ArrayList<JTextField> values;

	TreeMap theta;
	
	/**
	 * Constructeur
	 * @param frameStateGraph : la fenetre de graphe d'�tats
	 * @param etatRessource : le treemap d'entr�e
	 */
	public FrameTheta(StateGraphFrame frameStateGraph, TreeMap theta) {

		super(JOptionPane.getFrameForComponent(frameStateGraph), "Insert Theta Values", true);

		this.theta=theta;
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
		for (Iterator<String> i = theta.keySet().iterator(); i.hasNext();) {					
			String theta1 = i.next();			
			panelPrincipal.add(new JLabel(theta1+" = "), gbc);    
			gbc.gridwidth = GridBagConstraints.REMAINDER;
			JTextField tfLabel = new JTextField("", 10);
			values.add(tfLabel);
			panelPrincipal.add(tfLabel, gbc);					 	
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
			int cpt=0;
			for (Iterator<String> i = theta.keySet().iterator(); i.hasNext();) {
				String theta1 = i.next();
				int value = Integer.parseInt(values.get(cpt).getText());
				this.theta.put(theta1, value);
				cpt++;				
			}
			this.setVisible(false);
			this.dispose();			
		} else if (source == cancel) {
			this.setVisible(false);
			frameStateGraph.stateGraphGraphics.draw();
			this.dispose();       
		}        
	}  		
}
