/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cell;

import java.awt.Component;
import javax.swing.DefaultCellEditor;
import javax.swing.JCheckBox;
import javax.swing.JTable;

/**
 *
 * @author ABDULLAH MUCHSIN
 */
public class TableCellEditor extends DefaultCellEditor{

    private tableActionEvent event;
    
    public TableCellEditor(tableActionEvent event) {
        super(new JCheckBox());
        this.event = event;
    }

    @Override
    public Component getTableCellEditorComponent(JTable table, Object value, boolean isSelected, int row, int column) {
        panelAction action = new panelAction();
        action.initEvent(event, row);
        action.setBackground(table.getSelectionBackground());
        return action;
    }
    
    
    
}
