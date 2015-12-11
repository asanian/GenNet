/*
 * EntityModifier.java
 *
 * Version 1.0
 *
 * Created on 29 avril 2004, 12:05
 */


import java.io.*;
import java.awt.*;
import java.awt.event.*;

import javax.swing.*;
import javax.swing.event.*;

import java.util.*;

/**
 * User interface to change the label of entity
 * @author Olivier Mansion
 */
public class EntityModifier extends JDialog implements ActionListener, ListSelectionListener, ItemListener {
    
    GraphicZone graphicZone;
    Automate auto;
    StateBar bar;
    MainFrame mf;
    Container content;
    
    JTextField tfTemps;
    JTextField tfTemps2;
    JTextField tfLabel;
    JTextField tfNew;
    
    Button cancel;
    Button ok;
    Button add; // add
    Button delete; // delete
    Button edit;
    Button refresh;
    
    
    Checkbox checkP;
    Checkbox checkM;
    
    JLabel p1, p2;
    JLabel m1, m2;
    
    JPanel btJPanel;
    JPanel jPanel;
    JPanel tfJPanelTemps;
    JPanel tfJPanelTemps2;
    JPanel tfJPanelTemps3;
    JPanel tfJPanelNewParam;
    JPanel tfJPanelNew;
    JPanel tfJPanelProprtiete;
    JPanel tfJPanelParam;
    JPanel tfValeur;
    
    JList list;
    DefaultListModel listModel;
    
    Vector check;
    int valueNewParam;
    
    String label;
    String oldLabel;
    
    int temps;
    int temps2;
    
    Vector Ks;
    
    boolean edition;
    int indexEdit;
    K kEdition;
    
    String nul = "No Parameter";
    
