Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0E3CEB8F
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438059; cv=none; b=BbEAu4kd2QULN6Uw8cC8PFczv/Kk3S9b4Cqv2LQYyLKmQInWmNMMRtr+/bUdpw/7bpRrC7+umEiV8O9qgxD+1JSJZOwMSfgoN7SLEivsWWyqJNd7P9TLDyUV1xIRVYT1+O62VkBH9FKAVYgubq2HO64aUjg9AZuTYukuj+3Byqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438059; c=relaxed/simple;
	bh=l8k94qCXX4up4bjhSDfUE0TCZEECdzAKty2f0bEPp8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vnl6HbNncpihpny+YtDQVNHkuPIjE22HNdzB6n//UslH5LyP9J1LzPW/Xq8UivH9EIcFqI2i8/8Z7hDh0tbdl2iBs0gYBpWtdfSGMKm2BP9CLbdRwXJ6gEMevHLt60KBKECaO1ytMdJgA6iCgHSnPNUPV512EM8HYpGR8k2yuZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Lve7YK+w; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Lve7YK+w"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 802C81FD07;
	Wed, 25 Mar 2026 12:27:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774438049;
	bh=S2YQAGejwfR5ZlCcWyHUSZO12iuE4GgPthnFZ7lNm/A=; h=From:To:Subject;
	b=Lve7YK+wnl2mE3II7S1FEj7bjiLJ4Anor5/kTXKOzbDteEX6YJLbLp5sEpKgWs+HP
	 gnyqs4S3EqlSWVpUJcArFe5vDEH/5XWbhZs0AG7SdvZQBWwcAGYE4MbSA9rX+A4fEt
	 QNlw7RrLFYOmOkY+Nvx21bJMBhzkQWDgbiKMQ9gdkSpM/K9hLZl/ZJidD/H2FuUgFO
	 Rh2a1ul4NWs/P9Od/YJtMYi0O+mYJiNVsJNUqYN7T94SwQO1n6bjGu7cTY27EAsjTg
	 ixYp+Dyubh61gmf4Br4fuY2aQYRtLzjsE4nLkLTQCSLYGVJL0ilLkPuqEpYI+qUHSh
	 79tkNmj1ic8kw==
Date: Wed, 25 Mar 2026 12:27:24 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/6] arm64: dts: freescale: Add Verdin iMX95 support
Message-ID: <20260325112724.GA7964@francesco-nb>
References: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
 <20260313-verdin-imx95-upstream-frank-li-base-v2-2-bd488be7c699@toradex.com>
 <acK4awcokUyCHrG5@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acK4awcokUyCHrG5@lizhi-Precision-Tower-5810>

On Tue, Mar 24, 2026 at 12:14:35PM -0400, Frank Li wrote:
> On Fri, Mar 13, 2026 at 09:57:43AM +0100, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > Add support for the Toradex Verdin iMX95 and its development carrier
> > board.
> >
> > The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR4x RAM,
> > up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
> > Ethernet PHY, an I2C EEPROM and Temperature Sensor, an RX8130 RTC, an
> > I3C bus, one Quad lane CSI interface, one Quad lane DSI or CSI
> > interface, one LVDS interface (one or two channels), and some optional
> > addons: TPM 2.0, and a WiFi/BT module.
> >
> > Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> > Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> > v2: Reordered nodes alphanumerically by node name
> > v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-2-823fad02def9@toradex.com/
> > ---
> > +
> > +/* Verdin UART_1, connector X50 through RS485 transceiver */
> > +&lpuart7 {
> > +	rs485-rts-active-low;
> > +	rs485-rx-during-tx;
> > +	linux,rs485-enabled-at-boot-time;
> > +
> 
> Nit: needn't empty line between status and other property, suggest run
> https://github.com/lznuaa/dt-format to speed up process.

Please review Documentation/devicetree/bindings/dts-coding-style.rst.

Quoting from there
 > "status" (if applicable), preceded by a blank line if there is content before the property

I would be careful on taking every detail of such a style guide literally,
but your comment here is not correct and it's not helping anyone.

Francesco

