Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727354;
	b=KLpTDnruzupxXX4rMOEc9rEBv3swbQDIJyKuQfEfvzy1Eo/TNv43YCSz1agswJIM84W3
	 m/h537EKC1cWESxyKOf40dp9un3dYFd9HQbPy8VMK3n/kOkMKLXy9Un0SF0i5BwXcf2Mg
	 oNb8ZTWslv3IeSZ3uikWjdx34CZKtSuFW5wd9dTG1vL5s9FO/kTYBANvplQUSGMTKrTcI
	 WtZSO2j3LiNgKE8cKdQa+TN+X603NK0pogoO8Fke6G9mQYI6khC6OkytP2aaScKyVL8Tc
	 kBnZjd3mcXYwgGp3koMozDCcOsQj/6fAjzwFnp+1NnVkHtKeU5F3IW1CHb9HzAGt7ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727354;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=OMTWKoka/WJZWYrKcZxYXVvF/9BfOI9GPrShvLim+Pk=;
	b=VfrDtG4x2v9Ou21O4E3SqsAaphcxlYmuKBZ03Wo6VYi8jed+navSbqT9fQpjnzHoZwmL
	 R9vinwoyofDrInoMGTEW9+CbNH3D8+35I3iIIFplQEs0ItMKPLg6fQi/9NbDVD7nr2V2G
	 c9VSticX7Gtvx4xtH44CyQpMXNKqaTsfBoNB9lIlSkHj3hRHl7hQRkI+OH2vyCXoefE2H
	 x/k8SW42aA0kqD7M83oCRd/1lYBYbE68wn4k6se8SFrleOMCSZ1sJu5rrHiX7fKwAbum2
	 9pvOD4l5ILfsCDjZfhBKLOH3+s2rok8ySjYqgh2Aa6sQUdq82KNu0xaWf3tT4/KdzNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B2RuYrMI;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6251606A328
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 17:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6251606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B2RuYrMI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793727349; x=1825263349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fIwZFXRauHVGTvmkvF0p5ts2dhitRW5zxXOPkRVPeoQ=;
  b=B2RuYrMIZTuWLlfJChn3dkhjwrUXTTZ5P1b+LHkokTmYjKnZ8WTkg3Yr
   oekEyEgowAcVUVBzRpicgFFQA4BzZphHPq/2zjUBWu/bpBkrWi/gONKlX
   R3sFSSGw91lkArejqTMxUcLwD5nNtfE7Q0Wr0hJRErEL1pvTHYXT+Wg1K
   TAf1TEMOPU6pqXHLpPn7WwpmEGnIxjdJ9ZhP/GKm8/EwEbTH085RhAttb
   F8KMpc3NsROvZZ65zmMa4V2QKbPRomh2O9Wn7Z4rsbhw0axBZl691WWV7
   1h/mx76UeKQU1JrUmlc4BFRx21abtyd1v0jrgY2Eo11WtIEEpyNmBaYlP
   A==;
X-CSE-ConnectionGUID: DcAojPgpRf+uCT5liV+rGA==
X-CSE-MsgGUID: Q6+Ynx/mSxKMIOs1steLyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2554356"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2554356"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:35:49 -0800
X-CSE-ConnectionGUID: cOWXPWO/THODlghOQi+WaA==
X-CSE-MsgGUID: yU58d79/R8mJ9+oiuIlMKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6498070"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:35:42 -0800
Date: Tue, 3 Nov 2026 19:35:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 8/8] serial: 8250: retain DMA resources when
 termination fails
Message-ID: <auoba7ZhfzaMTkzw@ashevche-desk.local>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
 <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 02, 2026 at 04:14:35PM -0700, James Hilliard wrote:
> serial8250_release_dma() ignores the return from dmaengine_terminate_sync()
> before freeing the coherent RX buffer, unmapping the TX FIFO and releasing
> the channels. If the provider fails to stop a channel, the DMAengine
> wrapper returns the error without synchronizing its callbacks. Hardware
> or a detached callback can then access the released storage and state.
> 
> Checking the error and returning early would not preserve their lifetime:
> serial core frees the TX FIFO after the driver's shutdown callback returns,
> and port removal can then release the callback context as well.
> 
> Require successful synchronous termination of both channels before
> releasing any DMA resources. Retry failed channels after a sleep outside
> the port lock, leaving channels that have already stopped and drained
> alone. Keep the shutdown gate and storage reservation in place throughout
> the retries.
> 
> Start retries with a 1 ms sleep and double it up to one second. This
> makes short-lived failures responsive while bounding sustained retry
> activity; neither delay is a hardware timeout. Report the initial failure,
> rate-limit ongoing failures with the elapsed time and current RX/TX error
> codes, and report recovery once both channels have stopped and drained.
> 
> A permanently failed DMA engine blocks close or removal. This deliberately
> retains the buffers, mappings, channels and callback context until the
> provider can establish that they are no longer in use.

...

> +static void serial8250_terminate_dma(struct uart_8250_port *p)
> +{
> +	struct uart_8250_dma *dma = p->dma;
> +	unsigned int delay_us = USEC_PER_MSEC;

Don't use multipliers without a number, it's harder to read (when syntax
highlighting is on) and follow in general.

1 * USEC_PER_MSEC

> +	ktime_t start;
> +	int rx_ret, tx_ret;
> +
> +	rx_ret = dmaengine_terminate_sync(dma->rxchan);
> +	tx_ret = dmaengine_terminate_sync(dma->txchan);
> +	if (!rx_ret && !tx_ret)
> +		return;
> +
> +	start = ktime_get();
> +	dev_err(p->port.dev,
> +		"DMA termination failed: RX %d, TX %d; teardown blocked\n",
> +		rx_ret, tx_ret);
> +
> +	/*
> +	 * Shutdown cannot return while DMA owns storage or callback state:
> +	 * serial core frees the TX FIFO afterwards, and removal frees the port.
> +	 * Retain both channels and retry outside the port lock. A permanently
> +	 * failed DMA engine therefore prevents teardown from completing.
> +	 */
> +	while (rx_ret || tx_ret) {
> +		fsleep(delay_us);
> +		/* Retry promptly at first, then limit sustained retry activity. */
> +		delay_us = min(delay_us * 2, USEC_PER_SEC);

Ditto.

> +		if (rx_ret)
> +			rx_ret = dmaengine_terminate_sync(dma->rxchan);
> +		if (tx_ret)
> +			tx_ret = dmaengine_terminate_sync(dma->txchan);
> +		if (rx_ret || tx_ret)
> +			dev_err_ratelimited(p->port.dev,
> +					    "DMA termination still failing after %lld ms: RX %d, TX %d\n",
> +					    ktime_ms_delta(ktime_get(), start), rx_ret, tx_ret);
> +	}
> +	dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
> +		 ktime_ms_delta(ktime_get(), start));
> +}

-- 
With Best Regards,
Andy Shevchenko


