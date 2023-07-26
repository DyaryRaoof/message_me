class MessagesController < ApplicationController
    def create
        puts "H# #{message_params}"
        @message = Message.new(message_params)
        @message.user = current_user
        if @message.save
            redirect_back(fallback_location: root_path)
        else
            flash[:error] = "Could not send message"
        end
    end


    private
    def message_params
        params.require(:message).permit(:body)
    end
end
