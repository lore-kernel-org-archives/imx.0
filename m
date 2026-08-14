Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99777412C08;
	Fri, 14 Aug 2026 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692622; cv=none; b=S93ZXguHPgHDlOXHpX6eQdf9bOJoiMzUvOcdDdr96NJFE/u2uqUWfO7tO1D3h4ul5IYUJJVGVBGnI9R5FVwL6rXx+cAA+qCYmv6F450VRYyDGh12Ks5YS5ARt6yq+VyXUg+LnkbI3aKB79/df8AWrE1a8ixB8VMkXbqY+iPDz9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692622; c=relaxed/simple;
	bh=LUZDNdE321gmaKZIvoZ5pWzsCUHew458rlYe5ZyL88k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GhRiysgqcdSprzpmO+xRpMsyA88Mp/YCZxCWNR3V/i9L2iSNzy8s+ivQcLr9joGW/Bq4WpShWqAJoW0DD9AzAVvuURvTLOS8Cj8zViRyata9ah4bqyMXcv3jO2MFG6d/HSoyAadAmJNuGQ89xHf9rifQ8BH4xuVselWmWM9xfxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAPAprBX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAPAprBX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46241F00A3D;
	Fri, 14 Aug 2026 07:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692617;
	bh=qOIzaRLC6/C0D7bUB55H0PUxztS+BBXt5LXpGCjd8/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TAPAprBXMTWXKIEQYUJhqPU0SdjbcTWQhlWu32iuX/pbwL7QPy747WRzCHFxTsv6M
	 qHFSxoammoNEmy4P4gJ8XTU0bxgw0dvKCWM4DSRyQHdo0E5tUec5Vc22bcTiRqa6xD
	 HvHs1/kmxTAoi+RNEFb+s9gT+6y+Lo01csyHCchAmj9OZJYRDIxXDqFy7ByTZc9h47
	 I+bse0s+wnou5Pl1KCXp4lCwKEPFofGjrpH2dwyAiIb375kLj4RW5CODroeUQMTNAB
	 rz790raQA3AYyBbiGcoeXfNqAj/q6lsGV0wAeLlSZxrdEkPR7O1NS6D/+A242a1ME9
	 ykxz5W1iOSLmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/17] arm64: dts: imx95: Add clock and sound-dai-cells
 properties for MQS1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260814072022.4064009-12-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-12-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:30:13 +0000
Message-Id: <20260814073016.E46241F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit adds `clocks` and `clock-names` properties to the common=
 `imx95.dtsi` but fails to remove the duplicate definitions from the board-=
specific DTS files as claimed in the commit message.
--

--- Patch [11]: [PATCH 11/17] arm64: dts: imx95: Add clock and sound-dai-ce=
lls properties for MQS1 ---
commit d5073b98fc81da9751dc1ae974fe122948c15d30
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: imx95: Add clock and sound-dai-cells properties for MQS1

This commit adds clock and sound-dai-cells properties to the MQS1 node in t=
he
common imx95.dtsi file. It notes that these are fixed SoC integration
properties that shouldn't be duplicated across board-specific files.

> MQS1 MCLK input is driven from the respective SAI1 MCLK output, and
> sound-dai-cells describes the node as an ASoC DAI provider. Both are
> fixed SoC integration properties rather than board specific, so add them
> here in the common dtsi instead of duplicating them in each board dts.

[Severity: Low]
The commit message mentions adding these properties here "instead of
duplicating them in each board dts", but it looks like the duplicate
definitions still exist in the board files and weren't removed by this
patch.

For example, in arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts:

&mqs1 {
        clocks =3D <&scmi_clk IMX95_CLK_SAI1>;
        clock-names =3D "mclk";

And similarly in arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts:

&mqs1 {
        clocks =3D <&scmi_clk IMX95_CLK_SAI1>;
        clock-names =3D "mclk";

Should this patch also remove these redundant properties from those board
files to fully consolidate them?

> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 38fc47024841f..7bc74307d9ae6 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -439,6 +439,9 @@ hugo_funnel_out_port0: endpoint {
> =20
>  	mqs1: mqs-1 {
>  		compatible =3D "fsl,imx95-aonmix-mqs";
> +		clocks =3D <&scmi_clk IMX95_CLK_SAI1>;
> +		clock-names =3D "mclk";
> +		#sound-dai-cells =3D <0>;
>  		status =3D "disabled";
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814072022.4064=
009-1-chancel.liu@oss.nxp.com?part=3D11
