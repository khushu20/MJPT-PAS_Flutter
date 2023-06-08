import 'package:flutter/cupertino.dart';
import 'package:my_ghmc/View/dashboard/Birth%20Certificate/pdf_view.dart';
import 'package:my_ghmc/View/dashboard/Check%20status/check_status.dart';
import 'package:my_ghmc/View/dashboard/Check%20status/closing_grievances.dart';
import 'package:my_ghmc/View/dashboard/Check%20status/grievance_details.dart';
import 'package:my_ghmc/View/dashboard/Check%20status/post_comment.dart';
import 'package:my_ghmc/View/dashboard/Check%20status/view_comments.dart';
import 'package:my_ghmc/View/dashboard/Grievances/grievances_types.dart';
import 'package:my_ghmc/View/dashboard/Grievances/locateon_map.dart';
import 'package:my_ghmc/View/dashboard/Grievances/new_complaint.dart';
import 'package:my_ghmc/View/dashboard/Birth%20Certificate/birth_validateOTP.dart';
import 'package:my_ghmc/View/dashboard/Know%20your%20Nearest%20Ward%20Office/nearest_ward_office.dart';
import 'package:my_ghmc/View/dashboard/Locator/locator.dart';
import 'package:my_ghmc/View/dashboard/Mosquito/mosquito.dart';
import 'package:my_ghmc/View/dashboard/Mosquito/mosquito_questions.dart';
import 'package:my_ghmc/View/dashboard/NearMe/nearme.dart';
import 'package:my_ghmc/View/dashboard/NearMe/nearme_settings.dart';
import 'package:my_ghmc/View/dashboard/Pet%20Animal%20License/app_for_pet_dog_license.dart';
import 'package:my_ghmc/View/dashboard/Pet%20Animal%20License/download_license.dart';
import 'package:my_ghmc/View/dashboard/Pet%20Animal%20License/search_download_license.dart';
import 'package:my_ghmc/View/dashboard/SideBar/sideBar_my_property.dart';
import 'package:my_ghmc/View/dashboard/Trade%20License/know_search_TIN_details.dart';
import 'package:my_ghmc/View/dashboard/Trade%20License/trade_license_due_details.dart';
import 'package:my_ghmc/View/dashboard/WeatherAlert/weather_alert_view.dart';
import 'package:my_ghmc/View/dashboard/WhereAmI/custominfo.dart';
import 'package:my_ghmc/View/dashboard/WhereAmI/where_am_i.dart';
import 'package:my_ghmc/View/dashboard/construction_demolition_waste/c_and_d_waste.dart';
import 'package:my_ghmc/View/dashboard/construction_demolition_waste/payment_pending.dart';
import 'package:my_ghmc/View/dashboard/construction_demolition_waste/paymentfor_waste.dart';
import 'package:my_ghmc/View/dashboard/construction_demolition_waste/proceed_pay.dart';
import 'package:my_ghmc/View/dashboard/construction_demolition_waste/raise_cd_wasteRequest.dart';
import 'package:my_ghmc/View/dashboard/Birth%20Certificate/birth_certificate.dart';
import 'package:my_ghmc/View/dashboard/LRS/lrs.dart';
import 'package:my_ghmc/View/dashboard/Pet%20Animal%20License/pet_dog_license.dart';
import 'package:my_ghmc/View/dashboard/Swachh%20Dooth/swachh_dooth.dart';
import 'package:my_ghmc/View/dashboard/Trade%20License/tin_calculation.dart';
import 'package:my_ghmc/View/dashboard/Trade%20License/trade_license_details.dart';
import 'package:my_ghmc/View/dashboard/construction_demolition_waste/raised_ticketdetails.dart';
import 'package:my_ghmc/View/dashboard/propertyTax/know_your_PTIN.dart';
import 'package:my_ghmc/View/dashboard/propertyTax/pay_property_tax.dart';
import 'package:my_ghmc/View/dashboard/propertyTax/payment_citrus.dart';
import 'package:my_ghmc/View/dashboard/propertyTax/payment_page.dart';
import 'package:my_ghmc/View/dashboard/propertyTax/payment_razor.dart';
import 'package:my_ghmc/View/dashboard/propertyTax/property_tax.dart';
import 'package:my_ghmc/View/dashboard/propertyTax/property_tax_dues_skip.dart';
import 'package:my_ghmc/View/dashboard/propertyTax/property_tax_dues_validateOTP.dart';
import 'package:my_ghmc/View/login_otp_view.dart';
import 'package:my_ghmc/View/login_view.dart';
import 'package:my_ghmc/View/splash_view.dart';
import 'package:my_ghmc/View/themes.dart';
import 'package:my_ghmc/model/WeatherModel/forecast_response.dart';
import 'package:my_ghmc/res/Routes/App_routes.dart';
import 'package:my_ghmc/res/components/CustomAlerts/alert_for_image_picker.dart';
import '../../View/dashboard/Death certificate/death_certificate.dart';
import '../../View/dashboard/Death certificate/death_validateOTP.dart';
import '../../View/dashboard/LRS/lrs_app_status.dart';
import '../../View/dashboard/Mosquito/mosquito_status.dart';
import '../../View/dashboard/SideBar/help.dart';
import '../../View/dashboard/SideBar/idea_box.dart';
import '../../View/dashboard/SideBar/privacy_policy.dart';
import '../../View/dashboard/SideBar/show_notifications.dart';
import '../../View/dashboard/SideBar/sidebar_my_trade.dart';
import '../../View/dashboard/SideBar/terms_and_conditions.dart';
import '../../View/dashboard/Swachh Dooth/swach_dooth_view_details.dart';
import '../../View/dashboard/Trade License/know_your_tin.dart';
import '../../View/dashboard/Trade License/trade_license.dart';
import '../../View/dashboard/cgg_webview.dart';
import '../../View/dashboard/dashboard.dart';
import '../../View/dashboard/myGHMC_webview.dart';
import '../../View/dashboard/propertyTax/know_Search_ptin_details.dart';
import '../../View/dashboard/weather_tab.dart';
import '../../View/dynamic_radio_buttons.dart';
import '../../View/t_app_webview.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.CDwaste: ((context) => C_D_Waste()),
      AppRoutes.CDWasteReq: ((context) => RaiseCDWasteReq()),
      AppRoutes.Paymentpending: ((context) => PaymentPending()),
      AppRoutes.RaisedTicketDetails:((context) => RaisedTicketDetails() ),
      AppRoutes.grievancestypes: ((context) => GrievancesTypes()),
      AppRoutes.dashboard: ((context) => dashboard()),
      AppRoutes.login_view: ((context) => LoginView()),
      AppRoutes.OtpPage: ((context) => OtpPage()),
      AppRoutes.SplashView: ((context) => SplashView()),
      AppRoutes.propertyTax: ((context) => propertyTax()),
      AppRoutes.KnowYourPTIN: ((context) => KnowYourPTIN()),
      AppRoutes.PayPropertyTax: ((context) => PayPropertyTax()),
      AppRoutes.TradeLicense: ((context) => TradeLicense()),
      AppRoutes.KnowYourTin: ((context) => KnowYourTin()),
      AppRoutes.TinCalculation: ((context) => TinCalculation()),
      AppRoutes.TradeLicenseDetails: ((context) => TradeLicenseDetails()),
      AppRoutes.BirthCertificate: ((context) => BirthCertificate()),

      AppRoutes.DeathCertificate: ((context) => DeathCertificate()),
      AppRoutes.Lrs: ((context) => Lrs()),
      AppRoutes.SwachhDooth: ((context) => SwachhDooth()),
      AppRoutes.PetDogLicense: ((context) => PetDogLicense()),
      AppRoutes.NewComplaint: ((context) => NewComplaint()),
      AppRoutes.locateONMap: ((context) => LocateOnMap()),
      // AppRoutes.KnowYourTin: ((context) => KnowYourTin()),
      AppRoutes.KnowSearchPTINDetails: ((context) => KnowSearchPTINDetails()),
      AppRoutes.PropertyTaxDuesValidateOTP: ((context) =>
          PropertyTaxDuesValidateOTP()),
      AppRoutes.PropertyTaxDuesSkip: ((context) => PropertyTaxDuesSkip()),
      AppRoutes.PaymentRazor: ((context) => PaymentRazor()),
      AppRoutes.PaymentCitrus: ((context) => PaymentCitrus()),
      AppRoutes.PaymentPage: ((context) => PaymentPage()),
      AppRoutes.KnowSearchTINDetails: ((context) => KnowSearchTINDetails()),
      AppRoutes.TradeLicenseDueDetails: ((context) => TradeLicenseDueDetails()),
      AppRoutes.BirthValidateOTP: ((context) => BirthValidateOTP()),
      AppRoutes.whereami: ((context) => WhereAmI()),
      AppRoutes.nearme: ((context) => NearMe()),
      AppRoutes.nearmeCList: ((context) => NearMeCList()),
      AppRoutes.weatherAlert: ((context) => WeatherAlert()),
      AppRoutes.CheckStatus: ((context) => CheckStatus()),
      AppRoutes.PdfViewer: ((context) => PdfViewer()),
      AppRoutes.ImagePickerAlert: ((context) => ImagePickerAlert()),
      AppRoutes.AppForPetDogLicense: ((context) => AppForPetDogLicense()),
      AppRoutes.DownloadLicense: ((context) => DownloadLicense()),
      AppRoutes.SearchDownloadLicense: ((context) => SearchDownloadLicense()),
      AppRoutes.LrsAppStatus: ((context) => LrsAppStatus()),
      AppRoutes.Mosquito: ((context) => Mosquito()),
      AppRoutes.MosquitoQuestions: ((context) => MosquitoQuestions()),
      AppRoutes.MosquitoStatus: ((context) => MosquitoStatus()),
      AppRoutes.ShowNotifications: ((context) => ShowNotifications()),
      AppRoutes.SideBarMyProperty: ((context) => SideBarMyProperty()),
      AppRoutes.SideBarMyTrade: ((context) => SideBarMyTrade()),
      AppRoutes.SwachDoothViewDetails: ((context) => SwachDoothViewDetails()),
      AppRoutes.SideBarIdeaBox: ((context) => SideBarIdeaBox()),
      AppRoutes.Help: ((context) => Help()),
      AppRoutes.TermsAndCondtitons: ((context) => TermsAndCondtitons()),
      AppRoutes.PrivacyPolicy: ((context) => PrivacyPolicy()),
      AppRoutes.CggWebview: ((context) => CggWebview()),
      AppRoutes.MyGHMCWebview: ((context) => MyGHMCWebview()),
      AppRoutes.Themes: ((context) => Themes()),
      AppRoutes.DynamicRadioButtons: ((context) => DynamicRadioButtons()),
      AppRoutes.DeathValidateOTP: ((context) => DeathValidateOTP()),
      AppRoutes.WeatherTab: ((context) => WeatherTab()),
      AppRoutes.GrievanceDetails: ((context) => GrievanceDetails()),
      AppRoutes.ClosingGrievance: ((context) => ClosingGrievance()),
      AppRoutes.ViewComments: ((context) => ViewComments()),
      AppRoutes.PostComments: ((context) => PostComments()),
      AppRoutes.PaymentForWaste:((context) => PaymentForWaste() ),
      AppRoutes.ProceedPay:((context) => ProceedPay() ),

      AppRoutes.Locator:((context) => Locator() ),
      AppRoutes.MyMapScreen:((context) => MyMapScreen()),


      AppRoutes.NearestWardOffice:((context) => NearestWardOffice()),

      AppRoutes.TAppWebview:((context) => TAppWebview()),

     
     
      
      
    };
  }
}
