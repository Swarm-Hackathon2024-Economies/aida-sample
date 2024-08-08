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
    @State private var y: Double = 0.0
    @State private var z: Double = 0.0
    var body: some View {
        VStack(spacing: 50) {
            Text("x: \(x)")
            Text("y: \(y)")
            Text("z: \(z)")
        }
        .onAppear() {
            start()
        }
        .onDisappear() {
            stop()
        }
    }
    func start() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.5
            motionManager.startAccelerometerUpdates(to: .main) { data, error in
                guard let data else { return }
                x = data.acceleration.x
                y = data.acceleration.y
                z = data.acceleration.z
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
