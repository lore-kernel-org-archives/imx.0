Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FA3F4108;
	Mon, 27 Jul 2026 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146047; cv=none; b=pbhNS+Soc18FG9AV6qxafWZDLbdCgxqfEu7Z3WZutXk5aqBZgd3wS/dc1MA5y75STy95FHXcCq/qtdat+4a59jYjyGnfkFLGNsGtGRzPGMLFoOZ051AYHjsreJ4yFc4nCA9Mby8xXNaSObFimGw1GKQ3JfFqLGBLkC2jwmnZqg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146047; c=relaxed/simple;
	bh=ZhzxnG+yHPUvpfTdR9oIZKK7kx9PM62pDvMIzWkmtFI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TO03YYdggdhZxTUwEJnWsDTH36emrhYtnpSs7OkFUTwD64tns/YwZTzPF1bP4m7V9EUnHAE88PDyZ9bb2mczQ6rGYDfqBlqCN6I49Z0Ly35FgRomKazQfVxA9r4h8i8WPIxjj58wmJiqXJMXUqYN4sjyG5wocQI970vatvv6rqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2r/nkDP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2r/nkDP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481DD1F00A3A;
	Mon, 27 Jul 2026 09:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785146039;
	bh=kigReCWQ2TdDNk/++JY7Y7GQdJMkuvTYOQyEbcp2xdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M2r/nkDPuHpWx/utKty0VaoZT8TZXNcrZacCZVcBW4fcK9ySgYnixmD83fMd8gLBs
	 ao1JL4ii4BEdv91r0Fzx3DsJilKzSdZhyRPv0MyV7MTkcIqLMSAUnjuUhr36VneUxp
	 v+qaS5J/9K3XDLCNGmvWwhMCZby67FppsDqJRbipjFtTOOcrSuTehcq10FzvJRXEdC
	 7fE5emc21FQxFytPy8hxVUMRT7Vb3HW97TO3U00AafR8bWwCLyPOZckZHhtpwaa5yE
	 MLSRcETGO6+C1dL945S3UaiVqzm8wWhKQ+DIyz+VLfs4dlhyY4u8SHyY0PPaftl2UT
	 euI8Q4I77QaZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: imx8mp-skov: support new 7inch panel
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-5-67faa5ee0bf6@pengutronix.de>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de>
 <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-5-67faa5ee0bf6@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 09:53:56 +0000
Message-Id: <20260727095357.481DD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The touch controller node is missing from the device tree overlay,=
 despite the commit message explicitly claiming support for a new touch con=
troller.
- [High] The `lcdif2` display controller is not enabled, which will prevent=
 the display pipeline from working.
- [Low] Missing `#address-cells` and `#size-cells` properties in the `ports=
` node of the overlay causes a dtc compiler warning.
- [Low] The closing brace for the `ports` node is indented with spaces inst=
ead of tabs.
--

--- Patch [5]: [PATCH v5 5/5] arm64: dts: imx8mp-skov: support new 7inch pa=
nel board ---
commit ad8d9c520b6e230240af8bd68c3a85a7288fc73b
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

arm64: dts: imx8mp-skov: support new 7inch panel board

This commit adds a device tree overlay to support the SKOV IMX8MP CPU revC
board with a JuTouch JT070TM041 7-inch panel. The commit message notes
that the board uses a different panel with a different touch controller.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070=
tm041.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm=
041.dtso
> new file mode 100644
> index 0000000000000..2433b57aeed40
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.d=
tso
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {

[Severity: High]
The commit message mentions support for a new touch controller, but there
doesn't seem to be a touch controller node defined on any I2C bus in this
overlay. Will the touchscreen hardware fail to initialize without this node?

Also, is it necessary to enable the display controller here? It appears
that without a node like &lcdif2 { status =3D "okay"; }; the display pipeli=
ne
might fail to probe because it remains disabled in the base device tree,
which could leave the panel blank.

> +	model =3D "SKOV IMX8MP CPU revC - JuTouch JT070TM041";
> +	compatible =3D "skov,imx8mp-skov-revc-jutouch-jt070tm041", "fsl,imx8mp";
> +
> +	panel {
> +		compatible =3D "jutouch,jt070tm041";

[ ... ]

> +&lvds_bridge {
> +	/* IMX8MP_VIDEO_PLL1 =3D IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
> +	assigned-clock-rates =3D <0>, <358400000>;
> +
> +	ports {

[Severity: Low]
Does this ports node need explicit #address-cells =3D <1>; and
#size-cells =3D <0>; properties? Without them, compiling this overlay
independently could cause dtc to emit warnings about invalid property
lengths for port@1 since it assumes the default #address-cells =3D 2.

> +		port@1 {
> +			reg =3D <1>;
> +
> +			ldb_lvds_ch0: endpoint {
> +				remote-endpoint =3D <&in_lvds0>;
> +			};
> +		};
> +        };

[Severity: Low]
This isn't a bug, but this closing brace is indented with spaces instead
of standard tabs.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-v7-0-topic=
-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de?part=3D5
