class BottleMachine
  RowCount = 10
  PlaceNumber = 5
  Banknotes = [100, 50, 10, 5, 2, 1]
  CassetteVolume = 10

  def initialize
    @innerRows      = Array.new(RowCount){[nil, 0, 0]}
    @cassetStore    = Hash[Banknotes.map { |nominal| [nominal, 0] }]
    @cassetAddition = Hash[Banknotes.map { |nominal| [nominal, 0] }]
    @saleData       = Hash.new {[0, 0]}
    @deposCount     = 0
    puts "Автомат запущен успешно."
  end


  def empty
    @innerRows      = Array.new(RowCount){[nil, 0, 0]}
    @cassetStore    = Hash[Banknotes.map { |nominal| [nominal, 0] }]
    @cassetAddition = Hash[Banknotes.map { |nominal| [nominal, 0] }]
    @saleData       = Hash.new {[0, 0]}
    @deposCount     = 0
    puts "Автомат успешно опустошен."
  end


  def load (addHash)
    deletedProd     = Hash.new
    addHash.each do |product, info|

      if info[1] > 0
        @innerRows.each_with_index do |oneRow, index|
          if @innerRows[index][0] == nil &&
              info[1] > 0
            numForAdd = info[1] <= PlaceNumber ? info[1] : PlaceNumber
            @innerRows[index] = [product, info[0], numForAdd]
            info[1] -= numForAdd
          end
        end
      end

      @innerRows.each_with_index do |oneRow, index|
        if @innerRows[index][0] == product &&
            @innerRows[index][2] <  PlaceNumber &&
            info[1] > 0

          numForAdd = info[1] <= PlaceNumber ? info[1] : PlaceNumber
          @innerRows[index] = [product, info[0], numForAdd]
          info[1] -= numForAdd
        end
      end

      if info[1] > 0
        deletedProd[product] = info
      end
    end

    return deletedProd
  end


  def deposit (addHash)
    sizeOfDeposit = 0

    addHash.each do |banknote, number|
      if @cassetStore.has_key? banknote
        addedBank      = banknote * number
        @deposCount   += addedBank
        sizeOfDeposit += addedBank

        emptySlot  = CassetteVolume - @cassetStore[banknote]

        if emptySlot >= number
          @cassetStore[banknote] += number
        else
          @cassetStore[banknote] += emptySlot
          @cassetAddition += banknote * (number - emptySlot)
        end
      else
        puts "#{banknote} не подходящая купюра. Будет возвращена."
      end
    end
    puts "Ваш счёт увеличен на #{total}"
    self
  end


  def order (name)
    @innerRows.each_with_index do |oneRow, index|
      if  @innerRows[index][0] == name &&
          @innerRows[index][2] > 0

           order = @innerRows[index][1]
        if order <= @deposCount
          @deposCount -= order
          @innerRows[index][2] -= 1

          if not @saleData.has_key? name
            @saleData[name] = [order, 1]
          else
            @saleData[name] = [@saleData[name][0] + order, @saleData[name][1] + 1]
          end

          puts "Куплено #{name}"
        else
          puts "У тебя нет денег #{@rows[index][1]} для #{name}"
        end

        if @innerRows[index][2] == 0
          @innerRows[index] = [nil, 0, 0]
        end

        return self
      end
    end
    puts "Напиток не доступен"
    self
  end


  def withdraw
    if @deposCount > 0
      retryBank = Hash[Banknotes.map { |nominal| [nominal, 0] }]

      @cassetStore.sort.map do |banknote, number|
        while @deposCount >= banknote &&
               number > 0 do

          @deposCount -= banknote
          number -= 1
          @cassetStore[banknote] -= 1
          retryBank[banknote] += 1
        end
      end

      total_returned = 0
      retryBank.each do |banknote, number|
        total_returned += banknote * number
      end
      puts "#{total_returned} was returned. Deposit is #{@deposit_counter} units"

      return retryBank
    else
      puts "Error! Your deposit is empty"
      return Hash.new
    end
  end


  def status
    money = 0
    bankInfo = Hash[Banknotes.map { |x| [x, @cassetAddition[x] + @cassetStore[x]] }]
    bankInfo.each do |banknote, number|
      money += banknote * number
    end

    notEmpty = Array.new
    @innerRows.each do |inRow|
      notEmpty << inRow if inRow[0]
    end

    [@innerRows, money, bankInfo]
  end


  def stat
    @saleData
  end
end