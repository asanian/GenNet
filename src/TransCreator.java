/*
 * TransCreator.java
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
 * Interface avec l'utilisateur permettant de cr�er une nouvelle transition
 * @author Olivier Mansion
 */
public class TransCreator extends JDialog implements ActionListener {
    
    GraphicZone gz;
    Automate auto;
    Container content;
    StateBar bar;
    MainFrame mf;
    Container container;
    
    JTextField tf;
    
    Button cancel;
    Button ok;
    
    JPanel btJPanel;
    JPanel tfJPanel1;
    JPanel tfJPanel2;
    
    CheckboxGroup groupe;
    Checkbox plus;
    Checkbox minus;
    
    int numEtIni = 0;
    int numEtFin = 0;
    String threshold;
    
    int thresholdVal=1;
    int sign;

    
    /**
     * Cr�e une nouvelle instance de CreeTrans
     * @param mf fenetre principale de l'application
     * @param zg Zone graphique
     * @param auto automate
     * @param be barre d'�tat
     */
    public TransCreator(MainFrame mf, GraphicZone g, Automate auto, StateBar be) {
        
        super(JOptionPane.getFrameForComponent(mf), "Creating interaction", true);
        
        this.setResizable(false);
                
        this.gz = g;
        this.auto = auto;
        this.bar = be;
        this.mf = mf;
        
        be.displayInfo("Creating interaction");

        tfJPanel1 = new JPanel(new FlowLayout(FlowLayout.LEFT));
        tfJPanel1.setBackground(Color.lightGray);
        tfJPanel1.add(new JLabel("Type  : "));
        groupe=new CheckboxGroup();  
        plus = new Checkbox("activator",groupe,true);  
        tfJPanel1.add(plus);
        minus=new Checkbox("inhibitor",groupe,false);  
        tfJPanel1.add(minus);
        
        tfJPanel2 = new JPanel(new FlowLayout(FlowLayout.LEFT));
        tfJPanel2.setBackground(Color.lightGray);
        tfJPanel2.add(new JLabel("Threshold  = "));
        tf = new JTextField(auto.nbrCharTransLabel);
        tf.setText("1");
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
     * Diff�rentes actions men�es suivant le choix de l'utilisateur
     * @param e evenement d�clench� par le clic sur ok ou annuler
     */    
    public void actionPerformed(ActionEvent e) {
        Object source = e.getSource();
        if (source == ok) {
            if (plus.getState() == true) {
                sign = 1;                
            } else {
                sign = 0;
            }
            threshold = tf.getText();
            try {
                thresholdVal = Integer.parseInt(threshold);
                if (thresholdVal < 0) {
                    JOptionPane.showMessageDialog(this.mf, "Threshold must be a positive integer", "Error", JOptionPane.WARNING_MESSAGE);
                    this.setVisible(true); 
                } else {
                    gz.draw();
                    gz.creatTrans(thresholdVal, sign);
                    auto.modif(true);
                    this.dispose();
                }
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(this.mf, "Threshold must be a positive integer.", "Error", JOptionPane.WARNING_MESSAGE);
                this.setVisible(true);
            }
        } else if (source == cancel) {
            gz.draw();
            bar.displayInfo(mf.frameName);
            bar.can = true;
            this.dispose();
        }
        gz.menu.majMenus();
    } 
}
