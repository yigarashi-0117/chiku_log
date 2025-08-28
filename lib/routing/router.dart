import 'package:get/get.dart';
import '/ui/survey/view_model/survey_viewmodel.dart';
import '/ui/survey/widgets/survey_page.dart';
import '/routing/routes.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '/utils/log.dart';
import '/ui/top/widgets/top_page.dart';
import '/ui/top/view_model/top_viewmodel.dart';

List<GetPage> router = [
  GetPage(
    name: Routes.HOME,
    page: () => const TopPage(),
    binding: TopViewModelBinding(),
  ),
  GetPage(
    name: Routes.SURVEY,
    page: () => const SurveyPage(),
    binding: SurveyBinding(),
  ),
  GetPage(
    name: Routes.DEBUG,
    page: () => TalkerScreen(talker: Log().talker),
  ),
];