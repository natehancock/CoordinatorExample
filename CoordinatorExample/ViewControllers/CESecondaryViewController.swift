//
//  CESecondaryViewController.swift
//  CoordinatorExample
//
//  Created by Nathan Hancock on 5/10/18.
//  Copyright © 2018 NateHancock. All rights reserved.
//

import Foundation
import UIKit



protocol CESecondaryViewControllerDelegate {
    
}

class CESecondaryViewController: UIViewController {
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var opLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var delegate: CESecondaryViewControllerDelegate!
    var model: CESecondaryModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leftLabel.text = String(model!.mainModel.leftValue)
        rightLabel.text = String(model!.mainModel.rightValue)
        opLabel.text = String(model!.op.description)
        resultLabel.text = String(model!.result)
    }
    
    
    
}
