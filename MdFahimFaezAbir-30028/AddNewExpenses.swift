//
//  AddNewExpenses.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 14/12/22.
//

import UIKit

class AddNewExpenses: UIViewController {
    var deligate: ViewController?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        //nameField.layer.masksToBounds = true
        nameField.layer.borderColor = UIColor.purple.cgColor
        nameField.layer.borderWidth = 1.0
        nameField.layer.cornerRadius = 15.0
        priceField.layer.borderColor = UIColor.purple.cgColor
        priceField.layer.borderWidth = 1.0
        priceField.layer.cornerRadius = 15.0
        //nameField.layer.borderColor = [[UIColor , red],CGColor]
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func updateField(_ sender: Any) {
        
        updateItem()
    }
    func updateItem(){
        if deligate?.insertUpdate == true{
            if let row = deligate?.setIndexpath?.row{
                ExpenseList.expenseList[row].itemName = nameField.text!
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let date = formatter.string(from: date.date)
                self.view.endEditing(true)
                ExpenseList.expenseList[row].date = String(date)
                if let price = priceField.text , let price = Double(price) {
                    ExpenseList.expenseList[row].itemPrice = price
                }
                deligate?.totalExpenses = 0
                deligate?.calculateTotalExpense()
                deligate?.tableView.reloadData()
                dismiss(animated: true)
                
            }
        }else{
            if let price = priceField.text , let price = Double(price){
                //deligate?.tableView.beginUpdates()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let date = formatter.string(from: date.date)
                self.view.endEditing(true)
                //ExpenseList.expenseList[indexPath.row].date = date
                ExpenseList.expenseList.insert(ExpenseList(itemName: nameField.text!, date: date, itemPrice: price), at: 0)
                deligate?.totalExpenses = 0
                
                deligate?.calculateTotalExpense()
                deligate?.tableView.reloadData()
                dismiss(animated: true)
            }
            
        }
    }
    
}
