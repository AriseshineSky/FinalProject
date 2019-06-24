//
//  ViewController.swift
//  Bible
//
//  Created by Sky on 6/14/19.
//  Copyright © 2019 OU. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        tableView.selectRow(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.top)
//    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        
        if section == 0 {
            return "新约"
        } else {
            return "旧约"
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Bible.oldtestamentBooks
        } else {
            return Bible.newtestamentBooks
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("3")
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
    
            cell.textLabel?.text = Bible.getBookById(indexPath.item + 1)?.fullName
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
            cell.textLabel?.text = Bible.getBookById(indexPath.item + 1 + Bible.oldtestamentBooks)?.fullName
            return cell
        }

    }
    
    override func tableView(_ tableView: UITableView,  didSelectRowAt indexPath: IndexPath) {
        print("b")
        performSegue(withIdentifier: "chapters" , sender: indexPath)
        print("2")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
 
        if let chapterContent = segue.destination as? ChapterCollectionViewController ,let indexPath = sender as? IndexPath {

            chapterContent.bookId = indexPath.section == 0 ? indexPath.item + 1 : indexPath.item + 1 + Bible.oldtestamentBooks
            print("a")
            print(chapterContent.bookId)
            print("1")
        }
    

    }
    
//    func shouldPerformSegueWithIdentifier(identifier: String ,sender: AnyObject?) -> Bool {
//
//        return !(identifier == "chapters")
//
//    }
//
    
    
    
    
    
}


