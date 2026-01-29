import 'dart:io';

import 'package:bwin_awale_game_app/core/constants/app_assets.dart';
import 'package:bwin_awale_game_app/core/constants/app_color.dart';
import 'package:bwin_awale_game_app/core/constants/text_style.dart';
import 'package:bwin_awale_game_app/core/widgets/app_button.dart';
import 'package:bwin_awale_game_app/core/widgets/custom_app_bar.dart';
import 'package:bwin_awale_game_app/core/widgets/gradient_text.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FaceVerificationScreen extends StatefulWidget {
  const FaceVerificationScreen({super.key});

  @override
  State<FaceVerificationScreen> createState() => _FaceVerificationScreenState();
}

class _FaceVerificationScreenState extends State<FaceVerificationScreen>
    with SingleTickerProviderStateMixin {
  bool _isCaptured = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  CameraController? _controller;
  List<CameraDescription>? _cameras;
  XFile? _capturedImage;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        CameraDescription? frontCamera;
        for (var camera in _cameras!) {
          if (camera.lensDirection == CameraLensDirection.front) {
            frontCamera = camera;
            break;
          }
        }
        _controller = CameraController(
          frontCamera ?? _cameras![0],
          ResolutionPreset.medium,
          enableAudio: false,
        );

        await _controller!.initialize();
        if (mounted) {
          setState(() {
            _isCameraInitialized = true;
          });
        }
      }
    } catch (e) {
      debugPrint("Camera Error: $e");
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    try {
      final XFile image = await _controller!.takePicture();
      setState(() {
        _capturedImage = image;
        _isCaptured = true;
      });
      _animationController.stop();
    } catch (e) {
      debugPrint("Take Picture Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.h.verticalSpace,
              const CustomAppBar(title: "Face scan"),
              30.h.verticalSpace,
              Center(
                child: CustomGradientText(
                  text: "Face recognition",
                  style: AppTextStyles.textStyle16Medium.copyWith(
                    fontSize: 32.sp,
                  ),
                ),
              ),
              20.h.verticalSpace,
              Text(
                "Keep your face within the frame and ensure \ngood lighting.",
                textAlign: TextAlign.start,
                style: AppTextStyles.textStyle16Regular,
              ),
              50.h.verticalSpace,
              Center(
                child: SizedBox(
                  width: 350.w,
                  height: 350.h,
                  child: ChildStack(
                    isCaptured: _isCaptured,
                    isCameraInitialized: _isCameraInitialized,
                    controller: _controller,
                    capturedImage: _capturedImage,
                    animation: _animation,
                  ),
                ),
              ),
              40.h.verticalSpace,
              if (!_isCaptured)
                Center(
                  child: GestureDetector(
                    onTap: _takePicture,
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.buttonGradientStart,
                            AppColors.buttonGradientEnd,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SvgIcon(AppAssets.camerawithoutfill),
                      ),
                    ),
                  ),
                ),
              Spacer(),
              if (_isCaptured)
                Column(
                  children: [
                    AppButton(
                      text: "Analyze & Confirm",
                      onTap: () {
                        context.pushNamed(UserAppRoutes.tabScreen.name);
                      },
                    ),
                    16.h.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isCaptured = false;
                          _capturedImage = null;
                        });
                        _animationController.repeat(reverse: true);
                      },
                      child: Text(
                        "Retake photo",
                        style: AppTextStyles.textStyle14Regular.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),

              30.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class ChildStack extends StatelessWidget {
  final bool isCaptured;
  final bool isCameraInitialized;
  final CameraController? controller;
  final XFile? capturedImage;
  final Animation<double> animation;

  const ChildStack({
    super.key,
    required this.isCaptured,
    required this.isCameraInitialized,
    required this.controller,
    required this.capturedImage,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: FaceFramePainter(
              color: AppColors.buttonGradientStart,
              radius: 20.r,
              strokeWidth: 2.w,
              cornerLength: 80.w,
            ),
          ),
        ),
        Container(
          width: 220.w,
          height: 220.h,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(
            child: Container(
              color: const Color(0xFFF5F5F7),
              child: isCaptured && capturedImage != null
                  ? Image.file(File(capturedImage!.path), fit: BoxFit.cover)
                  : isCameraInitialized && controller != null
                  ? CameraPreview(controller!)
                  : const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
            ),
          ),
        ),
        // Scanning Line
        if (!isCaptured)
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Positioned(
                top: 50.h + (animation.value * 220.h),
                child: Container(
                  width: 220.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

class FaceFramePainter extends CustomPainter {
  final Color color;
  final double radius;
  final double strokeWidth;
  final double cornerLength;

  FaceFramePainter({
    required this.color,
    required this.radius,
    required this.strokeWidth,
    required this.cornerLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    // Top Left Corner
    path.moveTo(0, cornerLength);
    path.lineTo(0, radius);
    path.arcToPoint(Offset(radius, 0), radius: Radius.circular(radius));
    path.lineTo(cornerLength, 0);

    // Top Right Corner
    path.moveTo(size.width - cornerLength, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(
      Offset(size.width, radius),
      radius: Radius.circular(radius),
    );
    path.lineTo(size.width, cornerLength);

    // Bottom Right Corner
    path.moveTo(size.width, size.height - cornerLength);
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: Radius.circular(radius),
    );
    path.lineTo(size.width - cornerLength, size.height);

    // Bottom Left Corner
    path.moveTo(cornerLength, size.height);
    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: Radius.circular(radius),
    );
    path.lineTo(0, size.height - cornerLength);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
