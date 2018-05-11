//
//  CECoordinator.swift
//  CoordinatorExample
//
//  Created by Nathan Hancock on 5/10/18.
//  Copyright © 2018 NateHancock. All rights reserved.
//

import UIKit


/**
    CECoordinator
 
    Purpose
    1. Keep track of the view heirarchy
    2. Manage changing view controllers
 
    Description - Conforms to a delegate from each View Controller.
 */

class CECoordinator: NSObject {
    
    var navController: UINavigationController!
    var storyboardFactory = CEStoryboardFactory()
    
    override init() {
        super.init()
        navController = storyboardFactory.navigationController()
        
        let model = CEMainViewControllerModel(leftValue: 30, rightValue: 20)
        let mainViewController = storyboardFactory.CEMainViewController(model: model, coordinator: self)
        
        //set view controller on Nav Controller to be the main landing page.
        navController.setViewControllers([mainViewController], animated: false)
    }

    private func presentSecondaryViewController(model: CESecondaryModel) {
        let secondaryViewController = storyboardFactory.CESecondaryViewController(model: model, coordinator: self)
        navController.pushViewController(secondaryViewController, animated: true)
    }
    
    private func presentModalViewController() {
        let modalVC = storyboardFactory.CEModalViewController()
        modalVC.modalPresentationStyle = .overCurrentContext
        navController.present(modalVC, animated: true, completion: nil)
    }
}


//MARK: - CEMainViewControllerDelegate
extension CECoordinator : CEMainViewControllerDelegate {
    
    func didSelectModalButton() {
        presentModalViewController()
    }
    
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

//MARK: - CESecondaryViewControllerDelegate
extension CECoordinator : CESecondaryViewControllerDelegate {
    func didSelectModal() {
        presentModalViewController()
    }
}
