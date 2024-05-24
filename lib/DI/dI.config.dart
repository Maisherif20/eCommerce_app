// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data_layer/api_manager/apiManager.dart' as _i3;
import '../data_layer/dataSource_contract/addressDataSource.dart' as _i6;
import '../data_layer/dataSource_contract/authDataSource.dart' as _i8;
import '../data_layer/dataSource_contract/brandDataSource.dart' as _i24;
import '../data_layer/dataSource_contract/cartDataSource.dart' as _i4;
import '../data_layer/dataSource_contract/categoriesDataSource.dart' as _i10;
import '../data_layer/dataSource_contract/productDataSource.dart' as _i14;
import '../data_layer/dataSource_Implementation/addressDataSourceimpl.dart'
    as _i7;
import '../data_layer/dataSource_Implementation/authDataSourceImpl.dart' as _i9;
import '../data_layer/dataSource_Implementation/brandsDataSourceImpl.dart'
    as _i25;
import '../data_layer/dataSource_Implementation/cartDataSourceImpl.dart' as _i5;
import '../data_layer/dataSource_Implementation/categoriesDataSourceImpl.dart'
    as _i11;
import '../data_layer/dataSource_Implementation/productDataSourceImpl.dart'
    as _i15;
import '../data_layer/reposatory_implementation/addressReposatoryImpl.dart'
    as _i17;
import '../data_layer/reposatory_implementation/authReposatoryImpl.dart'
    as _i27;
import '../data_layer/reposatory_implementation/brandsReositoryImpl.dart'
    as _i34;
import '../data_layer/reposatory_implementation/cartReposatoryImpl.dart'
    as _i13;
import '../data_layer/reposatory_implementation/categoriesRepositoryImpl.dart'
    as _i23;
import '../data_layer/reposatory_implementation/productRepositoryImpl.dart'
    as _i19;
import '../domain_layer/Reposatory/addressReposatory.dart' as _i16;
import '../domain_layer/Reposatory/authReposatory.dart' as _i26;
import '../domain_layer/Reposatory/brandRepsositry.dart' as _i33;
import '../domain_layer/Reposatory/cartReposatory.dart' as _i12;
import '../domain_layer/Reposatory/categories_reposoitory.dart' as _i22;
import '../domain_layer/Reposatory/productRepository.dart' as _i18;
import '../domain_layer/Use%20case/addressUseCase.dart' as _i40;
import '../domain_layer/Use%20case/addToCartUseCase.dart' as _i20;
import '../domain_layer/Use%20case/addToWishListUseCase.dart' as _i30;
import '../domain_layer/Use%20case/authSignInUseCase.dart' as _i35;
import '../domain_layer/Use%20case/authSignupUseCase.dart' as _i36;
import '../domain_layer/Use%20case/authUpdateUserDataUseCase.dart' as _i38;
import '../domain_layer/Use%20case/authUpdateUserEmailUseCase.dart' as _i37;
import '../domain_layer/Use%20case/deleteProductUseCase.dart' as _i32;
import '../domain_layer/Use%20case/getAddressUseCase.dart' as _i41;
import '../domain_layer/Use%20case/getBrandsUseCase.dart' as _i42;
import '../domain_layer/Use%20case/getCartUseCase.dart' as _i21;
import '../domain_layer/Use%20case/getCategoriesUseCase.dart' as _i28;
import '../domain_layer/Use%20case/getProductUseCase.dart' as _i29;
import '../domain_layer/Use%20case/getUserWishList.dart' as _i31;
import '../domain_layer/Use%20case/updatePasswordUseCase.dart' as _i39;
import '../presentation_layer/ui/home/addToCart/addToCartViewModel.dart'
    as _i44;
import '../presentation_layer/ui/home/addToCart/getCartViewModel.dart' as _i46;
import '../presentation_layer/ui/home/tabs/CategoriesTab/categoryViewModel.dart'
    as _i49;
import '../presentation_layer/ui/home/tabs/homeTab/homeTabViewModel.dart'
    as _i54;
import '../presentation_layer/ui/home/tabs/ProductScreen/productViewModel.dart'
    as _i53;
import '../presentation_layer/ui/home/tabs/ProfileTab/addAddressViewModel.dart'
    as _i52;
import '../presentation_layer/ui/home/tabs/ProfileTab/getAddressViewModel.dart'
    as _i48;
import '../presentation_layer/ui/home/tabs/ProfileTab/profileTabViewModel.dart'
    as _i51;
import '../presentation_layer/ui/home/tabs/WishListTab/addToWishListViewModel.dart'
    as _i43;
import '../presentation_layer/ui/home/tabs/WishListTab/WishListViewModel.dart'
    as _i47;
