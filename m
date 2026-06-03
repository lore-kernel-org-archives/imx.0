Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A6F477999;
	Wed,  3 Jun 2026 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488863; cv=none; b=RitLBI4sX6oWfEUAjavqc8iE8j7/NvoFZpbCq9RHpSOm13xbZdc5yB7s7t8TZmmklHI3yZ3yYoG21o1elmAXLMDnKHzafcoEtwIa14NVCWhuX+lBrnmZQwRNWn4fK1ahXMLhzTIClXNn3VQHcIX/G2pSMqAkBa7EsZ3niqaj02E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488863; c=relaxed/simple;
	bh=U2PedVfA4ff6bWVsJ3mhaMC73sHRf509h+MLrqGiSsY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bq6jxkXJ6SXUy1y4Vnyg0E1RrHVyvQQoHr3DnksfsFvYyVvxfgOAJcgdSeMRtb35jyzOgKy6vRL2O/HUboiiBKhVC8aWTOkyMpBhupkUxTzL+v2iv5Mfxo0AtlB2CXg/wQfQnl2V+wdfiM6+k5aGijmfK6A5WKCfnhDQQYTkLXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1OYBSab; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1OYBSab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852C01F00893;
	Wed,  3 Jun 2026 12:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780488861;
	bh=JByL+yLxhb1BJXkLFlrHxt/6OavyUzB940oolKBts78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j1OYBSabCmq6DlKObuJNp1tB8vqGKnRBvMX2iHlf9NfuVS8FDulJVNe4bry2Zv23t
	 4OMsPR+sbyQfuQeWPuQrQUlqLxijmcjwWhCIOVuNESqXpsjdKvs5anP1zgLe9IkkZx
	 2QAwfVBMI4uyz3oJUUjkN5mGJ2LSA5GcKTYgDs84E4zuF8GWkYzGU2dy4B1yCWkhnl
	 qXWP8jric2FOzN7fFSreTYtOLJyLyfZtkIWH+nQibDorjlZltMYz9LySdAcEjoYsEu
	 CrpBsn6NdIxFMVc5eIe+4O0VOYJM3wFqKAvz2nIqCn31ZEA6YYyUOjRtibavLdupYe
	 BVU7l6IpPCwcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 02/12] arm64: dts: imx8mp-var-som-symphony: enable
 USB support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <36b7fad5b7cc932f502449cf4082e57f732e8bb2.1780487415.git.stefano.r@variscite.com>
References: <36b7fad5b7cc932f502449cf4082e57f732e8bb2.1780487415.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 12:14:21 +0000
Message-Id: <20260603121421.852C01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect interrupt polarity configured for the PTN5150 Type-C cont=
roller's INTB pin.
--

commit 29e658d004cef4b6d7125b61dc6adb4519ddc922
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mp-var-som-symphony: enable USB support

This commit enables the USB controllers on the Symphony carrier board. It
adds the PTN5150 Type-C controller, configures the I2C bus, and enables the
USB3 PHYs and controllers with their respective roles.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> index 25f707012f62c..de1b8b8428481 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts

[ ... ]

> @@ -95,6 +98,22 @@ usb3-sata-sel-hog {
>  			line-name =3D "usb3_sata_sel";
>  		};
>  	};
> +
> +	/* USB Type-C Controller */
> +	typec@3d {
> +		compatible =3D "nxp,ptn5150";
> +		reg =3D <0x3d>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_ptn5150>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <5 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Low]
Does this incorrectly describe the interrupt polarity for the PTN5150?

The PTN5150 INTB interrupt pin is an active-low, open-drain output, which
would typically use IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_EDGE_FALLING.

While the extcon-ptn5150 driver currently hardcodes IRQF_TRIGGER_FALLING
when requesting the IRQ (masking the issue functionally by overriding the
devicetree), specifying IRQ_TYPE_LEVEL_HIGH violates hardware description
standards. This mismatch could lead to trigger mismatch warnings during boot
or future bugs if the driver is ever updated to use the devicetree specified
trigger type.

> +
> +		port {
> +			typec_dr_sw: endpoint {
> +				remote-endpoint =3D <&usb3_drd_sw>;
> +			};
> +		};
> +	};
>  };

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780487415.gi=
t.stefano.r@variscite.com?part=3D2
