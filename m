Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873190;
	b=KB72238RgI9c8ce40saEwJ5P3RQxFlpZC+7+uvHGyhWflSzZE5Pwf8RNJdWQ4iXNKlY3
	 DCXaPXa0iSs2ebVjdL1OcHw8R4lKhJyBLAfkUV6mbrOPZP8OqrFnNJSmhUJsRp0Zl3iUE
	 FJNLQ/4id4wESRHqoBM05D765/ZlNOuMAZsMGEn4mmrs+dT3u/VJyPiCJeJg2T7kACjrX
	 DwVTmC9S7k0iEL6qe0YRNQsIFH4Nc/1hDaSzsqL/kh+LjLUNTxo9OUyTFBg4QsKn53hrF
	 FQYqP7gX1aBhrY5dCKM9Mlr4bynqNtH48uEiz63huBpIOat02gmnp7jR6RifkL8QaIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873190;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=9eN0QkSa1ecIUgCfCf76DF+V7dyFmgHFBWvD0/9mpfY=;
	b=acTYFbKKbJHxSLycr/wrjatbMfZae4A8ZmSKXTvqtwPhVtG3huiRAnqsaLrFoNt9y1LJ
	 tq6OiH660uQnXzvOxzMUgIzkjL+6S7vFXYUlebXKfI5FxgLhtI32k50RsWkYN4KDqLC9V
	 9dK1Kmi1CeizJRjBck9FLYt1k7DKkJjRLdRix2YbCZDxe1Wq9ifax9RCzYy9jpPflwAxn
	 cxM9c31ycFuUyuopDnUERQDybO2RNn61Dvs2BrVWseXk7Eo+RGXGn8AVecA+mqtedBx3j
	 0hML+CH/+/uEYOnIDs+fGEVTO87s3w3SqTNQUHP9vkH871guODtYfQEf77bDnMszbFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehmTMZmr;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4840D60A263F;
	Thu,  5 Nov 2026 10:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4840D60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehmTMZmr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793873190; x=1825409190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sHuju/foWw79h0Lx9lDW6+4gtj0ksiGlzl0r5P+LOfY=;
  b=ehmTMZmrMqnYz2X6mrOdbbN7OuMRpJGYMOgVpj9q19RhmobBEqL23FL7
   P3Aa2xHuMYI7uPPOO1fMUlHnsDJ07XuctqygghYOuZhfDZqtLKnQDNCUM
   RxlktuQHR32Kpq9G5t+lYDbqRV6Y93/YU7CrseEVAQ6xX7DZI+JypgJb7
   VFtpe6IDigflPnIW1/xD94t1W/7NTLrNzKhQCkaqrnNF0TyRf1a2TSa6V
   O6gawcoPGEjYOqbSz1D7uMkNyN0qDyhDD6nUj9FaUCGUHshDeC+FqR8si
   AZtleHUc3wwk7vqi2wdMOekS55fwyDBYQvHIfJ4Q21FfR0G93zIfF0jkw
   Q==;
X-CSE-ConnectionGUID: 97yT9J+xSsa0gLl769WcKg==
X-CSE-MsgGUID: McSn2q8WTOiwLV3UHck8Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2687012"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2687012"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:06:29 -0800
X-CSE-ConnectionGUID: 96Aad4J6Td2JN0y4EunOKw==
X-CSE-MsgGUID: fNrhP6vdSb+xZdaYz36idw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8733180"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:06:17 -0800
Date: Thu, 5 Nov 2026 12:06:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Frank.Li@oss.nxp.com,
	Mark Brown <broonie@kernel.org>,
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
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
Message-ID: <auxVFt8_vZKzYniK@ashevche-desk.local>
References: <f1fa853d-1703-411d-b2d2-0fb0b176c2fa@kernel.org>
 <autqC143h7Qf1R9H@ashevche-desk.local>
 <9e39502a-dd17-4fa2-98a3-9019523cb5e8@kernel.org>
 <auuYcS7-YqJKcUbE@ashevche-desk.local>
 <63c24437-4261-4a51-be7e-31ac0759a095@kernel.org>
 <auxGom0XR-Hax9b3@ashevche-desk.local>
 <00390a20-7630-4066-9779-06c8f915a176@kernel.org>
 <auxH_WzaOLsQ4-go@shikoro>
 <auxOFGTRAKb5bLXD@ashevche-desk.local>
 <auxQU_PU4bwLJUch@shikoro>
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
In-Reply-To: <auxQU_PU4bwLJUch@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 11:45:55AM +0200, Wolfram Sang wrote:
> 
> > Then I MUST started REQUIRING to split the patches in such cases to actually
> > review them?
> 
> Okay, this is a solution, too. Or requiring "# subparts"

TBH, I am flexible to both. Depending on the situation. I don't want to blame
the author or require additional work when it's not really required. But on
my side I still want to *review* the piece. So, "# subparts" is fine to me.

-- 
With Best Regards,
Andy Shevchenko


