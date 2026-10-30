Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353216;
	b=HbmVErzOdWQisXkI9byMrg6zh8rEUyZJQieCNpIa+b6+gFOyba9QihXBoVsxTjhB7qPt
	 xAMtR2anlubFoEB0PgjGg5HulK5xh5+VPBEFtoAJ3qSjUzl4qbvAIUgYzonECpCUWo6Ri
	 ND55GG5zdTo8hI4GK3oX+xydFGCi8G/tjjKmXZE6c7c30P6DLCNRvqdsedKJYrWMOVSk2
	 1LNyUOwhCSbsDBfxf/PjTZv50hc79ELgLibr5+WoLZixTG1t/Igpk6I33b8r6AKIsGp1m
	 ILRrqB6KHddhTMsy0w8b/qk1tpYKTGbWUsbJPEFj6uBTH5ZrGKeRcw3jOo0gugKCOlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353216;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=OGxTx5VTRibU/s9XnjHXs/1x5TiFEbymfoF86VCpiMU=;
	b=QFJ1d4DS8+X5QrVDPXQBA7CdTQyH17FfXxwkZCltRMslK9xO0BW7S7YhPPlbFoXnz6YM
	 rIG18eyqwij6bXPbvsQp2/7uEbCML07ZRlB9i79M4MCB0nu0hwbMhaCNfSZrIKN4P16MF
	 +bYqBr8PGh8WDAnf3ZKphJV+YcHZh6hnuBbMlJZ2M1rc7un4iYLKSrQuB7hf9EDQDMBua
	 aaEpBt0NBxEJRiquD1ZM4UocswSXNNkCgrSNxnnAnO4WL35ukVhyzybwWLE6m7+Nn+nbp
	 vgnzGl0wdvPQE5NqLXyxsWDzTZRVOdoCxuT8dA9PQ+ruOt4sHMO0U6c7r+qk1kYMJLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S2JzZQkK;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19394606A33F
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19394606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S2JzZQkK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793353216; x=1824889216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oih7GtI7xMzGahP76vQil5qWDbgK0U9SZz4iJvlgoJY=;
  b=S2JzZQkKWyUEwFwu+DJ3E4HjsNmvZyXpNs8X/4IZ1uhh7KiDhkoOGDOx
   ct+Spoizbd1PnBvqF8r0tnfTWKPkUy0y7wmjmtGCvAYuMFiWHv+ZYp0fR
   Nbme4gLjPd5cWNr0lr3AyzRu3kfCSHDRmvTzi6hwiY5RQAeBNoD6ERcse
   gPbIsmQA+JAn2DyfY00chJvvBuEqips4lVt34gvUpw7e0cSVXFAFDdUlp
   EPbJGKrD0uwBlJ4Yp3FUgg+mFb7V0gD9xZcuHYp7AlI3ZFC23hDkaU61b
   TddHsJ//xNZ7QR3/X8JvmUYpO8vzAHp8W+4A0LUjL9JfifggvY7IW34Fe
   Q==;
X-CSE-ConnectionGUID: x3OIAmnHR6mQFF0SLnMayg==
X-CSE-MsgGUID: TY03GODFTMmK/QODIk9/kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2128795"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2128795"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:40:15 -0700
X-CSE-ConnectionGUID: 4kQkNl98Qy6vjhZtyQi8Sw==
X-CSE-MsgGUID: dJ/QkbhGQBS9LRHlVFiP0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7184902"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:40:10 -0700
Date: Fri, 30 Oct 2026 11:40:07 +0200
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
Message-ID: <auRl9ztbav4nHi7U@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
 <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> On Thu, Oct 29, 2026 at 8:24 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:

...

> > > +     while (rx_ret || tx_ret) {
> > > +             dev_err_ratelimited(p->port.dev,
> > > +                                 "DMA termination failed: RX %d, TX %d; retrying\n",
> > > +                                 rx_ret, tx_ret);
> >
> > > +             msleep(100);
> >
> > Huh?!
> >
> > > +             if (rx_ret)
> > > +                     rx_ret = dmaengine_terminate_sync(dma->rxchan);
> > > +             if (tx_ret)
> > > +                     tx_ret = dmaengine_terminate_sync(dma->txchan);
> > > +     }
> >
> > This is unacceptable. Sleeping is okay, but value should really match the
> > baudspeed and other parameters of the transfer.
> 
> This sleep is backoff after dmaengine_terminate_sync() has returned
> an error, rather than an estimate of UART transmission time. Each
> retry asks the provider to stop the channel again; elapsed time is
> never treated as evidence that the resources are safe to free.
> 
> The particular 100 ms interval has no hardware-derived justification.
> However, I don't yet see a sound way to derive the retry cadence from
> baud rate either. RX can be waiting for input, TX can be held by flow
> control, and callback retirement is a separate requirement from
> moving bytes through the UART.
> 
> Do you have a particular provider failure mode in mind where retrying
> termination should follow the serial transfer timing? I'd like to
> base the interval on the condition that can make termination succeed,
> rather than substitute a wire-time estimate for an arbitrary delay.

Termination of DMA sometimes require to clean up internal FIFOs and other state
machines. That's what happens on HW side. In the software waiting for too much
may lead to the very big undesired latencies. The value of 100ms sounds insane
to me for the HSUART cases (megabaud range of speed). Also note, not every PCB
design uses HW flow control, so this may be even worse for them.

> Regardless of the retry interval, shutdown cannot release the buffers
> until the provider establishes that DMA and its callbacks have stopped.

-- 
With Best Regards,
Andy Shevchenko


