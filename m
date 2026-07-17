Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3985F31A55E;
	Fri, 17 Jul 2026 05:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265928; cv=none; b=tGxEcx/C4DKMN2KLPsKaADCocn8BbIxobF2d3NcpXyLNzgoq8uwgKfbPsC2tfZ1FHzAzGTirIICUozCJc/yjjwnLFL8DflJKtg4azqkOrp1sbG/mYhzpzw5s155OpdkxxgMRgBangTLpS1YChc155ORi0y0Cj3+DlAzKb7e4tmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265928; c=relaxed/simple;
	bh=ruQsL9jmUaFcewkFFLwNpFb1ohS929eznb/Tjh8JlqE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jSAPBGQpzJtwS7tFqNnTmPj9ZFuUaTVsITqmgi48YSyXKyprarSNDECaGhG6wxWLRQG0K2sR8aDSa2Ri8rVs7DNHeTvXCQoaENlRmhz65hQsFrbbo4U7VFwI98la2XYNXASMbM2VCklGevTBU4RsKGC/K5WvNotyrulelpLylAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3LqnIg2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3LqnIg2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF851F000E9;
	Fri, 17 Jul 2026 05:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784265926;
	bh=ruQsL9jmUaFcewkFFLwNpFb1ohS929eznb/Tjh8JlqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b3LqnIg2QxUxuuiXKYmGA3XALzME1z3u8bA45xjNijSBJHcJ1uTPAhtskqGW8NLwi
	 JJKbIhI4J1YEMvely1VGESZqHrxxX/j/HjLzuNpvdzV1b45gzfey4w7i40eEAiAP6R
	 xVlEIFpJWMXpCx6ZfZW4S9hfpSE3Cn/9NgQ+vE07tOWPVtdieIIulyAcu18zjcPYqX
	 IrF2CAR9dymg3Z8pRM8GL0aKSjSrMz7E3ldkVtbH3Ed87e/XaC2SX1XV54bLV4heAL
	 wnTJaRuXOAJ/hwm1B5dM0FPZ6gHCBLIrCDBdYotVlvg/FuUhn17fBryRDjym4wnqEz
	 fdOQIONEqJq3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: imx93: Add i.MX93 Wireless FRDM board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Guo" <qijian.guo@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260717-imx93w_frdm-v1-3-0cca6c0ba2f5@nxp.com>
References: <20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com>
 <20260717-imx93w_frdm-v1-3-0cca6c0ba2f5@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 05:25:26 +0000
Message-Id: <20260717052526.7BF851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The i.MX93W FRDM device tree inherits an invalid Bluetooth confi=
guration intended for an absent M.2 module, while omitting the correct conf=
iguration for the integrated IW610 chip.
--

--- Patch [3]: [PATCH 3/3] arm64: dts: imx93: Add i.MX93 Wireless FRDM boar=
d support ---
commit 54467df83181ba6647f33372016b6a5139213211
Author: Joseph Guo <qijian.guo@nxp.com>

arm64: dts: imx93: Add i.MX93 Wireless FRDM board support

This commit adds device tree support for the i.MX93 Wireless FRDM board.
It reuses the common FRDM device tree include but overrides specific pins
and configurations due to the hardware switch from an M.2 module to the
integrated IW610 chip.

> diff --git a/arch/arm64/boot/dts/freescale/imx93w-frdm.dts b/arch/arm64/b=
oot/dts/freescale/imx93w-frdm.dts
> new file mode 100644
> index 0000000000000..766e942fe6638
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93w-frdm.dts
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx93w.dtsi"
> +#include "imx93-11x11-frdm-common.dtsi"

[Severity: Medium]
Does this file need to explicitly disable the bluetooth node inherited from
the common dtsi file?

The imx93-11x11-frdm-common.dtsi unconditionally enables the M.2 bluetooth
node on lpuart5. Since the M.2 module is removed on the FRDM-IMX93W board,
will the kernel attempt to initialize a non-existent device and inadvertent=
ly
toggle I2C IO expander pins intended for the absent M.2 slot?

Should the lpuart5 bluetooth node be marked disabled here, and a new node
added for the correct IW610 Bluetooth interface mentioned in the commit
message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-imx93w_frd=
m-v1-0-0cca6c0ba2f5@nxp.com?part=3D3
