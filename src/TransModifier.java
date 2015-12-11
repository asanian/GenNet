/*
 * ModifEtTransjava
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
 * User interface to change the lastateBarl of a transition
 * @author Olivier Mansion
 */
public class TransModifier extends JDialog implements ActionListener {    
    
    
    
    
    GraphicZone zg;
    Automate auto;
    Container content;
    StateBar stateBar;
    MainFrame mf;
    Container jPanelContainer;    
    JTextField tf;    
    Button cancel;
    Button ok;
    
    JPanel btJPanel;
    JPanel tfJPanel1;
    JPanel tfJPanel2;
    
    CheckboxGroup groupe;
    Checkbox plus;
    Checkbox minus;
    
    int numInitialEnt = 0;
    int numFinalEnt = 0;
    String strThreshold;
    
    int threshold;
    int sign;
    
    /**
     * Cr�e une nouvelle instance de ModifEtTrans
     * @param mf fenetre principale de l'application
     * @param gz zone graphique
     * @param auto automate
     * @param bar barre d'�tat
     */
    public TransModifier(MainFrame mf, GraphicZone gz, Automate auto, StateBar bar) {
        
        super(JOptionPane.getFrameForComponent(mf), "Create an interaction", true);
        
        this.setResizable(false);
        // To avoid a crash by closing the cross:
        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
        
        this.zg = gz;
        this.auto = auto;
        this.stateBar = bar;
        this.mf = mf;
        
        bar.displayInfo("Properties");

        tfJPanel1 = new JPanel(new FlowLayout(FlowLayout.LEFT));
        tfJPanel1.setBackground(Color.lightGray);
        tfJPanel1.add(new JLabel("Type  : "));
        groupe=new CheckboxGroup();
        boolean state = false;
        if (gz.transSelected.getSign() == 1) {
            state = true;
        }
        plus = new Checkbox("Activator",groupe,state);  
        tfJPanel1.add(plus);
        minus=new Checkbox("Inhibitor",groupe,!state);  
        tfJPanel1.add(minus);
        
        tfJPanel2 = new JPanel(new FlowLayout(FlowLayout.LEFT));
        tfJPanel2.setBackground(Color.lightGray);
        tfJPanel2.add(new JLabel("Threshold  = "));
        tf = new JTextField(Integer.toString(gz.transSelected.getThreshold()), auto.nbrCharTransLabel);
        tfJPanel2.add(tf);
        
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
        content.add(tfJPanel1, BorderLayout.NORTH);
        content.add(tfJPanel2, BorderLayout.CENTER);
        content.add(btJPanel, BorderLayout.SOUTH);   
        
        this.pack();
        this.setLocationRelativeTo(this.mf);
        
        tf.requestFocusInWindow(); 
        
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
            if (plus.getState() == true) {
                sign = 1;                
            } else {
                sign = 0;
            }
            strThreshold = tf.getText();
            try {
                threshold = Integer.parseInt(strThreshold);
                if (threshold < 0) {
                    JOptionPane.showMessageDialog(this.mf, "Threshold must be a positive integer", "Error", JOptionPane.WARNING_MESSAGE);
                    this.setVisible(true); 
                } else {
                    zg.transSelected.setThreshold(this.threshold);
                    zg.transSelected.setSign(this.sign);
                    this.hide();
                    zg.draw();
                    stateBar.displayInfo(mf.frameName);
                    auto.modif(true);
                    stateBar.can = true;
                    this.dispose();
                }
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(this.mf, "Threshold must be a positive intege.", "Error", JOptionPane.WARNING_MESSAGE);
                this.setVisible(true);
            }
        } else if (source == cancel) {
            this.hide();
            zg.draw();
            stateBar.displayInfo(mf.frameName);
            stateBar.can = true;
            this.dispose();
        }
        zg.menu.majMenus();
    }  
}
