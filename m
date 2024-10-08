Received: from mail-8160.188.com (mail-8160.188.com [60.191.81.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142F4433D1
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.191.81.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379133; cv=none; b=pIcMWEG3zSbSEhvuWwfrcLbVEKtzn4P2DMFb+lBDpCpUa2ZjW8zPAhBQVFmKlXF0VP6zkZLL4+/AMyFUhjO2t3uvg2QNm2f3JY//UaTEp7XPUdz1qJFw2nlI1oA6ItRoYPT5g5I/ApvRymN73UnNVvNOQXdYI/Yv/ZOaf2yS5ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379133; c=relaxed/simple;
	bh=xp/68Cx4JRlTeL+tOib/NRX+oEcRL3V4NdWuBHUXf3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pi6I1vud2LgCMym8Px9B7fxbwskIpL2y63Che7eDNmR4r7iVqXulC+3qh8TYqwnev6a5VnVwolBYUMcqZBxZW3lt4sXWoTdMw4PC/2PwDUOWlGSodFTUczcss+fHXeixF/WZ5OGnEdlm8t5xZ9OX4FhqjvNif92j/SRVQhF+jSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FrYa7Z+l; arc=none smtp.client-ip=60.191.81.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FrYa7Z+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yXkETMi/gK2MJh7u9gvD7PcmwNOwvmahYOded8umsZ8=;
	b=FrYa7Z+lriH5elBiljxR0b6E/mRPZqy2Cbhq5tdiPuKblf3MA+0w3cIhFrKryj
	tTtZFlc1fXWsQpIRoCfszLI4iA5LJdHMeur2bWuC/h81s9dxHoS56XhxfJ2QSpQu
	dKQLKeej9seIsUzZ27nbx7BQpQJYUVh4FsYXoLeRG0V7g=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3Z9q19QRnWp7VAQ--.58757S3;
	Tue, 08 Oct 2024 17:04:56 +0800 (CST)
Date: Tue, 8 Oct 2024 17:04:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>, Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
	Chris Morgan <macromorgan@hotmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
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
Subject: Re: [PATCH v2 0/4] arm64: dts: imx8mm-kontron: Add HDMI and LVDS
 display support
Message-ID: <ZwT1tUhrO/avFG+4@dragon>
References: <20240828074753.25401-1-frieder@fris.de>
 <3280f47c-f1e4-4e12-8b48-4e5f68b7a606@kontron.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3280f47c-f1e4-4e12-8b48-4e5f68b7a606@kontron.de>
X-CM-TRANSID:Mc8vCgC3Z9q19QRnWp7VAQ--.58757S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur4xZrWUtrW7ZryUurWDCFg_yoW8Cw4xpF
	Z5W39rtrykGr15ArZrXwn5WrWjywn8JF43KwsYq34DKa4rAF1aqr1SkrW5ur4UuF4fWa9Y
	kF4qgr9aqr98JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UgiSQUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgxyZWcErZHkMQAAsD

On Tue, Oct 08, 2024 at 09:21:05AM +0200, Frieder Schrempf wrote:
> On 28.08.24 9:46 AM, Frieder Schrempf wrote:
> > From: Frieder Schrempf <frieder.schrempf@kontron.de>
> > 
> > This add support for the display bridges (DSI->LVDS and DSI->HDMI)
> > on the BL i.MX8MM and the 7" LVDS panel in a separate overlay.
> > 
> > Only one of the interfaces (HDMI or LVDS) is supported at the same
> > time. Enabling the LVDS overlay will disable the HDMI interface.
> > 
> > * Patch 1 and 2: Add the necessary binding changes
> > * Patch 3: Extend the BL devicetree
> > * Patch 4: Add the LVDS panel overlay
> > 
> > Changes for v2:
> > * Patch 1: Add link to commit message
> > * Patch 2: Add Conors A-b tag
> > * Patch 3: Remove blank lines from hdmi node
> > * Patch 3: Fix order of lvds and hdmi nodes within i2c
> > * Patch 3: Remove the unneeded deletion of samsung,pll-clock-frequency
> > * Patch 3: Use the existing MIPI DSI output port from imx8mm.dtsi
> > * Patch 4: Update copyright year
> > * Patch 4: Use exisitng MIPI DSI output port from imx8mm.dtsi
> > * Patch 4: Fix pinctrl for GPIO hogs
> > * Patch 4: Fix property order in i2c2 node
> > * Patch 4: Use generic node name for touchscreen
> > 
> > Frieder Schrempf (4):
> >   dt-bindings: vendor-prefixes: Add Jenson Display
> >   dt-bindings: display: panel-lvds: Add compatible for Jenson
> >     BL-JT60050-01A
> >   arm64: dts: imx8mm-kontron: Add support for display bridges on BL
> >     i.MX8MM
> >   arm64: dts: imx8mm-kontron: Add DL (Display-Line) overlay with LVDS
> >     support
> 
> Gentle ping for this series. Neil proposed to apply path 1 and 2 to
> drm-misc-next. Shawn, can you review/apply patch 3 and 4, please?

I'm getting this:

  OVL     arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb
Failed to apply 'arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtbo': FDT_ERR_NOTFOUND
make[4]: *** [../scripts/Makefile.dtbs:83: arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb] Error 1

Shawn

