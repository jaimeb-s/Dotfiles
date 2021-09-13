------------------------------------------------------------------------
-- Xmonad
--
import XMonad

-- Actions
import XMonad.Actions.CycleWS
import qualified XMonad.Actions.FlexibleResize as Flex
import XMonad.Actions.UpdatePointer
import XMonad.Actions.UpdateFocus

-- Data
import qualified Data.Map        as M
import Data.Monoid

-- System
import System.Exit

-- Hocks
--import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.Place
import XMonad.Hooks.SetWMName

-- Layout
import XMonad.Layout.Circle
import XMonad.Layout.Grid
import XMonad.Layout.MagicFocus
import XMonad.Layout.Magnifier
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns

import qualified XMonad.StackSet as W

-- Utilities
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce

------------------------------------------------------------------------
-- Colors.
--
-- Primary
background = "#1b1918"
foreground = "#a8a19f"

black = "#766e6b"
red = "#f22c40"
green = "#5ab738"
yellow = "#d5911a"
blue = "#407ee7"
magenta = "#6666ea"
cyan = "#00ad9c"
white = "#a8a19f"

------------------------------------------------------------------------
-- Terminal.
--
myTerminal :: String
myTerminal = "alacritty"

------------------------------------------------------------------------
-- Whether focus follows the mouse pointer.
--
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

------------------------------------------------------------------------
-- Whether clicking on a window to focus also passes the click to the window.
--
myClickJustFocuses :: Bool
myClickJustFocuses = False

------------------------------------------------------------------------
-- Width of the window border in pixels.
--
myBorderWidth :: Dimension
myBorderWidth = 3

------------------------------------------------------------------------
-- modMask lets you specify which modkey you want to use.
-- "windows key" is mod4Mask.
--
myModMask :: KeyMask
myModMask = mod4Mask

------------------------------------------------------------------------
-- click in the workspaces.
-- 
xmobarEscape :: String -> String
xmobarEscape = concatMap doubleLts
    where
        doubleLts '<' = "<<"
        doubleLts x = [x]

myWorkspaces :: [String]
myWorkspaces = clickable . (map xmobarEscape)
        $ ["web", "term", "code", "git", "nvim", "py", "music", "file", "media"]
    where
        clickable l = ["<action=xdotool key super+" ++ show (i) ++ "> " ++ ws ++ "</action>" | (i, ws) <- zip [1 .. 9] l]

------------------------------------------------------------------------
-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor :: String
myNormalBorderColor  = background

myFocusedBorderColor :: String
myFocusedBorderColor = foreground

