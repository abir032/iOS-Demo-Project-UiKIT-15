//
//  ExpenseList.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 14/12/22.
//

import Foundation


struct ExpenseList{
    var itemName: String
    var date: String
    var itemPrice: Double
}
extension ExpenseList{
    static var expenseList = [ExpenseList(itemName: "Shopping", date: "2.0" , itemPrice: 2000.0),
        ExpenseList(itemName: "ElectricityBill", date: "2.0", itemPrice: 1500.0),
        ExpenseList(itemName: "Lunch", date: "2.0", itemPrice: 400),
        ExpenseList(itemName: "Dinner", date: "2.0", itemPrice: 200),
        ExpenseList(itemName: "TranspotationCost", date: "2.0", itemPrice: 50),
        ExpenseList(itemName: "Home Accessories", date: "2.0", itemPrice: 500)
        ]
}
