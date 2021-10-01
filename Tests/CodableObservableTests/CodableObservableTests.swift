import XCTest
@testable import CodableObservable

final class CodableObservableTests: XCTestCase {

    typealias ObjectPair<T: Codable & Equatable> = (ObservableTestClass<T>, NonobservableTestClass<T>)

    let jsonEncoder = JSONEncoder()
    let jsonDecoder = JSONDecoder()

    func createObjects<T>(from object: T) -> ObjectPair<T> where T: Codable & Equatable {
        return (ObservableTestClass(testVar: object), NonobservableTestClass(testVar: object))
    }

    func convertObjectsToJSON<T>(_ objects: ObjectPair<T>) throws -> (Data, Data) where T: Codable {
        return (try jsonEncoder.encode(objects.0), try jsonEncoder.encode(objects.1))
    }

    func testStringCoding() throws {
        let objects = createObjects(from: "someString")
        let (objectA, objectB) = try convertObjectsToJSON(objects)
        XCTAssertEqual(objectA, objectB)

        let object = try jsonDecoder.decode(type(of: objects.0), from: objectA)
        XCTAssertEqual(object, objects.0)
    }

    func testIntEncoding() throws {
        let objects = createObjects(from: 1)
        let (objectA, objectB) = try convertObjectsToJSON(objects)
        XCTAssertEqual(objectA, objectB)

        let object = try jsonDecoder.decode(type(of: objects.0), from: objectA)
        XCTAssertEqual(object, objects.0)
    }

    func testComplexEncoding() throws {
        let complexObject = ComplexObject(stringA: "a", stringB: "b")

        let objects = createObjects(from: complexObject)
        let (objectA, objectB) = try convertObjectsToJSON(objects)
        XCTAssertEqual(objectA, objectB)

        let object = try jsonDecoder.decode(type(of: objects.0), from: objectA)
        XCTAssertEqual(object, objects.0)
    }
}
