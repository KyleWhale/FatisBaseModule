//
//  HTClassPayUntils.swift
//  ProjectSwift
//
//  Created by wmz on 2023/7/17.
//

import Foundation
import StoreKit

typealias BLOCK_SKProductBlock = (_ var_object: SKProduct?)->Void
typealias BLOCK_SKProductListBlock = (_ var_object: [SKProduct])->Void
typealias BLOCK_SKPayResultBlock = (_ var_result:Bool)->Void
class HTClassPayUntils:NSObject{
    var var_check = false
    var var_currentPurchasedID:String?
    var var_payID:String?
    var var_payBlock:BLOCK_SKPayResultBlock?
    var var_payUseBlock = false
//    var var__restoreBlock
    var var_productBlock:BLOCK_SKProductBlock?
    var var_productListBlock:BLOCK_SKProductListBlock?
    var var_restoredArrauy:[SKPaymentTransaction] = []
    private override init() {

    }

    static let `default` = HTClassPayUntils()
    
    func ht_verifyProductsInFinishLaunching() {
        
        HTClassShare.default.ht_subscribe_maidian("1")
        HTClassShare.default.ht_updateVipWithBlock(var_source: "4", var_block: nil)
    }
    
    func ht_receipt() -> String? {
        
        let var_string = UserDefaults.standard.string(forKey: "udf_receiptString")
        if let var_string = var_string, !var_string.isEmpty {
            return var_string
        }
        let var_recepitURL = Bundle.main.appStoreReceiptURL
        if let var_recepitURL = var_recepitURL {
            let var_recepData = try? Data(contentsOf: var_recepitURL)
            return var_recepData?.base64EncodedString()
        }
        return nil
    }
    
    func ht_startPurchase(var_id:String?,var_handle:BLOCK_SKProductBlock?){
        var_currentPurchasedID = var_id
        var_productBlock = var_handle
        guard let var_currentPurchasedID = var_currentPurchasedID else { return }
        let var_request = SKProductsRequest(productIdentifiers: [var_currentPurchasedID])
        var_request.delegate = self
        var_request.start()
    }
    
    func ht_startPurchases(var_ids:Set<String>,var_handle:BLOCK_SKProductListBlock?){
        var_productListBlock = var_handle
        let var_request = SKProductsRequest(productIdentifiers:var_ids)
        var_request.delegate = self
        var_request.start()
    }
    
    func ht_payPurchase(var_id:String?,var_pay:BLOCK_SKPayResultBlock?){
        guard let var_id = var_id,SKPaymentQueue.canMakePayments() else {
            ht_result()
            return
        }
        var_payBlock = var_pay
        var_currentPurchasedID = var_id
        var_payUseBlock = true
        SKPaymentQueue.default().add(self)
        let var_request = SKProductsRequest(productIdentifiers: [var_id])
        var_request.delegate = self
        var_request.start()
    }
    
    func ht_restore(){
        if SKPaymentQueue.canMakePayments() {
            SKPaymentQueue.default().add(self)
            HTClassManage.ht_getCurrentVC().view.makeToastActivity(.center)
            SKPaymentQueue.default().restoreCompletedTransactions()
        }
    }
    
    
    static func ht_getLocalIntroductoryPrice(var_product:SKProduct) -> String{
        let var_format = NumberFormatter()
        var_format.formatterBehavior = .behavior10_4
        var_format.numberStyle = .currency
        if let var_introductoryPrice = var_product.introductoryPrice{
            var_format.locale = var_introductoryPrice.priceLocale
            let var_formatPrice = var_format.string(from: var_introductoryPrice.price)
            return var_formatPrice ?? ""
        } else{
            var_format.locale = var_product.priceLocale
            let var_formatPrice = var_format.string(from: var_product.price)
            return var_formatPrice ?? ""
        }
    }
    
    static func ht_getLocalPrice(var_product:SKProduct) -> String{
        let var_format = NumberFormatter()
        var_format.formatterBehavior = .behavior10_4
        var_format.numberStyle = .currency
        var_format.locale = var_product.priceLocale
        let var_formatPrice = var_format.string(from: var_product.price)
        return var_formatPrice ?? ""
    }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }
}

