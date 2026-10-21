Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616279;
	b=ARAxmK2HE48oquqIl9BY4q7pfwA4V+D0MmVNWn9ekLbm19u1emiOFLyYdkM9ODEfHw6N
	 yVgn/Y6HOuZdcGrMtnmfG/Bnw6mS2mJVeE6DTiSs3JR0Ht9+anoFZk1ubB0unmU7z3XLq
	 CnThvbyuYKBZSOcmcGc6++cc5Vi7VtC+SKD4XREzMBRwbOXc5o5pSLdVTj8aoIM3/fOUT
	 B16z0R2nJJM8KoX8BEPMnUl0mHTwOYFjAqqt1kFcOh3avKX+h1XPv1ZW0ye+fsi2CFR4t
	 i04glH0O1wC0wJLS1W4r22jgeIt1vtNOyBBIJLrlWSB5PuoRleoC2mrNq2WdNg9I7BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616279;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RoPYXNx8Lhh+gxboIK53SazpXFScKewuHPdEWXWClIQ=;
	b=YXaj7OVpBTNuWPh32kd7Gzf1Cf+StTsaEtbO9gGd526cyB4giDIZiG5rMr0je2OK5wE5
	 Cvgwn6coACEP63jctsZhok7WEGqwTZ80a00+Xd3OvFh2DZRASrBNfBMynMbKyYNA6h9ro
	 EOwAiV+Jh5RT9uurz4ips4pPI+3JVEjg4TDfDH57vD1vr1XFG8O/fvIHEh3BC6FfX33Rq
	 hnmHThPKDVVUZX4x6/Eg1Vz/MjiAe6gLHTxgNFbJNv5/hI7SHkicD38vRB7ECDbWkhm90
	 Od2qkjyg4c5KFRgPWN07x3BFZRHRTpRZiH7OyKLwBKyMCv81fhVQD0eq7LcDbuH6ljw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TmDcETqQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CCC606A319;
	Wed, 21 Oct 2026 20:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TmDcETqQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A531F000C1;
	Wed, 21 Oct 2026 20:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792616278;
	bh=RoPYXNx8Lhh+gxboIK53SazpXFScKewuHPdEWXWClIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TmDcETqQQWZ7UNAkdLQzZnoVagebGhDwyftfx54jk8oxVgT1sRrly36lUQ2WbL0B/
	 zAh43+pssuDXP4y3IoaRoyNAc5lbsZQURPZb03aQ38uJUD2g98ttoHUnwBLrUWWHYS
	 KxLcnNZPQppWxfhBH1FzoQ1edLnBl+Rb0JLn4WFfSaR7eGeoViZGfkdqAbTHm+2ZLu
	 kFg+boKf7C4UcG0Fu4GPAc1QXyoEapG+fH5oQYCAQfxVUh2uNMIysuQBogv+6RgXLK
	 ASBF2gPjIFTv7xzKWkq52hggyDPFSUL1fbbdDJ/G+mYMb3Kf2R+D99mPHq3Z86CAmd
	 SLC/aL22fNHsw==
Message-ID: <sashiko-outbox-180673@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: freescale: ls208xa: correct USB
 compatible strings
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, =?utf-8?b?b3BlbiBsaXN0OkFSTS9GUkVFU0NBTEUgSU1Y?=
 =?utf-8?b?IC8gTVhDIC8gTEFZRVJTQ0FQRSBBUk0gQVJDSElULi4u?= <imx@lists.linux.dev>,
 =?utf-8?b?b3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJQ0Ug?=
 =?utf-8?b?VFJFRSBCSU5ESU5HUw==?= <devicetree@vger.kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261021204516.4031644-1-Frank.Li@oss.nxp.com>
References: <20261021204516.4031644-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 20:57:57 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: freescale: missing dma-coherent on ls208xa usb0 and us=
b1 nodes
- [High] arm64: dts: freescale: missing iommus property on ls208xa usb0 and=
 usb1 nodes
--

commit 299ff7e71139430a2f497142fe0c4f1de05bde95
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: freescale: ls208xa: correct USB compatible strings

