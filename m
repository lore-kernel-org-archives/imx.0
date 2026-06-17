Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EFB17B50A;
	Wed, 17 Jun 2026 23:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781739952; cv=none; b=GKUgrDSDo+MCEDxSu4CpsuLX2LKAARJaaseTv74RVRlq7Tn4DGyGk3WwZwvNpE/K/EO4lf8J9TT2CWDrEwQ1nbz7Y5jXZdAtB58zarebAxOjOWycyzVZchKMIaDU9xMKl8OEFvLXwxac8M2eJWbo5j9EhdK/f00Wgbsk+ttoPik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781739952; c=relaxed/simple;
	bh=5Qx5hN9sAp8jOmPEdGqxV4O1CCwZEn4/z9LmZfd5t40=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ib06+BS/CRBf2umrVlfY7ALYvMS6g63eiDTg2zh75ezwmvE9RywWQr9X4f3qc/lNIDQ+cgaaMll3guiGrxJ4mWMzFz+ZEb1HcG408sQAAiaX/dRkwp3Od4TGhmcQJTFpZn72hCHS0laE5wHly5N6TAUYirgm+4REkbm7j+gw6Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5w/iEVV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5w/iEVV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141331F000E9;
	Wed, 17 Jun 2026 23:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781739951;
	bh=/j9zRqWGlcBB7LyPprFcA5clVLtWwI2aQNG6+JV2aqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h5w/iEVVDuU3pC8YnjxZMPz2wXV7bK93GuWALiL2t49T7dOqqp4+9Awfb99CkgJO3
	 o9U1k6Lu7PKYLCznwaWa27PsCyXG27HxdAtkdVCVL8mE1A07muCpDxc/l7RKzc1Ewx
	 qY67PL9M1DoDmMwNgeJzkY4u+ElISGCt7k7aj6SG9dZsY6bcCS0oTKGGLi4JhqnbB5
	 lcRdyTCEAuZYmdl1MKeAKFl7osGpnajvoWjnMmXFSzPosWVs+x3qqVMOr7ZdKaBXDW
	 /BMUCXf6HgOwDyxW0F0mI5TtPh4++tDEdxVrmmlBPvHkd2ylbbuq8B6EeD4zEn53uD
	 vYYqom5jXs/rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/8] arm64: dts: imx8: add camera parallel interface
 (CPI) node
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260617-imx8qxp_pcam-v5-7-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-7-7fa6c8e7fba7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 23:45:50 +0000
Message-Id: <20260617234551.141331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The devicetree routes the parallel CPI to `port@4`, contradictin=
g the `fsl,imx8qxp-isi` binding which explicitly documents `port@6`.
- [Low] Devicetree validation failure (dtbs_check) due to missing `ports` p=
roperty in `parallel_cpi` base node for imx8qm.
--

commit 0f41e0622cccbe3c369609c51df0eb689a3de5d4
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8: add camera parallel interface (CPI) node

Add the camera parallel interface (CPI) base node to imx8-ss-img.dtsi and
extend it with routing in imx8qxp-ss-img.dtsi.

> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/=
boot/dts/freescale/imx8-ss-img.dtsi
> index a72b2f1c4a1b2..b504f99f6acdb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
[ ... ]
> @@ -222,6 +222,19 @@ irqsteer_parallel: irqsteer@58260000 {
>  		status =3D "disabled";
>  	};
> =20
> +	parallel_cpi: cpi@58261000 {
> +		compatible =3D "fsl,imx8qxp-pcif";
> +		reg =3D <0x58261000 0x1000>;
> +		clocks =3D <&pi0_pxl_lpcg IMX_LPCG_CLK_0>,
> +			 <&pi0_ipg_lpcg IMX_LPCG_CLK_4>;
> +		clock-names =3D "pixel", "ipg";
> +		assigned-clocks =3D <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-parents =3D <&clk IMX_SC_R_PI_0_PLL IMX_SC_PM_CLK_PLL>;
> +		assigned-clock-rates =3D <160000000>;
> +		power-domains =3D <&pd IMX_SC_R_PI_0>;
> +		status =3D "disabled";
> +	};

[Severity: Low]
Will this cause dtbs_check failures for other platforms that include this
file?

Since this base node definition lacks a ports property, validating platforms
like imx8qm that include this file without appending ports might trigger a
dt-schema warning. The dt-schema tool unconditionally validates disabled
nodes, and fsl,imx93-pcif.yaml requires the ports property.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> index 232cf25dadfcd..5aae15540d6cb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
[ ... ]
> @@ -62,6 +62,14 @@ isi_in_2: endpoint {
>  				remote-endpoint =3D <&mipi_csi0_out>;
>  			};
>  		};
> +
> +		port@4 {
> +			reg =3D <4>;
> +
> +			isi_in_4: endpoint {
> +				remote-endpoint =3D <&parallel_cpi_out>;
> +			};
> +		};

[Severity: Medium]
Does connecting this to port 4 conflict with the documented binding?

Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml explicitly
documents port 6 as the CSI-2 Parallel RX. While port 4 is technically
correct for the imx8-isi crossbar driver (which only supports 5 ports),
this setup directly contradicts the documented schema.

Should the binding be updated or the devicetree corrected to maintain
consistency?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-imx8qxp_pc=
am-v5-0-7fa6c8e7fba7@nxp.com?part=3D7
