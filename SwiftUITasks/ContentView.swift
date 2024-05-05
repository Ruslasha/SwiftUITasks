//
//  ContentView.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 29.04.2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Constants
    
    private enum Constants {
        static let defaultPrice = 2189900
        static let logoImage = "logo"
        static let shareButton = "share"
        static let title = "Информация об автомобиле"
        static let engine = "Двигатель"
        static let privod = "Привод"
        static let complectation = "Комплектация"
        static let price = "Цена"
        static let toggleTitle = "ОМОДА Каско"
        static let noAlertButton = "Нет, не нужно"
        static let yesAlertButton = "Да"
        static let alertMessage = "Подключить Каско на выгодных условиях?"
        static let actionSheetMessage = "Благодарим за заказ. Наш менеджер свяжется с Вами в рабочее время для уточнения деталей."
        static let orderTitle = "Заказать"
    }
    
    @ObservedObject private var carViewModel = CarViewModel()
    @State private var price = Constants.defaultPrice
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 70)
            carImage
            segment
            ZStack {
                rectangleView
                    .ignoresSafeArea()
                infoCar
            }
        }
        .background(.appBackground)
    }
    
    @State private var selectedIndex = 0
    private var segment: some View {
        Picker("", selection: $selectedIndex) {
            ForEach(0..<carViewModel.cars.count, id: \.self){
                Text(carViewModel.cars[$0].model)
                    .tag($0)
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        .pickerStyle(.segmented)
        .onChange(of: selectedIndex) {newValue in
            isKaskoToogle = false
            price = carViewModel.cars[newValue].price
        }
    }

    @State private var isSharedPressed = false
    private var carImage: some View {
        VStack{
            HStack {
                Spacer()
                Image(Constants.logoImage)
                Spacer()
                Button(action: {
                    isSharedPressed = true
                }, label: {
                    Image(Constants.shareButton)
                        .tint(.white)
                })
            }.padding(.horizontal)
            Image(carViewModel.cars[selectedIndex].carImage)
                .frame(width: 345, height: 198)
        }
        .sheet(isPresented: $isSharedPressed, content: {
            ActivityView(activityItems: ["Автомобиль Omoda \(carViewModel.cars[selectedIndex].model) - посмотри предложение"])
        })
    }
    
    private var rectangleView: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
    }
    
    private var infoCar: some View {
        VStack(spacing:0) {
            Spacer()
                .frame(height: 25)
            Text(Constants.title)
                .fontWeight(.heavy)
            configurationView(title: Constants.engine, info: "1.6 Тurbo")
            configurationView(title: Constants.privod, info: "AWD")
            configurationView(title: Constants.complectation, info: "", divider: false)
            slider
            kaskoToggle
            configurationView(title: Constants.price, info: "\(price) руб", divider: false)
                .font(.headline)
            orderButton
            Spacer()
        }
    }
    
    private func configurationView(title: String, info: String, divider: Bool = true) -> some View {
        VStack{
            HStack{
                Text(title)
                Spacer()
                Text(info)
            }
            if divider {
                Divider()
                    .padding(.horizontal, 60)
            }
        }
        .padding()
    }
    
    @State private var sliderSelection = 0.0
    private var complictations = ["Joy", "Lifestyle", "Ultimate", "Active","Supreme"]

    @State private var oldSelection = 0.0
    private var slider: some View {
        VStack{
            Slider(value: $sliderSelection, in: 0...4, step: 1)
                .onAppear {
                    let progressCircleConfig = UIImage.SymbolConfiguration(scale: .small)
                    UISlider.appearance()
                        .setThumbImage(UIImage(systemName: "circle.fill",
                                               withConfiguration: progressCircleConfig), for: .normal)
                }
                .tint(.black)
            HStack(spacing: 34){
                ForEach(0..<complictations.count, id: \.self){ item in
                    Text(complictations[item])
                        .font(.system(size: 12))
                }
            }
        }
        .padding(.horizontal)
        .onChange(of: sliderSelection) {newValue in
            if newValue > oldSelection {
                price += 190000
            } else {
                price -= 190000
            }
            oldSelection = newValue
        }
    }
    
    @State private var isKaskoToogle = false
    @State private var isAlertPresented = false

    private var kaskoToggle: some View {
        VStack(spacing: 0){
            Toggle(Constants.toggleTitle, isOn: $isKaskoToogle)
            Divider()
                .padding(.horizontal, 60)
        }
        .padding()
        .alert(Constants.toggleTitle, isPresented: $isAlertPresented) {
            Button(Constants.noAlertButton){isKaskoToogle = false}
            Button(role: .cancel, action: {
                price += 99000
            },
                   label: {
                Text(Constants.yesAlertButton)
            })
        } message: {
            Text(Constants.alertMessage)
        }
        .onChange(of: isKaskoToogle) {value in
            if value {
                isAlertPresented = value
            } else {
                price -= 99000
            }
        }
    }
    
    @State private var isActionSheetPresented = false
    private var orderButton: some View {
        VStack{
            Button(action: {
                isActionSheetPresented.toggle()
            }, label: {
                Text(Constants.orderTitle)
            })
            .tint(.white)
            .frame(width: 358, height: 48)
            .background(.appBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
        }.confirmationDialog("", isPresented: $isActionSheetPresented) {
        } message: {
            Text(Constants.actionSheetMessage)
        }
    }
}

#Preview {
    ContentView()
}
