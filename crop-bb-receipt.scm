
(define (crop-bb-receipt infile height outfile) (

	let* (
		(image		(car (gimp-file-load RUN-NONINTERACTIVE infile infile)))
		(drawable	(car (gimp-image-get-active-layer image)))
		(width		460)
		(offx		430)
		(offy		230)
		(border		10)
	)

	(gimp-image-crop image width height offx offy)
	(plug-in-autocrop RUN-NONINTERACTIVE image drawable)

	(set! width  (car (gimp-image-width image)))
	(set! height (car (gimp-image-height image)))

	(gimp-image-resize image (+ width (* border 2)) (+ height (* border 2)) border border)
	(set! drawable (car (gimp-image-flatten image)))

	(gimp-file-save RUN-NONINTERACTIVE image drawable outfile outfile)
	(gimp-image-delete image)

))

