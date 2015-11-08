/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package databaseproject;

import javax.swing.UIManager;

/**
 *
 * @author Glafkos Nikolaou
 */

public class DatabaseProject 
{
    /**
     * @param args the command line arguments
     */
     public static void main(String[] args) 
     {
         try 
         { 
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel"); 
         } 
         catch (Exception ex) 
         { 
            ex.printStackTrace(); 
         }
         GUI form = new GUI();
         form.setVisible(true);         
     }
     //end main class
}