------------------------------------------------------------------------
-- Key bindings.
--
myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [
        ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)                           -- launch a terminal
        , ((modm,               xK_p     ), spawn "rofi -show drun")                              -- launch rofi
        -- , ((modm .|. shiftMask, xK_p     ), spawn "rofi -show")                                   -- launch rofi window
        , ((modm .|. shiftMask, xK_c     ), kill)                                                 -- close focused window
        , ((modm,               xK_space ), sendMessage NextLayout)                               -- Rotate through the available layout algorithms
        , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)                   -- Reset the layouts on the current workspace to default
        , ((modm,               xK_n     ), refresh)                                              -- Resize viewed windows to the correct size
        , ((modm,               xK_Tab   ), windows W.focusDown)                                  -- Move focus to the next window
        , ((modm,               xK_j     ), windows W.focusDown)                                  -- Move focus to the next window
        , ((modm,               xK_k     ), windows W.focusUp  )                                  -- Move focus to the previous window
        , ((modm,               xK_m     ), windows W.focusMaster  )                              -- Move focus to the master window
        , ((modm,               xK_Return), windows W.swapMaster)                                 -- Swap the focused window and the master window
        , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )                                 -- Swap the focused window with the next window
        , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )                                 -- Swap the focused window with the previous window
        , ((modm,               xK_h     ), sendMessage Shrink)                                   -- Shrink the master area
        , ((modm,               xK_l     ), sendMessage Expand)                                   -- Expand the master area
        , ((modm,               xK_t     ), withFocused $ windows . W.sink)                       -- Push window back into tiling
        , ((modm              , xK_comma ), sendMessage (IncMasterN 1))                           -- Increment the number of windows in the master area
        , ((modm              , xK_period), sendMessage (IncMasterN (-1)))                        -- Deincrement the number of windows in the master area

        -- Toggle the status bar gap
        -- Use this binding with avoidStruts from Hooks.ManageDocks.
        -- See also the statusBar function from Hooks.DynamicLog.
        --
        -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
        , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))                            -- Quit xmonad
        , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")         -- Restart xmonad
        , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -")) -- Run xmessage with a summary of the default keybindings (useful for beginners)
    ]
    ++
    [
        --
        -- mod-[1..9], Switch to workspace N
        -- mod-shift-[1..9], Move client to workspace N
        --
        ((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]
    ++
    [
        --
        -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
        -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
        --
        ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
    ]
    ++
    [
        -- A basic CycleWs setup
        ((modm,                 xK_Down ), nextWS)
        , ((modm,               xK_Up    ), prevWS)
        , ((modm .|. shiftMask, xK_Down ), shiftToNext >> nextWS)
        , ((modm .|. shiftMask, xK_Up   ), shiftToPrev >> prevWS)
        , ((modm,               xK_Right), nextScreen)
        , ((modm,               xK_Left ), prevScreen)
        , ((modm .|. shiftMask, xK_Right), shiftNextScreen)
        , ((modm .|. shiftMask, xK_Left ), shiftPrevScreen)
        , ((modm,               xK_z    ), toggleWS)
    ]

------------------------------------------------------------------------
-- key bindings add
--
myKeysAdd :: [(String, X ())]
myKeysAdd = [
        -- Apps
        ("M-g", spawn "google-chrome-stable")       -- Launch Google-Chrome
        , ("M-c", spawn "code")                     -- Launch VS-Code
        , ("<Print>", spawn "scrot")                -- Full screenshot  ((fn-imp pant) o (imp pant))
        , ("M-<Print>", spawn "scrot -s")           -- Screenshot    ((Mod-fn-imp pant) o (Mod-imp pant))
        , ("M-s", spawn "spotify")                  -- Launch Spotify

        -- Audio
        --, ("<XF86AudioPlay>", spawn "")
        --, ("<XF86AudioPrev>", spawn "")
        --, ("<XF86AudioNext>", spawn "")

        , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
        , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")
        , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle" )

        -- Brightness
        , ("<XF86MonBrightnessUp>", spawn "brightnessctl set +10%")
        , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 10%-")
    ]

------------------------------------------------------------------------
-- Mouse bindings.
--
myMouseBindings :: XConfig Layout -> M.Map (KeyMask, Button) (Window -> X())
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ 
        ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))            -- mod-button1, Set the window to floating mode and move by dragging
        , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))                               -- mod-button2, Raise the window to the top of the stack
        -- , ((modm, button3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))
        , ((modm, button3), (\w -> focus w >> Flex.mouseResizeWindow w))                            -- mod-button3, Set the window to floating mode and resize by dragging

        -- you may also bind events to the mouse scroll wheel (button4 and button5)
        -- mod-button4, close the window you click on like
        -- , ((modm, button4), (\w -> focus w >> kill))
    ]

------------------------------------------------------------------------
-- Spacing
--
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing  i = spacingRaw False (Border i i i i) True (Border i i i i) True

------------------------------------------------------------------------
-- Layouts:
--
myLayout = tiled ||| mirror ||| full ||| threeCol ||| circle ||| grid ||| magicfocus
    where
        tiled = renamed [Replace "Tall"]
            $ mySpacing 5
            $ tall
        
        mirror = renamed [Replace "Mirror-Tall"]
            $ mySpacing 5
            $ Mirror tall
        
        full = renamed [Replace "Full"]
            $ mySpacing 5
            $ Full
        
        threeCol = renamed [Replace "ThreeCol"]
            $ mySpacing 5
            $ magnifiercz' 1.3
            $ ThreeColMid nmaster delta ratio
        
        circle = renamed [Replace "Circle"]
            $ mySpacing 5
            $ magnifiercz' 1.5
            $ Circle
        
        grid = renamed [Replace "Grid"]
            $ mySpacing 5
            $ Grid

        magicfocus = renamed [Replace "MagicFocus"]
            $ mySpacing 5
            $ magicFocus (Tall nmaster delta ratio)

        tall   = Tall nmaster delta ratio

        nmaster = 1         -- The default number of windows in the master pane
        ratio   = 1/2       -- Default proportion of screen occupied by master pane
        delta   = 3/100     -- Percent of screen to increment by when resizing panes

