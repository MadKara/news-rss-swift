//
//  ApiRequest.swift
//  TestTask
//
//  Created by Ihor Karalash on 22.03.2021.
//

import Foundation

struct ApiService{
    let resourceURL: URL
    let API_KEY = "04c48f56a9d04c32b7b0d14416597f0c"
    
    init(){
        let resourceString = "https://newsapi.org/v2/everything?q=tesla&from=2021-02-24&sortBy=publishedAt&apiKey=\(API_KEY)"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getNews(completion: @escaping(Result<[Article], Error>) -> Void){
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, error in
            guard let data = data, error == nil else {
                //TODO: throw an exeption
                //completion(.failure(error))
                return
            }
            
            do{
                let newsResponse = try JSONDecoder().decode(Response.self, from: data)
                let articles = newsResponse.articles
                print(articles.count)
                completion(.success(articles))
            }catch{
                print(error)
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
}
