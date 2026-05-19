Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244851EEA49;
	Tue, 19 May 2026 02:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157882; cv=none; b=LotiYADCx4E+cIJZ4sSyzRrPC3dyDpu57A0yFd/PDJS4+IeIoVR4T6RXOxohOeNe8r3D5IK/4VoUEGyUrL6WwIr02mb10lPYRsUISX72EDF6ow5Cto1CS60qqEcArBO8GDL2XhknctuYRkHQ+W8HNtiK1rp6S40JOXLAdDR+/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157882; c=relaxed/simple;
	bh=SUcy34kMcitMYVpLWBH/2/LPY63ECz3VupHu74uPHxg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bPx5kAtZN8pmP0VdalB5Ycq6XF/+esQucvhZJuSqPoL4a+zp0jnN/SbhhOScB/pYuq2ItjqKDGqVcftj68UjiJ6PMNwBA/Y/PJAVwMJyjs94aFH8ge9aEJsKEA4GbnzcOdWfsFZAUiS5cdtX1+7NQpwI4S9Bv5cz1DNRXx50orE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLT4yQhh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLT4yQhh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61501C2BCB7;
	Tue, 19 May 2026 02:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779157881;
	bh=SUcy34kMcitMYVpLWBH/2/LPY63ECz3VupHu74uPHxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TLT4yQhhu6rNbMKUOGyNVKNrSfckw8PgdHJymYY2H5m04ZW8lVtmkEue8OC78AtFF
	 OD2SZsD4EPGCzCQ/C0OMY6eFf7sQvyQT6/RJw8UNQb1AiAgwS4j7t6IvKaAbIF0hi4
	 pkpGDLIdIHzAhmVN1Oz4OPGffzcRkKn+1mJky3n4TstFttENXQnxkdtq/AbpefW3jK
	 YcwKOEMF+NJiLbJ+Q+MdVBDDLO+xIohvRmb4FqNj+jP6dGxkSIC/YD8f8a/egOSu9h
	 SqWuuyXUtBAMdNpzXaCGbVxqzfb9tY4rS9zyUqXIQeE8B0jXq6SAa7WF8954cilgUW
	 xm53RblkGEIpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] arm64: dts: imx95: Correct PCIe outbound address
 space configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Zhu" <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519022220.57686-1-hongxing.zhu@nxp.com>
References: <20260519022220.57686-1-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 02:31:20 +0000
Message-Id: <20260519023121.61501C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The PCI child bus address for the I/O space is incorrectly set to =
0xf0000000, which breaks devices that rely on 16-bit I/O addressing.
--

commit ce14f8afc3b0f35c82afa68f19826408baa01125
Author: Richard Zhu <hongxing.zhu@nxp.com>

arm64: dts: imx95: Correct PCIe outbound address space configuration

This commit updates the PCIe outbound memory ranges for pcie0 and pcie1
on i.MX95 to expand the memory window from 256MB to roughly 3840MB. It
also relocates the 1MB I/O region to immediately follow the memory region.

> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index adcc0e1d3696b..c43f2bec99d0a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1939,8 +1939,8 @@ pcie0: pcie@4c300000 {
>  			      <0 0x4c360000 0 0x10000>,
>  			      <0 0x4c340000 0 0x4000>;
>  			reg-names =3D "dbi", "config", "atu", "app";
> -			ranges =3D <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
> -				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
> +			ranges =3D <0x82000000 0x0 0x00000000 0x9 0x00000000 0x0 0xf0000000>,
> +				 <0x81000000 0x0 0xf0000000 0x9 0xf0000000 0x0 0x00100000>;

Will setting the PCI child bus address for the I/O space to 0xf0000000
cause issues for devices that rely on 16-bit I/O addressing?

The previous configuration used a PCI bus address of 0x00000000. While the
parent CPU address is correctly offset to 0x9_f0000000, applying the same
offset to the child PCI address forces the Linux PCI core to allocate I/O
ports starting at 0xf0000000 on the PCI bus.

Many legacy PCIe endpoint devices and PCI-to-PCI bridges only decode
16-bit I/O addresses up to 0xffff. Assigning an I/O base address of
0xf0000000 could cause allocations to conflict or fail completely for
these devices.

Should the child PCI address for the I/O ranges remain 0x0 0x00000000?

[ ... ]

> @@ -2014,8 +2014,8 @@ pcie1: pcie@4c380000 {
>  			      <0 0x4c3e0000 0 0x10000>,
>  			      <0 0x4c3c0000 0 0x4000>;
>  			reg-names =3D "dbi", "config", "atu", "app";
> -			ranges =3D <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
> -				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
> +			ranges =3D <0x82000000 0x0 0x00000000 0xa 0x00000000 0x0 0xf0000000>,
> +				 <0x81000000 0x0 0xf0000000 0xa 0xf0000000 0x0 0x00100000>;

This has the same child I/O bus address concern as pcie0 above. Could this
also be updated to use 0x0 0x00000000 for the child PCI address?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519022220.5768=
6-1-hongxing.zhu@nxp.com?part=3D1
