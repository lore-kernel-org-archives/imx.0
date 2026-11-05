Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871964;
	b=Y+CjG04OBudmpAx5uyaz8DdN3gl1znGHJ139VB7+qano10QTgq8bf/OHaRcQ9/TMH1fD
	 xMyYjmHo/YTykhNE17L2E/Xht4+6jVrKsUAQiBV1ljNNPwxtL8puyCySfPC/H0UeUJYmM
	 vMVy1flE6vK5N/niAOCYQnnm5brAsJhShB6I41xieT3ZxTXjT1MnVI4Zmfq6erBDaeVIG
	 l0IzvZJGymPNm4lZlGyzgqo9XzyRS5OT+xYeCy00e5GzW9xDyEZtqclZOQUtoEv32OS7y
	 UIrA/HCCq5LenSpTPxHdvIRCB/VtyKXtBAGftxBhNyzVCCmCC6CFFBAuELnO8+Dsa1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871964;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UGJviNUom/9cmp2FuiSup9JFaRpjsLnal6a9UIzq0Iw=;
	b=qTsDodRQLth6YFxl9bJN6Ec+0HscQkh0yNue8Wl6ypzvW4KBhugxaBCghWPJQHREp6QG
	 oBryE9dqpmwQEJC1leolfGu1eV9lsHWkx1eYRPewgZItPUpULGekj23Pq5Ig3XoNHFAH8
	 1dETARg3x5J/5BBk49z+V/lLLpehRITKg+f+a8Ft/wJ2thdUE/Z4OgZYHFUsWiqLZgnIm
	 +z2FF/DcrKJomuzw4Dte1kggCAfXX6XYoVgE+fGUiOqzQgPQjsjPjg+FW2MmJfXaJOH8Y
	 444A8QQfPoufBr147FgcTu0sTS/z7SpJylSWG67ct0tRvRDttp3U5WSQY//FDN92aAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=dVQn1+33;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A620F606A32E
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 09:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A620F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=dVQn1+33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UGJv
	iNUom/9cmp2FuiSup9JFaRpjsLnal6a9UIzq0Iw=; b=dVQn1+33DAVyF+Mmc8wl
	nZX74cBnZtcOaNxqwX+f2EN35vIuvwcCBbs5Y4Uif6xNJ6UewE1QVIpTltPVup50
	MlRiuhMLiINXNw9vKnwwB0a1f/U65VvmL+iaby9q20fLvGJPiOfZ+xoYgRcT9/W9
	d/g3k34Y1x5VkozWd1TK+b3NMoy//cW6D20URGPVMrKYNItPGgXDmf9IECVFTWMq
	umAJwe4RBh71+/BSasOo1K7nwQ2OIVJXYAxg+XM2NraSzagEOqBo8lznHsahbQ4c
	gdRePSo1a6sFJIyTdvhIEQ1S403xaUtPpDJZPJOWG87m0rLe4ikq13/1eQDnBRom
	Ig==
Received: (qmail 1094124 invoked from network); 5 Nov 2026 10:45:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2026 10:45:56 +0100
X-UD-Smtp-Session: l3s3148p1@k0qyXIRfQJzAwtcC
Date: Thu, 5 Nov 2026 11:45:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <auxQU_PU4bwLJUch@shikoro>
References: <7f96599b-681d-4963-bdda-1274371ac84f@kernel.org>
 <f1fa853d-1703-411d-b2d2-0fb0b176c2fa@kernel.org>
 <autqC143h7Qf1R9H@ashevche-desk.local>
 <9e39502a-dd17-4fa2-98a3-9019523cb5e8@kernel.org>
 <auuYcS7-YqJKcUbE@ashevche-desk.local>
 <63c24437-4261-4a51-be7e-31ac0759a095@kernel.org>
 <auxGom0XR-Hax9b3@ashevche-desk.local>
 <00390a20-7630-4066-9779-06c8f915a176@kernel.org>
 <auxH_WzaOLsQ4-go@shikoro>
 <auxOFGTRAKb5bLXD@ashevche-desk.local>
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
In-Reply-To: <auxOFGTRAKb5bLXD@ashevche-desk.local>


> Then I MUST started REQUIRING to split the patches in such cases to actually
> review them?

Okay, this is a solution, too. Or requiring "# subparts"

