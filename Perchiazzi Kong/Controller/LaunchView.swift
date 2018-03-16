//
// LauncView.swift
// Generated by Core Animator version 1.5.2 on 15/03/18.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit
import AVFoundation

private class _LauncPassthroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@IBDesignable
class LauncView : UIView, CAAnimationDelegate {

	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 375, height: 677))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
    
		self.setupHierarchy()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	// - MARK: Scaling
	override func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .scaleToFill:
				break
			case .scaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransform(scaleX: xScale, y: yScale)
			scalingView.center = CGPoint(x:self.bounds.midX, y:self.bounds.midY)
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = Bundle(for:type(of: self))
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:375, height:677)
		__scaling__.center = CGPoint(x:187.5, y:338.5)
		__scaling__.clipsToBounds = true
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let background1__root = _LauncPassthroughView()
		let background1__xScale = _LauncPassthroughView()
		let background1__yScale = _LauncPassthroughView()
		let background1 = UIImageView()
		let imgBackground1 = UIImage(named:"background1.png", in: bundle, compatibleWith: nil)
		if imgBackground1 == nil {
			print("** Warning: Could not create image from 'background1.png'")
		}
		background1.image = imgBackground1
		background1.contentMode = .center
		background1.bounds = CGRect(x:0, y:0, width:414.0, height:750.0)
		background1__root.layer.position = CGPoint(x:187.500, y:273.067)
		background1__xScale.transform = CGAffineTransform(scaleX: 1.09, y: 1.00)
		background1__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.08)
		background1__root.transform = CGAffineTransform(rotationAngle: 0.000)
		background1__root.addSubview(background1__xScale)
		background1__xScale.addSubview(background1__yScale)
		background1__yScale.addSubview(background1)
		__scaling__.addSubview(background1__root)
		viewsByName["background1__root"] = background1__root
		viewsByName["background1__xScale"] = background1__xScale
		viewsByName["background1__yScale"] = background1__yScale
		viewsByName["background1"] = background1

		let pERCHIAZZI__root = _LauncPassthroughView()
		let pERCHIAZZI__xScale = _LauncPassthroughView()
		let pERCHIAZZI__yScale = _LauncPassthroughView()
		let pERCHIAZZI = UIImageView()
		let imgPERCHIAZZI = UIImage(named:"PERCHIAZZI.png", in: bundle, compatibleWith: nil)
		if imgPERCHIAZZI == nil {
			print("** Warning: Could not create image from 'PERCHIAZZI.png'")
		}
		pERCHIAZZI.image = imgPERCHIAZZI
		pERCHIAZZI.contentMode = .center
		pERCHIAZZI.layer.anchorPoint = CGPoint(x:0.455, y:0.340)
		pERCHIAZZI.bounds = CGRect(x:0, y:0, width:350.0, height:49.0)
		pERCHIAZZI__root.layer.position = CGPoint(x:172.934, y:133.030)
		pERCHIAZZI__xScale.transform = CGAffineTransform(scaleX: 0.92, y: 1.00)
		pERCHIAZZI__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.95)
		pERCHIAZZI__root.transform = CGAffineTransform(rotationAngle: 0.000)
		pERCHIAZZI__root.addSubview(pERCHIAZZI__xScale)
		pERCHIAZZI__xScale.addSubview(pERCHIAZZI__yScale)
		pERCHIAZZI__yScale.addSubview(pERCHIAZZI)
		__scaling__.addSubview(pERCHIAZZI__root)
		viewsByName["PERCHIAZZI__root"] = pERCHIAZZI__root
		viewsByName["PERCHIAZZI__xScale"] = pERCHIAZZI__xScale
		viewsByName["PERCHIAZZI__yScale"] = pERCHIAZZI__yScale
		viewsByName["PERCHIAZZI"] = pERCHIAZZI

		let kONG__root = _LauncPassthroughView()
		let kONG__xScale = _LauncPassthroughView()
		let kONG__yScale = _LauncPassthroughView()
		let kONG = UIImageView()
		let imgKONG = UIImage(named:"KONG.png", in: bundle, compatibleWith: nil)
		if imgKONG == nil {
			print("** Warning: Could not create image from 'KONG.png'")
		}
		kONG.image = imgKONG
		kONG.contentMode = .center
		kONG.layer.anchorPoint = CGPoint(x:0.510, y:0.601)
		kONG.bounds = CGRect(x:0, y:0, width:141.0, height:49.0)
		kONG__root.layer.position = CGPoint(x:189.410, y:208.390)
		kONG__xScale.transform = CGAffineTransform(scaleX: 1.33, y: 1.00)
		kONG__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.33)
		kONG__root.transform = CGAffineTransform(rotationAngle: 0.000)
		kONG__root.addSubview(kONG__xScale)
		kONG__xScale.addSubview(kONG__yScale)
		kONG__yScale.addSubview(kONG)
		__scaling__.addSubview(kONG__root)
		viewsByName["KONG__root"] = kONG__root
		viewsByName["KONG__xScale"] = kONG__xScale
		viewsByName["KONG__yScale"] = kONG__yScale
		viewsByName["KONG"] = kONG

		let perky3__root = _LauncPassthroughView()
		let perky3__xScale = _LauncPassthroughView()
		let perky3__yScale = _LauncPassthroughView()
		let perky3 = UIImageView()
		let imgPerchiAngryPreview = UIImage(named:"perchi-angry_preview.png", in: bundle, compatibleWith: nil)
		if imgPerchiAngryPreview == nil {
			print("** Warning: Could not create image from 'perchi-angry_preview.png'")
		}
		perky3.image = imgPerchiAngryPreview
		perky3.contentMode = .center
		perky3.layer.anchorPoint = CGPoint(x:0.439, y:0.496)
		perky3.bounds = CGRect(x:0, y:0, width:270.0, height:173.0)
		perky3__root.layer.position = CGPoint(x:175.602, y:374.736)
		perky3__root.alpha = 0.00
		perky3__xScale.transform = CGAffineTransform(scaleX: 0.72, y: 1.00)
		perky3__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.84)
		perky3__root.transform = CGAffineTransform(rotationAngle: 0.000)
		perky3__root.addSubview(perky3__xScale)
		perky3__xScale.addSubview(perky3__yScale)
		perky3__yScale.addSubview(perky3)
		__scaling__.addSubview(perky3__root)
		viewsByName["perky3__root"] = perky3__root
		viewsByName["perky3__xScale"] = perky3__xScale
		viewsByName["perky3__yScale"] = perky3__yScale
		viewsByName["perky3"] = perky3

		let sTART__root = _LauncPassthroughView()
		let sTART__xScale = _LauncPassthroughView()
		let sTART__yScale = _LauncPassthroughView()
		let sTART = UIImageView()
		let imgSTART = UIImage(named:"START.png", in: bundle, compatibleWith: nil)
		if imgSTART == nil {
			print("** Warning: Could not create image from 'START.png'")
		}
		sTART.image = imgSTART
		sTART.contentMode = .center
		sTART.bounds = CGRect(x:0, y:0, width:64.0, height:16.0)
		sTART__root.layer.position = CGPoint(x:187.500, y:489.617)
		sTART__root.alpha = 0.00
		sTART__xScale.transform = CGAffineTransform(scaleX: 1.87, y: 1.00)
		sTART__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.87)
		sTART__root.transform = CGAffineTransform(rotationAngle: 0.000)
		sTART__root.addSubview(sTART__xScale)
		sTART__xScale.addSubview(sTART__yScale)
		sTART__yScale.addSubview(sTART)
		__scaling__.addSubview(sTART__root)
		viewsByName["START__root"] = sTART__root
		viewsByName["START__xScale"] = sTART__xScale
		viewsByName["START__yScale"] = sTART__yScale
		viewsByName["START"] = sTART

		let perky2__root = _LauncPassthroughView()
		let perky2__xScale = _LauncPassthroughView()
		let perky2__yScale = _LauncPassthroughView()
		let perky2 = UIImageView()
		let imgPerchiAngry1Preview = UIImage(named:"perchi-angry1_preview.png", in: bundle, compatibleWith: nil)
		if imgPerchiAngry1Preview == nil {
			print("** Warning: Could not create image from 'perchi-angry1_preview.png'")
		}
		perky2.image = imgPerchiAngry1Preview
		perky2.contentMode = .center
		perky2.bounds = CGRect(x:0, y:0, width:128.0, height:70.0)
		perky2__root.layer.position = CGPoint(x:187.500, y:369.472)
		perky2__root.alpha = 0.00
		perky2__xScale.transform = CGAffineTransform(scaleX: 1.88, y: 1.00)
		perky2__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.88)
		perky2__root.transform = CGAffineTransform(rotationAngle: 0.000)
		perky2__root.addSubview(perky2__xScale)
		perky2__xScale.addSubview(perky2__yScale)
		perky2__yScale.addSubview(perky2)
		__scaling__.addSubview(perky2__root)
		viewsByName["perky2__root"] = perky2__root
		viewsByName["perky2__xScale"] = perky2__xScale
		viewsByName["perky2__yScale"] = perky2__yScale
		viewsByName["perky2"] = perky2

		let stefy1__root = _LauncPassthroughView()
		let stefy1__xScale = _LauncPassthroughView()
		let stefy1__yScale = _LauncPassthroughView()
		let stefy1 = UIImageView()
		let imgStefiLove0 = UIImage(named:"stefi_love0.png", in: bundle, compatibleWith: nil)
		if imgStefiLove0 == nil {
			print("** Warning: Could not create image from 'stefi_love0.png'")
		}
		stefy1.image = imgStefiLove0
		stefy1.contentMode = .center
		stefy1.bounds = CGRect(x:0, y:0, width:100.0, height:97.0)
		stefy1__root.layer.position = CGPoint(x:266.271, y:565.558)
		stefy1__xScale.transform = CGAffineTransform(scaleX: 1.58, y: 1.00)
		stefy1__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.58)
		stefy1__root.transform = CGAffineTransform(rotationAngle: 0.000)
		stefy1__root.addSubview(stefy1__xScale)
		stefy1__xScale.addSubview(stefy1__yScale)
		stefy1__yScale.addSubview(stefy1)
		__scaling__.addSubview(stefy1__root)
		viewsByName["stefy1__root"] = stefy1__root
		viewsByName["stefy1__xScale"] = stefy1__xScale
		viewsByName["stefy1__yScale"] = stefy1__yScale
		viewsByName["stefy1"] = stefy1

		let perky1__root = _LauncPassthroughView()
		let perky1__xScale = _LauncPassthroughView()
		let perky1__yScale = _LauncPassthroughView()
		let perky1 = UIImageView()
		let imgPerchiIdle1Preview = UIImage(named:"perchi-idle1_preview.png", in: bundle, compatibleWith: nil)
		if imgPerchiIdle1Preview == nil {
			print("** Warning: Could not create image from 'perchi-idle1_preview.png'")
		}
		perky1.image = imgPerchiIdle1Preview
		perky1.contentMode = .center
		perky1.bounds = CGRect(x:0, y:0, width:128.0, height:70.0)
		perky1__root.layer.position = CGPoint(x:187.500, y:-65.924)
		perky1__xScale.transform = CGAffineTransform(scaleX: 1.88, y: 1.00)
		perky1__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.88)
		perky1__root.transform = CGAffineTransform(rotationAngle: 0.000)
		perky1__root.addSubview(perky1__xScale)
		perky1__xScale.addSubview(perky1__yScale)
		perky1__yScale.addSubview(perky1)
		__scaling__.addSubview(perky1__root)
		viewsByName["perky1__root"] = perky1__root
		viewsByName["perky1__xScale"] = perky1__xScale
		viewsByName["perky1__yScale"] = perky1__yScale
		viewsByName["perky1"] = perky1

		let stefy2__root = _LauncPassthroughView()
		let stefy2__xScale = _LauncPassthroughView()
		let stefy2__yScale = _LauncPassthroughView()
		let stefy2 = UIImageView()
		let imgStefySketch01 = UIImage(named:"stefy_sketch0_1.png", in: bundle, compatibleWith: nil)
		if imgStefySketch01 == nil {
			print("** Warning: Could not create image from 'stefy_sketch0_1.png'")
		}
		stefy2.image = imgStefySketch01
		stefy2.contentMode = .center
		stefy2.bounds = CGRect(x:0, y:0, width:119.0, height:178.0)
		stefy2__root.layer.position = CGPoint(x:286.456, y:571.363)
		stefy2__root.alpha = 0.00
		stefy2__xScale.transform = CGAffineTransform(scaleX: 0.86, y: 1.00)
		stefy2__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.86)
		stefy2__root.transform = CGAffineTransform(rotationAngle: 0.000)
		stefy2__root.addSubview(stefy2__xScale)
		stefy2__xScale.addSubview(stefy2__yScale)
		stefy2__yScale.addSubview(stefy2)
		__scaling__.addSubview(stefy2__root)
		viewsByName["stefy2__root"] = stefy2__root
		viewsByName["stefy2__xScale"] = stefy2__xScale
		viewsByName["stefy2__yScale"] = stefy2__yScale
		viewsByName["stefy2"] = stefy2

		let darioSketch00__root = _LauncPassthroughView()
		let darioSketch00__xScale = _LauncPassthroughView()
		let darioSketch00__yScale = _LauncPassthroughView()
		let darioSketch00 = UIImageView()
		let imgDarioSketch00 = UIImage(named:"dario_sketch00.png", in: bundle, compatibleWith: nil)
		if imgDarioSketch00 == nil {
			print("** Warning: Could not create image from 'dario_sketch00.png'")
		}
		darioSketch00.image = imgDarioSketch00
		darioSketch00.contentMode = .center
		darioSketch00.bounds = CGRect(x:0, y:0, width:120.0, height:198.0)
		darioSketch00__root.layer.position = CGPoint(x:-88.744, y:483.340)
		darioSketch00__xScale.transform = CGAffineTransform(scaleX: 0.90, y: 1.00)
		darioSketch00__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.90)
		darioSketch00__root.transform = CGAffineTransform(rotationAngle: 0.000)
		darioSketch00__root.addSubview(darioSketch00__xScale)
		darioSketch00__xScale.addSubview(darioSketch00__yScale)
		darioSketch00__yScale.addSubview(darioSketch00)
		__scaling__.addSubview(darioSketch00__root)
		viewsByName["dario_sketch00__root"] = darioSketch00__root
		viewsByName["dario_sketch00__xScale"] = darioSketch00__xScale
		viewsByName["dario_sketch00__yScale"] = darioSketch00__yScale
		viewsByName["dario_sketch00"] = darioSketch00

		self.viewsByName = viewsByName
	}

	// - MARK: Untitled Animation

	func addUntitledAnimation() {
		addUntitledAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addUntitledAnimation(completion: ((Bool) -> Void)?) {
		addUntitledAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addUntitledAnimation(removedOnCompletion: Bool) {
		addUntitledAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addUntitledAnimation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addUntitledAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addUntitledAnimation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		let instantTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
		let easeOutTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 139.453
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "UntitledAnimation")
			self.animationCompletions[layer.animation(forKey: "UntitledAnimation")!] = complete
		}

		let sTARTOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		sTARTOpacityAnimation.duration = 139.453
		sTARTOpacityAnimation.values = [0.000, 0.000, 0.000, 1.000, 1.000, 0.000, 0.000, 1.000, 1.000, 0.000, 0.000, 1.000, 1.000] as [Float]
		sTARTOpacityAnimation.keyTimes = [0.000, 0.004, 0.019, 0.019, 0.022, 0.022, 0.025, 0.025, 0.028, 0.028, 0.032, 0.032, 1.000] as [NSNumber]
		sTARTOpacityAnimation.timingFunctions = [easeOutTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, instantTiming, easeOutTiming]
		sTARTOpacityAnimation.beginTime = beginTime
		sTARTOpacityAnimation.fillMode = fillMode
		sTARTOpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["START__root"]?.layer.add(sTARTOpacityAnimation, forKey:"Untitled Animation_Opacity")

		let perky1OpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		perky1OpacityAnimation.duration = 139.453
		perky1OpacityAnimation.values = [1.000, 1.000, 1.000, 0.000, 0.000, 1.000, 1.000] as [Float]
		perky1OpacityAnimation.keyTimes = [0.000, 0.004, 0.018, 0.018, 0.029, 0.029, 1.000] as [NSNumber]
		perky1OpacityAnimation.timingFunctions = [easeOutTiming, instantTiming, instantTiming, instantTiming, instantTiming, easeOutTiming]
		perky1OpacityAnimation.beginTime = beginTime
		perky1OpacityAnimation.fillMode = fillMode
		perky1OpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["perky1__root"]?.layer.add(perky1OpacityAnimation, forKey:"Untitled Animation_Opacity")

		let perky1TranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		perky1TranslationYAnimation.duration = 139.453
		perky1TranslationYAnimation.values = [0.000, 0.000, 0.000, 451.219, 451.219] as [Float]
		perky1TranslationYAnimation.keyTimes = [0.000, 0.004, 0.011, 0.014, 1.000] as [NSNumber]
		perky1TranslationYAnimation.timingFunctions = [easeOutTiming, linearTiming, linearTiming, easeOutTiming]
		perky1TranslationYAnimation.beginTime = beginTime
		perky1TranslationYAnimation.fillMode = fillMode
		perky1TranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["perky1__root"]?.layer.add(perky1TranslationYAnimation, forKey:"Untitled Animation_TranslationY")

		let perky2OpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		perky2OpacityAnimation.duration = 139.453
		perky2OpacityAnimation.values = [0.000, 0.000, 0.000, 0.028, 0.000, 0.000, 1.000, 1.000, 0.000, 0.000] as [Float]
		perky2OpacityAnimation.keyTimes = [0.000, 0.004, 0.018, 0.018, 0.018, 0.025, 0.025, 0.029, 0.029, 1.000] as [NSNumber]
		perky2OpacityAnimation.timingFunctions = [easeOutTiming, instantTiming, instantTiming, linearTiming, instantTiming, instantTiming, instantTiming, instantTiming, easeOutTiming]
		perky2OpacityAnimation.beginTime = beginTime
		perky2OpacityAnimation.fillMode = fillMode
		perky2OpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["perky2__root"]?.layer.add(perky2OpacityAnimation, forKey:"Untitled Animation_Opacity")

		let stefy1OpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		stefy1OpacityAnimation.duration = 139.453
		stefy1OpacityAnimation.values = [1.000, 1.000, 1.000, 0.000, 0.000] as [Float]
		stefy1OpacityAnimation.keyTimes = [0.000, 0.004, 0.018, 0.018, 1.000] as [NSNumber]
		stefy1OpacityAnimation.timingFunctions = [easeOutTiming, instantTiming, instantTiming, easeOutTiming]
		stefy1OpacityAnimation.beginTime = beginTime
		stefy1OpacityAnimation.fillMode = fillMode
		stefy1OpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["stefy1__root"]?.layer.add(stefy1OpacityAnimation, forKey:"Untitled Animation_Opacity")

		let darioSketch00TranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		darioSketch00TranslationXAnimation.duration = 139.453
		darioSketch00TranslationXAnimation.values = [13.625, 13.625, 13.625, 172.568, 172.568] as [Float]
		darioSketch00TranslationXAnimation.keyTimes = [0.000, 0.004, 0.004, 0.007, 1.000] as [NSNumber]
		darioSketch00TranslationXAnimation.timingFunctions = [easeOutTiming, easeOutTiming, easeOutTiming, easeOutTiming]
		darioSketch00TranslationXAnimation.beginTime = beginTime
		darioSketch00TranslationXAnimation.fillMode = fillMode
		darioSketch00TranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["dario_sketch00__root"]?.layer.add(darioSketch00TranslationXAnimation, forKey:"Untitled Animation_TranslationX")

		let darioSketch00TranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		darioSketch00TranslationYAnimation.duration = 139.453
		darioSketch00TranslationYAnimation.values = [31.203, 73.062, 31.203, 31.203] as [Float]
		darioSketch00TranslationYAnimation.keyTimes = [0.000, 0.003, 0.004, 1.000] as [NSNumber]
		darioSketch00TranslationYAnimation.timingFunctions = [easeOutTiming, easeOutTiming, easeOutTiming]
		darioSketch00TranslationYAnimation.beginTime = beginTime
		darioSketch00TranslationYAnimation.fillMode = fillMode
		darioSketch00TranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["dario_sketch00__root"]?.layer.add(darioSketch00TranslationYAnimation, forKey:"Untitled Animation_TranslationY")

		let pERCHIAZZIScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		pERCHIAZZIScaleXAnimation.duration = 139.453
		pERCHIAZZIScaleXAnimation.values = [0.916, 0.916, 1.010] as [Float]
		pERCHIAZZIScaleXAnimation.keyTimes = [0.000, 1.000, 1.000] as [NSNumber]
		pERCHIAZZIScaleXAnimation.timingFunctions = [instantTiming, instantTiming]
		pERCHIAZZIScaleXAnimation.beginTime = beginTime
		pERCHIAZZIScaleXAnimation.fillMode = fillMode
		pERCHIAZZIScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["PERCHIAZZI__xScale"]?.layer.add(pERCHIAZZIScaleXAnimation, forKey:"Untitled Animation_ScaleX")

		let stefy2RotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		stefy2RotationAnimation.duration = 139.453
		stefy2RotationAnimation.values = [0.000, 0.000, 0.000, 0.007, 0.007] as [Float]
		stefy2RotationAnimation.keyTimes = [0.000, 0.004, 0.018, 0.018, 1.000] as [NSNumber]
		stefy2RotationAnimation.timingFunctions = [easeOutTiming, instantTiming, instantTiming, easeOutTiming]
		stefy2RotationAnimation.beginTime = beginTime
		stefy2RotationAnimation.fillMode = fillMode
		stefy2RotationAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["stefy2__root"]?.layer.add(stefy2RotationAnimation, forKey:"Untitled Animation_Rotation")

		let stefy2OpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		stefy2OpacityAnimation.duration = 139.453
		stefy2OpacityAnimation.values = [0.000, 0.000, 0.000, 1.000, 1.000] as [Float]
		stefy2OpacityAnimation.keyTimes = [0.000, 0.004, 0.018, 0.018, 1.000] as [NSNumber]
		stefy2OpacityAnimation.timingFunctions = [easeOutTiming, instantTiming, instantTiming, easeOutTiming]
		stefy2OpacityAnimation.beginTime = beginTime
		stefy2OpacityAnimation.fillMode = fillMode
		stefy2OpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["stefy2__root"]?.layer.add(stefy2OpacityAnimation, forKey:"Untitled Animation_Opacity")

		let perky3OpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		perky3OpacityAnimation.duration = 139.453
		perky3OpacityAnimation.values = [0.000, 0.000, 0.000, 1.000, 1.000, 0.000, 0.000] as [Float]
		perky3OpacityAnimation.keyTimes = [0.000, 0.004, 0.018, 0.018, 0.025, 0.025, 1.000] as [NSNumber]
		perky3OpacityAnimation.timingFunctions = [easeOutTiming, instantTiming, instantTiming, instantTiming, instantTiming, easeOutTiming]
		perky3OpacityAnimation.beginTime = beginTime
		perky3OpacityAnimation.fillMode = fillMode
		perky3OpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["perky3__root"]?.layer.add(perky3OpacityAnimation, forKey:"Untitled Animation_Opacity")
	}

	func removeUntitledAnimation() {
		self.layer.removeAnimation(forKey: "UntitledAnimation")
		self.viewsByName["START__root"]?.layer.removeAnimation(forKey: "Untitled Animation_Opacity")
		self.viewsByName["perky1__root"]?.layer.removeAnimation(forKey: "Untitled Animation_Opacity")
		self.viewsByName["perky1__root"]?.layer.removeAnimation(forKey: "Untitled Animation_TranslationY")
		self.viewsByName["perky2__root"]?.layer.removeAnimation(forKey: "Untitled Animation_Opacity")
		self.viewsByName["stefy1__root"]?.layer.removeAnimation(forKey: "Untitled Animation_Opacity")
		self.viewsByName["dario_sketch00__root"]?.layer.removeAnimation(forKey: "Untitled Animation_TranslationX")
		self.viewsByName["dario_sketch00__root"]?.layer.removeAnimation(forKey: "Untitled Animation_TranslationY")
		self.viewsByName["PERCHIAZZI__xScale"]?.layer.removeAnimation(forKey: "Untitled Animation_ScaleX")
		self.viewsByName["stefy2__root"]?.layer.removeAnimation(forKey: "Untitled Animation_Rotation")
		self.viewsByName["stefy2__root"]?.layer.removeAnimation(forKey: "Untitled Animation_Opacity")
		self.viewsByName["perky3__root"]?.layer.removeAnimation(forKey: "Untitled Animation_Opacity")
	}

	// MARK: CAAnimationDelegate
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValue(forKey: anim)
			completion(flag)
		}
	}

	func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimation(forKey: "UntitledAnimation")
	}
}
