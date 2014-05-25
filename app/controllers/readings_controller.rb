class ReadingsController < ApplicationController
  def index
    @book = Book.new
    @reading = Reading.new
    @readings = current_profile.readings.newest_first
    @reading_to_be_updated ||= reading_to_be_updated
  end

  def create
    student_book_id = find_student_book_id
    Reading.create(reading_params.merge(student_book_id: student_book_id))
    redirect_to readings_path
  end

  def update
    reading = Reading.find(params[:id])
    student_book_id = find_student_book_id
    reading.update(reading_params.merge(student_book_id: student_book_id))
    redirect_to readings_path
  end

  def destroy
    reading = Reading.find(params[:id])
    reading.destroy
    redirect_to readings_path
  end

  private

  def reading_to_be_updated
    if params[:readings_id]
      Reading.find(params[:readings_id])
    end
  end

  def reading_params
    params.require(:reading).permit(:amount_read)
  end

  def find_student_book_id
    title = params[:reading][:title]
    book = Book.find_by(title: title)
    StudentBook.find_or_create_by(
      book_id: book.id,
      student_profile_id: current_profile.id
    ).id
  end
end
