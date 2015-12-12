/*
 * MainFrame.java
 *
 * Versin 1.0
 *
 * Created on 27 avril 2004, 12:26
 */

import java.awt.*;

import javax.swing.*;

import java.awt.event.*;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;

import javax.swing.Timer;
import javax.swing.border.Border;
import javax.swing.border.LineBorder;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

/**
 * Fenetre principale de l'application
 * 
 * @version 1.0
 * @author Olivier Mansion
 */
public class MainFrame extends JFrame {
	private static final String String = null;
	// Objet repr�sentant l'automate
	Automate automate;
	// Composants de la MainFrame
	MenuEditer menuEditer;
	StateBar stateBar;
	GraphicZone zoneGraphique;
	// Container
	Container content;
	String frameName;

	static int x;
	static int y;

	/** Creates a new instance  of MaFenetre */
	public MainFrame() {
		automate = new Automate();
		this.setIconImage(Toolkit.getDefaultToolkit().getImage(
				getClass().getResource("images/icon.gif")));
		frameName = "New document";
		this.setTitle("GenoTech");
		Dimension tailleEcran = java.awt.Toolkit.getDefaultToolkit()
				.getScreenSize();
		int hauteur = (int) tailleEcran.getHeight(); 
		int largeur = (int) tailleEcran.getWidth();
		this.setBounds(0, 0, largeur - 5, hauteur - 35);
		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		stateBar = new StateBar();
		zoneGraphique = new GraphicZone(automate, stateBar);
		JScrollPane scroller = new JScrollPane(zoneGraphique);
		content = this.getContentPane();
		content.setLayout(new BorderLayout());
		content.setBackground(Color.gray);
		menuEditer = new MenuEditer(this, automate, stateBar, zoneGraphique,
				content);
		this.setJMenuBar(menuEditer);
		
		JToolBar toolbar = new JToolBar();

        ImageIcon icon = new ImageIcon(Toolkit.getDefaultToolkit().getImage(
				getClass().getResource("images/exit.png")));

        JButton exitButton = new JButton(icon);
        toolbar.add(exitButton);
        
        int cores = Runtime.getRuntime().availableProcessors();
        String[] options=new String[cores*2];
        for(int i=1;i<=cores;i++)
     	   options[i-1]=""+i+"";
      
        final  JComboBox comboBox = new JComboBox(options);
        comboBox.setSize(100, 20);
        comboBox.setMaximumSize(new Dimension(100,20));
        comboBox.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
            	Global.cores=Integer.parseInt((String)comboBox.getSelectedItem());
            	 System.out.print(Global.cores);
            }
        });
        
        final JCheckBox privateroom = new JCheckBox("Run on Multicore",false);
        privateroom.addItemListener(new ItemListener()
        {
            public void itemStateChanged(ItemEvent event)
            {
            	 comboBox.setEnabled(Global.parallel=privateroom.isSelected());
            }
        });
        toolbar.add(privateroom);
      
        comboBox.setEnabled(false);
        toolbar.add(comboBox);
        exitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                System.exit(0);
            }
        });

       // add(toolbar, BorderLayout.NORTH);

        setTitle("GenNet - A Tool for Quantitative and Qualitative Modeling of GRNs");
        setSize(300, 200);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		content.add(stateBar, BorderLayout.SOUTH);
		content.add(scroller, BorderLayout.CENTER);
		zoneGraphique.menu = menuEditer;
		zoneGraphique.mf = this;
		zoneGraphique.setPreferredSize(new Dimension(zoneGraphique.getWidth(),
				zoneGraphique.getHeight()));
		zoneGraphique.revalidate();
		setVisible(true);
		x = zoneGraphique.getWidth();
		y = zoneGraphique.getHeight();
		zoneGraphique.setPreferredSize(new Dimension(zoneGraphique.getWidth(),
				zoneGraphique.getHeight()));
		zoneGraphique.revalidate();
		setBounds(0, 0, 2 * largeur / 3, 2 * hauteur / 3);
		validate();

		// JOptionPane.showMessageDialog(null,"Phaver output: "+execute("export PATH=$PATH:$HOME/local/bin; phaver /home/leepians/examples/mutex_discrete/mutex_4.pha"));

		// JOptionPane.showMessageDialog(null,"Hytech output: "+execute("export PATH=$PATH:$HOME; hytech /home/leepians/railroad.hy"));

	}
	
	public void pipline() {
		// execute("export PATH=$PATH:$HOME; hytech /home/leepians/railroad.hy",
		// "Hytech Output");
		// execute("export PATH=$PATH:$HOME; phaver /home/leepians/examples/mutex_discrete/mutex_4.pha",
		// "Phaver Output");
		// execute(" cd /home/leepians/Downloads/SMBioNet-3.1/bin; java Main '/home/leepians/Downloads/SMBioNet-3.1/samples/input_file'","SMBioNet Output");
	}

	public JFrame bar(String model) {
		JFrame f = new JFrame(model + " is being Generating...");
		Container content = f.getContentPane();
		JLabel im = new JLabel(new ImageIcon(Toolkit.getDefaultToolkit().getImage(
				getClass().getResource("images/bar1.gif"))));
		content.add(im, BorderLayout.CENTER);
		f.setSize(700, 400);
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		int height = screenSize.height;
		int width = screenSize.width;
		f.setLocation(width / 2, height / 2);
		f.setVisible(true);
		return f;
	}

	public static String execute(String command) {
		StringBuilder sb = new StringBuilder();
		String[] commands = new String[] { "/bin/sh", "-c", command };
		try {
			Process proc = new ProcessBuilder(commands).start();
			BufferedReader stdInput = new BufferedReader(new InputStreamReader(
					proc.getInputStream()));

			BufferedReader stdError = new BufferedReader(new InputStreamReader(
					proc.getErrorStream()));

			String s = null;
			while ((s = stdInput.readLine()) != null) {
				sb.append(s);
				sb.append("\n");
			}

			while ((s = stdError.readLine()) != null) {
				sb.append(s);
				sb.append("\n");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sb.toString();
	}

	public static void HyTech() {
		final JFrame f = Global.f;
		final Container content = f.getContentPane();

		// State Graph
		//JLabel picLabel = new JLabel(new ImageIcon(Global.image));
		//JScrollPane scroll1 = new JScrollPane(picLabel,
		//		JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
		//		JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		//content.add(scroll1, BorderLayout.CENTER);
		//scroll1.setPreferredSize(new Dimension(700, 400));
		//scroll1.revalidate();
		//content.add(scroll1);
		//f.setVisible(true);
		
		
		
		
		// Read File
		String text = readFile(Global.path + ".hy");
		 if(!Global.hres)	
			 {Global.hrest = new JTextArea("--Hybrid Model:\n--===========\n"+text, 20, 50);
		 
			Global.hres=true;
		//final JTextArea im = new JTextArea("--Hybrid Model:\n--===========\n"+text, 20, 50);
			Global.hrest.setLineWrap(true);
		final JButton btnReset = new JButton ("HyTech") ;
		btnReset.setBounds(20,300,300,25);
		btnReset.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent arg0) {
				// TODO Auto-generated method stub
				try (Writer writer = new BufferedWriter(new OutputStreamWriter(
						new FileOutputStream(Global.path+".hy"), "utf-8"))) {
						writer.write(Global.hrest.getText());
				} catch (IOException ex) {
					ex.printStackTrace();
				}			
				
				// Progress Bar
				JLabel img = new JLabel(new ImageIcon(Toolkit.getDefaultToolkit().getImage(
						getClass().getResource("images/bar1.gif"))));
				img.setText("HyTech Output is being Generated");
				content.add(img, BorderLayout.CENTER);
				f.setVisible(true);

				// HyTech
				String out = "--HyTech Output \n--===================================\n--\n--"+Global.path+"\n--"
						+ execute(
								"cd $HOME; ./hytech '" + Global.path + ".hy'")
								.replace("\n\n\n", "");
				f.remove(img);
				if(!out.contains("Error"))
				{
					if(Global.hyt) Global.hytr.setText(out);
					else
					{
						Global.hyt=true;
						Global.hytr = new JTextArea(out, 20, 50);
			//	btnReset.setEnabled(false);
				
						Global.hytr.setLineWrap(true); 
				JScrollPane scroll = new JScrollPane(Global.hytr,
						JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
						JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
				content.add(scroll, BorderLayout.CENTER);
				f.setVisible(true);		
					}
					
				}
				else 
				{
					JTextArea xField = new JTextArea(out, 20, 30);
					xField.setWrapStyleWord(true);
					JPanel myPanel = new JPanel();
					myPanel.add(xField);
					JOptionPane.showConfirmDialog(null, myPanel,
								"Error!",
								JOptionPane.OK_OPTION);
				}
				//im = new JTextArea("Hybrid Output is Generated For:\n====================\n"+Global.pcycles[Global.index], 20, 50);
				//im.setLineWrap(true);
				//scroll = new JScrollPane(im,
					//	JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
						//JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
				//content.add(scroll, BorderLayout.CENTER);
				//f.setVisible(true);
				
			}
		});
		JScrollPane scroll = new JScrollPane(Global.hrest,
				JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
				JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		content.add(scroll, BorderLayout.CENTER);
		f.add(btnReset);
		f.setVisible(true);
		 }
		 else Global.hrest.setText(text);
	}

	public void ModelCheckers(String path) {
		Global.hres=false;
		Global.hyt=false;
		final JFrame f = new JFrame("Pipelining Output...");
		f.setLayout(new FlowLayout());
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		f.setSize(screenSize);		

		Global.path = path;
		Global.f = f;
		Global.m = this;

		int height = screenSize.height;
		int width = screenSize.width;
		f.setLocation(width / 2, height / 2);
		final Container content = f.getContentPane();

		
	final	JTextArea im = new JTextArea(readFile(path), 20, 50);
		im.setLineWrap(true);
	final	JScrollPane scroll = new JScrollPane(im,
				JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
				JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		content.add(scroll, BorderLayout.CENTER);
		f.setVisible(true);
				
	final String path1=path;	
		im.setLineWrap(true);
		final JButton btnReset = new JButton ("SMBioNet") ;
		btnReset.setBounds(20,300,300,25);
		btnReset.addActionListener(new ActionListener() {
			
		@Override
		public void actionPerformed(ActionEvent arg0) {
			try (Writer writer = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(path1), "utf-8"))) {
				writer.write(im.getText());
			} catch (IOException ex) {
				ex.printStackTrace();
			}	
			
		// GenoTech
		String out ="";
		if(Global.parallel)out = "SMBioNet Output \n==================================="+ execute("export MPJ_HOME=$HOME/mpj; export PATH=$MPJ_HOME/bin:$PATH; cd $HOME/PSMBIONET; mpjrun.sh -np "+Global.cores+" PSMBIONET '"+ path1 + "'").replace("\n\n\n", "");
		else out = "SMBioNet Output \n==================================="+ execute("cd $HOME;java -jar SMB.jar '"+ path1 + "'").replace("\n\n\n", "");
		
		if(!out.contains("NuSMV terminated by a signal"))
		{
			btnReset.setEnabled(false);	
		//JTextArea im1 = new JTextArea(out, 20, 50);
		//im.setLineWrap(true);
		//JScrollPane scroll1 = new JScrollPane(im1,
			//	JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
				//JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		//content.add(scroll1, BorderLayout.CENTER);
		//f.setVisible(true);
		
		// Read File
		String text = readFile(path1 + ".out");
		System.out.print(text);
		
		
		// Parse Models
		String sar[];
		final JList listbox;
		if(Global.parallel)
		{
			text=text.replace("--END", "");
			sar = text.split("---------------------------------------------------------------");		
			for (int i = 0; i < sar.length; i++) {
				sar[i] = i+1+sar[i].replace("--"," ");
			}
		}
		else
		{
			String r="Name";
			sar = text.substring(text.indexOf("# MODEL 1"),
					text.indexOf("# SELECTED MODELS")).split("# MODEL");	
			/*
			////CSV
			boolean c=true;
			String p[]=sar[1].split("# ");
			for(int i=1;i<p.length;i++)
			{
				p[i]=p[i].substring(0, p[i].indexOf(" ="));
				for (int j = 1; j < sar.length; j++) {
					if(c)r+="\t"+j;
					p[i]+="\t"+sar[j].split("# ")[i].substring(sar[j].split("# ")[i].indexOf("= ")+2);
				}
				c=false;
				r+="\n"+p[i].replace("\n", "");
			}
			try (Writer writer = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(path1+".xls"), "utf-8"))) {
				writer.write(r);
			} catch (IOException ex) {
				ex.printStackTrace();
			}	
			///CSV
			 
			 */
			for (int i = 0; i < sar.length; i++) {
				sar[i] = sar[i].replace("#", "  ");
			}
		}
		listbox = new JList(sar);
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setViewportView(listbox);
		final String p = path1;  
		listbox.addListSelectionListener(new ListSelectionListener() {

			@Override
			public void valueChanged(ListSelectionEvent arg0) {
				if (!arg0.getValueIsAdjusting()) {
					String ks[] = ((String) listbox.getSelectedValue())
							.split("K_");
					parseKs(p, ks);
					stateGraph(f);
					//listbox.setEnabled(false);
				}
			}
		});
		scrollPane.setPreferredSize(new Dimension(500, 300));
		scrollPane.revalidate();
		content.add(scrollPane, BorderLayout.CENTER);
		f.setVisible(true);
		}
		else {
			JTextArea xField = new JTextArea(out, 20, 30);
			xField.setWrapStyleWord(true);
			JPanel myPanel = new JPanel();
			myPanel.add(xField);
			JOptionPane.showConfirmDialog(null, myPanel,
						"Error!",
						JOptionPane.OK_OPTION);
		}
////End Error
			}
			});
		f.add(btnReset);
		f.setVisible(true);
		
	}

	public void DrawGRN(JFrame f) {
		// GRN
		Container content = f.getContentPane();
		BufferedImage image = (BufferedImage) createImage(getContentPane()
				.getSize().width, getContentPane().getSize().height);
		getContentPane().paint(image.getGraphics());
		JLabel picLabel = new JLabel(new ImageIcon(image));
		JScrollPane scroll1 = new JScrollPane(picLabel,
				JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
				JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		content.add(scroll1, BorderLayout.CENTER);
		scroll1.setPreferredSize(new Dimension(500, 300));
		scroll1.revalidate();
		content.add(scroll1);
		f.setVisible(true);
	}

	public void stateGraph(JFrame f) {
		// State Graph
		Global.pipe = true;
		ActionEvent e = new ActionEvent(menuEditer.Open, 47, "");
		menuEditer.actionPerformed(e);
		//DrawGRN(f);
		e = new ActionEvent(menuEditer.StateGraph, 47, "");
		menuEditer.actionPerformed(e);
	}

	static int st = 1;

	public void parseKs(String path, String ks[]) {
		try {
			st=1;
			String xmlFilePath = path + ".xml";
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory
					.newInstance();

			DocumentBuilder documentBuilder = documentBuilderFactory
					.newDocumentBuilder();

			Document document = documentBuilder.parse(xmlFilePath);

			NodeList genes = document.getElementsByTagName("gene");
			
			for (int i = 0; i < genes.getLength(); i++) 
			{
				NodeList n = genes.item(i).getChildNodes();
				for (int j = 0; j < n.getLength(); j++) 
				{
					// Remove ks
					if ("Ks".equals(n.item(j).getNodeName())) 
					{
						genes.item(i).removeChild(n.item(j));
					}
				}
				// Add Ks node
				Element a, b, c, d;
				a = document.createElement("Ks");
				for (int k = 0; k < ks.length; k++) 
				{
					if (ks[k].split(" = ")[0].equals(getValue("name",(Element) genes.item(i))))
					{
						b = document.createElement("K");
						c = document.createElement("value");
						c.setTextContent(ks[k].split(" = ")[1]
								.replace("\n", "").replace(" ", ""));
						b.appendChild(c);
						a.appendChild(b);
						st++;
						genes.item(i).appendChild(a);
					} 
					else if (ks[k].contains("+")) 
					{
						if (ks[k].split(" = ")[0].replace("+", ":").split(":")[0].equals(getValue("name",(Element) genes.item(i)))) 
						{
							b = document.createElement("K");
							c = document.createElement("value");
							c.setTextContent(ks[k].split(" = ")[1].replace(
									"\n", "").replace(" ", ""));
							b.appendChild(c);
							int srt[]=new int[ks[k].split(" = ")[0].replace("+", ":").split(":").length];
							for(int p=1;p<srt.length;p++)
							{
								String key=ks[k].split(" = ")[0].replace("+", ":").split(":")[p];
								srt[p]=Integer.parseInt(geneMap.get(key));
							}
							Arrays.sort(srt);
							for(int p=1;p<srt.length;p++)
							{
								d = document.createElement("predecessor");
								d.setTextContent(String.valueOf(srt[p]));
								b.appendChild(d);
							}
							a.appendChild(b);
							st++;
							genes.item(i).appendChild(a);
						}
					}
				}
			}
			TransformerFactory transformerFactory = TransformerFactory
					.newInstance();

			Transformer transformer = transformerFactory.newTransformer();
			DOMSource domSource = new DOMSource(document);

			StreamResult streamResult = new StreamResult(
					new File(path + ".xml"));
			transformer.transform(domSource, streamResult);

			System.out.println("The XML File was ");

		} catch (ParserConfigurationException pce) {
			pce.printStackTrace();
		} catch (TransformerException tfe) {
			tfe.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (SAXException sae) {
			sae.printStackTrace();
		}
	}

	public static String readFile(String filename) {
		File f = new File(filename);
		try {
			byte[] bytes = Files.readAllBytes(f.toPath());
			return new String(bytes, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public void output(String path) {
		parsXML(path);
		//parsXMLs(path);
		if(!p)ModelCheckers(path.replace(".xml", ""));
		/*
		 * //Progress Bar img.setText("HyTech Output is being Generated");
		 * content.add(img, BorderLayout.CENTER); f.setVisible(true);
		 * 
		 * //HyTech
		 * out="HyTech Output \n==================================="+execute
		 * ("export PATH=$PATH:$HOME; hytech /home/leepians/railroad.hy"
		 * ).replace("\n\n\n", ""); f.remove(img); im = new
		 * JTextArea(out,20,50); im.setLineWrap(true); scroll = new JScrollPane
		 * (im, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
		 * JScrollPane.HORIZONTAL_SCROLLBAR_NEVER); content.add(scroll,
		 * BorderLayout.CENTER); f.setVisible(true);
		 * 
		 * //Progress Bar img.setText("PHAVer Output is being Generated");
		 * content.add(img, BorderLayout.CENTER); f.setVisible(true);
		 * 
		 * //Phaver
		 * out="PHAVer Output \n==================================="+execute(
		 * "export PATH=$PATH:$HOME; phaver /home/leepians/examples/mutex_discrete/mutex_4.pha"
		 * ).replace("\n\n\n", ""); f.remove(img); im = new
		 * JTextArea(out,20,50); im.setLineWrap(true); scroll = new JScrollPane
		 * (im, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
		 * JScrollPane.HORIZONTAL_SCROLLBAR_NEVER); content.add(scroll,
		 * BorderLayout.CENTER); f.setVisible(true);
		 */
	}

	public ArrayList<Models> models;//=new ArrayList<Models>();

	

	public ArrayList<Gene> genes;// =new ArrayList<Gene>();
	public ArrayList<Interaction> interactions;// =new ArrayList<Interaction>();
	public HashMap<String, String> geneMap;
	
	public void parsXMLs(String path) {
		try {
			genes = new ArrayList<Gene>();
			interactions = new ArrayList<Interaction>();
			models=new ArrayList<Models>();
			geneMap=new HashMap<>();
			
			File stocks = new File(path);
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(stocks);
			doc.getDocumentElement().normalize();

			
			
			
			String s[] = new String[] { "gene", "interaction" };

			for (int i = 0; i < s.length; i++) {
				NodeList nodes = doc.getElementsByTagName(s[i]);

				for (int j = 0; j < nodes.getLength(); j++) {
					Node node = nodes.item(j);

					if (node.getNodeType() == Node.ELEMENT_NODE) {
						Element element = (Element) node;
						if (i == 0) {
							Gene g = new Gene();
							g.Name = getValue("name", element);
							g.Number = Integer.parseInt(getValue("number",
									element));
							geneMap.put(g.Name, String.valueOf(g.Number));
							genes.add(g);
						} else {
							Interaction in = new Interaction();
							in.From = Integer.parseInt(getValue(
									"numInitialEnt", element));
							in.To = Integer.parseInt(getValue("numFinalEnt",
									element));
							in.Threashold = Integer.parseInt(getValue(
									"threshold", element));
							in.Sign = Integer
									.parseInt(getValue("sign", element));
							
							///New
								Models m=new Models();
								boolean check=true;
								for(Models m1:models)
								{
									if(Integer.parseInt(m1.From)==in.From)
									{
										m.Names=m1.Names+","+getValue("numFinalEnt", element);
										m.To=Integer.parseInt(getValue("numFinalEnt", element));
										m.From=getValue("numInitialEnt", element);
										models.add(m);
										check=false;
										m=m1;
										break;
									}
								}	
								//if(!check)models.remove(m);
								if(check)
								{
									m.Names=getValue("numFinalEnt", element);
									m.To=Integer.parseInt(getValue("numFinalEnt", element));
									m.From=getValue("numInitialEnt", element);
									models.add(m);
								}
							///end
							
							interactions.add(in);
						}
					}

				}
			}
int count=1;int del=0;
for(Models m:models)
{
	for(String sm:m.Names.split(","))
	{
			ArrayList<String> res = new ArrayList<String>();
			res.add("VAR\n\n");
			for (int i = 0; i < genes.size(); i++) {
				int th = 0;
				for (int j = 0; j < interactions.size(); j++) {
					if (genes.get(i).Number == interactions.get(j).From
							&& th < interactions.get(j).Threashold)
						th = interactions.get(j).Threashold;
				}
				res.add(genes.get(i).Name + "=0 " + th + ";\n");
			}
			res.add("\nREG\n\n");
			
			
			
			for (int i = 0; i < genes.size(); i++) {
				String acti = "";
				
				for (int j = 0; j < interactions.size(); j++) 
				{
					if (genes.get(i).Number == interactions.get(j).From
							&& interactions.get(j).Sign == 0) 
					{
						if(Integer.parseInt(m.From)==interactions.get(j).From && interactions.get(j).To==Integer.parseInt(sm))
						{
							acti = genes.get(i).Name + " [" + genes.get(i).Name
									+ "<" + m.Names.split(",").length + "]=>"
									+ getGeneName(interactions.get(j).To) + ";\n";
							res.add(acti);
						}
						else 
						{
							acti = genes.get(i).Name + " [" + genes.get(i).Name
									+ "<" + interactions.get(j).Threashold + "]=>"
									+ getGeneName(interactions.get(j).To) + ";\n";
							res.add(acti);
						}
						
						/*
						acti = genes.get(i).Name + " [" + genes.get(i).Name
								+ "<" + interactions.get(j).Threashold + "]=>"
								+ getGeneName(interactions.get(j).To) + ";\n";
						res.add(acti);
						
						*/
					}
				}
			}
		
					for (int i = 0; i < genes.size(); i++) 
					{
						String acti = "";
						for (int j = 0; j < interactions.size(); j++) 
						{					
							//New
								if(genes.get(i).Number == interactions.get(j).From
										&& interactions.get(j).Sign == 1 )
								{
										if(Integer.parseInt(m.From)==interactions.get(j).From && interactions.get(j).To==Integer.parseInt(sm))
										{
											acti = genes.get(i).Name + " [" + genes.get(i).Name
													+ ">=" + m.Names.split(",").length + "]=>"
													+ getGeneName(interactions.get(j).To) + ";\n";
											res.add(acti);
											del++;
										}
										else
										{
											acti = genes.get(i).Name + " [" + genes.get(i).Name
													+ ">=" + interactions.get(j).Threashold + "]=>"
													+ getGeneName(interactions.get(j).To) + ";\n";
											res.add(acti);
										}
								}
						}
					}
					path = path.replace(".xml", "");
					WriteFile(res, path+ String.valueOf(count++));
					//for(int i=0;i<del;i++)res.remove(res.size()-1);
						//end
					
					/*
					if (genes.get(i).Number == interactions.get(j).From
							&& interactions.get(j).Sign == 1) {
						acti = genes.get(i).Name + " [" + genes.get(i).Name
								+ ">=" + interactions.get(j).Threashold + "]=>"
								+ getGeneName(interactions.get(j).To) + ";\n";
						res.add(acti);
					}
					*/
				}
			}
/*
			JTextArea xField = new JTextArea("(BTK=1) -> EF(MAL=1)", 20, 30);
			JPanel myPanel = new JPanel();
			int result;
			myPanel.add(xField);
			do {
				result = JOptionPane.showConfirmDialog(null, myPanel,
						"Enter CTL verification formula",
						JOptionPane.OK_CANCEL_OPTION);
			} while (xField.getText() == "" || xField.getText() == null
					|| result != JOptionPane.OK_OPTION);

			res.add("\nCTL\n\n" + xField.getText());

			WriteFile(res, path);
			*/
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void parsXML(String path) {
		try {
			genes = new ArrayList<Gene>();
			interactions = new ArrayList<Interaction>();
			geneMap=new HashMap<String, String>();
			
			File stocks = new File(path);
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(stocks);
			doc.getDocumentElement().normalize();
			String s[] = new String[] { "gene", "interaction" };

			for (int i = 0; i < s.length; i++) {
				NodeList nodes = doc.getElementsByTagName(s[i]);

				for (int j = 0; j < nodes.getLength(); j++) {
					Node node = nodes.item(j);

					if (node.getNodeType() == Node.ELEMENT_NODE) {
						Element element = (Element) node;
						if (i == 0) {
							Gene g = new Gene();
							g.Name = getValue("name", element);
							g.Number = Integer.parseInt(getValue("number",element));
							geneMap.put(g.Name, String.valueOf(g.Number));
							genes.add(g);
						} else {
							Interaction in = new Interaction();
							in.From = Integer.parseInt(getValue(
									"numInitialEnt", element));
							in.To = Integer.parseInt(getValue("numFinalEnt",
									element));
							in.Threashold = Integer.parseInt(getValue(
									"threshold", element));
							in.Sign = Integer
									.parseInt(getValue("sign", element));
							interactions.add(in);
						}
					}

				}
			}
			ArrayList<String> res = new ArrayList<String>();
			res.add("VAR\n\n");
			for (int i = 0; i < genes.size(); i++) {
				int th = 0;
				for (int j = 0; j < interactions.size(); j++) {
					if (genes.get(i).Number == interactions.get(j).From
							&& th < interactions.get(j).Threashold)
						th = interactions.get(j).Threashold;
				}
				res.add(genes.get(i).Name + "=0 " + th + ";\n");
			}
			res.add("\nREG\n\n");
			
			
			
			for (int i = 0; i < genes.size(); i++) {
				String acti = "";
				
				for (int j = 0; j < interactions.size(); j++) 
				{
					if (genes.get(i).Number == interactions.get(j).From
							&& interactions.get(j).Sign == 0) 
					{
						acti = genes.get(i).Name + " [" + genes.get(i).Name
								+ "<" + interactions.get(j).Threashold + "]=>"
								+ getGeneName(interactions.get(j).To) + ";\n";
						res.add(acti);
					}
				}
			}
		
					for (int i = 0; i < genes.size(); i++) 
					{
						String acti = "";
						for (int j = 0; j < interactions.size(); j++) 
						{		
							if (genes.get(i).Number == interactions.get(j).From
								&& interactions.get(j).Sign == 1) {
							acti = genes.get(i).Name + " [" + genes.get(i).Name
									+ ">=" + interactions.get(j).Threashold + "]=>"
									+ getGeneName(interactions.get(j).To) + ";\n";
							res.add(acti);
							}
				}
			}//((ALGU=2) -> AX(AG(ALGU=2))) & ((ALGU=0) -> EF!(ALGU=2))
					JTextArea xField = new JTextArea(Global.ctlFormula, 20, 30);
					xField.setWrapStyleWord(true);
					JPanel myPanel = new JPanel();
					int result;
					myPanel.add(xField);
						result = JOptionPane.showConfirmDialog(null, myPanel,
								"Enter CTL verification formula",
								JOptionPane.OK_CANCEL_OPTION);
					if(xField.getText() == "" || xField.getText() == null
							|| result != JOptionPane.OK_OPTION)p=true;
					else p=false;
					res.add("\nCTL\n\n" + xField.getText());
					Global.ctlFormula=xField.getText();
					WriteFile(res, path);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	static MainFrame mf;
	boolean p=false;
	private String getValue(String tag, Element element) {
		NodeList nodes = element.getElementsByTagName(tag).item(0)
				.getChildNodes();
		Node node = (Node) nodes.item(0);
		return node.getNodeValue();
	}

	public String getGeneName(int no) {
		for (int i = 0; i < genes.size(); i++) {
			if (genes.get(i).Number == no)
				return genes.get(i).Name;
		}
		return "";
	}

	public void WriteFile(ArrayList<String> res, String path) {
		try (Writer writer = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(path.replace(".xml", "")), "utf-8"))) {

			for (int i = 0; i < res.size(); i++) {
				writer.write(res.get(i));
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

}

class Gene {
	Gene() {
		Name = "";
		Number = 0;
	}

	public String Name;
	public int Number;
}

class Interaction {
	Interaction() {
		Sign = From = To = Threashold = 0;
	}

	public int Sign;
	public int From;
	public int To;
	public int Threashold;
}

class Models {
	Models() {
		Sign = To = 0;
		From=Names = "";
	}

	public String Names;
	public int Sign;
	public String From;
	public int To;
}


