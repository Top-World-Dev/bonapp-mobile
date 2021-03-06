class OrderMutation {
  String sendOrderMessage() {
    return """ 
      mutation sendOrderMessage(\$order_id: Int, \$message: String) {
        sendOrderMessage(order_id: \$order_id, message: \$message) {
          status
          message
        }
      }
    """;
  }

  String orderReceived() {
    return """ 
      mutation orderReceived(\$order_id: Int) {
        orderReceived(order_id: \$order_id) {
          status
          message
        }
      }
    """;
  }

  String orderCreate() {
    return """ 
    mutation orderCreate(\$input: OrderInput) {
        orderCreate(input: \$input) {
          id
        }
      }
    """;
  }

  String orderUpdate() {
    return """ 
    mutation orderUpdate(\$input: OrderUpdateInput) {
        orderUpdate(input: \$input) {
          status
        }
      }
    """;
  }
}
