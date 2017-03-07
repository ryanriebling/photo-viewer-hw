//
//  MyImageTableViewController.swift
//  PhotoViewer
//
//  Created by Ryan Riebling on 2/22/17.
//  Copyright © 2017 Ryan Riebling. All rights reserved.
//

import UIKit
import ImagesFramework

class MyImageTableViewController: UIViewController {

//    static let myImages = ["masterChef", "master_chief_chibi", "mastercheif_chibi2","Halo_Master_Chief_Blue", "8bitChief", "chiefCartoon"]
    static let myImageDescriptions = ["Master Chef loves to Cook!", "Master Chibi is determined", "Master Chibi is sad", "Master Chief is blue daba dee", "Cheif in 8bit" , "John 117 reporting for Duty"]

    @IBOutlet weak var myImageTableView: UITableView!

    var imageManager: ImageManager!
    var myImages: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageManager = ImageManager()
        myImages = imageManager.getAllImageNames()
        print("Found images from manager \(myImages)")
        myImageTableView.delegate = self
        myImageTableView.dataSource = self
        myImageTableView.rowHeight = UITableViewAutomaticDimension
        myImageTableView.estimatedRowHeight = 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MyImageTableViewController : UITableViewDelegate, UITableViewDataSource {

    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myImages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyImageCell", for: indexPath) as! MyImageTableViewCell
        let myImageName = myImages[indexPath.row]
        let myImageDesc = MyImageTableViewController.myImageDescriptions[indexPath.row]
        cell.myImageTextView.text = myImageDesc
        var myImage: UIImage?
        let myClosure = { (image: UIImage?) -> () in
            print("Setting myImage \(myImage) to input image \(image)")
            myImage = image!
        }
        imageManager.getImage(name: myImageName, imageClosure: myClosure)
        cell.setCustomImage(image: myImage!)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let myImageName = myImages[indexPath.row]
        var myImage: UIImage?
        let myClosure = { (image: UIImage?) -> () in
            myImage = image!
        }
        imageManager.getImage(name: myImageName, imageClosure: myClosure)
        return myImage!.size.height
    }


}
