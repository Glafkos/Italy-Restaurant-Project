/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package databaseproject;
import javax.swing.UIManager.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Glafkos Nikolaou
 * project database for Italy Restaurant
 * 
 */


public class GUI extends javax.swing.JFrame 
{     
    /**
     * Creates new form GUI
     */
    public GUI() 
    {
        initComponents();
    }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    
    static Connection conn = null;
    static int id = 0;
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        login_button = new javax.swing.JButton();
        nametext = new javax.swing.JTextField();
        passtext = new javax.swing.JPasswordField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        jLabel1.setText("Name");

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        jLabel2.setText("Password");

        login_button.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        login_button.setText("log in");
        login_button.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                login_buttonActionPerformed(evt);
            }
        });

        nametext.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        nametext.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                nametextActionPerformed(evt);
            }
        });

        passtext.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        passtext.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                passtextActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(83, 83, 83)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(login_button, javax.swing.GroupLayout.PREFERRED_SIZE, 124, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, 94, Short.MAX_VALUE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(nametext, javax.swing.GroupLayout.DEFAULT_SIZE, 190, Short.MAX_VALUE)
                            .addComponent(passtext))))
                .addContainerGap(29, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(60, 60, 60)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(nametext, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(passtext, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(34, 34, 34)
                .addComponent(login_button)
                .addContainerGap(113, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void login_buttonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_login_buttonActionPerformed
        String name1 = null; 
        String pass = null;
        
        try
        {
            name1 = this.nametext.getText();
            pass = this.passtext.getText();
        }
        
        catch (Exception e)
        {
            JOptionPane.showMessageDialog(this, "Bad name" ,"Error" ,JOptionPane.ERROR_MESSAGE);
        }  
        
        /*Try log in*/ 
         try 
         {
            conn = DriverManager.getConnection("jdbc:mysql://localhost/italy_restaurant","root",null);
            System.out.println("Connection Succesfull");          
            
            String login;
            login = "SELECT * FROM employees WHERE (id ="+pass+ ") AND (name='"+name1+"')";
            id = Integer.parseInt(pass);
         
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(login);
           
            String name = null;
            String surname = null;
            String speciality = null;
            
            while(rs.next()) 
            {
               name = rs.getString("name");
               surname = rs.getString("surname");
               speciality = rs.getString("speciality");      
            }
            
            String wel = "Welcome "+name+" "+surname+"\n";
            CreateOrder f = new CreateOrder();
            CreateOrder.welcome.setText(wel);
            
            /* if speciality of this employee is Servitoros */
            if (speciality.equals("Servitoros"))
            {
               Servitoros Ser = new Servitoros();
               Ser.setVisible(true);
            }
           
            /* if speciality of this employee is Magiras */
            if (speciality.equals("Magiras"))
            {
                Mageiras mag = new Mageiras();
                Mageiras.welcome.setText("Welcome "+name);
                String query = ("SELECT * FROM orders WHERE orders.dishes_status = 'uncomplete' AND orders.status='uncomplete'");
                showData.show(conn, Mageiras.orders, query);
                mag.setVisible(true);
            }
           
                      
            /* if speciality of this employee is Tamio */
            if (speciality.equals("Tamio"))
            {        
               Cashier cash = new Cashier();
               Cashier.welcome.setText("Welcome "+name);
               String query = ("SELECT * FROM orders WHERE status='uncomplete'");
               showData.show(conn, Cashier.orders, query);
               cash.setVisible(true);  
            }
           
            this.setVisible(false);
                               
          }
          catch (SQLException ex) 
          {
              // handle any errors
              System.out.println("SQLException: " + ex.getMessage());
              System.out.println("SQLState: " + ex.getSQLState());
              System.out.println("VendorError: " + ex.getErrorCode());
           }  // TODO code application logic here
                 
    }//GEN-LAST:event_login_buttonActionPerformed

    private void passtextActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_passtextActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_passtextActionPerformed

    private void nametextActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_nametextActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_nametextActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new GUI().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JButton login_button;
    private javax.swing.JTextField nametext;
    private javax.swing.JPasswordField passtext;
    // End of variables declaration//GEN-END:variables
}