extension HTClassPayUntils:SKProductsRequestDelegate{
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let var_productArr = response.products
        if var_productArr.isEmpty {
            ht_result()
            return
        }
        
        if let var_productListBlock = var_productListBlock{
            var_productListBlock(var_productArr)
            self.var_productListBlock = nil
            return
        }
        
        guard let var_currentPurchasedID = var_currentPurchasedID else{
            ht_result()
            return
        }
        var var_p:SKProduct?
        for var_pp in var_productArr {
            if var_pp.productIdentifier == var_currentPurchasedID {
                var_p = var_pp
                break
            }
        }
        
        guard let var_p = var_p else{
            ht_result()
            return
        }
        
        if let var_productBlock = var_productBlock {
            request.cancel()
            var_productBlock(var_p)
            self.var_productBlock = nil
            return
        }
        if var_payUseBlock {
            let payment = SKPayment(product: var_p)
            SKPaymentQueue.default().add(payment)
            self.var_payUseBlock = false
        }
    }
    func request(_ request: SKRequest, didFailWithError error: Error) {
        ht_result()
    }
    
    func ht_verifyPurchaseWithPaymentTransaction(var_tran:SKPaymentTransaction?, _ var_produce:Bool = true) {
        let var_recepitURL = Bundle.main.appStoreReceiptURL
        guard let var_recepitURL = var_recepitURL else {
            ht_result()
            return
        }
        let var_receipt = try? Data(contentsOf: var_recepitURL)
        guard let var_receipt = var_receipt else {
            ht_result()
            return
        }
        var var_url = NSURL(string: STATIC_SANDBOX)
        if (var_produce) {
            var_url = NSURL(string: STATIC_AppStore)
        }
        let var_request = NSMutableURLRequest(url: var_url! as URL, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 10.0)
        var_request.httpMethod = ht_AsciiString("POST")
        let var_encodeStr = var_receipt.base64EncodedString(options: NSData.Base64EncodingOptions.endLineWithLineFeed)
        let var_dict = [ht_AsciiString("receipt-data") : var_encodeStr, ht_AsciiString("password") : STATIC_PAY] as [String : Any]
        let var_jsonData = try? JSONSerialization.data(withJSONObject: var_dict, options: .prettyPrinted)
        var_request.httpBody = var_jsonData;
        let var_session = URLSession.shared
        let var_dataTask = var_session.dataTask(with: var_request as URLRequest,
            completionHandler: {[weak self] data, response, error -> Void in
            guard let this = self else { return }
            if error != nil{
                this.ht_result()
                for var_transaction in SKPaymentQueue.default().transactions{
                    SKPaymentQueue.default().finishTransaction(var_transaction)
                }
            }else{
                if (data == nil) {
                    this.ht_result()
                    for var_transaction in SKPaymentQueue.default().transactions{
                        SKPaymentQueue.default().finishTransaction(var_transaction)
                    }
                }
                do{
                    let var_jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if (var_jsonResult.count != 0) {
                        if let var_status = var_jsonResult[ht_AsciiString("status")] as? Int, var_status == 21007 {
                            this.ht_verifyPurchaseWithPaymentTransaction(var_tran: var_tran, false)
                            return
                        }
                        if var_jsonResult[ht_AsciiString("receipt")] != nil{
                            if let var_patr = var_tran{
                                this.var_payID = var_patr.payment.productIdentifier
                                this.ht_result(var_result: true)
                            }else{
                                var var_date = 0.0
                                for var_tem in this.var_restoredArrauy{
                                    if let var_vdate = var_tem.transactionDate {
                                        if var_date < var_vdate.timeIntervalSince1970 {
                                            var_date = var_vdate.timeIntervalSince1970
                                            this.var_payID = var_tem.payment.productIdentifier
                                        }
                                    }
                                }
                                if let var_pro = this.var_payID {
                                    this.ht_payCheckServer(var_product: var_pro)
                                }
                            }
                            for var_transaction in SKPaymentQueue.default().transactions{
                                SKPaymentQueue.default().finishTransaction(var_transaction)
                            }
                        }else{
                            this.ht_result()
                            for var_transaction in SKPaymentQueue.default().transactions{
                                SKPaymentQueue.default().finishTransaction(var_transaction)
                            }
                        }
                    }
                }catch{
                    this.ht_result()
                    for var_transaction in SKPaymentQueue.default().transactions{
                        SKPaymentQueue.default().finishTransaction(var_transaction)
                    }
                }
            }
        }) as URLSessionTask
        var_dataTask.resume()
    }
    
    func ht_result(var_result:Bool = false){
        if let var_payBlock = var_payBlock {
            var_payBlock(var_result)
        }
    }
    
    func ht_payCheckServer(var_product:String){
        let var_recepitURL = Bundle.main.appStoreReceiptURL
        if let var_recepitURL = var_recepitURL {
            let var_recepData = try? Data(contentsOf: var_recepitURL)
            let var_recepit = var_recepData?.base64EncodedString()
            HTClassNetWordUntil().ht_request(url: 325,parameters: [ht_AsciiString("flag"):"1",ht_AsciiString("pid"):var_product,ht_AsciiString("receipt"):var_recepit ?? ""]) { result, response, error in
                if result {
                    HTClassShare.default.ht_updateVipWithBlock(var_source: "3") { var_pay in
                        DispatchQueue.main.async {
                            HTClassManage.ht_getCurrentVC().view.hideToastActivity()
                        }
                        if let var_pay = var_pay{
                            if var_pay.var_server?.var_val2 == "1" || var_pay.var_local?.var_value == "1" {
                                DispatchQueue.main.async {
                                    HTClassManage.ht_getCurrentVC().view.makeToast(ht_AsciiString("Restore Success!"))
                                }
                                HTClassPayUntils.default.var_payID = var_pay.var_local?.var_pid ?? var_product
                                UserDefaults.standard.set(var_pay.var_local?.var_pid ?? var_product, forKey: String.STATIC_paid_product)
                                NotificationCenter.default.post(name: .var_notification.var_paySuccess, object: nil)
                            }else{
                                DispatchQueue.main.async {
                                    HTClassManage.ht_getCurrentVC().view.makeToast(ht_AsciiString("Nothing Restore"))
                                }
                            }
                        }else{
                            DispatchQueue.main.async {
                                HTClassManage.ht_getCurrentVC().view.makeToast(ht_AsciiString("Nothing Restore"))
                            }
                        }
                    }
                }else{
                    DispatchQueue.main.async {
                        HTClassManage.ht_getCurrentVC().view.hideToastActivity()
                        HTClassManage.ht_getCurrentVC().view.makeToast(ht_AsciiString("Restore Fail!"))
                    }
                }
            }
        }
    }
}

extension HTClassPayUntils:SKPaymentTransactionObserver{
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        var_restoredArrauy = []
        for var_transaction in transactions {
            switch var_transaction.transactionState {
            case .purchased:
                ht_verifyPurchaseWithPaymentTransaction(var_tran:var_transaction)
                break
            case .purchasing:
                break
            case .restored:
                var_restoredArrauy.append(var_transaction)
                break
            case .failed:
                ht_failedTransaction(var_transaction: var_transaction)
                break
            default:
                break
            }
        }
    }
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        if !var_restoredArrauy.isEmpty {
            ht_verifyPurchaseWithPaymentTransaction(var_tran: nil)
        }else{
            DispatchQueue.main.async {
                HTClassManage.ht_getCurrentVC().view.makeToast(ht_AsciiString("Nothing Restore"))
            }
        }
    }
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        DispatchQueue.main.async {
            HTClassManage.ht_getCurrentVC().view.makeToast(ht_AsciiString("Restore Fail"))
        }
    }
    
    
    func ht_failedTransaction(var_transaction:SKPaymentTransaction){
        ht_result()
        SKPaymentQueue.default().finishTransaction(var_transaction)
    }
}
