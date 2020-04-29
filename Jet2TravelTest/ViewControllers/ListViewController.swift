//
//  ListViewController.swift
//  Jet2TravelTest
//
//  Created by Prerna Karvekar on 28/04/20.
//  Copyright © 2020 Prerna Chavan. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
    private var userModel = UserModel()
    private var entries = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tblView.register(UINib.init(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")

        
        userModel.downloadData { (isSuccess) in
            self.entries = self.userModel.loadData()
            DispatchQueue.main.async {
                self.tblView.reloadData()

            }
        }
        
    }
    

    // Tableview data source
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        configureCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290.0
    }
    
    func configureCell(cell: CustomCell, indexPath: IndexPath){
        
        let entry = entries[indexPath.row]
        
        cell.lblName.text = entry.userName
        cell.lblContent.text = entry.content
        cell.lblDesignation.text = entry.designation
        cell.lblLikes.text = entry.likes.shorted()
        cell.lblComments.text = entry.comments.shorted()
        cell.lblTime.text = entry.createdAt

        if entry.avatar?.count != 0 {
            setImageFromUrl(imageURL: entry.avatar!, imgView: cell.avatar)
        }
        if entry.articleImage?.count != 0 {
            setImageFromUrl(imageURL: entry.articleImage!, imgView: cell.media)
        }
    }
    
    func setImageFromUrl(imageURL :String, imgView: UIImageView) {
       URLSession.shared.dataTask( with: NSURL(string:imageURL)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                imgView.image = UIImage(data: data)
             }
          }
       }).resume()
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
