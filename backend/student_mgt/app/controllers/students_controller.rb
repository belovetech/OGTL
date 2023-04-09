class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:success] = "Student successfully created"
      redirect_to students_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      flash[:notice] = "Student was Successfully updated."
      redirect_to students_path
    else
      flash[:alert] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:success] = 'Student was successfully deleted.'
      redirect_to students_path
    end
  end



  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email)
    end

end
