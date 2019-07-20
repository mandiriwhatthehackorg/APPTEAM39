//
//  BaseAssembly.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import Foundation
//import Swinject
//import SwinjectStoryboard
//
//public class BaseAssembly: Assembly {
//    
//    
//    public init() {
//        
//    }
//    
//    
//    public func assemble(container: Container) {
//        
//        container.register(BaseView.self) { _ in BaseViewController()}
//      
//       // container.register(LoginRouter.self) { _ in LoginWireframe()}
//        
//        container.register(BasePresenter.self) { r in BasePresenterImpl(view: r.resolve(BaseView.self)!, presenter: r.resolve(BasePresenter.self)!) }
//        
//        container.storyboardInitCompleted(BaseViewController.self) { r, c in
//            c.basePresenter = r.resolve(BasePresenter.self)
//        }
//       
//    }
//}
