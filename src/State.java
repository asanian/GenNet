import java.awt.Color;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;


public class State {

    // Etiquette de l'�tape
    String label;
    
    //numero de l'etat
    int num;
    // Position dans la fenetre
    int x;
    int y;
    Color couleurPuit;
    Color couleurFond=Color.white;
    
    int selected;//1 si selectionn�e, 0 sinon
    
	public State(String label, int i, int j, int num, boolean puit) {
        
		this.label = label;
        this.x = i;
        this.y = j;
        selected = 0;
        this.num=num;
        if (puit)
        {
        	couleurPuit=Color.red;
        }
        else
        {
        	couleurPuit=Color.black;
        }
	}
	
    public boolean zoneInfluence(int xI, int yI) {
        if ((xI >= (x - 18)) && (xI <= (x + 18)) && (yI >= (y - 17)) && (yI <= (y + 16))) {
            return true;
        } else {
            return false;
        }
    }

    public void drawGraphics(Graphics g, Color c) {

        int posEtX;
        int posEtY;
        
        Graphics2D g2d = (Graphics2D) g;
        
        FontMetrics fontMetrics = g2d.getFontMetrics();
        int length = fontMetrics.stringWidth(label);
        
        // on determine la largeur de l'�tat en fonction de la longueur de la chaine de caractere
        int width = 32;
        if (length + 8 > width) {
            width = length + 8;
        }
        
        posEtX = this.x - width / 2;
        posEtY = this.y - 16;
        
        if (selected == 1) {
            g.setColor(couleurFond);
            g.fillRoundRect((int)(Zoom.coef*posEtX), (int)(Zoom.coef*posEtY), (int)(Zoom.coef*width), (int)(Zoom.coef*32) , (int)(Zoom.coef*10), (int)(Zoom.coef*10));
            g.setColor(Color.BLUE);
            g.drawRoundRect((int)(Zoom.coef*posEtX), (int)(Zoom.coef*posEtY), (int)(Zoom.coef*width), (int)(Zoom.coef*32) , (int)(Zoom.coef*10), (int)(Zoom.coef*10));
            g.setColor(Color.BLUE);
            g.drawString(label, (int)(Zoom.coef*(this.x - length / 2)), (int)(Zoom.coef*(this.y + 14)));
        } else {
            g.setColor(couleurFond);
            g.fillRoundRect((int)(Zoom.coef*posEtX), (int)(Zoom.coef*posEtY), (int)(Zoom.coef*width), (int)(Zoom.coef*32) , (int)(Zoom.coef*10), (int)(Zoom.coef*10));
            g.setColor(couleurPuit);
            g.drawRoundRect((int)(Zoom.coef*posEtX), (int)(Zoom.coef*posEtY), (int)(Zoom.coef*width), (int)(Zoom.coef*32) , (int)(Zoom.coef*10), (int)(Zoom.coef*10));
            g.setColor(couleurPuit);
            g.drawString(label, (int)(Zoom.coef*(this.x - length / 2)), (int)(Zoom.coef*(this.y + 14)));
        }    
    }

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getEtiquette() {
		return label;
	}

	public Color getCouleurPuit() {
		return couleurPuit;
	}

	public void setCouleurPuit(Color couleurPuit) {
		this.couleurPuit = couleurPuit;
	}
}
