//
//  ViewModel.swift
//  JokesApi
//
//  Created by Hatice Taşdemir on 17.11.2024.
//

import Foundation
import Alamofire

class Jokes: ObservableObject {
    @Published var jokes : [Model] = []
    
    init(){
        self.fetchJokes()
    }
    
    func fetchJokes () {
        let url = "https://api.chucknorris.io/jokes/random/5"
        
        AF.request(url, method: .get).responseDecodable(of: [Model].self) { response in
            switch response.result {
            case.success(let fetchedJokes):
                DispatchQueue.main.async {
                    self.jokes = fetchedJokes
                }
            case .failure(let error):
                print("error\(error.localizedDescription)")
                
            }
            
        }
    }
        
        func updateJokes () {
            let url = "https://api.chucknorris.io/jokes/random/5"
            let parameters : [String: Any] = [
                "title" : "updated data",
                "body" : "put request test",
                "id" : 1 ]
            
            AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: [Model].self) { response in
                switch response.result {
                case .success(let updatedJokes):
                    DispatchQueue.main.async {
                        self.jokes = updatedJokes
                    }
                case .failure(let error):
                    print("error\(error.localizedDescription)")
                }
                
            }
            
        }
        func sendJokes () {
            let url = "https://api.chucknorris.io/jokes/random/5"
            let parameters : [String: Any] = [
                "title" : "data sent",
                "body" : "post request run",
                "id" : 1]
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: [Model].self) { response in
                switch response.result {
                case .success(let sentJokes):
                    DispatchQueue.main.async {
                        self.jokes += sentJokes
                    }
                case .failure(let error):
                    print("error\(error.localizedDescription)")
                    
                }
            }
        
        
    }
    func deleteJokes() {
        let url = "https://api.chucknorris.io/jokes/random/5"
        AF.request(url, method: .delete).responseDecodable(of: [Model].self) { response in
            switch response.result{
            case .success(let deletedJokes):
                DispatchQueue.main.async {
                    self.jokes = deletedJokes
                }
                case .failure(let error):
                    print("error\(error.localizedDescription)")
                }
            
        }
    }
    
}
