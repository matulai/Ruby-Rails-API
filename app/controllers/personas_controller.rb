class PersonasController < ApplicationController
  before_action :set_persona, only: %i[ get_persona_by_id update_persona delete_persona]
  

  def get_all_personas
    render json: Persona.all
  end

  def get_persona_by_id
    render json: @persona.as_json(root: true), status: :ok, location: @persona
  end

  def add_persona
    @persona = Persona.new persona_params

    if @persona.save
      render json: @persona.as_json(root: true), status: :created, location: @persona
    else
      render json: { errors: @persona.errors }, status: :unprocessable_entity
    end
  end

  def update_persona
    if @persona.update persona_params
      render json: @persona.as_json(root: true), status: :ok, location: @persona
    else
      render json: @persona.errors, status: :unprocessable_entity
    end
  end

  def delete_persona
    Persona.destroy @persona.id
  end

  private

  def persona_params
    params.require(:persona).permit(:name, :age, :gender)
  end

  def set_persona
    @persona = Persona.find params[:id]
    render json: { errors: "persona not found" }, status: :unprocessable_entity unless @persona
  end

end
