Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D126560A
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 17:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463451; cv=none; b=FUvGAcVoe2uf28ISW0m26ae/XKKVQQBjMeEeWTZDiEEddzbeJPb7mFPdttdquHtsfY5HhudP4+Ez1vlbPUJZzf6aG4gsNeWZKYkZa9Pa4VPHBoC2eNcybcNVRB449+iZ4G5B5UO3afbZhq1BeEcrRodtB7Hn2WX4sp1t2MqubNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463451; c=relaxed/simple;
	bh=HiHxgPNFAWSB/iS1Eg4H0inrzfOnWi/it/DJfDndziA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=c8wxIg0YmKVHE7b07BjHWkw0stSLFsKpFNU646qhWQyHniMjvYICec6N1Y6trZjtxd3UA6ZbSy/st/QWZIhxuiSg7YKStH7a/HVZhEwP6QcER+TMUNuRhir3UtZ7dfD3/bZEAQagTyKiIXYFVSHZwwT+bVU2FyKhweQhWTaceJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q9jTq4a6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q9jTq4a6"
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B5A1741;
	Tue, 14 Oct 2025 19:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760463348;
	bh=HiHxgPNFAWSB/iS1Eg4H0inrzfOnWi/it/DJfDndziA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=q9jTq4a6Wd81pLyp1VGc5fLh85ad6D3pNvVulfbdw6nNHMFfwQHZ+9YodjLIwb/tf
	 OFUJHqcDSVDA1RGICzlwOuLLW8Jd6hpeXuJzD5A1yLJzUAHXvb1WykyTG/aJt3UuBv
	 yDqmkZJeiY5Z5R4V1MVbHtD4AkP2IQSy9vXuIVUs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
References: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: freescale: debix-som-a-bmb-08: Enable HDMI output
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Shawn Guo <shawnguo2@yeah.net>, Marco Felsch <m.felsch@pengutronix.de>
To: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 14 Oct 2025 18:37:23 +0100
Message-ID: <176046344348.1246375.13335893574135284814@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi All,

Quoting Kieran Bingham (2025-09-16 15:47:09)
> Enable the HDMI output on the Debix SOM A board, using the HDMI encoder
> present in the i.MX8MP SoC.
>=20
> Enable and configure all nodes required for the HDMI port usage.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

One review tag at https://lore.kernel.org/all/20250925171744.5eyhqjlqp7skes=
qi@pengutronix.de/

Could anyone be able to review / collect / apply this one please?

--
Regards

Kieran


> ---
>=20
> This replicates 4880ee1c9046 ("arm64: dts: imx8mp-debix-model-a: Enable
> HDMI output") to support the Debix SOM as well.
>=20
>=20
>  .../freescale/imx8mp-debix-som-a-bmb-08.dts   | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts =
b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
> index d241db3743a9..04619a722906 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
> @@ -22,6 +22,18 @@ chosen {
>                 stdout-path =3D &uart2;
>         };
> =20
> +       hdmi-connector {
> +               compatible =3D "hdmi-connector";
> +               label =3D "hdmi";
> +               type =3D "a";
> +
> +               port {
> +                       hdmi_connector_in: endpoint {
> +                               remote-endpoint =3D <&hdmi_tx_out>;
> +                       };
> +               };
> +       };
> +
>         reg_baseboard_vdd3v3: regulator-baseboard-vdd3v3 {
>                 compatible =3D "regulator-fixed";
>                 regulator-min-microvolt =3D <3300000>;
> @@ -222,6 +234,28 @@ flash: flash@0 {
>         };
>  };
> =20
> +&hdmi_pvi {
> +       status =3D "okay";
> +};
> +
> +&hdmi_tx {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_hdmi>;
> +       status =3D "okay";
> +
> +       ports {
> +               port@1 {
> +                       hdmi_tx_out: endpoint {
> +                               remote-endpoint =3D <&hdmi_connector_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +&hdmi_tx_phy {
> +       status =3D "okay";
> +};
> +
>  &i2c4 {
>         expander0: gpio@20 {
>                 compatible =3D "nxp,pca9535";
> @@ -276,6 +310,10 @@ ethmac2: mac-address@c {
>         };
>  };
> =20
> +&lcdif3 {
> +       status =3D "okay";
> +};
> +
>  &snvs_pwrkey {
>         status =3D "okay";
>  };
> @@ -430,6 +468,15 @@ MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03      0x82
>                 >;
>         };
> =20
> +       pinctrl_hdmi: hdmigrp {
> +               fsl,pins =3D <
> +                       MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL     0=
x1c3
> +                       MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA     0=
x1c3
> +                       MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD         0=
x19
> +                       MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC         0=
x19
> +               >;
> +       };
> +
>         pinctrl_i2c1: i2c1grp {
>                 fsl,pins =3D <
>                         MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL                 0=
x400001c2
> --=20
> 2.50.1
>
