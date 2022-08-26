//
//  XMarksButton.swift
//  CryptoApp
//
//  Created by Maksim  on 26.08.2022.
//

import SwiftUI

struct XMarksButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }

    }
}

struct XMarksButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarksButton()
    }
}
