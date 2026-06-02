Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CFB2F1FEC
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 05:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780377120; cv=none; b=Pok2Knv/8pP33xt3G8kvStvZ7wDijKzADQBqnrMfz0gG2HaGAYfvLafAu+1/uc8WMSRa8Pn9loBTva5v6byhnw1G0EPKlrxwKGZq0YxJir1oPVdLLtuDCSpOvVH1rbkgITu3RW/HhQ+HL+swy9jh82MlR36/OprM6o7LgNzIVMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780377120; c=relaxed/simple;
	bh=lFnvcRU42yXMraJGIudDdjyXnjtlHfxUGe4c5DG94h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPWx+k0IgQ924Lm6KBWkZHHgLxXwjaf+6vBOdo8Rc7GyFMEPwon5fuO7qan9bmBcJ5eosN5d+9kdF914mmDkhjCTLsLY7Too2Rml4CabeBF4OcQXdevrgaSBrgMb5lksmR8mLmblTZI4ZMyorqaD6F3dxHv25OQrxEejxTsW+aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=EuyAaD33; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="EuyAaD33"
Received: from francesco-nb (93-35-44-150.ip53.fastwebnet.it [93.35.44.150])
	by mail11.truemail.it (Postfix) with ESMTPA id 1B9531F995;
	Tue,  2 Jun 2026 07:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1780377117;
	bh=OqMWFZd9Lh6luW5CeI848QHyRFF7wsnQ7DaiCYPSL9Y=; h=From:To:Subject;
	b=EuyAaD33iam5wEgPz3B0xxsCuCn8h90PG0NaCsDppKjEHbv7BFaezyA039ledRFC9
	 MyIz2AagOJx82b1IT61YdAZxnjke7CB1L5JFzeSIiUVMwkHI+1S+fBLDPyap5zbZYy
	 kBxyhPWBeDcNijtGYDaVFtSee8RGrs1axpHZFZyXpZiLblOPaqXM+PeXwLgw7Jd7CE
	 /yvtMsZRlzIqz/FDe6YPSPX1SWMmnlQFj+kUcPVCQYViJt7OtfxtSerVjhfp5wYrVI
	 8vcuHjvUjUseC3KUFMfsdVE+7IL056HU1d3lo5sceRLuv5Mvw7giHI0p8/mrsN0Bjy
	 M16Xbf3o0QNGg==
Date: Tue, 2 Jun 2026 07:11:54 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: Franz Schnyder <fra.schnyder@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Franz Schnyder <franz.schnyder@toradex.com>,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Antoine Gouby <antoine.gouby@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: freescale: add Aquila iMX95 support
Message-ID: <20260602051154.GB4108@francesco-nb>
References: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
 <20260521-add-aquila-imx95-v4-2-5a7f86c824f5@toradex.com>
 <ah3hbkIEXaJnAtk2@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ah3hbkIEXaJnAtk2@lizhi-Precision-Tower-5810>

On Mon, Jun 01, 2026 at 03:45:50PM -0400, Frank Li wrote:
> On Thu, May 21, 2026 at 07:11:05PM +0200, Franz Schnyder wrote:
> > From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> >
> > Add support for the Toradex Aquila iMX95 and its development carrier
> > board.
> >
> > The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
> > up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
> > Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and
> > Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
> > lane DSI or CSI interface, one LVDS interface (one or two channels), and
> > some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0,
> > and a WiFi/BT module.
> >
> > Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
> > Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
> > Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Co-developed-by: Antoine Gouby <antoine.gouby@toradex.com>
> > Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
> > Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > Co-developed-by: Franz Schnyder <franz.schnyder@toradex.com>
> > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > ---
> ...
> > +
> > +	carrier_eeprom: eeprom@57 {
> > +		compatible = "st,24c02", "atmel,24c02";
> 
> st,24c02 is not documented.

Do not use checkpatch to check a DT file, you have the DT validator for
that.

st,24c02 is perfectly valid, check Documentation/devicetree/bindings/eeprom/at24.yaml

> > +
> > +	/* Aquila GPIO_08 */
> > +	pinctrl_gpio_8: gpio8grp {
> > +		fsl,pins = <IMX95_PAD_PDM_BIT_STREAM1__AONMIX_TOP_GPIO1_IO_BIT10	0x31e>; /* Aquila C24 */
> > +	};
> 
> Please fix checkpatch worning, it exceed 100 char.

It is wanted to improve read-ability. Can you keep it like that?

Please see Linus option on checkpatch,
https://lore.kernel.org/all/CAHk-=wiwpTUr8keTinnPU8kTN9dpYgDtwM4wONRF_j=1gvo3MQ@mail.gmail.com/

Francesco

