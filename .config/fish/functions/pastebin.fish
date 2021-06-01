function pastebin --wraps=curl --description 'upload to pastebin'
    curl -F file=@$argv https://0x0.st
end

