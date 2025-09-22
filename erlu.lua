--[[
     _      ___         ____  ______
    | | /| / (_)__  ___/ / / / /  _/
    | |/ |/ / / _ \/ _  / /_/ // /  
    |__/|__/_/_//_/\_,_/\____/___/
    
    by .ftgs#0 (Discord)
    
    This script is NOT intended to be modified.
    To view the source code, see the 'Src' folder on the official GitHub repository.
    
    Author: .ftgs#0 (Discord User)
    Github: https://github.com/Footagesus/WindUI
    Discord: https://discord.gg/84CNGY5wAV
]]


local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()local b=





cloneref and cloneref(game:GetService"RunService")or game:GetService"RunService"
local c=cloneref and cloneref(game:GetService"UserInputService")or game:GetService"UserInputService"
local d=cloneref and cloneref(game:GetService"TweenService")or game:GetService"TweenService"

local e=loadstring(game:HttpGetAsync"https://raw.githubusercontent.com/Footagesus/Icons/main/Main.lua")()
e.SetIconsType"lucide"

local f={
CanDraggable=true,
Theme=nil,
Themes=nil,
WindUI=nil,
Signals={},
Objects={},
FontObjects={},
Request=http_request or(syn and syn.request)or request,
DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior="Sibling",
},
CanvasGroup={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
Frame={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
RichText=true,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
AutoButtonColor=false,
},
UIListLayout={
SortOrder="LayoutOrder",
},
ScrollingFrame={
ScrollBarImageTransparency=1,
BorderSizePixel=0,
}
},
Colors={
Red="#e53935",
Orange="#f57c00",
Green="#43a047",
Blue="#039be5",
White="#ffffff",
Grey="#484848",
}
}

function f.Init(g)
f.WindUI=g
end


function f.AddSignal(g,h)
table.insert(f.Signals,g:Connect(h))
end

function f.DisconnectAll()
for g,h in next,f.Signals do
local i=table.remove(f.Signals,g)
i:Disconnect()
end
end


function f.SafeCallback(g,...)
if not g then
return
end

local h,i=pcall(g,...)
if not h then local
j, k=i:find":%d+: "


warn("[ WindUI: DEBUG Mode ] "..i)

return f.WindUI:Notify{
Title="DEBUG Mode: Error",
Content=not k and i or i:sub(k+1),
Duration=8,
}
end
end

function f.SetTheme(g)
f.Theme=g
f.UpdateTheme(nil,true)
end

function f.AddFontObject(g)
table.insert(f.FontObjects,g)
f.UpdateFont(f.Font)
end

function f.UpdateFont(g)
f.Font=g
for h,i in next,f.FontObjects do
i.FontFace=Font.new(g,i.FontFace.Weight,i.FontFace.Style)
end
end

function f.GetThemeProperty(g,h)
return h[g]or f.Themes.Dark[g]
end

function f.AddThemeObject(g,h)
f.Objects[g]={Object=g,Properties=h}
f.UpdateTheme(g,false)
return g
end

function f.UpdateTheme(g,h)
local function ApplyTheme(i)
for j,k in pairs(i.Properties or{})do
local l=f.GetThemeProperty(k,f.Theme)
if l then
if not h then
i.Object[j]=Color3.fromHex(l)
else
f.Tween(i.Object,0.08,{[j]=Color3.fromHex(l)}):Play()
end
end
end
end

if g then
local i=f.Objects[g]
if i then
ApplyTheme(i)
end
else
for i,j in pairs(f.Objects)do
ApplyTheme(j)
end
end
end

function f.Icon(g)
return e.Icon(g)
end

function f.New(g,h,i)
local j=Instance.new(g)

for k,l in next,f.DefaultProperties[g]or{}do
j[k]=l
end

for k,l in next,h or{}do
if k~="ThemeTag"then
j[k]=l
end
end

for k,l in next,i or{}do
l.Parent=j
end

if h and h.ThemeTag then
f.AddThemeObject(j,h.ThemeTag)
end
if h and h.FontFace then
f.AddFontObject(j)
end
return j
end

function f.Tween(g,h,i,...)
return d:Create(g,TweenInfo.new(h,...),i)
end

function f.NewRoundFrame(g,h,i,j,k)






local l=f.New(k and"ImageButton"or"ImageLabel",{
ScaleType="Slice",
SliceCenter=h~="Shadow-sm"and Rect.new(256
,256
,256
,256

)or Rect.new(512,512,512,512),
SliceScale=1,
BackgroundTransparency=1,
ThemeTag=i.ThemeTag and i.ThemeTag
},j)

for m,n in pairs(i or{})do
if m~="ThemeTag"then
l[m]=n
end
end

local function UpdateSliceScale(m)
local n=h~="Shadow-sm"and(m/(256))or(m/512)
l.SliceScale=n
end

UpdateSliceScale(g)

return l
end

local g=f.New local h=
f.Tween

function f.SetDraggable(i)
f.CanDraggable=i
end

function f.Drag(i,j,k)
local l
local m,n,o,p
local q={
CanDraggable=true
}

if not j or type(j)~="table"then
j={i}
end

local function update(r)
local s=r.Position-o
f.Tween(i,0.02,{Position=UDim2.new(
p.X.Scale,p.X.Offset+s.X,
p.Y.Scale,p.Y.Offset+s.Y
)}):Play()
end

for r,s in pairs(j)do
s.InputBegan:Connect(function(t)
if(t.UserInputType==Enum.UserInputType.MouseButton1 or t.UserInputType==Enum.UserInputType.Touch)and q.CanDraggable then
if l==nil then
l=s
m=true
o=t.Position
p=i.Position

if k and type(k)=="function"then
k(true,l)
end

t.Changed:Connect(function()
if t.UserInputState==Enum.UserInputState.End then
m=false
l=nil

if k and type(k)=="function"then
k(false,l)
end
end
end)
end
end
end)

s.InputChanged:Connect(function(t)
if l==s and m then
if t.UserInputType==Enum.UserInputType.MouseMovement or t.UserInputType==Enum.UserInputType.Touch then
n=t
end
end
end)
end

c.InputChanged:Connect(function(r)
if r==n and m and l~=nil then
if q.CanDraggable then
update(r)
end
end
end)

function q.Set(r,s)
q.CanDraggable=s
end

return q
end

function f.Image(i,j,k,l,m,n,o)
local function SanitizeFilename(p)
p=p:gsub("[%s/\\:*?\"<>|]+","-")
p=p:gsub("[^%w%-_%.]","")
return p
end

l=l or"Temp"
j=SanitizeFilename(j)

local p=g("Frame",{
Size=UDim2.new(0,0,0,0),

BackgroundTransparency=1,
},{
g("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScaleType="Crop",
ThemeTag=(f.Icon(i)or o)and{
ImageColor3=n and"Icon"
}or nil,
},{
g("UICorner",{
CornerRadius=UDim.new(0,k)
})
})
})
if f.Icon(i)then
p.ImageLabel.Image=f.Icon(i)[1]
p.ImageLabel.ImageRectOffset=f.Icon(i)[2].ImageRectPosition
p.ImageLabel.ImageRectSize=f.Icon(i)[2].ImageRectSize
end
if string.find(i,"http")then
local q="WindUI/"..l.."/Assets/."..m.."-"..j..".png"
local r,s=pcall(function()
task.spawn(function()
if not isfile(q)then
local r=f.Request{
Url=i,
Method="GET",
}.Body

writefile(q,r)
end
p.ImageLabel.Image=getcustomasset(q)
end)
end)
if not r then
warn("e"..s)

p:Destroy()
end
elseif string.find(i,"rbxassetid")then
p.ImageLabel.Image=i
end

return p
end

return f end function a.b()
return{
Dark={
Name="Dark",
Accent="#18181b",
Dialog="#18181b",
Outline="#FFFFFF",
Text="#FFFFFF",
Placeholder="#999999",
Background="#101010",
Button="#52525b",
Icon="#a1a1aa",
},
Light={
Name="Light",
Accent="#FFFFFF",
Dialog="#f4f4f5",
Outline="#09090b",
Text="#000000",
Placeholder="#777777",
Background="#e4e4e7",
Button="#18181b",
Icon="#52525b",
},
Rose={
Name="Rose",
Accent="#f43f5e",
Outline="#ffe4e6",
Text="#ffe4e6",
Placeholder="#fda4af",
Background="#881337",
Button="#e11d48",
Icon="#fecdd3",
},
Plant={
Name="Plant",
Accent="#22c55e",
Outline="#dcfce7",
Text="#dcfce7",
Placeholder="#bbf7d0",
Background="#14532d",
Button="#22c55e",
Icon="#86efac",
},
Red={
Name="Red",
Accent="#ef4444",
Outline="#fee2e2",
Text="#ffe4e6",
Placeholder="#fca5a5",
Background="#7f1d1d",
Button="#ef4444",
Icon="#fecaca",
},
Indigo={
Name="Indigo",
Accent="#6366f1",
Outline="#e0e7ff",
Text="#e0e7ff",
Placeholder="#a5b4fc",
Background="#312e81",
Button="#6366f1",
Icon="#c7d2fe",
},
Sky={
Name="Sky",
Accent="#0ea5e9",
Outline="#e0f2fe",
Text="#e0f2fe",
Placeholder="#7dd3fc",
Background="#075985",
Button="#0ea5e9",
Icon="#bae6fd",
},
Violet={
Name="Violet",
Accent="#8b5cf6",
Outline="#ede9fe",
Text="#ede9fe",
Placeholder="#c4b5fd",
Background="#4c1d95",
Button="#8b5cf6",
Icon="#ddd6fe",
},
Amber={
Name="Amber",
Accent="#f59e0b",
Outline="#fef3c7",
Text="#fef3c7",
Placeholder="#fcd34d",
Background="#78350f",
Button="#f59e0b",
Icon="#fde68a",
},
Emerald={
Name="Emerald",
Accent="#10b981",
Outline="#d1fae5",
Text="#d1fae5",
Placeholder="#6ee7b7",
Background="#064e3b",
Button="#10b981",
Icon="#a7f3d0",
},
}end function a.c()
local c={}

local d=a.load'a'
local e=d.New
local f=d.Tween


function c.New(g,h,i,j,k,l,m)
j=j or"Primary"
local n=not m and 10 or 99
local o
if h and h~=""then
o=e("ImageLabel",{
Image=d.Icon(h)[1],
ImageRectSize=d.Icon(h)[2].ImageRectSize,
ImageRectOffset=d.Icon(h)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local p=e("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=k,
BackgroundTransparency=1
},{
d.NewRoundFrame(n,"Squircle",{
ThemeTag={
ImageColor3=j~="White"and"Button"or nil,
},
ImageColor3=j=="White"and Color3.new(1,1,1)or nil,
Size=UDim2.new(1,0,1,0),
Name="Squircle",
ImageTransparency=j=="Primary"and 0 or j=="White"and 0 or 1
}),

d.NewRoundFrame(n,"Squircle",{



ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(1,0,1,0),
Name="Special",
ImageTransparency=j=="Secondary"and 0.95 or 1
}),

d.NewRoundFrame(n,"Shadow-sm",{



ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,3,1,3),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Shadow",
ImageTransparency=j=="Secondary"and 0 or 1,
Visible=not m
}),

d.NewRoundFrame(n,not m and"SquircleOutline"or"SquircleOutline2",{
ThemeTag={
ImageColor3=j~="White"and"Outline"or nil,
},
Size=UDim2.new(1,0,1,0),
ImageColor3=j=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=j=="Primary"and.95 or.85,
Name="SquircleOutline",
}),

d.NewRoundFrame(n,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3=j~="White"and"Text"or nil
},
ImageColor3=j=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=1
},{
e("UIPadding",{
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
}),
e("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
o,
e("TextLabel",{
BackgroundTransparency=1,
FontFace=Font.new(d.Font,Enum.FontWeight.SemiBold),
Text=g or"Button",
ThemeTag={
TextColor3=(j~="Primary"and j~="White")and"Text",
},
TextColor3=j=="Primary"and Color3.new(1,1,1)or j=="White"and Color3.new(0,0,0)or nil,
AutomaticSize="XY",
TextSize=18,
})
})
})

d.AddSignal(p.MouseEnter,function()
f(p.Frame,.047,{ImageTransparency=.95}):Play()
end)
d.AddSignal(p.MouseLeave,function()
f(p.Frame,.047,{ImageTransparency=1}):Play()
end)
d.AddSignal(p.MouseButton1Up,function()
if l then
l:Close()()
end
if i then
d.SafeCallback(i)
end
end)

return p
end


return c end function a.d()
local c={}

local d=a.load'a'
local e=d.New local f=
d.Tween


function c.New(g,h,i,j,k)
j=j or"Input"
local l=10
local m
if h and h~=""then
m=e("ImageLabel",{
Image=d.Icon(h)[1],
ImageRectSize=d.Icon(h)[2].ImageRectSize,
ImageRectOffset=d.Icon(h)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local n=j~="Input"

local o=e("TextBox",{
BackgroundTransparency=1,
TextSize=16,
FontFace=Font.new(d.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,m and-29 or 0,1,0),
PlaceholderText=g,
ClearTextOnFocus=false,
ClipsDescendants=true,
TextWrapped=n,
MultiLine=n,
TextXAlignment="Left",
TextYAlignment=j=="Input"and"Center"or"Top",

ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
})

local p=e("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=i,
BackgroundTransparency=1
},{
e("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
d.NewRoundFrame(l,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
}),
d.NewRoundFrame(l,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.9,
}),
d.NewRoundFrame(l,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
e("UIPadding",{
PaddingTop=UDim.new(0,j=="Input"and 0 or 12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,j=="Input"and 0 or 12),
}),
e("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment=j=="Input"and"Center"or"Top",
HorizontalAlignment="Left",
}),
m,
o,
})
})
})










d.AddSignal(o.FocusLost,function()
if k then
d.SafeCallback(k,o.Text)
end
end)

return p
end


return c end function a.e()
local c=a.load'a'
local d=c.New
local e=c.Tween

local f={
Holder=nil,
Window=nil,
Parent=nil,
}

function f.Init(g,h)
f.Window=g
f.Parent=h
return f
end

function f.Create(g)
local h={
UICorner=32,
UIPadding=12,
UIElements={}
}

if g then h.UIPadding=0 end
if g then h.UICorner=26 end

if not g then
h.UIElements.FullScreen=d("Frame",{
ZIndex=999,
BackgroundTransparency=1,
BackgroundColor3=Color3.fromHex"#000000",
Size=UDim2.new(1,0,1,0),
Active=false,
Visible=false,
Parent=f.Parent or(f.Window and f.Window.UIElements and f.Window.UIElements.Main and f.Window.UIElements.Main.Main)
},{
d("UICorner",{
CornerRadius=UDim.new(0,f.Window.UICorner)
})
})
end

h.UIElements.Main=d("Frame",{
Size=UDim2.new(0,280,0,0),
ThemeTag={
BackgroundColor3="Dialog",
},
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=false,
ZIndex=99999,
},{
d("UIPadding",{
PaddingTop=UDim.new(0,h.UIPadding),
PaddingLeft=UDim.new(0,h.UIPadding),
PaddingRight=UDim.new(0,h.UIPadding),
PaddingBottom=UDim.new(0,h.UIPadding),
})
})

h.UIElements.MainContainer=c.NewRoundFrame(h.UICorner,"Squircle",{
Visible=false,

ImageTransparency=g and 0.15 or 0,
Parent=g and f.Parent or h.UIElements.FullScreen,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize="XY",
ThemeTag={
ImageColor3="Dialog"
},
ZIndex=9999,
},{





h.UIElements.Main,



c.NewRoundFrame(h.UICorner,"SquircleOutline2",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ThemeTag={
ImageColor3="Outline",
},
},{
d("UIGradient",{
Rotation=45,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.55),
NumberSequenceKeypoint.new(0.5,0.8),
NumberSequenceKeypoint.new(1,0.6)
}
})
})
})

function h.Open(i)
if not g then
h.UIElements.FullScreen.Visible=true
h.UIElements.FullScreen.Active=true
end

task.spawn(function()
h.UIElements.MainContainer.Visible=true

if not g then
e(h.UIElements.FullScreen,0.1,{BackgroundTransparency=.3}):Play()
end
e(h.UIElements.MainContainer,0.1,{ImageTransparency=0}):Play()


task.spawn(function()
task.wait(0.05)
h.UIElements.Main.Visible=true
end)
end)
end
function h.Close(i)
if not g then
e(h.UIElements.FullScreen,0.1,{BackgroundTransparency=1}):Play()
h.UIElements.FullScreen.Active=false
task.spawn(function()
task.wait(.1)
h.UIElements.FullScreen.Visible=false
end)
end
h.UIElements.Main.Visible=false

e(h.UIElements.MainContainer,0.1,{ImageTransparency=1}):Play()



task.spawn(function()
task.wait(.1)
if not g then
h.UIElements.FullScreen:Destroy()
else
h.UIElements.MainContainer:Destroy()
end
end)

return function()end
end


return h
end

return f end function a.f()
local c={}


local d=a.load'a'
local e=d.New local f=
d.Tween

local g=a.load'c'.New
local h=a.load'd'.New

function c.new(i,j,k)
local l=a.load'e'.Init(nil,i.WindUI.ScreenGui.KeySystem)
local m=l.Create(true)


local n

local o=200

local p=430
if i.KeySystem.Thumbnail and i.KeySystem.Thumbnail.Image then
p=430+(o/2)
end

