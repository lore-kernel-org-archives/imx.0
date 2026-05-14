Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B928345CAE;
	Thu, 14 May 2026 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754905; cv=none; b=SYGT9oMUtfuq4KD5jGNUifKH+p9y3JxjQF2GzVrvLMzpp5zVuSLhj66OOuKw2moRnzFLeBYfOjL0XYPNHw7RY0kkLwtrO9qGNxgProSE0q3LlIruSU5WXGtPwdpKXApQx4KSZBWYQ0iYp3YZMOF7KF04Q5DutD3/WYn788zMwhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754905; c=relaxed/simple;
	bh=N51FGcAnN0YcUlbmh4q5CtwqZkb1liIO+xkIKae1ekQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=peD7j8L15ysskvRV2O1i3LsDiPr8haVM8ppKOCA2A0hfMPZ4wIdapNnxUrAx7zPnbVHee3oeBHg47hQHn7IF0dMdvDY6W1Wv7UanD3p42DyOVGrco7jF6gM4B0oWU5LWRA8YsT+3nrq95L6H29ZelDv7rtSdNDFzO/1d3xJjNos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsC70KuJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsC70KuJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F8FC2BCB3;
	Thu, 14 May 2026 10:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778754905;
	bh=N51FGcAnN0YcUlbmh4q5CtwqZkb1liIO+xkIKae1ekQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fsC70KuJHVHeQBxDal3BbIC98vnJUTuY6Mv/gGf/fpmIhQHmgDzFdk1iiimxgDQ0u
	 Kj67f0TNFliO9+ITb/yyxt1BeOTNJ0hfmFeuoJKaxmm01H1oJzHafTgtXw0YiH0uVY
	 3HYygbVcX/oNFr1h9Rd6jG6MQwPdknqMdOub4QOYIN2VQ95TWAL3DpB/DtxtSLdJyO
	 QvmHp/0jOcJLDS3zXqwmC3EEpYs/Ygqe3dmqIWK/3aEMjiD0Rc5VJh55/pHkn/zYPa
	 wZe0KLzu2iP4EmfSGiLgVjtTgbOIS3o2PFiYWxsMBDKmSwOM7ZZ2Jr5cAShaDSPEXM
	 C+9mM9qGKLeQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org
In-Reply-To: <20260513-imx8dxl-sr-som-v5-2-d0899b371c38@solid-run.com>
References: <20260513-imx8dxl-sr-som-v5-2-d0899b371c38@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:35:04 +0000
Message-Id: <20260514103504.A1F8FC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The Quectel cellular modem (`usb-device@1`) will never be powered =
on because its DT node is unhandled.
- [High] The `ethernet1` alias is explicitly assigned but then immediately =
deleted within the same node block, breaking MAC address assignment.
- [Medium] The `usdhc2` host controller is enabled and marked `non-removabl=
e` for omitted hardware.
--

commit a7ba7e5c27b439ec498400fe760e61ca8b0b035c
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: imx8dxl: Add SolidRun SoM and HummingBoard

Add support for the SolidRun i.MX8DXL System-on-Module (revision 2.1)
and its corresponding evaluation carrier board, the HummingBoard
Telematics (revision 2.0).

> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-hummingboard-telematic=
s.dts b/arch/arm64/boot/dts/freescale/imx8dxl-hummingboard-telematics.dts
> new file mode 100644
> index 0000000000000..5f42c4f2e3be9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-hummingboard-telematics.dts
> @@ -0,0 +1,536 @@
[ ... ]
> +	aliases {
> +		/* override ethernet aliases from imx8dxl.dtsi */
> +		ethernet0 =3D &eqos;
> +		ethernet1 =3D &switch_port1;
> +		ethernet2 =3D &switch_port2;
> +		ethernet3 =3D &switch_port3;
> +		ethernet4 =3D &switch_port4;
> +		ethernet5 =3D &switch_port5;
> +		ethernet6 =3D &switch_port6;
> +		ethernet7 =3D &switch_port7;
> +		ethernet8 =3D &switch_port8;
> +		ethernet9 =3D &switch_port9;
> +		ethernet10 =3D &switch_port10;
> +		/delete-property/ ethernet1;

Will deleting this alias break MAC address assignment?=20

Because the Device Tree Compiler evaluates properties sequentially within t=
he
same node block, this removes the ethernet1 alias from the final compiled
device tree.

Since bootloaders typically iterate over ethernet%d aliases starting from 0,
won't breaking the sequence cause the iteration to abort prematurely and
leave ports 2 through 10 without MAC addresses?

[ ... ]
> +/* cellular modem */
> +&usbotg2 {
[ ... ]
> +	usb-device@1 {
> +		compatible =3D "usb2c7c,125";
> +		reg =3D <1>;
> +		reset-gpios =3D <&lsio_gpio1 11 GPIO_ACTIVE_LOW>;
> +		vbus-supply =3D <&v_3_3>;
> +		vdd-supply =3D <&modem_vbat>;
> +	};
> +};

Will this Quectel cellular modem ever be powered on?=20

Since generic USB devices are dynamically enumerated by the host, the kernel
relies exclusively on the onboard_usb_dev platform driver to power them up
before enumeration.=20

Since usb2c7c,125 is not in the onboard_dev_match table and there is no
generic power sequence fallback in the USB core, won't this node be ignored?
This would leave modem_vbat disabled, the reset pin unhandled, and the modem
physically unpowered and invisible to the USB host.

> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8dxl-sr-som.dtsi
> new file mode 100644
> index 0000000000000..93a0eb4d7f770
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi
> @@ -0,0 +1,458 @@
[ ... ]
> +/* DSRC Radio */
> +&usdhc2 {
> +	bus-width =3D <4>;
> +	keep-power-in-suspend;
> +	max-frequency =3D <40000000>;
> +	non-removable;

Does this cause boot delays and MMC enumeration timeouts?

The commit message notes the V2X DSRC Radio peripheral device node is
intentionally omitted due to a lack of upstream bindings.

Because the controller expects a permanently attached card and is marked as
non-removable, won't the MMC core attempt to initialize it during boot and
fail since the peripheral power sequence and resets are not driven by any
node?

Should the host controller be marked with status =3D "disabled" until the
peripheral is actually supported and present in the DT?

> +	no-sd;
> +	pinctrl-0 =3D <&usdhc2_pins>, <&dsrc_pins>;
> +	pinctrl-names =3D "default";
> +	vmmc-supply =3D <&v_3_3>;
> +	vqmmc-supply =3D <&v_1_8>;
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-imx8dxl-sr=
-som-v5-0-d0899b371c38@solid-run.com?part=3D2
