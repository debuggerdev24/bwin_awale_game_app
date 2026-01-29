import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AppAssets {
  AppAssets._();

  // icons
  static const _iconPath = "assets/icons";
  static const backArrow = "$_iconPath/backarrow.svg";
  static const checkbox = "$_iconPath/checkbox.svg";
  static const checkfill = "$_iconPath/checkfill.svg";
  static const google = "$_iconPath/google.svg";
  static const facebook = "$_iconPath/facebook.svg";
  static const password = "$_iconPath/password.svg";
  static const backicon = "$_iconPath/backicon.svg";
  static const hidepassword = "$_iconPath/hidepassword.svg";
  static const govermaent = "$_iconPath/pdf.svg";
  static const livepotrait = "$_iconPath/camera.svg";
  static const upload = "$_iconPath/upload.svg";
  static const camerawithoutfill = "$_iconPath/camerawithoutfill.svg";
  static const home = "$_iconPath/home.svg";
  static const wallet = "$_iconPath/wallet.svg";
  static const freinds = "$_iconPath/freinds.svg";
  static const arena = "$_iconPath/arena.svg";
  static const profile = "$_iconPath/profile.svg";
  static const play = "$_iconPath/play.svg";
  static const notification = "$_iconPath/notification.svg";
  static const friends = "$_iconPath/freinds.svg";
  static const bonus = "$_iconPath/bonus.svg";
  static const cupicon = "$_iconPath/cup.svg";
  static const select = "$_iconPath/select.svg";
  static const check = "$_iconPath/check.svg";
  static const game = "$_iconPath/game.svg";
  static const goal = "$_iconPath/goal.svg";
  static const close = "$_iconPath/close.svg";
  static const registration = "$_iconPath/registration.svg";
  static const arrowdown = "$_iconPath/arrowdown.svg";
  static const copy = "$_iconPath/copy.svg";
  static const arrowup = "$_iconPath/arrowup.svg";

  // images
  static const _imagePath = "assets/images";
  static const splashLogo = "$_imagePath/splashlogo.png";
  static const onboarding1 = "$_imagePath/onbording1.png";
  static const onboarding2 = "$_imagePath/onbroding2.png";
  static const onboarding3 = "$_imagePath/onbroding3.png";
  static const welcomeBackground = "$_imagePath/welcome.png";
  static const win = "$_imagePath/win.png";
  static const login = "$_imagePath/login.png";
  static const cup = "$_imagePath/cup.png";
  static const playwithfriends = "$_imagePath/playwithfriends.png";
  static const instantpayout = "$_imagePath/instantpayout.png";
  static const ageverification = "$_imagePath/ageverification.png";
  static const createaccount = "$_imagePath/createaccount.png";
  static const kycverification = "$_imagePath/kycverification.png";
  static const backgroundimage = "$_imagePath/backgroundimage.png";
  static const cameraclick = "$_imagePath/cameraclick.png";
  static const pocker = "$_imagePath/pocker.png";
  static const awale = "$_imagePath/awale.png";
  static const ballpool = "$_imagePath/ballpool.png";
  static const match = "$_imagePath/match.png";
  static const cardbord = "$_imagePath/cardbord.png";
  static const playbord = "$_imagePath/playbord.png";
}

class SvgIcon extends StatelessWidget {
  const SvgIcon(this.iconPath, {super.key, double size = 24, this.color})
    : width = size,
      height = size;
  final String iconPath;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: width,
      height: height,
      color: color,
    );
  }
}