m.UIElements.Main.AutomaticSize="Y"
m.UIElements.Main.Size=UDim2.new(0,p,0,0)

local q

if i.Icon then

q=d.Image(
i.Icon,
i.Title..":"..i.Icon,
0,
i.WindUI.Window,
"KeySystem",
i.IconThemed
)
q.Size=UDim2.new(0,24,0,24)
q.LayoutOrder=-1
end

local r=e("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=i.Title,
FontFace=Font.new(d.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20
})
local s=e("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text="Key System",
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
TextTransparency=1,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextSize=16
})

local t=e("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
e("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
q,r
})

local u=e("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





t,s,
})

local v=h("Enter Key","key",nil,"Input",function(v)
n=v
end)

local w
if i.KeySystem.Note and i.KeySystem.Note~=""then
w=e("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=i.KeySystem.Note,
TextSize=18,
TextTransparency=.4,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true
})
end

local x=e("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
e("Frame",{
BackgroundTransparency=1,
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
},{
e("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
})
})
})


local y
if i.KeySystem.Thumbnail and i.KeySystem.Thumbnail.Image then
local z
if i.KeySystem.Thumbnail.Title then
z=e("TextLabel",{
Text=i.KeySystem.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
y=e("ImageLabel",{
Image=i.KeySystem.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,o,1,0),
Parent=m.UIElements.Main,
ScaleType="Crop"
},{
z,
e("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

e("Frame",{

Size=UDim2.new(1,y and-o or 0,1,0),
Position=UDim2.new(0,y and o or 0,0,0),
BackgroundTransparency=1,
Parent=m.UIElements.Main
},{
e("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
e("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
u,
w,
v,
x,
e("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})





local z=g("Exit","log-out",function()
m:Close()()
end,"Tertiary",x.Frame)

if y then
z.Parent=y
z.Size=UDim2.new(0,0,0,42)
z.Position=UDim2.new(0,16,1,-16)
z.AnchorPoint=Vector2.new(0,1)
end

if i.KeySystem.URL then
g("Get key","key",function()
setclipboard(i.KeySystem.URL)
end,"Secondary",x.Frame)
end

local A=g("Submit","arrow-right",function()
local A=n
local B
if type(i.KeySystem.Key)=="table"then
B=table.find(i.KeySystem.Key,tostring(A))
else
B=tostring(i.KeySystem.Key)==tostring(A)
end

if B then
m:Close()()

if i.KeySystem.SaveKey then
local C=i.Folder or i.Title
writefile(C.."/"..j..".key",tostring(A))
end

task.wait(.4)
k(true)
end
end,"Primary",x)

A.AnchorPoint=Vector2.new(1,0.5)
A.Position=UDim2.new(1,0,0.5,0)










m:Open()
end

return c end function a.g()
local c=a.load'a'
local d=c.New
local e=c.Tween

local f={
Size=UDim2.new(0,300,1,-156),
SizeLower=UDim2.new(0,300,1,-56),
UICorner=16,
UIPadding=14,
ButtonPadding=9,
Holder=nil,
NotificationIndex=0,
Notifications={}
}

function f.Init(g)
local h={
Lower=false
}

function h.SetLower(i)
h.Lower=i
h.Frame.Size=i and f.SizeLower or f.Size
end

h.Frame=d("Frame",{
Position=UDim2.new(1,-29,0,56),
AnchorPoint=Vector2.new(1,0),
Size=f.Size,
Parent=g,
BackgroundTransparency=1,




},{
d("UIListLayout",{
HorizontalAlignment="Center",
SortOrder="LayoutOrder",
VerticalAlignment="Bottom",
Padding=UDim.new(0,8),
}),
d("UIPadding",{
PaddingBottom=UDim.new(0,29)
})
})
return h
end

function f.New(g)
local h={
Title=g.Title or"Notification",
Content=g.Content or nil,
Icon=g.Icon or nil,
IconThemed=g.IconThemed,
Background=g.Background,
BackgroundImageTransparency=g.BackgroundImageTransparency,
Duration=g.Duration or 5,
Buttons=g.Buttons or{},
CanClose=true,
UIElements={},
Closed=false,
}
if h.CanClose==nil then
h.CanClose=true
end
f.NotificationIndex=f.NotificationIndex+1
f.Notifications[f.NotificationIndex]=h

local i=d("UICorner",{
CornerRadius=UDim.new(0,f.UICorner),
})

local j=d("UIStroke",{
ThemeTag={
Color="Text"
},
Transparency=1,
Thickness=.6,
})

local k

if h.Icon then





















k=c.Image(
h.Icon,
h.Title..":"..h.Icon,
0,
g.Window,
"Notification",
h.IconThemed
)
k.Size=UDim2.new(0,26,0,26)
k.Position=UDim2.new(0,f.UIPadding,0,f.UIPadding)

end

local l
if h.CanClose then
l=d("ImageButton",{
Image=c.Icon"x"[1],
ImageRectSize=c.Icon"x"[2].ImageRectSize,
ImageRectOffset=c.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
Size=UDim2.new(0,16,0,16),
Position=UDim2.new(1,-f.UIPadding,0,f.UIPadding),
AnchorPoint=Vector2.new(1,0),
ThemeTag={
ImageColor3="Text"
}
},{
d("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})
end

local m=d("Frame",{
Size=UDim2.new(1,0,0,3),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text",
},

})

local n=d("Frame",{
Size=UDim2.new(1,
h.Icon and-28-f.UIPadding or 0,
1,0),
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},{
d("UIPadding",{
PaddingTop=UDim.new(0,f.UIPadding),
PaddingLeft=UDim.new(0,f.UIPadding),
PaddingRight=UDim.new(0,f.UIPadding),
PaddingBottom=UDim.new(0,f.UIPadding),
}),
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,-30-f.UIPadding,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=16,
ThemeTag={
TextColor3="Text"
},
Text=h.Title,
FontFace=Font.new(c.Font,Enum.FontWeight.SemiBold)
}),
d("UIListLayout",{
Padding=UDim.new(0,f.UIPadding/3)
})
})

if h.Content then
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=15,
ThemeTag={
TextColor3="Text"
},
Text=h.Content,
FontFace=Font.new(c.Font,Enum.FontWeight.Medium),
Parent=n
})
end


local o=d("CanvasGroup",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(2,0,1,0),
AnchorPoint=Vector2.new(0,1),
AutomaticSize="Y",
BackgroundTransparency=.25,
ThemeTag={
BackgroundColor3="Accent"
},

},{
d("ImageLabel",{
Name="Background",
Image=h.Background,
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ScaleType="Crop",
ImageTransparency=h.BackgroundImageTransparency

}),

j,i,
n,
k,l,
m,

})

local p=d("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
Parent=g.Holder
},{
o
})

function h.Close(q)
if not h.Closed then
h.Closed=true
e(p,0.45,{Size=UDim2.new(1,0,0,-8)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(o,0.55,{Position=UDim2.new(2,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.wait(.45)
p:Destroy()
end
end

task.spawn(function()
task.wait()
e(p,0.45,{Size=UDim2.new(
1,
0,
0,
o.AbsoluteSize.Y
)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(o,0.45,{Position=UDim2.new(0,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if h.Duration then
e(m,h.Duration,{Size=UDim2.new(0,0,0,3)},Enum.EasingStyle.Linear,Enum.EasingDirection.InOut):Play()
task.wait(h.Duration)
h:Close()
end
end)

if l then
c.AddSignal(l.TextButton.MouseButton1Click,function()
h:Close()
end)
end


return h
end

return f end function a.h()
local c={}

local d=a.load'a'
local e=d.New local f=
d.Tween


function c.new(g)
local h={
Title=g.Title or"Dialog",
Content=g.Content,
Icon=g.Icon,
IconThemed=g.IconThemed,
Thumbnail=g.Thumbnail,
Buttons=g.Buttons
}

local i=a.load'e'.Init(nil,g.WindUI.ScreenGui.Popups)
local j=i.Create(true)

local k=200

local l=430
if h.Thumbnail and h.Thumbnail.Image then
l=430+(k/2)
end

j.UIElements.Main.AutomaticSize="Y"
j.UIElements.Main.Size=UDim2.new(0,l,0,0)



local m

if h.Icon then
m=d.Image(
h.Icon,
h.Title..":"..h.Icon,
0,
g.WindUI.Window,
"Popup",
g.IconThemed
)
m.Size=UDim2.new(0,22,0,22)
m.LayoutOrder=-1
end


local n=e("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=h.Title,
TextXAlignment="Left",
FontFace=Font.new(d.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20
})

local o=e("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
e("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
m,n
})

local p=e("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





o,
})

local q
if h.Content and h.Content~=""then
q=e("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=h.Content,
TextSize=18,
TextTransparency=.2,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true
})
end

local r=e("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
e("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
HorizontalAlignment="Right"
})
})

local s
if h.Thumbnail and h.Thumbnail.Image then
local t
if h.Thumbnail.Title then
t=e("TextLabel",{
Text=h.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
s=e("ImageLabel",{
Image=h.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,k,1,0),
Parent=j.UIElements.Main,
ScaleType="Crop"
},{
t,
e("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

e("Frame",{

Size=UDim2.new(1,s and-k or 0,1,0),
Position=UDim2.new(0,s and k or 0,0,0),
BackgroundTransparency=1,
Parent=j.UIElements.Main
},{
e("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
e("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
p,
q,
r,
e("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})

local t=a.load'c'.New

for u,v in next,h.Buttons do
t(v.Title,v.Icon,v.Callback,v.Variant,r,j)
end

j:Open()


return h
end

return c end function a.i()
local c={}

local d=a.load'a'
local e=d.New local f=
d.Tween


function c.New(g,h,i)
local j=10
local k
if h and h~=""then
k=e("ImageLabel",{
Image=d.Icon(h)[1],
ImageRectSize=d.Icon(h)[2].ImageRectSize,
ImageRectOffset=d.Icon(h)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local l=e("TextLabel",{
BackgroundTransparency=1,
TextSize=16,
FontFace=Font.new(d.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,k and-29 or 0,1,0),
TextXAlignment="Left",
ThemeTag={
TextColor3="Text",
},
Text=g,
})

local m=e("TextButton",{
Size=UDim2.new(1,0,0,42),
Parent=i,
BackgroundTransparency=1,
Text="",
},{
e("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
d.NewRoundFrame(j,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
}),
d.NewRoundFrame(j,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.9,
}),
d.NewRoundFrame(j,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
e("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
e("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
k,
l,
})
})
})

return m
end


return c end function a.j()
local c={}

local d=cloneref and cloneref(game:GetService"UserInputService")or game:GetService"UserInputService"

local e=a.load'a'
local f=e.New local g=
e.Tween


function c.New(h,i,j,k)
local l=f("Frame",{
Size=UDim2.new(0,k,1,0),
BackgroundTransparency=1,
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
Parent=i,
ZIndex=999,
Active=true,
})

local m=e.NewRoundFrame(k/2,"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=l,
})

local n=f("Frame",{
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
ZIndex=999,
Parent=m,
})

local o=false
local p=0

local function updateSliderSize()
local q=h
local r=q.AbsoluteCanvasSize.Y
local s=q.AbsoluteWindowSize.Y

if r<=s then
m.Visible=false
return
end

local t=math.clamp(s/r,0.1,1)
m.Size=UDim2.new(1,0,t,0)
m.Visible=true
end

local function updateScrollingFramePosition()
local q=m.Position.Y.Scale
local r=h.AbsoluteCanvasSize.Y
local s=h.AbsoluteWindowSize.Y
local t=math.max(r-s,0)

if t<=0 then return end

local u=math.max(1-m.Size.Y.Scale,0)
if u<=0 then return end

local v=q/u

h.CanvasPosition=Vector2.new(
h.CanvasPosition.X,
v*t
)
end

local function updateThumbPosition()
if o then return end

local q=h.CanvasPosition.Y
local r=h.AbsoluteCanvasSize.Y
local s=h.AbsoluteWindowSize.Y
local t=math.max(r-s,0)

if t<=0 then
m.Position=UDim2.new(0,0,0,0)
return
end

local u=q/t
local v=math.max(1-m.Size.Y.Scale,0)
local w=math.clamp(u*v,0,v)

m.Position=UDim2.new(0,0,w,0)
end

e.AddSignal(l.InputBegan,function(q)
if(q.UserInputType==Enum.UserInputType.MouseButton1 or q.UserInputType==Enum.UserInputType.Touch)then
local r=m.AbsolutePosition.Y
local s=r+m.AbsoluteSize.Y

if not(q.Position.Y>=r and q.Position.Y<=s)then
local t=l.AbsolutePosition.Y
local u=l.AbsoluteSize.Y
local v=m.AbsoluteSize.Y

local w=q.Position.Y-t-v/2
local x=u-v

local y=math.clamp(w/x,0,1-m.Size.Y.Scale)

m.Position=UDim2.new(0,0,y,0)
updateScrollingFramePosition()
end
end
end)

e.AddSignal(n.InputBegan,function(q)
if q.UserInputType==Enum.UserInputType.MouseButton1 or q.UserInputType==Enum.UserInputType.Touch then
o=true
p=q.Position.Y-m.AbsolutePosition.Y

local r
local s

r=d.InputChanged:Connect(function(t)
if t.UserInputType==Enum.UserInputType.MouseMovement or t.UserInputType==Enum.UserInputType.Touch then
local u=l.AbsolutePosition.Y
local v=l.AbsoluteSize.Y
local w=m.AbsoluteSize.Y

local x=t.Position.Y-u-p
local y=v-w

local z=math.clamp(x/y,0,1-m.Size.Y.Scale)

m.Position=UDim2.new(0,0,z,0)
updateScrollingFramePosition()
end
end)

s=d.InputEnded:Connect(function(t)
if t.UserInputType==Enum.UserInputType.MouseButton1 or t.UserInputType==Enum.UserInputType.Touch then
o=false
if r then r:Disconnect()end
if s then s:Disconnect()end
end
end)
end
end)

e.AddSignal(h:GetPropertyChangedSignal"AbsoluteWindowSize",function()
updateSliderSize()
updateThumbPosition()
end)

e.AddSignal(h:GetPropertyChangedSignal"AbsoluteCanvasSize",function()
updateSliderSize()
updateThumbPosition()
end)

e.AddSignal(h:GetPropertyChangedSignal"CanvasPosition",function()
if not o then
updateThumbPosition()
end
end)

updateSliderSize()
updateThumbPosition()

return l
end


return c end function a.k()

local c=cloneref and cloneref(game:GetService"HttpService")or game:GetService"HttpService"

local d
d={
Window=nil,
Folder=nil,
Path=nil,
Configs={},
Parser={
Colorpicker={
Save=function(e)
return{
__type=e.__type,
value=e.Default:ToHex(),
transparency=e.Transparency or nil,
}
end,
Load=function(e,f)
if e then
e:Update(Color3.fromHex(f.value),f.transparency or nil)
end
end
},
Dropdown={
Save=function(e)
return{
__type=e.__type,
value=e.Value,
}
end,
Load=function(e,f)
if e then
e:Select(f.value)
end
end
},
Input={
Save=function(e)
return{
__type=e.__type,
value=e.Value,
}
end,
Load=function(e,f)
if e then
e:Set(f.value)
end
end
},
Keybind={
Save=function(e)
return{
__type=e.__type,
value=e.Value,
}
end,
Load=function(e,f)
if e then
e:Set(f.value)
end
end
},
Slider={
Save=function(e)
return{
__type=e.__type,
value=e.Value.Default,
}
end,
Load=function(e,f)
if e then
e:Set(f.value)
end
end
},
Toggle={
Save=function(e)
return{
__type=e.__type,
value=e.Value,
}
end,
Load=function(e,f)
if e then
e:Set(f.value)
end
end
},
}
}

function d.Init(e,f)
if not f.Folder then
warn"[ WindUI.ConfigManager ] Window.Folder is not specified."

return false
end

d.Window=f
d.Folder=f.Folder
d.Path="WindUI/"..tostring(d.Folder).."/config/"

return d
end

function d.CreateConfig(e,f)
local g={
Path=d.Path..f..".json",

Elements={}
}

if not f then
return false,"No config file is selected"
end

function g.Register(h,i,j)
g.Elements[i]=j
end

function g.Save(h)
local i={
Elements={}
}

for j,k in next,g.Elements do
if d.Parser[k.__type]then
i.Elements[tostring(j)]=d.Parser[k.__type].Save(k)
end
end

print(c:JSONEncode(i))

writefile(g.Path,c:JSONEncode(i))
end

function g.Load(h)
if not isfile(g.Path)then return false,"Invalid file"end

local i=c:JSONDecode(readfile(g.Path))

for j,k in next,i.Elements do
if g.Elements[j]and d.Parser[k.__type]then
task.spawn(function()
d.Parser[k.__type].Load(g.Elements[j],k)
end)
end
end

end


d.Configs[f]=g

return g
end

function d.AllConfigs(e)
if listfiles then
local f={}
for g,h in next,listfiles(d.Path)do
local i=h:match"([^\\/]+)%.json$"
if i then
table.insert(f,i)
end
end

return f
end
return false
end

return d end function a.l()
local c={}

local d=a.load'a'
local e=d.New
local f=d.Tween

local g=cloneref and cloneref(game:GetService"UserInputService")or game:GetService"UserInputService"

function c.New(h)
local i={
Button=nil
}

local j













local k=e("TextLabel",{
Text=h.Title,
TextSize=17,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
})

local l=e("Frame",{
Size=UDim2.new(0,36,0,36),
BackgroundTransparency=1,
Name="Drag",
},{
e("ImageLabel",{
Image=d.Icon"move"[1],
ImageRectOffset=d.Icon"move"[2].ImageRectPosition,
ImageRectSize=d.Icon"move"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
})
})
local m=e("Frame",{
Size=UDim2.new(0,1,1,0),
Position=UDim2.new(0,36,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=.9,
})

local n=e("Frame",{
Size=UDim2.new(0,0,0,0),
Position=UDim2.new(0.5,0,0,28),
AnchorPoint=Vector2.new(0.5,0.5),
Parent=h.Parent,
BackgroundTransparency=1,
Active=true,
Visible=false,
})
local o=e("TextButton",{
Size=UDim2.new(0,0,0,44),
AutomaticSize="X",
Parent=n,
Active=false,
BackgroundTransparency=.25,
ZIndex=99,
BackgroundColor3=Color3.new(0,0,0),
},{



e("UICorner",{
CornerRadius=UDim.new(1,0)
}),
e("UIStroke",{
Thickness=1,
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=0,
},{
e("UIGradient",{
Color=ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff")
})
}),
l,
m,

e("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),

e("TextButton",{
AutomaticSize="XY",
Active=true,
BackgroundTransparency=1,
Size=UDim2.new(0,0,0,36),

BackgroundColor3=Color3.new(1,1,1),
},{
e("UICorner",{
CornerRadius=UDim.new(1,-4)
}),
j,
e("UIListLayout",{
Padding=UDim.new(0,h.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
k,
e("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
}),
e("UIPadding",{
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
})
})

i.Button=o



function i.SetIcon(p,q)
if j then
j:Destroy()
end
if q then
j=d.Image(
q,
h.Title,
0,
h.Folder,
"OpenButton",
true,
h.IconThemed
)
j.Size=UDim2.new(0,22,0,22)
j.LayoutOrder=-1
j.Parent=i.Button.TextButton
end
end

if h.Icon then
i:SetIcon(h.Icon)
end



d.AddSignal(o:GetPropertyChangedSignal"AbsoluteSize",function()
n.Size=UDim2.new(
0,o.AbsoluteSize.X,
0,o.AbsoluteSize.Y
)
end)

d.AddSignal(o.TextButton.MouseEnter,function()
f(o.TextButton,.1,{BackgroundTransparency=.93}):Play()
end)
d.AddSignal(o.TextButton.MouseLeave,function()
f(o.TextButton,.1,{BackgroundTransparency=1}):Play()
end)

local p=d.Drag(n)


function i.Visible(q,r)
n.Visible=r
end

function i.Edit(q,r)
local s={
Title=r.Title,
Icon=r.Icon,
Enabled=r.Enabled,
Position=r.Position,
Draggable=r.Draggable,
OnlyMobile=r.OnlyMobile,
CornerRadius=r.CornerRadius or UDim.new(1,0),
StrokeThickness=r.StrokeThickness or 2,
Color=r.Color
or ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff"),
}



if s.Enabled==false then
h.IsOpenButtonEnabled=false
end
if s.Draggable==false and l and m then
l.Visible=s.Draggable
m.Visible=s.Draggable

if p then
p:Set(s.Draggable)
end
end
if s.Position and OpenButtonContainer then
OpenButtonContainer.Position=s.Position

end

local t=g.KeyboardEnabled or not g.TouchEnabled
c.Visible=not s.OnlyMobile or not t

if not c.Visible then return end

if k then
if s.Title then
k.Text=s.Title
elseif s.Title==nil then

end
end

if s.Icon then
i:SetIcon(s.Icon)
end

o.UIStroke.UIGradient.Color=s.Color
if Glow then
Glow.UIGradient.Color=s.Color
end

o.UICorner.CornerRadius=s.CornerRadius
o.TextButton.UICorner.CornerRadius=UDim.new(s.CornerRadius.Scale,s.CornerRadius.Offset-4)
o.UIStroke.Thickness=s.StrokeThickness
end

return i
end



return c end function a.m()
local c={}

local d=a.load'a'
local e=d.New
local f=d.Tween


function c.New(g,h)
local i={
Container=nil,
ToolTipSize=16,
}

local j=e("TextLabel",{
AutomaticSize="XY",
TextWrapped=true,
BackgroundTransparency=1,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
Text=g,
TextSize=17,
ThemeTag={
TextColor3="Text",
}
})

local k=e("UIScale",{
Scale=.9
})

local l=e("CanvasGroup",{
AnchorPoint=Vector2.new(0.5,0),
AutomaticSize="XY",
BackgroundTransparency=1,
Parent=h,
GroupTransparency=1,
Visible=false
},{
e("UISizeConstraint",{
MaxSize=Vector2.new(400,math.huge)
}),
e("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
LayoutOrder=99,
Visible=false
},{
e("ImageLabel",{
Size=UDim2.new(0,i.ToolTipSize,0,i.ToolTipSize/2),
BackgroundTransparency=1,
Rotation=180,
ThemeTag={
ImageColor3="Accent",
},
},{
e("ImageLabel",{
Size=UDim2.new(0,i.ToolTipSize,0,i.ToolTipSize/2),
BackgroundTransparency=1,
LayoutOrder=99,
ImageTransparency=.9,
ThemeTag={
ImageColor3="Text",
},
}),
}),
}),
e("Frame",{
AutomaticSize="XY",
ThemeTag={
BackgroundColor3="Accent",
},

},{
e("UICorner",{
CornerRadius=UDim.new(0,16),
}),
e("Frame",{
ThemeTag={
BackgroundColor3="Text",
},
AutomaticSize="XY",
BackgroundTransparency=.9,
},{
e("UICorner",{
CornerRadius=UDim.new(0,16),
}),
e("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),

j,
e("UIPadding",{
PaddingTop=UDim.new(0,12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,12),
}),
})
}),
k,
e("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})
i.Container=l

function i.Open(m)
l.Visible=true

f(l,.16,{GroupTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
f(k,.18,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

function i.Close(m)
f(l,.2,{GroupTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
f(k,.2,{Scale=.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.25)

l.Visible=false
l:Destroy()
end

return i
end


return c end function a.n()
local c=a.load'a'
local d=c.New
local e=c.NewRoundFrame
local f=c.Tween local g=

cloneref and cloneref(game:GetService"UserInputService")or game:GetService"UserInputService"


return function(h)
local i={
Title=h.Title,
Desc=h.Desc or nil,
Hover=h.Hover,
Thumbnail=h.Thumbnail,
ThumbnailSize=h.ThumbnailSize or 80,
Image=h.Image,
IconThemed=h.IconThemed or false,
ImageSize=h.ImageSize or 30,
Color=h.Color,
Scalable=h.Scalable,
Parent=h.Parent,
UIPadding=14,
UICorner=14,
UIElements={}
}

local j=i.ImageSize
local k=i.ThumbnailSize
local l=true


local m=0

local n
local o
if i.Thumbnail then
n=c.Image(
i.Thumbnail,
i.Title,
i.UICorner-3,
h.Window.Folder,
"Thumbnail",
false,
i.IconThemed
)
n.Size=UDim2.new(1,0,0,k)
end
if i.Image then
o=c.Image(
i.Image,
i.Title,
i.UICorner-3,
h.Window.Folder,
"Image",
i.Color and true or false
)
if i.Color=="White"then
o.ImageLabel.ImageColor3=Color3.new(0,0,0)
elseif i.Color then
o.ImageLabel.ImageColor3=Color3.new(1,1,1)
end
o.Size=UDim2.new(0,j,0,j)

m=j
end

local function CreateText(p,q)
return d("TextLabel",{
BackgroundTransparency=1,
Text=p or"",
TextSize=q=="Desc"and 15 or 17,
TextXAlignment="Left",
ThemeTag={
TextColor3=not i.Color and(q=="Desc"and"Icon"or"Text")or nil,
},
TextColor3=i.Color and(i.Color=="White"and Color3.new(0,0,0)or i.Color~="White"and Color3.new(1,1,1))or nil,
TextTransparency=i.Color and(q=="Desc"and.3 or 0),
TextWrapped=true,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(c.Font,Enum.FontWeight.Medium)
})
end

local p=CreateText(i.Title,"Title")
local q=CreateText(i.Desc,"Desc")
if not i.Desc or i.Desc==""then
q.Visible=false
end

i.UIElements.Container=d("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
d("UIListLayout",{
Padding=UDim.new(0,i.UIPadding),
FillDirection="Vertical",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
n,
d("Frame",{
Size=UDim2.new(1,-h.TextOffset,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
d("UIListLayout",{
Padding=UDim.new(0,i.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
o,
d("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,-m,0,(50-(i.UIPadding*2)))
},{
d("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
p,
q
}),
})
})

i.UIElements.Locked=e(i.UICorner,"Squircle",{
Size=UDim2.new(1,i.UIPadding*2,1,i.UIPadding*2),
ImageTransparency=.4,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=Color3.new(0,0,0),
Visible=false,
Active=false,
ZIndex=9999999,
})

i.UIElements.Main=e(i.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,50),
AutomaticSize="Y",
ImageTransparency=i.Color and.1 or.95,



Parent=h.Parent,
ThemeTag={
ImageColor3=not i.Color and"Text"or nil
},
ImageColor3=i.Color and Color3.fromHex(c.Colors[i.Color])or nil
},{
i.UIElements.Container,
i.UIElements.Locked,
d("UIPadding",{
PaddingTop=UDim.new(0,i.UIPadding),
PaddingLeft=UDim.new(0,i.UIPadding),
PaddingRight=UDim.new(0,i.UIPadding),
PaddingBottom=UDim.new(0,i.UIPadding),
}),
},true)

if i.Hover then
c.AddSignal(i.UIElements.Main.MouseEnter,function()
if l then
f(i.UIElements.Main,.05,{ImageTransparency=i.Color and.15 or.9}):Play()
end
end)
c.AddSignal(i.UIElements.Main.InputEnded,function()
if l then
f(i.UIElements.Main,.05,{ImageTransparency=i.Color and.1 or.95}):Play()
end
end)
end

function i.SetTitle(r,s)
p.Text=s
end

function i.SetDesc(r,s)
q.Text=s or""
if not s then
q.Visible=false
elseif not q.Visible then
q.Visible=true
end
end






function i.Destroy(r)
i.UIElements.Main:Destroy()
end


function i.Lock(r)
l=false
i.UIElements.Locked.Active=true
i.UIElements.Locked.Visible=true
end

function i.Unlock(r)
l=true
i.UIElements.Locked.Active=false
i.UIElements.Locked.Visible=false
end





return i
end end function a.o()
local c=a.load'a'
local d=c.New

local e={}

function e.New(f,g)
local h={
__type="Button",
Title=g.Title or"Button",
Desc=g.Desc or nil,
Locked=g.Locked or false,
Callback=g.Callback or function()end,
UIElements={}
}

local i=true

h.ButtonFrame=a.load'n'{
Title=h.Title,
Desc=h.Desc,
Parent=g.Parent,




Window=g.Window,
TextOffset=20,
Hover=true,
Scalable=true,
}

h.UIElements.ButtonIcon=d("ImageLabel",{
Image=c.Icon"mouse-pointer-click"[1],
ImageRectOffset=c.Icon"mouse-pointer-click"[2].ImageRectPosition,
ImageRectSize=c.Icon"mouse-pointer-click"[2].ImageRectSize,
BackgroundTransparency=1,
Parent=h.ButtonFrame.UIElements.Main,
Size=UDim2.new(0,20,0,20),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
ThemeTag={
ImageColor3="Text"
}
})

function h.Lock(j)
i=false
return h.ButtonFrame:Lock()
end
function h.Unlock(j)
i=true
return h.ButtonFrame:Unlock()
end

if h.Locked then
h:Lock()
end

c.AddSignal(h.ButtonFrame.UIElements.Main.MouseButton1Click,function()
if i then
task.spawn(function()
c.SafeCallback(h.Callback)
end)
end
end)
return h.__type,h
end

return e end function a.p()
local c={}

local d=a.load'a'
local e=d.New
local f=d.Tween


function c.New(g,h,i,j)
local k={}


local l=13
local m
if h and h~=""then
m=e("ImageLabel",{
Size=UDim2.new(1,-7,1,-7),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=d.Icon(h)[1],
ImageRectOffset=d.Icon(h)[2].ImageRectPosition,
ImageRectSize=d.Icon(h)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end

local n=d.NewRoundFrame(l,"Squircle",{
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text"
},
Parent=i,
Size=UDim2.new(0,42,0,26),
},{
d.NewRoundFrame(l,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
d.NewRoundFrame(l,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
e("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),


d.NewRoundFrame(l,"Squircle",{
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(0,3,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=0,
ImageColor3=Color3.new(1,1,1),
Name="Frame",
},{
m,
})
})

function k.Set(o,p)
if p then
f(n.Frame,0.1,{
Position=UDim2.new(1,-22,0.5,0),

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
f(n.Layer,0.1,{
ImageTransparency=0,
}):Play()
f(n.Stroke,0.1,{
ImageTransparency=0.95,
}):Play()

if m then
f(m,0.1,{
ImageTransparency=0,
}):Play()
end
else
f(n.Frame,0.1,{
Position=UDim2.new(0,4,0.5,0),
Size=UDim2.new(0,18,0,18),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
f(n.Layer,0.1,{
ImageTransparency=1,
}):Play()
f(n.Stroke,0.1,{
ImageTransparency=1,
}):Play()

if m then
f(m,0.1,{
ImageTransparency=1,
}):Play()
end
end

task.spawn(function()
if j then
d.SafeCallback(j,p)
end
end)


end

return n,k
end


return c end function a.q()
local c={}

local d=a.load'a'
local e=d.New
local f=d.Tween


function c.New(g,h,i,j)
local k={}

h=h or"check"

local l=10
local m=e("ImageLabel",{
Size=UDim2.new(1,-10,1,-10),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=d.Icon(h)[1],
ImageRectOffset=d.Icon(h)[2].ImageRectPosition,
ImageRectSize=d.Icon(h)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(1,1,1),
})

local n=d.NewRoundFrame(l,"Squircle",{
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text"
},
Parent=i,
Size=UDim2.new(0,27,0,27),
},{
d.NewRoundFrame(l,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
d.NewRoundFrame(l,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
e("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),

m,
})

function k.Set(o,p)
if p then
f(n.Layer,0.06,{
ImageTransparency=0,
}):Play()
f(n.Stroke,0.06,{
ImageTransparency=0.95,
}):Play()
f(m,0.06,{
ImageTransparency=0,
}):Play()
else
f(n.Layer,0.05,{
ImageTransparency=1,
}):Play()
f(n.Stroke,0.05,{
ImageTransparency=1,
}):Play()
f(m,0.06,{
ImageTransparency=1,
}):Play()
end

task.spawn(function()
if j then
d.SafeCallback(j,p)
end
end)
end

return n,k
end


return c end function a.r()
local c=a.load'a'local d=
c.New local e=
c.Tween

local f=a.load'p'.New
local g=a.load'q'.New

local h={}

function h.New(i,j)
local k={
__type="Toggle",
Title=j.Title or"Toggle",
Desc=j.Desc or nil,
Value=j.Value,
Icon=j.Icon or nil,
Type=j.Type or"Toggle",
Callback=j.Callback or function()end,
UIElements={}
}
k.ToggleFrame=a.load'n'{
Title=k.Title,
Desc=k.Desc,




Window=j.Window,
Parent=j.Parent,
TextOffset=44,
Hover=false,
}

local l=true

if k.Value==nil then
k.Value=false
end



function k.Lock(m)
l=false
return k.ToggleFrame:Lock()
end
function k.Unlock(m)
l=true
return k.ToggleFrame:Unlock()
end

if k.Locked then
k:Lock()
end

local m=k.Value

local n,o
if k.Type=="Toggle"then
n,o=f(m,k.Icon,k.ToggleFrame.UIElements.Main,k.Callback)
elseif k.Type=="Checkbox"then
n,o=g(m,k.Icon,k.ToggleFrame.UIElements.Main,k.Callback)
else
error("Unknown Toggle Type: "..tostring(k.Type))
end

n.AnchorPoint=Vector2.new(1,0.5)
n.Position=UDim2.new(1,0,0.5,0)

function k.Set(p,q)
if l then
o:Set(q)
m=q
k.Value=q
end
end

k:Set(m)

c.AddSignal(k.ToggleFrame.UIElements.Main.MouseButton1Click,function()
k:Set(not m)
end)

return k.__type,k
end

return h end function a.s()
local c=a.load'a'
local e=c.New
local f=c.Tween

local g={}

local h=false

local i=cloneref and cloneref(game:GetService"RunService")or game:GetService"RunService"
local j=cloneref and cloneref(game:GetService"UserInputService")or game:GetService"UserInputService"

function g.New(k,l)
local m={
__type="Slider",
Title=l.Title or"Slider",
Desc=l.Desc or nil,
Locked=l.Locked or nil,
Value=l.Value or{},
Step=l.Step or 1,
Callback=l.Callback or function()end,
UIElements={},
IsFocusing=false,
}
local n
local o
local p
local q=m.Value.Default or m.Value.Min or 0

local r=q
local s=(q-(m.Value.Min or 0))/((m.Value.Max or 100)-(m.Value.Min or 0))

local t=true
local u=m.Step%1~=0

local function FormatValue(v)
if u then
return string.format("%.2f",v)
else
return tostring(math.floor(v+0.5))
end
end

local function CalculateValue(v)
if u then
return math.floor(v/m.Step+0.5)*m.Step
else
return math.floor(v/m.Step+0.5)*m.Step
end
end

m.SliderFrame=a.load'n'{
Title=m.Title,
Desc=m.Desc,
Parent=l.Parent,
TextOffset=0,
Hover=false,
}

m.UIElements.SliderIcon=c.NewRoundFrame(99,"Squircle",{
ImageTransparency=.95,
Size=UDim2.new(1,-68,0,4),
Name="Frame",
ThemeTag={
ImageColor3="Text",
},
},{
c.NewRoundFrame(99,"Squircle",{
Name="Frame",
Size=UDim2.new(s,0,1,0),
ImageTransparency=.1,
ThemeTag={
ImageColor3="Button",
},
},{
c.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,13,0,13),
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Text",
},
})
})
})

m.UIElements.SliderContainer=e("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Parent=m.SliderFrame.UIElements.Container,
},{
e("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
m.UIElements.SliderIcon,
e("TextBox",{
Size=UDim2.new(0,60,0,0),
TextXAlignment="Left",
Text=FormatValue(q),
ThemeTag={
TextColor3="Text"
},
TextTransparency=.4,
AutomaticSize="Y",
TextSize=15,
FontFace=Font.new(c.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
LayoutOrder=-1,
})
})

function m.Lock(v)
t=false
return m.SliderFrame:Lock()
end
function m.Unlock(v)
t=true
return m.SliderFrame:Unlock()
end

if m.Locked then
m:Lock()
end

function m.Set(v,w,x)
if t then
if not m.IsFocusing and not h and(not x or(x.UserInputType==Enum.UserInputType.MouseButton1 or x.UserInputType==Enum.UserInputType.Touch))then
w=math.clamp(w,m.Value.Min or 0,m.Value.Max or 100)

local y=math.clamp((w-(m.Value.Min or 0))/((m.Value.Max or 100)-(m.Value.Min or 0)),0,1)
w=CalculateValue(m.Value.Min+y*(m.Value.Max-m.Value.Min))

if w~=r then
f(m.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(y,0,1,0)}):Play()
m.UIElements.SliderContainer.TextBox.Text=FormatValue(w)
m.Value.Default=FormatValue(w)
r=w
c.SafeCallback(m.Callback,FormatValue(w))
end

if x then
n=(x.UserInputType==Enum.UserInputType.Touch)
m.SliderFrame.Parent.ScrollingEnabled=false
h=true
o=i.RenderStepped:Connect(function()
local z=n and x.Position.X or j:GetMouseLocation().X
local A=math.clamp((z-m.UIElements.SliderIcon.AbsolutePosition.X)/m.UIElements.SliderIcon.AbsoluteSize.X,0,1)
w=CalculateValue(m.Value.Min+A*(m.Value.Max-m.Value.Min))

if w~=r then
f(m.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(A,0,1,0)}):Play()
m.UIElements.SliderContainer.TextBox.Text=FormatValue(w)
m.Value.Default=FormatValue(w)
r=w
c.SafeCallback(m.Callback,FormatValue(w))
end
end)
p=j.InputEnded:Connect(function(z)
if(z.UserInputType==Enum.UserInputType.MouseButton1 or z.UserInputType==Enum.UserInputType.Touch)and x==z then
o:Disconnect()
p:Disconnect()
h=false
m.SliderFrame.Parent.ScrollingEnabled=true
end
end)
end
end
end
end

c.AddSignal(m.UIElements.SliderContainer.TextBox.FocusLost,function(v)
if v then
local w=tonumber(m.UIElements.SliderContainer.TextBox.Text)
if w then
m:Set(w)
else
m.UIElements.SliderContainer.TextBox.Text=FormatValue(r)
end
end
end)

c.AddSignal(m.UIElements.SliderContainer.InputBegan,function(v)
m:Set(q,v)
end)

return m.__type,m
end

return g end function a.t()
local c=cloneref and cloneref(game:GetService"UserInputService")or game:GetService"UserInputService"

local e=a.load'a'
local f=e.New local g=
e.Tween

local h={
UICorner=6,
UIPadding=8,
}

local i=a.load'i'.New

function h.New(j,k)
local l={
__type="Keybind",
Title=k.Title or"Keybind",
Desc=k.Desc or nil,
Locked=k.Locked or false,
Value=k.Value or"F",
Callback=k.Callback or function()end,
CanChange=k.CanChange or true,
Picking=false,
UIElements={},
}

local m=true

l.KeybindFrame=a.load'n'{
Title=l.Title,
Desc=l.Desc,
Parent=k.Parent,
TextOffset=85,
Hover=l.CanChange,
}

l.UIElements.Keybind=i(l.Value,nil,l.KeybindFrame.UIElements.Main)

l.UIElements.Keybind.Size=UDim2.new(
0,24
+l.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
l.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
l.UIElements.Keybind.Position=UDim2.new(1,0,0.5,0)

f("UIScale",{
Parent=l.UIElements.Keybind,
Scale=.85,
})

e.AddSignal(l.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds",function()
l.UIElements.Keybind.Size=UDim2.new(
0,24
+l.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
end)

function l.Lock(n)
m=false
return l.KeybindFrame:Lock()
end
function l.Unlock(n)
m=true
return l.KeybindFrame:Unlock()
end

function l.Set(n,o)
l.Value=o
l.UIElements.Keybind.Frame.Frame.TextLabel.Text=o
end

if l.Locked then
l:Lock()
end

e.AddSignal(l.KeybindFrame.UIElements.Main.MouseButton1Click,function()
if m then
if l.CanChange then
l.Picking=true
l.UIElements.Keybind.Frame.Frame.TextLabel.Text="..."

task.wait(0.2)

local n
n=c.InputBegan:Connect(function(o)
local p

if o.UserInputType==Enum.UserInputType.Keyboard then
p=o.KeyCode.Name
elseif o.UserInputType==Enum.UserInputType.MouseButton1 then
p="MouseLeft"
elseif o.UserInputType==Enum.UserInputType.MouseButton2 then
p="MouseRight"
end

local q
q=c.InputEnded:Connect(function(r)
if r.KeyCode.Name==p or p=="MouseLeft"and r.UserInputType==Enum.UserInputType.MouseButton1 or p=="MouseRight"and r.UserInputType==Enum.UserInputType.MouseButton2 then
l.Picking=false

l.UIElements.Keybind.Frame.Frame.TextLabel.Text=p
l.Value=p

n:Disconnect()
q:Disconnect()
end
end)
end)
end
end
end)
e.AddSignal(c.InputBegan,function(n)
if m then
if n.KeyCode.Name==l.Value then
e.SafeCallback(l.Callback,n.KeyCode.Name)
end
end
end)
return l.__type,l
end

return h end function a.u()
local c=a.load'a'
local e=c.New local f=
c.Tween

local g={
UICorner=8,
UIPadding=8,
}local h=a.load'c'


.New
local i=a.load'd'.New

function g.New(j,k)
local l={
__type="Input",
Title=k.Title or"Input",
Desc=k.Desc or nil,
Type=k.Type or"Input",
Locked=k.Locked or false,
InputIcon=k.InputIcon or false,
Placeholder=k.Placeholder or"Enter Text...",
Value=k.Value or"",
Callback=k.Callback or function()end,
ClearTextOnFocus=k.ClearTextOnFocus or false,
UIElements={},
}

local m=true

l.InputFrame=a.load'n'{
Title=l.Title,
Desc=l.Desc,
Parent=k.Parent,
TextOffset=0,
Hover=false,
}

local n=i(l.Placeholder,l.InputIcon,l.InputFrame.UIElements.Container,l.Type,function(n)
l:Set(n)
end)
n.Size=UDim2.new(1,0,0,l.Type=="Input"and 42 or 148)

e("UIScale",{
Parent=n,
Scale=1,
})

function l.Lock(o)
m=false
return l.InputFrame:Lock()
end
function l.Unlock(o)
m=true
return l.InputFrame:Unlock()
end


function l.Set(o,p)
if m then
c.SafeCallback(l.Callback,p)

n.Frame.Frame.TextBox.Text=p
l.Value=p
end
end
function l.SetPlaceholder(o,p)
n.Frame.Frame.TextBox.PlaceholderText=p
l.Placeholder=p
end

l:Set(l.Value)

if l.Locked then
l:Lock()
end

return l.__type,l
end

return g end function a.v()
local c=cloneref and cloneref(game:GetService"UserInputService")or game:GetService"UserInputService"
local e=cloneref and cloneref(game:GetService"Players".LocalPlayer:GetMouse())or game:GetService"Players".LocalPlayer:GetMouse()
local g=cloneref and cloneref(game:GetService"Workspace".CurrentCamera)or game:GetService"Workspace".CurrentCamera

local h=a.load'a'
local i=h.New
local j=h.Tween

local k=a.load'i'.New

local l={
UICorner=10,
UIPadding=12,
MenuCorner=15,
MenuPadding=5,
TabPadding=10,
}

function l.New(m,n)
local o={
__type="Dropdown",
Title=n.Title or"Dropdown",
Desc=n.Desc or nil,
Locked=n.Locked or false,
Values=n.Values or{},
MenuWidth=n.MenuWidth or 170,
Value=n.Value,
AllowNone=n.AllowNone,
Multi=n.Multi,
Callback=n.Callback or function()end,

UIElements={},

Opened=false,
Tabs={}
}

if o.Multi and not o.Value then
o.Value={}
end

local p=true

o.DropdownFrame=a.load'n'{
Title=o.Title,
Desc=o.Desc,
Parent=n.Parent,
TextOffset=0,
Hover=false,
}


o.UIElements.Dropdown=k("",nil,o.DropdownFrame.UIElements.Container)

o.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate="AtEnd"
o.UIElements.Dropdown.Frame.Frame.TextLabel.Size=UDim2.new(1,o.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)

o.UIElements.Dropdown.Size=UDim2.new(1,0,0,40)






i("ImageLabel",{
Image=h.Icon"chevrons-up-down"[1],
ImageRectOffset=h.Icon"chevrons-up-down"[2].ImageRectPosition,
ImageRectSize=h.Icon"chevrons-up-down"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,-12,0.5,0),
ThemeTag={
ImageColor3="Icon"
},
AnchorPoint=Vector2.new(1,0.5),
Parent=o.UIElements.Dropdown.Frame
})

o.UIElements.UIListLayout=i("UIListLayout",{
Padding=UDim.new(0,l.MenuPadding),
FillDirection="Vertical"
})

o.UIElements.Menu=h.NewRoundFrame(l.MenuCorner,"Squircle",{
ThemeTag={
ImageColor3="Background",
},
ImageTransparency=0.05,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
},{
i("UIPadding",{
PaddingTop=UDim.new(0,l.MenuPadding),
PaddingLeft=UDim.new(0,l.MenuPadding),
PaddingRight=UDim.new(0,l.MenuPadding),
PaddingBottom=UDim.new(0,l.MenuPadding),
}),
i("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),

ClipsDescendants=true
},{
i("UICorner",{
CornerRadius=UDim.new(0,l.MenuCorner-l.MenuPadding),
}),
i("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
ScrollBarThickness=0,
ScrollingDirection="Y",
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
},{
o.UIElements.UIListLayout,
})
})
})

o.UIElements.MenuCanvas=i("Frame",{
Size=UDim2.new(0,o.MenuWidth,0,300),
BackgroundTransparency=1,
Position=UDim2.new(-10,0,-10,0),
Visible=false,
Active=false,

Parent=n.WindUI.DropdownGui,
AnchorPoint=Vector2.new(1,0),
},{
o.UIElements.Menu,






i("UISizeConstraint",{
MinSize=Vector2.new(170,0)
})
})

function o.Lock(q)
p=false
return o.DropdownFrame:Lock()
end
function o.Unlock(q)
p=true
return o.DropdownFrame:Unlock()
end

if o.Locked then
o:Lock()
end

local function RecalculateCanvasSize()
o.UIElements.Menu.Frame.ScrollingFrame.CanvasSize=UDim2.fromOffset(0,o.UIElements.UIListLayout.AbsoluteContentSize.Y)
end

local function RecalculateListSize()
if#o.Values>10 then
o.UIElements.MenuCanvas.Size=UDim2.fromOffset(o.UIElements.MenuCanvas.AbsoluteSize.X,392)
else
o.UIElements.MenuCanvas.Size=UDim2.fromOffset(o.UIElements.MenuCanvas.AbsoluteSize.X,o.UIElements.UIListLayout.AbsoluteContentSize.Y+(l.MenuPadding*2))
end
end

function UpdatePosition()
local q=o.UIElements.Dropdown
local r=o.UIElements.MenuCanvas

local s=g.ViewportSize.Y-(q.AbsolutePosition.Y+q.AbsoluteSize.Y)-l.MenuPadding-54
local t=r.AbsoluteSize.Y+l.MenuPadding

local u=-54
if s<t then
u=t-s-54
end

r.Position=UDim2.new(
0,
q.AbsolutePosition.X+q.AbsoluteSize.X,
0,
q.AbsolutePosition.Y+q.AbsoluteSize.Y-u+l.MenuPadding
)
end



function o.Display(q)
local r=o.Values
local s=""

if o.Multi then
for t,u in next,r do
if table.find(o.Value,u)then
s=s..u..", "
end
end
s=s:sub(1,#s-2)
else
s=o.Value or""
end

o.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(s==""and"--"or s)
end

function o.Refresh(q,r)
for s,t in next,o.UIElements.Menu.Frame.ScrollingFrame:GetChildren()do
if not t:IsA"UIListLayout"then
t:Destroy()
end
end

o.Tabs={}

for s,t in next,r do

local u={
Name=t,
Selected=false,
UIElements={},
}
u.UIElements.TabItem=h.NewRoundFrame(l.MenuCorner-l.MenuPadding,"Squircle",{
Size=UDim2.new(1,0,0,34),

ImageTransparency=1,
Parent=o.UIElements.Menu.Frame.ScrollingFrame,

ImageColor3=Color3.new(1,1,1),

},{
h.NewRoundFrame(l.MenuCorner-l.MenuPadding,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
Name="Highlight",
},{
i("UIGradient",{
Rotation=80,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
i("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
i("UIPadding",{

PaddingLeft=UDim.new(0,l.TabPadding),
PaddingRight=UDim.new(0,l.TabPadding),

}),
i("UICorner",{
CornerRadius=UDim.new(0,l.MenuCorner-l.MenuPadding)
}),













i("TextLabel",{
Text=t,
TextXAlignment="Left",
FontFace=Font.new(h.Font,Enum.FontWeight.Regular),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text"
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=.4,
AutomaticSize="Y",

Size=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
})
})
},true)


if o.Multi then
u.Selected=table.find(o.Value or{},u.Name)
else
u.Selected=o.Value==u.Name
end

if u.Selected then
u.UIElements.TabItem.ImageTransparency=.95
u.UIElements.TabItem.Highlight.ImageTransparency=.75


u.UIElements.TabItem.Frame.TextLabel.TextTransparency=0.05
end

o.Tabs[s]=u

o:Display()

local function Callback()
o:Display()
task.spawn(function()
h.SafeCallback(o.Callback,o.Value)
end)
end

h.AddSignal(u.UIElements.TabItem.MouseButton1Click,function()
if o.Multi then
if not u.Selected then
u.Selected=true
j(u.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
j(u.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()

j(u.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=0}):Play()
table.insert(o.Value,u.Name)
else
if not o.AllowNone and#o.Value==1 then
return
end
u.Selected=false
j(u.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
j(u.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()

j(u.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=.4}):Play()
for v,w in ipairs(o.Value)do
if w==u.Name then
table.remove(o.Value,v)
break
end
end
end
else
for v,w in next,o.Tabs do

j(w.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
j(w.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()

j(w.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=.5}):Play()
w.Selected=false
end
u.Selected=true
j(u.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
j(u.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()

j(u.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=0.05}):Play()
o.Value=u.Name
end
Callback()
end)

RecalculateCanvasSize()
RecalculateListSize()
end

local s=0
for t,u in next,o.Tabs do
if u.UIElements.TabItem.Frame.TextLabel then

local v=u.UIElements.TabItem.Frame.TextLabel.TextBounds.X
s=math.max(s,v)
end
end

o.UIElements.MenuCanvas.Size=UDim2.new(0,s+6+6+5+5+18+6+6,o.UIElements.MenuCanvas.Size.Y.Scale,o.UIElements.MenuCanvas.Size.Y.Offset)

end


o:Refresh(o.Values)

function o.Select(q,r)
if r then
o.Value=r
else
if o.Multi then
o.Value={}
else
o.Value=nil

end
end
o:Refresh(o.Values)
end


RecalculateListSize()

function o.Open(q)
if p then
o.UIElements.Menu.Visible=true
o.UIElements.MenuCanvas.Visible=true
o.UIElements.MenuCanvas.Active=true
o.UIElements.Menu.Size=UDim2.new(
1,0,
0,0
)
j(o.UIElements.Menu,0.1,{
Size=UDim2.new(
1,0,
1,0
)
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(.1)
o.Opened=true
end)




UpdatePosition()
end
end
function o.Close(q)
o.Opened=false

j(o.UIElements.Menu,0.25,{
Size=UDim2.new(
1,0,
0,0
)
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()


task.spawn(function()
task.wait(.2)
o.UIElements.Menu.Visible=false
end)

task.spawn(function()
task.wait(.25)
o.UIElements.MenuCanvas.Visible=false
o.UIElements.MenuCanvas.Active=false
end)
end

h.AddSignal(o.UIElements.Dropdown.MouseButton1Click,function()
o:Open()
end)

h.AddSignal(c.InputBegan,function(q)
if
q.UserInputType==Enum.UserInputType.MouseButton1
or q.UserInputType==Enum.UserInputType.Touch
then
local r,s=o.UIElements.MenuCanvas.AbsolutePosition,o.UIElements.MenuCanvas.AbsoluteSize
if
n.Window.CanDropdown
and o.Opened
and(e.X<r.X
or e.X>r.X+s.X
or e.Y<(r.Y-20-1)
or e.Y>r.Y+s.Y
)
then
o:Close()
end
end
end)

h.AddSignal(o.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition",UpdatePosition)

return o.__type,o
end

return l end function a.w()






local c={}
local e={
lua={
"and","break","or","else","elseif","if","then","until","repeat","while","do","for","in","end",
"local","return","function","export",
},
rbx={
"game","workspace","script","math","string","table","task","wait","select","next","Enum",
"tick","assert","shared","loadstring","tonumber","tostring","type",
"typeof","unpack","Instance","CFrame","Vector3","Vector2","Color3","UDim","UDim2","Ray","BrickColor",
"OverlapParams","RaycastParams","Axes","Random","Region3","Rect","TweenInfo",
"collectgarbage","not","utf8","pcall","xpcall","_G","setmetatable","getmetatable","os","pairs","ipairs"
},
operators={
"#","+","-","*","%","/","^","=","~","=","<",">",
}
}

local g={
numbers=Color3.fromHex"#FAB387",
boolean=Color3.fromHex"#FAB387",
operator=Color3.fromHex"#94E2D5",
lua=Color3.fromHex"#CBA6F7",
rbx=Color3.fromHex"#F38BA8",
str=Color3.fromHex"#A6E3A1",
comment=Color3.fromHex"#9399B2",
null=Color3.fromHex"#F38BA8",
call=Color3.fromHex"#89B4FA",
self_call=Color3.fromHex"#89B4FA",
local_property=Color3.fromHex"#CBA6F7",
}

local function createKeywordSet(h)
local i={}
for j,k in ipairs(h)do
i[k]=true
end
return i
end

local h=createKeywordSet(e.lua)
local i=createKeywordSet(e.rbx)
local j=createKeywordSet(e.operators)

local function getHighlight(k,l)
local m=k[l]

if g[m.."_color"]then
return g[m.."_color"]
end

if tonumber(m)then
return g.numbers
elseif m=="nil"then
return g.null
elseif m:sub(1,2)=="--"then
return g.comment
elseif j[m]then
return g.operator
elseif h[m]then
return g.lua
elseif i[m]then
return g.rbx
elseif m:sub(1,1)=="\""or m:sub(1,1)=="\'"then
return g.str
elseif m=="true"or m=="false"then
return g.boolean
end

if k[l+1]=="("then
if k[l-1]==":"then
return g.self_call
end

return g.call
end

if k[l-1]=="."then
if k[l-2]=="Enum"then
return g.rbx
end

return g.local_property
end
end

function c.run(k)
local l={}
local m=""

local n=false
local o=false
local p=false

for q=1,#k do
local r=k:sub(q,q)

if o then
if r=="\n"and not p then
table.insert(l,m)
table.insert(l,r)
m=""

o=false
elseif k:sub(q-1,q)=="]]"and p then
m..="]"

table.insert(l,m)
m=""

o=false
p=false
else
m=m..r
end
elseif n then
if r==n and k:sub(q-1,q-1)~="\\"or r=="\n"then
m=m..r
n=false
else
m=m..r
end
else
if k:sub(q,q+1)=="--"then
table.insert(l,m)
m="-"
o=true
p=k:sub(q+2,q+3)=="[["
elseif r=="\""or r=="\'"then
table.insert(l,m)
m=r
n=r
elseif j[r]then
table.insert(l,m)
table.insert(l,r)
m=""
elseif r:match"[%w_]"then
m=m..r
else
table.insert(l,m)
table.insert(l,r)
m=""
end
end
end

table.insert(l,m)

local q={}

for r,s in ipairs(l)do
local t=getHighlight(l,r)

if t then
local u=string.format("<font color = \"#%s\">%s</font>",t:ToHex(),s:gsub("<","&lt;"):gsub(">","&gt;"))

table.insert(q,u)
else
table.insert(q,s)
end
end

return table.concat(q)
end

return c end function a.x()
local c={}

local e=a.load'a'
local g=e.New
local h=e.Tween

local i=a.load'w'

function c.New(j,k,l,m,n)
local o={
Radius=12,
Padding=10
}

local p=g("TextLabel",{
Text="",
TextColor3=Color3.fromHex"#CDD6F4",
TextTransparency=0,
TextSize=14,
TextWrapped=false,
LineHeight=1.15,
RichText=true,
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
AutomaticSize="XY",
},{
g("UIPadding",{
PaddingTop=UDim.new(0,o.Padding+3),
PaddingLeft=UDim.new(0,o.Padding+3),
PaddingRight=UDim.new(0,o.Padding+3),
PaddingBottom=UDim.new(0,o.Padding+3),
})
})
p.Font="Code"

local q=g("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticCanvasSize="X",
ScrollingDirection="X",
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
},{
p
})

local r=g("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(0,30,0,30),
Position=UDim2.new(1,-o.Padding/2,0,o.Padding/2),
AnchorPoint=Vector2.new(1,0),
Visible=m and true or false,
},{
e.NewRoundFrame(o.Radius-4,"Squircle",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Button",
},{
g("UIScale",{
Scale=1,
}),
g("ImageLabel",{
Image=e.Icon"copy"[1],
ImageRectSize=e.Icon"copy"[2].ImageRectSize,
ImageRectOffset=e.Icon"copy"[2].ImageRectPosition,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,12,0,12),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.1,
})
})
})

e.AddSignal(r.MouseEnter,function()
h(r.Button,.05,{ImageTransparency=.95}):Play()
h(r.Button.UIScale,.05,{Scale=.9}):Play()
end)
e.AddSignal(r.InputEnded,function()
h(r.Button,.08,{ImageTransparency=1}):Play()
h(r.Button.UIScale,.08,{Scale=1}):Play()
end)

e.NewRoundFrame(o.Radius,"Squircle",{



ImageColor3=Color3.fromHex"#212121",
ImageTransparency=.035,
Size=UDim2.new(1,0,0,20+(o.Padding*2)),
AutomaticSize="Y",
Parent=l,
},{
e.NewRoundFrame(o.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.955,
}),
g("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
},{
e.NewRoundFrame(o.Radius,"Squircle-TL-TR",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.96,
Size=UDim2.new(1,0,0,20+(o.Padding*2)),
Visible=k and true or false
},{
g("ImageLabel",{
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.2,
}),
g("TextLabel",{
Text=k,



TextColor3=Color3.fromHex"#ffffff",
TextTransparency=.2,
TextSize=16,
AutomaticSize="Y",
FontFace=Font.new(e.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
BackgroundTransparency=1,
TextTruncate="AtEnd",
Size=UDim2.new(1,r and-20-(o.Padding*2),0,0)
}),
g("UIPadding",{

PaddingLeft=UDim.new(0,o.Padding+3),
PaddingRight=UDim.new(0,o.Padding+3),

}),
g("UIListLayout",{
Padding=UDim.new(0,o.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
q,
g("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
})
}),
r,
})

e.AddSignal(p:GetPropertyChangedSignal"TextBounds",function()
q.Size=UDim2.new(1,0,0,(p.TextBounds.Y/(n or 1))+((o.Padding+3)*2))
end)

function o.Set(s)
p.Text=i.run(s)
end

o.Set(j)

e.AddSignal(r.MouseButton1Click,function()
if m then
m()
local s=e.Icon"check"
r.Button.ImageLabel.Image=s[1]
r.Button.ImageLabel.ImageRectSize=s[2].ImageRectSize
r.Button.ImageLabel.ImageRectOffset=s[2].ImageRectPosition
end
end)
return o
end


return c end function a.y()
local c=a.load'a'local e=
c.New


local g=a.load'x'

local h={}

function h.New(i,j)
local k={
__type="Code",
Title=j.Title,
Code=j.Code,
UIElements={}
}

local l=not k.Locked











local m=g.New(k.Code,k.Title,j.Parent,function()
if l then
local m=k.Title or"code"
local n,o=pcall(function()
toclipboard(k.Code)
end)
if n then
j.WindUI:Notify{
Title="Success",
Content="The "..m.." copied to your clipboard.",
Icon="check",
Duration=5,
}
else
j.WindUI:Notify{
Title="Error",
Content="The "..m.." is not copied. Error: "..o,
Icon="x",
Duration=5,
}
end
end
end,j.WindUI.UIScale)

function k.SetCode(n,o)
m.Set(o)
end

return k.__type,k
end

return h end function a.z()
local c=a.load'a'
local e=c.New local g=
c.Tween

local h=cloneref and cloneref(game:GetService"UserInputService")or game:GetService"UserInputService"local i=
cloneref and cloneref(game:GetService"TouchInputService")or game:GetService"TouchInputService"
local j=cloneref and cloneref(game:GetService"RunService")or game:GetService"RunService"
local k=cloneref and cloneref(game:GetService"Players")or game:GetService"Players"

local l=j.RenderStepped
local m=k.LocalPlayer
local n=m:GetMouse()

local o=a.load'c'.New
local p=a.load'd'.New

local q={
UICorner=8,
UIPadding=8
}

function q.Colorpicker(r,s,t)
local u={
__type="Colorpicker",
Title=s.Title,
Desc=s.Desc,
Default=s.Default,
Callback=s.Callback,
Transparency=s.Transparency,
UIElements=s.UIElements,
}

function u.SetHSVFromRGB(v,w)
local x,y,z=Color3.toHSV(w)
u.Hue=x
u.Sat=y
u.Vib=z
end

u:SetHSVFromRGB(u.Default)

local v=a.load'e'.Init(s.Window)
local w=v.Create()

u.ColorpickerFrame=w



local x,y,z=u.Hue,u.Sat,u.Vib

u.UIElements.Title=e("TextLabel",{
Text=u.Title,
TextSize=20,
FontFace=Font.new(c.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=w.UIElements.Main
},{
e("UIPadding",{
PaddingTop=UDim.new(0,8),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,8),
})
})





local A=e("ImageLabel",{
Size=UDim2.new(0,18,0,18),
ScaleType=Enum.ScaleType.Fit,
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
})

u.UIElements.SatVibMap=e("ImageLabel",{
Size=UDim2.fromOffset(160,158),
Position=UDim2.fromOffset(0,40),
BackgroundColor3=Color3.fromHSV(x,1,1),
BackgroundTransparency=0,
Parent=w.UIElements.Main,
},{
e("UICorner",{
CornerRadius=UDim.new(0,8),
}),
e("UIStroke",{
Thickness=.6,
ThemeTag={
Color="Text"
},
Transparency=.8,
}),
A,
})

u.UIElements.Inputs=e("Frame",{
AutomaticSize="XY",
Size=UDim2.new(0,0,0,0),
Position=UDim2.fromOffset(u.Transparency and 240 or 210,40),
BackgroundTransparency=1,
Parent=w.UIElements.Main
},{
e("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection="Vertical",
})
})





local B=e("Frame",{
BackgroundColor3=u.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=u.Transparency,
},{
e("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

e("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(85,208),
Size=UDim2.fromOffset(75,24),
Parent=w.UIElements.Main,
},{
e("UICorner",{
CornerRadius=UDim.new(0,8),
}),
e("UIStroke",{
Thickness=1,
Transparency=0.8,
ThemeTag={
Color="Text"
}
}),
B,
})

local C=e("Frame",{
BackgroundColor3=u.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
ZIndex=9,
},{
e("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

e("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,208),
Size=UDim2.fromOffset(75,24),
Parent=w.UIElements.Main,
},{
e("UICorner",{
CornerRadius=UDim.new(0,8),
}),
e("UIStroke",{
Thickness=1,
Transparency=0.8,
ThemeTag={
Color="Text"
}
}),
C,
})

local D={}

for E=0,1,0.1 do
table.insert(D,ColorSequenceKeypoint.new(E,Color3.fromHSV(E,1,1)))
end

local E=e("UIGradient",{
Color=ColorSequence.new(D),
Rotation=90,
})

local F=e("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local G=e("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=F,


BackgroundColor3=u.Default
},{
e("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
e("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

local H=e("Frame",{
Size=UDim2.fromOffset(10,192),
Position=UDim2.fromOffset(180,40),
Parent=w.UIElements.Main,
},{
e("UICorner",{
CornerRadius=UDim.new(1,0),
}),
E,
F,
})


function CreateNewInput(I,J)
local K=p(I,nil,u.UIElements.Inputs)

e("TextLabel",{
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=17,
FontFace=Font.new(c.Font,Enum.FontWeight.Regular),
AutomaticSize="XY",
ThemeTag={
TextColor3="Placeholder",
},
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-12,0.5,0),
Parent=K.Frame,
Text=I,
})

e("UIScale",{
Parent=K,
Scale=.85,
})

K.Frame.Frame.TextBox.Text=J
K.Size=UDim2.new(0,150,0,42)

return K
end

local function ToRGB(I)
return{
R=math.floor(I.R*255),
G=math.floor(I.G*255),
B=math.floor(I.B*255)
}
end

local I=CreateNewInput("Hex","#"..u.Default:ToHex())

local J=CreateNewInput("Red",ToRGB(u.Default).R)
local K=CreateNewInput("Green",ToRGB(u.Default).G)
local L=CreateNewInput("Blue",ToRGB(u.Default).B)
local M
if u.Transparency then
M=CreateNewInput("Alpha",((1-u.Transparency)*100).."%")
end

local N=e("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,254),
BackgroundTransparency=1,
Parent=w.UIElements.Main,
LayoutOrder=4,
},{
e("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
}),
})

local O={
{
Title="Cancel",
Variant="Secondary",
Callback=function()end
},
{
Title="Apply",
Icon="chevron-right",
Variant="Primary",
Callback=function()t(Color3.fromHSV(u.Hue,u.Sat,u.Vib),u.Transparency)end
}
}

for P,Q in next,O do
local R=o(Q.Title,Q.Icon,Q.Callback,Q.Variant,N,w,true)
R.Size=UDim2.new(0.5,-3,0,40)
R.AutomaticSize="None"
end



local P,Q,R
if u.Transparency then
local S=e("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
})

Q=e("ImageLabel",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
ThemeTag={
BackgroundColor3="Text",
},
Parent=S,

},{
e("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
e("UICorner",{
CornerRadius=UDim.new(1,0),
})

})

R=e("Frame",{
Size=UDim2.fromScale(1,1),
},{
e("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
e("UICorner",{
CornerRadius=UDim.new(0,6),
}),
})

P=e("Frame",{
Size=UDim2.fromOffset(10,192),
Position=UDim2.fromOffset(210,40),
Parent=w.UIElements.Main,
BackgroundTransparency=1,
},{
e("UICorner",{
CornerRadius=UDim.new(1,0),
}),
e("ImageLabel",{
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{
e("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
R,
S,
})
end

function u.Round(S,T,U)
if U==0 then
return math.floor(T)
end
T=tostring(T)
return T:find"%."and tonumber(T:sub(1,T:find"%."+U))or T
end


function u.Update(S,T,U)
if T then x,y,z=Color3.toHSV(T)else x,y,z=u.Hue,u.Sat,u.Vib end

u.UIElements.SatVibMap.BackgroundColor3=Color3.fromHSV(x,1,1)
A.Position=UDim2.new(y,0,1-z,0)
C.BackgroundColor3=Color3.fromHSV(x,y,z)
G.BackgroundColor3=Color3.fromHSV(x,1,1)
G.Position=UDim2.new(0.5,0,x,0)

I.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(x,y,z):ToHex()
J.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(x,y,z)).R
K.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(x,y,z)).G
L.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(x,y,z)).B

if U or u.Transparency then
C.BackgroundTransparency=u.Transparency or U
R.BackgroundColor3=Color3.fromHSV(x,y,z)
Q.BackgroundColor3=Color3.fromHSV(x,y,z)
Q.BackgroundTransparency=u.Transparency or U
Q.Position=UDim2.new(0.5,0,1-u.Transparency or U,0)
M.Frame.Frame.TextBox.Text=u:Round((1-u.Transparency or U)*100,0).."%"
end
end

u:Update(u.Default,u.Transparency)




local function GetRGB()
local S=Color3.fromHSV(u.Hue,u.Sat,u.Vib)
return{R=math.floor(S.r*255),G=math.floor(S.g*255),B=math.floor(S.b*255)}
end



local function clamp(S,T,U)
return math.clamp(tonumber(S)or 0,T,U)
end

c.AddSignal(I.Frame.Frame.TextBox.FocusLost,function(S)
if S then
local T=I.Frame.Frame.TextBox.Text:gsub("#","")
local U,V=pcall(Color3.fromHex,T)
if U and typeof(V)=="Color3"then
u.Hue,u.Sat,u.Vib=Color3.toHSV(V)
u:Update()
u.Default=V
end
end
end)

local function updateColorFromInput(S,T)
c.AddSignal(S.Frame.Frame.TextBox.FocusLost,function(U)
if U then
local V=S.Frame.Frame.TextBox
local W=GetRGB()
local X=clamp(V.Text,0,255)
V.Text=tostring(X)

W[T]=X
local Y=Color3.fromRGB(W.R,W.G,W.B)
u.Hue,u.Sat,u.Vib=Color3.toHSV(Y)
u:Update()
end
end)
end

updateColorFromInput(J,"R")
updateColorFromInput(K,"G")
updateColorFromInput(L,"B")

if u.Transparency then
c.AddSignal(M.Frame.Frame.TextBox.FocusLost,function(S)
if S then
local T=M.Frame.Frame.TextBox
local U=clamp(T.Text,0,100)
T.Text=tostring(U)

u.Transparency=1-U*0.01
u:Update(nil,u.Transparency)
end
end)
end



local S=u.UIElements.SatVibMap
c.AddSignal(S.InputBegan,function(T)
if T.UserInputType==Enum.UserInputType.MouseButton1 or T.UserInputType==Enum.UserInputType.Touch then
while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local U=S.AbsolutePosition.X
local V=U+S.AbsoluteSize.X
local W=math.clamp(n.X,U,V)

local X=S.AbsolutePosition.Y
local Y=X+S.AbsoluteSize.Y
local Z=math.clamp(n.Y,X,Y)

u.Sat=(W-U)/(V-U)
u.Vib=1-((Z-X)/(Y-X))
u:Update()

l:Wait()
end
end
end)

c.AddSignal(H.InputBegan,function(T)
if T.UserInputType==Enum.UserInputType.MouseButton1 or T.UserInputType==Enum.UserInputType.Touch then
while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local U=H.AbsolutePosition.Y
local V=U+H.AbsoluteSize.Y
local W=math.clamp(n.Y,U,V)

u.Hue=((W-U)/(V-U))
u:Update()

l:Wait()
end
end
end)

if u.Transparency then
c.AddSignal(P.InputBegan,function(T)
if T.UserInputType==Enum.UserInputType.MouseButton1 or T.UserInputType==Enum.UserInputType.Touch then
while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local U=P.AbsolutePosition.Y
local V=U+P.AbsoluteSize.Y
local W=math.clamp(n.Y,U,V)

u.Transparency=1-((W-U)/(V-U))
u:Update()

l:Wait()
end
end
end)
end

return u
end

function q.New(r,s)
local t={
__type="Colorpicker",
Title=s.Title or"Colorpicker",
Desc=s.Desc or nil,
Locked=s.Locked or false,
Default=s.Default or Color3.new(1,1,1),
Callback=s.Callback or function()end,
Window=s.Window,
Transparency=s.Transparency,
UIElements={}
}

local u=true


t.ColorpickerFrame=a.load'n'{
Title=t.Title,
Desc=t.Desc,
Parent=s.Parent,
TextOffset=40,
Hover=false,
}

t.UIElements.Colorpicker=c.NewRoundFrame(q.UICorner,"Squircle",{
ImageTransparency=0,
Active=true,
ImageColor3=t.Default,
Parent=t.ColorpickerFrame.UIElements.Main,
Size=UDim2.new(0,30,0,30),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
ZIndex=2
},nil,true)


function t.Lock(v)
u=false
return t.ColorpickerFrame:Lock()
end
function t.Unlock(v)
u=true
return t.ColorpickerFrame:Unlock()
end

if t.Locked then
t:Lock()
end


function t.Update(v,w,x)
t.UIElements.Colorpicker.ImageTransparency=x or 0
t.UIElements.Colorpicker.ImageColor3=w
t.Default=w
if x then
t.Transparency=x
end
end

function t.Set(v,w,x)
return t:Update(w,x)
end

c.AddSignal(t.UIElements.Colorpicker.MouseButton1Click,function()
if u then
q:Colorpicker(t,function(v,w)
t:Update(v,w)
t.Default=v
t.Transparency=w
c.SafeCallback(t.Callback,v,w)
end).ColorpickerFrame:Open()
end
end)

return t.__type,t
end

return q end function a.A()
local c=a.load'a'
local e=c.New
local h=c.Tween

local i={}

function i.New(j,k)
local l={
__type="Section",
Title=k.Title or"Section",
Icon=k.Icon,
TextXAlignment=k.TextXAlignment or"Left",
TextSize=k.TextSize or 19,
UIElements={},
}

local m
if l.Icon then
m=c.Image(
l.Icon,
l.Icon..":"..l.Title,
0,
k.Window.Folder,
l.__type,
true
)
m.Size=UDim2.new(0,24,0,24)
end

l.UIElements.Main=e("TextLabel",{
BackgroundTransparency=1,
TextXAlignment="Left",
AutomaticSize="XY",
TextSize=l.TextSize,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(c.Font,Enum.FontWeight.SemiBold),


Text=l.Title,
})

e("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=k.Parent,
},{
m,
l.UIElements.Main,
e("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=l.TextXAlignment,
}),
e("UIPadding",{
PaddingTop=UDim.new(0,4),
PaddingBottom=UDim.new(0,2),
})
})





function l.SetTitle(n,o)
l.UIElements.Main.Text=o
end
function l.Destroy(n)
l.UIElements.Main.AutomaticSize="None"
l.UIElements.Main.Size=UDim2.new(1,0,0,l.UIElements.Main.TextBounds.Y)

h(l.UIElements.Main,.1,{TextTransparency=1}):Play()
task.wait(.1)
h(l.UIElements.Main,.15,{Size=UDim2.new(1,0,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end

return l.__type,l
end

return i end function a.B()local c=
cloneref and cloneref(game:GetService"UserInputService")or game:GetService"UserInputService"
local e=cloneref and cloneref(game:GetService"Players")or game:GetService"Players".LocalPlayer:GetMouse()

local h=a.load'a'
local i=h.New
local j=h.Tween

local k=a.load'c'.New
local l=a.load'm'.New
local m=a.load'j'.New


local n={
Window=nil,
WindUI=nil,
Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(n)end
}

function n.Init(o,p,q,r)
n.Window=o
n.WindUI=p
n.ToolTipParent=q
n.TabHighlight=r
return n
end

function n.New(o)
local p={
__type="Tab",
Title=o.Title or"Tab",
Desc=o.Desc,
Icon=o.Icon,
IconThemed=o.IconThemed,
Locked=o.Locked,
ShowTabTitle=o.ShowTabTitle,
Selected=false,
Index=nil,
Parent=o.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
UICorner=n.Window.UICorner-(n.Window.UIPadding/2),
}

local q=n.Window
local r=n.WindUI

n.TabCount=n.TabCount+1
local s=n.TabCount
p.Index=s

p.UIElements.Main=h.NewRoundFrame(p.UICorner,"Squircle",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=o.Parent,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
},{
h.NewRoundFrame(p.UICorner,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
i("UIGradient",{
Rotation=80,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
h.NewRoundFrame(p.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Frame",
},{
i("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
i("TextLabel",{
Text=p.Title,
ThemeTag={
TextColor3="Text"
},
TextTransparency=not p.Locked and 0.4 or.7,
TextSize=15,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(h.Font,Enum.FontWeight.Medium),
TextWrapped=true,
RichText=true,
AutomaticSize="Y",
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
i("UIPadding",{
PaddingTop=UDim.new(0,2+(q.UIPadding/2)),
PaddingLeft=UDim.new(0,4+(q.UIPadding/2)),
PaddingRight=UDim.new(0,4+(q.UIPadding/2)),
PaddingBottom=UDim.new(0,2+(q.UIPadding/2)),
})
}),
},true)

local t=0
local u
local v

if p.Icon then
u=h.Image(
p.Icon,
p.Icon..":"..p.Title,
0,
n.Window.Folder,
p.__type,
true,
p.IconThemed
)
u.Size=UDim2.new(0,16,0,16)
u.Parent=p.UIElements.Main.Frame
u.ImageLabel.ImageTransparency=not p.Locked and 0 or.7
p.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,-30,0,0)
t=-30

p.UIElements.Icon=u


v=h.Image(
p.Icon,
p.Icon..":"..p.Title,
0,
n.Window.Folder,
p.__type,
true,
p.IconThemed
)
v.Size=UDim2.new(0,16,0,16)
v.ImageLabel.ImageTransparency=not p.Locked and 0 or.7
t=-30




end

p.UIElements.ContainerFrame=i("ScrollingFrame",{
Size=UDim2.new(1,0,1,p.ShowTabTitle and-((q.UIPadding*2.4)+12)or 0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,0),
AutomaticCanvasSize="Y",

ScrollingDirection="Y",
},{
i("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
i("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,6),
HorizontalAlignment="Center",
})
})





p.UIElements.ContainerFrameCanvas=i("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
Parent=q.UIElements.MainBar,
ZIndex=5,
},{
p.UIElements.ContainerFrame,
i("Frame",{
Size=UDim2.new(1,0,0,((q.UIPadding*2.4)+12)),
BackgroundTransparency=1,
Visible=p.ShowTabTitle or false,
Name="TabTitle"
},{
v,
i("TextLabel",{
Text=p.Title,
ThemeTag={
TextColor3="Text"
},
TextSize=20,
TextTransparency=.1,
Size=UDim2.new(1,-t,1,0),
FontFace=Font.new(h.Font,Enum.FontWeight.SemiBold),
TextTruncate="AtEnd",
RichText=true,
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
i("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
i("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
i("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
},
Position=UDim2.new(0,0,0,((q.UIPadding*2.4)+12)),
Visible=p.ShowTabTitle or false,
})
})

n.Containers[s]=p.UIElements.ContainerFrameCanvas
n.Tabs[s]=p

p.ContainerFrame=ContainerFrameCanvas

h.AddSignal(p.UIElements.Main.MouseButton1Click,function()
if not p.Locked then
n:SelectTab(s)
end
end)

m(p.UIElements.ContainerFrame,p.UIElements.ContainerFrameCanvas,q,3)

local w
local x
local y
local z=false



if p.Desc then


h.AddSignal(p.UIElements.Main.InputBegan,function()
z=true
x=task.spawn(function()
task.wait(0.35)
if z and not w then
w=l(p.Desc,n.ToolTipParent)

local function updatePosition()
if w then
w.Container.Position=UDim2.new(0,e.X,0,e.Y-20)
end
end

updatePosition()
y=e.Move:Connect(updatePosition)
w:Open()
end
end)
end)

end

h.AddSignal(p.UIElements.Main.MouseEnter,function()
if not p.Locked then
j(p.UIElements.Main.Frame,0.08,{ImageTransparency=.97}):Play()
end
end)
h.AddSignal(p.UIElements.Main.InputEnded,function()
if p.Desc then
z=false
if x then
task.cancel(x)
x=nil
end
if y then
y:Disconnect()
y=nil
end
if w then
w:Close()
w=nil
end
end

if not p.Locked then
j(p.UIElements.Main.Frame,0.08,{ImageTransparency=1}):Play()
end
end)



local A={
Button=a.load'o',
Toggle=a.load'r',
Slider=a.load's',
Keybind=a.load't',
Input=a.load'u',
Dropdown=a.load'v',
Code=a.load'y',
Colorpicker=a.load'z',
Section=a.load'A',
}

function p.Divider(B)
local C=i("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local D=i("Frame",{
Parent=p.UIElements.ContainerFrame,
Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
C
})

return D
end

function p.Paragraph(B,C)
C.Parent=p.UIElements.ContainerFrame
C.Window=q
C.Hover=false

C.TextOffset=0
C.IsButtons=C.Buttons and#C.Buttons>0 and true or false

local D={
__type="Paragraph",
Title=C.Title or"Paragraph",
Desc=C.Desc or nil,

Locked=C.Locked or false,
}
local E=a.load'n'(C)

D.ParagraphFrame=E
if C.Buttons and#C.Buttons>0 then
local F=i("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=E.UIElements.Container
},{
i("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
})
})


for G,H in next,C.Buttons do
local I=k(H.Title,H.Icon,H.Callback,"White",F)
I.Size=UDim2.new(1,0,0,38)

end
end

function D.SetTitle(F,G)
D.ParagraphFrame:SetTitle(G)
end
function D.SetDesc(F,G)
D.ParagraphFrame:SetDesc(G)
end
function D.Destroy(F)
D.ParagraphFrame:Destroy()
end

table.insert(p.Elements,D)
return D
end

for B,C in pairs(A)do
p[B]=function(D,E)
E.Parent=D.UIElements.ContainerFrame
E.Window=q
E.WindUI=r local

F, G=C:New(E)
table.insert(D.Elements,G)

local H
for I,J in pairs(G)do
if typeof(J)=="table"and I:match"Frame$"then
H=J
break
end
end

if H then
function G.SetTitle(I,J)
H:SetTitle(J)
end
function G.SetDesc(I,J)
H:SetDesc(J)
end
function G.Destroy(I)
H:Destroy()
end
end
return G
end
end


task.spawn(function()
local B=i("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-q.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=p.UIElements.ContainerFrame
},{
i("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),
i("ImageLabel",{
Size=UDim2.new(0,48,0,48),
Image=h.Icon"frown"[1],
ImageRectOffset=h.Icon"frown"[2].ImageRectPosition,
ImageRectSize=h.Icon"frown"[2].ImageRectSize,
ThemeTag={
ImageColor3="Icon"
},
BackgroundTransparency=1,
ImageTransparency=.6,
}),
i("TextLabel",{
AutomaticSize="XY",
Text="This tab is empty",
ThemeTag={
TextColor3="Text"
},
TextSize=18,
TextTransparency=.5,
BackgroundTransparency=1,
FontFace=Font.new(h.Font,Enum.FontWeight.Medium),
})
})





h.AddSignal(p.UIElements.ContainerFrame.ChildAdded,function()
B.Visible=false
end)
end)

return p
end

function n.OnChange(o,p)
n.OnChangeFunc=p
end

function n.SelectTab(o,p)
if not n.Tabs[p].Locked then
n.SelectedTab=p

for q,r in next,n.Tabs do
if not r.Locked then
j(r.UIElements.Main,0.15,{ImageTransparency=1}):Play()
j(r.UIElements.Main.Outline,0.15,{ImageTransparency=1}):Play()
j(r.UIElements.Main.Frame.TextLabel,0.15,{TextTransparency=0.3}):Play()
if r.UIElements.Icon then
j(r.UIElements.Icon.ImageLabel,0.15,{ImageTransparency=0.4}):Play()
end
r.Selected=false
end
end
j(n.Tabs[p].UIElements.Main,0.15,{ImageTransparency=0.95}):Play()
j(n.Tabs[p].UIElements.Main.Outline,0.15,{ImageTransparency=0.85}):Play()
j(n.Tabs[p].UIElements.Main.Frame.TextLabel,0.15,{TextTransparency=0}):Play()
if n.Tabs[p].UIElements.Icon then
j(n.Tabs[p].UIElements.Icon.ImageLabel,0.15,{ImageTransparency=0.1}):Play()
end
n.Tabs[p].Selected=true


task.spawn(function()
for q,r in next,n.Containers do
r.AnchorPoint=Vector2.new(0,0.05)
r.Visible=false
end
n.Containers[p].Visible=true
j(n.Containers[p],0.15,{AnchorPoint=Vector2.new(0,0)},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()
end)

n.OnChangeFunc(p)
end
end

return n end function a.C()
local c={}


local e=a.load'a'
local h=e.New
local i=e.Tween

local j=a.load'B'

function c.New(k,l,m,n)
local o={
Title=k.Title or"Section",
Icon=k.Icon,
IconThemed=k.IconThemed,
Opened=k.Opened or false,

HeaderSize=42,
IconSize=18,

Expandable=false,
}

local p
if o.Icon then
p=e.Image(
o.Icon,
o.Icon,
0,
m,
"Section",
true,
o.IconThemed
)

p.Size=UDim2.new(0,o.IconSize,0,o.IconSize)
p.ImageLabel.ImageTransparency=.25
end

local q=h("Frame",{
Size=UDim2.new(0,o.IconSize,0,o.IconSize),
BackgroundTransparency=1,
Visible=false
},{
h("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=e.Icon"chevron-down"[1],
ImageRectSize=e.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=e.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})

local r=h("Frame",{
Size=UDim2.new(1,0,0,o.HeaderSize),
BackgroundTransparency=1,
Parent=l,
ClipsDescendants=true,
},{
h("TextButton",{
Size=UDim2.new(1,0,0,o.HeaderSize),
BackgroundTransparency=1,
Text="",
},{
p,
h("TextLabel",{
Text=o.Title,
TextXAlignment="Left",
Size=UDim2.new(
1,
p and(-o.IconSize-10)*2
or(-o.IconSize-10),

1,
0
),
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(e.Font,Enum.FontWeight.SemiBold),
TextSize=14,
BackgroundTransparency=1,
TextTransparency=.7,

TextWrapped=true
}),
h("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,10)
}),
q,
h("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
})
}),
h("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,o.HeaderSize)
},{
h("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,0),
VerticalAlignment="Bottom",
}),
})
})


function o.Tab(s,t)
if not o.Expandable then
o.Expandable=true
q.Visible=true
end
t.Parent=r.Content
return j.New(t)
end

function o.Open(s)
if o.Expandable then
o.Opened=true
i(r,0.33,{
Size=UDim2.new(1,0,0,o.HeaderSize+(r.Content.AbsoluteSize.Y/n))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

i(q.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function o.Close(s)
if o.Expandable then
o.Opened=false
i(r,0.26,{
Size=UDim2.new(1,0,0,o.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
i(q.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

e.AddSignal(r.TextButton.MouseButton1Click,function()
if o.Expandable then
if o.Opened then
o:Close()
else
o:Open()
end
end
end)

if o.Opened then
task.spawn(function()
task.wait()
o:Open()
end)
end



return o
end


return c end function a.D()
return{
Tab="table-of-contents",
Paragraph="type",
Button="square-mouse-pointer",
Toggle="toggle-right",
Slider="sliders-horizontal",
Keybind="command",
Input="text-cursor-input",
Dropdown="chevrons-up-down",
Code="terminal",
Colorpicker="palette",
}end function a.E()local c=
cloneref and cloneref(game:GetService"UserInputService")or game:GetService"UserInputService"

local e={
Margin=8,
Padding=9,
}


local h=a.load'a'
local i=h.New
local j=h.Tween


function e.new(k,l,m)
local n={
IconSize=14,
Padding=14,
Radius=18,
Width=400,
MaxHeight=380,

Icons=a.load'D'
}


local o=i("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(
1,
-((n.IconSize*2)+(n.Padding*2)),
0,
0
),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(h.Font,Enum.FontWeight.Regular),
TextSize=17,
})

local p=i("ImageLabel",{
Image=h.Icon"x"[1],
ImageRectSize=h.Icon"x"[2].ImageRectSize,
ImageRectOffset=h.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,n.IconSize,0,n.IconSize)
},{
i("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
Active=true,
ZIndex=999999999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})

local q=i("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ElasticBehavior="Never",
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=false
},{
i("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
i("UIPadding",{
PaddingTop=UDim.new(0,n.Padding),
PaddingLeft=UDim.new(0,n.Padding),
PaddingRight=UDim.new(0,n.Padding),
PaddingBottom=UDim.new(0,n.Padding),
})
})

local r=h.NewRoundFrame(n.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Accent",
},
ImageTransparency=0,
},{
i("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,

Visible=false,
},{
i("Frame",{
Size=UDim2.new(1,0,0,46),
BackgroundTransparency=1,
},{








i("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
i("ImageLabel",{
Image=h.Icon"search"[1],
ImageRectSize=h.Icon"search"[2].ImageRectSize,
ImageRectOffset=h.Icon"search"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.05,
Size=UDim2.new(0,n.IconSize,0,n.IconSize)
}),
o,
p,
i("UIListLayout",{
Padding=UDim.new(0,n.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
i("UIPadding",{
PaddingLeft=UDim.new(0,n.Padding),
PaddingRight=UDim.new(0,n.Padding),
})
})
}),
i("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Results",
},{
i("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="Outline",
},
BackgroundTransparency=.9,
Visible=false,
}),
q,
i("UISizeConstraint",{
MaxSize=Vector2.new(n.Width,n.MaxHeight),
}),
}),
i("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
})
})

local s=i("Frame",{
Size=UDim2.new(0,n.Width,0,0),
AutomaticSize="Y",
Parent=l,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,

ZIndex=99999999,
},{
i("UIScale",{
Scale=.9,
}),
r,
h.NewRoundFrame(n.Radius,"SquircleOutline2",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=.7,
},{
i("UIGradient",{
Rotation=45,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.55),
NumberSequenceKeypoint.new(0.5,0.8),
NumberSequenceKeypoint.new(1,0.6)
}
})
})
})

local function CreateSearchTab(t,u,v,w,x,y)
local z=i("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=w or nil
},{
h.NewRoundFrame(n.Radius-4,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main"
},{
i("UIPadding",{
PaddingTop=UDim.new(0,n.Padding-2),
PaddingLeft=UDim.new(0,n.Padding),
PaddingRight=UDim.new(0,n.Padding),
PaddingBottom=UDim.new(0,n.Padding-2),
}),
i("ImageLabel",{
Image=h.Icon(v)[1],
ImageRectSize=h.Icon(v)[2].ImageRectSize,
ImageRectOffset=h.Icon(v)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,n.IconSize,0,n.IconSize)
}),
i("Frame",{
Size=UDim2.new(1,-n.IconSize-n.Padding,0,0),
BackgroundTransparency=1,
},{
i("TextLabel",{
Text=t,
ThemeTag={
TextColor3="Text",
},
TextSize=17,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(h.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Title"
}),
i("TextLabel",{
Text=u or"",
Visible=u and true or false,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=.2,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(h.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Desc"
})or nil,
i("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
})
}),
i("UIListLayout",{
Padding=UDim.new(0,n.Padding),
FillDirection="Horizontal",
})
},true),
i("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-n.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=x,

},{
h.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,2,1,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=.9,
}),
i("Frame",{
Size=UDim2.new(1,-n.Padding-2,0,0),
Position=UDim2.new(0,n.Padding+2,0,0),
BackgroundTransparency=1,
},{
i("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
}),
i("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
HorizontalAlignment="Right"
})
})



z.Main.Size=UDim2.new(
1,
0,
0,
z.Main.Frame.Desc.Visible and(((n.Padding-2)*2)+z.Main.Frame.Title.TextBounds.Y+6+z.Main.Frame.Desc.TextBounds.Y)
or(((n.Padding-2)*2)+z.Main.Frame.Title.TextBounds.Y)
)

h.AddSignal(z.Main.MouseEnter,function()
j(z.Main,.04,{ImageTransparency=.95}):Play()
end)
h.AddSignal(z.Main.InputEnded,function()
j(z.Main,.08,{ImageTransparency=1}):Play()
end)
h.AddSignal(z.Main.MouseButton1Click,function()
if y then
y()
end
end)

return z
end

local function ContainsText(t,u)
if not u or u==""then
return false
end

if not t or t==""then
return false
end

local v=string.lower(t)
local w=string.lower(u)

return string.find(v,w,1,true)~=nil
end

local function Search(t)
if not t or t==""then
return{}
end

local u={}
for v,w in next,k.Tabs do
local x=ContainsText(w.Title or"",t)
local y={}

for z,A in next,w.Elements do
if A.__type~="Section"then
local B=ContainsText(A.Title or"",t)
local C=ContainsText(A.Desc or"",t)

if B or C then
y[z]={
Title=A.Title,
Desc=A.Desc,
Original=A,
__type=A.__type
}
end
end
end

if x or next(y)~=nil then
u[v]={
Tab=w,
Title=w.Title,
Icon=w.Icon,
Elements=y,
}
end
end
return u
end

function n.Search(t,u)
u=u or""

local v=Search(u)

q.Visible=true
r.Frame.Results.Frame.Visible=true
for w,x in next,q:GetChildren()do
if x.ClassName~="UIListLayout"and x.ClassName~="UIPadding"then
x:Destroy()
end
end

if v and next(v)~=nil then
for w,x in next,v do
local y=n.Icons.Tab
local z=CreateSearchTab(x.Title,nil,y,q,true,function()
n:Close()
k:SelectTab(w)
end)
if x.Elements and next(x.Elements)~=nil then
for A,B in next,x.Elements do
local C=n.Icons[B.__type]
CreateSearchTab(B.Title,B.Desc,C,z:FindFirstChild"ParentContainer"and z.ParentContainer.Frame or nil,false,function()
n:Close()
k:SelectTab(w)

end)

end
end
end
elseif u~=""then
i("TextLabel",{
Size=UDim2.new(1,0,0,70),
BackgroundTransparency=1,
Text="No results found",
TextSize=16,
ThemeTag={
TextColor3="Text",
},
TextTransparency=.2,
BackgroundTransparency=1,
FontFace=Font.new(h.Font,Enum.FontWeight.Medium),
Parent=q,
Name="NotFound",
})
else
q.Visible=false
r.Frame.Results.Frame.Visible=false
end
end

h.AddSignal(o:GetPropertyChangedSignal"Text",function()
n:Search(o.Text)
end)

h.AddSignal(q.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()

j(q,.06,{Size=UDim2.new(
1,
0,
0,
math.clamp(q.UIListLayout.AbsoluteContentSize.Y+(n.Padding*2),0,n.MaxHeight)
)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function n.Open(t)
task.spawn(function()
r.Frame.Visible=true
s.Visible=true
j(s.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function n.Close(t)
task.spawn(function()
m()
r.Frame.Visible=false
j(s.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.12)
s.Visible=false
end)
end

h.AddSignal(p.TextButton.MouseButton1Click,function()
n:Close()
end)

n:Open()

return n
end

return e end function a.F()
local c=cloneref and cloneref(game:GetService"UserInputService")or game:GetService"UserInputService"local e=
cloneref and cloneref(game:GetService"RunService")or game:GetService"RunService"

local h=cloneref and cloneref(workspace.CurrentCamera)or workspace.CurrentCamera

local i=a.load'a'
local j=i.New
local k=i.Tween


local l=a.load'i'.New
local m=a.load'c'.New
local n=a.load'j'.New

local o=a.load'k'

local p=false

return function(q)
local r={
Title=q.Title or"UI Library",
Author=q.Author,
Icon=q.Icon,
IconThemed=q.IconThemed,
Folder=q.Folder,
Resizable=q.Resizable,
Background=q.Background,
BackgroundImageTransparency=q.BackgroundImageTransparency or 0,
User=q.User or{},
Size=q.Size and UDim2.new(
0,math.clamp(q.Size.X.Offset,480,700),
0,math.clamp(q.Size.Y.Offset,350,520))or UDim2.new(0,580,0,460),
ToggleKey=q.ToggleKey or Enum.KeyCode.G,
Transparent=q.Transparent or false,
HideSearchBar=q.HideSearchBar,
ScrollBarEnabled=q.ScrollBarEnabled or false,
SideBarWidth=q.SideBarWidth or 200,

Position=UDim2.new(0.5,0,0.5,0),
UICorner=16,
UIPadding=14,
UIElements={},
CanDropdown=true,
Closed=false,
Parent=q.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=false,
IsOpenButtonEnabled=true,

ConfigManager=nil,
CurrentTab=nil,
TabModule=nil,

OnCloseCallback=nil,
OnDestroyCallback=nil,

TopBarButtons={},

}

if r.HideSearchBar~=false then
r.HideSearchBar=true
end
if r.Resizable~=false then
r.CanResize=true
r.Resizable=true
end

if r.Folder then
makefolder("WindUI/"..r.Folder)
end

local s=j("UICorner",{
CornerRadius=UDim.new(0,r.UICorner)
})

r.ConfigManager=o:Init(r)



local t=j("Frame",{
Size=UDim2.new(0,32,0,32),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(.5,.5),
BackgroundTransparency=1,
ZIndex=99,
Active=true
},{
j("ImageLabel",{
Size=UDim2.new(0,96,0,96),
BackgroundTransparency=1,
Position=UDim2.new(0.5,-16,0.5,-16),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
})
})
local u=i.NewRoundFrame(r.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=98,
Active=false,
},{
j("ImageLabel",{
Size=UDim2.new(0,70,0,70),
Image=i.Icon"expand"[1],
ImageRectOffset=i.Icon"expand"[2].ImageRectPosition,
ImageRectSize=i.Icon"expand"[2].ImageRectSize,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})

local v=i.NewRoundFrame(r.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})










r.UIElements.SideBar=j("ScrollingFrame",{
Size=UDim2.new(
1,
r.ScrollBarEnabled and-3-(r.UIPadding/2)or 0,
1,
not r.HideSearchBar and-45 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ClipsDescendants=true,
VerticalScrollBarPosition="Left",
},{
j("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Frame",
},{
j("UIPadding",{
PaddingTop=UDim.new(0,r.UIPadding/2),


PaddingBottom=UDim.new(0,r.UIPadding/2),
}),
j("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,0)
})
}),
j("UIPadding",{

PaddingLeft=UDim.new(0,r.UIPadding/2),
PaddingRight=UDim.new(0,r.UIPadding/2),

}),

})

r.UIElements.SideBarContainer=j("Frame",{
Size=UDim2.new(0,r.SideBarWidth,1,r.User.Enabled and-94-(r.UIPadding*2)or-52),
Position=UDim2.new(0,0,0,52),
BackgroundTransparency=1,
Visible=true,
},{
j("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(
1,
0,
1,
not r.HideSearchBar and-45-r.UIPadding/2 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
}),
r.UIElements.SideBar,
})

if r.ScrollBarEnabled then
n(r.UIElements.SideBar,r.UIElements.SideBarContainer.Content,r,3)
end


r.UIElements.MainBar=j("Frame",{
Size=UDim2.new(1,-r.UIElements.SideBarContainer.AbsoluteSize.X,1,-52),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
i.NewRoundFrame(r.UICorner-(r.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ZIndex=3,
ImageTransparency=.95,
Name="Background",
}),
j("UIPadding",{
PaddingTop=UDim.new(0,r.UIPadding/2),
PaddingLeft=UDim.new(0,r.UIPadding/2),
PaddingRight=UDim.new(0,r.UIPadding/2),
PaddingBottom=UDim.new(0,r.UIPadding/2),
})
})

local w=j("ImageLabel",{
ImageColor3=Color3.new(0,0,0),
ImageTransparency=1,
Size=UDim2.new(1,120,1,116),
Position=UDim2.new(0,-60,0,-58),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})

local x

if c.TouchEnabled and not c.KeyboardEnabled then
x=false
elseif c.KeyboardEnabled then
x=true
else
x=nil
end









local y
if r.User.Enabled then local
z, A=(cloneref and cloneref(game:GetService"Players")or game:GetService"Players"):GetUserThumbnailAsync(
r.User.Anonymous and 1 or game.Players.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)

y=j("TextButton",{
Size=UDim2.new(0,
(r.UIElements.SideBarContainer.AbsoluteSize.X)-(r.UIPadding/2),
0,
42+(r.UIPadding)
),
Position=UDim2.new(0,r.UIPadding/2,1,-(r.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
},{
i.NewRoundFrame(r.UICorner-(r.UIPadding/2),"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
j("UIGradient",{
Rotation=78,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
i.NewRoundFrame(r.UICorner-(r.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="UserIcon",
},{
j("ImageLabel",{
Image=z,
BackgroundTransparency=1,
Size=UDim2.new(0,42,0,42),
ThemeTag={
BackgroundColor3="Text",
},
BackgroundTransparency=.93,
},{
j("UICorner",{
CornerRadius=UDim.new(1,0)
})
}),
j("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
j("TextLabel",{
Text=r.User.Anonymous and"Anonymous"or game.Players.LocalPlayer.DisplayName,
TextSize=17,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(i.Font,Enum.FontWeight.SemiBold),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
}),
j("TextLabel",{
Text=r.User.Anonymous and"@anonymous"or"@"..game.Players.LocalPlayer.Name,
TextSize=15,
TextTransparency=.6,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(i.Font,Enum.FontWeight.Medium),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
}),
j("UIListLayout",{
Padding=UDim.new(0,4),
HorizontalAlignment="Left",
})
}),
j("UIListLayout",{
Padding=UDim.new(0,r.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
j("UIPadding",{
PaddingLeft=UDim.new(0,r.UIPadding/2),
PaddingRight=UDim.new(0,r.UIPadding/2),
})
})
})

if r.User.Callback then
i.AddSignal(y.MouseButton1Click,function()
r.User.Callback()
end)
i.AddSignal(y.MouseEnter,function()
k(y.UserIcon,0.04,{ImageTransparency=.95}):Play()
k(y.Outline,0.04,{ImageTransparency=.85}):Play()
end)
i.AddSignal(y.InputEnded,function()
k(y.UserIcon,0.04,{ImageTransparency=1}):Play()
k(y.Outline,0.04,{ImageTransparency=1}):Play()
end)
end
end

local z
local A


local B=i.NewRoundFrame(99,"Squircle",{
ImageTransparency=.8,
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(0,0,0,4),
Position=UDim2.new(0.5,0,1,4),
AnchorPoint=Vector2.new(0.5,0),
},{
j("Frame",{
Size=UDim2.new(1,12,1,12),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
ZIndex=99,
})
})

local C=j("TextLabel",{
Text=r.Title,
FontFace=Font.new(i.Font,Enum.FontWeight.SemiBold),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Title",
TextXAlignment="Left",
TextSize=16,
ThemeTag={
TextColor3="Text"
}
})

r.UIElements.Main=j("Frame",{
Size=r.Size,
Position=r.Position,
BackgroundTransparency=1,
Parent=q.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
},{
w,
i.NewRoundFrame(r.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,-240),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="Background"
},

},{
j("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=r.Background,
ImageTransparency=1,
ScaleType="Crop",
},{
j("UICorner",{
CornerRadius=UDim.new(0,r.UICorner)
}),
}),
B,
t,



}),
UIStroke,
s,
u,
v,
j("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
j("UICorner",{
CornerRadius=UDim.new(0,r.UICorner)
}),
r.UIElements.SideBarContainer,
r.UIElements.MainBar,

y,

A,
j("Frame",{
Size=UDim2.new(1,0,0,52),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar"
},{
z,






j("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left"
},{
j("UIListLayout",{
Padding=UDim.new(0,r.UIPadding+4),
SortOrder="LayoutOrder",
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
j("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Name="Title",
Size=UDim2.new(0,0,1,0),
LayoutOrder=2,
},{
j("UIListLayout",{
Padding=UDim.new(0,0),
SortOrder="LayoutOrder",
FillDirection="Vertical",
VerticalAlignment="Top",
}),
C,
}),
j("UIPadding",{
PaddingLeft=UDim.new(0,4)
})
}),
j("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
Name="Right",
},{
j("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),

}),
j("UIPadding",{
PaddingTop=UDim.new(0,r.UIPadding),
PaddingLeft=UDim.new(0,r.UIPadding),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,r.UIPadding),
})
})
})
})


function r.CreateTopbarButton(D,E,F,G,H,I)
local J=i.Image(
F,
F,
0,
r.Folder,
"TopbarIcon",
true,
I
)
J.Size=UDim2.new(0,16,0,16)
J.AnchorPoint=Vector2.new(0.5,0.5)
J.Position=UDim2.new(0.5,0,0.5,0)

local K=i.NewRoundFrame(9,"Squircle",{
Size=UDim2.new(0,36,0,36),
LayoutOrder=H or 999,
Parent=r.UIElements.Main.Main.Topbar.Right,

ZIndex=9999,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=1
},{
i.NewRoundFrame(9,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
j("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
J
},true)



r.TopBarButtons[100-H]={
Name=E,
Object=K
}

i.AddSignal(K.MouseButton1Click,function()
G()
end)
i.AddSignal(K.MouseEnter,function()
k(K,.15,{ImageTransparency=.93}):Play()
k(K.Outline,.15,{ImageTransparency=.75}):Play()

end)
i.AddSignal(K.MouseLeave,function()
k(K,.1,{ImageTransparency=1}):Play()
k(K.Outline,.1,{ImageTransparency=1}):Play()

end)

return K
end



local D=i.Drag(
r.UIElements.Main,
{r.UIElements.Main.Main.Topbar,B.Frame},
function(D,E)
if not r.Closed then
if D and E==B.Frame then
k(B,.1,{ImageTransparency=.35}):Play()
else
k(B,.2,{ImageTransparency=.8}):Play()
end
end
end
)














if r.Author then
j("TextLabel",{
Text=r.Author,
FontFace=Font.new(i.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.4,
AutomaticSize="XY",
Parent=r.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=13,
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
}
})

end

local E=a.load'l'.New(r)


task.spawn(function()
if r.Icon then

local F=i.Image(
r.Icon,
r.Title,
0,
r.Folder,
"Window",
true,
r.IconThemed
)
F.Parent=r.UIElements.Main.Main.Topbar.Left
F.Size=UDim2.new(0,22,0,22)

E:SetIcon(r.Icon)











else
E:SetIcon(r.Icon)
OpenButtonIcon.Visible=false
end
end)

function r.SetToggleKey(F,G)
r.ToggleKey=G
end

function r.SetBackgroundImage(F,G)
r.UIElements.Main.Background.ImageLabel.Image=G
end
function r.SetBackgroundImageTransparency(F,G)
r.UIElements.Main.Background.ImageLabel.ImageTransparency=G
r.BackgroundImageTransparency=G
end

local F
local G
i.Icon"minimize"
i.Icon"maximize"

r:CreateTopbarButton("Fullscreen","maximize",function()
r:ToggleFullscreen()
end,998)

function r.ToggleFullscreen(H)
local I=r.IsFullscreen

D:Set(I)

if not I then
F=r.UIElements.Main.Position
G=r.UIElements.Main.Size

r.CanResize=false
else
if r.Resizable then
r.CanResize=true
end
end

k(r.UIElements.Main,0.45,{Size=I and G or UDim2.new(1,-20,1,-72)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

k(r.UIElements.Main,0.45,{Position=I and F or UDim2.new(0.5,0,0.5,26)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()



r.IsFullscreen=not I
end


r:CreateTopbarButton("Minimize","minus",function()
r:Close()
task.spawn(function()
task.wait(.3)
if not x and r.IsOpenButtonEnabled then

E:Visible(true)
end
end)

local H=x and"Press "..r.ToggleKey.Name.." to re-open the window."or"Click the button to re-open the window."

if not r.IsOpenButtonEnabled then
p=true
end
if not p then
p=not p
q.WindUI:Notify{
Title="Minimize",
Content=H,
Icon="eye-off",
Duration=5,
}
end
end,997)

function r.OnClose(H,I)
r.OnCloseCallback=I
end
function r.OnDestroy(H,I)
r.OnDestroyCallback=I
end

function r.Open(H)
task.spawn(function()
task.wait(.06)
r.Closed=false

k(r.UIElements.Main.Background,0.2,{
ImageTransparency=r.Transparent and q.WindUI.TransparencyValue or 0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

k(r.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,0),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()

k(r.UIElements.Main.Background.ImageLabel,0.2,{ImageTransparency=r.BackgroundImageTransparency},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

k(w,0.25,{ImageTransparency=.7},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
k(UIStroke,0.25,{Transparency=.8},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

task.spawn(function()
task.wait(.5)
k(B,.45,{Size=UDim2.new(0,200,0,4),ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
task.wait(.45)
D:Set(true)
if r.Resizable then
k(t.ImageLabel,.45,{ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
r.CanResize=true
end
end)


r.CanDropdown=true

r.UIElements.Main.Visible=true
task.spawn(function()
task.wait(.05)
r.UIElements.Main.Main.Visible=true
end)
end)
end
function r.Close(H)
local I={}

if r.OnCloseCallback then
task.spawn(function()
i.SafeCallback(r.OnCloseCallback)
end)
end

r.UIElements.Main.Main.Visible=false
r.CanDropdown=false
r.Closed=true

k(r.UIElements.Main.Background,0.32,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()

k(r.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,-240),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()


k(r.UIElements.Main.Background.ImageLabel,0.2,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
k(w,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
k(UIStroke,0.25,{Transparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

k(B,.3,{Size=UDim2.new(0,0,0,4),ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()
k(t.ImageLabel,.3,{ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
D:Set(false)
r.CanResize=false

task.spawn(function()
task.wait(0.4)
r.UIElements.Main.Visible=false
end)

function I.Destroy(J)
if r.OnDestroyCallback then
task.spawn(function()
i.SafeCallback(r.OnDestroyCallback)
end)
end
r.Destroyed=true
task.wait(0.4)
q.Parent.Parent:Destroy()


end

return I
end

function r.ToggleTransparency(H,I)

r.Transparent=I
q.WindUI.Transparent=I

r.UIElements.Main.Background.ImageTransparency=I and q.WindUI.TransparencyValue or 0

r.UIElements.MainBar.Background.ImageTransparency=I and 0.97 or 0.95

end


function r.SetUIScale(H,I)
q.WindUI.UIScale=I
k(q.WindUI.ScreenGui.UIScale,.2,{Scale=I},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

do

if(h.ViewportSize.X-40<r.UIElements.Main.AbsoluteSize.X)
or(h.ViewportSize.Y-40<r.UIElements.Main.AbsoluteSize.Y)then
if not r.IsFullscreen then
r:SetUIScale(.9)
end
end
end

if not x and r.IsOpenButtonEnabled then
i.AddSignal(E.Button.TextButton.MouseButton1Click,function()

E:Visible(false)
r:Open()
end)
end

i.AddSignal(c.InputBegan,function(H,I)
if I then return end

if H.KeyCode==r.ToggleKey then
if r.Closed then
r:Open()
else
r:Close()
end
end
end)

task.spawn(function()

r:Open()
end)

function r.EditOpenButton(H,I)
return E:Edit(I)
end


local H=a.load'B'
local I=a.load'C'
local J=H.Init(r,q.WindUI,q.RandomFolder3)
J:OnChange(function(K)r.CurrentTab=K end)

r.TabModule=H

function r.Tab(K,L)
L.Parent=r.UIElements.SideBar.Frame
return J.New(L)
end

function r.SelectTab(K,L)
J:SelectTab(L)
end

function r.Section(K,L)
return I.New(L,r.UIElements.SideBar.Frame,r.Folder,q.WindUI.UIScale)
end

function r.IsResizable(K,L)
r.Resizable=L
r.CanResize=L
end

function r.Divider(K)
local L=j("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local M=j("Frame",{
Parent=r.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
L
})

return M
end

local K=a.load'e'.Init(r,nil)
function r.Dialog(L,M)
local N={
Title=M.Title or"Dialog",
Width=M.Width or 320,
Content=M.Content,
Buttons=M.Buttons or{},

TextPadding=10,
}
local O=K.Create(false)

O.UIElements.Main.Size=UDim2.new(0,N.Width,0,0)

local P=j("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=O.UIElements.Main
},{
j("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,O.UIPadding),
VerticalAlignment="Center"
}),
j("UIPadding",{
PaddingTop=UDim.new(0,N.TextPadding),
PaddingLeft=UDim.new(0,N.TextPadding),
PaddingRight=UDim.new(0,N.TextPadding),
})
})

local Q
if M.Icon then
Q=i.Image(
M.Icon,
N.Title..":"..M.Icon,
0,
r,
"Dialog",
true,
M.IconThemed
)
Q.Size=UDim2.new(0,22,0,22)
Q.Parent=P
end

O.UIElements.UIListLayout=j("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
Parent=O.UIElements.Main
})

j("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=O.UIElements.Main,
})


O.UIElements.Title=j("TextLabel",{
Text=N.Title,
TextSize=20,
FontFace=Font.new(i.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,Q and-26-O.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=P
})
if N.Content then
j("TextLabel",{
Text=N.Content,
TextSize=18,
TextTransparency=.4,
TextWrapped=true,
RichText=true,
FontFace=Font.new(i.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=O.UIElements.Main
},{
j("UIPadding",{
PaddingLeft=UDim.new(0,N.TextPadding),
PaddingRight=UDim.new(0,N.TextPadding),
PaddingBottom=UDim.new(0,N.TextPadding),
})
})
end

local R=j("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
})

local S=j("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=O.UIElements.Main,
LayoutOrder=4,
},{
R,
})


local T={}

for U,V in next,N.Buttons do
local W=m(V.Title,V.Icon,V.Callback,V.Variant,S,O,true)
table.insert(T,W)
end

local function CheckButtonsOverflow()
R.FillDirection=Enum.FillDirection.Horizontal
R.HorizontalAlignment=Enum.HorizontalAlignment.Right
R.VerticalAlignment=Enum.VerticalAlignment.Center
S.AutomaticSize=Enum.AutomaticSize.None

for U,V in ipairs(T)do
V.Size=UDim2.new(0,0,1,0)
V.AutomaticSize=Enum.AutomaticSize.X
end

wait()

local U=R.AbsoluteContentSize.X
local V=S.AbsoluteSize.X

if U>V then
R.FillDirection=Enum.FillDirection.Vertical
R.HorizontalAlignment=Enum.HorizontalAlignment.Right
R.VerticalAlignment=Enum.VerticalAlignment.Bottom
S.AutomaticSize=Enum.AutomaticSize.Y

for W,X in ipairs(T)do
X.Size=UDim2.new(1,0,0,40)
X.AutomaticSize=Enum.AutomaticSize.None
end
else
local W=V-U
if W>0 then
local X
local Y=math.huge

for Z,_ in ipairs(T)do
local aa=_.AbsoluteSize.X
if aa<Y then
Y=aa
X=_
end
end

if X then
X.Size=UDim2.new(0,Y+W,1,0)
X.AutomaticSize=Enum.AutomaticSize.None
end
end
end
end

i.AddSignal(O.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize",CheckButtonsOverflow)
CheckButtonsOverflow()

wait()
O:Open()

return O
end

r:CreateTopbarButton("Close","x",function()
k(r.UIElements.Main,0.35,{Position=UDim2.new(0.5,0,0.5,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
r:Dialog{

Title="Close Window",
Content="Are you sure?",
Buttons={
{
Title="Cancel",

Callback=function()end,
Variant="Secondary",
},
{
Title="Close Window",

Callback=function()r:Close():Destroy()end,
Variant="Primary",
}
}
}
end,999)


local function startResizing(aa)
if r.CanResize then
isResizing=true
u.Active=true
initialSize=r.UIElements.Main.Size
initialInputPosition=aa.Position
k(u,0.12,{ImageTransparency=.65}):Play()
k(u.ImageLabel,0.12,{ImageTransparency=0}):Play()
k(t.ImageLabel,0.1,{ImageTransparency=.35}):Play()

i.AddSignal(aa.Changed,function()
if aa.UserInputState==Enum.UserInputState.End then
isResizing=false
u.Active=false
k(u,0.2,{ImageTransparency=1}):Play()
k(u.ImageLabel,0.17,{ImageTransparency=1}):Play()
k(t.ImageLabel,0.17,{ImageTransparency=.8}):Play()
end
end)
end
end

i.AddSignal(t.InputBegan,function(aa)
if aa.UserInputType==Enum.UserInputType.MouseButton1 or aa.UserInputType==Enum.UserInputType.Touch then
if r.CanResize then
startResizing(aa)
end
end
end)

i.AddSignal(c.InputChanged,function(aa)
if aa.UserInputType==Enum.UserInputType.MouseMovement or aa.UserInputType==Enum.UserInputType.Touch then
if isResizing and r.CanResize then
local L=aa.Position-initialInputPosition
local M=UDim2.new(0,initialSize.X.Offset+L.X*2,0,initialSize.Y.Offset+L.Y*2)

k(r.UIElements.Main,0,{
Size=UDim2.new(
0,math.clamp(M.X.Offset,480,700),
0,math.clamp(M.Y.Offset,350,520)
)}):Play()
end
end
end)




if not r.HideSearchBar then
local aa=a.load'E'
local L=false





















local M=l("Search","search",r.UIElements.SideBarContainer)
M.Size=UDim2.new(1,-r.UIPadding/2,0,39)
M.Position=UDim2.new(0,r.UIPadding/2,0,r.UIPadding/2)

i.AddSignal(M.MouseButton1Click,function()
if L then return end

aa.new(r.TabModule,r.UIElements.Main,function()

L=false
if r.Resizable then
r.CanResize=true
end

k(v,0.1,{ImageTransparency=1}):Play()
v.Active=false
end)
k(v,0.1,{ImageTransparency=.65}):Play()
v.Active=true

L=true
r.CanResize=false
end)
end




function r.DisableTopbarButtons(aa,L)
for M,N in next,L do
for O,P in next,r.TopBarButtons do
if P.Name==N then
P.Object.Visible=false
end
end
end
end

return r
end end end
local aa={
Window=nil,
Theme=nil,
Creator=a.load'a',
Themes=a.load'b',
Transparent=false,

TransparencyValue=.15,

UIScale=1,

ConfigManager=nil
}


local c=a.load'f'

local e=aa.Themes
local h=aa.Creator

local i=h.New local j=
h.Tween

h.Themes=e

local k=cloneref and cloneref(game:GetService"Players")or game:GetService"Players"
local l=k and k.LocalPlayer or nil
aa.Themes=e

local m=protectgui or(syn and syn.protect_gui)or function()end

local n=cloneref and cloneref(game:GetService"CoreGui")or game:GetService"CoreGui"
local o=gethui and gethui()or n


local function GenerateRandomName()
local p="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
local q=math.random(1,9)
local r=""
for s=1,q do
local t=math.random(1,#p)
r=r..string.sub(p,t,t)
end
return r
end

local p=i("Folder",{
Name=GenerateRandomName()
})

aa.ScreenGui=i("ScreenGui",{
Name=GenerateRandomName(),
Parent=o,
IgnoreGuiInset=true,
ScreenInsets="None",
},{
i("UIScale",{
Scale=aa.UIScale,
}),
p,






i("Folder",{
Name=GenerateRandomName()
}),
i("Folder",{
Name=GenerateRandomName()
}),
i("Folder",{
Name=GenerateRandomName()
})
})

aa.NotificationGui=i("ScreenGui",{
Name=GenerateRandomName(),
Parent=o,
IgnoreGuiInset=true,
})
aa.DropdownGui=i("ScreenGui",{
Name=GenerateRandomName(),
Parent=o,
IgnoreGuiInset=true,
})
m(aa.ScreenGui)
m(aa.NotificationGui)
m(aa.DropdownGui)

h.Init(aa)

aa.TransparencyValue=math.clamp(aa.TransparencyValue,0,0.4)

local q=a.load'g'
local r=q.Init(aa.NotificationGui)

function aa.Notify(s,t)
t.Holder=r.Frame
t.Window=aa.Window
t.WindUI=aa
return q.New(t)
end

function aa.SetNotificationLower(s,t)
r.SetLower(t)
end

function aa.SetFont(s,t)
h.UpdateFont(t)
end

function aa.AddTheme(s,t)
e[t.Name]=t
return t
end

function aa.SetTheme(s,t)
if e[t]then
aa.Theme=e[t]
h.SetTheme(e[t])
h.UpdateTheme()

return e[t]
end
return nil
end

aa:SetTheme"Dark"

function aa.GetThemes(s)
return e
end
function aa.GetCurrentTheme(s)
return aa.Theme.Name
end
function aa.GetTransparency(s)
return aa.Transparent or false
end
function aa.GetWindowSize(s)
return Window.UIElements.Main.Size
end


function aa.Popup(s,t)
t.WindUI=aa
return a.load'h'.new(t)
end


function aa.CreateWindow(s,t)
local u=a.load'F'

if not isfolder"WindUI"then
makefolder"WindUI"
end
if t.Folder then
makefolder(t.Folder)
else
makefolder(t.Title)
end

t.WindUI=aa
t.Parent=p
t.RandomFolder3=aa.RandomFolder3

if aa.Window then
warn"You cannot create more than one window"
return
end

local v=true

local w=e[t.Theme or"Dark"]

aa.Theme=w

h.SetTheme(w)

local x=l.Name or"Unknown"

if t.KeySystem then
v=false
if t.KeySystem.SaveKey and t.Folder then
if isfile(t.Folder.."/"..x..".key")then
local y
if type(t.KeySystem.Key)=="table"then
y=table.find(t.KeySystem.Key,readfile(t.Folder.."/"..x..".key"))
else
y=tostring(t.KeySystem.Key)==tostring(readfile(t.Folder.."/"..x..".key"))
end
if y then
v=true
end
else
c.new(t,x,function(y)v=y end)
end
else
c.new(t,x,function(y)v=y end)
end
repeat task.wait()until v
end

local y=u(t)

aa.Transparent=t.Transparent
aa.Window=y














return y
end

return aa
