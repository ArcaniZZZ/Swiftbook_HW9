//
//  ViewController.swift
//  Swiftbook_HW 9
//
//  Created by Arcani on 21.09.2021.
//

import Spring

class MainScreenViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animatedView: SpringView!
    
    @IBOutlet var animationLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    
    @IBOutlet var animateButton: UIButton!
    @IBOutlet var repeatButton: UIButton!
    
    // MARK: - Private Properties
    var initializedAnimation: Animation!
    
    // MARK: - Overriden functions
    override func viewDidLoad() {
        super.viewDidLoad()
        animateButton.setTitle("Start!", for: .normal)
        animationLabel.text = "Fancy"
        curveLabel.text = "animations"
        forceLabel.text = "are waiting"
        durationLabel.text = "for you!"
    }
    
    // MARK: - IB Action
    @IBAction func animationButtonPressed() {
        let currentAnimation = Animation.getAnimation()
        
        initializedAnimation = currentAnimation
        
        setLabelsText(from: currentAnimation)
        
        setAnimation(from: currentAnimation)
        
        animatedView.animate()
        
        replaceButtonLabel(for: animateButton, with: "Next \(StyleAndCurveOfAnimation.shared.animationTypes.first ?? "")")
        
        replaceButtonLabel(for: repeatButton, with: "Repeat \(currentAnimation.animation)")
    }
    
    @IBAction func repeatButtonPressed() {
        setAnimation(from: initializedAnimation)
        
        animatedView.animate()
    }
    
    // MARK: - Private methods
    private func replaceButtonLabel(for button: UIButton, with buttonLabel: String) {
        button.setTitle(buttonLabel, for: .normal)
    }
    
    private func setLabelsText(from currentAnimation: Animation) {
        animationLabel.text = currentAnimation.animation
        curveLabel.text = currentAnimation.curve
        forceLabel.text = String(format: "%0.2f", currentAnimation.force)
        durationLabel.text = String(format: "%0.2f", currentAnimation.duration)
    }
    
    private func setAnimation(from currentAnimation: Animation) {
        animatedView.animation = currentAnimation.animation
        animatedView.curve = currentAnimation.curve
        animatedView.force = currentAnimation.force
        animatedView.duration = currentAnimation.duration
    }
}

