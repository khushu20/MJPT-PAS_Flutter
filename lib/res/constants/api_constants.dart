import 'dart:core';

class ApiConstants {
  ApiConstants._();
  static const weather_Url = 'http://api.openweathermap.org/data/2.5/weather?';
  static const forecast_Url =
      'http://api.openweathermap.org/data/2.5/forecast?';
  static const String baseUrlMyGHMC =
      "https://19cghmc.cgg.gov.in/myghmcwebapi/";
  static const String baseUrlPetTypeMyGHMC = "https://19cghmc.cgg.gov.in/";
  static const String baseUrlCandD = "https://qaghmc.cgg.gov.in/CNDMAPI/CNDM/";
  static const String register_mobile = "Grievance/register_mobile";
  static const String ResendOTP = "Grievance/ResendOTP";


  static const String Endpoint_versioncheck_Android="Grievance/versionCheck";
  static const String Endpoint_versioncheck_IOS="Grievance/IosVersion_check";
  static const String Endpoint_propertyTax_circles="PropertyTax/circles";
  static const String Endpoint_proertyTax_searchPTINDetails="PropertyTax/searchPTINDetails";
  static const String Endpoint_Grievance_CategoryList="Grievance/CategoryList";
  static const String Endpoint_Grievance_SubCategoryList="Grievance/getSubCategoty";
  static const String Endpoint_Grievance_WhereAmI="Grievance/WhereAmI";
  static const String Endpoint_Locator="Grievance/getCircleOffices";
  static const String Endpoint_Grievance_insertGrievance="Grievance/insertGrievance";
  static const String Endpoint_Grievance_NearMeCList="Grievance/NearmeList";
  static const String Endpoint_Grievance_NearMeData="Grievance/getNearMeData";
  static const String Endpoint_pay_proertyTax_Dues_getPTINDetails="PropertyTax/getPTINDetails";
  static const String Endpoint_pay_proertyTax_Dues_proceedToPayment="PropertyTax/proceedToPayment";
  static const String Endpoint_proertyTax_searchTradeDetails="PropertyTax/searchTradeDetails";
  static const String Endpoint_Trade_License_PTN="TradeLicense/ptn";
  static const String Endpoint_Trade_License_Payment="TradeLicense/proceedToPayment";
  static const String Endpoint_TradeFee_Calculation="TradeLicense/TRADEFEECALCULATION";
  static const String Endpoint_Birth_Certificate="BirthDeath/GetBirthDetails";
  static const String Endpoint_Birth_Certificate_Download="BirthDeath/BirthDownloadPDF";
  static const String Endpoint_Death_Certificate="BirthDeath/GetDeathDetails";
  static const String Endpoint_Death_Certificate_Download="BirthDeath/DeathDownloadPDF";
  static const String Endpoint_get_Animal_Type="PetDogLicenceAPI/api/Master/GetPetType";
  static const String Endpoint_get_Ward="PetDogLicenceAPI/api/Master/GetWard";
  static const String Endpoint_download_license="PetDogLicenceAPI/api/GetData/ReprintData";
   static const String Endpoint_download_license_data="PetDogLicenceAPI/api/GetReprintData/DownloadData";
  static const String Endpoint_Lrs="LRS/lrs";
  static const String Endpoint_SubmitFormDataDetails="PetDogLicenceAPI/api/Upload/SubmitFormDataDetails";
  static const String Endpoint_mosquito_resultFlag="Mosquito/ResultFlag";
  static const String Endpoint_mosquito_result="Mosquito/Result";
  static const String Endpoint_mosquito_get_questions="Mosquito/getQuestions";
  static const String Endpoint_viewGrievances="Grievance/viewGrievances";
  static const String Endpoint_GrievanceStatus="Grievance/getGrievanceStatusCitizen";
  static const String Endpoint_grievance_show_notifications="Grievance/ShowNotifications";
  static const String Endpoint_get_userProfile="Grievance/getUserProfile";
  static const String Endpoint_grievance_del_userProfile="Grievance/deleteUserProfile";
  static const String Endpoint_swachDooth_getDetails="SwachDooth/getDetails";
  static const String Endpoint_idea_box="Grievance/IdeaBox";
  static const String Endpoint_where_am_i="Grievance/WhereAmI";
  static const String Endpoint_swachDooth_UploadLottery="SwachDooth/uploadlottery";
  static const String Endpoint_RemarkTypes="Grievance/getRemarkTypes";
  static const String Endpoint_PostFeedback="Grievance/postFeedback";

  static const String Endpoint_updateGrievance="Grievance/updateGrievance";

  static const String Endpoint_GET_DEMOGRAPHICS="GET_DEMOGRAPHICS";
  static const String Endpoint_GetVehicleTypes="GetVehicleTypes";
  static const String Endpoint_PendingList="CITIZEN_PENDING_LIST_DETAILS";
  static const String Endpoint_ProceedPay="CITIZEN_PROCEED_TO_PAY";
  static const String Endpoint_TicketDetails="GET_CITIZEN_RAISED_LIST";
  static const String Endpoint_RaiseRequestSubmit="CNDW_WASTE_RAISE_DETAILS";
  static const String Endpoint_grievance_insertUserProfile = "Grievance/insertUserProfile";