import '../presentation_layer/ui/signIn/signInViewModel.dart' as _i45;
import '../presentation_layer/ui/signUp/signUpViewModel.dart' as _i50;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.CartDataSource>(
        () => _i5.CartDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.AddressDataSource>(
        () => _i7.AddressDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i8.AuthDataSource>(
        () => _i9.AuthDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i10.CategpriesDataSource>(
        () => _i11.CategoriesDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i12.CartReposatory>(() =>
        _i13.CartReposatoryImpl(cartDataSource: gh<_i4.CartDataSource>()));
    gh.factory<_i14.ProductDataSource>(
        () => _i15.ProductDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i16.AddressReposatory>(() => _i17.AddressReposatoryImpl(
        addressDataSource: gh<_i6.AddressDataSource>()));
    gh.factory<_i18.ProductRepository>(() => _i19.ProductRepositoryImpl(
        productDataSource: gh<_i14.ProductDataSource>()));
    gh.factory<_i20.AddToCartUseCase>(
        () => _i20.AddToCartUseCase(cartReposatory: gh<_i12.CartReposatory>()));
    gh.factory<_i21.GetCartUseCase>(
        () => _i21.GetCartUseCase(cartReposatory: gh<_i12.CartReposatory>()));
    gh.factory<_i22.CategoriesRepository>(() => _i23.CategoriesRepositoryImpl(
        categpriesDataSource: gh<_i10.CategpriesDataSource>()));
    gh.factory<_i24.BrandDataSource>(
        () => _i25.BrandsDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i26.AuthReposatory>(() =>
        _i27.AuthReposatoryImpl(authDataSource: gh<_i8.AuthDataSource>()));
    gh.factory<_i28.GetCategoriesUseCase>(() => _i28.GetCategoriesUseCase(
        categoriesRepository: gh<_i22.CategoriesRepository>()));
    gh.factory<_i29.GetProductUseCase>(() => _i29.GetProductUseCase(
        productRepository: gh<_i18.ProductRepository>()));
    gh.factory<_i30.AddToWishLstUseCase>(() => _i30.AddToWishLstUseCase(
        productRepository: gh<_i18.ProductRepository>()));
    gh.factory<_i31.GetUserWishListUseCase>(() => _i31.GetUserWishListUseCase(
        productRepository: gh<_i18.ProductRepository>()));
    gh.factory<_i32.DeleteProductUseCase>(() => _i32.DeleteProductUseCase(
        productRepository: gh<_i18.ProductRepository>()));
    gh.factory<_i33.BrandsRepository>(() =>
        _i34.BrandsRepositoryImpl(brandDataSource: gh<_i24.BrandDataSource>()));
    gh.factory<_i35.AuthSignInUseCase>(() =>
        _i35.AuthSignInUseCase(authReposatory: gh<_i26.AuthReposatory>()));
    gh.factory<_i36.AuthSignUpUseCase>(() =>
        _i36.AuthSignUpUseCase(authReposatory: gh<_i26.AuthReposatory>()));
    gh.factory<_i37.AuthUpdateUserEmailUseCase>(() =>
        _i37.AuthUpdateUserEmailUseCase(
            authReposatory: gh<_i26.AuthReposatory>()));
    gh.factory<_i38.AuthUpdateUserDataUseCase>(() =>
        _i38.AuthUpdateUserDataUseCase(
            authReposatory: gh<_i26.AuthReposatory>()));
    gh.factory<_i39.UpdatePasswordUseCase>(() =>
        _i39.UpdatePasswordUseCase(authReposatory: gh<_i26.AuthReposatory>()));
    gh.factory<_i40.AddressUseCase>(() =>
        _i40.AddressUseCase(addressReposatory: gh<_i16.AddressReposatory>()));
    gh.factory<_i41.GetAddressUseCase>(() => _i41.GetAddressUseCase(
        addressReposatory: gh<_i16.AddressReposatory>()));
    gh.factory<_i42.GetBrandsUseCase>(() =>
        _i42.GetBrandsUseCase(brandsRepository: gh<_i33.BrandsRepository>()));
    gh.factory<_i43.AddToWishListViewModel>(() => _i43.AddToWishListViewModel(
          addToWishLstUseCase: gh<_i30.AddToWishLstUseCase>(),
          getUserWishListUseCase: gh<_i31.GetUserWishListUseCase>(),
          deleteProductUseCase: gh<_i32.DeleteProductUseCase>(),
        ));
    gh.factory<_i44.AddToCartViewModel>(() =>
        _i44.AddToCartViewModel(addToCartUseCase: gh<_i20.AddToCartUseCase>()));
    gh.factory<_i45.SignInViewModel>(() =>
        _i45.SignInViewModel(authSignInUseCase: gh<_i35.AuthSignInUseCase>()));
    gh.factory<_i46.CartViewModel>(
        () => _i46.CartViewModel(getCartUseCase: gh<_i21.GetCartUseCase>()));
    gh.factory<_i47.WishListViewModel>(() => _i47.WishListViewModel(
          getUserWishListUseCase: gh<_i31.GetUserWishListUseCase>(),
          deleteProductUseCase: gh<_i32.DeleteProductUseCase>(),
        ));
    gh.factory<_i48.GetAddressViewModel>(() => _i48.GetAddressViewModel(
        getAddressUseCase: gh<_i41.GetAddressUseCase>()));
    gh.factory<_i49.CategoryTabViewModel>(() => _i49.CategoryTabViewModel(
        getCategoriesUseCase: gh<_i28.GetCategoriesUseCase>()));
    gh.factory<_i50.SignUpViewModel>(() =>
        _i50.SignUpViewModel(authSignUpUseCase: gh<_i36.AuthSignUpUseCase>()));
    gh.factory<_i51.ProfileTabViewModel>(() => _i51.ProfileTabViewModel(
          updateUserDataUseCase: gh<_i38.AuthUpdateUserDataUseCase>(),
          authUpdateUserEmailUseCase: gh<_i37.AuthUpdateUserEmailUseCase>(),
          updatePasswordUseCase: gh<_i39.UpdatePasswordUseCase>(),
        ));
    gh.factory<_i52.AddAddressViewModel>(() =>
        _i52.AddAddressViewModel(addressUseCase: gh<_i40.AddressUseCase>()));
    gh.factory<_i53.ProductViewModel>(() =>
        _i53.ProductViewModel(getProductUseCase: gh<_i29.GetProductUseCase>()));
    gh.factory<_i54.HomeTabViewModel>(() => _i54.HomeTabViewModel(
          getCategoriesUseCase: gh<_i28.GetCategoriesUseCase>(),
          getBrandsUseCase: gh<_i42.GetBrandsUseCase>(),
          getProductUseCase: gh<_i29.GetProductUseCase>(),
        ));
    return this;
  }
}
