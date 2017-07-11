class PicturesController < ApplicationController
before_action :set_picture, only:[:edit, :update, :destroy]
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
   if @picture.save
     # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
     redirect_to pictures_path, notice: "ブログを作成しました！"
   else
     # 入力フォームを再描画します。
     render 'new'
   end
  end

  def edit
  end

  def update

      if @picture.update(pictures_params)
        redirect_to pictures_path, notice: "ブログを更新しました！"
      else
        render 'edit'
      end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "ブログを削除しました！"
 end

 def confirm
   @picture = Picture.new(pictures_params)
   render :new if @picture.invalid?
 end

  private
    def pictures_params
      params.require(:picture).permit(:title, :content)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
