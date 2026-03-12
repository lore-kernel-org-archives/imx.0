Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03A637FF72;
	Thu, 12 Mar 2026 12:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317674; cv=none; b=FONBelS8aUKhNUEVCxCTO8fEYI6qZMOq0d8udyy78QQ7ATvQTbRXmYlJLS/5XxmW5IXDy47skB3Y/bTFefwgfCfjxsWl85Wlu2eacGtJib7gAx8JUm6sPi1R1zwyGUKNcW50g9xECxxkJM10v3jgJxaCa6Wl3i/IT5tKhr/ikzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317674; c=relaxed/simple;
	bh=AZAzOiw2x0Xn9FEZumTOLECdygvrgQHiTvA2gBxfH7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ITdGYInlyfo/4pQf+GqLppzgPzsBShA4H6waoNQXrYuAvpL5oY06JK4Z/XsJ5SNFsdvIt7n39vgp3JDK1WawfVhQETvpDhvtzeQKBmOLU4AGXa5x9olwDeregZciQ4savt9azwJHuhN3DNyFo/rkJm6Q0qdeFo/AZOVfcGuewHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=HUPKqaLH; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HUPKqaLH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YaTiXfASNwVIt1/M88V+FYlCLr+hZHKmEU3TFW9Rezg=; b=HUPKqaLHjyyQM5RAMOU9m5rxAU
	ShwMOiurVz5iGA0dX/Iq4amg4gRLETRviiz2sahTkxq2fFGGzKokYq/XCjpTIhJ4nGDmghb5Y61da
	AgJTj62xIpzQFB6u58b91jzLr08Zovm/jwv9/aj8N4cJ9LeAzdcHlVxlk0rffUYJdvyIy0K3AhjqM
	7i43xH1jepzTYzcbC9oaAD4s2qsorXky08Io86A+dL1EenlfhSK4cEcxGWWVcE2T2jcdxyirBxEZT
	MQQeRHCoJTh19/D13IhCN+TDJcz3vEooa2mkJGMtluv+L64MuxFxX71Rte+r5ERzIm9K4iD6iRDCm
	uwpNynIw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0evp-0009dG-0G;
	Thu, 12 Mar 2026 13:14:25 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0evo-000CaN-1R;
	Thu, 12 Mar 2026 13:14:24 +0100
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
Subject: Re: [PATCH 03/12] ARM: dts: imx6qdl: Use undeprecated reset-gpios
Date: Thu, 12 Mar 2026 13:14:23 +0100
Message-ID: <3772306.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <20260311-dts-snps-reset-gpios-v1-3-ea1cc09fba84@oss.qualcomm.com>
References:
 <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
 <20260311-dts-snps-reset-gpios-v1-3-ea1cc09fba84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)

