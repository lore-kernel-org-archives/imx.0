Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56231B7C5
	for <imx@lists.linux.dev>; Tue,  8 Aug 2023 18:15:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437266552"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="437266552"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 10:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801406161"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="801406161"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2023 10:38:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qTQfR-000i31-0H;
	Tue, 08 Aug 2023 20:38:49 +0300
Date: Tue, 8 Aug 2023 20:38:48 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-imx@nxp.com
Subject: Re: [PATCH] gpio: mxc: release the parent IRQ in runtime suspend
Message-ID: <ZNJ9qDqDIF4s66E8@smile.fi.intel.com>
References: <20230808153346.335411-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808153346.335411-1-shenwei.wang@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Aug 08, 2023 at 10:33:46AM -0500, Shenwei Wang wrote:
> Release the parent interrupt request during runtime suspend, allowing
> the parent interrupt controller to enter runtime suspend if there are
> no active users.
> 
> This change may not have a visible impact if the parent controller is
> the GIC, but it can enable significant power savings for parent IRQ
> controllers like IRQSteer inside a subsystem on i.MX8 SoCs. Releasing
> the parent IRQ provides an opportunity for the subsystem to enter suspend
> states if there are no active users.

...

> +static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enable)
> +{
> +	if (!port)
> +		return;

When can this be true?

> +	if (enable) {
> +		irq_set_chained_handler_and_data(port->irq,
> +						 port->mx_irq_handler, port);
> +		if (port->irq_high > 0)
> +			/* setup handler for GPIO 16 to 31 */
> +			irq_set_chained_handler_and_data(port->irq_high,
> +							 port->mx_irq_handler,
> +							 port);
> +	} else {
> +		irq_set_chained_handler_and_data(port->irq, NULL, NULL);
> +		if (port->irq_high > 0)
> +			irq_set_chained_handler_and_data(port->irq_high, NULL, NULL);
> +	}
> +}

Why not

	if (enable)
		irq_set_chained_handler_and_data(port->irq,
						 port->mx_irq_handler, port);
	else
		irq_set_chained_handler_and_data(port->irq, NULL, NULL);

	/* setup handler for GPIO 16 to 31 */
	if (port->irq_high > 0) {
		if (enable)
			irq_set_chained_handler_and_data(port->irq_high,
							 port->mx_irq_handler, port);
		else
			irq_set_chained_handler_and_data(port->irq_high, NULL, NULL);
	}

Wouldn't it be better to read and understand?

-- 
With Best Regards,
Andy Shevchenko


