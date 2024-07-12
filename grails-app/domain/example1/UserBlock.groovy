package example1

class UserBlock {

    static constraints = {
        email(blank: false, email: true)
        phone(blank: false)
        createdOn(nullable: false)
        updatedOn(nullable: false)
    }
    String email
    String phone
    Date createdOn
    Date updatedOn
    boolean isBlock = true
}
