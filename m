Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D116A383338;
	Wed, 13 May 2026 22:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711673; cv=none; b=ECV4y6CAt+ICt9OUFqgexJNQnt32ZTzKDg7aFXATGSEaXhZocmS8+Fmmtv6gFveKG1s2BMrxNP+DVDSy00C+cfYrZM9oKX9xJ0H3Z239vefWkiKJz9nK9PuOa3JXtzEj9omgbAfEMtVNuO+3CW3Zi26uXcsExikqwCNpDGKrq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711673; c=relaxed/simple;
	bh=Iuti5/wFFTHw0pMO9FkEXYpRvQ/xy0fXSJOKszxcCgg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R5KLEhRgEwzpnqnFyA3dtb4TJaAW89Xb9FnTvqJiqyTaubHs//LZ/nG7NwEpDuXzmuWv2TG6lIhuaeYZsi9Dr6V/w9kiJOgjsA4oLwyePWMXEZAVnRkc8Cx1gfCfFJWxnQVJoI8POIC1AIRHC8JPH3NLVJa4likbOEEt+1vZ7mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRc919+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRc919+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369DCC19425;
	Wed, 13 May 2026 22:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778711673;
	bh=Iuti5/wFFTHw0pMO9FkEXYpRvQ/xy0fXSJOKszxcCgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lRc919+JbJedmScxDts/MgJv2bvlIFmgobLJ8F9ntsFo/SuZ6azjGth2j/br91EBJ
	 yZGod9i6PupnaaLAt5A4hg+qxjwacbKNW3DKP6JJipVB4qvlEf6pWkP9uUH74TDE/O
	 7RgDSYk4iDfJNlWBRbtLJ+xNseBPHLOGN5+nv5X4krXzMnLY8kOkDOV5JYfDwkfIZj
	 5cAyT/NKr1Rb01Ad+scjEiACbHDu369Xw1zeWbv0GRQaRglpGbJjGrQPR6rVP94efJ
	 Bxpv06lPT+cx32Xt0sDcpXuGePJZF9KpBo83z+SQtCG0ajaxsER6lYCIXgpysR72VY
	 TedkSnuwXsEmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/10] arm64: dts: lx2160a: extend 32-bit, and add
 64-bit pci regions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512-lx2160-pci-v6-1-d0ff72d3c983@solid-run.com>
References: <20260512-lx2160-pci-v6-1-d0ff72d3c983@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 22:34:32 +0000
Message-Id: <20260513223433.369DCC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Splitting the 16GB 64-bit PCI memory region into four discrete 4GB=
 chunks in reverse order prevents the allocation of any PCI BAR larger than=
 4GB on rev1 silicon.
- [Medium] Invalid PCI space code used for 64-bit memory regions to work ar=
ound a bootloader bug.
- [Medium] The commit message erroneously conflates the Device Tree 'n' (no=
n-relocatable) bit with the Linux kernel's internal `IORESOURCE_BUSY` macro.
--

commit ca41553adc6a14507e322cba09be38ac0e0f5fd4
Author: Josua Mayer <josua@solid-run.com>
Subject: arm64: dts: lx2160a: extend 32-bit, and add 64-bit pci regions

This commit extends the 32-bit PCI memory regions to 3GB and adds 16GB
64-bit memory regions for the LX2160A SoC. It also splits the 64-bit
region into four 4GB chunks for silicon revision 1 to avoid an iATU driver
programming error, and drops the non-relocatable flag.

> IORESOURCE_BUSY is dropped since it has no effect when specified in dts.

Is this description accurate? The IEEE 1275 PCI Device Tree binding defines
bit 31 (0x80000000) in the phys.hi cell as the 'n' bit, which denotes wheth=
er
the address is non-relocatable (1) or relocatable (0).

While it shares the same bitwise value as the Linux internal IORESOURCE_BUSY
macro, the DT binding flag does not represent IORESOURCE_BUSY.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi b/arch/a=
rm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
> index f54005e37924b..b5f52f3f84c7d 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
> @@ -14,8 +14,9 @@ &pcie1 {
[ ... ]
> -	ranges =3D <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000
> -		  0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
> +	ranges =3D <0x42000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>=
, /* 64-Bit - prefetchable - 16GB */

Does this encode an invalid DT representation to work around a bootloader b=
ug?

The value 0x42000000 uses the 32-bit memory space code (bits 25:24 are '10')
instead of the 64-bit space code ('11', which would be 0x43000000). Accordi=
ng
to the OpenFirmware PCI binding, 32-bit memory space addresses must fit wit=
hin
32 bits, and 64-bit regions must use the 64-bit space code.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/=
boot/dts/freescale/fsl-lx2160a.dtsi
> index 479982948ee53..3f63fbf2485e5 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> @@ -1193,7 +1193,12 @@ pcie1: pcie@3400000 {
[ ... ]
> -			ranges =3D <0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>=
; /* non-prefetchable memory */
> +			ranges =3D <0x42000000 0x87 0x00000000 0x87 0x00000000 0x01 0x0000000=
0>, /* 64-Bit - prefetchable - 4GB chunk */
> +				 <0x42000000 0x86 0x00000000 0x86 0x00000000 0x01 0x00000000>, /* 64=
-Bit - prefetchable - 4GB chunk */
> +				 <0x42000000 0x85 0x00000000 0x85 0x00000000 0x01 0x00000000>, /* 64=
-Bit - prefetchable - 4GB chunk */
> +				 <0x42000000 0x84 0x00000000 0x84 0x00000000 0x01 0x00000000>, /* 64=
-Bit - prefetchable - 4GB chunk */
> +				 <0x02000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>; /* 32=
-Bit - non-prefetchable */

Does splitting this region into four reverse-ordered chunks prevent the
allocation of PCI BARs larger than 4GB?

By listing the chunks in reverse order (0x87, 0x86, 0x85, 0x84), it prevents
of_pci_range_parser_one() from coalescing them into a single 16GB region. T=
he
PCI subsystem will then register four independent 4GB host bridge windows.

Because the Linux PCI allocator (pci_bus_alloc_resource()) cannot span a si=
ngle
allocation across multiple root bus windows, any device requesting a BAR la=
rger
than 4GB might fail to allocate resources and become unusable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-lx2160-pci=
-v6-0-d0ff72d3c983@solid-run.com?part=3D1
