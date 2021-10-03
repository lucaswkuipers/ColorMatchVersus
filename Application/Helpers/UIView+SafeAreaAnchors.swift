import UIKit

extension UIView {

  var safeTopAnchor: NSLayoutYAxisAnchor {
      return safeAreaLayoutGuide.topAnchor
  }

  var safeLeftAnchor: NSLayoutXAxisAnchor {
      return safeAreaLayoutGuide.leftAnchor
  }

  var safeRightAnchor: NSLayoutXAxisAnchor {
      return safeAreaLayoutGuide.rightAnchor
  }

  var safeBottomAnchor: NSLayoutYAxisAnchor {
      return safeAreaLayoutGuide.bottomAnchor
  }
}
