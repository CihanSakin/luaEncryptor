function xor_encrypt(data, key)
    local encrypted = {}
    for i = 1, #data do
        local byte = string.byte(data, i)
        encrypted[i] = string.char(bit32.bxor(byte, key))
    end
    return table.concat(encrypted)
end

function encrypt(code,key)
    local encryptedkey = xor_encrypt(key, "H8(@Gk3&dnub_!'Pw9cB'")
    local encryptedcode = xor_encrypt(code, encryptedkey)
    return encryptedcode
end
