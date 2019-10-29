using EthiopicCalendar;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;

/// <summary>
/// <Author>Fekadu W.</Author>
/// <email>fekaduw@gmail.com</email>
/// I used a wonderful EthiopicCalendar library designed by Yared Ayalew (https://github.com/yareda/EthiopicCalendar) as a basis 
/// to calculate ago where the date of birth is in Ethiopian calendar
/// </summary>
    public class Calculator
    {

      /// <summary>
        /// Returns age where the date of birth is in Ethiopian calendar
        /// </summary>
        /// <param name="dob">date of birth in Ethiopian calendar</param>
        /// <returns></returns>
        [Microsoft.SqlServer.Server.SqlFunction]
        public static SqlString AgeCalculator(SqlString dob)
        {
            try
            {
                if (dob.IsNull) return null;
                
                    String _dobStr = (String)dob;
                    EthiopicCalendar.Calendar ec = new Calendar();

                    DateTime _dob = ec.EthiopicToGregorian(_dobStr);
                    DateTime _currentDate = DateTime.Now;

                    if (_dob <= _currentDate)
                    {
                        int _ageInYears = 0;
                        int _ageInMonths = 0;
                        int _ageInDays = 0;

                        _ageInDays = _currentDate.Day - _dob.Day;
                        _ageInMonths = _currentDate.Month - _dob.Month;
                        _ageInYears = _currentDate.Year - _dob.Year;

                        if (_ageInDays < 0)
                        {
                            _ageInDays += DateTime.DaysInMonth(_currentDate.Year, _currentDate.Month);
                            _ageInMonths = _ageInMonths--;

                            if (_ageInMonths < 0)
                            {
                                _ageInMonths += 12;
                                _ageInYears--;
                            }
                        }
                        if (_ageInMonths < 0)
                        {
                            _ageInMonths += 12;
                            _ageInYears--;
                        }

                        if (_ageInYears > 0)
                            return _ageInYears.ToString();
                        else if (_ageInMonths > 0)
                            return _ageInMonths.ToString() + " M";
                        else
                            return _ageInDays.ToString() + " D";
                    }
                    else
                        return null;
                
            }
            catch (SqlNullValueException sqlnex)
            {
                return null;
            }
        }

        /// <summary>
        /// Returns true if the age is under 6 months
        /// </summary>
        /// <param name="dob">date of birth in Ethiopian calendar</param>
        /// <returns></returns>
        [Microsoft.SqlServer.Server.SqlFunction]
        public static SqlBoolean IsAgeUnder6Months(SqlString dob)
        {
            try
            {
                string[] _age = AgeCalculator(dob).ToString().Split(' ');
                if (_age.Length > 1)
                {
                    if (_age[1] == "M")
                    {
                        int _ageInMonth = Convert.ToInt32(_age[0]);
                        return (_ageInMonth <= 6) ? true : false;
                    }
                    else
                        return false;
                }

                return false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Returns true if the age is under the specified (X) value
        /// </summary>
        /// <param name="dob">date of birth in Ethiopian calendar</param>
        /// <param name="dob">the treshold value</param>
        /// <returns></returns>
        [Microsoft.SqlServer.Server.SqlFunction]
        public static SqlBoolean IsAgeUnderXYear(SqlString dob, SqlInt32 x)
        {
            try
            {
                string[] _age = AgeCalculator(dob).ToString().Split(' ');

                if (_age.Length > 1)
                {
                    return false;
                }
                else
                {
                    int _ageInYears = Convert.ToInt32(_age[0]);
                    return (_ageInYears <= x) ? true : false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Returns true if the age is between x and y years
        /// </summary>
        /// <param name="dob">date of birth in Ethiopian calendar</param>
        /// <param name="x">the minimum age value</param>
        /// /// <param name="x">the maximum age value</param>
        /// <returns></returns>
        [Microsoft.SqlServer.Server.SqlFunction]
        public static SqlBoolean IsAgeBetweenXAndYYears(SqlString dob, SqlInt32 x, SqlInt32 y)
        {
            try
            {
                string[] _age = AgeCalculator(dob).ToString().Split(' ');

                if (_age.Length > 1)
                {
                    return false;
                }
                else
                {
                    int _ageInYears = Convert.ToInt32(_age[0]);
                    return (_ageInYears >= x && _ageInYears<=y) ? true : false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }