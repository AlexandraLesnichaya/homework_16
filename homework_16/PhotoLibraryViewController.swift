//
//  ViewController.swift
//  homework_16
//
//  Created by Александра Лесничая on 3/5/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

class PhotoLibraryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var imageInfo: [Image] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    @IBAction func addButtonDidClick(_ sender: Any) {
        guard let addImageViewController = AddImageViewController.createFromMainStoryboard() else { return }

        addImageViewController.addImage = { imageForArray in
            self.imageInfo.append(imageForArray)
            self.tableView.reloadData()
        }

        navigationController?.pushViewController(addImageViewController, animated: true)
    }



}


extension PhotoLibraryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return imageInfo.count
          }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PLTableViewCell") as! PLTableViewCell
        let imageAndLabel = imageInfo[indexPath.row]
        cell.photoLibraryImage.image = imageAndLabel.imagePicture.image
        cell.photoLibraryLabel.text = imageAndLabel.imageName
        return cell
    }
}
    
      