    /**
     * Cr�e une nouvelle instance de ModifEtEntity
     * @param mf fenetre principale de l'application
     * @param zg zone graphique
     * @param auto automate
     * @param bar barre d'�tat
     */
    public EntityModifier(MainFrame mf, GraphicZone zg, Automate auto, StateBar bar) {
        
        super(JOptionPane.getFrameForComponent(mf), "Properties", true);
        
        this.setResizable(false);
        // To avoid a crash by closing the cross:
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        
      
        this.graphicZone = zg;
        this.auto = auto;
        this.bar = bar;
        this.mf = mf;
        
        Ks = new Vector();
        
        edition = false;
        
        bar.displayInfo("Properties of a gene " + zg.entitySelected.label);
        
        oldLabel = zg.entitySelected.label;
        
        jPanel = new JPanel(new GridBagLayout());
        jPanel.setBackground(Color.lightGray);
        GridBagConstraints gbc = new GridBagConstraints();
        
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.NONE; 
        gbc.insets = new Insets(5,5,0,5);
        
        //Name line
        gbc.gridwidth = 1;
        jPanel.add(new JLabel("Name"), gbc);
        
        gbc.gridwidth = GridBagConstraints.REMAINDER;
        tfLabel = new JTextField((zg.entitySelected).label, auto.nbrCharEntityLabel);
        jPanel.add(tfLabel, gbc);

        
        //Ligne nouveau parametre
        gbc.gridwidth = GridBagConstraints.REMAINDER;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        tfJPanelNewParam = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        tfJPanelNewParam.setBackground(Color.gray );
        JLabel label1 = new JLabel("Parameters");
        label1.setForeground(Color.lightGray);
        tfJPanelNewParam.add(label1, gbc);
        jPanel.add(tfJPanelNewParam, gbc);
        
        //Entree d'un nouveau parametre
        gbc.gridwidth = GridBagConstraints.REMAINDER;
        gbc.fill = GridBagConstraints.NONE;
        tfJPanelNew = new JPanel(new GridBagLayout());
        tfJPanelNew.setBackground(Color.lightGray);
        
        GridBagConstraints gbcNew = new GridBagConstraints();
        gbcNew.anchor = GridBagConstraints.CENTER;
        gbcNew.fill = GridBagConstraints.NONE;
        gbc.anchor = GridBagConstraints.CENTER;
        gbcNew.insets = new Insets(0,0,0,0);
        
        gbcNew.gridwidth = 1;
        tfJPanelNew.add(new JLabel(" "), gbcNew);
        
        Entity etapeCt;
        int compteur = 1;
        for (int k = 0; k < auto.vEntity.size(); k = k + 1) {
            etapeCt = (Entity) auto.vEntity.get(k);
            compteur = compteur + 1;
            gbcNew.gridwidth = compteur;
            tfJPanelNew.add(new JLabel(etapeCt.label+" "), gbcNew);
            compteur = compteur + 1;
            gbcNew.gridwidth = compteur;
            tfJPanelNew.add(new JLabel(" "), gbcNew);
        }
        
        gbcNew.gridwidth = GridBagConstraints.REMAINDER;
        tfJPanelNew.add(new JLabel(" "), gbcNew);
        
        gbcNew.gridwidth = 1;
        tfJPanelNew.add(new JLabel("K ( "+zg.entitySelected.label+" , { "));
        
        check = new Vector();
        compteur = 1;
        for (int k = 0; k < auto.vEntity.size(); k = k + 1) {
            etapeCt = (Entity) auto.vEntity.get(k);
            Checkbox checkCt = new Checkbox("",false);
            compteur = compteur + 1;
            gbcNew.gridwidth = compteur;
            tfJPanelNew.add(checkCt, gbcNew);
            check.add(checkCt);
            compteur = compteur + 1;
            gbcNew.gridwidth = compteur;
            if (k == (auto.vEntity.size() - 1)) {
                tfJPanelNew.add(new JLabel("} ) = "), gbcNew);
            } else {
                tfJPanelNew.add(new JLabel(", "), gbcNew);
            }
        }
        

        gbcNew.gridwidth = GridBagConstraints.REMAINDER;
        tfNew = new JTextField(3);
        tfJPanelNew.add(tfNew, gbcNew);
        
        jPanel.add(tfJPanelNew, gbc);

        gbc.gridwidth = GridBagConstraints.REMAINDER;
        gbc.fill = GridBagConstraints.NONE;
        gbc.anchor = GridBagConstraints.CENTER;

        add = new Button("Add");
        add.setBackground(Color.lightGray);
        add.addActionListener(this);
        jPanel.add(add, gbc);
         
        gbc.insets    = new Insets(5,5,5,5); 
        gbc.gridwidth = GridBagConstraints.REMAINDER;
        gbc.fill      = GridBagConstraints.HORIZONTAL;
        gbc.anchor    = GridBagConstraints.WEST;
        tfJPanelParam = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        tfJPanelParam.setBackground(Color.gray );
        JLabel label2 = new JLabel("List of parameters");
        label2.setForeground(Color.lightGray);
        tfJPanelParam.add(label2, gbc);
        jPanel.add(tfJPanelParam, gbc);
        
        gbc.gridwidth = GridBagConstraints.REMAINDER;
        gbc.anchor    = GridBagConstraints.EAST;
        gbc.fill      = GridBagConstraints.HORIZONTAL;
        
        listModel = new DefaultListModel();

        //Create the list and put it in a scroll pane.
        list = new JList(listModel);
        list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        list.setSize(1, 1);
        list.addListSelectionListener(this);
        list.setVisibleRowCount(5);
        JScrollPane listScrollPane = new JScrollPane(list);  
        
        jPanel.add(listScrollPane, gbc);
        
        gbc.insets    = new Insets(0,5,10,5);
        
        gbc.gridwidth = GridBagConstraints.REMAINDER;
        gbc.fill = GridBagConstraints.NONE;
        gbc.anchor = GridBagConstraints.CENTER;
        
        tfValeur = new JPanel(new FlowLayout(FlowLayout.LEFT, 0, 0));
        tfValeur.setBackground(Color.lightGray);
        
        delete = new Button("Delete");
        delete.setBackground(Color.lightGray);
        delete.addActionListener(this);
        tfValeur.add(delete);
        
        edit = new Button("Edit");
        edit.setBackground(Color.lightGray);
        edit.addActionListener(this);        
        tfValeur.add(edit);
        
         refresh = new Button("Refresh");
        refresh.setBackground(Color.lightGray);
        refresh.addActionListener(this);        
        tfValeur.add(refresh);
        
        
        
        jPanel.add(tfValeur, gbc);
        
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
        
        gbc.insets    = new Insets(0,0,0,0);
        gbc.gridwidth = GridBagConstraints.REMAINDER;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.anchor = GridBagConstraints.CENTER;

        jPanel.add(btJPanel, gbc);
     
        content = this.getContentPane();
        content.setLayout(new BorderLayout());
        content.setBackground(Color.lightGray);
        content.add(jPanel, BorderLayout.NORTH);
        /*content = this.getContentPane();
        content.setLayout(new BorderLayout());
        content.setBackground(Color.lightGray);
        content.add(jPanel, BorderLayout.NORTH);    */
        this.setContentPane(jPanel);
        
        for (int j = 0; j <= auto.vEntity.size(); j = j + 1) {
            for (int k = 0; k < zg.entitySelected.Ks.size(); k = k + 1) {
               
                K kCt = (K) zg.entitySelected.Ks.get(k);
                 System.out.println("K is: "+kCt.auto.toString()+" "+kCt.gene+" "+kCt.predec.toString());
                if (kCt.predec.size() == j) {
                    kCt.toString();
                    Ks.add(kCt);
                    System.out.println("Ks is: "+Ks.toString());
                    listModel.addElement(kCt.descriptifPlusValue);
                }
            }
        }
        
        if (listModel.size() == 0) {
            delete.setEnabled(false);
            edit.setEnabled(false);
            refresh.setEnabled(false);
            list.setSelectedIndex(-1);
            list.ensureIndexIsVisible(-1);
            listModel.addElement(nul);
        } else {
            delete.setEnabled(true);
            edit.setEnabled(true);
            refresh.setEnabled(true);
            list.setSelectedIndex(0);
            list.ensureIndexIsVisible(0);
        }
        
        this.pack();
        
        this.setLocationRelativeTo(this.mf);
        
        // rendre la fenetre visible
        this.setVisible(true);
        
    }
    
