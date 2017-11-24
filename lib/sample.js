/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */  

/**
 * Sample transaction processor function.
 * @param {org.acme.sample.VoteTransaction} tx The sample transaction instance.
 * @transaction
 */
function vote(tx) {

    // Save the old value of the asset.
    var oldValue = tx.newsItem.votes;
    var newValue = oldValue + tx.score;

    // Update the asset with the new value.
    tx.newsItem.votes = newValue;
  
  	var originP = tx.origin; // = getCurrentParticipant();
  
  	// Check whether we the origin has already voted for the NewsItem
    var allVotes = tx.newsItem.voters;
    if(allVotes.indexOf(originP) >= 0){
       throw error("The Participant already voted for this item");
    }
  
  	// Store the voter in our list
  	tx.newsItem.voters.push(originP);

    // Get the asset registry for the asset.
    return getAssetRegistry('org.acme.sample.NewsItem')
        .then(function (assetRegistry) {

            // Update the asset in the asset registry.
            return assetRegistry.update(tx.newsItem);

        })
        .then(function () {

            // Emit an event for the modified asset.
            var event = getFactory().newEvent('org.acme.sample', 'VoteEvent');
            event.newsItem = tx.newsItem;
            event.oldScore = oldValue;
            event.newScore = newValue;
            emit(event);

        });

}
