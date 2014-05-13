class ReadingsController < ApplicationController
  def index
    @book = Book.new
    @reading = Reading.new
    @student = current_profile
    @readings = @student.readings.newest_first
  end

  def create
    title = params[:reading][:title]
    @book = Book.find_by(title: title)
    student_book_id = find_student_book_id
    Reading.create(reading_params.merge(student_book_id: student_book_id))
    redirect_to readings_path
  end

  private

  def reading_params
    params.require(:reading).permit(:amount_read)
  end

  def find_student_book_id
    StudentBook.find_by(
      book_id: @book.id,
      student_profile_id: current_profile.id
    ).id
  end
end
