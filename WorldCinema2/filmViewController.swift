//
//  filmViewController.swift
//  WorldCinema2
//
//  Created by 35 кабинет on 30.11.2021.
//

import UIKit
import SwiftyJSON
import Alamofire
class filmViewController: UIViewController{

 @IBOutlet weak var opis: UILabel!
    var film = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func show(_ sender: Any) {
        let url = "http://cinema.areas.su/movies/1\(film)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let film = json["description"].stringValue
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
                
                self.opis.text! = self.film
            }
            
           
           
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    
}
