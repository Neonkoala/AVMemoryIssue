AVMemoryIssue
=============

iOS 7 AVFoundation memory leak issue demo

Uses ZBar library for ease of reproducing but affects any AVCaptureSession

Install:

Use cocoapods to install ZBar library

`pod install`

Steps to reproduce:

1. Tap Barcode scanner
2. Tap cancel
3. Repeat until user interface locks up or app crashes

You should notice opening of barcode scanner gets steadily slower on each tap.

Tested on iPhone iOS 7.0b6
