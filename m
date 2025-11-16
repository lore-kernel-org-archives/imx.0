Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0248A3594F
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 04:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763265839; cv=none; b=WDhxF6Bb3szlcfJTNfyLPomt5deWj2E0CxVj9Zq5WvG9YlLHUrCE34VdpcXSbjSdgcTAPMJK/ntkdr19WwhCCDPG1lERkkvKjt+ndsqYUWijofuCLDsmYNx2dHFfoxubvrnSWeFXtqnrwTr1wf69poxxXmetMaHKLnDQMOCEQrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763265839; c=relaxed/simple;
	bh=Vf996jGOmPdtsYMOXI90D0Ds+Qp2izFoxJOXNHJyHjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlLmZSc1jLpMfRw/Txph8PeWhU0+j8qUAHbmJLfHUrIFlDEI6jhXfNVs2Bz8eML+p52jEMejCnydAkhEDflrwKrGqkwIEygCNt82goh+T+Bi03pa07S3kRB/CiKK3a+0GUqe3VcUnWKUeCFa2aK9kYPELO1wSqVcfZirDhVHXbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ChXMptBt; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ChXMptBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SzECtJsIWw4uXwE207Uew56sWP/Hi8jDptmOvx0q6Rc=;
	b=ChXMptBtzotGwu9WczLRdZ1I9cBfwNwr+3Tjt932mnVvxSWKoRxCitSitQoc65
	HjQj36I71NvU9ew6GP1w+iOj6dmnBUw2d5MyEwapujYfCbu2TNCuvOIjX5gwUPyN
	FnLI30+SPmOKeOKYSjzOcDtQz3ViqXXZ58rfGdG0VuQ10=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnS5gQTRlpbiE2AQ--.7844S3;
	Sun, 16 Nov 2025 12:03:30 +0800 (CST)
Date: Sun, 16 Nov 2025 12:03:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com, Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] ARM: dts: imx28-amarula-rmm: add I2S audio
Message-ID: <aRlNEJLVvFpEwf4o@dragon>
References: <20251027161040.2020623-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027161040.2020623-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID:Mc8vCgDnS5gQTRlpbiE2AQ--.7844S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7YiiDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhL3XWkZTRJ-8wAA35

On Mon, Oct 27, 2025 at 05:10:23PM +0100, Dario Binacchi wrote:
> Add support for I2S audio on Amarula rmm board. Audio codec
> TLV320AIC3X is connected as slave to SAIF0, which provides
> bitclock, frame and MCLK.
> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied both, thanks!

