Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283581;
	b=sRJac4pN+oAUUqDqVDf4yfAYxzE9ljxfIfazfKIcgSzveV0dypzI4bCmmpdfJL8sCLuJ
	 ZZtB4gVcZvnrwhJj8vXH1fSuqIxE19xJwXXO+3WROZvTFSkmibGesQmGri0FXdBth8R6e
	 rcnWG3Cf5tBpLR20h/Yp2GJV6NQLDX+CG23Qkez7so1JTVQPMtxPP9Ml2nLzZnv5MPUPk
	 e0Ik01tT23bWQySDOJO3SWfyDjEYvEW4QnMesX2IvmA1fxW3g2Wpwyw/M4RJpcxWPIFzB
	 +9RQ6WK4iWj8OnAuUsxxCXc5kGUVZNEdEGN6+GKqtgHl9xC/v3rfkFciFz8VuJJJBww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283581;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=0t7g2WC+b9FztvwqiERlUGDT4mF51ROculYuxl9U52o=;
	b=Qq5HyNPSMJuBVDR7SE2AAH8XJmzOvBZFNrlOBZqPdu7kDqENZLEI4czWfgTBy+IQsQK8
	 u1Ud7EC/s6IJwX5rWFblyAUsX3yuLACG45SkFvlw4BwqYJa/l7EX5sopTuzJ8JLyUgP+N
	 HIy9C7QZbkC2tY/Yzy5Ju4ttgps/l+A5HQof8x1Ez2PkNCYZfXG3QCjv72GQittbAeUJE
	 Gdfj+uSXcX2++f3cOXBUskDWtdhb6P8wOp0xzGaVqPO+dYCzo3cJ7thNeUuEsUjxMLpL6
	 1G5CMahBboKY0we6/jzO/aCz27otqUDRg3o94/R/ZaYSFlVzPmrXtm41eBEJYHLyqhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IoDqCnzs;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80771606B6CC
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 14:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80771606B6CC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IoDqCnzs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793283580; x=1824819580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ks0QnF665NpX8S1B9/P4xaJFMSaRvnc+QpU5Vun1o38=;
  b=IoDqCnzs5Ta+IEfZkgx/ek5NltrkDcYcJ3VQCGvY0M3L4UgD65O4xdhU
   rwAimCszQa3sRsY/II53KWrfc7mJoQLdV0CNGbXxUvAmQ4r0IpCHKS2y1
   c3a3kz9odCntcybB79B3IXhY38PlBILHkHhYW0FNPvbiHEim+EdiDjMRS
   lQjftt6TKiVXjJBroOqNUgc2lAMtJ2Uy/yitsve7b07bWVt+ZZX5pdwhW
   JQeARvH4/ATGcOPwriCSMKVB0iOgnonHaOUq6j33EXM+z+lCGv2o9RVFJ
   ynNFlnFh3Ru0YVQbtvjKOYuSObdcCRfCenFa4/jMdTo3vqtPtasMjQv3h
   A==;
X-CSE-ConnectionGUID: k5y99DqmSg+r/uqLICDFkQ==
X-CSE-MsgGUID: 5LG4qnYUQee+/KJ/kiTxqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1934272"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1934272"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:19:34 -0700
X-CSE-ConnectionGUID: QyJOQ8qDTY+boqh3NJr+/A==
X-CSE-MsgGUID: 7B3JJIPERS6eyiaI7RVCSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5119312"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:19:28 -0700
Date: Thu, 29 Oct 2026 16:19:25 +0200
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
Subject: Re: [PATCH v8 4/6] serial: 8250: drain canceled TX DMA before
 reusing its buffer
Message-ID: <auNV7Vco5O3vVwRH@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-4-3fd56ba352ed@gmail.com>
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
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-4-3fd56ba352ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 29, 2026 at 01:37:00AM -0600, James Hilliard wrote:
> uart_flush_buffer() resets the transmit kfifo before calling the driver.
> serial8250_tx_dma_flush() terminates DMA asynchronously and clears
> tx_running, allowing a new write to replace tx_size while a detached
> callback has not yet run. That callback can then consume bytes
> from the new transmission. Reusing the reset kfifo can also overwrite the
> source of a transfer that has not stopped yet.
> 
> Reserve the flushed FIFO storage through serial core before returning
> from the flush callback. Keep tx_running set until a worker synchronizes
> the terminated channel, suppressing old callbacks and new submissions
> during that interval. Return the mapping to CPU ownership before releasing
> the reservation and waking writers. Normal transfers continue to use the
> FIFO directly.
> 
> Reuse the locked completion processing after retirement, including OMAP
> delayed register restoration and transmitter-empty handling. Take a runtime
> PM reference around worker UART accesses and drain the worker before
> releasing the channels. Shutdown releases the FIFO reservation after
> stopping DMA and unmapping its source. Serial core keeps writes and wakeups
> gated until startup or resume makes the port ready again.
> 
> Track a flushed FIFO separately from the transfer length. If termination
> fails, retain the reservation until normal completion and account the
> completed bytes without advancing the reset FIFO. After successful
> cancellation, process a zero-length completion once callbacks have drained.
> 
> The race was found by inspecting cancellation and restart while preparing
> H616 UART DMA support.
> 
> Retain the tx_running check in both completion callbacks. Releasing the
> reservation relies on the DMA provider draining detached callbacks when
> dmaengine_synchronize() returns; provider callback-lifetime fixes supply
> that guarantee for controllers which previously lacked it.

...

> -	bool			shutting_down;
> +	bool			shutting_down:1;
> +	bool			tx_terminating:1;
> +	bool			tx_flushed:1;

What is the meaning of bool XXX:1? Have you checked with `pahole` the result?

-- 
With Best Regards,
Andy Shevchenko


