//
//  ViewController.swift
//  JSON
//
//  Created by Максим Кулагин on 08.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    struct JokeAPI: Decodable {
        let category: String
        let type: String
        let setup: String
        let delivery: String
        let id: Int
    }
    
    @IBAction func buttonPressed() {
        fetchJokeAPI()
    }
}
// MARK: - Private Methods
extension ViewController {
    private func fetchJokeAPI() {
        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any?safe-mode") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let jokeAPI = try JSONDecoder().decode(JokeAPI.self, from: data)
                print(jokeAPI)
                print("Success. You can see the results in the Debug aria")
            } catch let error {
                print(error)
                print("Failed. You can see error in the Debug aria")
            }
            
        }.resume()
    }
}

