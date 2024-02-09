from datetime import date

class DateTricks():

    def Get_Start_Date(self):
        today = date.today()

        # dd/mm/yyyy
        fdate = today.strftime('%d%m%Y')

        print(fdate)

        a_chars = []

        for number in fdate:
            a_chars.append(number)
        
        return a_chars