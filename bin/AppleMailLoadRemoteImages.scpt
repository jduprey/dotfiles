tell application "Mail"
	try
		if first window is window of front message viewer then
			my messageViewer()
		else
			my regularmessage()
		end if
	on error theError
		my regularmessage()
	end try
end tell

on messageViewer()
	tell application "System Events" to tell process "Mail"
		set mainWindow to the first window
		set rootSplitter to the first splitter group of the mainWindow
		set firstSplitter to the last splitter group of the rootSplitter
		set scrollArea to the last scroll area of the firstSplitter
		set scrollGroup to the first group of the scrollArea

		if number of groups of the scrollGroup is greater than 1 then
			set maybeRemoteContentGroup to the first group of the scrollGroup

			if number of buttons of the maybeRemoteContentGroup is greater than or equal to 1 then
				set maybeRemoteContentButton to the last button of the maybeRemoteContentGroup
				if name of the maybeRemoteContentButton contains "load remote content" then
					click the maybeRemoteContentButton
				else
					name of the maybeRemoteContentButton
				end if
			else
				UI elements of maybeRemoteContentGroup
			end if
		else
			UI elements of the scrollGroup
		end if
	end tell
end messageViewer

on regularmessage()
	tell application "System Events" to tell process "Mail"
		set mainWindow to the first window
		set mainScrollGroup to the first scroll area of the mainWindow
		set everyMessage to every group of the mainScrollGroup

		log (number of everyMessage)
		repeat with currentMessage in everyMessage
			set loadRemoteContentButton to the first button of the first group in the currentMessage
			click the loadRemoteContentButton
		end repeat
	end tell
end regularmessage
