Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC024A35
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 01:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729559379; cv=none; b=fzX1eb5t8nxSVhxusgDn6/w2zUg8H/39gztj1QtWkDcSK7X6O5Z+KNdhNEeT+vKLOGNlQGbNrS30le5pnWJ4/Ggu3TJrfRFkNj4PKOef0ObD0ZD4GwqCqXj2nKD7jayJR6g2QE2+ibGvZgYbDUCDaGXa5jOy3uK42zm5PzzuLwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729559379; c=relaxed/simple;
	bh=ibj3h7uU1sdJL+wHMspk7cWzqnWpMrRzWC/HrPMNItg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cl0oZhwgsNhb1LJQhXT1do685JXoSBiv5p+D1tthIuFL3opaiPSCdyzGbp485KexPryhkvVsVpkyA89R2EsFzUCMzvi/tXAGz2JaUniQhcNi+LgXbekgpBb/+t+Xd4RBcDLgoQ9exda3kjGHjJ/dpeiJxgbIwLmn9airWJOmOSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Tz7ikGwr; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Tz7ikGwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yny7DH00g8qimPwt52mB/AR4FqZsA3NDX0M5M5+ipOo=;
	b=Tz7ikGwrudkRr0lF23LZocqwgFFQvRxIV6CBGxtqvtTdpqbDyekqYSSQRbg5fW
	3nVj+xjxVpnIUj29IluDzBKypzDFjQdiZFU0OLxFqM6dUj5tdiE3RRCUD+gjt4Al
	DJVYdXIuIKJFLl9Ei+a+dD2j3SL+itxzKyFZhZoYyinnk=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBHv4H6+hZnE8qUAA--.5293S3;
	Tue, 22 Oct 2024 09:08:13 +0800 (CST)
Date: Tue, 22 Oct 2024 09:08:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: imx8mm-kontron: Add HDMI and LVDS
 display support
Message-ID: <Zxb6+iG7Lcrt5No1@dragon>
References: <20241008143804.126795-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008143804.126795-1-frieder@fris.de>
X-CM-TRANSID:Ms8vCgBHv4H6+hZnE8qUAA--.5293S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOtCzUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhKAZWcW3kZBnQAAsA

On Tue, Oct 08, 2024 at 04:37:42PM +0200, Frieder Schrempf wrote:
> Frieder Schrempf (4):
...
>   arm64: dts: imx8mm-kontron: Add support for display bridges on BL
>     i.MX8MM
>   arm64: dts: imx8mm-kontron: Add DL (Display-Line) overlay with LVDS
>     support

Applied both, thanks!

