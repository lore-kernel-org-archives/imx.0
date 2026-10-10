Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78474A7CB1;
	Sat, 10 Oct 2026 12:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636596; cv=none; b=NWjp1quINm25ugaaVol1fgf7rsQY2ACryhWYOIyB75elQ9ZLcVoTzvwyDnC24lMxNJwpRuk2rE3h5zYL/E2C3nW8lomH60pJNM6qRXuHJoQYMkvuMvYUo5jBd4YYjUPGpqMoU6nMbhDcurutdxCAwABNssXg+jat/C++ABBA8lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636596; c=relaxed/simple;
	bh=N9seFhSPU/pKS3Qhagh6hEw1ab7gi2LBYuJ4c6re96I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tzTz7Bx9iPqfKxuWrE5jKkgY8vOCSFVFNDKIElHs0Jf4qphaI09SQM1XW0nsxmeWeAhPbfSHuWl0bRTNgSlul3NFJBnmcgr2eabP1+AzhR3wOLFul8YuRqDR5SRvXBGWvHlH6ayI68nRNn/Lf8a8CxZwVvw73t82KRBokA6BOPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzFrwIBk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzFrwIBk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F101F00893;
	Sat, 10 Oct 2026 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636594;
	bh=TgsGI63X2QklFAUDp95CwnJSz5F1xKRys7wj3OXv1Ig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UzFrwIBk5KFHY0qMOKRzXrmkyoLUbabBuRiCRlLKjfKhLg+WK6NTSzTJ7JE6VXOuN
	 /EJmhwjanNFFaKDrdRSZ0tBfQXMWsAUi2eOUfpruWfMfnRG1dyLfFhrbwR2X21bof2
	 FI54akK6kiH/uQYWajrz/6PVUKBLz8ZqI1Upj/K3Jqk0/077xce1r+5/yzqUPBrS+u
	 CxqUYjgvr7DOy16cB1MhEr/nqnlrwWvABn1qnKdSZ5Msv+WsuDLuxT4ZSH9Ql0IEM1
	 jHaofWFyo64g3CZyJy8ObnESO3AAr0arP2gJgjA/fpNF2iKLCE0gtRrQvs6bMc5GiH
	 ZcfR9eg+v9mOw==
Message-ID: <sashiko-outbox-166545@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v1 3/5] arm64: dts: s32n79: add NETC IEP18 ECAM
 node for ENETC PPM ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Claudiu Manoil" <claudiu.manoil@nxp.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <49a0450c6d906f0ba1a886d86e89f35746a7a6fc.1791548316.git.claudiu.manoil@nxp.com>
References: <cover.1791548316.git.claudiu.manoil@nxp.com>
 <49a0450c6d906f0ba1a886d86e89f35746a7a6fc.1791548316.git.claudiu.manoil@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 12:49:53 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: PCI node netc_iep18 uses msi-parent instead of msi-ma=
p breaking MSI routing
--

commit 31419622a4729bd8008cf190e3a0993387a80408
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

arm64: dts: s32n79: add NETC IEP18 ECAM node for ENETC PPM ports

Add the netc_iep18 PCIe ECAM host node describing the NETC integrated
endpoint bus allocated to the first Linux cohort on S32N79.

> diff --git a/arch/arm64/boot/dts/freescale/s32n79.dtsi b/arch/arm64/boot/=
dts/freescale/s32n79.dtsi
> index 94ab58783fdc8..671b807f1c540 100644
> --- a/arch/arm64/boot/dts/freescale/s32n79.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32n79.dtsi
> @@ -122,6 +122,30 @@ irqsteer_coss: interrupt-controller@4ed00000 {
[ ... ]
> +		netc_iep18: pcie@241200000 {
> +			compatible =3D "pci-host-ecam-generic";
> +			reg =3D <0x2 0x41200000 0x0 0x100000>;
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			device_type =3D "pci";
> +			bus-range =3D <0x0 0x0>;
> +			msi-parent =3D <&its 0x0>;

[Severity: High]
Does this break MSI routing for the PCIe devices on this bus?

The GICv3 ITS requires an MSI specifier (#msi-cells =3D <1>), and Linux's
of_check_msi_parent() explicitly rejects msi-parent on bus nodes if the
target MSI controller has #msi-cells > 0. This causes of_msi_xlate() to
fail to locate an MSI controller, leaving the PCIe devices entirely without
an MSI domain.

Furthermore, PCI buses typically use the msi-map property to map Requester
IDs (RIDs) to MSI sideband Device IDs. Using msi-parent with an argument
maps all 256 RIDs to the exact same ITS sideband ID (0x0). This breaks MSI
isolation and contradicts the iommu-map property which maps them to distinct
Stream IDs (0xc0000 to 0xc00FF).

Should this use msi-map instead, for example:
msi-map =3D <0x0 &its 0xc0000 0x100>?

> +			iommu-map =3D <0x0 &smmu 0xc0000 0x100>;
> +			dma-coherent;
> +			status =3D "disabled";
> +
> +			/* All NETC PCIe functions */
> +			ranges =3D <0x82000000 0x0 0x48800000 0x0 0x48800000 0x0 0x4b0000>;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791548316.gi=
t.claudiu.manoil@nxp.com?part=3D3
