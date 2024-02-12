# sd-workshop3 2024-A
Presented by: Daniel Jaraba

Objective: Fix the malfunctioning of the microservice app-invoice when a kafka event from the topic 'transaction-events' occurs

Change the method of the transaction event for the microservice app-invoice:

```
public void processTransactionEvent(ConsumerRecord<Integer, String> consumerRecord) throws JsonProcessingException {
        Invoice event = objectMapper.readValue(consumerRecord.value(), Invoice.class);
        Invoice invoice = _dao.findById(event.getIdInvoice()).get();
        log.info("Actualizando Invoice ***" + event.getIdInvoice());
   		log.info("Se ha pagado la factura # " + event.getIdInvoice());
        invoice.setAmount(invoice.getAmount()-event.getAmount());
        if (invoice.getAmount()<=0){
            invoice.setState(1);
            if (invoice.getAmount()<0){
                invoice.setAmount(0.00);
            }
        }
        _dao.save(invoice);
    }
```

Re-build the container for the microservice and re-run it normally.