class PicturesController < ApplicationController
before_action :set_picture, only:[:edit, :update, :destroy]
before_action :authenticate_user!

  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = Picture.new(pictures_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
   if @picture.save
     # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
     redirect_to pictures_path, notice: "instagramを作成しました！"
     NoticeMailer.sendmail_picture(@picture).deliver
   else
     # 入力フォームを再描画します。
     render 'new'
   end
  end

  def edit
  end

  def update

      if @picture.update(pictures_params)
        redirect_to pictures_path, notice: "instagramを更新しました！"
      else
        render 'edit'
      end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "instagramを削除しました！"
 end

 def confirm
   @picture = Picture.new(pictures_params)
   render :new if @picture.invalid?
 end

  private
    def pictures_params
      params.require(:picture).permit(:title, :content,:fot2_cache,:fot2)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
