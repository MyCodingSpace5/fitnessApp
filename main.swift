//
//  ContentView.swift
//  rizz
//
//  Created by ahmet on 11/30/24.
//
struct DecodableModel: Codable{
    public var model: ViewModel
    init(from decoder: any Decoder) throws {
        return
    }
    func encode(to encoder: any Encoder) throws {
        return
    }
}
class ViewModel: ObservableObject{
    @Published var activityName: String = "null"
    @Published var activities: [any View]
    @Published var currentState: any View
    @Published var index: Int
    init(activityName: String, activities: [any View], state: any View, index: Int) {
        self.activityName = activityName
        self.activities = activities
        self.currentState = state
        self.index = index
    }
}
import SwiftUI
import Combine
struct ContentView: View {
    @EnvironmentObject var model: ViewModel
    var body: some View {
        ZStack{
            VStack{
                HStack(spacing: 10){
                    Spacer()
                    Button(">"){
                        model.index+=1
                        model.currentState = model.activities[model.index]
                    }.frame(width: 80, height: 50)
                        .cornerRadius(10)
                    Spacer()
                    Text("\(model.activityName)")
                    Spacer()
                    Button("<"){
                        model.index-=1
                        model.currentState =
                        model.activities[model.index]
                    }.frame(width: 80, height: 50)
                        .cornerRadius(10)
                    Spacer()
                    VStack{
                        var v_body: some View{
                            model.$currentState as a
                        }
                    }
                }
                Spacer()
            }
        }
        
    }
    func decodableModel(model: DecodableModel){
        // Give
    }
}

struct StepView: View{
    @State private var stepsCount: Double = 0
    @State private var goal: Double = 0
    var body: some View{
        VStack{
            ProgressView(value: stepsCount, total: goal)
                    .frame(width: 80, height: 30)
                    .background(.blue)
            Text(stepsCount > goal ? "Goal met" : "Goal not met")
        }
    }
    init(stepsCount: Int, goal: Int) {
        self.stepsCount = Double(stepsCount)
        self.goal = Double(goal)
    }
    mutating func incrementSteps(){
        switch(stepsCount > goal){
        case true:
            break
        case false:
            stepsCount+=1;
            break
        }
    }
}
#Preview {
    ContentView()
}
