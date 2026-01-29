import 'package:bwin_awale_game_app/core/extensions/routes_extensions.dart';
import 'package:bwin_awale_game_app/routes/user_routes.dart';
import 'package:bwin_awale_game_app/screens/auth/create_new_password_screen.dart';
import 'package:bwin_awale_game_app/screens/auth/forgot_password_screen.dart';
import 'package:bwin_awale_game_app/screens/auth/login_screen.dart';
import 'package:bwin_awale_game_app/screens/auth/otp_verification_screen.dart';
import 'package:bwin_awale_game_app/screens/auth/signup_screen.dart';
import 'package:bwin_awale_game_app/screens/kyc/face_verification_screen.dart';
import 'package:bwin_awale_game_app/screens/onbordings_flow/age_verification_screen.dart';
import 'package:bwin_awale_game_app/screens/onbordings_flow/onbording_screen.dart';
import 'package:bwin_awale_game_app/screens/onbordings_flow/welcome_screen.dart';
import 'package:bwin_awale_game_app/screens/kyc/id_upload_screen.dart';
import 'package:bwin_awale_game_app/screens/kyc/kyc_verification_screen.dart';
import 'package:bwin_awale_game_app/screens/tabs/tab_screen.dart';
import 'package:bwin_awale_game_app/screens/notification/notification_screen.dart';
import 'package:bwin_awale_game_app/screens/splash/splash_screen.dart';
import 'package:bwin_awale_game_app/screens/wallet/add_money_screen.dart';
import 'package:bwin_awale_game_app/screens/game/create_bet_screen.dart';
import 'package:bwin_awale_game_app/screens/game/match_waiting_screen.dart';
import 'package:bwin_awale_game_app/screens/game/awale_game_screen.dart';
import 'package:bwin_awale_game_app/screens/game/poker_game_screen.dart';
import 'package:bwin_awale_game_app/screens/game/pool_game_screen.dart';
import 'package:bwin_awale_game_app/screens/arena/arena_screen.dart';
import 'package:bwin_awale_game_app/screens/arena/tournament_details_screen.dart';
import 'package:bwin_awale_game_app/screens/arena/registration_success_screen.dart';
import 'package:bwin_awale_game_app/screens/game/game_result_screen.dart';
import 'package:bwin_awale_game_app/screens/wallet/payout_complete_screen.dart';
import 'package:bwin_awale_game_app/screens/wallet/withdraw_screen.dart';
import 'package:bwin_awale_game_app/screens/wallet/withdraw_success_screen.dart';
import 'package:bwin_awale_game_app/screens/friends/invite_friends_screen.dart';

import 'package:go_router/go_router.dart';

class UserAppRoute {
  static final GoRouter goRouter = GoRouter(
    initialLocation: UserAppRoutes.tabScreen.path,
    routes: routes,
  );

  static final List<RouteBase> routes = [
    GoRoute(
      path: UserAppRoutes.splashScreen.path,
      name: UserAppRoutes.splashScreen.name,
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.onbordingScreen.path,
      name: UserAppRoutes.onbordingScreen.name,
      builder: (context, state) {
        return OnbordingScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.welcomeScreen.path,
      name: UserAppRoutes.welcomeScreen.name,
      builder: (context, state) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.ageVerificationScreen.path,
      name: UserAppRoutes.ageVerificationScreen.name,
      builder: (context, state) {
        return const AgeVerificationScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.loginScreen.path,
      name: UserAppRoutes.loginScreen.name,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.forgotPasswordScreen.path,
      name: UserAppRoutes.forgotPasswordScreen.name,
      builder: (context, state) {
        return const ForgotPasswordScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.otpVerificationScreen.path,
      name: UserAppRoutes.otpVerificationScreen.name,
      builder: (context, state) {
        return const OtpVerificationScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.signupScreen.path,
      name: UserAppRoutes.signupScreen.name,
      builder: (context, state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.createNewPasswordScreen.path,
      name: UserAppRoutes.createNewPasswordScreen.name,
      builder: (context, state) {
        return const CreateNewPasswordScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.kycVerification.path,
      name: UserAppRoutes.kycVerification.name,
      builder: (context, state) {
        return const KycVerificationScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.idUpload.path,
      name: UserAppRoutes.idUpload.name,
      builder: (context, state) {
        return const IdUploadScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.faceVerification.path,
      name: UserAppRoutes.faceVerification.name,
      builder: (context, state) {
        return const FaceVerificationScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.tabScreen.path,
      name: UserAppRoutes.tabScreen.name,
      builder: (context, state) {
        return const TabScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.notificationScreen.path,
      name: UserAppRoutes.notificationScreen.name,
      builder: (context, state) {
        return const NotificationScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.addmoneyScreen.path,
      name: UserAppRoutes.addmoneyScreen.name,
      builder: (context, state) {
        return const AddMoneyScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.createBetScreen.path,
      name: UserAppRoutes.createBetScreen.name,
      builder: (context, state) {
        return const CreateBetScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.matchWaitingScreen.path,
      name: UserAppRoutes.matchWaitingScreen.name,
      builder: (context, state) {
        return const MatchWaitingScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.gameAwale.path,
      name: UserAppRoutes.gameAwale.name,
      builder: (context, state) {
        return const AwaleGameScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.gamePoker.path,
      name: UserAppRoutes.gamePoker.name,
      builder: (context, state) {
        return const PokerGameScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.gamePool.path,
      name: UserAppRoutes.gamePool.name,
      builder: (context, state) {
        return const PoolGameScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.gameResultScreen.path,
      name: UserAppRoutes.gameResultScreen.name,
      builder: (context, state) {
        final didWin = state.extra as bool? ?? true;
        return GameResultScreen(didWin: didWin);
      },
    ),
    GoRoute(
      path: UserAppRoutes.payoutCompleteScreen.path,
      name: UserAppRoutes.payoutCompleteScreen.name,
      builder: (context, state) {
        return const PayoutCompleteScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.arenaScreen.path,
      name: UserAppRoutes.arenaScreen.name,
      builder: (context, state) {
        return const ArenaScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.tournamentDetails.path,
      name: UserAppRoutes.tournamentDetails.name,
      builder: (context, state) {
        return const TournamentDetailsScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.registrationSuccess.path,
      name: UserAppRoutes.registrationSuccess.name,
      builder: (context, state) {
        return const RegistrationSuccessScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.withdrawScreen.path,
      name: UserAppRoutes.withdrawScreen.name,
      builder: (context, state) {
        return const WithdrawScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.withdrawSuccessScreen.path,
      name: UserAppRoutes.withdrawSuccessScreen.name,
      builder: (context, state) {
        return const WithdrawSuccessScreen();
      },
    ),
    GoRoute(
      path: UserAppRoutes.inviteFriendsScreen.path,
      name: UserAppRoutes.inviteFriendsScreen.name,
      builder: (context, state) {
        return const InviteFriendsScreen();
      },
    ),
  ];
}
