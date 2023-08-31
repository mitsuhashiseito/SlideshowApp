//
//  SlideCell.swift
//  SlideshowApp
//
//  Created by SeitoMitsuhashi on 2023/08/24.
//

import UIKit

class SlideCell: UICollectionViewCell {
    @IBOutlet weak var slideImage: UIImageView!
    var image: UIImage! {
        didSet {
          slideImage.image = image
        }
      }
}
