Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814201;
	b=IIGCq/+QvO3rF2k7+KlzEAk3fcW90Iq9W3DrECEvsAe4t1LT0Hgr1f1A62B1Q4KatIxo
	 OiTG+MN51Ui/B/e0c8s69bV9mGNxBQ+WkhtL0MjuwJnPm41uUz+C3fDqjtLeI/4AiKZvj
	 nk802nM3FUt0uSXtEkQzSNtKgar+z6kzaP3faYk9KkihBcR2Mt2CZ5HaXuUaoPdDF30uM
	 KmrxcLBbzGz/EwHk0AbAdqKgodZWGYiv+isFEPwrE1KNd+GyUJ2hWTONv6sif1ANTbW3h
	 C6W9nq30sq7qntVX264PrwwvFsgDyfvbukhvTjE+SMpdkzOAVjegeqUeaOeNsdoUp7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814201;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=cpKxpc6WsFeeIjPOouIAutKYzzXcNv+Zda+j40xqrT4=;
	b=G65n55tca7fC3vlzG1gv5oiMRJ60zBhvuiLti1HfD/+Cp/PlFL/uEtvkMdbdLEwz25cq
	 GbGYxVecv0y1+8Z6Pyd3AIAmFSa1kFicU2pCN+xN1fWYzyiFHm38LQMKvrucf1NuahaJQ
	 fy8iob3hRWewFfQS2twfZMHI1pb1g/esCJtPWV2cx2eEY4o4yGemR455WhAwXItPV9SFm
	 Vyq+WnWkZDv8NE6GWxRToCKhSnzj70ayX5rjt/mGPMRIKuHQsJ2klTWbkHXMk21j1aoEu
	 3hSWyz6rnopMQa+hzaKUoXGWHm66cuva1dLP2NbHfrYLqrFlheDHLrtwWcyw+QdrCpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=ZaDDPzsc;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB3606A323
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 07:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1FB3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=ZaDDPzsc
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 2276B1F8CC;
	Mon, 16 Nov 2026 08:29:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794814191;
	bh=cpKxpc6WsFeeIjPOouIAutKYzzXcNv+Zda+j40xqrT4=; h=From:To:Subject;
	b=ZaDDPzscN1ltEbMVzyLxLzy6ReDNSpiilgbf3In3Ed36NMvylO0xTU6O01WzZA2Mh
	 rHctIcdBPAPpR80jH9vBnniG0FaigUtxWemjau0MNzGqQcjf4xnECf6gPTG3bM9Z48
	 LSG58aLaCVa0/djiHJpH4W+WG9AJvYn5YJA9FlauHtU0B41LMFzd8TmDzlqf7XnWWl
	 wh7Qy4grV0kfim9yxSAEAIOgiSlqZ2/upRHqPZIY1WdiAAmzQgfImcqmm6DAC8p76m
	 StCGLsx2sKthKr8XUxUMawKMzs8CDzo1u21rPoiN2e9yEt2Nl0K+r9hPdx65WGcvry
	 3tT8/c4txjCXA==
Date: Mon, 16 Nov 2026 08:29:47 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 0/3] Add Lotus Carrier Board with Aquila iMX95
Message-ID: <20261116072947.GA16341@francesco-nb>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
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
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>

On Thu, Nov 12, 2026 at 11:37:32AM -0300, Leonardo Costa wrote:
> This patch series adds support for the Lotus Carrier Board with the
> Toradex Aquila iMX95 SoM. Lotus is a carrier board for the Aquila family
> featuring a small form factor (Nano-ITX 120mm x 120mm) and built for
> volume production.
> 
> The board features:
> 
> - 1x 1Gbit/s Ethernet
> - 1x 10Gbit/s SFP+ cage
> - 2x RS-485 (Isolated and Non-Isolated)
> - 4x CAN (3x Non-Isolated, 1x Isolated)
> - 3x isolated digital I/O
> - 1x CSI
> - 1x DSI
> - 1x TPM 2.0 chip
> - 1x microSD slot
> - 1x USB-C DRP
> - 1x USB 3 hub
> - DisplayPort through a Mini DP connector
> - A mini PCIe slot with USB / SIM card connector for a modem
> 
> Additionally, this series adds pinctrl groups to the Aquila iMX95 SoM
> dtsi, muxing the I2S_1 and PWM_4_DP pins to their GPIO functions. On
> Lotus, these pins carry the SFP+ low-speed control and status signals
> and the isolated digital I/O readback signals.
> 
> Link: https://www.toradex.com/products/carrier-board/lotus
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
