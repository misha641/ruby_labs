
class MedicinesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_medicine, only: %i[show edit update destroy]
  before_action :authorize_medicine!, only: %i[edit update destroy]
  before_action :authorize_admin!, only: :delete_all

  def index
    @medicines = Medicine.includes(:user, image_attachment: :blob).order(created_at: :desc)

    if params[:category].present?
      @medicines = @medicines.where(category: params[:category])
    end
  end

  def show
  end

  def new
    @medicine = current_user.medicines.build
  end

  def edit
  end

  def create
    @medicine = current_user.medicines.build(medicine_params)

    respond_to do |format|
      if @medicine.save
        format.html { redirect_to @medicine, notice: "Препарат успішно додано." }
        format.json { render :show, status: :created, location: @medicine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @medicine.update(medicine_params)
        format.html { redirect_to @medicine, notice: "Препарат оновлено.", status: :see_other }
        format.json { render :show, status: :ok, location: @medicine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @medicine.destroy!

    respond_to do |format|
      format.html { redirect_to medicines_path, notice: "Препарат видалено.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def delete_all
    Medicine.destroy_all
    redirect_to medicines_path, notice: "Усі препарати видалено.", status: :see_other
  end

  private

  def set_medicine
    @medicine = Medicine.find(params[:id])
  end

  def authorize_medicine!
    return if current_user.admin? || @medicine.user_id == current_user.id

    redirect_to medicines_path, alert: "Немає прав для цієї дії."
  end

  def authorize_admin!
    return if current_user.admin?

    redirect_to medicines_path, alert: "Доступ лише для адміністратора."
  end

  def medicine_params
    params.expect(medicine: %i[name category price description image])
  end
end
