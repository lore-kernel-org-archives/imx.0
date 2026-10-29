Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283485;
	b=MetnhCyEm7ewdEbESsXKiacyKCVUxCGwnzck+TsVCqlxO9U4ms7HgCntaEDLHpH3TORo
	 WMyuuDwoRxIorL4qawbde0qtkhXQle+pQ4+ATOJLj23bahBDeJg8X/bPeqsdtYiJEW4P4
	 JXfBL25npSmlT5ntMI+SfWRXteG7hMTsE2H1uROid0whqbXA6wkbe3d21Z4kmcrpRcql6
	 kwIvurKzYwkF14ZQinZS1cIyqpsteelAAAvMHLCYZPAMUdtwUy/1q21FwTTINcPyljlCS
	 MlzcjTPZu00F1/enS+rZHsL+/jkIaSUX6yoEJQrWg9NZyQTqisG2bI7a2+Amw7mXeCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283485;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=sIAQApOwnlBHdqOEDUSf5m4YrfU7jMgmgx2VS57GmCE=;
	b=EqrVYJDGqxWhST/qZv5Xv9SFZiT6GfqJlo5nwWnnrc2ucau0H52PCnh3KlBmlixvEuI5
	 ZNpm0X3sbUikrMP/LkefrYajXAQtQ03B9bLQCvp+Tz3QGXjK1RcZ6kcAvccc0hgZI09Bg
	 31xkK4XcvHU0Aj5/xWmAMezAa8ZLAreI9HkEzxoOUE7PThp1vQIJqa2w5isA3qbihHZhZ
	 bGS04ARJeMqgg3IBFslL4jh6qqAgZDAGMJkoFHHqb16CIHhreazaXqGnZxl3VHLzFL07t
	 sDS7B0VZhfWsnYLghCam+I3k8kAjhxQIwMMkAKW6cDC+mmDohZRwaywUZI5hDaIGwtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WnwBYyqL;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79247606A32C
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 14:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79247606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WnwBYyqL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793283485; x=1824819485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iUgkTmbEVGLMzWydqtXX3ASQZZhoDtXfz4hj/j8HhZA=;
  b=WnwBYyqLX6348L1TkZwaBhMJ+UFGQhAE7O7ry2Pugr4jcd/yMOLGj+W0
   G8O1dlS7vJOq/0Kk8Z/WCuh5RhXarcD8ywzCvwSVmeMs+9qwsE/YV5faD
   y5yqGYGDWkfXnX2XoNJzezMOIlgAAK28jMl2bgTIbnkCv6vwJQ3TSf58/
   cJa0L//kYrk9QER5UcmAmKsHEG9yxIpUZ/PX/bohtFHO49gB10rmrwlwR
   XngYIwQsm+ioU74E3rnLtHu+G70Rlkuyyd5ocpylI+Ij/J+z6e/ff64E0
   EnXHUkE7a/MD71qXn4ZA1Midnh6NJN8RHrO8NU+vk/Dpt8fCoSHVqUmfs
   Q==;
X-CSE-ConnectionGUID: Ghrd7BdnSeq8Nlovq1dIsw==
X-CSE-MsgGUID: +LNnoJiRRuSqOYv0+j57Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1920070"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1920070"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:18:04 -0700
X-CSE-ConnectionGUID: T8QAYLthTXiOO95NU/4lBA==
X-CSE-MsgGUID: hFAuv5gvS4KywM5Cg6kQPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5148330"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:17:57 -0700
Date: Thu, 29 Oct 2026 16:17:55 +0200
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
Subject: Re: [PATCH v8 2/6] serial: serialize asynchronous write wakeups with
 the port lock
Message-ID: <auNVk_Y8iiAXyFa3@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-2-3fd56ba352ed@gmail.com>
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
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-2-3fd56ba352ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 29, 2026 at 01:36:58AM -0600, James Hilliard wrote:
> uart_write_wakeup() expects the UART port lock to be held. Several worker,
> DMA completion and interrupt paths call it without that lock, including
> indirect calls from uart_handle_cts_change() and the transmit helpers.
> 
> Take the port lock around these notifications or their transmit helper.
> Keep sleeping SPI and regmap accesses outside the locked region, and keep
> the FSL LPUART completion lock held through its wakeup. Acquire the port
> lock after releasing private channel locks to preserve the ordering used
> by UART callbacks. In the MUX timer, publish available FIFO space under
> the port lock and keep the hardware FIFO-drain wait outside it.
> 
> Use IRQ-safe locking in the Atmel RX and TX tasklets and SB1250 termios
> path, since their interrupt handlers now acquire the same port lock.
> Preserve the caller's interrupt state when releasing those locks.
> 
> On SB1250, lock modem-state updates after reading and filtering the change
> status, and wake modem-status waiters after unlocking. Take the TX lock
> inside its service routine so RX-only interrupts need no acquisition.
> Keep that lock across x_char handling, FIFO consumption and the decision
> to mask TX interrupts: a writer must not enqueue data and enable TX between
> the empty-FIFO check and the interrupt-mask write. Each TX invocation sends
> at most one character.
> 
> Serialize CLPS711x TX servicing and its interrupt-enable state with the
> port lock. Disable TX interrupts without waiting in stop_tx(), since a
> threaded handler may need that same lock. Have an already queued handler
> leave stopped output untouched, and drain it outside the lock during
> shutdown before the transmit FIFO can be released.
> 
> SCCNXP handles interrupts under a controller lock which its UART callbacks
> acquire with the port lock already held. Collect the ports needing wakeups
> in an unsigned long bitmap while servicing the controller, then release
> that lock before visiting the set bits, taking each port lock and
> rechecking the wakeup threshold. Removal drains the IRQ or timer before
> unregistering the ports.
> 
> This serializes write notifications with port-locked serial-core state
> changes, allowing readiness and transmit-storage reservations to gate the
> notification without a check-versus-shutdown race.
> 
> Cover DZ TX servicing and JSM Classic modem notifications as well. On
> DECstation ZS, acquire the port lock before the SCC lock and notify writers
> after releasing the SCC lock. Defer normal TX restart after console output
> to a worker, since console output can already run under the port lock.
> Check transmitter readiness before consuming another character and drain
> the restart worker during shutdown and removal. Release Lantiq's hardware
> lock through the transmit helper's completion hook before notifying the
> line discipline.

...

> static irqreturn_t serial21285_tx_chars(int irq, void *dev_id)

>  	struct uart_port *port = dev_id;
>  	u8 ch;
>  
> +	guard(uart_port_lock_irqsave)(port);

Why _irqsave?

>  	uart_port_tx_limited(port, ch, 256,
>  		!(*CSR_UARTFLG & 0x20),
>  		*CSR_UARTDR = ch,

...

Same Q everywhere (it might be legit in some cases,
it might be too strong in others).

-- 
With Best Regards,
Andy Shevchenko


