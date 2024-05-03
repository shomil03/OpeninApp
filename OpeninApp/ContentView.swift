//
//  ContentView.swift
//  OpeninApp
//
//  Created by Shomil Singh on 01/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var response : Response
    @State var isselected = true
    @State var linkDetails : [RecentLink]
    @State var dic = [Date : Int]()
    @State var dates = [Date]()
    let lightBlue = Color(red: 173/255, green: 216/255, blue: 230)
    let lightGreen = Color(red: 144/255, green: 238/255, blue: 144/255)
    @State private var greetingMessage = "Good Morning"
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: [.blue , .white], startPoint: .center, endPoint: .bottom)
                    .ignoresSafeArea(.container, edges: .top)
                ScrollView(showsIndicators: false){
                    VStack{
                        HStack(){
                            GreetingView()
                                .foregroundStyle(.black)
                            
                            Spacer()
                        }
                        .padding(.top , 25)
                        
                        
                        HStack{
                            Text("Ajay Manva 👋")
                                .foregroundStyle(.black)
                                .font(.title)
                                .padding(.top)
                            Spacer()
                        }
                    }
                    .padding()
                    VStack{
                        HStack {
                            Text("Overview")
                                .font(.title2)
                            .foregroundStyle(Color.gray)
                            .padding()
                            Spacer()
                        }
                        ChartView(dic: dic, dates: dates)
                            .frame(maxWidth: .infinity , idealHeight: 250)
                    }
                    .background(Color(red: 250/255, green: 250/255, blue: 250/255))
                    .padding(.vertical)
                    
                    ScrollView(.horizontal , showsIndicators: false){
                        HStack{
                            CardView(image: "cursorarrow.click.2", heading: "\(response.today_clicks)", subHeading: "Todays click")
                            CardView(image: "mappin.and.ellipse.circle.fill", heading: "\(response.top_location)", subHeading: "Top Location")
                            CardView(image: "globe", heading: "\(response.top_source)", subHeading: "Top source")
                        }
                        .padding(.horizontal)
                        
                        
                        
                    }
                   
                    Button(){
                        
                    }label: {
                        Label("View Analytics", systemImage: "waveform.path.ecg")
                            .foregroundStyle(Color.black)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                    }
                    .frame(maxWidth: .infinity , idealHeight: 50)
                    .overlay(RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(.black , lineWidth: 1))
                    .padding()
                    
                    
                    HStack{
                        Button(action: {
                            isselected.toggle()
//                            linkDetails = response.data.recent_links
                        }, label: {
                            Text("Top Link")
                                .fontWeight(.semibold)
                                .padding()
                                .foregroundStyle(isselected ?  Color.white : Color.gray)
                                .background(isselected ?  Color.blue : Color.white)
                                .clipShape(Capsule())
                        })
                        .padding(.horizontal)
                        Button(action: {
                            isselected.toggle()
//                            linkDetails = response.data.top_links
                        }, label: {
                            Text("Recent Link")
                                .fontWeight(.medium)
                                .padding()
                                .foregroundStyle(!isselected ?  Color.white : Color.gray)
                                .background(!isselected ?  Color.blue : Color.white)
                                .clipShape(Capsule())
                        })
                        Spacer()
                        
                    }
                    Spacer()
                    if(isselected){
                        TopLinkView(response: response, limit: min(response.data.top_links.count , 4))
                    }
                    else{
                        RecentLinkView(response: response , limit : min(response.data.recent_links.count , 4))
                    }
                    
                    
                    NavigationLink(destination: ViewAllLink(response: response)) {
                        Label("View all link", systemImage: "link")
                            .foregroundStyle(Color.black)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity , idealHeight: 50)
                    .overlay(RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(.black , lineWidth: 1))
                    .padding()
                    
                    
                    VStack {
                        Button(){
                            
                        }label: {
                            Label("Talk with us", systemImage: "phone.circle")
                                .symbolRenderingMode(.multicolor)
                                .foregroundStyle(Color.black)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading)
                            Spacer()
                            
                            
                        }
                        .frame(maxWidth: .infinity , idealHeight: 75)
                        
                        .overlay(RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(.black , lineWidth: 1))
                        .background(Color(lightGreen))
//                    .padding()
                    
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding()
                    .padding(.top)
                    
                    VStack {
                        Button(){
                            
                        }label: {
                            Label("Frequently Asked Questions", systemImage: "questionmark.circle")
                                .symbolRenderingMode(.hierarchical)
                                .foregroundStyle(Color.black)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading)
                            Spacer()
                            
                            
                        }
                        .frame(maxWidth: .infinity , idealHeight: 75)
                        
                        .overlay(RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(.blue , lineWidth: 1))
                        .background(Color(lightBlue))
                        //                    .padding()
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    
                    
                }
                .frame(maxWidth: .infinity , maxHeight: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.top)
                
            }
            .navigationTitle("DashBoard")
            
        }
        .onAppear{
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
            greetingMessage = greet()
            
            if(dates.count <= 0){
                Task{
                    do{
                        response = try await NetworkManager.shared.getResponse()
                        createDic(response: response, dic: &dic, dates: &dates)
                        dates = dates.sorted()
                        print(response.top_location)
                    }catch{
                        print("error occured")
                    }
                }
            }

        }
    }
    func greet() -> String{
        let hour = Calendar.current.component(.hour, from: Date())
        if hour < 12{
            return "Good morning"
        }
        if hour < 18{
            return "Good afternoon"
        }
        return "Good evening"
    }
}

#Preview {
//    ContentView(response: MockDataObject.sampleResponse, linkDetails: [])
    ContentView(response: MockDataObject.emptyResponse, linkDetails: [])
}
