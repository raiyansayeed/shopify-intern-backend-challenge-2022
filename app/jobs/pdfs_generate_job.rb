class PdfsGenerateJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    puts "****************************************"
    puts "************** DONE !!!!!!! *************"
    puts "****************************************"
    puts "Email should sent to :  #{@user_email}"
    puts "Diary Id:  #{@diary_id}"
    puts "****************************************"
    
    # Sending the email
    DownloadPdfReportMailer.send_download_pdf_link(@user_email, @folder, @file_name).deliver_now
  end

  def perform(html, folder, file_name, user_email, year, diary, year_start_date, year_end_date)
    pdf = WickedPdf.new.pdf_from_string(html)
    file_name = "#{file_name}-#{year}"
    save_path = Rails.root.join("public/export/#{folder}","#{file_name}.pdf")
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
    @user_email = user_email
    @diary_id = diary.id
    @folder = folder
    @file_name = file_name
  end
end
