class DocumentsController < ApplicationController
    before_action :set_document, only: [:edit, :update, :show, :destroy]



    def index
        @documents = Document.all
    end

    def new
        @document = Document.new
    end

    # New Document Creation
    def create
        @document = Document.new(document_params)
      
        if @document.save
          redirect_to documents_path, notice: "Document has been created successfully"
        else
          puts @document.errors.full_messages # Log error messages to the console
          render :new
        end
    end
    
    # Find existing Document information for edit
    def edit
    end

    def update
        if @document.update(document_params)
            redirect_to documents_path, notice: "Document information has been updated successfully"
        else
            puts @document.errors.full_messages
            render :edit
        end
    end

    # View particular Document information
    def show
    end

    # Delete particular Document by id 
    def destroy
        if @document.destroy
            redirect_to documents_path, notice: "Document information has been deleted successfully"
        end
    end

    private

    def document_params
        params.require(:document).permit(
            :name,
            :doc_type,
            :employee_id
        )
    end
      
    def set_document
        @document = Document.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
        redirect_to documents_path, notice: error
    end
end