//
//  MainViewController.swift
//  HW_Lesson3.1_Grossman
//
//  Created by Elizabeth on 18/03/2023.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {
    
    @IBOutlet var infoView: SpringView!
    
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var presetLabel: UILabel!
    
    private var animations = DataStore.shared.animations.shuffled()
    private var curves = DataStore.shared.curves.shuffled()
    private var duration: CGFloat!
    private var delay: CGFloat!
    private var force: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelTitles()
        delay = getRandomNumberInRange(min: 0.0, max: 4.0)
        duration = getRandomNumberInRange(min: 0.8, max: 4.0)
        force = getRandomNumberInRange(min: 1.0, max: 5.0)
    }
    
    @IBAction func buttonRunTapped(_ sender: UIButton) {
        if sender.titleLabel?.text == "Run Animation" {
            setAnimationSettings(for: infoView)
            animations = animations.shuffled()
            curves = curves.shuffled()
            sender.setTitle("Run \(animations.first ?? "")", for: .normal)
        } else {
            delay = getRandomNumberInRange(min: 0.0, max: 4.0)
            duration = getRandomNumberInRange(min: 0.8, max: 4.0)
            force = getRandomNumberInRange(min: 1.0, max: 5.0)
            setAnimationSettings(for: infoView)
            setLabelTitles()
        
            animations = animations.shuffled()
            curves = curves.shuffled()
            sender.setTitle("Run \(animations.first ?? "")", for: .normal)
        }
    }
    
    private func setLabelTitles() {
        presetLabel.text = "\(animations.first ?? "")"
        curveLabel.text = "\(curves.first ?? "")"
        delayLabel.text = "\(delay ?? 0)"
        forceLabel.text = "\(force ?? 0)"
        durationLabel.text = "\(duration ?? 0)"
    }
    
    private func setAnimationSettings(for view: SpringView) {
        view.animation = animations.first ?? ""
        view.curve = curves.first ?? ""
        view.delay = delay
        view.force = force
        view.duration = duration
        view.animate()
    }
    
    private func getRandomNumberInRange(min: CGFloat, max: CGFloat) -> CGFloat {
        ((CGFloat.random(in: min ..< max) * 10) / 10.0)
    }
    
}
