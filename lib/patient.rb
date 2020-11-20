class Patient
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, doctor)
        appointment = Appointment.new(date, self, doctor)
        appointment.patient = self
        appointment
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.patient == self
        end
    end 

    def doctors
        appointments.map do |appointment|
            appointment.doctor
        end
    end

end
