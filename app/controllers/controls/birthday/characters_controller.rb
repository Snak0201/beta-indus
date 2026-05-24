class Controls::Birthday::CharactersController < AuthenticationController
  def index
    @characters = Birthday::Character.preload(:brand)
  end

  def new
    @character = Birthday::Character.new
    set_brands
  end

  def create
    @character = Birthday::Character.new(character_params)

    if @character.save
      redirect_to controls_birthday_characters_path, notice: "キャラクターを作成しました。"
    else
      set_brands
      flash.now[:alert] = @character.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @character = Birthday::Character.find(params[:id])
    set_brands
  end

  def update
    @character = Birthday::Character.find(params[:id])

    if @character.update(character_params)
      redirect_to controls_birthday_characters_path, notice: "キャラクターを更新しました。"
    else
      set_brands
      flash.now[:alert] = @character.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    character = Birthday::Character.find(params[:id])
    character.destroy!

    redirect_to controls_birthday_characters_path, notice: "キャラクターを削除しました。"
  end

  private

  def character_params
    params.require(:birthday_character).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :born_on,
      :color,
      :birthday_brand_id
    )
  end

  def set_brands
    @brands = Birthday::Brand.all
  end
end
