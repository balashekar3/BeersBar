//
//  BeersViewModel.swift
//  BeersBar
//
//  Created by Balashekar Vemula on 19/02/24.
//

import Foundation

final class BeersViewModel {
    
    private let apiProtocol:APIManagerProtocol
    var eventHandler:((_ event:CallBackEvent) -> Void)?
    var modelResponse:[BeersModel]?
    
    init(apiProtocol: APIManagerProtocol = APIManager()) {
        self.apiProtocol = apiProtocol
    }
    
    func getListForBeers(){
        self.eventHandler?(.loading)
        Task{
            let result = await apiProtocol.getDecodaleDataAsync(from: APIEndpoints.getBeers, with: [BeersModel].self)
            self.eventHandler?(.stopLoading)
            switch result {
            case .success(let response):
                modelResponse = response
                self.eventHandler?(.dataLoded)
            case .failure(let error):
                debugPrint("viewmodel error:\(error.localizedDescription)")
                self.eventHandler?(.error(error))
            }
        }
        
    }
    
}

extension BeersViewModel{
    
}
