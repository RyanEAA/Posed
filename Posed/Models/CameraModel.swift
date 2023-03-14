//
//  CameraModel.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/13/23.
//

import SwiftUI
import Foundation
import AVFoundation

class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate{
    
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    
    @Published var alert = false
    
    @Published var output = AVCapturePhotoOutput()
    
    //preview
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    @Published var isSaved = false
    
    @Published var picData = Data(count: 0)
    
    func Check(){
        //first checking to see if camera has permission
        
        switch AVCaptureDevice.authorizationStatus(for: .video){
            
        case .authorized:
            setUp()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                
                if status {
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
        
    }
    
    func setUp(){
        //setting up camera
        do{
            
            //setting configs..
            self.session.beginConfiguration()
            
            //change for your own
            
            let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            
            let input = try AVCaptureDeviceInput(device: device!)
            
            
            //checking and adding
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            
            // same for output
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func takePic(){
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            
            
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
            }
            self.session.stopRunning()
        }
    }
    
    func reTake(){
        
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
                
                //clearing
                self.isSaved = false
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?){
        if error != nil{
            return
        }
        print("pic taken")
        
        guard let imageData = photo.fileDataRepresentation() else {return}
        
        self.picData = imageData
    }
    
    func savePic(){
        
        guard let image = UIImage(data: self.picData) else {
                print("Error: Failed to create UIImage from picData")
                return
            }
            
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            
            self.isSaved = true
            
            print("Saved successfully")
    }
}
