--[[
function xor_encrypt(data, key)
    local encrypted = {}
    for i = 1, #data do
        local byte = string.byte(data, i)
        encrypted[i] = string.char(bit32.bxor(byte, key))
    end
    return table.concat(encrypted)
end

function xor_decrypt(data, key)
    local decrypted = {}
    for i = 1, #data do
        local byte = string.byte(data, i)
        decrypted[i] = string.char(bit32.bxor(byte, key))
    end
    return table.concat(decrypted)
end
]]

function xor_decrypt(data, key)
    local decrypted = {}
    for i = 1, #data do
        local byte = string.byte(data, i)
        decrypted[i] = string.char(bit32.bxor(byte, key))
    end
    return table.concat(decrypted)
end

return function(encryptedcode,encryptedkey)
  local decryptedkey = xor_decrypt(encryptedkey,"H8(@Gk3&dnub_!'Pw9cB'")
  local decryptedcode = xor_decrypt(encryptedcode, decryptedkey)
  loadstring(decryptedcode)()
end
