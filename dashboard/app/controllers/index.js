import Ember from 'ember';
import { Bindings } from 'ember-pusher/bindings';

export default Ember.Controller.extend(Bindings, {
  logPusherEvents: true,

  PUSHER_SUBSCRIPTIONS: {
    githubWebhooks: ['post_created', 'pusher:subscription_succeeded'],
  },

  actions: {
    postCreated: function(data) {
      console.log('FIRED!');
      console.log(data);
    },
    'pusher:subscriptionSucceeded': function() {
      console.log("Connected!");
    }
  }
});
