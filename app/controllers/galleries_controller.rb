class GalleriesController < ApplicationController

before_action :authenticate_amitian!

def create
	@amitian = Amitian.find(current_amitian.id)
@gallery = current_amitian.create_gallery(gallery_params)
if @gallery.save
	redirect_to @amitian
end
end

def edit

@gallery = Gallery.find(params[:id])

if current_amitian.gallery.id !=  @gallery.id
redirect_to root_path
end
end

def update
@gallery = Gallery.find(params[:id])

if @gallery.update(gallery_params)
	redirect_to current_amitian
else
	render 'edit'
end
end

private

def gallery_params
params.require(:gallery).permit(:g1,:g2,:g3,:g4,:g5,:g6,:amitian_id)
end

end
