//
//  CECoordinator.swift
//  CoordinatorExample
//
//  Created by Nathan Hancock on 5/10/18.
//  Copyright © 2018 NateHancock. All rights reserved.
//

import UIKit


class CECoordinator: NSObject {
    
    var navController: UINavigationController!

    private func presentSecondaryViewController(model: CESecondaryModel) {
        let secondaryViewController = CEStoryboardFactory.shared.CESecondaryViewController(model: model, coordinator: self)
        navController.pushViewController(secondaryViewController, animated: true)
    }
}

extension CECoordinator : CEMainViewControllerDelegate {
    
    func mainViewControllerDidSelect(_ op: CEOperator, _ model: CEMainViewControllerModel) {
        
        var secondaryModel = CESecondaryModel()
        secondaryModel.op = op
        secondaryModel.mainModel = model
        
        switch op {
        case .add:
            secondaryModel.result = model.leftValue + model.rightValue
        case .subtract:
            secondaryModel.result = model.leftValue - model.rightValue
        case .multiply:
            secondaryModel.result = model.leftValue * model.rightValue
        case .divide:
            secondaryModel.result = model.leftValue / model.rightValue
        }
        
        presentSecondaryViewController(model: secondaryModel)
    }
}


extension CECoordinator : CESecondaryViewControllerDelegate {
    
}
