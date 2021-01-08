//
//  imageOrientation.swift
//  QuickGifs
//
//  Created by Norlan Tibanear on 1/7/21.
//

import UIKit



extension UIImage {

    var ratio: CGFloat {

        return size.height / size.width

    }

    

    func imageByScaling(toSize size: CGSize) -> UIImage? {

        guard size.width > 0 && size.height > 0 else { return nil }

        

        let originalAspectRatio = self.size.width/self.size.height

        var correctedSize = size

        

        if correctedSize.width > correctedSize.width*originalAspectRatio {

            correctedSize.width = correctedSize.width*originalAspectRatio

        } else {

            correctedSize.height = correctedSize.height/originalAspectRatio

        }

        

        return UIGraphicsImageRenderer(size: correctedSize, format: imageRendererFormat).image { context in

            draw(in: CGRect(origin: .zero, size: correctedSize))

        }

    }

    

    /// Renders the image if the pixel data was rotated due to orientation of camera

    var flattened: UIImage {

        if imageOrientation == .up { return self }

        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { context in

            draw(at: .zero)

        }

    }

}

