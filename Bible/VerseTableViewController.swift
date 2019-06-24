//
//  VerseTableViewController.swift
//  Bible
//
//  Created by Sky on 6/23/19.
//  Copyright © 2019 OU. All rights reserved.
//

import UIKit

class VerseTableViewController: UITableViewController {

    @IBOutlet weak var verseContent: UILabel!
    var chapterId = -1
    var bookId = -1
    var verses: [Verse]?
    
    // MARK: - Table view data source

    @IBOutlet var VerseTitle: UITableView! {
        didSet {
            VerseTitle.delegate = self
            VerseTitle.dataSource = self
            if bookId != -1 {
                self.title = Bible.getBookById(bookId)?.fullName
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        verses = Bible.getChapterVerses(bookId: bookId, chapterId: chapterId)
        return verses!.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "verse") else { return UITableViewCell()}
        cell.textLabel?.text = String(indexPath.item + 1) + ":" +  verses.unsafelyUnwrapped[indexPath.item].text.trimmingCharacters(in: .whitespaces)
        return cell
        

        
        
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
