Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595559;
	b=WPdgnQ1o++vJdwI92b6Hod4QebjIbGMcld8o5wd8RfSA9jSn9wFnDVrcSeKvQ8S4yd/m
	 QzmK6F+voo0dw7j4UUh+KPa+z7IWrLHgqV0ZJ1EKIZMfGWg+H4jqRedy+xbXcWfC8U6kY
	 cBs15OaCZEJyT69UYcwIejzVyWXRdFiIy3bWoTRSXnCW83b3j2Nh3XLGW5WJTuCG8dz30
	 60ln1NfSKlI1AwphUsHWUQPtKs151fLx26IQto1tNKDm9LPlCdrvyvHynTySDxA7B3ICg
	 Ycczd3k+ME/r3U21Ij88364gjNqhKtu2cgW50bSjwRZD3YD+7/77iWKUPL9oaTOXWBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595559;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6b0NRppQoIv/gP4EMBgo/e8en9U7x6Fh8pRvjfiuGvI=;
	b=yGfGMMuQpQFxQvLXZi1T552j1k9unb7fkByaNpD+ajOMlg/U8J1cJwVmsghncZfrtEUT
	 mmsPs+bcHyNZjJOE6c4Xz15iKieaEvv/lrjhsuFZBcJGLGTVvYGei76Ig+cJS8VcxjZph
	 w8rLUAW7yobiKousK48W+j+2gLEi3YU3Wvtqj/oM/uth8aMiMgNHwiLRAxfcohAxKxGG7
	 NFzxIA3xbtdIeHOUf4UfRBd00fWBNF4WWeCKxMEsC+pdXvvgmlgss4zyoW/1K1eWGnUGU
	 bWVdZVjDwokMyesR9V+BKTipQrh0gFJHpKREhf+STGscqa4py+JCJcfLEjUV091fQ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HyKj33mm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC7606A323;
	Wed, 25 Nov 2026 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HyKj33mm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CA51F000EB;
	Wed, 25 Nov 2026 08:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595558;
	bh=6b0NRppQoIv/gP4EMBgo/e8en9U7x6Fh8pRvjfiuGvI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HyKj33mmJWDJcEP0uwzFLiRrdoq+hjgI8/hxRI+h8H5si8kArzlyTKjp7Saiol4yP
	 7JXD3GNkhKKkNRmnSgUgIpcz1ESsiNGffbrJkz2k9dmxViOrg0Bw9fun/qXiVBGufx
	 g5Se1ruW80rgygCbropvX9mwihloeQNy1o6fN3t1hEl9aQWPMtzgjhH/8zMXhBNZSd
	 7KRNUpExuIqH7evdF/pED8T2tsvGCSzYxgWDzM7fdQwU0KDJU7OGJT+lgFLk4hHA0Q
	 uiNjESFk849lp17HCpkhtDWn+MiYWkJG7rwp2GLaTUHbaeDxTvXTVOZGd2n0MtgLOK
	 CvODOcR0nunDQ==
Message-ID: <sashiko-outbox-232908@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinesh kumar v" <dineshkumarv85@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261125082222.136238-4-dineshkumarv85@gmail.com>
References: <20261125082222.136238-1-dineshkumarv85@gmail.com>
 <20261125082222.136238-4-dineshkumarv85@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 08:32:37 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: imx95-lec: non-standard and inverted usb0 and usb1
  aliases
--

commit 30ac215ca7d5d81b59baad65006b81ae04ed8102
Author: Dinesh kumar v <dineshkumarv85@gmail.com>

arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

This commit adds devicetree support for the ADLINK LEC-iMX95 module and
the I-Pi SMARC Plus carrier board.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-lec.dtsi b/arch/arm64/bo=
ot/dts/freescale/imx95-lec.dtsi
> new file mode 100644
> index 0000000000000..079639b8736b1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-lec.dtsi
> @@ -0,0 +1,631 @@

[ ... ]

> +/ {
> +	aliases {
> +		ethernet0 =3D &enetc_port0;
> +		ethernet1 =3D &enetc_port1;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		gpio3 =3D &gpio4;
> +		gpio4 =3D &gpio5;
> +		i2c1 =3D &lpi2c2;
> +		i2c2 =3D &lpi2c3;
> +		i2c7 =3D &lpi2c8;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
> +		rtc0 =3D &rtc_i2c;
> +		rtc1 =3D &scmi_bbm;
> +		serial0 =3D &lpuart1;
> +		serial1 =3D &lpuart2;
> +		serial2 =3D &lpuart5;
> +		serial3 =3D &lpuart7;
> +		spi0 =3D &lpspi6;
> +		usb0 =3D &usb3_dwc3;
> +		usb1 =3D &usb2;
> +	};

[Severity: Low]
Should the usb0 and usb1 entries in /aliases be dropped?

Custom non-subsystem aliases are not allowed in devicetree sources, and
the usb subsystem does not define usbN aliases.  In addition, the board
comments in imx95-lec-ipi-smarc.dts label &usb2 as the first carrier port
and &usb3_dwc3 as the second, so usb0 and usb1 are inverted relative to
the hardware port numbering.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125082222.1362=
38-1-dineshkumarv85@gmail.com?part=3D3
