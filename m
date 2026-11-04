Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825069;
	b=5iReYhWRfr8tc9UZKNPMRZaE/N7vnyjruLjVd5hSXErzHoB/AvVNoNqVDX0/P+AlAILI
	 pFRsyB8S1GzrEOqrEoSAeUw60TczvHRJQ1pUxNgiwrIaPASAXnKzvzlBXgwROROzVAd1G
	 CnoFMNC6YQJDSAX4X/7AxLbmv/HHVCGbf7/ciQM5dwOtIEKLpSp81kuHMRNkFvE8AKmiC
	 jAcldMVNxFcUvtrN4Xn1/QhPB8W5QKomlXIrM+w3ZGI6wlnch4zEA8qvm2RCdyPnXmKW9
	 bGDUiUhWLMsbEjxl4C+HCerm1hfGqNJbeiz+axEXwRf82Ou/YzjRaC0+aaTW30D1euA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825069;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Fu3Aq2hefSzjwRV+KYEz/CG5s0UvrmJ9SoczCNw172g=;
	b=qDJ6ACEmQwOPC+M56vMdKXcSMvUVuCkB275UNtsoM/bKRlvL9Zxa7Ft9CQiUhcQKocGT
	 gJ1xZ9h9nNzm3e6UgtEgNHD526Ajemrhk5JpXJ6Jfdr3JmLZTtFoNi0oLPfu49RUF5lsN
	 Fah142f1fNAeGsFEGOVBD48R7BkSU+jjXkU1IWd5qG2OqcoBXBf4+ASNhlyXzYi+HD7lV
	 H26Z0xcaP2jsYblEB3ejgJA9XgOtl+STbhto1ULt/AZb0j4FK3g/alD+sbZQDWmphQdr8
	 4whFDKOmLMCMU20C90pazWd6DrCWCJQqYrABtJIFMfV1xPKQHlnRPVyf1OsuB0NLbDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NRcZ9DVE;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87142606C471;
	Wed,  4 Nov 2026 20:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87142606C471
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NRcZ9DVE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793825069; x=1825361069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5sRT5I+m6KfQYFE3k27dO5MxaZynzJhyPdFPDxcOiE4=;
  b=NRcZ9DVEyB+z8PNUWWN1k1TwNJsHkHLB0RkIhXNi8OPPaumAbXwdBusb
   XJ0tRswIwk/HAI3U08NCdw8gSsd3fdHfsZGvIoakFFNjw3AMbhwBsxdvZ
   MF+IFI3N8G6s1cU9TZ6nu2D7Quh3Bd9w77S64rw1QFG76PE3tzcAH+cza
   JCV/7ImeaR645m5dp2GIWnI4RcctcQ0zYSIyQaI33Sl40LNLVHUHPcJ9D
   cTDOV5DlxtAWFgmxbMxz9PHoa3W0Xhp07+B1RPDbNL/WVi6i07ag3i3h7
   qw4i8gPp7H9DXoutExRukI4yyUua1UoY5hgyDVfZhouA34dOrNySljHLr
   A==;
X-CSE-ConnectionGUID: NkNZdLhaT3eysPfzIT/amA==
X-CSE-MsgGUID: EUMq4yy+RUeCSzBbPsUa5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2635153"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2635153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:44:28 -0800
X-CSE-ConnectionGUID: EZ1+q8OlT/uYk59yq1HNAg==
X-CSE-MsgGUID: icBbDpEQTOuZLO4D8LrQjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7215296"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:44:16 -0800
Date: Wed, 4 Nov 2026 22:44:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	CL Wang <cl634@andestech.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
Message-ID: <auuZHTvr5UI9Q9Q4@ashevche-desk.local>
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <b656861c-a087-4087-952e-91fd15fadd52@kernel.org>
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
In-Reply-To: <b656861c-a087-4087-952e-91fd15fadd52@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 06:25:32PM +0100, Krzysztof Kozlowski wrote:
> On 04/11/2026 16:22, Frank.Li@oss.nxp.com wrote:

...

> > diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> > index 762a3fb0fca81..de205e04a8600 100644
> > --- a/drivers/spi/atmel-quadspi.c
> > +++ b/drivers/spi/atmel-quadspi.c
> > @@ -790,8 +790,7 @@ static int atmel_qspi_dma_xfer(struct atmel_qspi *aq, struct dma_chan *chan,
> >  	}
> >  
> >  	reinit_completion(&aq->dma_completion);
> > -	tx->callback = atmel_qspi_dma_callback;
> > -	tx->callback_param = aq;
> > +	dmaengine_desc_set_callback(tx, atmel_qspi_dma_callback, NULL, aq);
> 
> Andy,
> These three lines look correct.
> 
> LGTM:
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

As

  Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-quadspi

Note, it's in your power to ask the author to split out what you maintain
to a separate change. So, it's your choice what to do, Ack the full patch,
give a partial Rb, ask for a split, ignore reviewing (often means silent
agreement when maintainer just applies that kind of a patch)

-- 
With Best Regards,
Andy Shevchenko


