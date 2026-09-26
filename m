Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8876B4252D5;
	Sat, 26 Sep 2026 14:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432015; cv=none; b=n8Ibe4kkUXGK7kDslcIsKHOBizAGDZUl55p284crfzgjMGuX8ArjNqp+gEYxT+14Yyh5tkMAek8G8uIRjvTcrhhvMBEv+pwQPe2bKk5sf4zDIqYGk5dJDlRWSmTm2WGOC1+27w9yfDmyypR7yrO6NqxmddAP5Ce85PzORZ9FNWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432015; c=relaxed/simple;
	bh=cWpSC1bYdy2IZFzXrLFf9z8njgNqfso69NQzpTJOzo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LP8j5R9srI3HL0STkEnJXq5BFreXnMLbJ8OhRVkwuzTWJHIVUn/nWZMVWqKquMuMDxuSzV2oxgR++naUKdCE0dn8IK2DRBiI0Y015VSeuv6uaDXddgxiH+DwGNdW8C1HdeS0b+23hM8hQe7UiDDPguA1rojq1iaUg9Tlj0dMitg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqCx0Q+A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqCx0Q+A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF93B1F000FF;
	Sat, 26 Sep 2026 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432014;
	bh=j2jTuU/A2SWgToaDtg1QtQoIMliEjRv+yJ2QBn3Ihhs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EqCx0Q+A+NvAGjENHz5NjiFOTuSy6Y/456BDi/xojZQLMRS/muv1kXpoB3TP14/ri
	 IFOwP6Ui+WYeIJYwYNaqapGy88W+fquJmUO2cciJtZ75lZGJ3XmV6lvbGiIhCar09W
	 TT3AEFqOspwH7zzpay+M1slUbUbTZmEj+ZrucREhRVQbFVsFRv0UH6G5lZTNzrFP2N
	 rcr5coGWflsd4whBw/6AZ8m7NYdZHF1n4HrWgcy2Aj33Kt2FVEppXWAtOeeAHMmH5e
	 Ia/gpgZq6I92vyrYg1zkdepwz/e9SE6qaLQJMKUE84dQevW69fQRqKrSPpmw+vr1p9
	 sbOL3X4bhE7Bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 05/11] ARM: dts: imx6ul: Add Variscite storage and
 wireless files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <778be59a32afc9054147fc40143b502d49d37ffb.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <778be59a32afc9054147fc40143b502d49d37ffb.1790344389.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 14:13:33 +0000
Message-Id: <20260926141333.DF93B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dts: BRCM Wi-Fi fails to enumerate due to missing non-removable pr=
operty
- [High] dts: IW61X Wi-Fi power enable pin lacks pinctrl configuration
- [Low] dts: unnecessary address and size cells in IW61X usdhc node
--

commit 7bf945c5fafb3aee26ff8892a479bb36b844b74e
Author: Stefano Radaelli <stefano.r@variscite.com>
ARM: dts: imx6ul: Add Variscite storage and wireless files

This patch adds reusable DTSI files for eMMC, NAND, Broadcom Wi-Fi, and
NXP IW61x options on VAR-SOM-6UL and DART-6UL modules. Keeping the module
options independent of the carrier board allows each board DTS to select
its assembled storage and wireless devices.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-iw61x=
.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi
> new file mode 100644
> index 0000000000000..4d47cea982ec4
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi
[ ... ]
> +	iw61x_pwrseq: mmc-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		post-power-on-delay-ms =3D <100>;
> +		power-off-delay-us =3D <10000>;
> +		reset-gpios =3D <&gpio5 6 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
> +			      <&gpio5 2 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
> +	};

[Severity: High]
This references &gpio5 2 as the power enable pin (WIFI_PWR_EN), but is the
corresponding pinmux configuration missing from the pinctrl_wifi group?

Since pinctrl_wifi (defined in imx6ul-var-som.dtsi and imx6ul-var-dart.dtsi)
only configures GPIO5_IO04 and GPIO5_IO06, GPIO5_IO02 appears to be omitted
from the pinmux configuration.

Will this leave the pad in its default hardware reset state, preventing the
GPIO from toggling the Wi-Fi power enable line and leaving the module power=
ed
off?

[ ... ]
> +&usdhc1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;

[Severity: Low]
Are these address and size cells necessary here?

Unlike the BRCM equivalent which defines a child wifi node, there are no ch=
ild
nodes under this SDIO controller in the IW61X implementation. Defining addr=
ess
and size cells without any children will trigger avoid_unnecessary_addr_size
devicetree warnings when compiled with dtc.

> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_wifi>;
[ ... ]
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.d=
tsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi
> new file mode 100644
> index 0000000000000..d7952233a1ee9
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi
[ ... ]
> +&usdhc1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_32k_clk>, <&pinctrl_wifi>;
> +	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>, <&pinctrl_w=
ifi>;
> +	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>, <&pinctrl_w=
ifi>;
> +	keep-power-in-suspend;
> +	vmmc-supply =3D <&reg_sd1_vmmc>;
> +	status =3D "okay";

[Severity: High]
Does this node need the non-removable property to properly enumerate the
Broadcom Wi-Fi module?

Since the module is permanently soldered onto the SOM and does not have a
physical card detect mechanism, omitting non-removable causes the kernel
MMC core to wait indefinitely for a card detect interrupt. Consequently,
the SDIO bus probe might never complete and the Wi-Fi hardware could remain
unusable.

> +
> +	brcmf: wifi@1 {
> +		compatible =3D "brcm,bcm4329-fmac";
> +		reg =3D <1>;
> +	};
> +};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790344389.gi=
t.stefano.r@variscite.com?part=3D5
