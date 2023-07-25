module SessionsHelper
    # ログイン
    def log_in(user)
        session[:user_id] = user.id
    end
    # ログインユーザーを取得
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    # ログインユーザーの本人確認
    def current_user?(user)
        user == current_user
    end
    # ログイン確認
    def logged_in?
        !current_user.nil?        
    end
    # ログアウト
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
