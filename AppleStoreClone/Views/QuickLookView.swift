//
//  QuickLookView.swift
//  AppleStoreClone
//
//  Created by Felix Parey on 21/11/23.
//

import SwiftUI
import QuickLook
import ARKit

// Just copy, I know nothing about 99% of that code. THANK YOU CHATGPT!!!
struct ARQuickLookView: UIViewControllerRepresentable {
    
    var card: Card

    func makeUIViewController(context: Context) -> QLPreviewController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: QLPreviewController, context: Context) {
        // Update the controller if needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, QLPreviewControllerDataSource {
        var parent: ARQuickLookView

        init(_ parent: ARQuickLookView) {
            self.parent = parent
        }

        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }

        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            
            //Path to 3D asset
            let previewItem = ARQuickLookPreviewItem(fileAt: URL(filePath:  Bundle.main.path(forResource: "\(parent.card.objectName)", ofType: "usdz")!))
            return previewItem
        }
    }
}

