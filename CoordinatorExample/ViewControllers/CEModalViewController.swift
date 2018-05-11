//
//  CEModalViewController.swift
//  CoordinatorExample
//
//  Created by Nathan Hancock on 5/10/18.
//  Copyright © 2018 NateHancock. All rights reserved.
//

import Foundation
import UIKit


class CEModalViewController: UIViewController {
    
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var fadeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        self.fadeView.addGestureRecognizer(tapGR)

    }
    
    
    @objc func didTapView() {
        dismiss(animated: true, completion: nil)
    }
    
}
