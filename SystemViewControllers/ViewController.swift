//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Travis Brigman on 3/1/19.
//  Copyright © 2019 Travis Brigman. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
   
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func shareButtonTapped(_ sender: UIButton) {
        
        guard let image = imageView.image else { return }
        
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        
        if let url = URL(string: "http://www.apple.com") {
           let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func photosButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in print("user selected camera action")})
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in print("user selected photo library action")})
        
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
    }
    
    
}