This commit updates the usb0 and usb1 compatible strings in
fsl-ls208xa.dtsi from "snps,dwc3" to "fsl,ls208xa-dwc3" with a
"fsl,ls1028a-dwc3" fallback so that the controller programs the
Layerscape-specific gsbuscfg0 value.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/=
boot/dts/freescale/fsl-ls208xa.dtsi
> index cc1a64e63ed55..3b0a26bf609cc 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
> @@ -1288,7 +1288,7 @@ bus: bus {
>  			dma-ranges =3D <0x0 0x0 0x0 0x0 0x100 0x00000000>;
> =20
>  			usb0: usb@3100000 {
> -				compatible =3D "snps,dwc3";
> +				compatible =3D "fsl,ls208xa-dwc3", "fsl,ls1028a-dwc3";
>  				reg =3D <0x0 0x3100000 0x0 0x10000>;
>  				interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
>  				dr_mode =3D "host";
> @@ -1299,7 +1299,7 @@ usb0: usb@3100000 {
>  			};
> =20
>  			usb1: usb@3110000 {
> -				compatible =3D "snps,dwc3";
> +				compatible =3D "fsl,ls208xa-dwc3", "fsl,ls1028a-dwc3";
>  				reg =3D <0x0 0x3110000 0x0 0x10000>;
>  				interrupts =3D <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
>  				dr_mode =3D "host";

[Severity: High]
Should usb0 (usb@3100000) and usb1 (usb@3110000) in
arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi also have the dma-coherent
property when switching to "fsl,ls1028a-dwc3"?

When usb0 and usb1 match "fsl,ls1028a-dwc3" in dwc3_generic_driver
(drivers/usb/dwc3/dwc3-generic-plat.c), they select fsl_ls1028_dwc3:

drivers/usb/dwc3/dwc3-generic-plat.c:
    static const struct dwc3_generic_config fsl_ls1028_dwc3 =3D {
        .properties.gsbuscfg0_reqinfo =3D 0x2222,
    };

During probe via dwc3_core_probe() -> dwc3_get_software_properties() ->
dwc3_core_init() -> dwc3_config_soc_bus() in drivers/usb/dwc3/core.c, the
driver writes 0x2222 to DWC3_GSBUSCFG0:

drivers/usb/dwc3/core.c:dwc3_config_soc_bus()
    if (dwc->gsbuscfg0_reqinfo !=3D DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED) {
        u32 reg;

        reg =3D dwc3_readl(dwc, DWC3_GSBUSCFG0);
        reg &=3D ~DWC3_GSBUSCFG0_REQINFO(~0);
        reg |=3D DWC3_GSBUSCFG0_REQINFO(dwc->gsbuscfg0_reqinfo);
        dwc3_writel(dwc, DWC3_GSBUSCFG0, reg);
    }

As noted in commit 1c97fc901fb6 ("usb: dwc3: dwc3-generic-plat: Add
layerscape dwc3 support"), this configures the controller to issue
cache-coherent snooping transactions.

However, unlike the other Layerscape device trees updated in commit
7b204755ebc214 ("arm64: dts: layerscape: add dma-coherent for usb node")
(fsl-ls1012a.dtsi, fsl-ls1028a.dtsi, fsl-ls1043a.dtsi, fsl-ls1046a.dtsi,
fsl-ls1088a.dtsi, and fsl-lx216x.dtsi) and sibling masters in
fsl-ls208xa.dtsi (sata0, sata1, pcie1..4), neither usb0, usb1, nor their
parent bus or soc nodes have dma-coherent.

As a result, of_dma_is_coherent() in drivers/of/address.c returns false for
the dwc3 sysdev and the child xhci-hcd device:

drivers/of/address.c:of_dma_is_coherent()
    while (node) {
        if (of_property_read_bool(node, "dma-coherent"))
            return true;

        if (of_property_read_bool(node, "dma-noncoherent"))
            return false;

        node =3D of_get_next_dma_parent(node);
    }
    return dma_default_coherent;

Won't this cause a coherency mismatch where the controller snoops caches
while Linux maps coherent buffers (such as dwc3 event buffers and xhci
rings) as Normal Non-Cacheable and omits IOMMU_CACHE in the stage-1 page
tables?

[Severity: High]
Could removing "snps,dwc3" from usb0 (usb@3100000) and usb1 (usb@3110000)
without adding iommus properties also break USB transfers when booting with
U-Boot?

In arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi, the arm,mmu-500 node
(smmu: iommu@5000000) is enabled:

arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi:
    smmu: iommu@5000000 {
        compatible =3D "arm,mmu-500";
        reg =3D <0 0x5000000 0 0x800000>;
        #global-interrupts =3D <12>;
        #iommu-cells =3D <1>;
        stream-match-mask =3D <0x7c00>;
        dma-coherent;

On Layerscape platforms with an smmu, U-Boot programs the hardware stream
IDs for the USB controllers so their traffic routes through iommu@5000000,
and U-Boot's device tree fixup dynamically injects the iommus property by
searching for nodes matching compatible =3D "snps,dwc3".

When commit 7b204755ebc214 ("arm64: dts: layerscape: add dma-coherent for
usb node") removed "snps,dwc3" from the other smmu-equipped Layerscape
device trees (fsl-ls1028a.dtsi, fsl-ls1088a.dtsi, and fsl-lx216x.dtsi), it
added iommus =3D <&smmu 1> to usb0 and iommus =3D <&smmu 2> to usb1:

arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi:
    usb0: usb@3100000 {
        compatible =3D "fsl,ls1088a-dwc3", "fsl,ls1028a-dwc3";
        reg =3D <0x0 0x3100000 0x0 0x10000>;
        interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
        dr_mode =3D "host";
        iommus =3D <&smmu 1>;
        dma-coherent;

Without "snps,dwc3" or explicit iommus =3D <&smmu 1> and iommus =3D <&smmu =
2>
properties on usb0 and usb1 in fsl-ls208xa.dtsi, won't U-Boot's fixup skip
both nodes, leaving them unattached to smmu in Linux while hardware still
routes their stream IDs through iommu@5000000 and triggers unmatched-stream
faults?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021204516.4031=
644-1-Frank.Li@oss.nxp.com?part=3D1
