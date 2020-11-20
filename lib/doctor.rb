class Doctor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_appointment(date, patient)
        appointment = Appointment.new(date, patient, self)
        appointment.doctor = self
        appointment
    end

    def appointments
        Appointment.all.select do |appointment|
            appointment.doctor == self
        end
    end

    def patients
        appointments.map do |appointment|
            appointment.patient
        end
    end

end
