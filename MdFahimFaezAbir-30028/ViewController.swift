//
//  ViewController.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 14/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var setIndexpath: IndexPath?
    var insertUpdate: Bool?
    var totalExpenses: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let headerNib = UINib(nibName:Constants.headerNib, bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: Constants.headerNib)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItem"{
            if let editView = segue.destination as? AddNewExpenses{
                editView.deligate = self
                insertUpdate = false
            }
        }
        if segue.identifier == "editItem"{
            if let editView = segue.destination as? AddNewExpenses{
                editView.deligate = self
                insertUpdate = true
                
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExpenseList.expenseList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.expenseCell, for: indexPath) as! ItemViewCell
        cell.nameOfTheItem.text = ExpenseList.expenseList[indexPath.row].itemName
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //        _ = formatter.string(from: Date())
        //ExpenseList.expenseList[indexPath.row].date = date
        cell.date.text = ExpenseList.expenseList[indexPath.row].date
       
    cell.itemPrice.text = String(ExpenseList.expenseList[indexPath.row].itemPrice)
        //cell.self.layer.cornerRadius = 1.0
        
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.headerNib) as! tableViewHeader
        
        calculateTotalExpense()
        
        header.totalExpense.text = String(totalExpenses)
        
        return header
    }
    func calculateTotalExpense(){
        totalExpenses = 0
        for i in  0..<ExpenseList.expenseList.count{
            totalExpenses += ExpenseList.expenseList[i].itemPrice
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil){[weak self]_,_,_ in
            guard let self = self else {return}
            self.performDeleteAction(indexPath: indexPath)
        }
        deleteAction.image = UIImage(systemName: "trash")
        let swipAction = UISwipeActionsConfiguration(actions: [deleteAction])
        swipAction.performsFirstActionWithFullSwipe = true
        return swipAction
    }
    func performDeleteAction(indexPath:IndexPath){
        //tableView.beginUpdates()
        totalExpenses = 0
        ExpenseList.expenseList.remove(at: indexPath.row)
        calculateTotalExpense()
        tableView.deleteRows(at: [indexPath], with: .top)
        //tableView.endUpdates()
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: nil){ [weak self]_,_,_ in
            guard let self = self else {return}
            self.setIndexpath = indexPath
            self.insertOperation(indexPath: indexPath)
        }
        editAction.image = UIImage(systemName: "pencil.circle.fill")
        editAction.backgroundColor = .systemGreen
        let leadSwipAction = UISwipeActionsConfiguration(actions: [editAction])
        
        return leadSwipAction
    }
    func insertOperation(indexPath: IndexPath){
        performSegue(withIdentifier: "editItem", sender: self)
    }
    
    
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
