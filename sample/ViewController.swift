//
//  ViewController.swift
//  sample
//
//  Created by FeedMyTummy on 7/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = APIService() // I have ommitd the URL for your security. Go into APIService.swift and add it there.

        service.getData { response in
            
            switch response {
            case .success(let responses):
                print(responses)
            case .failure(let error):
                print("Error: \(error)")
            }
        }

    }
    
}

// Some resources for you
// https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types (Decoding. Including ustom names)
// https://www.swiftbysundell.com/basics/result/ (Result type and URLSession extension)
// https://stackoverflow.com/a/47688878 (Decoding arrays)

