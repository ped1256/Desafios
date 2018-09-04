//
//  CaptureChallengeViewController.swift
//  desafios
//
//  Created by Pedro Emanuel on 07/05/18.
//  Copyright © 2018 Pedro Emanuel. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import Vision

class CaptureChallengeViewController: UIViewController {
    
    var challengeTitle = UILabel()
    var findBy = UILabel()
    var challengeImageView = UIImageView()
    var actionButton = UIButton()
    var hellpImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareHomeLayout()
        showObjectToDetection()
    }
    
    func prepareHomeLayout() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isToolbarHidden = true
        let backgroundView = BackgroundView(frame: self.view.frame)
        self.view.addSubview(backgroundView)
    }
    
    func showObjectToDetection(){
        self.view.addSubview(challengeTitle)
        challengeTitle.text = "Desafio Iniciante"
        challengeTitle.font = UIFont.systemFont(ofSize: 34, weight: .light)
        challengeTitle.textColor = .white
        challengeTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            challengeTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            challengeTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20)
            ])
        
        let closeButtonView = UIButton()
        self.view.addSubview(closeButtonView)
        closeButtonView.translatesAutoresizingMaskIntoConstraints = false
        closeButtonView.setImage(#imageLiteral(resourceName: "Grey_close"), for: .normal)
        closeButtonView.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)

        NSLayoutConstraint.activate([
            closeButtonView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -17),
            closeButtonView.centerYAnchor.constraint(equalTo: challengeTitle.centerYAnchor),
            closeButtonView.heightAnchor.constraint(equalToConstant: 25),
            closeButtonView.widthAnchor.constraint(equalToConstant: 25)
            ])
        
        self.view.addSubview(findBy)
        
        findBy.translatesAutoresizingMaskIntoConstraints = false
        findBy.textColor = .white
        findBy.text = "Procure por:"
        findBy.font = UIFont.systemFont(ofSize: 36, weight: .light)
        
        NSLayoutConstraint.activate([
            findBy.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            findBy.topAnchor.constraint(equalTo: challengeTitle.bottomAnchor, constant: 50),
            ])
        
        self.view.addSubview(challengeImageView)
        
        challengeImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            challengeImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            challengeImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            challengeImageView.heightAnchor.constraint(equalToConstant: 279),
            challengeImageView.widthAnchor.constraint(equalToConstant: 261)
            ])
        
        challengeImageView.image = #imageLiteral(resourceName: "copoIcon")
        
        self.view.addSubview(actionButton)
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            actionButton.topAnchor.constraint(equalTo: self.challengeImageView.bottomAnchor, constant: 10),
            actionButton.heightAnchor.constraint(equalToConstant: 76),
            actionButton.widthAnchor.constraint(equalToConstant: 76)
            ])
        
        actionButton.setImage(#imageLiteral(resourceName: "camera_small"), for: .normal)
        actionButton.addTarget(self, action: #selector(startChallenge), for: .touchUpInside)

        
        self.view.addSubview(hellpImageView)
        
        hellpImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hellpImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            hellpImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            hellpImageView.heightAnchor.constraint(equalToConstant: 30),
            hellpImageView.widthAnchor.constraint(equalToConstant: 30)
            ])
        
        hellpImageView.image = #imageLiteral(resourceName: "helpIcon")
    }

    @objc func closeButtonAction(){
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: CAPTURE SESSION
    
    lazy var captureSession: AVCaptureSession = AVCaptureSession()
    let label = UILabel()
    
    open var device: AVCaptureDevice? {
        return AVCaptureDevice.default(.builtInWideAngleCamera, for: nil, position: .back)
    }
    
    @objc func startChallenge() {
        // request Test
        
        let operation = ChallengeOperationRequest()
        operation.getAllChallengesFromAPI { challenges in
            dump("request feito com sucesso")
            return
        }
        
        self.challengeTitle.font = UIFont.systemFont(ofSize: 30)
        self.challengeTitle.text = "Procure por: Copo"
        guard let device = self.device else { return }
        captureSession.sessionPreset = .photo
        
        guard let input = try? AVCaptureDeviceInput(device: device) else { return }
        
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = self.view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        
        dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as String): kCVPixelFormatType_32BGRA]
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videQueue"))
        captureSession.addOutput(dataOutput)
    }
    
}

// MARK: AVCAPTURE VIDEO DATA DELEGATE
extension CaptureChallengeViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else { return }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            
            guard let results = request.results as? [VNClassificationObservation] else { return }
            guard let element = results.first else { return }
            
            DispatchQueue.main.async {
                self.label.text = element.identifier
                
                dump(element.identifier)
                
                let namesToFind = ["cup"]
                if namesToFind.contains(element.identifier.lowercased()) {
                    print("achou o copo")
                }
            }
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        
    }
}
