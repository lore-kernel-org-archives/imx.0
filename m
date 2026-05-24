Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C092D8DBB;
	Sun, 24 May 2026 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779635629; cv=none; b=G/tdSC8qxCzaMQZ31ngQ67S2ZPUednOQOFpgmMHRd1sS2Z/RYAnT4LT+rFMYBXC8Lp7GDJjf35BO9CxvSFNJvvMMN/NfeTq/s5t54UA0EvHRmVrn5VQB2bi8GRKlP6TDoMn25bKm6zEymN60qOPVIYWD4WqMCrWFRP9n3MVlUcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779635629; c=relaxed/simple;
	bh=OyPiwTZFtMQvKOgGaBaDIAqhhgjYSld/o6LZ0tORrJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N4mifvnie1P7fXMEFxMA8d6ft9cubRJN/K9jae4KmRweeFrWKlhbfu8Hu1yLh1xzt4CEiKbA3CPEWLDd8/9i6uicUO1KA6zgvKkgX0QlamTsGj6rTQn2hGjm+nhGFldLzlmMM9hRkLeuIlD/g4vcl1JimodG7BHbl6WXPDxF2VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9HcMBJz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9HcMBJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD92A1F000E9;
	Sun, 24 May 2026 15:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779635628;
	bh=6bZN8ocWjBwQYAvhPss9YboT5CzawSLi/7j7owFEg/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S9HcMBJzayvHIx2xfQNVSLrOH1ZFCpyj9lnRIaGGkELEkdKXBdj4K0pARvODMWQnc
	 REG6ErBZ5cVNGE4aLV6GBG8zm6QeH6dE2WotY2ZvtdY/zQ7RBCjzIUccFQyhmTDJqy
	 DEitdC9KUuRs0bvXA9tyffrje1kmQxWsOcxC5bZmq83oHl8P2lCAHdIp4n9IdfB+Og
	 4jCMk6tqI9z4ONMvGafJWFCcBhIpYxQCRU8iqMaR6tkLMI+J/vVWZKTzlzi4Q6tjV4
	 a4m5TK6COnuterSIlUHQF/FlOXf3TVi5ijpdTBvTQvJYAaAxRoUXlb4YC6R95W8T1a
	 t1UrqPq75as3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add
 64-bit pci regions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260524-lx2160-pci-v7-1-09370c23b952@solid-run.com>
References: <20260524-lx2160-pci-v7-1-09370c23b952@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 15:13:47 +0000
Message-Id: <20260524151347.BD92A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Expanding the 32-bit PCI outbound window to 3GB causes it to overl=
ap with the inbound system memory address space, breaking DMA.
- [High] The introduction of the 64-bit PCI memory range causes existing U-=
Boot bootloaders to fail device tree patching, breaking MSI and IOMMU.
--

commit a80e2e3f97808fdad781240469c5e07e019191e9
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: lx2160a-rev2: extend 32-bit, and add 64-bit pci regions

This commit extends the 32-bit PCIe memory regions to 3GB and adds 64-bit
PCIe memory regions for LX2160A rev2. This allows allocation of large BARs
requested by graphics processors or AI accelerators.

> [4] pci bootloaderp atching related errors with IORESOURCE_MEM_64 flag:
> [    0.967809] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@380000=
0 ranges:
> [    0.967830] layerscape-pcie 3800000.pcie:      MEM 0xa400000000..0xa7f=
fffffff -> 0xa400000000
> [    0.967842] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa0f=
fffffff -> 0x0040000000
> [    0.967849] layerscape-pcie 3800000.pcie:       IO 0xa000010000..0xa00=
001ffff -> 0x0000000000
> [    1.169315] pci 0000:01:00.0: [8086:1572] type 00 class 0x020000 PCIe =
Endpoint
> [    1.169733] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00ffffff 64bit p=
ref]
> [    1.169771] pci 0000:01:00.0: BAR 3 [mem 0x00000000-0x00007fff 64bit p=
ref]
> [    1.169796] pci 0000:01:00.0: ROM [mem 0x00000000-0x0007ffff pref]
> [    1.173389] OF: /soc/pcie@3800000: no msi-map translation for id 0x100=
 on (null)
> [    1.173515] OF: /soc/pcie@3800000: no iommu-map translation for id 0x1=
00 on (null)

[Severity: High]
Does adding the 64-bit PCI memory range cause existing U-Boot bootloaders to
fail device tree patching?

When U-Boot encounters the 64-bit range, it appears fdt_fixup_pcie() aborts
and fails to append the msi-map and iommu-map properties.

Without iommu-map, the kernel will not attach the SMMU to the PCIe devices.
Without msi-map, the kernel cannot translate PCIe Requester IDs to ITS
Device IDs, which breaks MSI/MSI-X allocations.

Could this prevent devices like NVMe drives from initializing and break
compatibility with existing deployed bootloaders?

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi b/arch/a=
rm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
> index f54005e37924b..db1ebee53f6f0 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
> @@ -14,8 +14,9 @@ &pcie1 {
>  	      0x80 0x00000000 0x0 0x00002000>; /* configuration space */
>  	reg-names =3D "regs", "config";
> =20
> -	ranges =3D <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000
> -		  0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
> +	ranges =3D <0x81000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>=
, /* 16-Bit IO Window */
> +		 <0x82000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>, /* 32-B=
it - non-prefetchable */
> +		 <0xC3000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>; /* 64-B=
it - prefetchable - 16GB */

[Severity: High]
Does expanding the 32-bit PCI outbound window to 3GB (0xc0000000) cause it =
to
overlap with inbound system memory?

System memory starts at physical address 0x80000000. Since there isn't a
dma-ranges property mapping inbound DMA to a different bus address, system
memory uses a 1:1 mapping, meaning inbound DMA targets 0x80000000 and above.

If a PCIe device requests a large 32-bit BAR, the kernel might allocate it
within this 0x40000000-0xffffffff range. This causes the Root Port's
downstream bridge Memory Limit register to be programmed to a value >=3D
0x80000000.

A Root Port won't forward upstream memory transactions if the address falls
within its programmed downstream window, as it assumes it is peer-to-peer
traffic.

Could this intercept endpoint DMA targeting system memory in the overlapped
range and cause system hangs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-lx2160-pci=
-v7-0-09370c23b952@solid-run.com?part=3D1
