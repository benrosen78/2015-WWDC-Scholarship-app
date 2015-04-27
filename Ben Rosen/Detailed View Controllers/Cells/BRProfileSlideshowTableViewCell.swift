//
//  BRProfileSlideshowTableViewCell.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/26/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

let slideshowCollectionViewCellIdentifier = "Photo.Slideshow.Identifier"

class BRProfileSlideshowTableViewCell: BRHomeTableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {

    private var hasSize = false
    var pageControl = UIPageControl()
    
    var user: BRUser = BRUser() {
        didSet {
            pageControl.numberOfPages = user.userPictures.count
        }
    }
    
    var slideshowSize = CGSizeZero {
        didSet {
            if (!hasSize) {
                hasSize = true
                layoutCollectionView()
            }
        }
    }
    
    func layoutCollectionView() {

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = slideshowSize
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.pagingEnabled = true
        collectionView.registerClass(BRProfileSlideshowCollectionViewCell.self, forCellWithReuseIdentifier: slideshowCollectionViewCellIdentifier)
        collectionView.setTranslatesAutoresizingMaskIntoConstraints(false)
        collectionView.indicatorStyle = .Black
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        innerContentView.addSubview(collectionView)
        
        let collectionViewLeft = NSLayoutConstraint(item: collectionView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        let collectionViewRight = NSLayoutConstraint(item: collectionView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        let collectionViewTop = NSLayoutConstraint(item: collectionView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        let collectionViewBottom = NSLayoutConstraint(item: collectionView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        innerContentView.addConstraints([collectionViewLeft, collectionViewRight, collectionViewTop, collectionViewBottom])
        
        pageControl.userInteractionEnabled = false
        pageControl.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(pageControl)
        
        let pageControlCenterX = NSLayoutConstraint(item: pageControl, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let pageControlBottom = NSLayoutConstraint(item: pageControl, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -6.0)
        innerContentView.addConstraints([pageControlCenterX, pageControlBottom])
        
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.userPictures.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(slideshowCollectionViewCellIdentifier, forIndexPath: indexPath) as! BRProfileSlideshowCollectionViewCell
        cell.imageView.image = user.userPictures[indexPath.row]
        return cell
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let height = Int(slideshowSize.height)
        let offset = Int(scrollView.contentOffset.x)
        pageControl.currentPage = offset/height
    }

}
