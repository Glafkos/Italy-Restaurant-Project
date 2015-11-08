/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package databaseproject;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import javax.swing.Box;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author Glafkos Nikolaou
 */

public class Cashier extends javax.swing.JFrame {

    /**
     * Creates new form Cashier
     */
    public Cashier() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        orders = new javax.swing.JTable();
        welcome = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        bill = new javax.swing.JButton();

        jLabel1.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel1.setText("Orders");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        orders.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null},
                {null},
                {null},
                {null}
            },
            new String [] {
                "Orders"
            }
        ));
        jScrollPane1.setViewportView(orders);

        welcome.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N

        jLabel2.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        jLabel2.setText("Orders");

        bill.setText("BILL");
        bill.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                billActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 468, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(welcome, javax.swing.GroupLayout.PREFERRED_SIZE, 267, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(bill, javax.swing.GroupLayout.PREFERRED_SIZE, 122, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(0, 0, Short.MAX_VALUE))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(welcome, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 13, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(38, 38, 38)
                .addComponent(bill)
                .addGap(63, 63, 63))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void billActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_billActionPerformed

        JTextField Table_number_Field = new JTextField(10);
        
        JPanel myPanel = new JPanel();
        myPanel.add(new JLabel("Table Number:"));
        myPanel.add(Table_number_Field);
        myPanel.add(Box.createHorizontalStrut(15)); // a spacer
        
        int result = JOptionPane.showConfirmDialog(null, myPanel, 
               "Please Enter Table Number for get the BILL", JOptionPane.OK_CANCEL_OPTION);
        
              
       //JOptionPane.showConfirmDialog(rootPane, result, null, WIDTH, result, null);
        if (result == JOptionPane.OK_OPTION) 
        {
            int  table_number = Integer.parseInt(Table_number_Field.getText());
                        
            Connection conn = GUI.conn;
            StringBuffer output = new StringBuffer() ; 

            try
            {
                /* find order with table number and check out the bill */

                String g = ("select * from bill inner join orders ON orders.order_id = bill.order_id where orders.table_number = "+table_number+" AND orders.status = 'uncomplete'");
                
                /* show in one table and get the sum */
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(g);
                float bill = 0;
                float sum = 0;
                String name = null;
                int order_id=0;
                int counter = 0;
                int card_id = 0;
                
                while(rs.next()) 
                {
                    if (counter == 0)
                    {
                        order_id = rs.getInt("order_id");
                        card_id  = rs.getInt("card_id");
                        output.append("Order: "+order_id+"\n");
                        output.append("---------------------\n\n");
                        
                        if (card_id != 0)
                        {
                            output.append("Card id: "+card_id+"\n");
                            output.append("---------------------\n\n");
                        }
                    }
                    
                    bill = rs.getFloat("bill");
                    sum = rs.getFloat("bill") + sum;  
                    name = rs.getString("item");
                    output.append(" "+name + "  :  " + bill + " \n") ;
                    counter++;
                }
                output.append("---------------------\n");
                output.append("\n"+"SUM : " +"\t" + sum+ "\n");
                                
                //JOptionPane.showMessageDialog(null, output.toString());

                String q1=("UPDATE orders SET bill = (SELECT SUM(bill.bill) FROM bill WHERE order_id = "+order_id+") WHERE orders.order_id ="+order_id);              
                st.executeUpdate(q1);
                
                int res = JOptionPane.showOptionDialog(null, output,null ,JOptionPane.OK_CANCEL_OPTION, 
                JOptionPane.INFORMATION_MESSAGE, 
                null, 
                new String[]{"PAY", "Cancel"}, // this is the array
                "default");
                
                if (res == JOptionPane.OK_OPTION )
                {
                    /*set complete, set bonus, get bonus */
                    JOptionPane.showMessageDialog(null,"The bill for the table:"+table_number+" paid!\nBill: "+sum);
               
                    if (card_id!=0)
                    {
                        String query = ("UPDATE customers SET bonus = customers.bonus+(select bill from orders where card_id ="+card_id+" AND `status`='uncomplete' AND table_number = "+table_number+" )*10/100 where customers.id_bonus_card = "+card_id);
                        st.executeUpdate(query);
                        String bonus_query = ("Select customers.bonus from customers where customers.id_bonus_card = "+card_id );
                        rs = st.executeQuery (bonus_query);
                
                        int bonus = 0;
                
                        while(rs.next()) 
                        {
                            bonus = rs.getInt("bonus");
                        }
                              
                        JOptionPane.showMessageDialog(null, "Bonus for this customer:"+bonus);
                
                        if (bonus>=200)
                        {
                            JOptionPane.showMessageDialog(null, "You have 200 point!!!!!!\n\n Give to customer a voucher 20 euro!");
                            /* Set bonus bonus-200 */
                            int ipolipo = bonus - 200;
                            /* update bonus field */
                            String q2 = ("UPDATE customers SET bonus = ("+ipolipo+")where customers.id_bonus_card = "+card_id);
                            st.executeUpdate(q2);
                        } /*end if bonus >=200*/
                
                        /* check orders of this customer in this month */
                        Calendar now = Calendar.getInstance();
                        int current_year = now.get(Calendar.YEAR);                 
                        /* 
                        * month start from 0 to 11 
                        * (+1 and i have month from 1 to 12)
                        */
                        int  current_month = (now.get(Calendar.MONTH) + 1);
    
                        String q3 = ("SELECT COUNT(*) FROM orders WHERE orders.card_id = "+card_id+" AND (orders.date BETWEEN '"+current_year+"-"+current_month+"-01 00:00:00' AND '"+current_year+"-"+current_month+"-30 00:00:00')");
                        rs = st.executeQuery (q3);
                        int count = 0;
                
                        while(rs.next()) 
                        {
                            count = rs.getInt("COUNT(*)");
                        }
                
                        if (count % 10 == 0)
                        {
                            JOptionPane.showMessageDialog(null, "You have "+count+" orders in this month!!\n Thank you!! Give to customer a voucher 10 euro!");
                        }       
                    } /* end if card_id */
                  
                    /* set status of order = complete */
                    
                    String complete = ("UPDATE orders SET orders.status = 'complete' WHERE orders.order_id = "+order_id);              
                    st.executeUpdate(complete);
                    String query = ("SELECT * FROM orders WHERE status='uncomplete'");
                    showData.show(conn, orders, query);
               }/*end if press pay*/
            }/*end try*/
            
            catch (Exception ee) 
            {
                JOptionPane.showMessageDialog(null,ee);
            }
        }/*end result = ok*/   
    }//GEN-LAST:event_billActionPerformed

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
            java.util.logging.Logger.getLogger(Cashier.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Cashier.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Cashier.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Cashier.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Cashier().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton bill;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    public static javax.swing.JTable orders;
    public static javax.swing.JLabel welcome;
    // End of variables declaration//GEN-END:variables

}