------------------------------------------------------------------------
-- Window rules:
--

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook :: ManageHook
myManageHook = composeAll
    [ 
        className =? "MPlayer"        --> doFloat
        , className =? "Gimp"           --> doFloat
        , resource  =? "desktop_window" --> doIgnore
        , resource  =? "kdesktop"       --> doIgnore
    ]

myPlacement = withGaps (20,0,20,0) (smart (0.5,0.5))

------------------------------------------------------------------------
-- Event handling
--

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook :: Event -> X All
--myEventHook = mempty
myEventHook = do
    focusOnMouseMove

------------------------------------------------------------------------
-- Status bars and logging
--

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook :: X ()
--myLogHook = return ()
myLogHook = updatePointer (0.5, 0.5) (0,0)

------------------------------------------------------------------------
-- Startup hook
--

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook :: X ()
--myStartupHook = return ()
myStartupHook = do
    adjustEventInput
    setWMName "LG3D"
    spawnOnce "feh --bg-fill --no-fehbg ~/.wallpapers/wallpaper-1.jpg"

------------------------------------------------------------------------
-- Config
--
myConfig = def {
      -- simple stuff
        terminal           = myTerminal
        , focusFollowsMouse  = myFocusFollowsMouse
        , clickJustFocuses   = myClickJustFocuses
        , borderWidth        = myBorderWidth
        , modMask            = myModMask
        , workspaces         = myWorkspaces
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor

      -- key bindings
        , keys               = myKeys
        , mouseBindings      = myMouseBindings

      -- hooks, layouts
        , layoutHook         = myLayout
        , manageHook         = placeHook myPlacement <+> insertPosition Below Newer <+> myManageHook
        , handleEventHook    = myEventHook
        , logHook            = myLogHook
        , startupHook        = myStartupHook
    } `additionalKeysP` myKeysAdd

------------------------------------------------------------------------
-- Xmobar
-- 
windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myBar :: String
myBar = "xmobar"

myPP :: PP
myPP = xmobarPP {
        ppCurrent           = wrap "[" "]" . color1
        , ppVisible         = color2 --
        , ppHidden          = color3
        , ppHiddenNoWindows = color4
        , ppUrgent          = color5 . wrap "!." "!"
        , ppSep             = " | "
        , ppTitle           = color6 . shorten 55
        , ppTitleSanitize   = xmobarStrip
        , ppOrder           = \(ws : l : t : ex) -> [ws, l] ++ ex ++ [t]
        , ppExtras          = [windowCount]
    }
    where
        color1 = xmobarColor yellow ""
        color2 = xmobarColor magenta "" --
        color3 = xmobarColor green ""
        color4 = xmobarColor black ""
        color5 = xmobarColor red ""
        color6 = xmobarColor cyan ""

toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask .|. shiftMask, xK_b)

------------------------------------------------------------------------
-- Run xmonad.
--
main :: IO ()
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch terminal",
    "mod-p            Launch rofi",
    "mod-Shift-p      Launch rofi window    En deshuso",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging",
    "",
    "mod-Down           nextWS",
    "mod-Up             prevWS",
    "mod-Shift-Down     ",
    "mod-Shift-Up       ",
    "mod-Right          nextScreen",
    "mod-Left           prevScreen",
    "mod-Shift-Right    ",
    "mod-SHitf-Left     ",
    "mod-z              toggleWS",
    "",
    "-- key bindings add",
    "-- Apps",
    "mod-g              Launch Google-Chrome",
    "mod-c              Launch VS-Code",
    "Print              Full screnshot",
    "mod-Print          Screnshot",
    "mod-Control-s      Launch Spotify",
    "-- Audio",
    "XF86AudioPlay              ",
    "XF86AudioPrev              ",
    "XF86AudioNext              ",
    "XF86AudioLowerVolume       Volume -",
    "XF86AudioRaiseVolume       Volume +",
    "XF86AudioMute              Mute",
    "-- Brightness",
    "XF86MonBrightnessUp        Brightness +",
    "XF86MonBrightnessDown      Brightness -"]
