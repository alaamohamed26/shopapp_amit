
abstract class ShopStates{}


class InitialState extends ShopStates{}
class BottomNavigationBarItemChanged extends ShopStates{}

class HomeDataLoadingState extends ShopStates{}
class HomeDataSuccessState extends ShopStates{}
class CategoriesSuccessState extends ShopStates{}
class HomeDataErrorState extends ShopStates{}
class CategoriesErrorState extends ShopStates{}
class ClearCartState extends ShopStates{}
class AddedToCartState extends ShopStates{}