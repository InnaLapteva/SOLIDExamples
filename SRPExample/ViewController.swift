//
//  ViewController.swift
//  SRPExample
//
//  Created by Инна Лаптева on 01.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // var networkManager = NetworkService()
    var fetchMyData = FetchMyData()
   // var networkDataFetcher = NetworkDataFetcher()
    let dataManger = DataStoregeManager()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        fetchMyData.fetchApps { (apps) in
            print(apps?.feed.results.first)
        }
        fetchMyData.fetchiPadApps { (apps) in
            print(apps?.feed.results.first)
        }
        fetchMyData.fetchCountries { (countries) in
            print(countries?.first)
        }
    }
    
    @IBAction func changeLabel(_ sender: Any) {
        label.text = textField.text
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        changeName()
    }
    
    //MARK: - User Interface
    
    private func setUpView() {
        button.layer.cornerRadius = button.frame.height / 2
        label.text = ""
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "Name is empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Busness logic
    
    private func changeName() {
        guard let name = textField.text, name != "" else {
            showAlert()
            return
        }
        dataManger.savenameInCache(name: name)
    }
    
    
}

