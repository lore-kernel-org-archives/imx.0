Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24FD487B5
	for <imx@lists.linux.dev>; Tue, 26 Mar 2024 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711447303; cv=none; b=FTrn3AHVciCTdC3Ls9cI19toKgf37qluWFeYF2zNaqVFFXeLW+NIWYDgWfYYM86G8G1dalZ6rim4+D4vgt4v5/XldYBlzfWAegtiTISnNtZXWTtyS6N/uslTleKeM3WkqiV9Z2/tVjHdE8HB+koB/2Zi7qNPxOMx5sruysJfBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711447303; c=relaxed/simple;
	bh=wC+CkfzRIQpYUdEINEFhAazEnmsffM+ulB1Y5urq2Vs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Q/W8Cm++iOmCB6OW6sLnwDsP7plHTQ6xhapTPutBxudVhKy9UTJzeInRyuJI2U6ej/P+z9rfdqv65g55A9yZqsWSNHUKNZ+QBUHM0Jp5JRVUUCHWYwLRIY9EGb8OCSGWtHbw16HBoTLhQEBtkg1RsgYAHq/Y1c8roMVfNf1j56s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c8BR28o1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c8BR28o1"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3180E497;
	Tue, 26 Mar 2024 11:01:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711447268;
	bh=wC+CkfzRIQpYUdEINEFhAazEnmsffM+ulB1Y5urq2Vs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=c8BR28o1ptckZ2kGJ7GqDBLmoqwY2xX8WC+PtvFAA2BmpJ4HlnVUl+NN+NUuFoPEV
	 YHfVEbOaSXJwmS7UFwJK5XgHAGMJOuzFYGg9AlSHPd2tcUJ+w0J3uUD7VIt8EIcWqQ
	 Uo0rSbShLVSbXnQqLDs7rbLYdaFzsQT6RZyxQbCc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240325225048.1159-1-laurent.pinchart@ideasonboard.com>
References: <20240325225048.1159-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: debix-a: Remove i2c2 from base .dts
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Tue, 26 Mar 2024 10:01:36 +0000
Message-ID: <171144729683.3566204.12672101779935759480@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Laurent Pinchart (2024-03-25 22:50:48)
> From: Jacopo Mondi <jacopo@jmondi.org>
>=20
> The I2C2 bus is used for the CSI and DSI connectors only, no devices are
> connected to it on neither the Debix Model A nor its IO board. Remove
> the bus from the board's .dts and rely on display panel or camera sensor
> overlsy to enable it when necessary.

s/overlsy/overlays/


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../boot/dts/freescale/imx8mp-debix-model-a.dts    | 14 --------------
>  1 file changed, 14 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arc=
h/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> index 5ac77eaf23d5..26c303b7c7fa 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> @@ -210,13 +210,6 @@ ldo5: LDO5 {
>         };
>  };
> =20
> -&i2c2 {
> -       clock-frequency =3D <100000>;
> -       pinctrl-names =3D "default";
> -       pinctrl-0 =3D <&pinctrl_i2c2>;
> -       status =3D "okay";
> -};
> -
>  &i2c3 {
>         clock-frequency =3D <400000>;
>         pinctrl-names =3D "default";
> @@ -392,13 +385,6 @@ MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA                     =
               0x400001c2
>                 >;
>         };
> =20
> -       pinctrl_i2c2: i2c2grp {
> -               fsl,pins =3D <
> -                       MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL                  =
               0x400001c2
> -                       MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA                  =
               0x400001c2
> -               >;
> -       };
> -
>         pinctrl_i2c3: i2c3grp {
>                 fsl,pins =3D <
>                         MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                  =
               0x400001c2
> --=20
> Regards,
>=20
> Laurent Pinchart
>
