//
//  CollectionViewCell.swift
//  ScrollViewImager
//
//  Created by Romain Menke on 29/09/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {

    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}