    /**
     *different actions depending on user choice
     * @param e event triggered by the click ok or cancel
     */    
    public void actionPerformed(ActionEvent e) {
        Object source = e.getSource();
        if (source == add) {
            try {
                String interm = tfNew.getText();
                valueNewParam = Integer.parseInt(interm);
                if (temps < 0) {
                    JOptionPane.showMessageDialog(this.mf, "The value of a parameter must be a positive integer", "Error", JOptionPane.WARNING_MESSAGE);
                    this.setVisible(true); 
                } else {
                    if (edition == false) {
                        K newK = new K(graphicZone.entitySelected.getNum(), valueNewParam, auto);
                        for (int k = 0; k < check.size(); k = k + 1) {
                            Entity etapeCt = (Entity) auto.vEntity.get(k);
                            Checkbox checkCt = (Checkbox) check.get(k);
                            if (checkCt.getState() == true) {
                                newK.add(etapeCt.getNum());
                            }
                        }
                        newK.toString();
                        boolean existe = false;
                        for (int k = 0; k < Ks.size(); k = k + 1) {
                            K kCt = (K) Ks.get(k);
                            kCt.toString();
                            if (newK.descriptif.equals(kCt.descriptif) == true) {
                                existe = true;
                            }
                        }
                        if (existe == false) {
                            
                            if ((listModel.size() == 1) && (((String) listModel.getElementAt(0))).equals(nul) == true) {
                                listModel.removeElementAt(0);
                            }
                            
                            int location = 0;
                            int nbrNewK = newK.predec.size();
                            for (int k = 0; k < Ks.size(); k = k + 1) {
                                if (nbrNewK > ((K) Ks.get(k)).predec.size()) {
                                    location++;
                                }
                            }
                            Ks.insertElementAt(newK, location);
                            
                            System.out.println("KS: "+this.Ks.toString());
                            for (int k = 0; k < check.size(); k = k + 1) {
                                Checkbox checkCt = (Checkbox) check.get(k);
                                checkCt.setState(false);
                            }
                            tfNew.setText("");

                            listModel.insertElementAt(newK.descriptifPlusValue, location);

                            if (listModel.getSize() > 0) {
                                delete.setEnabled(true);
                            }

                            list.setSelectedIndex(location);
                            list.ensureIndexIsVisible(location);

                        } else {
                            JOptionPane.showMessageDialog(this.mf, "This parameter is already defined", "Error", JOptionPane.WARNING_MESSAGE);
                            this.setVisible(true);
                        }
                    } else {
                       setNewValuesOfK();
                    }
                }
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(this.mf, "The value of a parameter must be a positive integer", "Error", JOptionPane.WARNING_MESSAGE);
                this.setVisible(true);
            }
            this.graphicZone.entitySelected.Ks=this.Ks;
        } else if (source == delete) {
            //JOptionPane.showMessageDialog(this.mf, "Coucou", "Erreur", JOptionPane.WARNING_MESSAGE);
            int index = list.getSelectedIndex();
            
            String str = (String) listModel.getElementAt(index);
            
            listModel.remove(index);

            if (listModel.getSize() == 0) { //Nobody's left, disable firing.
                delete.setEnabled(false);
            } else { //Select an index.
                if (index == listModel.getSize()) {
                    //removed item in last position
                    index--;
                }

                list.setSelectedIndex(index);
                list.ensureIndexIsVisible(index);
            }
            
            for (int k = 0; k < Ks.size(); k = k + 1) {
                K kCt = (K) Ks.get(k);
                kCt.toString();
                if (str.equals(kCt.descriptifPlusValue) == true) {
                    Ks.removeElementAt(k);
                }
            }
            
            if (listModel.size() == 0) {
                delete.setEnabled(false);
                edit.setEnabled(false);
                list.setSelectedIndex(-1);
                list.ensureIndexIsVisible(-1);
                listModel.addElement(nul);
            }
        }
        
        else if (source == edit) {
            edition = true;
            edit.setEnabled(false);
            delete.setEnabled(false);
            indexEdit = list.getSelectedIndex();
            String str = (String) listModel.getElementAt(indexEdit);
             K kEdit=findKToEdit(str);
            displayOldValueOfK(kEdit);
        } 
        //Kanwal Naz
        else if(source== refresh){
           listModel.removeAllElements();
                        Entity en=graphicZone.entitySelected;
                        auto.setParameters(en);
                            for(int i=0;i<en.Ks.size();i++){
                            listModel.add(i,en.Ks.get(i).descriptifPlusValue);
                            }
            
        }
     
        else if (source == ok) {
            System.out.println("coming in ok");
            System.out.println("KS: "+this.Ks.toString());
            label = tfLabel.getText();
            label = label.toUpperCase();
            boolean alreadyExist = false; // already there
            int i;
            for (i = 0; i < auto.vEntity.size(); i = i + 1) {
                Entity etapeCt = (Entity) auto.vEntity.get(i);
                if ((label.equals(etapeCt.getLabel()) == true) && (etapeCt.num != graphicZone.entitySelected.num)) {
                    alreadyExist = true;
                }
            }  
            if (alreadyExist == true) {
                JOptionPane.showMessageDialog(this.mf, "Name already assigned.", "Error", JOptionPane.WARNING_MESSAGE);
                this.setVisible(true);
            } else if (label.equals("") == true) {
                JOptionPane.showMessageDialog(this.mf, "Gene must be assigned a name.", "Error", JOptionPane.WARNING_MESSAGE);
                this.setVisible(true);
            } else if ((label.length() > auto.nbrCharEntityLabel)){
                
                JOptionPane.showMessageDialog(this.mf, "Name is too long (max "+auto.nbrCharEntityLabel+" characters allowed).", "Error", JOptionPane.WARNING_MESSAGE);
                this.setVisible(true);
            } 
             graphicZone.draw();
          bar.displayInfo(mf.frameName);
            this.dispose();
            bar.can = true;
           
        } else if (source == cancel) {
            graphicZone.draw();
          bar.displayInfo(mf.frameName);
            this.dispose();
            bar.can = true;
        }
        graphicZone.menu.majMenus();
    }  
    
