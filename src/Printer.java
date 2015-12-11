import java.awt.Container;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.print.PageFormat;
import java.awt.print.Paper;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;


public class Printer implements Printable {

	private Container container;
	private PageFormat pageFormat;
	private PrinterJob printJob;
	private String title;

	public Printer(Container container, String title){
		
		this.container=container;
		this.title=title;
		printJob = PrinterJob.getPrinterJob();
        pageFormat = printJob.defaultPage();
        
        try{
            if(printJob.printDialog()){
            	
                printJob.setPrintable(this, pageFormat);
                pageFormat = printJob.pageDialog(pageFormat);
                printJob.print();
            }
        }
        catch(PrinterException pe)
        {
        	pe.printStackTrace();
        }
	}
	
	public int print(Graphics g, PageFormat pf, int pageIndex)
	throws PrinterException {
		if(pageIndex>0) return NO_SUCH_PAGE;
		Graphics2D g2d = (Graphics2D)g;
		container.paint(g2d);
		g2d.drawString(title, 72, (int)pf.getImageableHeight()+70);
		
		return PAGE_EXISTS;
	}
}
