Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F56F2E285C;
	Wed, 20 May 2026 04:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779250655; cv=none; b=B5jMtG6dAB2Y6ZdxVpLLWrW8bouaYsNgRYVzfIUNqJCdcpyClAeM9Gn17OLcWMEMmQsVMBwarrt5IxOIa0GaJbTg/vbRnZH3goaMcRE6Supi+f1BxorA060Vlhuuo1U3dYzJ/B/iLL5sqna26Z2d4nC7/nTxFYn6Y3qzXW/ZQMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779250655; c=relaxed/simple;
	bh=cxqIKo4VVQSTDFvtb5H+qmpfxhPfjXMK7rYoL4Xafnw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=krxcm2yc+LEgrM0LFeg8w5zPTP0yKOAGZtqoSjyCh/duNymrJFmwIinyXCsdKuVOgUoXheXLnApM6bGiQOmII0E+qG0RkWeQnI5TGTQCSSM2tkd85as7IOep9vgRLCmd6JyXPipztLvHQwHfQm7/w43yuht4B/yAkEt4C0lkhIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxrzCdKV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxrzCdKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E6D1F000E9;
	Wed, 20 May 2026 04:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779250653;
	bh=YRTSFBr5Weg6KKfZECBjXyEKE1L59Al3eNTvmLe7+rM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LxrzCdKV5oKakBxz8/NpFXvtfUVnA0JoNPOFVERGHpa4TJ8iMSNaDG1ZCrDjQhFNl
	 JfjyJ8vLxUyDFShidGIwJHZvqtZjLA4/meY15DsFa5QH0rWmt/WygLFpFyg9CTOj3Z
	 7IUxe995n8M4eyUU0YSeLzyRFWfYg3X6WhUDlQZqMNp01nzkzHMHlYcGOahojGeKeK
	 3Q+03o281T4VZrQWlUx7bixG31HPcUDaRXEw+zz1bL84BINIXW6OZabAhXpI6L1KuE
	 g0lXYPlSoIMjlG6W4mgiXzYKgvrE+dz38H0DZ+czK7hR4dENkP9OykiVi25OTz6Lxo
	 NklO25GWPpHgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7] arm64: dts: imx95: Correct PCIe outbound address
 space configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Zhu" <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520035642.2207511-1-hongxing.zhu@nxp.com>
References: <20260520035642.2207511-1-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 04:17:32 +0000
Message-Id: <20260520041733.37E6D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The 32-bit non-prefetchable memory region is mapped to PCI bus add=
ress 0x00000000, which breaks identity mapping, risks BAR allocation at 0x0=
, and causes inbound DMA routing conflicts with low IOVAs.
--

commit e0f5ac7bad631db9fb55f3b3093d93a9bac757ae
Author: Richard Zhu <hongxing.zhu@nxp.com>

arm64: dts: imx95: Correct PCIe outbound address space configuration

This commit fixes the PCIe outbound memory ranges for both pcie0 and pcie1
controllers on i.MX95 by expanding the outbound address space window size.
It also relocates the 1MB I/O region to use a memory-mapped region instead
of I/O space.

> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 71394871d8dd0..2c058f6105550 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1852,8 +1852,9 @@ pcie0: pcie@4c300000 {

[ ... ]

> -			ranges =3D <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
> -				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
> +			ranges =3D <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
> +				 <0x82000000 0x0 0x00000000 0x9 0xe0000000 0x0 0x10000000>,

[Severity: High]
Does mapping the 32-bit non-prefetchable memory region to PCI bus address
0x00000000 break identity mapping and risk inbound DMA routing conflicts?

By assigning the PCI base address to 0x0, the PCIe Root Port's Type 1
configuration space will be programmed with a Memory Base of 0x0. If a
downstream device initiates inbound DMA to system RAM using an IOMMU-assign=
ed
IOVA that falls within this low address range, the Root Port might interpret
the transaction as a peer-to-peer access.

Could this cause the transaction to be routed back downstream to the PCIe
bus instead of being forwarded upstream to the system bus and IOMMU? To
prevent this, should the PCI address be set to a high non-zero value, such
as 0xe0000000, matching the lower 32 bits of the CPU address?

> +				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;
>  			#address-cells =3D <3>;

[ ... ]

> @@ -1927,8 +1928,9 @@ pcie1: pcie@4c380000 {

[ ... ]

> -			ranges =3D <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
> -				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
> +			ranges =3D <0x43000000 0xa 0x00000000 0xa 0x00000000 0x0 0xe0000000>,
> +				 <0x82000000 0x0 0x00000000 0xa 0xe0000000 0x0 0x10000000>,

[Severity: High]
Will this have the same DMA routing conflict with low IOVAs as the pcie0
controller above, since it is also mapped to PCI bus address 0x00000000?

> +				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
>  			#address-cells =3D <3>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520035642.2207=
511-1-hongxing.zhu@nxp.com?part=3D1
