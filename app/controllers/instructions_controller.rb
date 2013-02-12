class InstructionsController < ApplicationController
  def new
  end

  def index
    @instructions = Instruction.all
  end

  def import
    Instruction.import(params[:file])
    redirect_to instructions_path, notice: "Instructions imported."
  end
end
