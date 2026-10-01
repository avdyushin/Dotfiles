function epub --description "Show EPUB file info"
    set file $argv[1]
    if test -z "$file"
        echo "Error: Missing argument"
        return 1
    end

    set content content.opf
    set tmpdir (mktemp -d)
    unzip -q $file $content -d $tmpdir

    set filepath (string join "/" $tmpdir $content)
    set title (xmllint --xpath "//*[local-name()='title']/text()" $filepath)
    set authors (xmllint --xpath "//*[local-name()='creator']/text()" $filepath | string join ", ")
    set lang (xmllint --xpath "//*[local-name()='language']/text()" $filepath)
    set subjects (xmllint --xpath "//*[local-name()='subject']/text()" $filepath | string join ", ")
    set publisher (xmllint --xpath "//*[local-name()='publisher']/text()" $filepath)
    set iso_date (xmllint --xpath "//*[local-name()='date']/text()" $filepath)
    set date (date -f "%Y-%m-%dT%H:%M:%S" -j $iso_date "+%d %B %Y" 2>/dev/null)
    set items (xmllint --xpath "//*[local-name()='manifest']/*[local-name()='item']/@href" $filepath | sed 's/^[[:space:]]href=//')
    set itemrefs (xmllint --xpath "//*[local-name()='spine']/*[local-name()='itemref']/@idref" $filepath | sed 's/^[[:space:]]idref=//')

    echo "Title: $title"
    echo "Author(s): $authors"
    echo "Language: $lang"
    echo "Subject(s): $subjects"
    echo "Publisher: $publisher"
    echo "Date: $date"

    function print_items
        set split (string split " " $argv)
        set count (count $split)
        for i in (seq 1 $count)
          set item $split[$i]
          if test $i -eq $count
            echo "└── $item"
          else
            echo "├── $item"
          end
        end
    end

    echo "Manifest:"
    print_items $items

    echo "Spine:"
    print_items $itemrefs

    rm -r $tmpdir
end
