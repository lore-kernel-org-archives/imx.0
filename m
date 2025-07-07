Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8511FBEAC
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873869; cv=none; b=Q3yDvQeViLWRwm4leF25MKVWqXLWUAby6NskF6hFGBc7awa0q0V1rMkkuM2qlSxC3mrov8VLbmVuHi83D66FkRpIFxyFILux/+TMMxie8/gp6h9ndsUO9150IdPLrYYuZfQXgn/t0J79l9YVici0I/5W6IdH9QleKb4lsJJUEqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873869; c=relaxed/simple;
	bh=n4UW7ZoSq762p2vsAB0ks/IJ++q46OJO7BcDrp5Hjvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hei2mYdTEofdhtd/6Hvo6dxp01qeakhy5BxdP74fK20mAHGapz0n6H0i2EQyBsIhOySK17R0L/atFVMXLoHoxHJ0Zy/8ZYLcJRqDSAa1RLuuHGuBxlWyUylN5dMZSJN5FXpN4gkgB9mwmtBzP+96BddGkGnq4TeyhtnpETB6810=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jJvp+wqE; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jJvp+wqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7346OZHTuSrLm7WiDgkYI1AvDhjuIewBzgFjJ+P/eQs=;
	b=jJvp+wqEORUgf5bHI7laU///x9HXRZv0yPGdDonkb2PfI/m+wW2621MG6aroIJ
	Kr4+4P1HtNHIWtDcpf4AwEH5H5l8e/nEtXa1POqi+x82vT19GmWgjOezD2gS3oiQ
	fuKB6fl6IjvNJctcq+BxQgOBtYzmROYohhwbvKeTdst/E=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXX_YmeWtoME88AA--.37050S3;
	Mon, 07 Jul 2025 15:37:12 +0800 (CST)
Date: Mon, 7 Jul 2025 15:37:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mm-verdin: Keep LDO5
 always on
Message-ID: <aGt5JoocafXbX1cX@dragon>
References: <20250623132545.111619-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623132545.111619-1-francesco@dolcini.it>
X-CM-TRANSID:Mc8vCgDXX_YmeWtoME88AA--.37050S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4rur4rAFWUXryftFyDGFg_yoWDtwc_CF
	ySqr4xWw1xGFWjy3yqkF4UZFW8Kas3tr97tayIgrZxJF9xZay3XFWktFn5ZrnxGanxur98
	Zw13t3saq3s7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj7DGUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIAhdwmhreSi2IQAA3y

On Mon, Jun 23, 2025 at 03:25:45PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> LDO5 regulator is used to power the i.MX8MM NVCC_SD2 I/O supply, that is
> used for the SD2 card interface and also for some GPIOs.
> 
> When the SD card interface is not enabled the regulator subsystem could
> turn off this supply, since it is not used anywhere else, however this
> will also remove the power to some other GPIOs, for example one I/O that
> is used to power the ethernet phy, leading to a non working ethernet
> interface.
> 
> [   31.820515] On-module +V3.3_1.8_SD (LDO5): disabling
> [   31.821761] PMIC_USDHC_VSELECT: disabling
> [   32.764949] fec 30be0000.ethernet end0: Link is Down
> 
> Fix this keeping the LDO5 supply always on.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
> Fixes: f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Applied, thanks!

