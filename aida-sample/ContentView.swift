//
//  ContentView.swift
//  aida-sample
//
//  Created by Yusuke Aida on 2024/08/09.
//

import SwiftUI
import CoreMotion


struct ContentView: View {
    
    private var motionManager = CMMotionManager()
    @State private var x: Double = 0.0
    @State private var xCount: Double = 0
    @State private var y: Double = 0
    @State private var yCount: Double = 0.0
    @State private var z: Double = 0
    @State private var zCount: Double = 0.0
    var body: some View {
        VStack(spacing: 50) {
            Text("x: \(x)")
                .onChange(of: x) { oldVal, newVal in
                    if oldVal != newVal {
                        xCount = xCount + 1
                    }
                }
            Text("x:count \(xCount)")
            Text("y: \(y)")
                .onChange(of: y) { oldVal, newVal in
                    if oldVal != newVal {
                        yCount = yCount + 1
                    }
                }
            Text("yCount: \(yCount)")
            Text("z: \(z)")
                .onChange(of: z) { oldVal, newVal in
                    if oldVal != newVal {
                        zCount = zCount + 1
                    }
                }
            Text("zCount: \(zCount)")
        }
        
        .onAppear() {
            start()
        }
        .onDisappear() {
            stop()
        }
    }
    func start(_ interval: Double = 0.05) {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = interval
            motionManager.startAccelerometerUpdates(to: .main) { data, error in
                guard let data else { return }
                x = round(data.acceleration.x * 5) / 5
                y = round(data.acceleration.y * 5) / 5
                z = round(data.acceleration.z / 2) * 2
            }
        }
    }
    func stop() {
        if motionManager.isAccelerometerActive {
            motionManager.stopAccelerometerUpdates()
        }
    }
    
}

#Preview {
    ContentView()
}
