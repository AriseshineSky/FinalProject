//
//  BibleBookTableViewController.swift
//  FinalProject
//
//  Created by Mike Liu  on 6/13/19.
//  Copyright © 2019 Mike Liu. All rights reserved.
//

import UIKit

class BibleBookTableViewController: UITableViewController {

    enum bookType: String {
        case oldTestament = "旧约"
        case newTestament = "新约"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.selectRow(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.top)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? bookType.oldTestament.rawValue : bookType.newTestament.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? Bible.oldtestamentBooks : Bible.newtestamentBooks
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BibleBookNameCell", for: indexPath)
        
        let title = indexPath.section == 0 ? Bible.getBookById(indexPath.item + 1)?.fullName : Bible.getBookById(indexPath.item + 1 + Bible.oldtestamentBooks)?.fullName
        cell.textLabel?.text = title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showChapters", sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bibleChapterVC = segue.destination as? BibleChapterViewController, let indexPath = sender as? IndexPath{
            bibleChapterVC.bookId = indexPath.section == 0 ? indexPath.item + 1 : indexPath.item + 1 + Bible.oldtestamentBooks
        }
    }
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
