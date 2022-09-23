//
//  MobileModel.swift
//  TestModel
//
//  Created by Yehor Kudin on 20.09.2022.
//

import Foundation

protocol MobileStorageProtocol {
    func getAll() -> Set<Mobile>
    func findByImei(_ imei: String) -> Mobile?
    func save(_ mobile: Mobile) throws -> Mobile
    func delete(_ product: Mobile) throws
    func exists(_ product: Mobile) -> Bool
}

class MobileStorage: MobileStorageProtocol{
    func getAll() -> Set<Mobile> {
        return mobiles
    }
    
    func findByImei(_ imei: String) -> Mobile? {
        mobiles.first {$0.imei == imei}
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        if mobiles.contains(mobile) { throw MobileStorageErrors.alreadyContains }
        mobiles.insert(mobile)
        return mobile
    }
    
    func delete(_ product: Mobile) throws {
        if !mobiles.contains(product) { throw MobileStorageErrors.nothingToDelete }
        mobiles.remove(product)
    }
    
    func exists(_ product: Mobile) -> Bool {
        mobiles.isEmpty
    }
    
    private var mobiles: Set<Mobile> = []
    
}

enum MobileStorageErrors: Error {
    case alreadyContains
    case nothingToDelete
}

struct Mobile: Hashable {
    let imei: String
    let model: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(imei)
    }
}















