//
//  UIImageConversion.swift
//  SedinTechTask
//
//  Created by Navin Kumar R on 05/10/23.
//

import UIKit

func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(nil)
            return
        }
        
        guard let data = data, let image = UIImage(data: data) else {
            completion(nil)
            return
        }
        
        completion(image)
    }.resume()
}


