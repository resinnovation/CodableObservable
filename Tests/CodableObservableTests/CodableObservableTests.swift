import XCTest
@testable import CodableObservable

final class CodableObservableTests: XCTestCase {
    let jsonEncoder = JSONEncoder()
    let jsonDecoder = JSONDecoder()

    func createObjects<T>(from object: T) -> (ObservableTestClass<T>, NonobservableTestClass<T>) where T: Codable & Equatable {
        return (ObservableTestClass(testVar: object), NonobservableTestClass(testVar: object))
    }

    func convertObjectsToJSON<T>(_ objects: (ObservableTestClass<T>, NonobservableTestClass<T>)) throws -> (Data, Data) where T:Codable {
        return (try jsonEncoder.encode(objects.0), try jsonEncoder.encode(objects.1))
    }

    func testStringCoding() throws {
        let objects = createObjects(from: "someString")
        let (a, b) = try convertObjectsToJSON(objects)
        XCTAssertEqual(a, b)

        let object = try jsonDecoder.decode(type(of: objects.0), from: a)
        XCTAssertEqual(object, objects.0)
    }

    func testIntEncoding() throws {
        let objects = createObjects(from: 1)
        let (a, b) = try convertObjectsToJSON(objects)
        XCTAssertEqual(a, b)

        let object = try jsonDecoder.decode(type(of: objects.0), from: a)
        XCTAssertEqual(object, objects.0)
    }

    func testComplexEncoding() throws {
        let complexObject = ComplexObject(stringA: "a", stringB: "b")

        let objects = createObjects(from: complexObject)
        let (a, b) = try convertObjectsToJSON(objects)
        XCTAssertEqual(a, b)

        let object = try jsonDecoder.decode(type(of: objects.0), from: a)
        XCTAssertEqual(object, objects.0)
    }
}
