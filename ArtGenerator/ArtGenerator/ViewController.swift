//
//  ViewController.swift
//  ArtGenerator
//
//  Created by Johann Shetti on 2/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        view.addSubview(ImageView)
        ImageView.frame = CGRect(x: 0 , y:0 , width : 300 , height : 350)
        ImageView.center = view.center
        getRandomArt()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        view.addSubview(button)
        button.frame = CGRect(x: 30 , y:view.frame.size.height-150-view.safeAreaInsets.bottom , width : view.frame.size.width - 60 , height : 55)
        
        
    }
    
    func getRandomArt() {
        let urlString =
            "https://source.unsplash.com/random/1500x1500"
        
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        ImageView.image = UIImage(data:data)
    }
    
    private let ImageView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.contentMode = .scaleAspectFill
        ImageView.backgroundColor = .white
        return ImageView
    } ()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("click here", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    } ()
    
    
    @objc func didTapButton() {
        getRandomArt()
    }
    

}

