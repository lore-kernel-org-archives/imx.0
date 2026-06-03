Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B239DBE0;
	Wed,  3 Jun 2026 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498221; cv=none; b=unULKLrnCOcfmQ95B7aTFyNNQZpcjvi+WbtGkBUV0sqh2uxSeL6i2eLyFeAzGjb5vfc1EJwRtPchwRxrwu4dmAo0bJhqqAmORkZ33QawEAHkSo2WAShKeu8t4pWnq4m+clyU44JA1Uzd8+YZMtm/tbinqiQzjFWpxonz4NpfPEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498221; c=relaxed/simple;
	bh=//SjiivSc5FGk4dhHS1iw1C9vc2WPOgAESB5n1LQIkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lOVgsoIyc0R9gIdwQMmEU5qL5zFZp6/yq3atLpf5GiFTgbwlL/6lydRmCRfh3xE6zDo9D8RXPwPTNYnXcpr/5KX4eh++x0KbecKd/QaDstOpJX6Hcx0EVNLXdgVsK7SwzPfwQ6F/wfoOIokZHllGo3FDWGNA/2iVX/0SXmDANig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yji2CAmJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yji2CAmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62B11F00893;
	Wed,  3 Jun 2026 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780498220;
	bh=TQx1VCiUhpyPhtw0hDNCgM1tvDyNho2naFvoOm0MHFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yji2CAmJkAxdk0uuI6dWHyn2RwXIToQPtT4pNSvXDP6nR+UaAfHmGGEDd4O2zyqiL
	 Ec0P2fpb2xPUjAJS8TJNQpFXuNorzdnmAcoe5FLJVfZucwli7LxLCRlXOYzZygz3Pj
	 Gyun07i3PAZRAKShvCeAggz96/DTI13Ed7n/NGV+05yX3Wct76iYExcpmVCCq7FzTI
	 tHPBnpfIBxdGcOx6nEzECY0vTPVgeqPSsUUhFCYPvZKQorLz09u3fXATcuO+72w4Al
	 Jq4jWhq1MeuUPD92kRmpGORQFmktbiIfPKa7WVdAsmu/tWKpKiocjnzr/yqUrIkO5x
	 saU7zlAUSWzGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/14] arm64: dts: imx8mp-var-som-symphony: enable
 USB support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <7d8b29b9a29b1976cafc3d279482012efae1a994.1780497188.git.stefano.r@variscite.com>
References: <7d8b29b9a29b1976cafc3d279482012efae1a994.1780497188.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:50:18 +0000
Message-Id: <20260603145019.C62B11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Invalid interrupt trigger type (IRQ_TYPE_NONE) specified for the PT=
N5150 Type-C controller.
--

commit 5a2bed0fe2fb89d900dd21def4f8d915e89c7039
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mp-var-som-symphony: enable USB support

This commit enables USB support on the Symphony carrier board. It configures
the PTN5150 Type-C controller, enables the USB3 controllers and PHYs, and s=
ets
up the appropriate I2C and GPIO bindings.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> index 25f707012f62c..76928b0058265 100644
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
> +		interrupts =3D <5 IRQ_TYPE_NONE>;

[Severity: Low]
Is IRQ_TYPE_NONE the correct trigger type to describe this hardware?

While the extcon-ptn5150 driver hardcodes IRQF_TRIGGER_FALLING when request=
ing
the interrupt (which mitigates this on Linux), device trees should accurate=
ly
describe the hardware independently of driver defaults.=20

Would it be better to explicitly specify the active-low or falling-edge
interrupt trigger (e.g., IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_EDGE_FALLING) in
the typec@3d node instead of leaving it unconfigured?

> +
> +		port {
> +			typec_dr_sw: endpoint {
> +				remote-endpoint =3D <&usb3_drd_sw>;
> +			};
> +		};
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780497188.gi=
t.stefano.r@variscite.com?part=3D2
