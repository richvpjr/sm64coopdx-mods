-- name: Vincible
-- description: NO MORE INVINCIBILITY




function mario_update(m)
    m.invinctimer=0
end

hook_event(HOOK_MARIO_UPDATE,mario_update)