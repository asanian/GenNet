import javax.swing.*;

import java.awt.event.*;
import java.awt.*;
import java.io.IOException;
public class MainWindow  extends JFrame implements ActionListener {
    
    
	//delclaration of objects 
	JButton Bc = new JButton("Transforms HyTech");
	JButton Baff = new JButton("Showing HyTech");
	JButton Ba = new JButton("Cancel");
	JButton Beh = new JButton("Execute HyTech");
    Process theProcess = null;
	public MainWindow(String s){
		super(s);
 	    	addWindowListener(new WindowAdapter(){
			public void windowClosing(WindowEvent e){
				System.exit(0);
			}});
 	    		
 	    	//setLayout(new  GridBagLayout());
			getContentPane().setLayout(new GridBagLayout());
			GridBagConstraints c = new GridBagConstraints();
			JLabel L1= new JLabel("Choose from the following functions:");
			c.weightx =1;
			c.ipadx=10;
			c.gridx =0;
			c.gridy = 0;
			c.gridwidth =4;
			c.gridheight =1 ;
		//	GridBagConstraints.BOTTOM_ALIGNMENTBOTH ;
			c.gridheight =1;
			c.insets =new Insets (10,0,30,0);
			getContentPane().add( L1,c);
			
			//DrawItem(1,10,0,0,4,1,10,0,30,0,L1);
			JCheckBox	CBrf = new JCheckBox("Reach Forward",false);
			c.gridx = 0;
			c.gridy = 1 ;
			c.gridwidth =1;
			c.insets =new Insets (10,0,30,0);
			getContentPane().add( CBrf,c);
			//DrawItem(1,10,0,1,1,1,10,0,30,0,CBrf);		
			JCheckBox CBc = new JCheckBox("Cycles",false);
			c.gridx = 1;
			c.gridy = 1 ;
			c.gridwidth= 1;
			c.gridheight =1 ;
			c.insets =new Insets(10,0,30,0);
			getContentPane().add( CBc,c);
			//DrawItem(1,10,1,1,1,1,10,0,30,0,CBc);
			JCheckBox CBe = new JCheckBox("Exits",false);
			c.gridx = 2;
			c.gridy = 1 ;
			c.gridwidth =1;
			c.gridheight =1 ;
			c.insets =new Insets (10,0,30,0);
			getContentPane().add( CBe,c);
			//DrawItem(1,10,2,1,1,1,10,0,30,0,CBe);
			JCheckBox CBen = new JCheckBox("Entrances",false);
			c.gridx = 3;
			c.gridy = 1 ;
			c.gridwidth =1;
			c.gridheight =1 ;
			c.insets =new Insets (10,0,30,0);
			getContentPane().add( CBen,c);
			//DrawItem(1,10,3,1,1,1,10,0,30,0,CBen);
			c.ipadx=15;
			//
			Bc.addActionListener(new ActionListener(){

			public void actionPerformed(ActionEvent e) {
				
			}} );
			
			c.gridx = 0;
			c.gridy = 2 ;
			c.gridwidth =1;
			c.gridheight =1;
			c.insets =new Insets (10,0,30,0);
			getContentPane().add( Bc,c);
			//DrawItem(1,15,0,2,1,1,10,0,30,0,Bc);
			
			Baff.addActionListener(new ActionListener(){

				public void actionPerformed(ActionEvent e) {
			
				}} );
				
			c.gridx = 1;
			c.gridy = 2;
			c.gridwidth =1;
			c.gridheight =1;
			c.insets =new Insets (10,0,30,0);
			getContentPane().add(Baff,c);
			//DrawItem(1,15,1,2,1,1,10,0,30,0,Baff);
			
			Beh.addActionListener(new ActionListener()
					{

				public void actionPerformed(ActionEvent e) {
					
					// String strWROptions = " -addins WebTest,Java";
					 //strWROptions += " -t \"D:\\";
					 //strWROptions += "L5_QE\\L5A";
					 //strWROptions += "\\Initial\" -create_text_report on -run";
					 try
					 {
					 String command = "C:\\Program Files\\TeXnicCenter\\TEXCNTR.exe" ;
					 //+ strWROptions;
					 Process p = Runtime.getRuntime().exec(command);
					 int e1 = p.waitFor();
					 }
					 catch (Exception e1)
					 {e1.printStackTrace();
					 }

					 				 
						}} );
			c.gridx = 2;
			c.gridy = 2;
			c.gridwidth =1;
			c.gridheight =1;
			c.insets =new Insets (10,0,30,0);
			getContentPane().add(Beh,c);
			//DrawItem(1,15,2,2,1,1,10,0,30,0,Beh);
	
			Ba.addActionListener(new ActionListener(){

				public void actionPerformed(ActionEvent e) {
					System.exit(0);
				}} );
			
			c.gridx =3;
			c.gridy = 2 ;
			c.gridwidth =1;
			c.gridheight =1 ;
			c.insets =new Insets (10,0,30,0);
			getContentPane().add( Ba ,c);
			//DrawItem(1,15,3,2,1,1,10,0,30,0,Ba);
			
			setBounds(calculateBounds(L1));
			//setSize(getLayout().preferredLayoutSize( this));
			setVisible(true);
			setResizable(false);
		
	
	}
	
	
	Rectangle calculateBounds(JLabel j1) {
		Dimension screenSize =Toolkit.getDefaultToolkit().getScreenSize();
		int screenWidth = screenSize.width ;
		int screenHight = screenSize.height ;
		int width = (int )((j1.getPreferredSize()).width +600);
		int hight = (int )((j1.getPreferredSize()).height * 30);
		int xPos=(screenWidth - width) / 2;
		int yPos =(screenHight - hight ) /2;
		return new Rectangle(xPos, yPos, width, hight);
		
		} 
	
	
	//public void DrawItem(int wx, int ipx, int  gx, int gy, int gw, int gh, int ix, int iy, int iw, int ih, Component comp){
			//getContentPane().setLayout(new  GridBagLayout());
			//GridBagConstraints c = new GridBagConstraints();
			//c.weightx =1;
		//	c.ipadx=10;
		//	c.weightx =wx;
			//c.ipadx=ipx;
			//c.gridx =gx;
			//c.gridy = gy;
			//c.gridwidth =gw;
		//	c.gridheight =gh ;
//	//		GridBagConstraints.BOTTOM_ALIGNMENTBOTH ;
		//	c.insets =new Insets (ix,iy,iw,ih);
	//		getContentPane().add( comp,c);	
			
		
	//}
	
	 public void actionPerformed(ActionEvent ae){
	
		  if(ae.getSource() == Bc) {
		 //  id = true;
			  MsgBox message = new MsgBox  (new Frame("") , "Select ?", true);
		   }
		 else if(ae.getSource() == Baff) {
		  MsgBox message = new MsgBox (new Frame("") , "Select ?", true);
		  }
		   else if(ae.getSource() == Ba) {

			    MsgBox message = new MsgBox (new Frame("") , "Select ?", true);
		    }
		 }
	
}

	
	
	

