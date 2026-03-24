{**
 * For the full copyright and license information, please view the
 * LICENSE.md file that was distributed with this source code.
 *}
{capture name="checkout_navigation"}
  {include file='checkout/checkout-navigation.tpl' steps=$steps}
{/capture}

{foreach from=$steps item="step" key="index"}
  {render identifier  =  $step.identifier
          position    =  ($index + 1)
          ui          =  $step.ui
  }
{/foreach}
