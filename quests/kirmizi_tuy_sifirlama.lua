--[[
    Kirmizi Tuy Kalem Sifirlama Quest
    Bu quest, kirmizi tuy kalem etkilerini sifirlamak icin kullanilir.
    
    Item VNUM: 20091 - Kirmizi Tuy Kalem Sifirlama Itemi
    Quest Flag: kizil_tuy_kalem (0 = kullanilmamis, 1 = seviye 1 etki, 2 = seviye 2 etki)
]]

quest kirmizi_tuy_sifirlama begin
    state start begin
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
                    pc.removeitem(20091, 1)
                    
                    -- Seviye 1 etkileri kaldir
                    affect.remove_collect(71, 5, 60*60*24*365*60)
                    affect.remove_collect(72, 5, 60*60*24*365*60)
                    return
                    
                elseif quest_flag == 2 then
                    say_title("Kizil Tuy Kalemin Sihri...")
                    say("")
                    say("Etkilerin sifirlandi...")
                    say("Tekrar kalem basabilirsin!")
                    
                    pc.setqf("kizil_tuy_kalem", 0)
                    pc.removeitem(20091, 1)
                    
                    -- Seviye 2 etkileri kaldir
                    affect.remove_collect(71, 6, 60*60*24*365*60)
                    affect.remove_collect(72, 6, 60*60*24*365*60)
                    -- Seviye 1 etkileri de kaldir
                    affect.remove_collect(71, 5, 60*60*24*365*60)
                    affect.remove_collect(72, 5, 60*60*24*365*60)
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
