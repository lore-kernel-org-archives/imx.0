Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941015;
	b=YI9v1I49AOKvVeNhsccR1XFuaUev7zq8vUXwZhCsCbGYWQ7KiK+2JTM3a9+Ab9p6M1GX
	 Fpw2060WoT5dFnMeuASsyVFcl6GXokYFhrKTMFAHjPhxMgszcGLFs+ry5kLuiShxJViw1
	 XEHIceCPzfTRaUH0nU341kX5n3x3FjY9kF+WfUD0+GMKYn0Ap8kvuszWcmvLqmeSA2v8/
	 xQepNyCvaJ1RDm9JgiUhKux3HGiT5vPKLzVkEhaqkwR0sldXaDImZ+eTKCyU11Avx4ftf
	 tVmlJoxq7ENqdPvdd0DzDyNnh87ANJnXYoi/0BXC5RNopQ/co2whzcm7q1uW8/NSIFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941015;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=g9Cjhr9HIGyxWaiefhej0MIXutOky0k6Ipx1aCyOOYw=;
	b=bt1Mk7CkYbo8PfRUeDKTBDqi1Dr/GC2K98KP88uqDPCJhygAmjgx862Ww3ozSp3SPT1n
	 IfPiSyWRQyWrxW2RAXchSWm4q4ZR3ZQ6jMTBZzvZkT8oiFPT1MN8ht1VID9ml4kWJ57yO
	 z19Q+E4D9dQvqbPQPBnI1M1eqFYvYo8RCkcuRwsco2wtbtlLMbW8N7VE1bI06fmxBFf01
	 eBrmzPfy2fGQjjKQogwKSywQrgvM01//dbRoYRT9sjhzAkMI322u0d70Mh0TaP03xX4Ef
	 UbjV4PyC57/fg3HLMTRewQEXckqSynrLvsf7W4bDCPlXecigvhnSHSKNq4zfpc05r/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896DB606A31B
	for <imx@lists.linux.dev>; Sun, 25 Oct 2026 15:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 896DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792941005; x=1824477005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sA5QKtn9sanR6lQV8toNGWBsgGwYIwudn1w2NIqY2pw=;
  b=L/X34Br4RtJ9g88daUhCVMis2U/0g//FIMZ/h2VtkikoxoqaY8SGICED
   FiLhh2ZYNg5/6TYjziAsn0npDxM22e3aZwpkG+N6AYwj7Y2Lk9H63lqAo
   jTIEMAX1h3cEhh5KzdYllq+FzE7cqr208SK3J3E35G83Ou2eyXoKq32tK
   I8QVASIS3z/mBsdIjTJhWwDiMHJc4enA7evYT6VKDrVMrmGUhbd8LhlsT
   4A3lGmh77f1Y3purCXBqBhwZAhSCR93AqR3Bmk+koWMhLMiHVdC1ofGI9
   xY4o9uZkUBt50Vpm8jweqzHCwA992Qlx6FjLQ5xiakH7HCjYYWSwlIh2g
   A==;
X-CSE-ConnectionGUID: 0ToXlaGwTVCK0r7NSzGZMA==
X-CSE-MsgGUID: yMvxpPO4THWQDDOfOoBo2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1514232"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1514232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 08:10:04 -0700
X-CSE-ConnectionGUID: m5yKUqx3Syu8lkGMnczCnA==
X-CSE-MsgGUID: IKd3c9pGR1yxq5RGFZfCAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4150612"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 08:09:57 -0700
Date: Sun, 25 Oct 2026 17:09:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: James Hilliard <james.hilliard1@gmail.com>,
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
Message-ID: <at4bw-G8czG-G7Wl@ashevche-desk.local>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
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
In-Reply-To: <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Oct 25, 2026 at 05:10:03AM +0000, Maciej W. Rozycki wrote:
> On Sat, 24 Oct 2026, James Hilliard wrote:
> 
> > uart_write_wakeup() expects the UART port lock to be held. Several worker,
> > DMA completion and interrupt paths call it without that lock, including
> > indirect calls from uart_handle_cts_change() and the transmit helpers.
> 
>  Fair enough, and thank you for the cleanup and spotting the issue in the 
> first place, however...

He already issues a v6. I think the tactics against AI contributions should be
to not answer for a week or so until there will be a quiescent week. At least
that's what I learn from this patch storm.

-- 
With Best Regards,
Andy Shevchenko


