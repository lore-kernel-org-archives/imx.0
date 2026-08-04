Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048073876A4;
	Tue,  4 Aug 2026 17:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865571; cv=none; b=APVgt8xzl4hRyqBgdWsjQY3ZhYLtk83JUde5GShbCw7oJhi8Ne0xFmAKuEt2a4MNyFw3ZQruQ7SA93uUAKXf+eLq7kTwz6MslFKxVNgA4r1EPdgK+ek7tIjW0U/rRcCCjk/hxeLDcBt/JJg/cja8cJlH5ThMvIGgLN6KJX9zQ8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865571; c=relaxed/simple;
	bh=eGYhmUmW+9eyAUGozyzv9dl/k0f38xoXmrlBFQyv/zc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GjH8QrLplp2h9D56qJ4jz3apOWuQMon0c8juijqk/MhYBr2sxuIPCD5sVFj6d1nC16gBRy3yYmkg0NLqfB2g9e0s5Is4xK4kxXL7JK4KVWcJD1lFuWmKoQasJl6HaLP6uL9Nbm0LdaS4GfxlT0upGPElY2m3c5w4eEunfA12ozc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpIcTGmr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpIcTGmr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09141F000E9;
	Tue,  4 Aug 2026 17:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785865565;
	bh=hQE5l7Z2aK1s5w0j+yjewR8FfG19dhow9urAj/rsXwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EpIcTGmrL3KYFAl32//sG74LAjhkAoZHSiul+RbokwhjhvWfiLgwg7ieMu4A/Du9E
	 /eAnlcuB6LBnMPZkVTII9jMFKFODVzg7VCzHZujq7Z82jf9ZnC7hu9d1N2n+tm8rL8
	 Jq6BSpB7YLOg02/KkxSb0UJkCOWq9xZEgkOfgcv3eN4h13HPRZ0wMXrzg+AigE+Flw
	 DlwhHS7Ns01idpCYRsPXriLsoB3IIfFYHpKjXKfgJgOUS5WjCw3n7bRElAZk61QkOG
	 Wp4edA+7/JEhr5zBtvoIVhdVpnqmBaMmRyh5y8SFvCjMRVlrnT1szKiiMD3dDezbak
	 A+Zq+EyHE7cRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804162310.24374-7-marex@nabladev.com>
References: <20260804162310.24374-1-marex@nabladev.com>
 <20260804162310.24374-7-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 17:46:04 +0000
Message-Id: <20260804174604.D09141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] DT Node Conflict / Duplicate Unit Address
--

--- Patch [7]: [PATCH v9 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DT=
Os for Data Modul i.MX8M Mini and Plus eDM SBC ---
commit c5a51996123e2650a624a6ad09a9ec065dfa47f6
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini =
and Plus eDM SBC

This commit adds Device Tree Overlays for the eDM-MOD-iMX8Mm-FIO1-Audio
feature connector expansion module. The module provides an SGTL5000 codec,
CAN, PWM, UARTs, and other IO for the Data Modul i.MX8M Mini and Plus
eDM SBCs.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> new file mode 100644
> index 0000000000000..88fa705ac2b67
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1-audio.dtso

[ ... ]

> @@ -0,0 +1,79 @@

[ ... ]

> +&spba2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	sai5clk: clock-controller@30050000 {	/* SAI5 */

[Severity: Low]
Will this trigger unique_unit_address warnings during DT validation?

The base imx8mm.dtsi already defines an sai@30050000 node inside spba2.
Adding a sibling clock-controller@30050000 node creates two nodes with the
same unit address. Even though the base sai node is disabled, this violates
the DT specification that sibling nodes must have unique addresses.

Would it be better to override the existing &sai5 node directly, or
explicitly delete it first with /delete-node/ &sai5?

> +		compatible =3D "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mp-d=
ata-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> new file mode 100644
> index 0000000000000..4e2112355350f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1-audio.dtso

[ ... ]

> @@ -0,0 +1,67 @@

[ ... ]

> +&spba5 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	sai5clk: clock-controller@30c50000 {

[Severity: Low]
Does this also conflict with the existing sai@30c50000 node in spba5
defined in the base imx8mp.dtsi?

Like the i.MX8MM overlay, this adds a clock-controller@30c50000 sibling
node that shares a unit address with the existing sai node.

Should this overlay override &sai5 directly or delete the existing node
first to avoid DT validation warnings?

> +		compatible =3D "fsl,imx8mp-sai-clock", "fsl,imx8mq-sai-clock";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804162310.2437=
4-1-marex@nabladev.com?part=3D7
