//
//  ChartView.swift
//  OpeninApp
//
//  Created by Shomil Singh on 02/05/24.
//

import SwiftUI
import Charts

struct Test: View {
    var dic : [Date : Int]
    @State private var ans: [Int: Int] = [:]
    var dates : [Date]
    var body: some View {
        if(!dic.isEmpty && !dates.isEmpty){
            Chart{
                ForEach(dates , id: \.self){month in
                    LineMark(x: .value("Month", month , unit: .month), y: .value("clicks", ans[Calendar.current.component(.month, from: month)] ?? 0))
                    
                }
                
                
                
            }
            
            .chartXAxis{
                //                AxisMarks(values: .stride(by: .month)){_ in
                AxisMarks(values: .automatic(desiredCount: 7)){_ in
                    AxisValueLabel(format: .dateTime.month(.twoDigits) , centered: true)
                    
                    
                    
                    AxisValueLabel()
                        .foregroundStyle(Color.gray)
                    AxisGridLine()
                        .foregroundStyle(Color.gray)
                }
            }
            .chartYAxis{
                //                AxisMarks(values: .automatic){_ in
                //                AxisValueLabel()
                //                        .foregroundStyle(Color.gray)
                //                    AxisGridLine()
                //                        .foregroundStyle(Color.gray)
                //                }
            }
            .padding()
            
            .onAppear{
                ans = makeData(dic: dic)
                //                            print(ans)
            }
        }
    }
    func makeData(dic: [Date: Int]) -> [Int: Int] {
        var result: [Int: Int] = [:]
        
        for date in dic.keys {
            let calendar = Calendar.current
            let monthComponent = calendar.component(.month, from: date)
            
            let contain = result.contains { $0.key == monthComponent }
            //            print(contain)
            if(contain){
                result[monthComponent]! += dic[date] ?? 0
                //                print("\(dic[date]) result = \(result)")
            }
            else{
                result[monthComponent] = dic[date]
                //                print("\(dic[date]) result = \(result)")
            }
            
        }
        return result
    }
}

#Preview {
    Test(dic: [Date.now:1 , Date.now.addingTimeInterval(1): 2], dates: [Date.now , Date.now.addingTimeInterval(1)])
}
