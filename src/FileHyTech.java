/*
 * UtiliseGraphviz.java
 * 
 * Version 1.0
 *
 * Cree le 11 decembre 2007
 * par Remy Clement
 */

import java.awt.Color;
import javax.swing.*;
import java.io.*;
import static java.lang.ProcessBuilder.Redirect.Type.READ;
import static java.lang.ProcessBuilder.Redirect.Type.WRITE;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.SeekableByteChannel;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FileHyTech implements  SeekableByteChannel{


	String destination;
	File file;	
	String initialLocation;
	String initialClockRegion;
	private StateGraphAutomate autoGS = new StateGraphAutomate();
	private ArrayList<Integer> vClock;
	int svClock; 	// Modified by Dr Jamil Ahmad
	String paras;
	String vars="";
	String invs="";
	String clocksremainsunchanged="";
	String StretatCourant="";
	boolean  anticipation=true;

	public FileHyTech(String iLocation,String iClock, String destination, StateGraphAutomate auto, File file) {
		this.initialLocation=iLocation;
		this.initialClockRegion=iClock;
		this.destination = destination;
		this.autoGS = auto;
		this.file=file;
		vClock=new ArrayList<Integer>();
		System.out.println("HyTech Values: "+initialLocation+"---------"+initialClockRegion+"   end");
	}

	public ArrayList<State> searchTargetStates(State state) {
		ArrayList<State> targetStates = new ArrayList<State>();
		ArrayList<TransState> transitions= new ArrayList<TransState>();
		for (int i = 0; i < autoGS.vTranStates.size(); i++) {
			if (autoGS.vTranStates.get(i).getNumInitialState()==state.getNum()) {
				transitions.add(autoGS.vTranStates.get(i));
			}
		}
		if(transitions!=null) {
			for (int i = 0; i < transitions.size(); i++) {
				State add;
				for (int j = 0; j < autoGS.vStates.size(); j++) {
					if (autoGS.vStates.get(j).getNum()==transitions.get(i).getNumFinalState()) {
						targetStates.add(autoGS.vStates.get(j));	
					}
				}						
			}
		}		
		return targetStates;
	}


	public void searchClock (State state) {
		// On reinitialise vHorloge
		vClock.removeAll(vClock);
		ArrayList<State> targetState1 = searchTargetStates(state);
		ArrayList<State> targetState2 = new ArrayList<State>(targetState1);		
		for (int i = 0; i < targetState1.size(); i++) {
			ArrayList<State> targetStateTemp = searchTargetStates(targetState1.get(i)); // post(post()
			for (int j = 0; j < targetStateTemp.size(); j++) {
				if (targetState2.contains(targetStateTemp.get(j))==false) {
					targetState2.add(targetStateTemp.get(j));
				}
			}
		}		
		for(int j=0;j<autoGS.vGeneNames.size();j++){	
			int value=0;						
			if (targetState1!=null) {
				for (int i = 0; i < targetState1.size(); i++) {
					int potentialTarget=Integer.parseInt(targetState1.get(i).getEtiquette().substring(2*j, 2*j+1));
					if (potentialTarget!=Integer.parseInt(state.getEtiquette().substring(2*j, 2*j+1))) {
						int difference=potentialTarget-Integer.parseInt(state.getEtiquette().substring(2*j, 2*j+1));
						value=difference;
					}			
				}				
			}
			svClock=vClock.size(); 	// Modified by Dr Jamil Ahmad

			if (value==0) {
				if (targetState2!=null) {
					for (int i = 0; i < targetState2.size(); i++) {
						int potentialTarget=Integer.parseInt(targetState2.get(i).getEtiquette().substring(2*j, 2*j+1));
						if (potentialTarget!=Integer.parseInt(state.getEtiquette().substring(2*j, 2*j+1))) {
							int difference=potentialTarget-Integer.parseInt(state.getEtiquette().substring(2*j, 2*j+1));
							value=difference*3;// *3 is to show anticipation and value should be divided by three at the time of assigning rates and anticpated transition should be commented
						}			
					}				
				}
			}

			vClock.add(value);

		}		
	}

	public void hyTechTreatment() {
		try {
			Utils extension = new Utils();
			if (extension.getExtension(file) == null) {
				destination = destination+".hy" ;
			}
			PrintWriter newFile = new PrintWriter(new FileWriter(destination));

			// we give the name of the file's header
			String filename = file.getName();
			if (filename.subSequence(filename.length()-3, filename.length()).equals(".hy")) {
				filename=filename.substring(0, filename.length()-3);
			}
			String hytechFile1="";
			hytechFile1+="-- File " + filename;
			hytechFile1+="\n-- Path Constraints \n\n";
			for(int j=0;j<autoGS.vGeneNames.size();j++){			
				hytechFile1+="-- gene No" + j + " = " + autoGS.vGeneNames.get(j);
			}
			hytechFile1+="\nvar\n";
			String hytechFile="";
			//noms des horloges
			for(int j=0;j<autoGS.vGeneNames.size();j++){			
				hytechFile+="h" + autoGS.vGeneNames.get(j);
				vars=vars + "h" + autoGS.vGeneNames.get(j);
				if (j<autoGS.vGeneNames.size()-1) {
					hytechFile+=",";
					vars=vars + ",";
				}
			}

			hytechFile+=" :analog;\n";
			hytechFile+="k,n: discrete;\n";
			hytechFile+="automaton auto\n";
			hytechFile+="synclabs: ;\n";



			// on �crit les noms des g�nes



			paras="";
			boolean check=true;
			// on �crit les transitions
			for(int i=0; i<autoGS.vStates.size() ; i++) 

			{
				String cp=autoGS.vStates.get(i).getEtiquette().toString();
				Global.pcycles[Global.index]=Global.pcycles[Global.index].replace(" ", "");
				if(Global.pcycles[Global.index].contains(cp) || Global.index==0)
				{

					if(check)
					{
						hytechFile+="initially loc_"+autoGS.vStates.get(i).getEtiquette().toString().replace(",", "")+";\n";
						check=false;
					}

					invs="";
					//=====================================

					searchClock(autoGS.vStates.get(i));


					for (int y = 0; y < vClock.size(); y++) {

						if (vClock.get(y)!=0) {
							// New Format
							int indexNo=autoGS.getAuto().getEntityIndex(autoGS.vGeneNames.get(y));
							String state=autoGS.vStates.get(i).getEtiquette().replace(",", "");
							char iState=state.charAt(indexNo);
							if (vClock.get(y)==1) {
								invs=invs + "h" +autoGS.vGeneNames.get(y)+" <= " +" dp"+autoGS.vGeneNames.get(y)+ iState + " & ";
							}
							if (vClock.get(y)==-1) {
								invs=invs + "h" +autoGS.vGeneNames.get(y)+" >= " + " dn"+autoGS.vGeneNames.get(y)+ iState + " & ";
							}
						}
					}

					if (invs.length()!=0) {
						invs=invs.substring(0, invs.length()-2);
					}
					if (invs.length()==0) {
						invs	=" True ";
					}
					//=====================================
					hytechFile+="-- for the configuration "+autoGS.vStates.get(i).getEtiquette();
					hytechFile+="\nloc loc_"+autoGS.vStates.get(i).getEtiquette().replace(",", "")+": while " + invs + " wait {";
					//Calcul des vtesses d'horloge
					searchClock(autoGS.vStates.get(i));
					for (int j = 0; j < vClock.size(); j++) {
						int v;
						if(vClock.get(j)==3 )
							v=vClock.get(j)/3;
						else if(vClock.get(j)==-3)
							v=vClock.get(j)/3;
						else if(vClock.get(j)<0)
							v=-vClock.get(j); 
						else
							v=vClock.get(j);                                        
						hytechFile+="dh"+autoGS.vGeneNames.get(j)+"="+v;
						if (j<vClock.size()-1) {
							hytechFile+=",";
						}
					}
					hytechFile+="}\n";
					invs="";

					for (int j = 0; j < vClock.size(); j++) {

						if (vClock.get(j)!=0) 
						{

							String etatCourant=autoGS.vStates.get(i).getEtiquette().replace(",", "");
							int v;
							if(vClock.get(j)==3 )
								v=vClock.get(j)/3;
							else if(vClock.get(j)==-3)
								v=vClock.get(j)/3;
							else
								v=vClock.get(j);
							String newEtat=etatCourant.substring(0, j)+(Integer.parseInt(etatCourant.substring(j, j+1))+v)+etatCourant.subSequence(j+1, etatCourant.length());

							if(!Global.pcycles[Global.index].replace(",", "").contains(newEtat) && Global.index!=0)
							{
								hytechFile+="--";
							}

								int indexNo=autoGS.getAuto().getEntityIndex(autoGS.vGeneNames.get(j));
								String state=autoGS.vStates.get(i).getEtiquette().replace(",", "");
								char iState=state.charAt(indexNo);
								if (vClock.get(j)==1) 
								{
									hytechFile+="when " +"h" +autoGS.vGeneNames.get(j)+"=dp"+autoGS.vGeneNames.get(j)+iState + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";\n"; 				
									if(paras.toLowerCase().contains(("dp"+autoGS.vGeneNames.get(j)+ iState).toLowerCase())==false)
										paras=paras+"dp"+autoGS.vGeneNames.get(j)+iState + ",";
								}
								if (vClock.get(j)==-1)
								{
									hytechFile+="when " +"h" +autoGS.vGeneNames.get(j)+"=dn"+autoGS.vGeneNames.get(j)+ iState + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";\n"; 				
									if(paras.toLowerCase().contains(("dn"+autoGS.vGeneNames.get(j)+ iState).toLowerCase())==false)
										paras=paras+"dn"+autoGS.vGeneNames.get(j)+ iState + ",";
								}	
								if (vClock.get(j)==3) {
									hytechFile+="--when " +"h" +autoGS.vGeneNames.get(j)+"=dp"+autoGS.vGeneNames.get(j)+iState + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";\n"; 				
									if(paras.toLowerCase().contains(("dp"+autoGS.vGeneNames.get(j)+ iState).toLowerCase())==false)
										paras=paras+"dp"+autoGS.vGeneNames.get(j)+ iState + ",";
								}
								if (vClock.get(j)==-3) 
								{
									hytechFile+="--when " +"h" +autoGS.vGeneNames.get(j)+"=dn"+autoGS.vGeneNames.get(j)+ iState+ " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";\n"; 				
									if(paras.toLowerCase().contains(("dn"+autoGS.vGeneNames.get(j)+ iState).toLowerCase())==false)
										paras=paras+"dn"+autoGS.vGeneNames.get(j)+ iState + ",";
								}
						}
					}	
					hytechFile+="\n";
				}
			}
			hytechFile+="end\n";

			paras="\n"+paras.substring(0, paras.length()-1)+": parameter;\n";
			hytechFile1+=paras;
			newFile.println(hytechFile1);
			newFile.println(hytechFile);
			newFile.println("-- Remove the comment symbol from the following codes for finding invariance kernel");
			newFile.println("-- Assign the initial location and the initial values of clocks to the initial region r_ini");
			newFile.println("var");
			newFile.println("init_reg, acces, r_old, r_new, r_acc, r_ini : region;");
			newFile.println("r_ini:= loc[auto] = loc_ "+initialLocation+" & "+initialClockRegion+";  --complete this line"); 
			newFile.println("r_new:=hide k,n in hull (post(r_ini & k=n) & ~k=n) endhide;");
			newFile.println("r_old:=r_ini & ~r_ini;");
			newFile.println("while not empty(r_new) and empty(r_new & r_ini) do");
			newFile.println("r_old:=r_new;");
			newFile.println("r_new:=hide k,n in hull(post(r_new & k=n) & ~k=n) endhide;");
			newFile.println("endwhile;");
			newFile.println("-- To verify that the initial zone is accessible from itself");
			newFile.println("if not empty (r_new & r_ini) then");
			newFile.println("---- if accessible");
			newFile.println("r_acc:=hide k,n in hull(post(r_new & k=n) &~k=n) endhide; ");
			newFile.println("r_old:=r_ini & ~r_ini; --empty region initialization");
			newFile.println("while not empty(r_acc) and not r_new<=r_old do ");
			newFile.println("r_old:=r_new; ");
			newFile.println("while not empty(r_acc) and empty(r_acc & r_ini) do ");
			newFile.println("r_acc:= hide k,n in hull(post(r_acc & k=n) &~k=n) endhide; ");
			newFile.println("endwhile; ");
			newFile.println("r_acc:=hull(r_acc & r_ini); ");
			newFile.println("r_new:=hull(r_acc & r_new); ");
			newFile.println("r_acc:=hide k,n in hull(post(r_new & k=n) & ~k=n) endhide; ");
			newFile.println("endwhile; ");
			newFile.println("if not empty(r_new) then ");
			newFile.println(" prints \"============================================================\"; ");
			newFile.println(" prints \" Delay constraintes: \";");
			newFile.println(" print  hide " + vars +  " in r_new endhide; ");
			newFile.println(" prints \"============================================================\"; ");
			newFile.println("else ");
			newFile.println(" prints \"Invariance kernel does not exist from the initial region \"; ");
			newFile.println("endif; ");
			newFile.println("else ");
			newFile.println( "prints \" The initial region is not accessible from itself hence \" ; ");
			newFile.println(" prints \" there is no initial condition that leads to an invariance kernel.\"; ");
			newFile.println("endif; ");

			newFile.close();
			System.out.println("paras: "+paras);
			//insertParas(paras,0);
			//  Hytech file with less delays

			/*
			if (filename.subSequence(filename.length()-3, filename.length()).equals(".hy")) {
				filename=filename.substring(0, filename.length()-3);
			}
			newFile.println("-- new File " + filename);
			newFile.println("");
			newFile.println("");
			newFile.println("var");
			//noms des horloges
			for(int j=0;j<autoGS.vGeneNames.size();j++){			
				newFile.print("h" + autoGS.vGeneNames.get(j));
				vars=vars + "h" + autoGS.vGeneNames.get(j);
				if (j<autoGS.vGeneNames.size()-1) {
					newFile.print(",");
					vars=vars + ",";
				}
			}

			newFile.println(" :analog;");
			newFile.println("k,n: discrete;");
			newFile.println("automaton auto");
			newFile.println("synclabs: ;");
			newFile.println("initially True;");


			// on �crit les noms des genes
			for(int j=0;j<autoGS.vGeneNames.size();j++){			
				newFile.println("-- gene no" + j + " = " +autoGS.vGeneNames.get(j));
			}
			newFile.println("");
			//By Dr Jamil

			paras="";
			// on �crit les transitions
			for(int i=0; i<autoGS.vStates.size() ; i++) {


				invs="";
				//=====================================

			// Modified by Dr Jamil Ahmad

				searchClock(autoGS.vStates.get(i));

				// compute the constraints of a location
				for (int y = 0; y < vClock.size(); y++) {

					if (vClock.get(y)!=0) {

						if (vClock.get(y)==1) {
							invs=invs + "h" +autoGS.vGeneNames.get(y)+" <= " +" dp"+autoGS.vGeneNames.get(y)+ " & ";
						}
						if (vClock.get(y)==-1) {
							invs=invs + "h" +autoGS.vGeneNames.get(y)+" >= " + " dn"+autoGS.vGeneNames.get(y)+  " & ";
						}
					}
				}
				//***********************************************
				// remove the last char "&"	
				if (invs.length()!=0) {
					invs=invs.substring(0, invs.length()-2);
					}
				//************************
				if (invs.length()==0) {
				invs	=" True ";
				}

				//=====================================

	     		newFile.println("-- pour la configuration "+autoGS.vStates.get(i).getEtiquette());
				newFile.print("loc loc_"+autoGS.vStates.get(i).getEtiquette().replace(",", "")+": while " + invs + " wait {");
				//Calcul des vtesses d'horloge
				searchClock(autoGS.vStates.get(i));
				for (int j = 0; j < vClock.size(); j++) {
                                    if (vClock.get(j)==1 || vClock.get(j)==-1)
					newFile.print("dh"+autoGS.vGeneNames.get(j)+"="+vClock.get(j));
                                     if (vClock.get(j)==3)
					newFile.print("dh"+autoGS.vGeneNames.get(j)+"="+vClock.get(j)/3);
                                      if (vClock.get(j)==-3)
					newFile.print("dh"+autoGS.vGeneNames.get(j)+"="+vClock.get(j)/3);
					if (j>0 && j<vClock.size()-1) {
						newFile.print(",");
					}
				}
				newFile.println("}");
				invs="";

				for (int j = 0; j < vClock.size(); j++) {
					//for (int j = 0; j < svClock; j++) {		
					if (vClock.get(j)!=0) {
						String etatCourant=autoGS.vStates.get(i).getEtiquette().replace(",", "");
                                                int v;
                                                if(vClock.get(j)==3 )
                                      v=vClock.get(j)/3;
                                   else if(vClock.get(j)==-3)
                                       v=vClock.get(j)/3;
                                    else
					v=vClock.get(j);
						String newEtat=etatCourant.substring(0, j)+(Integer.parseInt(etatCourant.substring(j, j+1))+v)+etatCourant.subSequence(j+1, etatCourant.length());
						// Modified by Dr Jamil Ahmad

						if (vClock.get(j)==1) {
							newFile.println("when " +"h" +autoGS.vGeneNames.get(j)+"=dp"+autoGS.vGeneNames.get(j) + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";"); 				
							if (paras.toLowerCase().contains("dp"+autoGS.vGeneNames.get(j).toLowerCase())==false){
								paras=paras+"dp"+autoGS.vGeneNames.get(j)+ ",";
							}
							}
						if (vClock.get(j)==-1) {
							newFile.println("when " +"h" +autoGS.vGeneNames.get(j)+"=dn"+autoGS.vGeneNames.get(j) + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";"); 				
							if (paras.toLowerCase().contains("dp"+autoGS.vGeneNames.get(j).toLowerCase())==false){
								paras=paras+"dn"+autoGS.vGeneNames.get(j)+  ",";
							}
						}
                                   //Transition due to anticipation  are commented Dr Jamil Ahmad
                                                				if (vClock.get(j)==3) {
							newFile.println("--when " +"h" +autoGS.vGeneNames.get(j)+"=dp"+autoGS.vGeneNames.get(j) + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";"); 				
							if (paras.toLowerCase().contains("dp"+autoGS.vGeneNames.get(j).toLowerCase())==false){
								paras=paras+"dp"+autoGS.vGeneNames.get(j)+ ",";
							}
							}
						if (vClock.get(j)==3) {
							newFile.println("--when " +"h" +autoGS.vGeneNames.get(j)+"=dn"+autoGS.vGeneNames.get(j) + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";"); 				
							if (paras.toLowerCase().contains("dp"+autoGS.vGeneNames.get(j).toLowerCase())==false){
								paras=paras+"dn"+autoGS.vGeneNames.get(j)+  ",";
							}
						}





					}
				}	
				newFile.println("");
			}
			newFile.println("end");

			// Modified by Dr Jamil Ahmad
			paras=paras.substring(0, paras.length()-1);
			newFile.println("-- move parameters to var section in the model");
			newFile.println( paras+": parameter;");
			newFile.println("--Remove the comment symbol from the following codes for finding constraints of paths");
			newFile.println("var");
			newFile.println("--init_reg, acces : region;");
			newFile.println("--init_reg := loc[auto] = conf_ & ;");
			newFile.println("--acces := reach forward from init_reg endreach;");
			newFile.println("acces:=hull(acces);");
			newFile.println("--prints \" Etats accessibles \"; ");
			newFile.println("print hide " + vars +  " in acces endhide;");
			newFile.println("-- remove the comment symbol from the following codes for finding invariance kernel");
			newFile.println("r_ini:= loc[auto] = loc_ ;");
			newFile.println("r_new:=hide k,n in hull (post(r_ini & k=n) & ~k=n) endhide;");
			newFile.println("r_old:=r_ini & ~r_ini;");
			newFile.println("while not empty(r_new) and empty(r_new & r_ini) do");
			newFile.println("r_old:=r_new;");
			newFile.println("r_new:=hide k,n in hull(post(r_new & k=n) & ~k=n) endhide;");
			newFile.println("endwhile;");
			newFile.println("-- To verify that the initial zone is accessible from itself");
			newFile.println("if not empty (r_new & r_ini) then");
			newFile.println("---- if accessible");
			newFile.println("--r_acc:=hide k,n in hull(post(r_new & k=n) &~k=n) endhide; ");
			newFile.println("-- r_old:=r_ini & ~r_ini; --empty region initialization");
			newFile.println("--while not empty(r_acc) and not r_new<=r_old do ");
			newFile.println("--r_old:=r_new; ");
			newFile.println("--while not empty(r_acc) and empty(r_acc & r_ini) do ");
			newFile.println("--r_acc:= hide k,n in hull(post(r_acc & k=n) &~k=n) endhide; ");
			newFile.println("--endwhile; ");
			newFile.println("--r_acc:=hull(r_acc & r_ini); ");
			newFile.println("--r_new:=hull(r_acc & r_new); ");
			newFile.println("--r_acc:=hide k,n in hull(post(r_new & k=n) & ~k=n) endhide; ");
			newFile.println("--endwhile; ");
			newFile.println("--if not empty(r_new) then ");
			newFile.println("--prints  \"============================================================\" ;");
			newFile.println("--prints" + "Constrained region of the Invariance Kernel in the zone:" + "; ");
			newFile.println("----print hide h in r_new endhide; ");
			newFile.println("--prints \"============================================================\"; ");
			newFile.println("--prints \" Delay constraintes: \";");
			newFile.println("--print  hide" + vars +  "in r_new endhide; ");
			newFile.println("--prints \"============================================================\"; ");
			newFile.println("--else ");
			newFile.println("--prints \"Invariance kernel does not exist from the initial region \"; ");
			newFile.println("--endif; ");
			newFile.println("--else ");
			newFile.println("--prints \" The initial region is not accessible from itself hence \" ; ");
			newFile.println("--prints \" there is no initial condition that leads to an invariance kernel.\"; ");
			newFile.println("--endif; ");
			 */
		} catch (IOException ex) {
			Logger.getLogger(FileHyTech.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	public void hyTechPhaver() {
		try {
			Utils extension = new Utils();
			if (extension.getExtension(file) == null) {
				destination = destination+".pha" ;
			}
			PrintWriter newFile = new PrintWriter(new FileWriter(destination));			
			String filename = file.getName(); 
			if (filename.subSequence(filename.length()-3, filename.length()).equals(".ph")) {
				filename=filename.substring(0, filename.length()-3);
			}
			newFile.println("-- new File " + filename);
			for(int j=0;j<autoGS.vGeneNames.size();j++){			
				newFile.println("-- gene no" + j + " = " +autoGS.vGeneNames.get(j));
			}
			newFile.println("");
			newFile.println("automaton auto");
			newFile.println("");
			newFile.println("contr_var :");
			//noms des horloges
			for(int j=0;j<autoGS.vGeneNames.size();j++){			
				newFile.print("h" + autoGS.vGeneNames.get(j));
				vars=vars + "h" + autoGS.vGeneNames.get(j);
				if (j<autoGS.vGeneNames.size()-1) {
					newFile.print(",");
					vars=vars + ",";
				}
			}

			newFile.println(" ;");
			newFile.println("");
			newFile.println("synclabs: empty ;");
			paras="";
			for(int i=0; i<autoGS.vStates.size() ; i++) {

				invs="";
				searchClock(autoGS.vStates.get(i));
				for (int y = 0; y < vClock.size(); y++) {
					int indexNo=autoGS.getAuto().getEntityIndex(autoGS.vGeneNames.get(y));
					String state=autoGS.vStates.get(i).getEtiquette().replace(",", "");
					char iState=state.charAt(indexNo);

					if (vClock.get(y)!=0) {

						if (vClock.get(y)==1) {
							invs=invs + "h" +autoGS.vGeneNames.get(y)+" <= " +" dp"+autoGS.vGeneNames.get(y)+iState+ " & ";
						}
						if (vClock.get(y)==-1) {
							invs=invs + "h" +autoGS.vGeneNames.get(y)+" >= " + " dn"+autoGS.vGeneNames.get(y)+iState+  " & ";
						}
					}
				}
				if (invs.length()!=0) {
					invs=invs.substring(0, invs.length()-2);
				}
				if (invs.length()==0) {
					invs	=" True ";
				}
				newFile.println("-- for the configuration "+autoGS.vStates.get(i).getEtiquette());
				newFile.print("loc loc_"+autoGS.vStates.get(i).getEtiquette().replace(",", "")+": while " + invs + " wait {");

				searchClock(autoGS.vStates.get(i));
				for (int j = 0; j < vClock.size(); j++) {
					if(vClock.get(j)==3)
						newFile.print("h"+autoGS.vGeneNames.get(j)+"'=="+vClock.get(j)/3);
					else if(vClock.get(j)==-3)
						newFile.print("h"+autoGS.vGeneNames.get(j)+"'=="+vClock.get(j)/3);
					else
						newFile.print("h"+autoGS.vGeneNames.get(j)+"'=="+vClock.get(j));
					if (j>0 && j<vClock.size()-1) {
						newFile.print(" & ");
					}
				}
				newFile.println("}");
				invs="";

				for (int j = 0; j < vClock.size(); j++) {		
					if (vClock.get(j)!=0) {
						String etatCourant=autoGS.vStates.get(i).getEtiquette().replace(",", "");
						int v;
						if(vClock.get(j)==3 )
							v=vClock.get(j)/3;
						else if(vClock.get(j)==-3)
							v=vClock.get(j)/3;
						else
							v=vClock.get(j);
						String newEtat=etatCourant.substring(0, j)+(Integer.parseInt(etatCourant.substring(j, j+1))+v)+etatCourant.subSequence(j+1, etatCourant.length());
						int indexNo=autoGS.getAuto().getEntityIndex(autoGS.vGeneNames.get(j));
						String state=autoGS.vStates.get(i).getEtiquette().replace(",", "");
						char iState=state.charAt(indexNo);
						if (vClock.get(j)==1 || vClock.get(j)==3 ) {
							for (int k = 0; k < vClock.size(); k++) {
								if (autoGS.vGeneNames.get(j)!=autoGS.vGeneNames.get(k)) {
									clocksremainsunchanged=clocksremainsunchanged+"h"+ autoGS.vGeneNames.get(k)+"'=="+ "h"+autoGS.vGeneNames.get(k)+ " & ";
								}
							}
							if (clocksremainsunchanged.length()!=0) {
								clocksremainsunchanged=clocksremainsunchanged.substring(0, clocksremainsunchanged.length()-2);
							}
							//---------- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
							if(vClock.get(j)==3){
								newFile.println("--when " +"h" +autoGS.vGeneNames.get(j)+"==dp"+autoGS.vGeneNames.get(j)+iState + " sync empty" + " do {"+ clocksremainsunchanged + "& h" + autoGS.vGeneNames.get(j)+"'==0 }"+" goto loc_"+newEtat + ";"); 				
							}
							else
								newFile.println("when " +"h" +autoGS.vGeneNames.get(j)+"==dp"+autoGS.vGeneNames.get(j)+iState + " sync empty" + " do {"+ clocksremainsunchanged + "& h" + autoGS.vGeneNames.get(j)+"'==0 }"+" goto loc_"+newEtat + ";"); 				
							if (paras.toLowerCase().contains("dp"+autoGS.vGeneNames.get(j).toLowerCase())==false){
								paras=paras+"dp"+autoGS.vGeneNames.get(j)+iState+ ",";
							}
						}

						clocksremainsunchanged="";

						if (vClock.get(j)==-1 || vClock.get(j)==-3) {
							//------- assigns clocks other than reset  the same value by Dr jamil
							for (int k = 0; k < vClock.size(); k++) {
								if (autoGS.vGeneNames.get(j)!=autoGS.vGeneNames.get(k)) {
									clocksremainsunchanged=clocksremainsunchanged +"h"+ autoGS.vGeneNames.get(k)+"'==" + "h"+autoGS.vGeneNames.get(k)+" & ";
								}
							}
							if (clocksremainsunchanged.length()!=0) {
								clocksremainsunchanged=clocksremainsunchanged.substring(0, clocksremainsunchanged.length()-2);
							}
							//----------
							if(vClock.get(j)==-3)
								newFile.println("--when " +"h" +autoGS.vGeneNames.get(j)+"==dn"+autoGS.vGeneNames.get(j)+iState + " sync empty" + " do {" + clocksremainsunchanged + "& h" + autoGS.vGeneNames.get(j)+"'==0 }"+" goto loc_"+newEtat + ";"); 				
							else
								newFile.println("when " +"h" +autoGS.vGeneNames.get(j)+"==dn"+autoGS.vGeneNames.get(j)+iState + " sync empty" + " do {" + clocksremainsunchanged + "& h" + autoGS.vGeneNames.get(j)+"'==0 }"+" goto loc_"+newEtat + ";"); 				
							if (paras.toLowerCase().contains("dn"+autoGS.vGeneNames.get(j).toLowerCase())==false){
								paras=paras+"dn"+autoGS.vGeneNames.get(j)+iState+  ",";
							}	
						}
						clocksremainsunchanged="";
					}
				}	
				newFile.println("");
			}
			newFile.println("end");
			paras="\nparameter: "+paras.substring(0, paras.length()-1)+"; \n";
			newFile.println("--Remove the comment symbol from the following codes for finding constraints of paths");
			newFile.println("-- Analysis commands");
			newFile.println("//Parameters settings");
			newFile.println("auto.reverse;");
			newFile.println("REACH_MAX_ITER=1;  ");
			newFile.println("//Only the cont-region ");
			newFile.println("int=auto.reachable;");
			newFile.println("REACH_MAX_ITER=-1;");
			newFile.println("reg_int=auto.reachable;");
			newFile.println("int.print;");
			newFile.println("reg_int.print;");
			newFile.println("--Difference");
			newFile.println("echo \"Difference\";");
			newFile.println("int.difference_assign(reg_int);");
			newFile.println("int.print;");
			newFile.println("echo \"first Intersection\";");
			newFile.println("REACH_MAX_ITER=5;");
			newFile.println("auto.initial_states(int);");
			newFile.println("int=auto.reachable;");
			newFile.println("reg_int.intersection_assign(int);");
			newFile.println("auto.initial_states(reg_int);");
			newFile.println("--reg_int.remove("+ vars+ ");");
			newFile.println("reg_int.print;");
			newFile.println("--2nd iteration/intersection");
			newFile.println("REACH_MAX_ITER=1; ");
			newFile.println("int=auto.reachable;");
			newFile.println("REACH_MAX_ITER=-1;");
			newFile.println("reg_int=auto.reachable;");
			newFile.println("--Difference");
			newFile.println("echo \"Difference\";");
			newFile.println("int.difference_assign(reg_int);");
			newFile.println("int.print;");
			newFile.println("echo \"2nd Intersection\";");
			newFile.println("REACH_MAX_ITER=5;");
			newFile.println("auto.initial_states(int);");
			newFile.println("int=auto.reachable;");
			newFile.println("reg_int.intersection_assign(int);");
			newFile.println("auto.initial_states(reg_int);");
			newFile.println("--reg_int.remove("+ vars+ ");");
			newFile.println("reg_int.print;");
			newFile.println("--2nd iteration/intersection");
			newFile.println("REACH_MAX_ITER=1; ");
			newFile.println("int=auto.reachable;");
			newFile.println("REACH_MAX_ITER=-1;");
			newFile.println("reg_int=auto.reachable;");
			newFile.println("--Difference");
			newFile.println("echo \"Difference\";");
			newFile.println("int.difference_assign(reg_int);");
			newFile.println("int.print;");
			newFile.println("echo \"3rd Intersection\";");
			newFile.println("REACH_MAX_ITER=5;");
			newFile.println("auto.initial_states(int);");
			newFile.println("int=auto.reachable;");
			newFile.println("reg_int.intersection_assign(int);");
			newFile.println("auto.initial_states(reg_int);");
			newFile.println("--reg_int.remove("+ vars+ ");");
			newFile.println("reg_int.print;"); 


			newFile.close();
			insertParas(paras,1);

			JOptionPane.showMessageDialog(null, "File Saved at: "+destination);
			Runtime.getRuntime().exec("echo $PATH");
			// JOptionPane.showMessageDialog(null,"Phaver output: "+Run(new String[]{"/local/bin/phaver"}));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String Run(String[] cmd) {
		StringBuffer theRun = null;
		try {
			Process process = Runtime.getRuntime().exec(cmd);

			BufferedReader reader = new BufferedReader(
					new InputStreamReader(process.getInputStream()));
			int read;
			char[] buffer = new char[4096];
			StringBuffer output = new StringBuffer();
			while ((read = reader.read(buffer)) > 0) {
				theRun = output.append(buffer, 0, read);
			}
			reader.close();
			process.waitFor();

		} catch (IOException e) {
			throw new RuntimeException(e);
		} catch (InterruptedException e) {
			throw new RuntimeException(e);
		}
		return theRun.toString().trim();
	}
	public void hyTechTreatment2() {
		try {
			Utils extension = new Utils();
			if (extension.getExtension(file) == null) {
				destination = destination+".hy" ;
			}
			PrintWriter newFile = new PrintWriter(new FileWriter(destination));

			// we give the name of the file's header
			String filename = file.getName();
			if (filename.subSequence(filename.length()-3, filename.length()).equals(".hy")) {
				filename=filename.substring(0, filename.length()-3);
			}
			String hytechFile1="";
			hytechFile1+="-- File " + filename;
			hytechFile1+="\n-- Path Constraints \n\n";
			for(int j=0;j<autoGS.vGeneNames.size();j++){			
				hytechFile1+="-- gene No" + j + " = " + autoGS.vGeneNames.get(j);
			}
			hytechFile1+="\nvar\n";
			String hytechFile="";
			//noms des horloges
			for(int j=0;j<autoGS.vGeneNames.size();j++){			
				hytechFile+="h" + autoGS.vGeneNames.get(j);
				vars=vars + "h" + autoGS.vGeneNames.get(j);
				if (j<autoGS.vGeneNames.size()-1) {
					hytechFile+=",";
					vars=vars + ",";
				}
			}

			hytechFile+=" :analog;\n";
			hytechFile+="k,n: discrete;\n";
			hytechFile+="automaton auto\n";
			hytechFile+="synclabs: ;\n";



			// on �crit les noms des g�nes



			paras="";
			boolean check=true;
			// on �crit les transitions
			for(int i=0; i<autoGS.vStates.size() ; i++) 

			{
				String cp=autoGS.vStates.get(i).getEtiquette().toString();
				Global.pcycles[Global.index]=Global.pcycles[Global.index].replace(" ", "");
				if(Global.index==1)
				{

					if(check)
					{
						hytechFile+="initially loc_"+autoGS.vStates.get(i).getEtiquette().toString().replace(",", "")+";\n";
						check=false;
					}

					invs="";
					//=====================================

					searchClock(autoGS.vStates.get(i));


					for (int y = 0; y < vClock.size(); y++) {

						if (vClock.get(y)!=0) {
							// New Format
							int indexNo=autoGS.getAuto().getEntityIndex(autoGS.vGeneNames.get(y));
							String state=autoGS.vStates.get(i).getEtiquette().replace(",", "");
							char iState=state.charAt(indexNo);
							if (vClock.get(y)==1) {
								invs=invs + "h" +autoGS.vGeneNames.get(y)+" <= " +" dp"+autoGS.vGeneNames.get(y)+ iState + " & ";
							}
							if (vClock.get(y)==-1) {
								invs=invs + "h" +autoGS.vGeneNames.get(y)+" >= " + " dn"+autoGS.vGeneNames.get(y)+ iState + " & ";
							}
						}
					}

					if (invs.length()!=0) {
						invs=invs.substring(0, invs.length()-2);
					}
					if (invs.length()==0) {
						invs	=" True ";
					}
					//=====================================
					hytechFile+="-- for the configuration "+autoGS.vStates.get(i).getEtiquette();
					hytechFile+="\nloc loc_"+autoGS.vStates.get(i).getEtiquette().replace(",", "")+": while " + invs + " wait {";
					//Calcul des vtesses d'horloge
					searchClock(autoGS.vStates.get(i));
					for (int j = 0; j < vClock.size(); j++) {
						int v;
						if(vClock.get(j)==3 )
							v=vClock.get(j)/3;
						else if(vClock.get(j)==-3)
							v=vClock.get(j)/3;
						else if(vClock.get(j)<0)
							v=-vClock.get(j); 
						else
							v=vClock.get(j); 
						                                       
						hytechFile+="dh"+autoGS.vGeneNames.get(j)+"="+v;
						if (j<vClock.size()-1) {
							hytechFile+=",";
						}
					}
					hytechFile+="}\n";
					invs="";

					for (int j = 0; j < vClock.size(); j++) {

						if (vClock.get(j)!=0) 
						{

							String etatCourant=autoGS.vStates.get(i).getEtiquette().replace(",", "");
							int v;
							if(vClock.get(j)==3 )
								v=vClock.get(j)/3;
							else if(vClock.get(j)==-3)
								v=vClock.get(j)/3;
							else
								v=vClock.get(j);
							String newEtat=etatCourant.substring(0, j)+(Integer.parseInt(etatCourant.substring(j, j+1))+v)+etatCourant.subSequence(j+1, etatCourant.length());

							//if(!Global.pcycles[Global.index].replace(",", "").contains(newEtat) && Global.index!=0)
							//{
								//hytechFile+="--";
							//}

								int indexNo=autoGS.getAuto().getEntityIndex(autoGS.vGeneNames.get(j));
								String state=autoGS.vStates.get(i).getEtiquette().replace(",", "");
								char iState=state.charAt(indexNo);
								if (vClock.get(j)==1) 
								{
									hytechFile+="when " +"h" +autoGS.vGeneNames.get(j)+"=dp"+autoGS.vGeneNames.get(j)+iState + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";\n"; 				
									if(paras.toLowerCase().contains(("dp"+autoGS.vGeneNames.get(j)+ iState).toLowerCase())==false)
										paras=paras+"dp"+autoGS.vGeneNames.get(j)+iState + ",";
								}
								if (vClock.get(j)==-1)
								{
									hytechFile+="when " +"h" +autoGS.vGeneNames.get(j)+"=dn"+autoGS.vGeneNames.get(j)+ iState + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";\n"; 				
									if(paras.toLowerCase().contains(("dn"+autoGS.vGeneNames.get(j)+ iState).toLowerCase())==false)
										paras=paras+"dn"+autoGS.vGeneNames.get(j)+ iState + ",";
								}	
								if (vClock.get(j)==3) {
									hytechFile+="--when " +"h" +autoGS.vGeneNames.get(j)+"=dp"+autoGS.vGeneNames.get(j)+iState + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";\n"; 				
									if(paras.toLowerCase().contains(("dp"+autoGS.vGeneNames.get(j)+ iState).toLowerCase())==false)
										paras=paras+"dp"+autoGS.vGeneNames.get(j)+ iState + ",";
								}
								if (vClock.get(j)==-3) 
								{
									hytechFile+="--when " +"h" +autoGS.vGeneNames.get(j)+"=dn"+autoGS.vGeneNames.get(j)+ iState+ " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";\n"; 				
									if(paras.toLowerCase().contains(("dn"+autoGS.vGeneNames.get(j)+ iState).toLowerCase())==false)
										paras=paras+"dn"+autoGS.vGeneNames.get(j)+ iState + ",";
								}
						}
					}	
					hytechFile+="\n";
				}
			}
			hytechFile+="end\n";

			paras="\n"+paras.substring(0, paras.length()-1)+": parameter;\n";
			hytechFile1+=paras;
			newFile.println(hytechFile1);
			newFile.println(hytechFile);
			newFile.println("--Remove the comment symbol from the following codes for finding constraints of paths");
			newFile.println("var");
			newFile.println("init_reg, acces : region;");
			//newFile.println("init_reg := loc[auto] = conf_ ? & ;"+vars.replaceAll(",", " =0,")+"=0");
			newFile.println("init_reg := "+vars.replaceAll(",", " =0 & ")+"=0;");
			newFile.println("--Use either reach forward or post");
			newFile.println("--acces := reach forward from init_reg endreach;");
			newFile.println("acces := post(post(post(post(post(post(post(init_reg)))))));");
			newFile.println("acces:=hull(acces);");
			newFile.println("prints \" Reachable States \"; ");
			newFile.println("print hide " + vars +  " in acces endhide;");
			newFile.println("\n");
			newFile.close();
			//insertParas(paras,0);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertParas(String paras, int type){

		String fileName=file.getPath();
		if(type==0){
			if (fileName.subSequence(fileName.length()-3, fileName.length()).equals(".hy")) {
				fileName=fileName.substring(0, fileName.length()-3);
			}
			fileName=fileName+".hy";
		}
		if(type==1){
			if (fileName.subSequence(fileName.length()-3, fileName.length()).equals(".ph")) {
				fileName=fileName.substring(0, fileName.length()-3);
			}
			fileName=fileName+".ph";
		}
		byte data[] = paras.getBytes();
		ByteBuffer out = ByteBuffer.wrap(data);
		long pos=0;
		try {
			String var="";
			String var2="";
			RandomAccessFile fis = new RandomAccessFile(fileName,"rw");
			FileChannel fileChannel = fis.getChannel();
			ByteBuffer buffer = ByteBuffer.allocate(1024);
			int bytesRead = fileChannel.read(buffer);
			int i=0;
			boolean b=false;
			if(type==0){
				while (bytesRead != -1) {
					System.out.println("Read: " + bytesRead);
					buffer.flip();

					while (buffer.hasRemaining()) {
						if(b==false){
							var=var+((char) buffer.get());
							i++;
						} 
						if(var.contains("var")){

							pos=i+1;
							b=true;

						}
						if(b==true)
							var2=var2+((char) buffer.get());
						//  System.out.print((char) buffer.get()); 

					}
					buffer.clear();
					bytesRead = fileChannel.read(buffer);

				}
			}
			if(type==1){
				while (bytesRead != -1) {
					System.out.println("Read: " + bytesRead);
					buffer.flip();

					while (buffer.hasRemaining()) {
						if(b==false){
							var=var+((char) buffer.get());
							i++;
						} 
						if(var.contains("syn")){
							var=var.substring(0, (var.length())-3);
							var2="syn";
							pos=i-3;
							b=true;

						}
						if(b==true)
							var2=var2+((char) buffer.get());
						//  System.out.print((char) buffer.get()); 

					}
					buffer.clear();
					bytesRead = fileChannel.read(buffer);

				}
				var2="\n"+var2;
			}
			var=var+"\n";
			System.out.print("Position : "+pos);
			//out.flip();

			byte  data2[] = var2.getBytes();
			ByteBuffer out2 = ByteBuffer.wrap(data2);
			byte  data1[] = var.getBytes();
			ByteBuffer out1 = ByteBuffer.wrap(data1);
			while(out1.hasRemaining()) {
				fileChannel.write(out1);
			}  
			fileChannel.position(pos);
			while(out.hasRemaining()) {
				fileChannel.write(out);
			}   
			while(out2.hasRemaining()) {
				fileChannel.write(out2);
			} 

			fileChannel.close();

			fis.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@Override
	public int read(ByteBuffer dst) throws IOException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public int write(ByteBuffer src) throws IOException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public long position() throws IOException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public SeekableByteChannel position(long newPosition) throws IOException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public long size() throws IOException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public SeekableByteChannel truncate(long size) throws IOException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public boolean isOpen() {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}

	@Override
	public void close() throws IOException {
		throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
	}
}