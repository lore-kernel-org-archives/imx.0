Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5B6277022
	for <imx@lists.linux.dev>; Fri,  9 May 2025 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792278; cv=none; b=dVO/17aw/1AY54uN5DjbWOMP+duqPY9E9Qa6KtaeJoYWDxG0oQ15EaMxO2i5CRzVUv1dz7lDCIk+Er7h9hpLZWVI9eurXy3eWxdMMVqA9rRcm3h+rfDqi8HGIMQ4sL8HF8JaZUSRFTxmw57EloJ53+rnMneNthn7+6IZsCX4Vmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792278; c=relaxed/simple;
	bh=YYcaMDlGSy91VIYiFJ+u8TWuMfpHa6BMLlG+POxKXXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGKPArhqBfoXtlLfqW62TJwvD3S2TUkch44cmy9zx6loCGlSgvxA53AcWcdnTx3jzLOoip5cYd0nTLUHW2sXgI0BAlLguWAjM/YBsYPWbN8hBoFmusyFwiitW0b9GBCnLEafe2WJDbQN3cYfUmgj+6Cgzrcvc0TSGKy6WxwKeMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bTSWlaQd; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bTSWlaQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ozfwuFVEUTDToHBc2ETkpFdylwQ3tcpGJCK/felzs/w=;
	b=bTSWlaQdJy9Bsv9fnjqq9LEg0I6uljrRGlf6Kp2Dz0BsRNfrT1BVXJm0BI4/KT
	lMUm3j8dKIthxDKC/u5Dg2534izQ7DwnmvKIGN2HzYo1cWVBpQcULHQxQJsvXKTS
	LSyfx2OzDl0sONOQNwbNctjjd9ArnFebHo/8c0WMYFpNg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3L_8V7x1oHuWmAA--.37606S3;
	Fri, 09 May 2025 20:03:35 +0800 (CST)
Date: Fri, 9 May 2025 20:03:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v6 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Message-ID: <aB3vFciYEIIITRHv@dragon>
References: <20250421065139.3073232-1-ping.bai@nxp.com>
 <20250421065139.3073232-3-ping.bai@nxp.com>
 <aB3Pll3A/0XGCLlQ@dragon>
 <PAXPR04MB8459189E9DF97A15DB7386EA888AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459189E9DF97A15DB7386EA888AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CM-TRANSID:M88vCgD3L_8V7x1oHuWmAA--.37606S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU289NDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAhIZWgduuzANAAAs2

On Fri, May 09, 2025 at 10:35:40AM +0000, Peng Fan wrote:
> > I forgot to ask when imx95-clock.h was first introduced.  But how will
> > clk drivers use these clock IDs, or will clk drivers have their own copy of
> > definitions?
> 
> We are using SCMI for i.MX95/i.MX94. Per DT maintainers,
> the IDs should not be in dt-bindings, they are SCMI firmware
> defined IDs.
> 
> clk drivers is drivers/clk/clk-scmi.c, this is a SCMI generic
> clk driver, it will talk with SCMI firmware to get IDs.

Ah, nice!  Thanks for the information, Peng!

Shawn