Am Mittwoch, 11. M=E4rz 2026, 17:07:59 CET schrieb Krzysztof Kozlowski:
> Freescale i.MX6 PCIe host controller bindings through referenced
> snps,dw-pcie-common.yaml schema already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
> add snps,dw-pcie.yaml") in 2021.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi        | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi  | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi     | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi          | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi         | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi   | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi  | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi      | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi           | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi  | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi    | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi  | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi           | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi        | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi       | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi       | 2 +-
>  30 files changed, 30 insertions(+), 30 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi b/arch/arm/bo=
ot/dts/nxp/imx/imx6qdl-apf6dev.dtsi
> index 9e97ef5e43f2..5e33164e5005 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi
> @@ -212,7 +212,7 @@ &ipu1_di0_disp0 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio6 2 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio6 2 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi b/arch/=
arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
> index 01d4ea20b13d..4faa7b9c50ff 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
> @@ -308,7 +308,7 @@ &gpmi {
>  };
> =20
>  &pcie {
> -	reset-gpio =3D <&gpio2 16 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio2 16 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi b/arch/arm=
/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
> index d7c2b30aecfd..1dc4732bd3fe 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
> @@ -270,7 +270,7 @@ &ipu1_di0_disp0 {
> =20
>  &pcie {
>  	pinctrl-0 =3D <&pinctrl_pcie &pinctrl_dhcom_j>;
> -	reset-gpio =3D <&gpio6 14 GPIO_ACTIVE_LOW>; /* GPIO J */
> +	reset-gpios =3D <&gpio6 14 GPIO_ACTIVE_LOW>; /* GPIO J */
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx6qdl-emcon.dtsi
> index 9f4e746beb2d..511b3b6dc5e3 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
> @@ -732,7 +732,7 @@ &ipu1_di0_disp0 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie_ctrl>;
> -	reset-gpio =3D <&gpio7 12 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio7 12 GPIO_ACTIVE_LOW>;
>  	disable-gpio =3D <&gpio2 22 GPIO_ACTIVE_LOW>;
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw51xx.dtsi
> index beff5a0f58ab..1d4899f8aec4 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
> @@ -400,7 +400,7 @@ &ipu1_csi0 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw52xx.dtsi
> index 9d3ba4083216..46e3b2b18aee 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
> @@ -504,7 +504,7 @@ timing0: timing-hsd100pxn1 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw53xx.dtsi
> index 7e84e0a52ef3..dd1201b628f5 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
> @@ -501,7 +501,7 @@ timing0: timing-hsd100pxn1 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw54xx.dtsi
> index 81394d47dd68..b8a1e47d1d3b 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
> @@ -547,7 +547,7 @@ timing0: timing-hsd100pxn1 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw551x.dtsi
> index 6136a95b9259..57b0d635bdab 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
> @@ -456,7 +456,7 @@ &ipu1_csi0 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw552x.dtsi
> index 9c822ca23130..b29c26b729fa 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi
> @@ -359,7 +359,7 @@ &i2c3 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw553x.dtsi
> index 552114a69f5b..198af79b5490 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
> @@ -413,7 +413,7 @@ &ipu1_csi0 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw560x.dtsi
> index e9d5bbb43145..4dafd225a34e 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
> @@ -560,7 +560,7 @@ timing0: timing-hsd100pxn1 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio4 31 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio4 31 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw5904.dtsi
> index 3df4d345da98..a03f422d9a8d 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
> @@ -528,7 +528,7 @@ timing0: timing-hsd100pxn1 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw5907.dtsi
> index 87fdc9e2a727..862f44967c71 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi
> @@ -326,7 +326,7 @@ channel@6 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw5910.dtsi
> index 099ed2f94d61..8564eb8e7cc0 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
> @@ -333,7 +333,7 @@ accel@19 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio3 20 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio3 20 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw5912.dtsi
> index cbca5e58e812..0a2a9b9db1fa 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi
> @@ -313,7 +313,7 @@ accel@19 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi b/arch/arm/boo=
t/dts/nxp/imx/imx6qdl-gw5913.dtsi
> index 4e4dce5adc15..37f7e15d65ae 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi
> @@ -292,7 +292,7 @@ &i2c3 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
> index 6b737360a532..4755bf2bc65e 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
> @@ -321,7 +321,7 @@ MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30 0x1b0b0
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_hummingboard_pcie_reset>;
> -	reset-gpio =3D <&gpio3 4 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio3 4 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi b/arch/=
arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
> index 3069e1738ba2..d113130c1770 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
> @@ -517,7 +517,7 @@ MX6QDL_PAD_EIM_D24__UART3_RX_DATA	0x40013000
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_hummingboard2_pcie_reset>;
> -	reset-gpio =3D <&gpio2 11 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio2 11 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi b/arch/arm/=
boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
> index dff184a119f3..396b621487ce 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
> @@ -220,7 +220,7 @@ sgtl5000: codec@a {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio3 29 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio3 29 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi b/arch=
/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
> index c771f87b10df..bdc8dc6731e0 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
> @@ -743,7 +743,7 @@ &mipi_csi {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio3 13 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio3 13 GPIO_ACTIVE_LOW>;
>  };
> =20
>  /* LCD_BKLT_PWM */
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi b/arch/arm/boot/=
dts/nxp/imx/imx6qdl-mba6.dtsi
> index ee2c6bec92e8..a492bf4f49d9 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
> @@ -240,7 +240,7 @@ &i2c2 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio6 7 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio6 7 GPIO_ACTIVE_LOW>;
>  	vpcie-supply =3D <&reg_pcie>;
>  	status =3D "okay";
>  };
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi b/arch/=
arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
> index ef0c26688446..bbdb77e6fec8 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
> @@ -731,7 +731,7 @@ lvds1_out: endpoint {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio6 31 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio6 31 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi b/arch=
/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
> index 03fe053880ca..25e6cc3e9ff5 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
> @@ -639,7 +639,7 @@ lvds1_out: endpoint {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio3 0 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/ar=
m/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
> index a3c2811e9c6f..661f96fa3990 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
> @@ -218,7 +218,7 @@ lvds0_out: endpoint {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio2 25 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio2 25 GPIO_ACTIVE_LOW>;
>  	vpcie-supply =3D <&reg_pcie>;
>  	status =3D "disabled";
>  };
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/=
arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> index 6f3becd33a5b..33ebb9320395 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> @@ -399,7 +399,7 @@ MX6QDL_PAD_DISP0_DAT19__AUD5_RXD	0x130b0
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio4 17 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio4 17 GPIO_ACTIVE_LOW>;
>  	status =3D "disabled";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/=
dts/nxp/imx/imx6qdl-pico.dtsi
> index c39a9ebdaba1..f18652b2f6ca 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> @@ -277,7 +277,7 @@ mipi_csi2_in: endpoint {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie_reset>;
> -	reset-gpio =3D <&gpio5 21 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio5 21 GPIO_ACTIVE_LOW>;
>  };
> =20
>  &pwm1 {
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/bo=
ot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> index ba29720e3f72..5d379b98d74f 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> @@ -754,7 +754,7 @@ lvds0_out: endpoint {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio7 12 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio7 12 GPIO_ACTIVE_LOW>;
>  	vpcie-supply =3D <&reg_pcie>;
>  	status =3D "okay";
>  };
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi b/arch/arm/b=
oot/dts/nxp/imx/imx6qdl-var-dart.dtsi
> index 7749074e438d..13d092cb9961 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
> @@ -394,7 +394,7 @@ MX6QDL_PAD_SD3_DAT3__SD3_DATA3	0x17059
>  &pcie {
>  	fsl,tx-swing-full =3D <103>;
>  	fsl,tx-swing-low =3D <103>;
> -	reset-gpio =3D <&gpio4 11 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio4 11 GPIO_ACTIVE_LOW>;
>  	status =3D "disabled";
>  };
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi b/arch/arm/b=
oot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
> index 9ff183e4e069..1860e5a525ee 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
> @@ -651,7 +651,7 @@ &ipu1_di0_disp0 {
>  &pcie {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_pcie>;
> -	reset-gpio =3D <&gpio7 12 GPIO_ACTIVE_LOW>;
> +	reset-gpios =3D <&gpio7 12 GPIO_ACTIVE_LOW>;
>  	status =3D "okay";
> =20
>  	host@0 {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


