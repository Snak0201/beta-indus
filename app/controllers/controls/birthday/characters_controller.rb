class Controls::Birthday::CharactersController < AuthenticationController
  def index
    @characters = Birthday::Character.all
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
