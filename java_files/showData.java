/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package databaseproject;
import java.sql.*;
import java.util.Vector;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Glafkos Nikolaou
 * 
 */

public class showData 
{
    public static void show(Connection conn,JTable table,String query)
    {
    	getData(conn,table,query);       
    }

    public static void getData(Connection conn,JTable table,String query)
    {
	try
        {            
            Statement state2 = conn.createStatement();
            ResultSet rs2 = state2.executeQuery(query);
            ResultSetMetaData rsmetadata2 = rs2.getMetaData();

            int columns2 = rsmetadata2.getColumnCount();

            DefaultTableModel dtm2 = new DefaultTableModel();
            @SuppressWarnings("rawtypes2")
            Vector columns_name2 = new Vector();
            @SuppressWarnings("rawtypes2")
            Vector data_rows2 = new Vector();

            for (int i=1; i<columns2+1; i++)
            {
                columns_name2.addElement(rsmetadata2.getColumnName(i));
            }
		
            dtm2.setColumnIdentifiers(columns_name2);
            
            while(rs2.next())
            {
		data_rows2 = new Vector();
		for (int j=1; j<columns2+1; j++)
		{
                    data_rows2.addElement(rs2.getString(j));
		}
		dtm2.addRow(data_rows2);
            }         
            table.setModel(dtm2);
	}
        catch (Exception ee) 
	{
            JOptionPane.showMessageDialog(null,ee);
	}
    }
}