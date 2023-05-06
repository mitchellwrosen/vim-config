(fn []
  (local deadcolumn (require "deadcolumn"))
  (deadcolumn.setup
    { :blending { :threshold 100 } ; start showing color column here
      :scope "visible" ; show color column per all visible lines
      :warning { :alpha 0.1 :hlgroup [ "ErrorMsg" "background" ] }
    }
  )
)

