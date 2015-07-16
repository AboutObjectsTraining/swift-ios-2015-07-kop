import UIKit

// MARK: Animation Methods
extension CoolViewCell
{
    func animateBounceWithSize(size: CGSize)
    {
        print(frame)
        UIView.animateWithDuration(1.0, animations: {
            UIView.setAnimationRepeatCount(3.5)
            UIView.setAnimationRepeatAutoreverses(true)

            let transform = CGAffineTransformMakeTranslation(size.width, size.height)
            self.transform = CGAffineTransformRotate(transform, CGFloat(M_PI_2))
        }) {
            _ in self.animateFinalBounceWithSize(size)
        }
    }
    
    func animateFinalBounceWithSize(size: CGSize)
    {
        UIView.animateWithDuration(1.0) {
            self.transform = CGAffineTransformIdentity
        }
    }
}