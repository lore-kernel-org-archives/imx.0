Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352812;
	b=nBXV0q9ySieRMNnT66yTEtVI9MhoB05+9JfS0wr7TrCdZDQV6YhpYMJqeUGK0912YyGM
	 EfBykA8QTtKRN/OgohcwMU4zZBfjE55+tWbMzJ9EMXYRO9som+1+/hy+RbQJDSFX84uiy
	 DMnVktRtM0jNMcyBBHfrsgYnKWLuRPfx//YpRnxGZVvohE3XrvW7UkkKZ940luzfIiXG3
	 3qP/1eN2v72B6dvmKA912clXaaxQfhgXFCvwoEx+D6bitONLcU+oHCsMMcjHNE2b2l8f4
	 m2/w8pNSf/0GmeQztmGfaTURlcbPEkRQmZNxEpt1C1OCVlBbH7e9W3aJNyUnVo8BSDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352812;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=PCRyiewkbGG036lTwBa+174OovhhVRwZfC2vW3ZeNTQ=;
	b=Ba5H4NoGa/ZIMbTunj4PDlKnvLLLNqobWyTQDX4k3cmJ/SO2sMlXqbBYn+C44lz0nMup
	 V1hGNQ4KPutSpLlu62ioCM7+tGWIPp77bwXv4VDkOXCb7MZTuwCo6ngMkrWqPSfgh+awS
	 lhkE0nMN13WKh2E0V3YV7DXhHrxAcY4Q0I8CMhYAX+gX86EYiD21iT6N3FB8zY3tPqsmH
	 ebSgA6u9E7zMzlaMD5SJ0WgCphbXN5nobpHLg7g5GT23gM3dMv8vqFY/UFZUDO8vyaJOw
	 rnfSsFAoFulBJNCEQ2RMcYvVcrYu8ucLmPZMJYoG47sMFZkcZvo8qor1kU9BGs2tnNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NBal4tnU;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B417606A31C
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B417606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NBal4tnU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793352812; x=1824888812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qrpI44bWZaGg8MfD8DnU+yqorhMutYP7dQKRrMv1F3w=;
  b=NBal4tnUj5daNIubmburHT5z8glzJzepJxA3TJ/E7qM4G8rVHVOuTlME
   boSa7+kRUnsgENwpkN5Zoodeg61N5pwjH+HW/xPjyDXjGNkvkHJrBwOeS
   JbythcfsmLeU/Mtme8gq2xP7IWY26mgOvFu6YJaNKSdiE2idm+NGuxXuA
   8sG+EVWYavhV6wLzwURNmnpfJHgqaOX3/uGkoujF7SDCUjGgUtQs2x7Lw
   k+dRzfiD/b/QElX2I+xKVoodP0UveywG+XfWC0bAwB3O3CsuKulX4e+rd
   EsTtLaN+/igl7TiSczvpXUWrTddrrig37ErEoWJNf3yzOxQY5Jen21BJK
   Q==;
X-CSE-ConnectionGUID: EWK5r8kySa2D9m4K94fv0Q==
X-CSE-MsgGUID: fdv46k2ATZCS5w9JHRSAlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1999336"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="1999336"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:33:31 -0700
X-CSE-ConnectionGUID: qDHB30c7T6+C24I5cmm90w==
X-CSE-MsgGUID: v4Xg4+SIQQa629rjFUEQMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5926976"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:33:25 -0700
Date: Fri, 30 Oct 2026 11:33:23 +0200
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
Message-ID: <auRkY2h-NJvFszQE@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-4-3fd56ba352ed@gmail.com>
 <auNV7Vco5O3vVwRH@ashevche-desk.local>
 <CADvTj4oi6dFzWkjFXie1U49A70Y7Mb=4exga-=2SmG7fN2pLrA@mail.gmail.com>
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
In-Reply-To: <CADvTj4oi6dFzWkjFXie1U49A70Y7Mb=4exga-=2SmG7fN2pLrA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 29, 2026 at 11:15:23AM -0600, James Hilliard wrote:
> On Thu, Oct 29, 2026 at 8:19 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Oct 29, 2026 at 01:37:00AM -0600, James Hilliard wrote:

...

> > > -     bool                    shutting_down;
> > > +     bool                    shutting_down:1;
> > > +     bool                    tx_terminating:1;
> > > +     bool                    tx_flushed:1;
> >
> > What is the meaning of bool XXX:1? Have you checked with `pahole` the result?
> 
> These are one-bit boolean fields, intended to pack the state flags
> into one byte.
> 
> I've now compared layout probes using the kernel type definitions and
> saved build flags, changing only those bitfields to ordinary bools.
> For the complete v8 structure, including the RX flags, pahole reports:
> 
>                             Bitfields   Plain bool
>     ARM32 / Clang               212         220
>     ARM64 / GCC                 368         376
>     ARM64 / GCC / PREEMPT_RT     368         376
> 
> The sizes are in bytes. All six flags share one byte in the packed
> version. This saves eight bytes in each checked configuration.

Thanks for checking!

> The packing is a layout choice, not an atomicity mechanism; updates
> still require the UART port lock. Given the measured saving, I'd keep
> it unless there is another concern with using bool bitfields here.

I'm just worrying that bool bitfields are implementation defined and
might have some side-effects. But I see elsewhere in the kernel similar
approach, so I guess so far it didn't trigger any suspicious behaviour.

-- 
With Best Regards,
Andy Shevchenko


