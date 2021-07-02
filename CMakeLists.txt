Project (DocumentTime)
set (PDFTEX pdftex)
cmake_minimum_required (VERSION 3.18.4)

set (DOCS ${DOCS} draft)

set (TEX tex)

foreach (DOC ${DOCS})

	add_custom_command (
	    OUTPUT ${DOC}.pdf
	    DEPENDS ${DOC}.tex
	    COMMAND ${PDFTEX}
	    ARGS ${DOC}.tex
	    COMMAND ${TEX}
	    ARGS ${DOC}.tex
	)


# Build a list of all the results
  	set (DOC_RESULTS ${DOC_RESULTS}
	    ${DOC}.pdf
	    )

endforeach (DOC)


add_custom_target( TDocument ALL
		   DEPENDS ${DOC_RESULTS}
		   )



