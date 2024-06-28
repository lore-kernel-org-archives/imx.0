Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A4279D1
	for <imx@lists.linux.dev>; Fri, 28 Jun 2024 02:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719541767; cv=none; b=sjm4isLtjxTnJDjopfsvwocKrz4iY0yd51aB0DJySvQ0xGmSml5VDzTtRsnGMwHRYQl/pxswP/LNybCt1H1NxHrJw5yVAWdktRCugZc8AdyuBOiPPqlaRT/SDtC061CZtQNLhW94cnIfK5bLH7L0UeXWTtDLYB97Hsc6n4OrEOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719541767; c=relaxed/simple;
	bh=bNXaxGOE7yGzDQ0MM/fWZtxC4sNr5L15KgziOyTpL/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfKsRc2dRC/I0dnnILxFhiFdr6qucbp0lnfy07L/vfoAvi1rctIdeWxz4G3hlExEkFmlLrGsOda0SIUly2bPRoPmqjt050evt4/0X13szje2yUhdlVgxBT93hVVzY7YBsyIq2QGhF/wXoSAJGPvZ/cyT+8KjbH/LIbls+0BlEIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=honHcGUs; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="honHcGUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=HLCPQcwiJ7P6c70+VDNRHU+yLHKQEpLLIYZwJta3OnE=;
	b=honHcGUshwU0Hdwi5vsrwegLWIY/UM4Oov7pxjUzp3mnZ5aRgB503hDr1skdgX
	GR+GDbhqndFIu58d+XalL/U7x3FoMYXrBYu3YlrdTipGEn8hMVx69FWs1ZzMMnbf
	Je9G3dHJqkJJgrnScri5KKPT3DN37mZjqABUcC1UdWllQ=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnj5LXH35miRggAA--.1821S3;
	Fri, 28 Jun 2024 10:28:41 +0800 (CST)
Date: Fri, 28 Jun 2024 10:28:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com
Subject: Re: [PATCH] arm64: dts: imx8mp: Do not reconfigure Audio PLL2 on DH
 i.MX8M Plus DHCOM SoM
Message-ID: <Zn4f1x+7BHQKgglj@dragon>
References: <20240625121128.145993-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625121128.145993-1-marex@denx.de>
X-CM-TRANSID:Ms8vCgDnj5LXH35miRggAA--.1821S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIxpnUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBkMZWZqryPaBwAAsp

On Tue, Jun 25, 2024 at 02:11:09PM +0200, Marek Vasut wrote:
> The DH i.MX8M Plus DHCOM SoM uses Audio PLL2 to supply clock to CLKOUT2
> output. Those clock are used to supply on-SoM TC9595 DSI-to-(e)DP bridge
> with RefClk and must not be reconfigured, otherwise the bridge cannot
> work correctly. Stop reconfiguring Audio PLL2 on this SoM.
> 
> Fixes: f560da940e32 ("arm64: dts: imx8mp: Initialize audio PLLs from audiomix subsystem")
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

