Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AA9381B19;
	Mon, 11 May 2026 21:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778534434; cv=none; b=t3nNT5bvhAoZUehWK4XtZzytHtPOnY+WqXL42eVmKW3U5E+GIcGiBzC/wSoMHKMcfYyPK6xh+diONbotWV9HEbv0t+buXg7MsbFesRbNHlTgm9CGbbLQEOMv6/LIAlIcYwiAcDSQZd3i9POAAi7T4mbxiEWkmtCSwyz8fYHcXLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778534434; c=relaxed/simple;
	bh=nMrWfzXyejeO9vQWEKORMUEsvjd9Wa774a60OaMvI1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RUDODBBiyRuZe1qOcE3XoiYCXGuCfJikS31H9JgME80MxioCB+Wza70buO4AfLffRsMLbiZNYSqBnkw87kgpypSubSQDfJlIoxobCxliD3TGujZRxYl6+1vSmcaA8ep53Da47+gdB+mVTljyYUmkjIejI8ubNT8YTl3znZwF/V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnF7rNgg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnF7rNgg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E72C2BCB0;
	Mon, 11 May 2026 21:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778534433;
	bh=nMrWfzXyejeO9vQWEKORMUEsvjd9Wa774a60OaMvI1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=FnF7rNgg0jcrSSaPvf0ih/VZO2dfMlQfd72YaEQObevLJSNInR4wh+Zxa3+zlu/9J
	 CTKSfITwM5amtHQEMbEbG+AipIqC6h1v7GxN93/QWPIVVnG0q/4ycttAbQUhyP+udJ
	 huTldScecLR7rBiZn12p0Gq/rPSyLbGxQeHI6VvmIY5y46MLIRjTs3ondb1jc/tBsp
	 2xM7bxgQU0FPeHnGYNTJyoA788HnLjjbYysfuJeN9v0Lzguv87wYiKgRuqdh1l4hQK
	 EdJm9tQCbRO2fz+n7DRrcvygcNOoCBrYHI6MmDk01N2/mOH1bEpSMVbllvX97xKP6f
	 02OYCCH4xUNCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/10] arm64: dts: lx2160a: extend 32-bit, and add
 64-bit pci regions
Reply-To: sashiko@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-lx2160-pci-v5-1-540b83852227@solid-run.com>
References: <20260510-lx2160-pci-v5-1-540b83852227@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:20:32 +0000
Message-Id: <20260511212033.23E72C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect PCI Address Space Code for 64-bit prefetchable memory wi=
ndows.
- [High] Fragmenting the 16GB region into 4GB chunks breaks allocation of l=
arge PCIe BARs.
- [Medium] Incorrect size for the `pcie4` 64-bit memory region in `fsl-lx21=
60a-rev2.dtsi`.
- [Low] Conflation of the Open Firmware `relocatable` bit with the Linux-in=
ternal `IORESOURCE_BUSY` macro.
--

commit bfb49a7c3467d68eca95268c94cbd76b1401fb15
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: lx2160a: extend 32-bit, and add 64-bit pci regions

This commit extends the 32-bit PCIe memory regions to 3GB and adds new
64-bit memory regions up to 16GB for the LX2160A SoC. It also drops the
relocatable bit from the existing ranges, and splits the 16GB area into
4GB chunks for silicon revision 1 to avoid an ATU programming limitation.

The commit message states:

> - drop IORESOURCE_BUSY flag
>=20
> IORESOURCE_BUSY is dropped since it has no effect when specified in dts.

Is this description accurate? The bit being dropped (0x80000000, changing
0x82000000 to 0x02000000) is the Open Firmware 'n' bit, which designates
whether the region is relocatable or fixed.=20

It doesn't appear to be related to the Linux-internal IORESOURCE_BUSY macro.
Could the commit message be more precise about the flag being modified?

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi b/arch/arm=
64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
@@ -14,8 +14,9 @@ &pcie1 {
 	      0x80 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names =3D "regs", "config";
=20
-	ranges =3D <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
+	ranges =3D <0x42000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>, =
/* 64-Bit - prefetchable - 16GB */

Does the 0x42000000 value correctly specify a 64-bit memory space?

In the device tree PCI bindings, bits 24-25 of the phys.hi cell denote
the address space. The value 0b10 (0x02000000 or 0x42000000) designates
a 32-bit memory space, while 0b11 (0x43000000) is required for a 64-bit
memory space.

If it is flagged as 32-bit, the PCI core's of_pci_range_to_resource()
will omit the IORESOURCE_MEM_64 flag. Will this cause the PCI allocator
to fail when assigning 64-bit BARs, as shown in the commit log ("failed
to assign [mem size 0x200000000 64bit pref]")?

[ ... ]

@@ -63,8 +66,9 @@ &pcie4 {
 	       0x98 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names =3D "regs", "config";
=20
-	ranges =3D <0x81000000 0x0 0x00000000 0x98 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x98 0x40000000 0x0 0x40000000>;
+	ranges =3D <0x42000000 0x9c 0x00000000 0x9c 0x00000000 0x01 0x00000000>, =
/* 64-Bit - prefetchable - 16GB */

This isn't a bug, but there might be a typo in the size here. The comment
says 16GB, but the size cells are 0x01 0x00000000 (4GB). The other PCIe
controllers in this file use 0x04 0x00000000.

[ ... ]

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-lx2160a.dtsi
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1193,7 +1193,12 @@ pcie1: pcie@3400000 {
 			apio-wins =3D <8>;
 			ppio-wins =3D <8>;
 			bus-range =3D <0x0 0xff>;
-			ranges =3D <0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; =
/* non-prefetchable memory */
+			ranges =3D <0x42000000 0x87 0x00000000 0x87 0x00000000 0x01 0x00000000>=
, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x86 0x00000000 0x86 0x00000000 0x01 0x00000000>, /* 64-B=
it - prefetchable - 4GB chunk */
+				 <0x42000000 0x85 0x00000000 0x85 0x00000000 0x01 0x00000000>, /* 64-B=
it - prefetchable - 4GB chunk */
+				 <0x42000000 0x84 0x00000000 0x84 0x00000000 0x01 0x00000000>, /* 64-B=
it - prefetchable - 4GB chunk */

Does fragmenting the 16GB region into multiple 4GB chunks prevent the
allocation of larger PCIe BARs?

The Linux PCI allocator requires a single contiguous parent window to
satisfy a BAR allocation request. By splitting the address space here,
the root bus will have four separate 4GB parent windows.

Will this make it impossible for the kernel to allocate any contiguous
BAR larger than 4GB, preventing the successful mapping of the 8GB AI
accelerator BAR mentioned in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-lx2160-pci=
-v5-0-540b83852227@solid-run.com?part=3D1
