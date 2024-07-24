import 'package:chartvault/home/view/home_screen.dart';
import 'package:chartvault/signals/models/signal_model.dart';
import 'package:chartvault/signals/view/signaldetail_screen.dart';
import 'package:chartvault/signin/signin_screen.dart';
import 'package:chartvault/signup/signup_screen.dart';
import 'package:chartvault/utils/authmanager.dart';
import 'package:go_router/go_router.dart';

const signinPage = '/signin';
const signupPage = '/signup';
const homePage = '/home';
const signalDetailPage = '/signaldetaildetail';

final GoRouter router = GoRouter(
  initialLocation: AuthManager.canLogin() ? homePage : signinPage,
  routes: [
    GoRoute(
      path: signinPage,
      builder: (context, state) => const SinginPage(),
    ),
    GoRoute(
      path: signupPage,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: homePage,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: signalDetailPage,
      builder: (context, state) =>
          SignalDetailScreen(record: state.extra as SignalRecord),
    ),
  ],
);
