Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B593A4F3D;
	Mon, 20 Jul 2026 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582643; cv=none; b=ctLYwAOXQTJZZDTCzniBi7gJufEDUqRm5kEDBnrXPDJY1f64UAXSlzWTfJTEfnrXFtI5PgE8WSDRqonoOxJbnRpBzmY70InOhcZcBGBBLsOl7fvkyv6X83y810vpONrXbRj2JFp9f0d7XCIocqJEAv8I0IL9y+FN9upMI+H/yrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582643; c=relaxed/simple;
	bh=4+Cdz7goO1btKTh9Q/3cbIs4cIOzE4pkrzeCVqRBOMo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SNGB64dDBcfNOa7OkH3UfKmrq+AiOWE+GKePNgdLM7n/ybfXBL03pDxdjvmRMmLZaz9XfG6hX7zWOOOd7ObFGmaOHyBtKP5FyXqDi88+lAquttjetKX3zwciT1vOemV+NMNecqAn5xELBXlR7clhjDD+dBJaMSj/WW2FnolaSfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWYcmm4H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWYcmm4H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BD31F000E9;
	Mon, 20 Jul 2026 21:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784582642;
	bh=msRU8AzBVVLcoKhnf+aDEvVJgQ3xLtsl8P2k04/bRwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aWYcmm4Hg01GrR/l3K/Ol+0nzCy977Ga7nR+SBMJ5jYfjUVPAUUPQv1LsKJnKbn41
	 DgZvbDCNISkTVNHTLuC8G/jXGBEOpVt52fQ7Mh4fGwXNdVPuWJbPcfcBY0Q/aBezYF
	 eU6Qq/2PT7iX18IZtMyNIG8dFwoYlUL0EGBwEvt4fJAeOTynUyni1108XqsxI0LKSI
	 SW1fGvgUc0jcKtDEjrsHWHPB4hNAbCAG9zON2Qf82xfgaa3f0ONkdgqCNVLPu4nk28
	 VDBFah+ui7EdwkTxgji2i3PxGsUL2xcs17oF03RRDpuBaJrtg2jcSD8ruQjW+BAlvT
	 ZqaP+tOtR1bgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260720-qm_smmu-v1-2-3689fbd8b516@nxp.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-2-3689fbd8b516@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 21:24:01 +0000
Message-Id: <20260720212401.C2BD31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `usbphynop2` node requests the wrong power domain (`IMX_SC_R_U=
SB_0_PHY` instead of `IMX_SC_R_USB_1_PHY`).
- [Medium] The `usbh1` node is enabled by default (missing `status =3D "dis=
abled";`), violating SoC `.dtsi` practices and causing unconditional probin=
g.
- [Low] Missing required `#phy-cells` property in the `usbphynop2` node.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e000=
0 node ---
commit 9497d73ee79f69a11e0a9347cd596ca4c9842914
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000 node

Add usb@5b0e0000 and related node for i.MX8QM.

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> index 1370a571153a5..c7063aaac4a34 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> @@ -4,6 +4,40 @@
>   *	Dong Aisheng <aisheng.dong@nxp.com>
>   */
> =20
> +&{/} {
> +	usbphynop2: usbphynop2 {
> +		compatible =3D "usb-nop-xceiv";

[Severity: Low]
Does this node need a #phy-cells =3D <0>; property?  The usb-nop-xceiv.yaml
binding schema typically requires this property to be present, and omitting
it might cause dtbs_check validation failures during the build.

> +		clocks =3D <&usb2_lpcg IMX_LPCG_CLK_7>;
> +		clock-names =3D "main_clk";
> +		power-domains =3D <&pd IMX_SC_R_USB_0_PHY>;

[Severity: High]
Is IMX_SC_R_USB_0_PHY the correct power domain for usbphynop2?  Since this =
is
for the USB_1 controller (usbh1), should this be IMX_SC_R_USB_1_PHY instead?

If it requests the USB_0 PHY domain, the USB_1 PHY hardware might remain
unpowered, causing the HSIC port to fail.

> +		status =3D "disabled";
> +	};
> +};
> +
> +&conn_subsys {
> +	usbh1: usb@5b0e0000 {
> +		compatible =3D "fsl,imx7ulp-usb", "fsl,imx6ul-usb", "fsl,imx27-usb";
> +		reg =3D <0x5b0e0000 0x200>;

[Severity: Medium]
Should this node include a status =3D "disabled"; property?  Without it, the
usbh1 node is enabled by default and will probe unconditionally on all i.MX=
8QM
boards, even if the hardware interface isn't wired up.

Since the required usbphynop2 PHY is disabled, the controller might fail to
initialize, leading to boot delays and unnecessary resource allocation.

> +		interrupt-parent =3D <&gic>;
> +		interrupts =3D <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-qm_smmu-v1=
-0-3689fbd8b516@nxp.com?part=3D2
