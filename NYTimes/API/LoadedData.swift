//
//  LoadedData.swift
//  NYTimes
//
//  Created by Максим Нечеперунко on 11.02.2021.
//

import Foundation
import Alamofire

protocol SendDataProtocol{
    func sendData(data: PurpleData)
}

class LoadedData {
    var delegate: SendDataProtocol?
    
    
    func loadedEmailed(){
        AF.request("https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=pp8jGT1lcqvzmEos3MkmmwqPGYNNv8cC").responseJSON{response in
            guard let dataR = response.data else {return}
            let emailedData: PurpleData =  try! JSONDecoder().decode(PurpleData.self, from: dataR)
            self.delegate?.sendData(data: emailedData)
            
        }
    }
    
    func loadedShared(){
        AF.request("https://api.nytimes.com/svc/mostpopular/v2/shared/30/facebook.json?api-key=pp8jGT1lcqvzmEos3MkmmwqPGYNNv8cC").responseJSON{response in
            guard let dataR = response.data else {return}
            let sharedData: PurpleData =  try! JSONDecoder().decode(PurpleData.self, from: dataR)
            self.delegate?.sendData(data: sharedData)
        }
    }
    
    func loadedViewed(){
        AF.request("https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=pp8jGT1lcqvzmEos3MkmmwqPGYNNv8cC").responseJSON{response in
            guard let dataR = response.data else {return}
            let viewedData: PurpleData =  try! JSONDecoder().decode(PurpleData.self, from: dataR)
            self.delegate?.sendData(data: viewedData)
        }
    }
}


