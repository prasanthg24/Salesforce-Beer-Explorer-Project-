public class CartDetailAuraService
{
    
    private static List<Coupon__c> getCoupon(String Name){
        List<Coupon__c> coupon = [Select Id, Price__c  ,Expired__c,Remaining_Quantity__c, Total_Quantity__c From Coupon__c Where Name =: Name];
        return coupon;
    }
    
    @AuraEnabled
    public static Decimal checkCoupon(String Name, String CartId){
        List<Coupon__c> couponList =  getCoupon(Name);
        if(couponList !=null && couponList.size() > 0 && !couponList[0].Expired__c
          && couponList[0].Remaining_Quantity__c>0){
            Cart__c cart = new Cart__c(Id = cartId, Coupon__c =couponList[0].Id );
            update cart;
            return couponList[0].Price__c;
        }else{
            return null;
        }
    }
    
    @AuraEnabled
    public static String createCartItems(List<String> beerList, String cartId)
    {
        
        System.debug('beerList '+ beerList);
        System.debug('cartId '+ cartId);
        
        List<cart_Item__c> cartItemList = new List<cart_Item__c>();
        
        List<cart_Item__c> cartItemToUpdate = new List<cart_Item__c>();
        
        Map<Id, cart_Item__c> beerQntyMap = getCartItems(cartId);
        
        For(String beer : beerList){
            if(beerQntyMap != null && beerQntyMap.containsKey(beer))
            {
                cart_Item__c it = beerQntyMap.get(beer);
                cart_Item__c item = new cart_Item__c(
                    Item_Quantity__c = it.Item_Quantity__c+1,
                    Id = it.Id );
                
                cartItemToUpdate.add(item);
            }else{
                Integer Qty = 1;
                cart_Item__c item = new cart_Item__c(
                    Cart__c = cartId,
                    Beer__c = beer,
                    Item_Quantity__c = Qty
                );
                cartItemList.add(item);
            }
        }
        System.debug('#### insert '+ cartItemList);
        insert cartItemList;
        if(cartItemToUpdate != null && cartItemToUpdate.size() > 0){
            update cartItemToUpdate;
            System.debug('#### cartItemToUpdate '+ cartItemToUpdate);}
        return cartId;
        
        
    }
    
    @AuraEnabled 
    public static String getCartId(List<String> beerList){
        List<Cart__c> cartList = getCart();
        if(cartList != null && cartList.size() > 0){
            createCartItems(beerList, cartList[0].Id);
            system.debug('cartlist1:'+cartList[0].Id);
            
            return cartList[0].Id;
            
            
        }else{
            Cart__c cart = new Cart__c(Coupon__c = getCoupon('Default')[0].Id,Cart_Id__c=String.valueOf(Math.random()),
                                       Cart_Status__c='Open', Is_Active__c=true, User__c = UserInfo.getUserId());
            insert cart;
            createCartItems(beerList, cart.Id);
            return  cart.Id;
        }
    }
    private static List<Cart__c> getCart(){
        List<Cart__c> cartList = [Select Id, Name From Cart__c Where User__c=: UserInfo.getUserId() AND Is_Active__c = true];
        system.debug('cartlist:'+cartList);
        return cartList;
        
    }
    
    @AuraEnabled
    public static Map<Id, cart_Item__c> getCartItems(String CartId)
    {
        System.debug('getCartItems called cartId -  '+ CartId);
        
        List<Cart_Item__c> existingItemList = [Select Id, Name, Item_Quantity__c,Total_Amount1__c, Beer__c, Beer__r.Name From cart_Item__c 
                                               Where Cart__c =: cartId];
        
        Map<Id, Cart_Item__c> beerQntyMap = new Map<Id, cart_Item__c>();
        
        For(Cart_Item__c item : existingItemList)
        {
            if(!beerQntyMap.containsKey(item.Beer__c))
            {
                beerQntyMap.put(item.Beer__c, item);
            }
        }
        System.debug('Cart_Item__c  -  '+ existingItemList);
        return beerQntyMap;
    }
    
    @AuraEnabled
    public static void deleteItem(String CartItemId){
        Database.delete(CartItemId);
    }
    @AuraEnabled(cacheable=true)
    public static string fetchAddressBook ()
    {
        
        List<Address_Book__c> add = [SELECT Id, Name, City__c, State__c, Postal_Code__c, Country__c, Street__c, User__c,Email_ID__c
                                     FROM Address_Book__c   
                                     WHERE User__c=:userinfo.getUserId() ];
        return JSON.serialize(add);
    }
    
    @AuraEnabled
    public static string createOrder(String addressId, String cartId , String UserId,Decimal subTotal)
    {
        Order__c ord = new Order__c ();
        ord.Shipping__c = addressId;
        ord.Cart__c = cartId;
        ord.User__c = UserId;
        ord.Sub_Total__c =subTotal;
        
        cart__c cart = new cart__c();
        cart.Id = cartId;
        cart.Cart_Status__c = 'Closed';
        cart.Is_Active__c =false;
        
        insert ord;
        update cart;
        
        order__c output = [select Id,Name FROM Order__c WHERE Id=:ord.Id];
        
        return output.Name + '####' + output.Id;
        
    }    
    
    
}