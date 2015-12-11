import java.util.LinkedList;
import java.util.Vector;

/**
 * 
 * @author Michael
 *
 */
public class Node {

	public Vector state;
	public Node parent;
	public LinkedList<Node> child;


	public Node(Vector state, Node parent) {
		this.state = state;
		child = new LinkedList<Node>();
		this.parent = parent;
	}
	public Node(Vector state) {
		this.state = state;
		child = new LinkedList<Node>();
		Vector<Integer> emptyParent=new Vector<Integer>();
		emptyParent.add(-1);
		parent = new Node(emptyParent, null);
	}

	public Node getFils(int n){
		return child.get(n);
	}
	public void newChild(Vector childState){
		Node newChild = new Node(childState, this);
		child.add(newChild);
	}

}