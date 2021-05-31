//
//  ViewController.swift
//  denemeGit
//
//  Created by Ekrem Özkaraca on 12.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var indicatorView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var firstPopUp: XibView!
    @IBOutlet var secondPopUp: XibView!
    
    var timer : Timer!
    
    private let noOfCards = 10
    
    private var currentSelectedIndex = 0 {
        didSet {
            updateSelectedCardIndicator()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.collectionViewLayout = CardsCollectionFlowLayout()
    }
    
    func deneme() {
        //scroll position
        UIView.animate(withDuration: 1, animations: { [self] in
            firstPopUp.isHidden = false
            if let customPopUpView = self.firstPopUp.contentView as? FirstView {
                customPopUpView.awakeFromNib()
                
                let nextSelectedCell = collectionView.cellForItem(at: IndexPath(index: currentSelectedIndex)) as? CollectionViewCell
                nextSelectedCell?.cellImageView.frame = customPopUpView.firstImage.frame
                
                let deviceWidth = UIScreen.main.bounds.width / customPopUpView.firstImage.bounds.width
                let deviceHeight = UIScreen.main.bounds.height / customPopUpView.firstImage.bounds.height
                customPopUpView.firstImage.transform = CGAffineTransform(scaleX: deviceWidth, y: deviceHeight)
            }
           
        }) { [self]_ in
            var transform = CATransform3DIdentity
            transform.m34 = -0.0005
            let animation = CABasicAnimation(keyPath: "transform")
            animation.fromValue = CATransform3DRotate(transform, 0, 0, 1, 0)
            animation.toValue = CATransform3DRotate(transform, CGFloat(120 * Double.pi / 180.0), 0, -1, 0)
            animation.duration = 2
            self.firstPopUp.setAnchorPoint(CGPoint(x: 0, y: 0.5))
            CATransaction.begin()
            self.firstPopUp.layer.add(animation, forKey: "transform")
            self.secondPopUp.isHidden = false
            self.firstPopUp.layer.transform = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, 1, 0)
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector:#selector(segueing),userInfo: nil, repeats: false)
        }
    }
    
    @objc func segueing() {
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noOfCards
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        if currentSelectedIndex == indexPath.row {
            cell.transformToLarge()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        deneme()
    }
}

extension ViewController {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let currentCell = collectionView.cellForItem(at: IndexPath(row: Int(currentSelectedIndex), section: 0)) as? CollectionViewCell
        currentCell?.transformToStandard()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        guard scrollView == collectionView else {
            return
        }
        
        targetContentOffset.pointee = scrollView.contentOffset
        
        let flowLayout = collectionView.collectionViewLayout as! CardsCollectionFlowLayout
        let cellWidthIncludingSpacing = flowLayout.itemSize.width + flowLayout.minimumLineSpacing
        let offset = targetContentOffset.pointee
        let horizontalVelocity = velocity.x
        
        var selectedIndex = currentSelectedIndex
        
        switch horizontalVelocity {
        
        case _ where horizontalVelocity > 0 :
            selectedIndex = currentSelectedIndex + 1
        case _ where horizontalVelocity < 0:
            selectedIndex = currentSelectedIndex - 1
            
        case _ where horizontalVelocity == 0:
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
            let roundedIndex = round(index)
            
            selectedIndex = Int(roundedIndex)
        default:
            print("Incorrect velocity for collection view")
        }
        
        let safeIndex = max(0, min(selectedIndex, noOfCards - 1))
        let selectedIndexPath = IndexPath(row: safeIndex, section: 0)
        
        flowLayout.collectionView!.scrollToItem(at: selectedIndexPath, at: .centeredHorizontally, animated: true)
        
        let previousSelectedIndex = IndexPath(row: Int(currentSelectedIndex), section: 0)
        let previousSelectedCell = collectionView.cellForItem(at: previousSelectedIndex) as? CollectionViewCell
        let nextSelectedCell = collectionView.cellForItem(at: selectedIndexPath) as? CollectionViewCell
        
        currentSelectedIndex = selectedIndexPath.row
        
        previousSelectedCell?.transformToStandard()
        nextSelectedCell?.transformToLarge()
    }
    
    func showIndicatorView() {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for index in 0..<noOfCards {
            let dot = UIImageView(image: UIImage(systemName: "circle.fill"))
            dot.heightAnchor.constraint(equalToConstant: 10).isActive = true
            dot.widthAnchor.constraint(equalToConstant: 10).isActive = true
            dot.image = dot.image!.withRenderingMode(.alwaysTemplate)
            dot.tintColor = UIColor.lightGray
            dot.tag = index + 1
            
            if index == currentSelectedIndex {
                dot.tintColor = UIColor.darkGray
            }
            stackView.addArrangedSubview(dot)
        }
        
        indicatorView.subviews.forEach({ $0.removeFromSuperview() })
        indicatorView.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: indicatorView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: indicatorView.centerYAnchor).isActive = true
    }
    
    func updateSelectedCardIndicator() {
        for index in 0...noOfCards - 1 {
            let selectedIndicator: UIImageView? = indicatorView.viewWithTag(index + 1) as? UIImageView
            selectedIndicator?.tintColor = index == currentSelectedIndex ? UIColor.darkGray: UIColor.lightGray
        }
    }
}

extension UIView{
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var position = layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        layer.position = position
        layer.anchorPoint = point
    }
}