    public void valueChanged(ListSelectionEvent e) {
        if (e.getValueIsAdjusting() == false) {
            if (edition == true) {
                list.setSelectedIndex(indexEdit);
                list.ensureIndexIsVisible(indexEdit);
                delete.setEnabled(false);
                edit.setEnabled(false);
            } else if (list.getSelectedIndex() == -1) {
                delete.setEnabled(false);
                edit.setEnabled(false);
            } else if ((listModel.size() == 1) && (((String) listModel.getElementAt(0))).equals(nul) == true) {
                delete.setEnabled(false);
                edit.setEnabled(false);
            } else {
                delete.setEnabled(true);
                edit.setEnabled(true);
            }
        }



    }
    
    public void itemStateChanged(ItemEvent e) {
        Object source = e.getSource();
        if (source == checkP) {
            if (checkP.getState() == true) {
                p1.setVisible(true);
                p2.setVisible(true);
                tfTemps.setVisible(true);
            } else {
                p1.setVisible(false);
                p2.setVisible(false);
                tfTemps.setVisible(false);
            }
        } else if (source == checkM) {
            if (checkM.getState() == true) {
                m1.setVisible(true);
                m2.setVisible(true);
                tfTemps2.setVisible(true);
            } else {
                m1.setVisible(false);
                m2.setVisible(false);
                tfTemps2.setVisible(false);
            }            
        }
    }    
    //kanwal Naz
    public K findKToEdit(String str){
            K kEdit = (K) Ks.get(0);
            for (int i = 0; i < Ks.size(); i = i + 1) {
                K kCt = (K) Ks.get(i);
                kCt.toString();
                if (str.equals(kCt.descriptifPlusValue) == true) {
                    kEdit = kCt;
                    return kEdit;
                }
            }
        return null;
    }
    // Kanwal Naz
    public void displayOldValueOfK(K kEdit){
        
               for (int i = 0; i < check.size(); i = i + 1) {
                Entity entityCt = (Entity) auto.vEntity.get(i);
                boolean checkMarker = false;
                for (int j = 0; j < kEdit.predec.size(); j = j + 1) {
                    Integer I = (Integer) kEdit.predec.get(j);
                    int valueI = I.intValue();
                    if (entityCt.getNum() == valueI) {
                        checkMarker = true;
                    }
                }
                Checkbox checkCt = (Checkbox) check.get(i);
                checkCt.setState(checkMarker);
                checkCt.setEnabled(true);
            }
            tfNew.setText(Integer.toString(kEdit.value));
            kEdition = kEdit;
            tfNew.requestFocusInWindow();
    }
    public void setNewValuesOfK(){
                     edition = false;
                        kEdition.value = valueNewParam;
                        kEdition.toString();
                        listModel.setElementAt(kEdition.descriptifPlusValue, indexEdit);
                        list.setSelectedIndex(indexEdit);
                        list.ensureIndexIsVisible(indexEdit);
                        for (int k = 0; k < check.size(); k = k + 1) {
                            Checkbox checkCt = (Checkbox) check.get(k);
                            checkCt.setState(false);
                            checkCt.setEnabled(true);
                        }
                        tfNew.setText("");
                        delete.setEnabled(true);
                        edit.setEnabled(true);
                         
    }
    
    public Entity entitySelected(){
        return graphicZone.entitySelected;
    }
}

