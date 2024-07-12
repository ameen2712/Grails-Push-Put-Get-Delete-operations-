package example1

class UserBlockController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserBlock.list(params), model: [userBlockCount: UserBlock.count()]
    }

    def show(Long id) {
        respond UserBlock.get(id)
    }

    def _createUserBlockModal() {
        respond new UserBlock(params)
    }


    def save() {
        def userBlock = new UserBlock(params)
        userBlock.createdOn = new Date()
        userBlock.updatedOn = new Date()

        if (params.isBlock == "true") {
            userBlock.isBlock = true
        } else if (params.isUnBlock == "true") {
            userBlock.isBlock = false
        }

        if (userBlock.hasErrors()) {
            respond userBlock.errors, view: 'index'
            return
        }

        userBlock.save(flush: true)
        flash.message = "User block created successfully."
        redirect action: "index"
    }

    def edit(Long id) {
        respond UserBlock.get(id)
    }

    def update(Long id) {
        def userBlock = UserBlock.get(id)
        if (!userBlock) {
            flash.message = "User not found"
            redirect action: "index"
            return
        }

        userBlock.properties = params
        userBlock.updatedOn = new Date()

        if (userBlock.hasErrors()) {
            respond userBlock.errors, view: 'edit'
            return
        }

        userBlock.save flush: true
        flash.message = "User details updated successfully."
        redirect action: "show", id: userBlock.id
    }
    def search() {
        println("calling")
        def searchParam = params?.q?.trim()
        if (!searchParam) {
            redirect action: "index"
            flash.message = "User details could'nt find."

            return
        }

        def userBlocks = UserBlock.createCriteria().list {
            or {
                like("email", "%${searchParam}%")
                like("phone", "%${searchParam}%")
            }
        }

        [userBlocks: userBlocks, searchParam: searchParam]
    }

    def delete(Long id) {
        def userBlock = UserBlock.get(id)
        if (!userBlock) {
            flash.message = "User not found"
            redirect action: "index"
            return
        }

        userBlock.delete flush: true
        flash.message = "User details deleted successfully."
        redirect action: "index"
    }
}
