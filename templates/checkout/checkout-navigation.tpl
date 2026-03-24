{**
 * For the full copyright and license information, please view the
 * LICENSE.md file that was distributed with this source code.
 *}
{$componentName = 'checkout-steps'}

{if !isset($notifications)}
  {$hasNotifications = $notifications.warning|@count > 0 || $notifications.error|@count > 0 || $notifications.success|@count > 0 || $notifications.info|@count > 0}
{/if}

{block name='checkout_steps'}
  <div class="{$componentName} {if isset($notifications) && isset($hasNotifications) && $hasNotifications} {$componentName}--has-notifications{/if}">
    <div class="{$componentName}__desktop">
      <ul class="{$componentName}__list" role="tablist">
        {foreach from=$steps item="step" key="index"}
          {if $step.identifier == 'checkout-personal-information-step'}
            {assign var="step_title" value="{l s='Personal Information' d='Shop.Theme.Checkout'}"}
          {elseif $step.identifier == 'checkout-addresses-step'}
            {assign var="step_title" value="{l s='Addresses' d='Shop.Theme.Checkout'}"}
          {elseif $step.identifier == 'checkout-delivery-step'}
            {assign var="step_title" value="{l s='Shipping Method' d='Shop.Theme.Checkout'}"}
          {elseif $step.identifier == 'checkout-payment-step'}
            {assign var="step_title" value="{l s='Payment' d='Shop.Theme.Checkout'}"}
          {else}
            {assign var="step_title" value=$step.identifier|replace:'checkout-':''|replace:'-step':''|replace:'-':' '|capitalize}
          {/if}

          {include file='checkout/_partials/checkout-navigation-step.tpl'
          number=($index + 1)
          step=$step.identifier
          title=$step_title
          virtual=($step.identifier == 'checkout-delivery-step' && isset($cart) && $cart.is_virtual)}
        {/foreach}
      </ul>
    </div>

    <div class="{$componentName}__mobile">
      <div class="{$componentName}__left">
        {include file='components/progress-circle.tpl' classes="text-success" size=74 stroke=4}
      </div>

      <div class="{$componentName}__right">
        {foreach from=$steps item="step" key="index"}
          {if $step.identifier == 'checkout-personal-information-step'}
            {assign var="step_title" value="{l s='Personal Information' d='Shop.Theme.Checkout'}"}
          {elseif $step.identifier == 'checkout-addresses-step'}
            {assign var="step_title" value="{l s='Addresses' d='Shop.Theme.Checkout'}"}
          {elseif $step.identifier == 'checkout-delivery-step'}
            {assign var="step_title" value="{l s='Shipping Method' d='Shop.Theme.Checkout'}"}
          {elseif $step.identifier == 'checkout-payment-step'}
            {assign var="step_title" value="{l s='Payment' d='Shop.Theme.Checkout'}"}
          {else}
            {assign var="step_title" value=$step.identifier|replace:'checkout-':''|replace:'-step':''|replace:'-':' '|capitalize}
          {/if}

          {assign var="next_step" value=$steps[$index+1]|default:null}
          {if $next_step && $next_step.identifier == 'checkout-delivery-step' && isset($cart) && $cart.is_virtual}
            {assign var="next_step" value=$steps[$index+2]|default:null}
          {/if}

          {if $next_step}
            {if $next_step.identifier == 'checkout-personal-information-step'}
              {assign var="next_step_title" value="{l s='Personal Information' d='Shop.Theme.Checkout'}"}
            {elseif $next_step.identifier == 'checkout-addresses-step'}
              {assign var="next_step_title" value="{l s='Addresses' d='Shop.Theme.Checkout'}"}
            {elseif $next_step.identifier == 'checkout-delivery-step'}
              {assign var="next_step_title" value="{l s='Shipping Method' d='Shop.Theme.Checkout'}"}
            {elseif $next_step.identifier == 'checkout-payment-step'}
              {assign var="next_step_title" value="{l s='Payment' d='Shop.Theme.Checkout'}"}
            {else}
              {assign var="next_step_title" value=$next_step.identifier|replace:'checkout-':''|replace:'-step':''|replace:'-':' '|capitalize}
            {/if}
            {assign var="subtitle" value="{l s='Next: %step_name%' d='Shop.Theme.Checkout' sprintf=['%step_name%' => $next_step_title]}"}
          {else}
            {assign var="subtitle" value=""}
          {/if}

          {include file='checkout/_partials/checkout-navigation-step-mobile.tpl'
          step=$step.identifier
          title=$step_title
          subtitle=$subtitle}
        {/foreach}
      </div>
    </div>
  </div>
{/block}
