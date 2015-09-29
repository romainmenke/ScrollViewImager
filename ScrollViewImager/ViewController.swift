//
//  ViewController.swift
//  ScrollViewImager
//
//  Created by Romain Menke on 29/09/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    var collectionView: UICollectionView!
    var cellsInSection : Int = 0
    var numberOfSections : Int = 0
    
    var screenshotView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let collWidth = self.view.bounds.size.width
        let cellWidth : CGFloat = 50 + 5
        
        cellsInSection = Int(collWidth / cellWidth)
        numberOfSections = Int(256 / cellsInSection)
        
        collectionView = UICollectionView(frame: CGRect(x: 0.0, y: 100, width: self.view.frame.width, height: self.view.frame.height - 100), collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.view.addSubview(collectionView)
        
        collectionView.reloadData()
        
    }
    @IBAction func captureScreenshot(sender: AnyObject) {
        
        if collectionView.superview == nil {
            self.view.addSubview(collectionView)
            self.screenshotView.removeFromSuperview()
        } else {
        
            self.screenshotView = UIImageView(frame: self.collectionView.frame)
            self.screenshotView.image = collectionView.mockUp()
            self.view.addSubview(self.screenshotView)
            collectionView.removeFromSuperview()
            
            self.collectionView.screenshot { (screenshot) -> Void in
                self.screenshotView.image = screenshot
                self.screenshotView.contentMode = UIViewContentMode.ScaleAspectFit
                
            }
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cellsInSection
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: 50, height: 50)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as? CollectionViewCell else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
            return cell
        }
        
        let cellNumber = indexPath.section * cellsInSection + indexPath.row + 1
        
        let blue : CGFloat = CGFloat(cellNumber) / 256
        
        cell.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: blue, alpha: 1.0)
        
        return cell
    }
    
}
