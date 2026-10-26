Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045934;
	b=Pv+kwBPtzkQUAD+7qr/9YAckdDKHFGSBd20+azS57IjXKWa+poH7f2ZVbit8r4i5kEvR
	 zPcUNkBzfPg9smA/ArFo/YEjeLRec80hG3nzhHmYG0kFUWkCGYb8QafsgFVfLEDMDW3E3
	 pYLY96mKcTM1ZQuQfebiWiybsOhmybjY78RSJzgXDqEE6XQ8HK52E3LDBfK76MTRJfCIF
	 6L/Jwn8BQKDMTuvi48zzB7J7R+bAFY527RZF+QtnVNJurTgN7my930MIOYO5Fxs7ZGCCW
	 OAM8KP4CVXTFv3853q7N1/lV1oSinoyeCNmRTxsENi/uvGOq5r1t13TfytT1n4i3Aog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045934;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=krAfBfFlNHgNlSxlUe+LuQnLSnJioLdfsgot8iO3v1A=;
	b=yD83tv8nOu03PZR+iWf2KgHiKLz4UVzd+1Xf3qcLm7ssLIUeyJTnitbOO33N5zXuD0bH
	 RRZBZq0F/tpagbDInjDKGzIVaz/FeU+XJbCwCD9dC/912n5aCblzFWDaHlA+TVd2XNGOi
	 w6tyHjLeJV6+DJwatejaXSrXTd93b4XfOEHxNDGeUvxo1TBoDn7ns9pZ9YbVCzFAtdMZ4
	 uHPN5PLNB6V4Cfe5ZhlV3lbrTON1mpg1b2hy/DWwfx/brXlKa7gqTNXGP3TggGjux5hdk
	 eWzmh2yri90kI27bRSIKqSNoDQDfQT07bZuoU1IwEcH/7/op4tXAzc11Wmh8U9oQd8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K30g183c;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52817606A31A
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 20:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52817606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K30g183c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793045935; x=1824581935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zUbmRDmK8gkD3yRwfjA9S4957SSqr5wODL3BCxfAj1I=;
  b=K30g183cmbrk3rsja4DMqFo5tCRJb+heszATXEiqv/eXpSR5BoYyy6lb
   L/9sgc/oPCc8MUKPjrQ3/BtFIMngKKL7qdosEoNcTu0dEl8TmJRoBQWB6
   Ph4vShgfTVH2A28AglQ99V4HYiwiBQvtg4ybVqTvwOO6x60lehtopLJqf
   aAOwCyRIfLaSN1Thj887LF7QpMIoLL12PSoqoeQTzljKQPTzRpHoZ8bNQ
   3Iv5qkI11fTyyZbA+R8GNFb4dURVLq0lm08QL0f/d0vrrkGWQ26OQ3XmQ
   Jab8rUuqPpsSUkJsWiNZXAC6mGOQFhY/76B4qEPM0LKzhdPdYzEJWuXs+
   Q==;
X-CSE-ConnectionGUID: vOvoyld3ReK2rVSdSe/0ew==
X-CSE-MsgGUID: RW90RpGrTtGkmmbgw2WCJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1745592"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1745592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 13:18:54 -0700
X-CSE-ConnectionGUID: kT+5/UsFQh2DCAfQ8Ot76A==
X-CSE-MsgGUID: CH2gncsbTPOGQRV4g+nYQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4311398"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 13:18:47 -0700
Date: Mon, 26 Oct 2026 22:18:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
Message-ID: <at-1pU9Fq-8bXZY4@ashevche-desk.local>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
 <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local>
 <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local>
 <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local>
 <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
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
In-Reply-To: <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 01:59:06PM -0600, James Hilliard wrote:
> On Mon, Oct 26, 2026 at 1:53 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > > On Mon, Oct 26, 2026 at 3:33 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > > > > On Sun, Oct 25, 2026 at 2:44 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:

...

> > > > > > Some people might want to test the stuff. And sending too often you actually
> > > > > > will get the opposite results, people will be tired to even start reviewing
> > > > > > and/or testing your code as it's changed way too quickly.
> > > > >
> > > > > My thought process was that people wouldn't want to be testing code that
> > > > > had known bugs flagged in Sashiko reviews.
> > > >
> > > > Sashiko reviews are not visible in my or any other mailbox. To see them I have
> > > > to go to some URL and so on, meaning to waste time to see why on the earth the
> > > > new version has been sent.
> > >
> > > Maybe the Sashiko reviews are getting caught in spam filtering or something?
> > > They are showing up for me and on the mailing list[0] so I'm a bit confused why
> > > you aren't seeing them. You shouldn't have to go to the web interface[1] to look
> > > up the reviews.
> > >
> > > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/
> > >
> > > [1] https://sashiko.dev/
> > >
> > > > It's better before addressing Sashiko comments,
> > > > reply to all people involved and to Sashiko's original email, so it will be
> > > > visible in the previous version why you issued (actually about to issue) the
> > > > next version.
> > >
> > > Hmm, maybe it makes sense to enable recipients in the reply_to config[2]?
> >
> > It's up to the list owners / subsystem maintainers.
> >
> > > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/linux/mailing_lists.toml#L290
> > >
> > > > And before even issuing it, wait for a while, people might
> > > > disagree with Sashiko judgement or your replies on how to address that.
> > >
> > > I was assuming everyone was seeing the Sashiko reviews getting posted to
> > > the mailing list already. The are ending up in lore so unless someone isn't
> > > subscribed to the list I'm not sure why they wouldn't be seeing those reviews
> > > already.
> >
> > I assume you already answered your Q. mailing list in this sense doesn't mean
> > recipients. I think it simply goes to the mailing list without forwarding.
> 
> Do we want those reviews going to recipients as well as the mailing list?

I am neither maintainer, nor an owner of the linux-serial@ mailing list.
I can't answer to this.

> > You can ask at helpdesk@ how this is configured on the kernel.org side.
> >
> > > > TL;DR: this mailing list is *not* a playground with you and Sashiko, the whole
> > > > community is behind it.
> >
> > > > > > Settle down first
> > > > > > with something, put on the cover letter the answer why not all Sashiko's
> > > > > > comments are being addressed (for example, due to amount of patches or the
> > > > > > series being focused on a certain issue).
> > > > >
> > > > > So, in general I've been always attempting to resolve known Sashiko issues
> > > > > in every subsequent re-spin, so that would be a bit tricky since I wouldn't be
> > > > > aware of the Sashiko issues until after the series has already been sent.
> > > > >
> > > > > Usually the subsequent issues that get flagged are new issues only discovered
> > > > > after each new re-spin.
> > > > >
> > > > > I do have a bunch of UART/DMA related patches that don't have flagged Sashiko
> > > > > issues so it probably makes sense to try and review those first while the larger
> > > > > series that have Sashiko flagged issues are still stabilizing.
> > > >
> > > > Yes.
> > > >
> > > > > > > [0] https://github.com/sashiko-dev/sashiko/pull/389

-- 
With Best Regards,
Andy Shevchenko


