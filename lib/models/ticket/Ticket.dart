


class TicketList {
  String? id;
  String? cusName;
  String? cusContact;
  String? ticketType;
  String? problem;
  String? faultAddress;
  String? faultLocation;
  String? status;
  String? from;
  String? assignd;

  TicketList(
      {this.id,
        this.cusName,
        this.cusContact,
        this.ticketType,
        this.problem,
        this.faultAddress,
        this.faultLocation,
        this.status,
        this.from,
        this.assignd});

  TicketList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
    cusContact = json['cus_contact'];
    ticketType = json['ticket_type'];
    problem = json['problem'];
    faultAddress = json['fault_address'];
    faultLocation = json['fault_location'];
    status = json['status'];
    from = json['from'];
    assignd = json['assignd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cus_name'] = this.cusName;
    data['cus_contact'] = this.cusContact;
    data['ticket_type'] = this.ticketType;
    data['problem'] = this.problem;
    data['fault_address'] = this.faultAddress;
    data['fault_location'] = this.faultLocation;
    data['status'] = this.status;
    data['from'] = this.from;
    data['assignd'] = this.assignd;
    return data;
  }
}

class Ticket {
  String? id;
  String? cusName;
  String? cusContact;
  String? ticketType;
  String? problem;
  String? faultAddress;
  String? faultLocation;
  String? status;
  String? from;
  String? assignd;

  Ticket(
      {this.id,
        this.cusName,
        this.cusContact,
        this.ticketType,
        this.problem,
        this.faultAddress,
        this.faultLocation,
        this.status,
        this.from,
        this.assignd});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
    cusContact = json['cus_contact'];
    ticketType = json['ticket_type'];
    problem = json['problem'];
    faultAddress = json['fault_address'];
    faultLocation = json['fault_location'];
    status = json['status'];
    from = json['from'];
    assignd = json['assignd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cus_name'] = this.cusName;
    data['cus_contact'] = this.cusContact;
    data['ticket_type'] = this.ticketType;
    data['problem'] = this.problem;
    data['fault_address'] = this.faultAddress;
    data['fault_location'] = this.faultLocation;
    data['status'] = this.status;
    data['from'] = this.from;
    data['assignd'] = this.assignd;
    return data;
  }
}