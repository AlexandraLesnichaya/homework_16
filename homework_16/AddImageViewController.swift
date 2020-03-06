//
//  AddImageViewController.swift
//  homework_16
//
//  Created by Александра Лесничая on 3/6/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class AddImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageNameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!

     var addImage: ((Image) -> Void)?

    let pickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
    }

    @IBAction func chooseImageButtonDidClick(_ sender: Any) {

        let alertController = UIAlertController(title: "Which picture to upload?",
                                                message: nil,
                                                preferredStyle: .actionSheet)

        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            #if targetEnvironment(simulator)
            return
            #endif
            self.pickerController.allowsEditing = true
            self.pickerController.sourceType = .camera
            self.present(self.pickerController, animated: true, completion: nil)
        }))

        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
            self.pickerController.allowsEditing = true
            self.pickerController.sourceType = .photoLibrary
            self.present(self.pickerController, animated: true, completion: nil)
        }))


        present(alertController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[.editedImage] as? UIImage {
            imageView.image = image
        }

        pickerController.dismiss(animated: true, completion: nil)
    }


        @IBAction func addButtonDidClick(_ sender: Any) {
            let imageName = imageNameTextField.text!
            let imagePicture = imageView.image
            let imageForArray = Image(imageName: imageName, imagePicture: UIImageView(image: imagePicture!))
            addImage?(imageForArray)
            navigationController?.popViewController(animated: true)
        }



}
    
    


