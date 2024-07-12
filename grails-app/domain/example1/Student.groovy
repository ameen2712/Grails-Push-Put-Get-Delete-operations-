package example1

class Student {
    String firstname
    String lastname
    String address
    String email
    String pincode
    String state
    String nationality

    static constraints = {
        firstname(nullable: false, blank: false)
        lastname(nullable: false, blank: false)
        email(email: true, nullable: false, blank: false, unique: true)
        address(nullable: true, blank: true)
        pincode(nullable: true, blank: true)
        state(nullable: true, blank: true)
        nationality(nullable: true, blank: true)
    }
}