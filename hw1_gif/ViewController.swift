//
//  ViewController.swift
//  hw1_gif
//
//  Created by demi on 2025/8/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!

    private var isAnimating = false
    private var duration: Double = 4.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // 初始化圓圈外觀
        circleView.layer.cornerRadius = 100 // 一半寬高
        circleView.backgroundColor = UIColor.orange.withAlphaComponent(0.7)
        circleView.layer.borderColor = UIColor.white.cgColor
        circleView.layer.borderWidth = 6
        circleView.clipsToBounds = true

        speedSlider.minimumValue = 2
        speedSlider.maximumValue = 8
        speedSlider.value = 4
        updateSpeedLabel()
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        isAnimating.toggle()
        if isAnimating {
            startBreathingAnimation()
            startButton.setTitle("停止", for: .normal)
        } else {
            stopBreathingAnimation()
            startButton.setTitle("開始", for: .normal)
        }
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        duration = Double(sender.value)
        updateSpeedLabel()

        if isAnimating {
            stopBreathingAnimation()
            startBreathingAnimation()
        }
    }

    private func updateSpeedLabel() {
        speedLabel.text = String(format: "速度：%.1f 秒/呼吸", duration)
    }

    private func startBreathingAnimation() {
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: [.autoreverse, .repeat, .allowUserInteraction]) {
            self.circleView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }
    }

    private func stopBreathingAnimation() {
        circleView.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.25) {
            self.circleView.transform = .identity
        }
    }
}


