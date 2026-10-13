Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0C3E5EF8;
	Tue, 13 Oct 2026 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885865; cv=none; b=CNOKiiMLtn7koYR3MhxEPcZXLLIXeZqQmNE/orifAwTFt7LWCrRTbrxTq1Fum+LoQPcc7Bw2E4+zfKbenEh6pwGrONNoOs49QkO8wiRpTZyutt32k3WUEOjiJrwcSaKRQf3aZywW/V3BKdaoVEOUqT32UIJxmrlq9FTb2kF2SjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885865; c=relaxed/simple;
	bh=/NC730XZOMYDt4GVQ2K2vEbKuYoqsCk0p/VYYgZdjdk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aQEjtkaEV0b1Ew34je6QbwhxoW4yevspsjiveIWUQz+LNu3D3oVlv6PgvCu9JhVhBQVrAnnG925GSEiKtnHoaF94+wnZLJn1F+N8b2KpBcZ6zL0kBpyqlRDB/ZjxiCOTy84CwKJqS9MRuHAF2GoQHfqn7g1td4DZS+C6bC3u+jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+4W3WFF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+4W3WFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D041F000FF;
	Tue, 13 Oct 2026 10:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885863;
	bh=iHiVg+aZG4pM8+gIH8GNMP+tNeAg84piZsO/NMb4uJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P+4W3WFFhdhNaVqBfwaxiGj6lEUhJRSRE5mpa0ur2Cp9kVmO7dlPGFHKbTMPeXLyz
	 FhSfrSdm2aI3L4iCladiGLpbnlW7QbRtau4hWeK9BjUHrQ1hSvKtoMAm5UjqmCWTmo
	 iehJ4tKqkJ0Bplk0XcuwXPY14m2YGbemyFQqy4a6LsEAaB2YcvvnjHSoKSK0feZFsm
	 I1O0abSWa9bSUP4qhboVt7wofyeylu+auebdqBVJL7TD7BTAYyX/a5H4C92gzqoVEd
	 rT1rk+Rm6hNMQXkMqcuKyF1tY3XlblwXB4JEoXw5cr+pDNlC38qYU6rhB7f93xGifs
	 NmyqVzlzfW44w==
Message-ID: <sashiko-outbox-169447@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] arm64: dts: imx8mp-kontron: Remove obsolete
 VDD_CARRIER regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Schrempf" <frieder@fris.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v1-3-94f09ec520ef@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
 <20261013-upstreaming-gpio-label-fixes-v1-3-94f09ec520ef@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 10:04:22 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: Stale CARRIER_PWR_EN label in carrier board gpio-line-names ov=
errides
--

commit b5bf4333f3ce6c5ca93d4fd597b09395c78fe9b7
Author: Eberhard Stoll <eberhard.stoll@kontron.de>

arm64: dts: imx8mp-kontron: Remove obsolete VDD_CARRIER regulator

This commit removes the VDD_CARRIER regulator from the Kontron OSM-S i.MX8MP
SoM devicetree. It also renames the CARRIER_PWR_EN gpio line to GPIO_C_1, as
the signal is now controlled by hardware on regular revisions rather than
software.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> index 3459ee2c0eb64..4fd42e7170ee8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
[ ... ]
> @@ -185,7 +162,7 @@ &gpio4 {
>  			  "GPIO_B_3", "GPIO_B_4",
>  			  "GPIO_B_2", "GPIO_A_6", "CAN_A_TX", "UART_A_CTS",
>  			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
> -			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT=
";
> +			  "I2S_B_DATA_IN", "GPIO_C_1", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
>  };

[Severity: Low]
Is this rename incomplete? While "CARRIER_PWR_EN" is updated to "GPIO_C_1"
here in the SoM's &gpio4 node, the carrier boards provide their own
gpio-line-names overrides for &gpio4 which still hardcode the old name.

For the BL OSM-S carrier board:

arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts:&gpio4 {
    ...
    gpio-line-names =3D "CAN_B_RX", "CAN_B_TX", "CAN_A_RX", "CAN_A_TX",
                      ...
                      "TFT_STBY", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_L=
RCLK";
}

And similarly for the SMARC carrier board:

arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi:&gpio4 {
    ...
    gpio-line-names =3D "", "", "", "",
                      ...
                      "TEST", "CARRIER_PWR_EN", "I2S0_SDIN", "I2S0_LRCK";
}

Since the board-level overrides remain, the old label is still exported to
userspace on these boards. Does this defeat the purpose of the rename for
those devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-upstreamin=
g-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de?part=3D3
