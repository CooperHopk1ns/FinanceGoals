//
//  AddingGoalView.swift
//  FinanceGoals
//
//  Created by Cooper Hopkins on 6/12/22.
//

import SwiftUI

struct AddingGoalView: View {
    @Environment(\.dismiss) var dismiss
    @State var number = 0
    @State var image = ""
    @State var description = ""
    @State var amountSavedText = ""
    @State var amountSaved = 0
    @State var amountTotalText = ""
    @State var amountTotal = 0
    @State private var selected = imageStruct.init(id: 5, imageName: "", systemName: "")
    var body: some View {
        NavigationView {
                VStack {
                TextField("I am saving for...", text: $description)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.black)
                TextField("Amount Saved...", text: $amountSavedText)
                        .padding()
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.black)
                TextField("Amount Total...", text: $amountTotalText)
                    .padding()
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.black)
                    HStack {
                Text("Goal Image: ")
                            .foregroundColor(.black)
                        Picker("Image", selection: $selected) {
                            ForEach(images, id: \.self) {image in
                                HStack {
                                    Text(image.imageName)
                                    Image(systemName: image.systemName)
                                }
                            }
                        }
                        .padding()
                    }
                Text("You Have To Refresh The View")
                        .foregroundColor(.black)
                        .padding()
                Button(action: {
                    amountSaved = Int(amountSavedText) ?? 0
                    amountTotal = Int(amountTotalText) ?? 0
                    number = goals.count
                    image = selected.systemName
                    goals.append(Goal.init(number: number, image: image, description: description, amountSaved: amountSaved, amountTotal: amountTotal))
                    if let encoded = try? JSONEncoder().encode(goals) {
                        defaults.set(encoded, forKey: "goalsKey")
                    }
                    dismiss()
                }) {
                    Text("Enter")
                }
            }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200, alignment: .top)
            .navigationTitle("Add A Goal")
        }
    }
}

struct AddingGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddingGoalView()
    }
}
