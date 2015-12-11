import java.awt.Dimension;

import javax.swing.JPanel;


public class Zoom {
	static double coef=1d;
	private JPanel panel;
	
	public Zoom(JPanel panel){
		this.panel=panel;
		panel.setPreferredSize(new Dimension((int)(panel.getWidth()*coef), (int)(panel.getHeight()*coef)));
		panel.revalidate();
	}

}
