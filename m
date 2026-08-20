Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AACC2DD5F6;
	Thu, 20 Aug 2026 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215223; cv=none; b=AnbRmgDoiljNTS+Z02klLRy4inoMwQ+ApAfnwo8WCy8BuCJOI+sDLkobVMk+zoWMd6HZHb84UktDQ7gzuK/ZiDY/gBKCfAmjOvreK7f2BuSbnCj4MOgiwP4Ign7giDgTXg9AaGd2rRecH4Ox1CG38dzN3SXV5o6rOSN9GsvLmqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215223; c=relaxed/simple;
	bh=YtctiPyVVgqiQi0+6LbYCUXjjoxlEtNP9jAdXe5AIJM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GVbo+5v2quclGrgxQul6aU0sk1yRleT+zlYF3hUSNXvlaNhJfqEAD9swvfdSHK7piODjhQAn9pMsb+6+OuBuVBcHQC8MXH5To8/wDOjL8unNtdT51MIiESd2E86sZH9huW8z9kxu9FmO1SdagwY0ooscKScb0UVvEDxUnc+rBHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DV7w+5Qr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DV7w+5Qr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEBC1F000E9;
	Thu, 20 Aug 2026 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215221;
	bh=1Pr57dBtGEkKuwcH+z8BWRKGgKJr3cOOKuwlwqzg+GU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DV7w+5Qr++UjE3ghgORFJnN9mNiRAAmqEY9adKMyl0b7MaFbZ7gbWNpK8WSbfCUmY
	 0B7cUY1tCfD40ckGoo4ZBlfIsp9wFItxq8FOMXz5bAcqIbB9VpCsvpKKVTimNanklW
	 wsLy0PS6Yp+yfWsGK6Ed9I6/aoc32Hg4KirjlIcD903CLZM2tuiIXqQM/JFCqSZKSH
	 0xfD4Xmjb5RzRuu8KYylzAMF8ngwDKn1aEziDTweNnf1ty/R69X5ByuJzUjgMZVooU
	 jpzIaohBsLu51/cV/jxmy4949GVTAjBSRpO58icxsGm9EfUoSH98O7x8QrMdKgRWNj
	 MIav62oalc4AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] arm64: dts: imx94: Avoid 32-bit pcie window
 system ram overlap
Reply-To: sashiko-reviews@lists.linux.dev
To: hongxing.zhu@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260820083620.877251-3-hongxing.zhu@oss.nxp.com>
References: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
 <20260820083620.877251-3-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 08:40:21 +0000
Message-Id: <20260820084021.8BEBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately claims to modify the 'CPU addres=
s', but the code actually modifies the PCIe bus address.
--

--- Patch [2]: [PATCH v1 2/3] arm64: dts: imx94: Avoid 32-bit pcie window s=
ystem ram overlap ---
commit e35c73490a85a542f882f45cf6fb1b821101d403
Author: Richard Zhu <hongxing.zhu@nxp.com>

arm64: dts: imx94: Avoid 32-bit pcie window system ram overlap

This commit addresses a memory overlap issue between the PCIe non-prefetcha=
ble
memory and system RAM. It adjusts the address space configuration in the im=
x94
device tree to use a reserved, safe range.

> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/d=
ts/freescale/imx94.dtsi
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -1379,7 +1379,7 @@ pcie0: pcie@4c300000 {
>  			      <0 0x4c340000 0 0x4000>;
>  			reg-names =3D "dbi", "config", "atu", "app";
>  			ranges =3D <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
> -				 <0x82000000 0x0 0xe0000000 0x9 0xe0000000 0x0 0x10000000>,
> +				 <0x82000000 0x0 0x10000000 0x9 0xe0000000 0x0 0x10000000>,

[Severity: Medium]
The commit message states "Move the PCIe non-prefetchable memory CPU address
from 0xe0000000 to 0x10000000". Is this description accurate?

Looking at the Device Tree ranges property format:
<child-bus-address> <parent-bus-address> <length>

The 4th and 5th cells representing the parent (CPU) address (0x9 0xe0000000)
remain unchanged here. The third cell (the low 32 bits of the PCIe bus
address) is being modified from 0xe0000000 to 0x10000000.

Could the commit message be updated to correctly reflect that the PCIe bus
address is being changed rather than the CPU address?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820083620.8772=
51-1-hongxing.zhu@oss.nxp.com?part=3D2
