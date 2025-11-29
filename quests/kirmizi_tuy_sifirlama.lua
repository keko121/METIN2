--[[
    Kirmizi Tuy Kalem Sifirlama Quest
    Bu quest, kirmizi tuy kalem etkilerini sifirlamak icin kullanilir.
    
    Item VNUM: 20091 - Kirmizi Tuy Kalem Sifirlama Itemi
    Quest Flag: kizil_tuy_kalem (0 = kullanilmamis, 1 = seviye 1 etki, 2 = seviye 2 etki)
    
    Affect Types:
    - AFFECT_ATT_SPEED (71): Saldiri hizi etkisi
    - AFFECT_MOV_SPEED (72): Hareket hizi etkisi
]]

-- Sabit degerler
local RESET_ITEM_VNUM = 20091
local AFFECT_ATT_SPEED = 71
local AFFECT_MOV_SPEED = 72
local LEVEL_1_EFFECT_VALUE = 5
local LEVEL_2_EFFECT_VALUE = 6

-- Sure hesaplama: 60 yil = 60 * 365 * 24 * 60 * 60 saniye
-- Not: Orijinal questteki deger korunmustur
local SECONDS_PER_MINUTE = 60
local MINUTES_PER_HOUR = 60
local HOURS_PER_DAY = 24
local DAYS_PER_YEAR = 365
local YEARS = 60
local AFFECT_DURATION = SECONDS_PER_MINUTE * MINUTES_PER_HOUR * HOURS_PER_DAY * DAYS_PER_YEAR * YEARS

quest kirmizi_tuy_sifirlama begin
    state start begin
        -- Item VNUM: 20091 - Kirmizi Tuy Kalem Sifirlama Itemi
        when 20091.use begin
            say_title("Kirmizi Tuy Kalem Sifirlama")
            say("Merhaba "..pc.getname().."")
            say("")
            say("Kirmizi tuy kalem etkilerini sifirlamak istiyor musun?")
            say("Unutma etkiler sifirlandiginda tekrar kalem kullanabileceksin.")
            say("")
            
            local sec = select("Sifirla", "Kapat")

            if sec == 1 then
                local quest_flag = pc.getqf("kizil_tuy_kalem")
                
                if quest_flag == 0 then
                    say_title("Kizil Tuy Kalemin Sihri...")
                    say("")
                    say("Henuz sifirlayacagin bir etki yok.")
                    say("Once kirmizi tuy kalem kullan!")
                    return
                    
                elseif quest_flag == 1 then
                    say_title("Kizil Tuy Kalemin Sihri...")
                    say("")
                    say("Etkilerin sifirlandi...")
                    say("Tekrar kalem basabilirsin!")
                    
                    pc.setqf("kizil_tuy_kalem", 0)
                    pc.removeitem(RESET_ITEM_VNUM, 1)
                    
                    -- Seviye 1 etkileri kaldir
                    affect.remove_collect(AFFECT_ATT_SPEED, LEVEL_1_EFFECT_VALUE, AFFECT_DURATION)
                    affect.remove_collect(AFFECT_MOV_SPEED, LEVEL_1_EFFECT_VALUE, AFFECT_DURATION)
                    return
                    
                elseif quest_flag == 2 then
                    say_title("Kizil Tuy Kalemin Sihri...")
                    say("")
                    say("Etkilerin sifirlandi...")
                    say("Tekrar kalem basabilirsin!")
                    
                    pc.setqf("kizil_tuy_kalem", 0)
                    pc.removeitem(RESET_ITEM_VNUM, 1)
                    
                    -- Seviye 2 etkileri kaldir
                    affect.remove_collect(AFFECT_ATT_SPEED, LEVEL_2_EFFECT_VALUE, AFFECT_DURATION)
                    affect.remove_collect(AFFECT_MOV_SPEED, LEVEL_2_EFFECT_VALUE, AFFECT_DURATION)
                    -- Seviye 1 etkileri de kaldir
                    affect.remove_collect(AFFECT_ATT_SPEED, LEVEL_1_EFFECT_VALUE, AFFECT_DURATION)
                    affect.remove_collect(AFFECT_MOV_SPEED, LEVEL_1_EFFECT_VALUE, AFFECT_DURATION)
                    return
                end
                
            elseif sec == 2 then
                say_title("Kirmizi Tuyun Sihri...")
                say("")
                say("Demek etkilerinden memnunsun.")
                say("Aferin, yorma beni.")
                return
            end
        end
    end
end
