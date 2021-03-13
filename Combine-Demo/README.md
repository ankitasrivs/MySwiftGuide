# Combine Basics

This branch contents Swift Combine definitions with examples



1.Publishers   :::::  These are used to emit single/multiple inputs to the subscriber


1.1.Just Publisher :::: It send only one value and then stops

1.2.Future :::: It is a publisher that is mostly use to publish one value on future and finish.We use promise case for success



2. Subjects :::: Subject acts as a bridge between subscriber and publisher.We can use it to send values to non combine code


2.1.Passthrough :::: Passthrough subjects sends multiple value based on demand. They will  send values and completion event.

2.2.CurrentValueSubject :::: This can be used to send current value to the subscriber
