//
//  XMarksButton.swift
//  CryptoApp
//
//  Created by Maksim  on 26.08.2022.
//

import SwiftUI

struct XMarksButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .font(.headline)
        }

    }
}

struct XMarksButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarksButton(action: {})
    }
}

