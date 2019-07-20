//
//  BasePresenterImpl.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import Foundation
import RxSwift
protocol BasePresenter {
    func attachedView(_ view: BaseView)
    func getTokenJwt()
}

class BasePresenterImpl {
    var view: BaseView
    var presenter: BasePresenter
    
    init(view: BaseView, presenter: BasePresenter) {
        self.view = view
        self.presenter = presenter
    }
    
    let disposeBag = DisposeBag()
    let tokenService = TokenService()
}

extension BasePresenterImpl: BasePresenter {
   
    func attachedView(_ view: BaseView) {
        self.view = view
        self.getTokenJwt()
    }
}

extension BasePresenterImpl {
    func getTokenJwt() {
        tokenService.getTokenJwt().subscribe(onNext: { [weak self] response in
            guard let _ = self else { return }
            guard let jwt = response.jwt else { return }
            Preference.saveString(key: BasePref.JWT, value: jwt)
            }, onError: { [weak self] error in
                guard let _ = self else { return }
        }).disposed(by: disposeBag)
    }
}
