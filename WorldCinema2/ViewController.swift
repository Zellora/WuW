//
//  ViewController.swift
//  WorldCinema2
//
//  Created by 35 кабинет on 30.11.2021.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputLogin: UITextField!
    
    @IBOutlet weak var inputPass: UITextField!
    let userDef = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Your token is:\(userDef.value(forKey: "token"))")
    }

    @IBAction func auth(_ sender: Any) {
        guard !inputLogin.text!.isEmpty else {
            return showAlertDialog(message: "Проверьте логин")
        }
        guard !inputPass.text!.isEmpty else {
            return showAlertDialog(message: "Проверьте пароль")
        }
        let url = "http://cinema.areas.su/auth/login=\(inputLogin.text!)&password\(inputPass.text!)"
        AF.request(url, method: .post).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let jsonToken = json["notice"]["token"].stringValue
                self.userDef.setValue(json, forKey: "token")
            case .failure(let error):
                self.showAlertDialog(message: error.localizedDescription)
            }
        }
    }
    
    
    func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

