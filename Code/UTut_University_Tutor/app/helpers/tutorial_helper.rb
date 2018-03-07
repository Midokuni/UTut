# UTut: University Tutor
#    Copyright (C) 2018  
#    Mendoza, John Dominic
#    Segismundo, Julio 
#    De Guzman, Nicole Jade            
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#    This is a course requirement for CS 192
#    Software Engineering II under the
#    supervision of Asst. Prof. Ma. Rowena C.
#    Solamo of the Department of Computer
#    Science, College of Engineering, University
#    of the Philippines, Diliman for the AY 2017-2018

module TutorialHelper
     include UsersHelper
     include SessionsHelper
     def search_error_type(err)
          session[:search_error] = err
     end

     def has_search_error?
          !session[:search_error].nil?
     end

     def set_search_params(para)
          session[:search_params] = para
     end

     def stringify_schedule(tut)
          if tut['day'].nil? or tut['start_hr'].nil? or tut['start_min'].nil? or tut['end_hr'].nil? or tut['end_min'].nil?
               "null hahaa"
          else
               tut['day'].upcase + " "+ (normalize_time tut['start_hr'], tut['start_min']) +"-"+ (normalize_time tut['end_hr'], tut['end_min'])
          end
     end
     def offered_tutorials(user)
          Tutorial.where(tutor_id: user.id)
     end

     def your_tutorials
          offered_tutorials(current_user)
     end

     def get_tutor(tut)
          get_full_name(User.find_by(id: tut.tutor_id))
     end

     def get_tutee(tut)
          tutee = User.find_by(id: tut.tutee_id)
          if tutee
               get_full_name(tutee)
          else
               "None"
          end
     end

     def get_subject(tut)
          tut.subject
     end

     def get_day(tut)
          tut.day
     end
end
