class Helpers

    # Accepts session hash as arg, use user_id to find user in db and return that user
    def self.current_user(hash)
        @user = User.find(hash[:user_id])
    end

    def self.is_Logged_In?(hash)
        !!hash[:user_id]
    end

end