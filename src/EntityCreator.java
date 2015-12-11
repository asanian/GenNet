/*
 * EntityCreator.java
 *
 * Version 1.0
 *
 * Created on 29 avril 2004, 12:05
 */


import java.io.*;
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.util.*;

/**
 * User interface to create a new entity
 * @author Olivier Mansion
 */
public class EntityCreator extends JDialog implements ActionListener {

	GraphicZone gz;
	Automate auto;
	StateBar bar;
	MainFrame mf;
	Container content;

	JTextField tfEntity;
	JTextField tfLabel;

	Button cancel;
	Button ok;

	JPanel btJPanel;
	JPanel tfJPanel;

	String label;

	/**
	 * Cr�e une nouvelle instance de CreeEntity
	 * @param mf fenetre principale de l'application
	 * @param gz Zone graphique
	 * @param auto automate
	 * @param be Barre d'�tat
	 */
	 public EntityCreator(MainFrame mf, GraphicZone gz, Automate auto, StateBar be) {

		super(JOptionPane.getFrameForComponent(mf), "Creating a gene", true);

		this.setResizable(false);
		
		this.gz = gz;
		this.auto = auto;
		this.bar = be;
		this.mf = mf;

		be.displayInfo("Creating a gene");

		tfJPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
		tfJPanel.setBackground(Color.lightGray);
		tfJPanel.add(new JLabel("Name"));
		tfLabel = new JTextField(auto.nbrCharEntityLabel);
		tfJPanel.add(tfLabel);

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

		content = this.getContentPane();
		content.setLayout(new BorderLayout());
		content.setBackground(Color.lightGray);
		content.add(tfJPanel, BorderLayout.NORTH);
		content.add(btJPanel, BorderLayout.SOUTH);      

		this.pack();
		this.setLocationRelativeTo(this.mf);

		// rendre la fenetre visible
		setVisible(true);
	}

	/**
	 * Possible actions depending on user choice
	 * @param e events clicking Ok or Cancel
	 */    
	public void actionPerformed(ActionEvent e) {
		Object source = e.getSource();
		if (source == ok) {
			label = tfLabel.getText();
			label = label.toUpperCase();
			boolean alreadyExist = false;
			int i;
			for (i = 0; i < auto.vEntity.size(); i = i + 1) {
				Entity entityCt = (Entity) auto.vEntity.get(i);
				if (label.equals(entityCt.getLabel()) == true) {
					alreadyExist = true;
				}
			}  
			if (alreadyExist == true) {
				JOptionPane.showMessageDialog(this.mf, "The name is already assigned.", "Error", JOptionPane.WARNING_MESSAGE);
				this.setVisible(true);
			} else if (label.equals("") == true) {
				JOptionPane.showMessageDialog(this.mf, "Gene must be assigned a name.", "Error", JOptionPane.WARNING_MESSAGE);
				this.setVisible(true);
			} else if ((label.length() > auto.nbrCharEntityLabel)){
				JOptionPane.showMessageDialog(this.mf, "The name of the gene is too long( max "+auto.nbrCharEntityLabel+" characters allowed).", "Error", JOptionPane.WARNING_MESSAGE);
				this.setVisible(true);
			} else {
				gz.draw();
				bar.displayInfo("Right click on the graphical zone to add a gene");
				gz.createEntity(label);
				auto.modif(true);
				this.dispose();
			}
		} else if (source == cancel) {
			gz.draw();
			bar.displayInfo(mf.frameName);
			this.dispose();
			bar.can = true;
		}
		gz.menu.majMenus();
	} 


}
