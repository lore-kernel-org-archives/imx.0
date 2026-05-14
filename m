Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935F4199FAB;
	Thu, 14 May 2026 01:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721382; cv=none; b=N1U1tH8/q/wtnxIxVs/T5GocaJ8pieesenxTtiXJDdaseii/m6YnRsjC3s56t8OY30+NvBfaTGp8mSxCQr3T6PKDAu89PqSvZCqxbsqQ7dsuQ+oxs/SwEHDIO+zcf355BJKyP6xVHAjdIRVJZPDu7aRu0B6+vCykv7RsPKh2I4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721382; c=relaxed/simple;
	bh=nxI1O/YyLz9vol3gd2j7QC0AYBKo7AvOvdBoc5iFUew=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CKVC74vglCxL/wYXd8NvB4cmSPG+Pft6HTKDHHRG8PPUU2pkP8jjTcr9RGVcXbZTmu9WfDXr7gmGDDsyi047FOkgliEZRKZr8PLXUEAXFsoGdB+oW9GxT9IwpaJ4f5SmFxOSzSNwH4f9aGweaqXOFl9nZnvG0hxg3xjlw22Vhlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6iNDqYa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6iNDqYa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BD2C19425;
	Thu, 14 May 2026 01:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778721382;
	bh=nxI1O/YyLz9vol3gd2j7QC0AYBKo7AvOvdBoc5iFUew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=k6iNDqYaEgcTHpZDUewQRUM3LGjid0VRNr7kkPjMdSpeJgMQsA5tTwFn/sZbi8QPw
	 eU1/Q1HpQNj3d9CYR59tktcZA1iA2xXWJz+8unsLOGAsVP14N4d1ojSvklpTjmOti3
	 9IRNxzR1izWGihS3osICutRNZN1U5ZRpCPvdnXMjHZuA0W0qpczHBay+/EmEeufk1c
	 iVd+omWjCRKtvDOqBQkJJG4ITL7s+1w0fg7uJZRPi9hj0Q6s0fdLPV+K2/DMEbR2LN
	 G/s97cr59qRc5psQ9/UmWVMOFgaP5FtvElx9Baq7ucvbCBhsb2cwCUeCEA52rtfA9j
	 D5s98SMiuSlSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: dts: imx95: Increase PCIe outbound address
 space to 4GB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Zhu" <hongxing.zhu@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260513034456.1554188-1-hongxing.zhu@nxp.com>
References: <20260513034456.1554188-1-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 01:16:21 +0000
Message-Id: <20260514011621.E3BD2C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unaligned 4GB PCIe outbound memory window causes iATU wrap-around =
and address translation failure.
--

commit 2c9468d72c0c22f965e76ce9a1c6ea0cf04f99fa
Author: Richard Zhu <hongxing.zhu@nxp.com>

arm64: dts: imx95: Increase PCIe outbound address space to 4GB

This commit increases the PCIe outbound memory region size to 4GB to
match the actual hardware-supported memory space. It updates the ranges
for both pcie0 and pcie1.

> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index adcc0e1d3696b..d8a6a18ddfa1c 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1940,7 +1940,7 @@ pcie0: pcie@4c300000 {
>  			      <0 0x4c340000 0 0x4000>;
>  			reg-names =3D "dbi", "config", "atu", "app";
>  			ranges =3D <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
> -				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
> +				 <0x83000000 0x0 0x10000000 0x9 0x00000000 1 0x00000000>;

Will this unaligned 4GB PCIe outbound memory window cause an iATU
wrap-around and address translation failure?

The child PCI base address is left at 0x10000000. With a size of 4GB (1 0x0=
),
the PCI address range extends from 0x10000000 to 0x10FFFFFFF, which crosses
a 32-bit boundary.

The i.MX95 uses a DesignWare PCIe controller. Its internal Address Translat=
ion
Unit (iATU) generates outbound PCI target addresses by adding the CPU-side
offset to a 32-bit lower target register.

Since this 32-bit adder does not propagate a carry bit to the upper 32-bit
address register, the 32-bit addition overflows when the CPU accesses the t=
op
256MB of the new memory window (e.g., offsets >=3D 0xF0000000).

Instead of correctly crossing into the 0x100000000 PCI address space, the
hardware silently wraps around to 0x00000000. This limitation will lead to
PCI access failures or memory corruption if devices are allocated BARs in t=
he
upper section of the window.

Should the child PCI address be 4GB-aligned (e.g., 0x0 0x00000000) to match
the CPU alignment and ensure safe address translation?

[ ... ]

> @@ -2015,7 +2015,7 @@ pcie1: pcie@4c380000 {
>  			      <0 0x4c3c0000 0 0x4000>;
>  			reg-names =3D "dbi", "config", "atu", "app";
>  			ranges =3D <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
> -				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
> +				 <0x83000000 0 0x10000000 0xa 0x00000000 1 0x00000000>;

Does this node have the same address translation issue as pcie0?

Like pcie0, the child PCI base address is 0x10000000 and the size is 4GB,
which will also overflow the 32-bit iATU adder and wrap around.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513034456.1554=
188-1-hongxing.zhu@nxp.com?part=3D1
