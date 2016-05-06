class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.all
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
  end

  # GET /departments/new
  def new
    unless current_user.admin?
      flash[:alert] = "You cannot edit that department. Please request an admin to fulfill your request"
      redirect_to @departments
    end
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
    unless current_user.admin?
      flash[:alert] = "You cannot edit that department. Please request an admin to fulfill your request"
      redirect_to @departments
    end
  end

  # POST /departments
  # POST /departments.json
  def create
    unless current_user.admin?
      flash[:alert] = "You cannot edit that department. Please request an admin to fulfill your request"
      redirect_to @departments
    end
    
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    
    unless current_user.admin?
      flash[:alert] = "You cannot delete the department. Please request an admin to fulfill your request."
      redirect_to @departments
    end
    
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.fetch(:department, {}).permit(:title, :description)
    end
end
