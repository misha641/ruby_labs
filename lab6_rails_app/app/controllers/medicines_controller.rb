class MedicinesController < ApplicationController
  before_action :set_medicine, only: %i[ show edit update destroy ]

  # GET /medicines or /medicines.json
def index
  @medicines = Medicine.all

  if params[:category].present?
    @medicines = @medicines.where(category: params[:category])
  end
end

  # GET /medicines/1 or /medicines/1.json
  def show
  end

  # GET /medicines/new
  def new
    @medicine = Medicine.new
  end

  # GET /medicines/1/edit
  def edit
  end

  # POST /medicines or /medicines.json
  def create
    @medicine = Medicine.new(medicine_params)

    respond_to do |format|
      if @medicine.save
        format.html { redirect_to @medicine, notice: "Medicine was successfully created." }
        format.json { render :show, status: :created, location: @medicine }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @medicine.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /medicines/1 or /medicines/1.json
  def update
    respond_to do |format|
      if @medicine.update(medicine_params)
        format.html { redirect_to @medicine, notice: "Medicine was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @medicine }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @medicine.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /medicines/1 or /medicines/1.json
  def destroy
    @medicine.destroy!

    respond_to do |format|
      format.html { redirect_to medicines_path, notice: "Medicine was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end
  
def delete_all
  Medicine.delete_all
  redirect_to medicines_path, notice: "Усі препарати успішно видалено."
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicine
      @medicine = Medicine.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def medicine_params
      params.expect(medicine: [ :name, :category, :price ])
    end
end
