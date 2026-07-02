Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD82306774;
	Thu,  2 Jul 2026 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986125; cv=none; b=T32LlNpl+MkyWGKgFdzUvs3rWh1ZG1b5xeUEwwPY1JX80GW3sYMY9EZglBHcccGxdRbuWDeS+OQjXGQnfYvEUm8MTy4dxhEvXRssb+HykrC5o3+ioV1cYW2nI3LCCSGOsONARw3g8uF95PPVY7bhvp5UgsfqcOnof0umRgr70b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986125; c=relaxed/simple;
	bh=nrsSXByDeB/cR8BunGHXfc5bl61AMiqMeJEiWiKt0Gc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R53XsufKG4ZR/sJYjlgGcjRQ9KO/LdIhlzO+hiovL9ke8F9OOlG6Hju/AtCRrHoShMAsh4joqGnZFb7bnQwTl2+LwkfeLdPasP6Pw2QI/XPX3WTmqNenOBaU35Gokcaxu4PO4mnFXQVgCs2eZ9D+1wKYwcu+hlBBKhIqJRkOxeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F51u8RUG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F51u8RUG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADBC1F000E9;
	Thu,  2 Jul 2026 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782986124;
	bh=+j8pUhCV99LuUf8tIvIbLdu3rz20xnRwraVDd76JB+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F51u8RUGuhQGE72aiWIMrMTNhZsCBHFdD4p3EBN6fi00E7Cl+uR35FQ/t4O/au/rq
	 8vcAjtD4eDwGb/eluE2gPCVi1iRaC5dfWG6jzLUkBlCsuzAz70W0ZlEXyjjQbolwNM
	 J+ULXdAO89MtNwJjosOrY83wNeG67Q/rKtIgSYddFwtFFrWkv8Uvl2CqIdr2w7Ych5
	 fEj1ZbnE9SRtlxbknVIdArwmSy0DYTan2Ibu/FJkaAbmcaVK/EAf0yNxcJEMMo+HaC
	 zHDc9pRrrPlmqO5x+x1J1yreX8a+aFBo14GTYY2bxHVto7ZeciOoxzVthhQ36VaYNV
	 jOdHSJI+yL77Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/18] arm64: dts: ti: k3-j721s2: Add overlay for
 DS90UB954-Q1EVM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260702093123.1048575-16-y-abhilashchandra@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
 <20260702093123.1048575-16-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 09:55:23 +0000
Message-Id: <20260702095523.CADBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing build target for the J784S4 EVM using the UB954 overlay.
--

commit ad82842381a6b0a7a7dca389cbef513840daf997
Author: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

arm64: dts: ti: k3-j721s2: Add overlay for DS90UB954-Q1EVM

This commit adds a device tree overlay for the DS90UB954-Q1EVM deserializer
board. It enables connecting FPDLink-III based sensors to TI EVMs by
aggregating data from up to two cameras. The overlay is integrated to suppo=
rt
the J721S2-EVM.

Link: https://www.ti.com/tool/DS90UB954-Q1EVM

> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Mak=
efile
> index aba187384009f..697d13b13b19e 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
[ ... ]
> @@ -346,6 +347,8 @@ k3-j721s2-evm-fpdlink-fusion-dtbs :=3D k3-j721s2-evm.=
dtb \
>  	k3-j721s2-evm-fusion.dtbo
>  k3-j721s2-evm-pcie1-ep-dtbs :=3D k3-j721s2-common-proc-board.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtbo
> +k3-j721s2-evm-ub954-dtbs :=3D k3-j721s2-evm.dtb \
> +	k3-j721s2-evm-ub954.dtbo
>  k3-j721s2-evm-usb0-type-a-dtbs :=3D k3-j721s2-common-proc-board.dtb \
>  	k3-j721s2-evm-usb0-type-a.dtbo

[Severity: Low]
Does this Makefile omit a combined build target for the J784S4 EVM?

Looking at the newly added overlay file, the comment explicitly mentions
support for the J784S4 EVM as well:

arch/arm64/boot/dts/ti/k3-j721s2-evm-ub954.dtso:
    /*
     * DT Overlay for DS90UB954-Q1EVM FPDLink-III deserializer board on J72=
1S2 and J784S4 EVM
     * https://www.ti.com/tool/DS90UB954-Q1EVM

Without a corresponding k3-j784s4-evm-ub954-dtbs target here in the Makefil=
e,
the overlay is not validated against the J784S4 base DTB during the build.
Should a build target for the J784S4 be added to match the intent stated in
the overlay header?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702093123.1048=
575-1-y-abhilashchandra@ti.com?part=3D15
