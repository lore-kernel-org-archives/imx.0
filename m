Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283846;
	b=1WN8KniraqEGTXuTCVUnjEAaRkrKYW5WLTtveWXe2D+SInr1bkK8Otj4gtQC2EqnjrDx
	 MsSyvTI2ZkIB/LIxTx3tmTtFeb7Gmde8m0DbK5Cuib8bMYcIRFHXstjYIZAz50YAJpn4y
	 jDixsH6CNxyb5dYE20/+NiK3HKMiaPUT8TUTgRKl8IUyl9rx+2ysCnMyPmYWZO2NWmHjf
	 /vh9NYJUnt+Lx0kfSeiA49pylW34/Ggf4OAmtjX2DXW8shDvw+UHRDvmr1vjqmynkjtBX
	 +oxbjRamdy60ROrReLfqDzYQg3NLf8srAxwfGf56FdYzplnkBoZ+WQlq38OBJnQCmjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283846;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=YOVZz2rEk4lZKDa87ycfgL661H0zQluemrPyROYbb/Q=;
	b=XbeIf9t9RH3mz8+hh9c6Pq8FK1RvDPEIE+MBtGgP46JbXaM+fsML4cx6SDB0VAwSF6X3
	 3M1KNafyx1NWv05h2Y34sdIOyDgPgoHOXHVISe5SS+1u+NlJoUXP59jRo9xXg2sGahgnE
	 UMdJslrxv1uDm1SDQZlFMaaQLZVh/C225Mrp59/E638GsK49bZ3XGkscHOjMWW/oeqtVd
	 1JaP9M6O6mcp+yccl4h58UgF8GWhIKmWeGabxvwRTjUh+HaEa9ET4iKZ4xqgVig1tosRY
	 TVuzlCRkcCV7P2hATPray48cMoj6eoAobTlNxqAnIOcNXT2jwfdqybpc8Ei/6MmwJiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iJnT7M0W;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C60A606A31C
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 14:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C60A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iJnT7M0W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793283845; x=1824819845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WhRRgDbVMLz+/BSdD0pXKUEHAh8FgmgnlTctJGj8+kQ=;
  b=iJnT7M0WirOnJB1TQVw5X8iPeka7ftcbZmK9RcTX5sS5kCokM407Ucj3
   7L67cuM9hLCRtf7KkPc25ItcXBAUNr1qntdU6JEdZAqqDfnXqc+nB35HX
   UpsfSCYqErC8uDzDxTtyjGZOkV6m6mqtnHqfWRTGGIROQXWjofM8smzG4
   XsEjS99h7bpyGkC33hCz++NxQem9HgC/gy1fBWEZCU0dhELNmJx4TLhx3
   ZI2zjHuYtqB/HXkqmYS52s4T9zJtGsVxVzYHTUvVO2eXd0U5/sBkGSQVk
   y+N1HPLP1qO7R8THr1RDXqAEQUkalyZ4UOJbjAvhuMJAE/6gIgnFOjbBs
   Q==;
X-CSE-ConnectionGUID: +aq1KzkkScirGa5kUbRT8Q==
X-CSE-MsgGUID: 6J2YeUUdTPeKZI3tZWKg1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2054091"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2054091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:24:05 -0700
X-CSE-ConnectionGUID: D+lewELqRqCYi5Up37o2Mw==
X-CSE-MsgGUID: HmFeHfhUSC2AV3hAqUA+YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5293371"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:23:59 -0700
Date: Thu, 29 Oct 2026 16:23:56 +0200
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
	Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
Message-ID: <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
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
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:
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
> A permanently failed DMA engine blocks close or removal. This deliberately
> retains the buffers, mappings, channels and callback context until the
> provider can establish that they are no longer in use.

...

> +	while (rx_ret || tx_ret) {
> +		dev_err_ratelimited(p->port.dev,
> +				    "DMA termination failed: RX %d, TX %d; retrying\n",
> +				    rx_ret, tx_ret);

> +		msleep(100);

Huh?!

> +		if (rx_ret)
> +			rx_ret = dmaengine_terminate_sync(dma->rxchan);
> +		if (tx_ret)
> +			tx_ret = dmaengine_terminate_sync(dma->txchan);
> +	}

This is unacceptable. Sleeping is okay, but value should really match the
baudspeed and other parameters of the transfer.

-- 
With Best Regards,
Andy Shevchenko


