
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrator
 */
public class newHytech {
    String destination;
	File file;	
	private StateGraphAutomate autoGS = new StateGraphAutomate();
	private ArrayList<Integer> vClock;
	int svClock; 	// Modified by Dr Jamil Ahmad
	String paras="";
	String vars="";
	String invs="";
	String clocksremainsunchanged="";
	String StretatCourant="";
    boolean  anticipation=true;

	/**
	 * 
	 * @param destination
	 * @param auto
	 * @param file
	 */
	public newHytech(String destination, StateGraphAutomate auto, File file) {
		this.destination = destination;
		this.autoGS = auto;
		this.file=file;
		vClock=new ArrayList<Integer>();
	}
	
	/**
	 * 
	 * @param etat : etat de depart
	 * @return la liste des etats cibles de l'état de base
	 */
	public ArrayList<State> searchTargetStates(State etat) {
		ArrayList<State> targetStates = new ArrayList<State>();
		ArrayList<TransState> transitions= new ArrayList<TransState>();
		for (int i = 0; i < autoGS.vTranStates.size(); i++) {
			if (autoGS.vTranStates.get(i).getNumInitialState()==etat.getNum()) {
				transitions.add(autoGS.vTranStates.get(i));
			}
		}
		if(transitions!=null) {
			for (int i = 0; i < transitions.size(); i++) {
				State aAjouter;
				for (int j = 0; j < autoGS.vStates.size(); j++) {
					if (autoGS.vStates.get(j).getNum()==transitions.get(i).getNumFinalState()) {
						targetStates.add(autoGS.vStates.get(j));	
					}
				}						
			}
		}		
		return targetStates;
	}
	
