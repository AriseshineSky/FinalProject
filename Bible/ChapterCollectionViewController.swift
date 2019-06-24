//
//  CollectionViewController.swift
//  Bible
//
//  Created by Sky on 6/23/19.
//  Copyright © 2019 OU. All rights reserved.
//

import UIKit

class ChapterCollectionViewController: UICollectionViewController{
    
    var bookId = -1
    var chapterId: Int?
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("c")
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print("5")
        print(bookId)
        if bookId != -1 {
            return  Bible.getBookById(bookId)!.chapters
        } else {
            return 0
        }
        
    }


    @IBOutlet var chapterCollectionView: UICollectionView! {
        didSet {
            chapterCollectionView.delegate = self
            chapterCollectionView.dataSource = self
            print("4")
            print(bookId)
            if bookId != -1 {
                self.title = Bible.getBookById(bookId)?.fullName
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    


    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("d")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookChapter", for: indexPath) as! Chapter
       
        cell.chapterNumber.text = String(indexPath.item + 1)
    
       
        // Configure the cell

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("e")
        performSegue(withIdentifier: "chapterToVerse", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bibleVerse = segue.destination as? VerseTableViewController, let indexPath = sender as? IndexPath {
            print("f")
            bibleVerse.bookId = bookId
            bibleVerse.chapterId = indexPath.item + 1
        }
    }
    
    


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
