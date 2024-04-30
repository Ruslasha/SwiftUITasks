//
//  ContentView.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 29.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isToggle = false
    @State var balance = 50000.00
    var body: some View {
        VStack {
            ZStack {
                backView
                Rectangle().fill(Color.init(red: 225/255, green: 233/255, blue: 222/255))
                    .offset(x: isToggle ? 176 : 0)
                mainView
            }

            Toggle(isOn: $isToggle, label: {
                Text("Показать мой кошелек")
            }).padding(13)
        }.animation(.spring(response: 0.3,
                            dampingFraction: 0.5,
                            blendDuration: 0.3))
    }

    var backView: some View {
        HStack {
            VStack {
                Text("One")
                Text("Two")
            }
            Spacer()
        }
    }

    var mainView: some View {
        VStack {
            HStack {
                Text("Карта1")
                    .font(.title)
                    .bold()
                    .offset(x: isToggle ? 176 : 0)
                    .padding(EdgeInsets(top: 40, leading: 16, bottom: 0, trailing: 0))
                Spacer()
            }
            cardView
            buttonsView
            Spacer()
        }
    }

    var buttonsView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.white)
                .offset(x: isToggle ? 176 : 0)
                .frame(height: 88)
                .padding(14)
            HStack {
                VStack {
                    Image("Up")
                    Button(action: {
                        self.balance = balance + 1000
                    }, label: {
                        Text("Пополнить")
                            .frame(height: 40)
                            .foregroundColor(.black)
                    })
                }
                .frame(height: 88)
                Spacer().frame(width: 35)
                VStack {
                    Image("Send")
                    Button(action: {
                        self.balance = balance - 1000
                    }, label: {
                        Text("Перевести")
                            .frame(height: 40)
                            .foregroundColor(.black)
                    })
                }
                .frame(height: 88)
                Spacer().frame(width: 50)
                VStack {
                    Image("OpenCard")
                    Text("Открыть \n карту")
                }
                .frame(height: 88)
            }
            .offset(x: isToggle ? 176 : 0)

        }
        .frame(height: 88)

    }

    var cardView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.init(red: 70/255, green: 183/255, blue: 27/255, opacity: 0.7))
                .offset(x: isToggle ? 176 : 0)
                .frame(height: 200)
                .padding(14)
            VStack {
                Spacer()
                    .frame(height: 16)
                HStack {
                    Spacer()
                        .frame(width: 32)
                    Text("\(balance) Р")
                        .font(.title2)
                        .foregroundColor(.white)
                        .offset(x: isToggle ? 176 : 0)
                    Spacer()
                }
                HStack {
                    Spacer()
                        .frame(width: 32)
                    Text("доступно")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .offset(x: isToggle ? 176 : 0)
                    Spacer()
                }
                Spacer()
            }
            .frame(height: 200)
        }
    }
}

#Preview {
    ContentView()
}
