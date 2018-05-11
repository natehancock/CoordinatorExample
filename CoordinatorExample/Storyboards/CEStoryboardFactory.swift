//
//  CEStoryboardFactory.swift
//  CoordinatorExample
//
//  Created by Nathan Hancock on 5/10/18.
//  Copyright © 2018 NateHancock. All rights reserved.
//

import Foundation
import UIKit


//Factory - Used for initializing View Controllers and handling dependencies
class CEStoryboardFactory {
    
    enum storyboardId: String {
        case main = "Main"
        case viewController = "ViewController"
        case modal = "Modal"
    }
    
    enum viewControllerId: String {
        case main = "CEMainViewController"
        case secondary = "CESecondaryViewController"
        case navigation = "CENavigationController"
        case modal = "CEModalViewController"
    }
    
    private func viewController(storyboardId: String, viewControllerId: String) -> UIViewController {
        return UIStoryboard.init(name: storyboardId, bundle: nil).instantiateViewController(withIdentifier: viewControllerId)
    }
    
    func navigationController() -> CENavigationController {
        let sb = UIStoryboard.init(name: storyboardId.main.rawValue, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: viewControllerId.navigation.rawValue) as! CENavigationController
        
        return vc
    }
    
    func CEMainViewController(model: CEMainViewControllerModel, coordinator: CECoordinator) -> CEMainViewController {
        
        let sb = UIStoryboard.init(name: storyboardId.main.rawValue, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: viewControllerId.main.rawValue) as! CEMainViewController
        
        //dependency injection
        vc.model = model
        
        //set Delegate
        vc.delegate = coordinator
        
        //return VC
        return vc
    }
    
    func CESecondaryViewController(model: CESecondaryModel, coordinator: CECoordinator) -> CESecondaryViewController {
        let sb = UIStoryboard.init(name: storyboardId.viewController.rawValue, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: viewControllerId.secondary.rawValue) as! CESecondaryViewController
        
        //dependency injection
        vc.model = model
        
        //set Delegate
        vc.delegate = coordinator
        
        //return VC
        return vc
    }
    
    func CEModalViewController() -> CEModalViewController {
        let modal = viewController(storyboardId: storyboardId.modal.rawValue, viewControllerId: viewControllerId.modal.rawValue) as! CEModalViewController
        
        return modal
    }
    
    
}
