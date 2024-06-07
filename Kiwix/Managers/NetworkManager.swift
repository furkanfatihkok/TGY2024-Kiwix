//
//  NetworkManager.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonParsingFailure
    case invalidUrl
    
    var errorMessage: String {
        switch self {
        case .requestFailed:
            return "Request failed. Please check your internet connection and try again."
        case .responseUnsuccessful:
            return "Server response was unsuccessful."
        case .invalidData:
            return "Invalid data received from the server."
        case .jsonParsingFailure:
            return "Failed to parse JSON data."
        case .invalidUrl:
            return "Invalid URL provided."
        }
    }
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Dictionary
    
    func fetchWord(for word: String, completion: @escaping (Result<[Word],APIError>) -> Void) {
        let urlString = "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            print(APIError.invalidUrl)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.requestFailed))
                print(APIError.requestFailed)
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                print(APIError.invalidData)
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode([Word].self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(.jsonParsingFailure))
                print(APIError.jsonParsingFailure)
            }
        }
        task.resume()
    }
    
    //MARK: - Synonym
    
    func fetchSynonym(for word: String, completion: @escaping (Result<[Synonym],APIError>) -> Void) {
        let urlString = "https://api.datamuse.com/words?rel_syn=\(word)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            print(APIError.invalidUrl)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.requestFailed))
                print(APIError.requestFailed)
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                print(APIError.invalidData)
                return
            }
            
            do {
                let synonym = try JSONDecoder().decode([Synonym].self, from: data)
                completion(.success(synonym))
            } catch {
                completion(.failure(.jsonParsingFailure))
                print(APIError.jsonParsingFailure)
            }
        }
        task.resume()
    }
}
