//
//  ScoreView.swift
//  Quiz1
//
//  Created by shahab on 10/02/2023.
//

import SwiftUI

struct ScoreView: View {
    var correctAnswers: Int
    
    var body: some View {
        Text(correctAnswers == 3 ? "You got full marks": "You did mistakes")
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(correctAnswers: 3)
        ScoreView(correctAnswers: 2)
    }
}
