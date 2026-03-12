Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7B033C532;
	Thu, 12 Mar 2026 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317695; cv=none; b=uuEa6cBq/4u9rS0NYO0JNfhv+LwmzCE/eLriuLmJESsgB9S5XEw38iOxhSG5AauhscrloYuK4pRi8axjeyi/WyPY8/qdGPZ2dl4602MA5bSHwe3YIh+2sCBf62M3V+6CDAseIUmNU3xmJOQl7rlUXLBxWCT1x1tfossGtWwj0hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317695; c=relaxed/simple;
	bh=9IKT5uANgU05se7u2Oa3coBgeVwZCLJIqZ6Fvok/ie8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wh//l0SYMKWAi8xKTeFqO8iscmtjTWpdT8F90oHluH1pjvy09LHbwVEMLBmVyqL1gfb6KW2I4tZEW0Srvz9yjL1bPjPkYqJXXotGkSU2LDzYVcfKhmlFjMgoxU1aP1KyhfFqiQr2wHYJc9MnRFmupBWWn1sfi98joE/+HTrEw4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MwkBwEKJ; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MwkBwEKJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=I1IXt+dIUnvl8ZLP4xRh3dMYxckfctcwte+Py2wZ3iQ=; b=MwkBwEKJX406TbFR89kTekha7n
	8e5QWlw5zVBXkzi5ddZuZQsrByqBg/K5CpF/rAWIMv2rKSbBkt2/QGb5sRs2lBvqfPQzKqFDele7X
	RJssPmH6dpFCBiIpWd6eMFTPLBqvfzrAAhaWhsnbRVES0b1ePu+2hjS6MUOc9mRnrmbAYhYDlS76G
	WGmtKv1qQ7+CzQw1FT6lqcuIV5QS8hFBG0kNd2bSWCQWUJ+pMEebqXcSsge7Jdf1bY2J4/KJLwaxV
	8KfR/kfX7MT3rzhinq/V1HmWl2EyEdyosDn0K0Eux5Uwhda6d3YcnxM+MRjjSdWWECX04tI02Fjm5
	JrE1z38w==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0ewC-0009i3-2k;
	Thu, 12 Mar 2026 13:14:48 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0ewC-000FKY-0r;
	Thu, 12 Mar 2026 13:14:48 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux@ew.tq-group.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 07/12] arm64: dts: imx8: Use undeprecated reset-gpios
Date: Thu, 12 Mar 2026 13:14:47 +0100
Message-ID: <4916204.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <20260311-dts-snps-reset-gpios-v1-7-ea1cc09fba84@oss.qualcomm.com>
References:
 <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-7-ea1cc09fba84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)

Am Mittwoch, 11. M=E4rz 2026, 17:08:03 CET schrieb Krzysztof Kozlowski:
> Freescale i.MX6 PCIe host controller bindings through referenced
> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 4 ++--
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts       | 4 ++--
>  arch/arm64/boot/dts/freescale/tqma8xxs.dtsi         | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
> index 6fc82b5eb58c..6d8a57ff56c2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
> @@ -806,7 +806,7 @@ &pciea {
>  	pinctrl-0 =3D <&pinctrl_reset_moci>;
>  	phys =3D <&hsio_phy 0 PHY_TYPE_PCIE 0>;
>  	phy-names =3D "pcie-phy";
> -	reset-gpio =3D <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
>  	vpcie-supply =3D <&reg_pcie_switch>;
>  };
> =20
> @@ -816,7 +816,7 @@ &pcieb {
>  	pinctrl-0 =3D <&pinctrl_pcieb>, <&pinctrl_wifi>;
>  	phys =3D <&hsio_phy 1 PHY_TYPE_PCIE 1>;
>  	phy-names =3D "pcie-phy";
> -	reset-gpio =3D <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/b=
oot/dts/freescale/imx8dxl-evk.dts
> index 5c68d33e19f2..bdd1dbc6b322 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> @@ -651,7 +651,7 @@ &pcie0 {
>  	phy-names =3D "pcie-phy";
>  	pinctrl-0 =3D <&pinctrl_pcieb>;
>  	pinctrl-names =3D "default";
> -	reset-gpio =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
>  	vpcie-supply =3D <&reg_pcieb>;
>  	vpcie3v3aux-supply =3D <&reg_pcieb>;
>  	status =3D "okay";
> @@ -662,7 +662,7 @@ &pcie0_ep {
>  	phy-names =3D "pcie-phy";
>  	pinctrl-0 =3D <&pinctrl_pcieb>;
>  	pinctrl-names =3D "default";
> -	reset-gpio =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
>  	vpcie-supply =3D <&reg_pcieb>;
>  	status =3D "disabled";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boo=
t/dts/freescale/tqma8xxs.dtsi
> index bfc918f18d01..677a05b38391 100644
> --- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
> +++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
> @@ -407,7 +407,7 @@ &pcieb {
>  	phy-names =3D "pcie-phy";
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcieb>;
> -	reset-gpio =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
>  };
> =20
>  &sai1 {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


