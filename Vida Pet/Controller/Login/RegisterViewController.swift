//
//  RegisterViewController.swift
//  Vida Pet
//
//  Created by João Pedro Giarrante on 15/10/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import UIKit

// MARK: - VidaPetMainViewController

class RegisterViewController: VidaPetMainViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    
    // MARK: Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        errorLabel.text = ""
        
        configureTapGesture()
        configureTextFields()
    }
    
    
    // MARK: Setup
    
    private func configureTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    private func configureTextFields(){
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
    }

    
    // MARK: IBActions
    
    @IBAction func registerPressed(_ sender: Any) {
        let error = ValidateFields.validateFieldsRegister(name: nameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", confirmPassword: confirmPasswordTextField.text ?? "")
        
        if error != nil {
            showError(message: error!)
        } else {
            self.performSegue(withIdentifier: "RegisterWelcomeVC", sender: self)
        }
    }
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "RegisterWelcomeVC"{
            _ = segue.destination
        }
    }
    
    
    // MARK: Alerts
    
    func showError( message: String){
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
}


// MARK: UITextFieldDelegate

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case self.nameTextField:
            self.emailTextField.becomeFirstResponder()
        case self.emailTextField:
            self.passwordTextField.becomeFirstResponder()
        case self.passwordTextField:
            self.confirmPasswordTextField.becomeFirstResponder()
        default:
            self.confirmPasswordTextField.resignFirstResponder()
        }
        return true
    }
}
    

