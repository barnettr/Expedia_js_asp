216: 'Generates HTML <option> tags suitable for a day select list.  
217: 'SelectedDay = day to be selected (0 = no day selected)  
218: 'Returns HTML <option> tags suitable for a day select list.  
219: Function CreateDaySelectOptions(SelectedDay)
220:
221:     On Error Resume Next
222:
223:     Dim sHTML
224:     Dim i
225:
226:     For i = 1 to 31
227:
228:         If SelectedDay = i Then
229:             sHTML = sHTML & "<option SELECTED value=""" & i & """>" & i & "</option>" & vbCRLF
230:         Else
231:             sHTML = sHTML & "<option value=""" & i & """>" & i & "</option>" & vbCRLF
232:         End If
233:
234:     Next
235:
236:     CreateDaySelectOptions = sHTML
237:
238: End Function
239:
240: 'Generates HTML <option> tags suitable for a month select list.  
241: 'SelectedMonth = Month to be selected (1 = January, 0 = nothing selected)  
242: 'Returns HTML <option> tags suitable for a month select list.  
243: Function CreateMonthSelectOptions(SelectedMonth)
244:
245:     On Error Resume Next
246:
247:     Dim sHTML
248:     Dim i
249:
250:     For i = 1 to 12
251:
252:         If SelectedMonth = i Then
253:             sHTML = sHTML & "<option SELECTED value=""" & i & """>" & MonthName(i) & "</option>" & vbCRLF
254:         Else
255:             sHTML = sHTML & "<option value=""" & i & """>" & MonthName(i) & "</option>" & vbCRLF
256:         End If
257:
258:     Next
259:
260:     CreateMonthSelectOptions = sHTML
261:
262: End Function
263:
264: 'Generates HTML <option> tags suitable for a year select list.  
265: 'SelectedYear = Year to be selected (0 = no year selected)  
266: 'Returns HTML <option> tags suitable for a year select list.  
267: Function CreateYearSelectOptions(SelectedYear)
268:
269:     On Error Resume Next
270:
271:     Dim sHTML
272:     Dim i
273:     Dim iStartYear
274:     Dim iNumberOfYears
275:     
276:     iStartYear = Year(Now()) - NUMBER_OF_YEARS 'Earliest year to display in select list
277:     iNumberOfYears = 10 'Number of years to display in select list
278:
279:     For i = iStartYear to iStartYear + (iNumberOfYears - 1)
280:
281:         If SelectedYear = i Then
282:             sHTML = sHTML & "<option SELECTED value=""" & i & """>" & i & "</option>" & vbCRLF
283:         Else
284:             sHTML = sHTML & "<option value=""" & i & """>" & i & "</option>" & vbCRLF
285:         End If
286:
287:     Next
288:
289:     CreateYearSelectOptions = sHTML
290:
291: End Function 