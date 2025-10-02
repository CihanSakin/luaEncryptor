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

function xor_utf8_encrypt(data, key)
    local data_bytes = to_bytes(data)
    local key_bytes = to_bytes(key)
    local output = {}
    local key_len = #key_bytes
    for i = 1, #data_bytes do
        local xor_byte = (data_bytes[i] ~ key_bytes[((i - 1) % key_len) + 1]) % 256
        output[i] = string.format("%02X", xor_byte)
    end
    return table.concat(output)
end
