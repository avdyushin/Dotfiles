function virtualenv_info
    if test -n "$VIRTUAL_ENV"
        echo -n -s " [" (path basename "$VIRTUAL_ENV") "]"
    end
end
