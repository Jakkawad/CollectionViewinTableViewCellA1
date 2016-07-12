//
//  ViewController.swift
//  CollectionViewinTableViewCellA1
//
//  Created by admin on 7/12/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dataArray = ["A", "B", "C", "D", "E", "F", "G", "H"]
    var storedOffsets = [Int:CGFloat]()
    let model = generateRandomData()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return model.count
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell0")
        
        return cell!
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        guard let TableViewCell = cell as? TableViewCell else { return }
        
        TableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        TableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        guard let tableViewCell = cell as? TableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        //storedOffsets[indexPath.row] = TableViewCell.collectionViewOffset
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailSegue" {
            //print("DetailSegue")
            let destinationVC = segue.destinationViewController as! SecondViewController
            
            if let cell = sender as? CollectionViewCell {
                let indexPath = cell.tag
                //print(dataArray[indexPath])
                destinationVC.title = dataArray[indexPath]
            }
            
        } else {
            //print("ERROR")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return model[collectionView.tag].count
        return dataArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectCell0", forIndexPath: indexPath) as? CollectionViewCell
        //cell.backgroundColor = model[collectionView.tag][indexPath.item]
        cell!.lblName.text = dataArray[indexPath.row]
        cell?.tag = indexPath.row
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}