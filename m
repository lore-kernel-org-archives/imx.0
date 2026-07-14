Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6686427FB9;
	Tue, 14 Jul 2026 20:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060224; cv=none; b=KcM81e993Gtqa9MaEuJa1vRIZVK/x73ifPFmWYJtbLVtL8vTN3yEE9ZZSNzzR+fQrpneYeWUnvdzSgbLS8xkup3suhL58oAGBjIzgXvhNLO8VgYt6DMgbC2MxxZCxPQnMhPAghCNe8dB3CaNqrfcIpENoghwRSw2/EBjMvcNzVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060224; c=relaxed/simple;
	bh=001q9FtT+9kHpJQbsppljQNjwgh2ywXhsHAdWpMECKc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MIIxZuYx6g/vA1pzbCewZyO05AqCKiN0zjMLEiIUlsPXG1NvUU7SqaoBuC7XjRw1MOsipev+kGUZgFdl8Nwn/x0SDrdkdVa5rs3GG9kgUk234PUfZiHyajtfctEwsGmM8Oys1VBv0jRmGXeE9hEerohGblx5FDGbIBFwxfmVrIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISaxym0/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISaxym0/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDC51F000E9;
	Tue, 14 Jul 2026 20:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784060223;
	bh=8ud0eZN9paJBGQJD49RcaobEENGrf/LV2uz6TjLE71o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ISaxym0/ARm1K2I8OKDM2c/4Dd7W6LVPyvv1T4fJdLg0fXLq7omA5+YrQUp0zlbtp
	 7ULG/+dkiWR6zMPh+kH0MkHOLry1akNOCb7anu+GXyQFK5cSFAiAAFP2KManHdHm22
	 hg8AlmnctyJlPALzH3htj/uhfwRa3tJbioQ8aw5RyGI/4kDJKQaP2MyW5NMk1RHobL
	 rQMCcRZLRxcn2kQqwi6p8gz9lfys4ZcJcJteI4/AA2AFgDUaH/oPqePIAO6KTjf7eo
	 rF4guJwVIWHm4ukVg1QIEOMJUxF7HKxMtvp82ZzoFLE/qJnlqxIYAeEDHXY0d+Dld3
	 kddjaXuxv16/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX8 QuadMax
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <f373059af209ed7ce8e63988066e730736e06e6e.1784059139.git.stefano.r@variscite.com>
References: <cover.1784059139.git.stefano.r@variscite.com>
 <f373059af209ed7ce8e63988066e730736e06e6e.1784059139.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:17:02 +0000
Message-Id: <20260714201703.3BDC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The PMIC thermal zone's cooling map omits the high-power Cortex-A7=
2 cores, severely limiting thermal mitigation.
- [Medium] WiFi and Bluetooth enable/reset GPIOs are configured in pinctrl =
but never bound to a driver, breaking power management and suspend/resume.
--

--- Patch [2]: [PATCH v2 2/3] arm64: dts: freescale: Add support for Varisc=
ite VAR-SOM-MX8 QuadMax ---
commit 33df8d987b7061b5d0c8453d1a7834088b34ace9
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax

Add device tree support for the Variscite VAR-SOM-MX8 QuadMax system on
module. This SOM includes an i.MX8 QuadMax processor, RAM, eMMC, Ethernet,
audio codec, and WiFi/Bluetooth.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quad=
plus/var-som-mx8/

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-var-som.dtsi
> new file mode 100644
> index 0000000000000..e805c51eb27df
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
[ ... ]
> +/* Bluetooth */
> +&lpuart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_lpuart1>;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +};

[Severity: Medium]
Since this UART is used for Bluetooth, should it have a serdev child node
(like compatible =3D "brcm,bcm4329-bt") with an 'enable-gpios' property?

Without an explicit driver binding to manage the module, the Bluetooth
device's power state cannot be controlled across suspend and resume.

[ ... ]
> +&thermal_zones {
> +	pmic-thermal {
> +		polling-delay-passive =3D <250>;
> +		polling-delay =3D <2000>;
> +		thermal-sensors =3D <&tsens IMX_SC_R_PMIC_0>;
> +		trips {
> +			pmic_alert0: trip0 {
> +				temperature =3D <110000>;
> +				hysteresis =3D <2000>;
> +				type =3D "passive";
> +			};
> +			pmic_crit0: trip1 {
> +				temperature =3D <125000>;
> +				hysteresis =3D <2000>;
> +				type =3D "critical";
> +			};
> +		};
> +		cooling-maps {
> +			map0 {
> +				trip =3D <&pmic_alert0>;
> +				cooling-device =3D <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};

[Severity: High]
Is it intentional to omit the Cortex-A72 cores (<&A72_0> and <&A72_1>) from
this cooling map?

By only throttling the A53 cores during an overheat scenario, the system mi=
ght
fail to cool the PMIC sufficiently. This increases the risk of reaching the
125=C2=B0C threshold and triggering a hardware thermal shutdown.

> +		};
> +	};
> +};
[ ... ]
> +/* WIFI */
> +&usdhc3 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc3>, <&pinctrl_wifi>;
> +	pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>, <&pinctrl_wifi>;
> +	pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>, <&pinctrl_wifi>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	brcmf: wifi@1 {
> +		compatible =3D "brcm,bcm4329-fmac";
> +		reg =3D <1>;
> +	};
> +};

[ ... ]
> +	pinctrl_wifi: wifigrp {
> +		fsl,pins =3D <
> +			IMX8QM_SCU_GPIO0_07_SCU_DSC_RTC_CLOCK_OUTPUT_32K	0xc600004c
> +			IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x06000021
> +			IMX8QM_SCU_GPIO0_02_LSIO_GPIO0_IO30			0x00000021
> +			IMX8QM_QSPI1A_DATA0_LSIO_GPIO4_IO26			0x00000021
> +		>;
> +	};
> +};

[Severity: Medium]
Are these WiFi enable/reset GPIOs left uncontrolled without an active driver
binding?

While pinctrl_wifi is attached to usdhc3, there is no mmc-pwrseq node
consuming these GPIOs to control the power and reset sequencing. Relying on
the bootloader for initialization prevents the kernel from managing the pow=
er
state during suspend and resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784059139.gi=
t.stefano.r@variscite.com?part=3D2
