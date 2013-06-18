#!/usr/bin/env coffee
class StaffMember

    constructor: (@name, @discountPercent) ->

sally = new StaffMember 'Sally', 5
bob = new StaffMember 'Bob', 10
me = new StaffMember 'Joe', 20

class CashRegister

    total: 0
    
    lastTransactionAmount: 0
  
    add: (itemCost=0) ->
        @total += itemCost
        @lastTransactionAmount = itemCost

    scan: (item, quantity) ->
        switch item
            when 'eggs'
                @add 0.98 * quantity
            when 'milk'
                @add 1.23 * quantity
            when 'magazine'
                @add 4.99 * quantity
            when 'chocolate'
                @add 0.45 * quantity
            else
                return false
        
        true

    voidLastTransaction: ->
        @total -= @lastTransactionAmount
        @lastTransactionAmount = 0

    applyStaffDiscount: (employee) ->
        console.log "#{employee.discountPercent}% discount"
        calculateDiscount = (100 - employee.discountPercent) / 100
        @total = @total * calculateDiscount

cashRegister = new CashRegister()

cashRegister.scan 'eggs', 1
cashRegister.scan 'milk', 1
cashRegister.scan 'magazine', 3

cashRegister.applyStaffDiscount me

console.log 'Your bill is', cashRegister.total.toFixed(2)