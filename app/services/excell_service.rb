class ExcellService

  def initialize (input)
    @input = input
  end

  def generate_file

    respond_to do |format|
      format.xlsx {
        response.headers[
            'Content-Disposition'
        ] = "attachment; filename='items.xlsx'"
      }
      format.html {render :output_excell}
    end
  end

end