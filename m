Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C37B330B07;
	Fri, 17 Jul 2026 20:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321315; cv=none; b=SOqfR4/n1mROPj2Uc7QL+k97dODKjcNbpdp9z571JJaJjHHyrmRMxX52LDIUEUp3mQ8TKyOPwrkBjc4oVCHpSCfEfjMlApdo2EUJ1mY36eTTjj0NgTAHlzMpk8CGZJvXQXw7erTEHHCAZ+FeacrrA01ylnB08vmK8lBO4JKctSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321315; c=relaxed/simple;
	bh=SUaX4TV2wDbgYvgeqJdba/vkB3LRa2gim407WqGl4FE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q+EMK1yeGFSw1OQIlQ6DpMpBCj9uFCz3nMIoERrMfkrla55WlJG87r7WdFVMj7ITltvUwYRhRyT21Ac0bNLdWcQGX8xQ09yI0MmjoZkG0kOdd3VVXcRQUnjgyVn8coMQtWYANPzwwPZQ2xtG+d9MUiD/fXPuxgyphILJMtifbUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZs2VDUG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZs2VDUG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A3B1F000E9;
	Fri, 17 Jul 2026 20:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784321314;
	bh=H2Ah9PPkxDX3WyCZCKPf61yrqddq5IS275SB6cUnUlE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bZs2VDUG9WXZaAPI9mSTgh/qtao9xMjjlaGM0zivcV9/mzm3d9LfhBIsNi0j0eY5Z
	 xIoQET+PHDF0jEKQ1BKC05kT6u3R+IFOctPE1hGnH8NzHkFBA1SAiuobDo6tgTbk7/
	 wO44uM5jxWX6frdMHvYuOiAH4ukwffy2b3aruszKPCMNWnlfYctj0oZyNiySVsvr9B
	 ww95bu2URiB0xTivc6414utTIJgziuR3RZaf+eS6CkQBjXveENZNC8iJRZXu8o+YM2
	 0roB4gPVHxBRitce3qWaL+Op+aFZzpa8jyAy1Dd0NY5CB6DTmkaGr8IP24LCYDv1tf
	 irLLEFTlOiJOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7] arm64: dts: s32g: Add GPR syscon region
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jared Kangas" <jkangas@redhat.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260717-upstream-s32g-gpr-syscon-v7-1-ee198f287682@redhat.com>
References: <20260717-upstream-s32g-gpr-syscon-v7-1-ee198f287682@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 20:48:33 +0000
Message-Id: <20260717204833.C7A3B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `gpr: syscon@4007c000` node is inserted out of nume=
rical address order in the device tree.
--

--- Patch [1]: [PATCH v7] arm64: dts: s32g: Add GPR syscon region ---
commit 1ee5b4988128c1ccf8969bc9b1f12c66a53c7919
Author: Dan Carpenter <error27@gmail.com>

arm64: dts: s32g: Add GPR syscon region

This commit adds the GPR syscon region for the s32 chipset. It resizes the
GPR syscon from 0x3000 to 0x100 to avoid a panic when reading the debugfs
regmap's registers file. The changes update the device tree files for both
s32g2 and s32g3.

> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 809019ea0e299..81280ec6b07a9 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -325,6 +325,11 @@ usdhc0-200mhz-grp4 {
>  			};
>  		};
> =20
> +		gpr: syscon@4007c000 {
> +			compatible =3D "nxp,s32g2-gpr", "syscon";
> +			reg =3D <0x4007c000 0x100>;
> +		};

[Severity: Low]
This isn't a bug, but should the gpr: syscon@4007c000 node be inserted in
numerical address order? It appears to be placed after the pinctrl@4009c240
node (which contains usdhc0-200mhz-grp4). To maintain standard numerical
sorting, it would typically be positioned before pinctrl@4009c240.

> +
>  		ocotp: nvmem@400a4000 {

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index 22e80fc03f9c7..da35083a5e0e5 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
>  			};
>  		};
> =20
> +		gpr: syscon@4007c000 {
> +			compatible =3D "nxp,s32g3-gpr", "syscon";
> +			reg =3D <0x4007c000 0x100>;
> +		};

[Severity: Low]
This isn't a bug, but similarly to the s32g2.dtsi changes, does this node
also break numerical address sorting? It seems to follow a node with a high=
er
address.

> +
>  		ocotp: nvmem@400a4000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-upstream-s=
32g-gpr-syscon-v7-1-ee198f287682@redhat.com?part=3D1
