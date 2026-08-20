Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726AF3D969B;
	Thu, 20 Aug 2026 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215330; cv=none; b=TG0eS9GiYHW4ZxcIH7ywpgmIfjtDitm3ccVsWgpZFVp8ppZkQtV9ZgWixFyZ/hgcLx1p0trbJjWfCY23r5h1tz8eGPW563uTKyAeXdpiWsQd5Z/zxrq6KAYVZpW3IIhD0YGSxCwjEXLMi7uxzXNQmQ2FnM2PwIcR8lNGstZSels=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215330; c=relaxed/simple;
	bh=dYI0DDVoDQhxe2r9dPxuvr6LjIviBg0mEMbpZPhLRJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nM2cUXBDFzdQ8wl9c6O7UBQTgdNyTdOyqgBe3vY7OdRj4h+yljCtMWNeZkxmbygbs7kKAGKu55kyyx+jr+NtnKIXQ6o+crScad7FWTYdOn6YRgJXaH0UcBn8UGFE4tcLdZ0a9ed8JxHwNnhJdsfGUId692CJ4QCSLIbI8Ym9xeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HaOOvTRg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HaOOvTRg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF311F000E9;
	Thu, 20 Aug 2026 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215328;
	bh=MNyvfdUqZlAZp5+ZAeZetU2dlcr0TVrMsWNcUKqaYIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HaOOvTRgG/0cUXDcXULovisl6R/mnCsyJ9zIro+2OYCOvtMCKkaBDPINunEO7bI6B
	 3z16ndhaEJNwPVOQeWnifEIocpwWaTYzD9YcayRiimlVfJ+SOCbI4dBvLLqEdWRUls
	 dyo36g9dPzlFrXwB5dtfhmVW9CttF7mi/S/+jcm0HRAk9Z7tgajtA0TiBSZzPGgNvR
	 UridpYweWRpNf96I2S6BOU1BHmu69pHNc2El/ZTZlB8wEb3HQfpIfLj9qhxbnr7Kfv
	 ibjL6YEsc/dphHvR+Rr1UIXjC/YvXSX55AEjmsq1dhAFTLTNcNNPx6ppe/OzGoXICk
	 CbDHoAlFiHb/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window
 System RAM overlap
Reply-To: sashiko-reviews@lists.linux.dev
To: hongxing.zhu@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260820083620.877251-2-hongxing.zhu@oss.nxp.com>
References: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
 <20260820083620.877251-2-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 08:42:07 +0000
Message-Id: <20260820084208.5CF311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately claims to change the 'CPU addres=
s', but the patch actually changes the 'PCI address'.
--

--- Patch [1]: [PATCH v1 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window S=
ystem RAM overlap ---
commit 1e55a58df93bb33b1e5b78cb2403b958366907f0
Author: Richard Zhu <hongxing.zhu@nxp.com>

arm64: dts: imx95: Avoid 32-bit PCIe window System RAM overlap

This commit updates the device tree configuration for the PCIe controllers
on the imx95 platform. It adjusts the ranges property to prevent memory
window overlaps.

> Move the PCIe non-prefetchable memory CPU address from 0xe0000000
> to 0x10000000 to avoid overlap with DRAM.

[Severity: Medium]
Is this description of the change accurate?

The device tree ranges property uses the format:
<PCI_HI PCI_MID PCI_LO CPU_HI CPU_LO SIZE_HI SIZE_LO>

> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1948,7 +1948,7 @@ pcie0: pcie@4c300000 {
[ ... ]
>  			reg-names =3D "dbi", "config", "atu", "app";
>  			ranges =3D <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
> -				 <0x82000000 0x0 0xe0000000 0x9 0xe0000000 0x0 0x10000000>,
> +				 <0x82000000 0x0 0x10000000 0x9 0xe0000000 0x0 0x10000000>,

Looking at the modification to pcie0, the CPU (parent) bus address is
represented by the 4th and 5th cells (0x9 0xe0000000). These cells remain
unchanged in this patch.

The cell that is updated from 0xe0000000 to 0x10000000 is the 3rd cell,
which corresponds to the lower 32 bits of the PCI (child) bus address.

Could the commit message be clarified to state that the PCI address is
being changed, or was the intent to actually update the CPU address in
the 5th cell?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820083620.8772=
51-1-hongxing.zhu@oss.nxp.com?part=3D1
