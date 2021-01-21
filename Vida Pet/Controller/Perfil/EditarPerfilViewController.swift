//
//  EditarPerfilViewController.swift
//  Vida Pet
//
//  Created by Toki on 03/11/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import UIKit
import SCLAlertView

class EditarPerfilViewController: VidaPetMainViewController {
    
    // MARK: - Properties
    
    final let numberOfComponents = 1
    var selectedState: String?
 
    
    var bioUser: String?
    var isPublicProfile: Bool = false
    var image: String?
    var name: String?
    var state: String?
    
    
    var userModel = UserModel()
    var userData : UserData?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var estadoTextField: UITextField!
    @IBOutlet weak var bio: VPMultilineRoundPlaceholderTextField!
    
    
    // MARK: - IBActions
    
    @IBAction func perfilPublico(_ sender: UISwitch) {
        if (sender.isOn == true){
             isPublicProfile = true
          }
          else{
            isPublicProfile = false
          }
    }
    
    
    @IBAction func imagePressed(_ sender: UIButton) {
        selectImage()
  
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        userImage.setupImage(image: userImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = R.color.vidaPetBlue()
        saveButton()
        configureTapGesture()
        self.createAndSetupPickerView()
        self.dismissAndClosePickerView()
        setupFields()
    }
    
    // MARK: - Networking
    
    func pathUser(_ user: UserData) {
        
        self.loadingIndicator(.start)
       
        APIHelper.request(url: .user, method: .patch, parameters: getParamsToApi(from: user))
            .responseJSON { response in
                
                switch response.result {
                case .success:
                    if let error = response.error {
                        
                        self.displayError(error.localizedDescription, withTryAgain: { self.pathUser(user) })
                       
                    } else {
                        print("pach com sucesso")
                        _ = self.navigationController?.popViewController(animated: true)
                        
                        
                       
                    }
                case .failure(let error):
                    self.displayError(error.localizedDescription, withTryAgain: { self.pathUser(user) })
                }
            }
    }
    
    private func getParamsToApi(from user: UserData) -> [String: Any] {
        
        let finalUser: [String: Any] = [
            
            "name" : userData?.name as Any,
            "image" : userData?.image as Any,
            "bio" : userData?.bio as Any,
            "isPublicProfile" : userData?.isPublicProfile as Any,
            "state" : userData?.state as Any,
            "uid" : userData?.uid as Any,
            "id" : userData?.id as Any ]
        return finalUser
    }
    
    // MARK: - Navigation
    
    func saveButton(){
        
     
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: R.string.editarPerfil.bar_button_title(), style: .done, target: self, action: #selector(rightHandAction))
    }
    
    
    @objc func rightHandAction() {
        updateProfile()
        
    }
    
    
    
    
    // MARK: - Methods
    func updateProfile(){
        
        bioUser = bio.text
        name = userNameTextField.text
        var mockUid = "bEtKiiOCYvcEyGMIcE5jmEIAa8b2"
        if let _bio = bioUser, let _state = state, let _name = name{
            
            userData = UserData(uid: mockUid , id: 11, bio: _bio, isPublicProfile: isPublicProfile ?? false, image: "", name: _name, state: _state)}

        if let _userData = userData {
            pathUser(_userData)
        saveButton()
        }}
    
    
    private func configureTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    
    func setupFields(){
        self.userNameTextField.text = name
        self.estadoTextField.text = state
        self.bio.text = bioUser
    }
    
    
    private func selectImage(){
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false
        )
        let alertView = SCLAlertView(appearance: appearance)
        alertView.addButton(R.string.editarPerfil.image_option_camera(), action: {
            self.imageFromCamera()
        })
        alertView.addButton(R.string.editarPerfil.image_option_galery(), action: {
            self.imageFromGalery()
        })
        alertView.addButton(R.string.editarPerfil.cancel(), action: {})
        alertView.showInfo(R.string.editarPerfil.image_title(), subTitle: "", colorStyle: UInt(self.colorStyle))
    }
    
    private func imageFromCamera() {
        let myPickerControllerCamera = UIImagePickerController()
        myPickerControllerCamera.delegate = self
        myPickerControllerCamera.sourceType = UIImagePickerController.SourceType.camera
        myPickerControllerCamera.allowsEditing = true
        self.present(myPickerControllerCamera, animated: true, completion: nil)
    }
    
    private func imageFromGalery() {
        let myPickerControllerGallery = UIImagePickerController()
        myPickerControllerGallery.delegate = self
        myPickerControllerGallery.sourceType = UIImagePickerController.SourceType.photoLibrary
        myPickerControllerGallery.allowsEditing = true
        self.present(myPickerControllerGallery, animated: true, completion: nil)
    }
    
    
    func createAndSetupPickerView() {
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        self.estadoTextField.inputView = pickerView
    }
    
    
    func dismissAndClosePickerView() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: R.string.editarPerfil.picker_state(), style: .plain, target: self, action: #selector(self.dismissAction))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        self.estadoTextField.inputAccessoryView = toolBar
    }
    
    
    @objc func dismissAction(){
        self.view.endEditing(true)
    }
    
}


//MARK: - Image Picker

extension EditarPerfilViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            userImage.image = pickedImage
            print(userImage.image)
        }
        picker.dismiss(animated: true, completion: nil)
    }
}


//MARK: - Picker View

extension EditarPerfilViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfComponents
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userModel.stateArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return userModel.stateArray[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        estadoTextField.text = userModel.stateArray[row]
       state = estadoTextField.text
    }
}