	/**
	 * Cette methode sert a chercher les vitesse d'horloge pour chaque etat
	 * @param etat : etat de depart
	 */
	public void searchClock (State etat) {
		// On reinitialise vClock
		vClock.removeAll(vClock);
		ArrayList<State> targetState1 = searchTargetStates(etat);
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
					int ciblePotentielle=Integer.parseInt(targetState1.get(i).getEtiquette().substring(2*j, 2*j+1));
					if (ciblePotentielle!=Integer.parseInt(etat.getEtiquette().substring(2*j, 2*j+1))) {
						int difference=ciblePotentielle-Integer.parseInt(etat.getEtiquette().substring(2*j, 2*j+1));
						value=difference;
					}			
				}				
			}
			svClock=vClock.size(); 	// Modified by Dr Jamil Ahmad
			
			if (value==0) {
				if (targetState2!=null) {
					for (int i = 0; i < targetState2.size(); i++) {
						int potentialTarget=Integer.parseInt(targetState2.get(i).getEtiquette().substring(2*j, 2*j+1));
						if (potentialTarget!=Integer.parseInt(etat.getEtiquette().substring(2*j, 2*j+1))) {
							int difference=potentialTarget-Integer.parseInt(etat.getEtiquette().substring(2*j, 2*j+1));
							value=difference;
						}			
					}				
				}
			}			
			vClock.add(value);
		}		
	}

	/**
	 * Pour écrire dans le newFile Hytech
	 */
	public void traitementHytechGe() {
		try {
			PrintWriter newFile = new PrintWriter(new FileWriter(destination));
		
			// on donne le nom du newFile en en-tete
			String nomFichier = file.getName();
			if (nomFichier.subSequence(nomFichier.length()-3, nomFichier.length()).equals(".hy")) {
				nomFichier=nomFichier.substring(0, nomFichier.length()-3);
			}
			newFile.println("-- Fichier " + nomFichier);
			newFile.println("");
			newFile.println("");
			newFile.println("var");
			//noms des horloges
			for(int j=0;j<autoGS.vGeneNames.size();j++){			
				newFile.print("h" + autoGS.vGeneNames.get(j));
				vars=vars + "h" + autoGS.vGeneNames.get(j);
				if (j!=autoGS.vGeneNames.size()-1) {
					newFile.print(",");
					vars=vars + ",";
				}
			}
							
			newFile.println(" :analog;");
			newFile.println("k,n: discrete;");
			newFile.println("automaton auto");
			newFile.println("synclabs: ;");
			newFile.println("initially True;");
			
			
			// on écrit les noms des gènes
			for(int j=0;j<autoGS.vGeneNames.size();j++){			
				newFile.println("-- gène n°" + j + " = " + autoGS.vGeneNames.get(j));
			}
			newFile.println("");
			//By Dr Jamil
		
			paras="";
			// on écrit les transitions
			for(int i=0; i<autoGS.vStates.size() ; i++) {
				
				
				invs="";
				//=====================================
			// Modified by Dr Jamil Ahmad
					searchClock(autoGS.vStates.get(i));
					
				
				for (int y = 0; y < vClock.size(); y++) {
									
					if (vClock.get(y)!=0) {
						
						if (vClock.get(y)==1) {
							invs=invs + "h" +autoGS.vGeneNames.get(y)+" <= " +" dp"+autoGS.vGeneNames.get(y)+ autoGS.vStates.get(i).getEtiquette().replace(",", "") + " & ";
						}
						if (vClock.get(y)==-1) {
							invs=invs + "h" +autoGS.vGeneNames.get(y)+" >= " + " dn"+autoGS.vGeneNames.get(y)+ autoGS.vStates.get(i).getEtiquette().replace(",", "") + " & ";
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
		   		newFile.println("-- pour la configuration "+autoGS.vStates.get(i).getEtiquette());
				newFile.print("loc loc_"+autoGS.vStates.get(i).getEtiquette().replace(",", "")+": while " + invs + " wait {");
				//Calcul des vtesses d'horloge
				searchClock(autoGS.vStates.get(i));
				for (int j = 0; j < vClock.size(); j++) {
					newFile.print("dh"+autoGS.vGeneNames.get(j)+"="+vClock.get(j));
					if (j!=vClock.size()-1) {
						newFile.print(",");
					}
				}
				newFile.println("}");
				invs="";
				
				for (int j = 0; j < vClock.size(); j++) {
		
					if (vClock.get(j)!=0) {
						String etatCourant=autoGS.vStates.get(i).getEtiquette().replace(",", "");
						String newEtat=etatCourant.substring(0, j)+(Integer.parseInt(etatCourant.substring(j, j+1))+vClock.get(j))+etatCourant.subSequence(j+1, etatCourant.length());
				
						//////////////////////////////// by Dr jamil Ahmad
						// blocks the transitions due to anticipation
						
						// new
					/*	for (int k = 0; k < autoGS.vTranStates.size(); k++) {
							if (autoGS.vTranStates.get(k).getNumInitialState() == autoGS.vStates.get(i).getNum()){
								for (int l=0; l < autoGS.vStates.size(); l++){
									if (autoGS.vTranStates.get(j).getNumFinalState() == autoGS.vStates.get(l).getNum()){
										StretatCourant=autoGS.vStates.get(l).getEtiquette().replace(",", "");
									    if (StretatCourant == newEtat){
									        anticipation=false;
									    }
									  }
										
									}
								}
							} 
						if (!anticipation){
							if (vClock.get(j)==1) {
							newFile.println("when " +"h" +autoGS.vGeneNames.get(j)+"=dp"+autoGS.vGeneNames.get(j)+ autoGS.vStates.get(i).getEtiquette().replace(",", "") + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";"); 				
							paras=paras+"dp"+autoGS.vGeneNames.get(j)+ autoGS.vStates.get(i).getEtiquette().replace(",", "") + ",";
							}
							if (vClock.get(j)==-1) {
							newFile.println("when " +"h" +autoGS.vGeneNames.get(j)+"=dn"+autoGS.vGeneNames.get(j)+ autoGS.vStates.get(i).getEtiquette().replace(",", "") + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";"); 				
					    	paras=paras+"dn"+autoGS.vGeneNames.get(j)+ autoGS.vStates.get(i).getEtiquette().replace(",", "") + ",";
							}
							JOptionPane.showMessageDialog(null,paras);
        				}
		
						} 
						
						// end new 
						*/
						// Modified by Dr Jamil Ahmad
						
						// Old 
						 if (vClock.get(j)==1) {
							newFile.println("when " +"h" +autoGS.vGeneNames.get(j)+"=dp"+autoGS.vGeneNames.get(j)+ autoGS.vStates.get(i).getEtiquette().replace(",", "") + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";"); 				
							paras=paras+"dp"+autoGS.vGeneNames.get(j)+ autoGS.vStates.get(i).getEtiquette().replace(",", "") + ",";
							}
							if (vClock.get(j)==-1) {
							newFile.println("when " +"h" +autoGS.vGeneNames.get(j)+"=dn"+autoGS.vGeneNames.get(j)+ autoGS.vStates.get(i).getEtiquette().replace(",", "") + " do {"+ "h" + autoGS.vGeneNames.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";"); 				
							paras=paras+"dn"+autoGS.vGeneNames.get(j)+ autoGS.vStates.get(i).getEtiquette().replace(",", "") + ",";
							}	
						
						// end Old 
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
	/*		
			
		//  Hytech file with less delays
			

			if (nomFichier.subSequence(nomFichier.length()-3, nomFichier.length()).equals(".hy")) {
				nomFichier=nomFichier.substring(0, nomFichier.length()-3);
			}
			newFile.println("-- Fichier " + nomFichier);
			newFile.println("");
			newFile.println("");
			newFile.println("var");
			//noms des horloges
			for(int j=0;j<autoge.vNomsGenes.size();j++){			
				newFile.print("h" + autoGS.vNomsGenes.get(j));
				vars=vars + "h" + autoGS.vNomsGenes.get(j);
				if (j!=autoGS.vNomsGenes.size()-1) {
					newFile.print(",");
					vars=vars + ",";
				}
			}
							
			newFile.println(" :analog;");
			newFile.println("k,n: discrete;");
			newFile.println("automaton auto");
			newFile.println("synclabs: ;");
			newFile.println("initially True;");
			
			
			// on écrit les noms des gènes
			for(int j=0;j<autoge.vNomsGenes.size();j++){			
				newFile.println("-- gène n°" + j + " = " + autoGS.vNomsGenes.get(j));
			}
			newFile.println("");
			//By Dr Jamil
		
			paras="";
			// on écrit les transitions
			for(int i=0; i<autoge.vEtats.size() ; i++) {
				
				
				invs="";
				//=====================================
				
			// Modified by Dr Jamil Ahmad
				
				searchClock(autoGS.vEtats.get(i));
				
				// compute the constraints of a location
				for (int y = 0; y < vClock.size(); y++) {
									
					if (vClock.get(y)!=0) {
						
						if (vClock.get(y)==1) {
							invs=invs + "h" +autoGS.vNomsGenes.get(y)+" <= " +" dp"+autoGS.vNomsGenes.get(y)+ " & ";
						}
						if (vClock.get(y)==-1) {
							invs=invs + "h" +autoGS.vNomsGenes.get(y)+" >= " + " dn"+autoGS.vNomsGenes.get(y)+  " & ";
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
				
	     		newFile.println("-- pour la configuration "+autoGS.vEtats.get(i).getEtiquette());
				newFile.print("loc loc_"+autoGS.vEtats.get(i).getEtiquette().replace(",", "")+": while " + invs + " wait {");
				//Calcul des vtesses d'horloge
				searchClock(autoGS.vEtats.get(i));
				for (int j = 0; j < vClock.size(); j++) {
					newFile.print("dh"+autoGS.vNomsGenes.get(j)+"="+vClock.get(j));
					if (j!=vClock.size()-1) {
						newFile.print(",");
					}
				}
				newFile.println("}");
				invs="";
				
				for (int j = 0; j < vClock.size(); j++) {
					//for (int j = 0; j < svClock; j++) {		
					if (vClock.get(j)!=0) {
						String etatCourant=autoGS.vEtats.get(i).getEtiquette().replace(",", "");
						String newEtat=etatCourant.substring(0, j)+(Integer.parseInt(etatCourant.substring(j, j+1))+vClock.get(j))+etatCourant.subSequence(j+1, etatCourant.length());
						// Modified by Dr Jamil Ahmad
						if (vClock.get(j)==1) {
							newFile.println("when " +"h" +autoGS.vNomsGenes.get(j)+"=dp"+autoGS.vNomsGenes.get(j) + " do {"+ "h" + autoGS.vNomsGenes.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";"); 				
							if (paras.toLowerCase().contains("dp"+autoGS.vNomsGenes.get(j).toLowerCase())==false){
								paras=paras+"dp"+autoGS.vNomsGenes.get(j)+ ",";
							}
							}
						if (vClock.get(j)==-1) {
							newFile.println("when " +"h" +autoGS.vNomsGenes.get(j)+"=dn"+autoGS.vNomsGenes.get(j) + " do {"+ "h" + autoGS.vNomsGenes.get(j)+"'=0, k'=k+1}"+" goto loc_"+newEtat + ";"); 				
							if (paras.toLowerCase().contains("dp"+autoGS.vNomsGenes.get(j).toLowerCase())==false){
								paras=paras+"dn"+autoGS.vNomsGenes.get(j)+  ",";
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
			
	/*	
	// In PhaVer format
			
	if (nomFichier.subSequence(nomFichier.length()-3, nomFichier.length()).equals(".hy")) {
				nomFichier=nomFichier.substring(0, nomFichier.length()-3);
			}
			newFile.println("-- Fichier " + nomFichier);
			newFile.println("automaton auto");
			newFile.println("");
			newFile.println("contr_var :");
			//noms des horloges
			for(int j=0;j<autoge.vNomsGenes.size();j++){			
				newFile.print("h" + autoGS.vNomsGenes.get(j));
				vars=vars + "h" + autoGS.vNomsGenes.get(j);
				if (j!=autoGS.vNomsGenes.size()-1) {
					newFile.print(",");
					vars=vars + ",";
				}
			}
							
			newFile.println(" ;");
			newFile.println("parameter : ");
	
			newFile.println("synclabs: empty ;");
			
			
			// on écrit les noms des gènes
			for(int j=0;j<autoge.vNomsGenes.size();j++){			
				newFile.println("-- gène n°" + j + " = " + autoGS.vNomsGenes.get(j));
			}
			newFile.println("");
			//By Dr Jamil
		
			paras="";
			// on écrit les transitions
			for(int i=0; i<autoge.vEtats.size() ; i++) {
				
					invs="";
				//=====================================
				
			// Modified by Dr Jamil Ahmad
				
				searchClock(autoGS.vEtats.get(i));
				
				// compute the constraints of a location
				for (int y = 0; y < vClock.size(); y++) {
									
					if (vClock.get(y)!=0) {
						
						if (vClock.get(y)==1) {
							invs=invs + "h" +autoGS.vNomsGenes.get(y)+" <= " +" dp"+autoGS.vNomsGenes.get(y)+ " & ";
						}
						if (vClock.get(y)==-1) {
							invs=invs + "h" +autoGS.vNomsGenes.get(y)+" >= " + " dn"+autoGS.vNomsGenes.get(y)+  " & ";
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
				
	     		newFile.println("-- pour la configuration "+autoGS.vEtats.get(i).getEtiquette());
				newFile.print("loc loc_"+autoGS.vEtats.get(i).getEtiquette().replace(",", "")+": while " + invs + " wait {");
				//Calcul des vtesses d'horloge
				searchClock(autoGS.vEtats.get(i));
				for (int j = 0; j < vClock.size(); j++) {
					newFile.print("h"+autoGS.vNomsGenes.get(j)+"'=="+vClock.get(j));
					if (j!=vClock.size()-1) {
						newFile.print(" & ");
					}
				}
				newFile.println("}");
				invs="";
				
				for (int j = 0; j < vClock.size(); j++) {
					//for (int j = 0; j < svClock; j++) {		
					if (vClock.get(j)!=0) {
						String etatCourant=autoGS.vEtats.get(i).getEtiquette().replace(",", "");
						String newEtat=etatCourant.substring(0, j)+(Integer.parseInt(etatCourant.substring(j, j+1))+vClock.get(j))+etatCourant.subSequence(j+1, etatCourant.length());
						// Modified by Dr Jamil Ahmad
						if (vClock.get(j)==1) {
							
							//------- assigns clocks other than reset  the same value  by Dr jamil
							
							for (int k = 0; k < vClock.size(); k++) {
								if (autoGS.vNomsGenes.get(j)!=autoGS.vNomsGenes.get(k)) {
									clocksremainsunchanged=clocksremainsunchanged+"h"+ autoGS.vNomsGenes.get(k)+"'=="+ "h"+autoGS.vNomsGenes.get(k)+ " & ";
								}
							}
							if (clocksremainsunchanged.length()!=0) {
								clocksremainsunchanged=clocksremainsunchanged.substring(0, clocksremainsunchanged.length()-2);
								}
							//----------
							newFile.println("when " +"h" +autoGS.vNomsGenes.get(j)+"==dp"+autoGS.vNomsGenes.get(j) + " sync empty " + " do {"+ clocksremainsunchanged + "& h" + autoGS.vNomsGenes.get(j)+"'==0 }"+" goto loc_"+newEtat + ";"); 				
							if (paras.toLowerCase().contains("dp"+autoGS.vNomsGenes.get(j).toLowerCase())==false){
								paras=paras+"dp"+autoGS.vNomsGenes.get(j)+ ",";
							}
							}
						
						clocksremainsunchanged="";
						
						if (vClock.get(j)==-1) {
							//------- assigns clocks other than reset  the same value by Dr jamil
								for (int k = 0; k < vClock.size(); k++) {
									if (autoGS.vNomsGenes.get(j)!=autoGS.vNomsGenes.get(k)) {
									clocksremainsunchanged=clocksremainsunchanged +"h"+ autoGS.vNomsGenes.get(k)+"'==" + "h"+autoGS.vNomsGenes.get(k)+" & ";
								}
							}
								if (clocksremainsunchanged.length()!=0) {
									clocksremainsunchanged=clocksremainsunchanged.substring(0, clocksremainsunchanged.length()-2);
									}
							//----------
							newFile.println("when " +"h" +autoGS.vNomsGenes.get(j)+"==dn"+autoGS.vNomsGenes.get(j) + " sync empty " + " do {" + clocksremainsunchanged + "& h" + autoGS.vNomsGenes.get(j)+"'==0 }"+" goto loc_"+newEtat + ";"); 				
							if (paras.toLowerCase().contains("dp"+autoGS.vNomsGenes.get(j).toLowerCase())==false){
								paras=paras+"dn"+autoGS.vNomsGenes.get(j)+  ",";
							}	
						}
						clocksremainsunchanged="";
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
			newFile.println("reg_int.print;"); */
	
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			newFile.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
