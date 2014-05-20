#!/usr/bin/env ruby

#
# load lib.
################################################################################
require 'date'

#
# def const vars.
################################################################################
EARLIEST_DATE = Date.new(1970, 1, 1)
LATEST_DATE   = Date.new(2100, 1, 1)

#
# def func.
################################################################################
def get_tickets(fp, rgp, year)
  tickets = []
  while line = fp.gets()
    line.chomp!
    c, fd, td = line.scan(rgp).flatten()
    tickets.push({:country  => c,
                  :from_date=> Date.parse(year+'/'+fd),
                  :to_date  => Date.parse(year+'/'+td)})
  end
  tickets
end

def make_route(tickets)
  route = []

  f_pipod = EARLIEST_DATE # earliest date
  t_pipod = LATEST_DATE   # latest date

  rec_make_route(route, tickets, f_pipod, t_pipod)
end

def rec_make_route(route, tickets, f_pipod, t_pipod)
  # init.
  candidate_t = nil

  # search earliest to_date ticket.
  tickets.each do |t|
    if f_pipod < t[:from_date] && t_pipod >= t[:to_date]
      t_pipod = t[:to_date]
      candidate_t = t # earliest to_date ticket.
    end
  end

  # found candidate ticket.
  if candidate_t
    # push earliest to_date ticket to route
    route.push(candidate_t)
    rec_make_route(route, tickets, t_pipod, LATEST_DATE)
  # not found(so that means last).
  else
    route
  end
end

def print_tickets(tickets)
  sorted_tickets = tickets.sort{ |a, b| a[:country] <=> b[:country] }

  tsize = tickets.size
  printf("%d ", tsize)
  sorted_tickets.each_with_index do |t, idx|
    print t[:country]
    print ' ' if idx < tsize-1
  end
  puts
    
end

# for debug.
def print_route(route)
  rsize = route.size
  printf("%4d : ", rsize)
  route.each_with_index do |t, idx|
    print t[:country]
    print '->' if idx < rsize-1
  end
  puts
end

# for debug.
def print_route_with_date(route)
  route.each do |t|
    print t[:from_date].to_s + " " + t[:to_date].to_s + " " + t[:country] + "\n"
  end
end

#
# main
################################################################################
fp = STDIN
year = '2012' # leap year
rgp = /^([A-Z][a-z]+?) ([0-9]{1,2}\/[0-9]{1,2})-([0-9]{1,2}\/[0-9]{1,2})$/

### input ticket list.
tickets = get_tickets(fp, rgp, year)

### sort ticket list with from_date.
#sorted_tickets = tickets.sort{ |a, b| a[:from_date] <=> b[:from_date] }
#sorted_tickets = tickets.sort{ |a, b| a[:to_date] <=> b[:to_date] }

### make route.
#route = make_route(sorted_tickets)
route = make_route(tickets)

### print route.
#print_route_with_date(sorted_tickets)
#print_route(route)
print_tickets(route)
