Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F58489FBC;
	Wed, 14 Oct 2026 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962971; cv=none; b=INaV+wxcc8Nt02hrpq9wf3HwTPNgb/3eS+nGIcgNFSvNhcekGwqp+p5iH7AIqjJgQd69/WY9XML7buTQB7Rbg2HCxOn9C12u+y9Yq6FeS5EHrwnZIjwHFNpeO5OaEDHFUU/4tnwnEur9verFWdLBoBbznfSOe7yJZPWtFewderI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962971; c=relaxed/simple;
	bh=vJG0BrH2YlV4SouCeAbKpfs9mIcwxLtNgwdVCIWL+6c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MqV11NDlJCrrYTYx+IrK00ictiG6m1rgm9nY3zMlDezdFH8ssmqW/ujkmnORSxIxQB3LiMOQBxj4X3NGRqpxfBAboq6U9XOyKBN5BRgYWG86QMhk8lEvepbFXzQs16wcfOUNYjZMQzxuKM5M1FTchUH3dC7/aSiB1hYt5hQq3yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oW0sDTpF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oW0sDTpF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADFF1F000FF;
	Wed, 14 Oct 2026 07:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791962965;
	bh=yhFKxNTpHyvYsilbup8LwxaUHwN4lYlPT/FNLPrrSAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oW0sDTpFfJG5DUGO/NrhE9zdvJU2JtXiMtMio3qA0gqxn06Jbzb/rugptYZrHUPu2
	 YcFOSMvAtay7OTGDdH8gaPlTwKXVUW6YffaTEuLNPA5/tPw7AUHgXx01maRfJjTSo+
	 fnJWMC0PPP+cBKlsvWcob8r0/LSYIZIOGxYbO1QAMiHJjeCqN4qmao2a4QMBgYVUwR
	 hZcZHO5IjaNWWF3RDUjBsS2YbauQjHrbLn8j8ZYdqo7k1ojdoZRloX5iTEfv4VHfDw
	 bFdOggDM43JgqZUumdF9cRN0yF1AIZP0daLKnRBeVaRtXnNcYMJXUdFpYeHwNiIeP1
	 Zh5Cci29T8/kg==
Message-ID: <sashiko-outbox-170941@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: imx8qxp: Add MIPI-LVDS combo
 subsystems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261014071657.118378-4-alexander.stein@ew.tq-group.com>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 07:29:25 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dts: simple-pm-bus node specifies address cells but lacks memory-ma=
pped children
- [Low] dts: irqsteer evades DT binding by omitting SoC-specific compatible=
 and power-domains
--

commit bf42b82f7a33a44c5f4805e13c2e5eb848f29919
Author: Liu Ying <victor.liu@nxp.com>

arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems

The MIPI-LVDS combo subsystems are peripherals of pixel link MSI bus in
i.MX8qxp display controller subsystem. Add the MIPI-LVDS combo subsystems.

> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi b/ar=
ch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
> new file mode 100644
> index 0000000000000..67f5392cfc803
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi

[ ... ]

> +&dc0_pl_msi_bus {
> +	mipi_lvds_0_irqsteer: interrupt-controller@56220000 {
> +		compatible =3D "fsl,imx-irqsteer";

[Severity: Low]
Does this node omit the required SoC-specific compatible and power domains?

The fsl,irqsteer.yaml DT binding schema strictly requires the power-domains
property when the fsl,imx8qxp-irqsteer compatible is used. By only specifyi=
ng
the generic fsl,imx-irqsteer compatible, this evades the schema's
enforcement.

Failing to model the power domain directly on the interrupt controller viol=
ates
the hardware description conventions. The equivalent node in imx8-ss-mipi0.=
dtsi
correctly included both the SoC-specific compatible and the power-domains
property.

> +		reg =3D <0x56220000 0x1000>;
> +		interrupts =3D <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;

[ ... ]

> +	mipi_lvds_0_csr: bus@56221000 {
> +		compatible =3D "simple-pm-bus", "syscon";
> +		reg =3D <0x56221000 0x1000>;
> +		clocks =3D <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
> +		clock-names =3D "ipg";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		mipi_lvds_0_pxl2dpi: pxl2dpi {

[Severity: Low]
Is this simple-pm-bus configuration correct given that it lacks memory-mapp=
ed
children?

The mipi_lvds_0_csr node specifies #address-cells =3D <1> and #size-cells =
=3D <1>,
but its children (like pxl2dpi and ldb) do not possess reg properties. The
device tree compiler (dtc) expects children of simple-pm-bus or simple-bus
nodes to have reg properties if #address-cells is greater than 0.

This will trigger simple_bus_reg and avoid_unnecessary_addr_size dtc warnin=
gs
during the build and violates standard DT architecture patterns.

> +			compatible =3D "fsl,imx8qxp-pxl2dpi";
> +			fsl,sc-resource =3D <IMX_SC_R_MIPI_0>;

[ ... ]

> +	mipi_lvds_1_irqsteer: interrupt-controller@56240000 {
> +		compatible =3D "fsl,imx-irqsteer";

[Severity: Low]
Like the mipi_lvds_0_irqsteer node above, does this irqsteer node also omit
the fsl,imx8qxp-irqsteer SoC-specific compatible and the power-domains
property?

> +		reg =3D <0x56240000 0x1000>;
> +		interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014071657.1183=
78-1-alexander.stein@ew.tq-group.com?part=3D3
