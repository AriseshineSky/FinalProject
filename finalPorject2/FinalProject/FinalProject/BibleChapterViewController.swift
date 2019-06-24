//
//  ViewController.swift
//  FinalProject
//
//  Created by Mike Liu  on 6/11/19.
//  Copyright © 2019 Mike Liu. All rights reserved.
//

import UIKit

class BibleChapterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var bookId: Int?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Bible.getBookById(bookId!)!.chapters
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = chaptersCollectionView.dequeueReusableCell(withReuseIdentifier: "bibleChapterCell", for: indexPath)
        if let bibleChapterCell = cell as? BibleChapterCollectionViewCell {
            bibleChapterCell.bibleChapterId.text = String(indexPath.item + 1)
        }
        return cell
    }
    
    
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showVerses", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bibleVerseVC = segue.destination as? BibleVerseTableViewController, let indexPath = sender as? IndexPath {
            bibleVerseVC.bookId = bookId
            bibleVerseVC.chapterId = indexPath.item + 1
        }
    }
    
    
    
    @IBOutlet weak var chaptersCollectionView: UICollectionView! {
        didSet {
            chaptersCollectionView.delegate = self
            chaptersCollectionView.dataSource = self
            self.title = Bible.getBookById(bookId!)?.fullName
        }
    }
    
    func numberOfSections(in chaptersCollectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
}

