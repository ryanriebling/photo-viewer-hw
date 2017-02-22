//
//  MyImageTableViewController.swift
//  PhotoViewer
//
//  Created by Ryan Riebling on 2/22/17.
//  Copyright © 2017 Ryan Riebling. All rights reserved.
//

import UIKit

class MyImageTableViewController: UIViewController {

    static let myImages = ["masterChef", "master_chief_chibi", "mastercheif_chibi2","Halo_Master_Chief_Blue", "8bitChief", "chiefCartoon"]
    static let myImageDescriptions = ["Master Chef loves to Cook!", "Master Chibi is determined", "Master Chibi is sad", "Master Chief is blue daba dee", "Cheif in 8bit" , "John 117 reporting for Duty"]

    @IBOutlet weak var myImageTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return MyImageTableViewController.myImages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyImageCell", for: indexPath) as! MyImageTableViewCell
        let myImageName = MyImageTableViewController.myImages[indexPath.row]
        let myImageDesc = MyImageTableViewController.myImageDescriptions[indexPath.row]
        cell.myImageTextView.text = myImageDesc
        cell.setCustomImage(image: UIImage(named: myImageName)!)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let myImageName = MyImageTableViewController.myImages[indexPath.row]
        let myImage = UIImage(named: myImageName)
        return myImage!.size.height
    }
}
