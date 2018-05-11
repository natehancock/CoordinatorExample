//
//  CEMainViewController.swift
//  CoordinatorExample
//
//  Created by Nathan Hancock on 5/10/18.
//  Copyright © 2018 NateHancock. All rights reserved.
//

import UIKit

protocol CEMainViewControllerDelegate {
    func mainViewControllerDidSelect(_ op: CEOperator, _ model: CEMainViewControllerModel)
    func didSelectModalButton()
}

class CEMainViewController: UIViewController {
    
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    

    var delegate: CEMainViewControllerDelegate!
    
    var model: CEMainViewControllerModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightLabel.text = String(model!.rightValue)
        leftLabel.text = String(model!.leftValue)
    }

    
    @IBAction func modalButton(sender: UIButton) {
        delegate.didSelectModalButton()
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
