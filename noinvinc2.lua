-- name: Vincible
-- description: NO MORE INVINCIBILITY\n .. again.




function resetiframe(m)
    m.invinctimer=0
end

hook_event(HOOK_ON_DAMAGE,resetiframe)