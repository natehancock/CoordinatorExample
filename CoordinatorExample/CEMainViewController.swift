//
//  CEMainViewController.swift
//  CoordinatorExample
//
//  Created by Nathan Hancock on 5/10/18.
//  Copyright © 2018 NateHancock. All rights reserved.
//

import UIKit

struct CEMainViewControllerModel {
    var leftValue: Int
    var rightValue: Int
}


enum CEOperator {

    case add
    case divide
    case subtract
    case multiply
    
    var description: String {
        switch self {
        case .add:
            return "+"
        case .divide:
            return "/"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        }
    }
}

protocol CEMainViewControllerDelegate {
    func mainViewControllerDidSelect(_ op: CEOperator, _ model: CEMainViewControllerModel)
}

class CEMainViewController: UIViewController {
    
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    

    var delegate: CEMainViewControllerDelegate!
    
    var model: CEMainViewControllerModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightLabel.text = String(model!.rightValue)
        leftLabel.text = String(model!.leftValue)
    }

    
    
    @IBAction func didSelectAdd(sender: UIButton) {
        delegate.mainViewControllerDidSelect(.add, model)
    }
    
    @IBAction func didSelectDivide(sender: UIButton) {
        delegate.mainViewControllerDidSelect(.divide, model)
    }
    
    @IBAction func didSelectSubtract(sender: UIButton) {
        delegate.mainViewControllerDidSelect(.subtract, model)
    }
    
    @IBAction func didSelectMultiply(sender: UIButton) {
        delegate.mainViewControllerDidSelect(.multiply, model)
    }
}
