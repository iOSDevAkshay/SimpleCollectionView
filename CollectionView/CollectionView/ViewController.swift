//
//  ViewController.swift
//  CollectionView
//
//  Created by Akshay on 25/07/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viwCollection: UICollectionView!
    @IBOutlet weak var pgCtrl: UIPageControl!
    
    var thisWidth:CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        pgCtrl.numberOfPages = 15
        thisWidth = CGFloat(self.viwCollection.frame.width)
       
        pgCtrl.hidesForSinglePage = true

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - Collection view datasource and delegate methods
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
        
    }
    
    //this method is for the size of items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.viwCollection.frame.width
        let height = self.viwCollection.frame.height 
        return CGSize(width: width, height: height)
        
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = viwCollection.indexPathsForVisibleItems.first {
            pgCtrl.currentPage = indexPath.item
        }
    }
    
}

