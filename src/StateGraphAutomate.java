import java.awt.Color;
import java.awt.Graphics;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Vector;


public class StateGraphAutomate {

	/** 
	 * vecteur contenant les noms des g�nes
	 */    
	public Vector<String> vGeneNames; // gene names
	/**
	/** vecteur d'�tats
	 */    
        private Automate auto;
	public Vector<State> vStates;
	/**
	 * vecteur de transition
	 */    
	public Vector<TransState> vTranStates;

	public HashMap<Integer,Vector<Integer>> correspondance;     

	boolean modif;

	String comment;

	public StateGraphAutomate() {
		super();
		vGeneNames=new Vector<String>();
		vStates=new Vector<State>();
		vTranStates=new Vector<TransState>();
		correspondance=new HashMap<Integer,Vector<Integer>>();
		modif=false;
		comment="no Comments";
                auto=new Automate();
	}

	public StateGraphAutomate(HashMap<Vector, LinkedList<Vector>> liens) {
		// TODO Auto-generated constructor stub
	}

	public boolean getModif() {
		return modif;
	}

	public void modif(boolean b) {
		this.modif = b;
	}

	public void addState(State etat) {
		vStates.add(etat);
	}

	public void drawGraphics(Graphics g, Color c) {

		int i, j; // compteurs

		for (j = 0; j < vTranStates.size(); j = j + 1) {			
			TransState transCt = (TransState) vTranStates.get(j);
			transCt.drawGraph(g, c);
		}
		for (i = 0; i < vStates.size(); i = i + 1) {
			State etatCt = (State) vStates.get(i);
			etatCt.drawGraphics(g, c);
		}
	}

	public void decolore() {
		for (State state : vStates)
		{
			state.couleurFond=Color.white;
		}
		for (TransState trans : vTranStates)
		{
			trans.selectedGreen=0;
			trans.pathColor=Color.black;			
		}

	}

	public void colore(LinkedList<Vector> liste, boolean cycle) {
		for (Vector element : liste) {
			for (State etat : vStates) {				
				String aComparer = element.toString();
				aComparer = aComparer.replace("[", "");
				aComparer = aComparer.replace("]", "");
				aComparer = aComparer.replace(" ", ""); 				
				if (etat.label.equals(aComparer)) {								
					etat.couleurFond=Color.gray;
				}
			}
		}
		for (int i=0; i<liste.size()-1; i++) {
			for (TransState trans : vTranStates) {
				if (correspondance.get(trans.getNumInitialState()).equals(liste.get(i)) && correspondance.get(trans.getNumFinalState()).equals(liste.get(i+1)))	{
					trans.selectedGreen=1;								
				}
			}
		}
		if (cycle)
		{
			for (TransState trans : vTranStates)
			{
				if (correspondance.get(trans.getNumInitialState()).equals(liste.get(liste.size()-1)) && correspondance.get(trans.getNumFinalState()).equals(liste.get(0)))
				{
					trans.pathColor=Color.green;
				}

			}
		}
	}

	public void setVGeneNames(Vector<String> nomsGenes) {
		vGeneNames = nomsGenes;
                
	}

	public void addTranState(TransState transEtat) {
		vTranStates.add(transEtat);  
	}

	public void deleteState() {
		vStates.removeAllElements();
	}

	public void deleteTranState() {
		vTranStates.removeAllElements();
	}
	
	public void deleteTransGeneNames() {
		vGeneNames.removeAllElements();
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getComment() {
		return comment;
	}

    /**
     * @return the auto
     */
    public Automate getAuto() {
        return auto;
    }

    /**
     * @param auto the auto to set
     */
    public void setAuto(Automate auto) {
        this.auto = auto;
    }

}
