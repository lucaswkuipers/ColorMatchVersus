import UIKit

extension UIView {

    func rotate(_ angleInDegrees: CGFloat) {
        let radians = angleInDegrees / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }

}
