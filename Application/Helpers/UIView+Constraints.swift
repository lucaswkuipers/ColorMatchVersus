import UIKit

extension UIView {

    func prepareForConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func pinEdges(to view: UIView? = nil, _ offset: CGFloat = 0) {
        guard let view = view != nil ? view : superview else { return }

        topAnchor.constraint(equalTo: view.topAnchor, constant: offset).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -offset).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset).isActive = true
    }

    func pinHeight(to constant: CGFloat) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        constraint.isActive = true
        return constraint
    }
}
