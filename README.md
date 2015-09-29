# ScrollViewImager


    .mockUp
returns a screenshot of the current visible area

    .screenshot(completion: (screenshot: UIImage) -> Void)
returns a screenshot of the entire content

With `.mockUp` you can hide the `UIScrollView` or `UICollectionView` while `.screenshot` does it's work, which involves a lot of scrolling.

`.screenshot` will go over the entire content and take screenshots, adding delays to allow redraws.
