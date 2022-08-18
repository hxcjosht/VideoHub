-- controls VideoHub with simple UI 
 

videohub=TcpSocket.New()
videohub.ReadTimeout = 0
videohub.WriteTimeout = 0
videohub.ReconnectTimeout = 0
ip="10.30.13.17"
port= 23


inputs={"camera 1";
"camera 2";
}

outputs={"Left Projector";
"Right Projector";
}

Controls.Inputs[1].Choices= inputs
Controls.Inputs[2].Choices= outputs



Controls.Inputs[1].EventHandler=function(ctrl)
for i,v in ipairs(inputs) do
if ctrl.String==v
then input=i
return input
end
end
end

Controls.Inputs[2].EventHandler=function(ctrl)
for i,v in ipairs(outputs) do
if ctrl.String==v
then output=i
return output
end
end
end

Controls.Inputs[3].EventHandler=function(ctrl)
videohub:Connect(ip,port)
videohub:Write("VIDEO OUTPUT ROUTING:\r\n"..input.." "..output.."\r\n\r\n")
print("YOUR OUTPUT IS:   VIDEO OUTPUT ROUTING:\r\n"..input.." "..output.."\r\n\r\n")
end

