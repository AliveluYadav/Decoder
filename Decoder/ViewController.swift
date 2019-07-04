//
//  ViewController.swift
//  Decoder
//
//  Created by Alivelu Ravula on 4/24/18.
//  Copyright © 2018 brn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var apps=[allApps]()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  
      @IBAction func btn(_ sender:Any)
      {
 let stbd=UIStoryboard(name: "Main", bundle: nil)
        
    let nvc=stbd.instantiateViewController(withIdentifier: "TopFreeVC") as! TopFreeVC
        self.navigationController?.pushViewController(nvc, animated: true)
            
            let url = URL(string: "https://rss.itunes.apple.com/api/v1/in/ios-apps/top-free/all/10/explicit.json")
            
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error==nil
              {
                    do{
                        self.apps = try JSONDecoder().decode([allApps].self, from:data!)
                        DispatchQueue.main.sync {
                            print(data!)

                        }
                        print(data)
                    }catch{

                        print("json error")
                    }
                    
                }
            }
    .resume()
    }
}

