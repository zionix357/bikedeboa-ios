//
//  ViewController.swift
//  bikedeboa
//
//  Created by Arthur Rocha on 28/01/17.
//  Copyright © 2017 Arthur Rocha. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var bdbMapView: MKMapView!
    @IBOutlet weak var bdbTableView: UITableView!
    @IBOutlet weak var bdbSearchTextField: UITextField!
    @IBOutlet weak var bdbContainerView: UIView!
    @IBOutlet weak var bdbHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var bdbLoadingActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var bdbAddButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bdbSearchTextField.delegate = self
        bdbSearchTextField.addTarget(self, action: #selector(didChangeText(textField:)), for: .editingChanged)
        
        bdbMapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard)))
        
        bdbContainerView.layer.shadowColor = UIColor.black.cgColor
        bdbContainerView.layer.shadowOpacity = 0.8;
        bdbContainerView.layer.shadowRadius = 2;
        bdbContainerView.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        bdbTableView.layer.cornerRadius = 3
        bdbContainerView.layer.cornerRadius = 3
        
        bdbAddButton.layer.cornerRadius = 24
        
        bdbAddButton.layer.shadowColor = UIColor.black.cgColor
        bdbAddButton.layer.shadowOpacity = 0.8;
        bdbAddButton.layer.shadowRadius = 2;
        bdbAddButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyBoard(){
        bdbSearchTextField.resignFirstResponder()
    }
    
    func didChangeText(textField : UITextField){
        if (textField.text?.characters.count)! > 0{
            bdbLoadingActivityIndicatorView.startAnimating()
            bdbLoadingActivityIndicatorView.isHidden = false
            switch (textField.text?.characters.count)! {
            case 1:
                bdbHeightLayoutConstraint.constant = 45
                break
            case 2:
                bdbHeightLayoutConstraint.constant = 90
                break
            case 3:
                bdbHeightLayoutConstraint.constant = 135
                break
            case 4:
                bdbHeightLayoutConstraint.constant = 180
            default:
                break
            }
            bdbTableView.isHidden = false
        }else{
            bdbTableView.isHidden = true
            bdbLoadingActivityIndicatorView.stopAnimating()
            bdbLoadingActivityIndicatorView.isHidden = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bdbContainerView.layer.borderWidth = 1
        bdbContainerView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bdbContainerView.layer.borderWidth = 0
        bdbContainerView.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func handleAdd(_ sender: Any) {
        bdbSearchTextField.text = "Rua Capitão Balduino, 393 - Torres/RS"
        bdbTableView.isHidden = true
        bdbLoadingActivityIndicatorView.stopAnimating()
        bdbLoadingActivityIndicatorView.isHidden = true
        
    }
    
}

