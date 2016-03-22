# ScrollViewImager


    .mockup
returns a screenshot of the current visible area

    .screenshot(scale: CGFloat, completion: (screenshot: UIImage?) -> Void)
returns a screenshot of the entire content by scrolling the scrollview

    .screenshot(scale: CGFloat) -> UIImage
returns a screenshot of the entire content by resizing the scrollview.

With `.mockup` you can hide the `UIScrollView` or `UICollectionView` while `.screenshot` does it's work, which involves a lot of scrolling.



`.screenshot(scale: CGFloat, completion: (screenshot: UIImage?) -> Void)` 
This will go over the entire content and take screenshots, adding delays to allow redraws. Scale the screenshots down to prevent memory issues. Finally it will stitch all images together.

`.screenshot(scale: CGFloat) -> UIImage`
This will simply resize the scrollview and take a screenshot.
Uses all the memory!
