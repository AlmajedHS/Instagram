//
//  MainViewController.swift
//  Instgram
//
//  Created by Hussain Almajed on 2/4/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import UIKit
import Parse

class MainViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl: UIRefreshControl!
    var posts: [Post] = []
    
    
    
    @IBAction func logoutButton(_ sender: UIButton) {
        PFUser.logOutInBackground { (error: Error?) in
            if error == nil {
                NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)

            } else {
                // Display error
            }
        }
    }
    
    @IBAction func postButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("goPost"), object: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        getPosts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(getPosts), for: .valueChanged)
        self.tableView.addSubview(refreshControl)
       // getPosts()
        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func getPosts() {
        Post.getPosts(success: { (posts: [Post]) in
            self.posts = posts
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }) { (error: Error?) in
            print("error: \(error?.localizedDescription)")
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
        let post = posts[indexPath.row]
//
        if let user = posts[indexPath.row]["user"] {
            cell.userLabel.text = (user as! PFUser).username
        } else {
            cell.userLabel.text = "Anonymous User"
        }
        cell.post = post
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! PostDetailsViewController
        
        vc.photoI = (sender! as! PostCell).postImage.image
        vc.stringPassed = (sender! as! PostCell).captionLabel.text!
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
