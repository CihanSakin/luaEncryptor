function to_bytes(str)
    local bytes = {}
    for b in str:gmatch(".") do
        for i = 1, #b do
            table.insert(bytes, string.byte(b, i))
        end
    end
    return bytes
end

function from_bytes(bytes)
    local chars = {}
    for i = 1, #bytes do
        chars[i] = string.char(bytes[i])
    end
    return table.concat(chars)
end

function xor_utf8_decrypt(hex_data, key)
    local key_bytes = to_bytes(key)
    local output = {}
    local key_len = #key_bytes
    for i = 1, #hex_data, 2 do
        local hex_byte = tonumber(hex_data:sub(i, i+1), 16)
        local xor_byte = (hex_byte ~ key_bytes[((i - 1) // 2 % key_len) + 1]) % 256
        output[#output + 1] = xor_byte
    end
    return from_bytes(output)
end
