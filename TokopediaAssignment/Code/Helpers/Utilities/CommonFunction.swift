
import UIKit
import NVActivityIndicatorView
import MapKit

class CommonFunction: NSObject {
    
    
    static let sharedInstance = CommonFunction()
}

//MARK:- Show Loader
extension CommonFunction{
    
    
    func showLoader(){
        
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.startAnimating(CGSize(width: 60,height: 60), message: "", type: .ballSpinFadeLoader, color: UIColor.blue, padding: 0, displayTimeThreshold: nil, minimumDisplayTime: nil)
    }
    func hideLoader(){
        
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.stopAnimating()
    }

    
    
}

extension UIViewController : NVActivityIndicatorViewable {}

