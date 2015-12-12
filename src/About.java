import java.awt.* ;

import javax.swing.* ;
import java.io.*;
import java.awt.event.* ;
import java.util.* ;
import javax.swing.Timer;

/**
 * JWindow contenant le JPanel APropos
 * @author Olivier Mansion
 */
public class About{
        
	private JTextArea aProposTextArea;
	public JFrame aProposFrame;
	
	
	public About(){
		aProposFrame=new JFrame("About the GenNet");
		aProposTextArea=new JTextArea("\n"+"  GenNet - A tool for qualitative and quantitative model checking" +"\n\n"+
				"  Version 1.0" +"\n"+"\n"+
				"  Editor Syed Sabah-ud-din Gilani\n\n"+
				"  Email leepianz@gmail.com");
		aProposTextArea.setEditable(false);
		aProposTextArea.setPreferredSize(new Dimension(270,420));
		JScrollPane aProposScrollPane=new JScrollPane(aProposTextArea);
		aProposFrame.add(aProposScrollPane);
		aProposFrame.setBounds(500,50,300,350);
		aProposFrame.setResizable(false);
		aProposFrame.show();
	}
}
