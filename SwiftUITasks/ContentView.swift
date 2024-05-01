//
//  ContentView.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 29.04.2024.
//

import SwiftUI

struct ContentView: View {

    @State var selection = 0
    @State var selectionWifi = 0
    @State var selectionBluetooth = 0
    @State var isAviaOn = false
    @State var isVpnOn = false

    var settingTime = ["", "2", "3"]
    var wifiStates = ["Не подключено", "Подключено"]
    var bluetoothStates = ["Вкл.", "Выкл."]
    var modemStates = ["Выкл.", "Вкл."]
    var emptyData = [""]


    var body: some View {
        NavigationView {
            VStack {
                Form {
                    if #available(iOS 16.0, *) {
                        Picker(selection: $selection, content: {
                            ForEach(0..<emptyData.count) {
                                Text(self.emptyData[$0])
                            }
                        }, label: {
                            profileBodyView                        }).pickerStyle(.navigationLink)
                    }

                    if #available(iOS 16.0, *) {
                        Picker(selection: $selection, content: {
                            ForEach(0..<emptyData.count) {
                                Text(self.emptyData[$0])
                            }
                        }, label: {
                           guessBodyView
                        }).pickerStyle(.navigationLink)
                    }

                    Section {
                        if #available(iOS 16.0, *) {
                            Picker(selection: $selection, content: {
                                ForEach(0..<emptyData.count) {
                                    Text(self.emptyData[$0])
                                }
                            }, label: {
                                updateBodyView
                            }).pickerStyle(.navigationLink)
                        }
                    }

                    settingsView
                }.navigationBarTitle(Text("Настройки"))
            }
        }

    }

    private var settingsView: some View {
        Section {
            Toggle(isOn: $isAviaOn) {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.orange)
                        Image(systemName: "airplane")
                            .foregroundColor(.white)
                    }
                    Text("Авиарежим")
                }
            }

            if #available(iOS 16.0, *) {
                Picker(selection: $selectionWifi, content: {
                    ForEach(0..<wifiStates.count) {
                        Text(self.wifiStates[$0])
                    }
                }, label: {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.blue)
                            Image(systemName: "wifi")
                                .foregroundColor(.white)
                        }
                        Text("Wi-Fi")
                    }
                }).pickerStyle(.navigationLink)
            }

            if #available(iOS 16.0, *) {
                Picker(selection: $selectionBluetooth, content: {
                    ForEach(0..<bluetoothStates.count) {
                        Text(self.bluetoothStates[$0])
                    }
                }, label: {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.blue)
                            Image("Bluetooth")
                                .foregroundColor(.white)
                        }
                        Text("Bluetooth")
                    }
                }).pickerStyle(.navigationLink)
            }

            if #available(iOS 16.0, *) {
                Picker(selection: $selection, content: {
                    ForEach(0..<emptyData.count) {
                        Text(self.emptyData[$0])
                    }
                }, label: {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.green)
                            Image("Mobile")
                                .foregroundColor(.white)
                        }
                        Text("Сотовая связь")
                    }
                }).pickerStyle(.navigationLink)
            }

            if #available(iOS 16.0, *) {
                Picker(selection: $selection, content: {
                    ForEach(0..<modemStates.count) {
                        Text(self.modemStates[$0])
                    }
                }, label: {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.green)
                            Image("Modem")
                                .foregroundColor(.white)
                        }
                        Text("Режим модема")
                    }
                }).pickerStyle(.navigationLink)
            }

            Toggle(isOn: $isVpnOn) {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.blue)
                        Image(systemName: "network")
                            .foregroundColor(.white)
                    }
                    Text("VPN")
                }
            }
        }
    }

    private var profileBodyView: some View {
        HStack {
            Image("Verona")
            VStack(alignment: .leading) {
                Text("Ruslan")
                    .font(.title2)
                    .bold()
                Text("Apple ID, iCloud, контент и покупки").font(.caption2)
            }
        }
    }

    private var guessBodyView: some View {
        HStack {
            Text("Предложения Apple ID")
            Spacer()
            ZStack {
                Circle()
                    .frame(height: 25)
                    .foregroundColor(.red)
                Text("3")
                    .foregroundColor(.white)
            }
        }
    }

    private var updateBodyView: some View {
        HStack {
            Text("IOS 17.2: уже доступно")
            Spacer()
            ZStack {
                Circle()
                    .frame(height: 25)
                    .foregroundColor(.red)
                Text("3")
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