  static const String Endpoint_InfoBoxService = "Grievance/InfoBoxService";
  static const String Endpoint_Advertisement = "Grievance/AdvtBannerService";
  /* static const String Endpoint_versioncheck = "Grievance/insertUserProfile";
  static const String Endpoint_propertyTax_circles = "PropertyTax/circles";
  static const String Endpoint_proertyTax_searchPTINDetails =
      "PropertyTax/searchPTINDetails";
  static const String Endpoint_Grievance_CategoryList =
      "Grievance/CategoryList";
  static const String Endpoint_Grievance_SubCategoryList =
      "Grievance/getSubCategoty";
  static const String Endpoint_Grievance_WhereAmI = "Grievance/WhereAmI";
  static const String Endpoint_Grievance_insertGrievance =
      "Grievance/insertGrievance";
  static const String Endpoint_Grievance_NearMeCList = "Grievance/NearmeList";
  static const String Endpoint_Grievance_NearMeData = "Grievance/getNearMeData";
  static const String Endpoint_pay_proertyTax_Dues_getPTINDetails =
      "PropertyTax/getPTINDetails";
  static const String Endpoint_pay_proertyTax_Dues_proceedToPayment =
      "PropertyTax/proceedToPayment";
  static const String Endpoint_proertyTax_searchTradeDetails =
      "PropertyTax/searchTradeDetails";
  static const String Endpoint_Trade_License_PTN = "TradeLicense/ptn";
  static const String Endpoint_Trade_License_Payment =
      "TradeLicense/proceedToPayment";
  static const String Endpoint_TradeFee_Calculation =
      "TradeLicense/TRADEFEECALCULATION";
  static const String Endpoint_Birth_Certificate = "BirthDeath/GetBirthDetails";
  static const String Endpoint_Birth_Certificate_Download =
      "BirthDeath/BirthDownloadPDF";
  static const String Endpoint_Death_Certificate = "BirthDeath/GetDeathDetails";
  static const String Endpoint_Death_Certificate_Download =
      "BirthDeath/DeathDownloadPDF";
  static const String Endpoint_get_Animal_Type =
      "PetDogLicenceAPI/api/Master/GetPetType";
  static const String Endpoint_get_Ward = "PetDogLicenceAPI/api/Master/GetWard";
  static const String Endpoint_download_license =
      "PetDogLicenceAPI/api/GetData/ReprintData";
  static const String Endpoint_download_license_data =
      "PetDogLicenceAPI/api/GetReprintData/DownloadData";
  static const String Endpoint_Lrs = "LRS/lrs";
  static const String Endpoint_SubmitFormDataDetails =
      "PetDogLicenceAPI/api/Upload/SubmitFormDataDetails";
  static const String Endpoint_mosquito_resultFlag = "Mosquito/ResultFlag";
  static const String Endpoint_mosquito_result = "Mosquito/Result";
  static const String Endpoint_mosquito_get_questions = "Mosquito/getQuestions";
  static const String Endpoint_viewGrievances = "Grievance/viewGrievances";
  static const String Endpoint_GrievanceStatus =
      "Grievance/getGrievanceStatusCitizen";
  static const String Endpoint_grievance_show_notifications =
      "Grievance/ShowNotifications";
  static const String Endpoint_get_userProfile = "Grievance/getUserProfile";
  static const String Endpoint_grievance_del_userProfile =
      "Grievance/deleteUserProfile";
  static const String Endpoint_swachDooth_getDetails = "SwachDooth/getDetails";
  static const String Endpoint_idea_box = "Grievance/IdeaBox";
  static const String Endpoint_where_am_i = "Grievance/WhereAmI";
  static const String Endpoint_swachDooth_UploadLottery =
      "SwachDooth/uploadlottery";
  static const String Endpoint_RemarkTypes = "Grievance/getRemarkTypes";
  static const String Endpoint_PostFeedback = "Grievance/postFeedback";
  static const String Endpoint_updateGrievance = "Grievance/updateGrievance";
  static const String Endpoint_GET_DEMOGRAPHICS = "GET_DEMOGRAPHICS";
  static const String Endpoint_GetVehicleTypes = "GetVehicleTypes";
  static const String Endpoint_PendingList = "CITIZEN_PENDING_LIST_DETAILS";
  static const String Endpoint_ProceedPay = "CITIZEN_PROCEED_TO_PAY";
  static const String Endpoint_TicketDetails = "GET_CITIZEN_RAISED_LIST"; */



  // static const String Endpoint_GetVehicleTypes="GetVehicleTypes";
  // static const String Endpoint_GetVehicleTypes="GetVehicleTypes";
  // static const String Endpoint_GetVehicleTypes="GetVehicleTypes";
  // static const String Endpoint_mosquito_get_questions="Mosquito/getQuestions";
  static const String Endpoint_mosquito_insertPolls = "Mosquito/insertPolls";
  static const String Endpoint_grievance_weather_api = "Grievance/WeatherAPI";
  // static const String Endpoint_mosquito_get_questions="Mosquito/getQuestions";
  // static const String Endpoint_mosquito_get_questions="Mosquito/getQuestions";
  // static const String Endpoint_mosquito_get_questions="Mosquito/getQuestions";
  // static const String Endpoint_mosquito_get_questions="Mosquito/getQuestions";
}
