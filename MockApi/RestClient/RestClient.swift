//
//  RestClient.swift
//  MockApi
//
//  Created by Hitesh  Agarwal on 15/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit
import SVProgressHUD

class RestClient: NSObject {

    func request(url: String, loader: Bool, completion: @escaping (Data?) -> ()) {
        
        guard let api = URL(string: url) else {
            completion(nil)
            return
        }
        
        #if MOCK
        let localData = dataFromFile(fileName: api.lastPathComponent)
        completion(localData)
        return 
        #endif
        if loader {
            SVProgressHUD.show()
        }
        URLSession.shared.dataTask(with: api) { (data, response, error) in
            if loader {
                SVProgressHUD.dismiss()
            }
            guard let dataResponse = response as? HTTPURLResponse else {
                completion(nil)
                return
            }
            
            if (200...204).contains(dataResponse.statusCode) {
                self.saveInFile(fileName: api.lastPathComponent, data: data)
                completion(data)
            } else {
                completion(data)
            }
        }.resume()
    }
    
    func saveInFile(fileName: String, data: Data?) {
        #if DEBUG
        if let dataValue = data {
            var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            path.appendPathComponent("\(fileName).txt")
            print("Path is: \(path.absoluteString)")
            do {
                //                    try dataValue.write(to: path)
                try dataValue.write(to: path, options: .atomicWrite)
            } catch let error {
                print(error)
            }
        }
        #endif
    }
    
    func dataFromFile(fileName: String) -> Data? {
        var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        path.appendPathComponent("\(fileName).txt")
        do {
            return try Data(contentsOf: path)
        } catch let error {
            print(error)
            return nil
        }
    }
}
