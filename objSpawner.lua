-- name: object spawner
-- description: as you probably guessed, it spawns objects.

currid = 0

local function eject_obj(m)
    local obj = spawn_sync_object(
        currid, 
        currid, 
        m.pos.x, m.pos.y, m.pos.z,
        function(o)
            o.oForwardVel = 50.0
            o.oVelY = 30.0
            o.oMoveAngleYaw = m.faceAngle.y
            o.oAction = 1
            o.oGravity = -4.0
            o.oFriction = 1.0
            o.oBuoyancy = 1.0
        end
    )
    if obj then
        obj.oPosX = m.pos.x
        obj.oPosY = m.pos.y + 60
        obj.oPosZ = m.pos.z
    end
    currid = currid + 1
    if currid > 541 then
        currid = 0
    end
end

function monitor_actions(m)
    if m.playerIndex ~= 0 then return end
    if (m.controller.buttonDown & Y_BUTTON ~= 0) and m.action == ACT_JUMP_KICK and m.prevAction ~= ACT_JUMP_KICK then
        eject_obj(m)
    end
end

hook_event(HOOK_ON_SET_MARIO_ACTION, monitor_actions)