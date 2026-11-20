Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173101;
	b=yf/xrPvYZ5ipACTjIdbegsNCly+eR3HBBeddxlZrlMC9+ZkFOKiL38SKEwwJx4sTcSci
	 EZEuwBXEuT7ueWRsTPjP9igmBphzaDervZylg8mdeX+Zbznjjl/cBC3rRPNlOT/mDw5hv
	 I/TWFytOf2047vgJy5s74ShOilDU3I9ynh1HuGLpViP9UhdW2j8EOedzvS9f8X/FT8k0j
	 17MZKe73ctNQbG0nH39FVedlhlArnkIG4ybMZitbHzmgk3Q7VjIY2ZX+B22hLcfHymJA3
	 oMn8A4Fg3baUcfXbpi9d/cuH+/tYimjGknFzQqPkJ7RWAY1q5H4Xcy18xZpl5IfkY2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173101;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WEPvj8d3PATCiVa1j9brmEZDP8NcS7Tx0q67fLg4s1U=;
	b=DG32kpeyR/Os9dslSIKJbElgB7SnI9Jkjp6D4ETW27mjpz7GT3H/TT6osFPfOXH4AUny
	 X4MRxnScNZT2Vn7bDupUAoUlfj2W9liFb6k0yHTJbZQGAj3zTxPqI52v+9DxNcbmnv5Fk
	 EvoQSgtGaZA03JuGeOgA48v4i0z6g5MtefLzcfenjGvU2vcY9yhbZgTO/C8tsXEjAe7Y3
	 BFaXG00bcHP0v40gI3cMe7GB9ef8s7OOL2CEQIlmDr7ZfwDmEiwS6JgY21m2LerbjD/hk
	 hgbHArQn2HdL8lQUrCxE34slTgGVOAUUU06aN7/ftwAiGi73WzCpUyZmhUEyOhJnrtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4AuZUK+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D304360A2622;
	Fri, 20 Nov 2026 11:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I4AuZUK+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195DD1F00ADE;
	Fri, 20 Nov 2026 11:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173101;
	bh=WEPvj8d3PATCiVa1j9brmEZDP8NcS7Tx0q67fLg4s1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I4AuZUK+nVRq19sQM6JjJhf8zfykKUyVjqidJnIlsKqfPSvD6wmdUvAFnl9X88Z3D
	 Ev1x+fRYDomssAzWGwXB5B0IPa5js8urZ6d8W8vGtEwc1iKI39uxpzOjxfzkFM8Y58
	 A8NJAvjx7xHbDwPzA36Gkq5PfG0gpRo+z3A+vcq1hSnrOMzTQnU7xE0jr4mIrMiswc
	 yAxqqqZAGu5vH04uKLMLjtDtend8TzeQbcfShy0MkNMUHzXWWv+hnRm7+cWDg1qdSV
	 oWuydwnAC1vitTbSJ/eF/OfZORu/ksA9C07pzbKb2b3FrxCzFSYqlQfY6Cvj7TPFxX
	 SrAhbUakhTEow==
Message-ID: <sashiko-outbox-224996@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: freescale: add i.MX937 FRDM board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261120-b4-imx937-frdm-v2-3-5e27ceec02df@oss.nxp.com>
References: <20261120-b4-imx937-frdm-v2-0-5e27ceec02df@oss.nxp.com>
 <20261120-b4-imx937-frdm-v2-3-5e27ceec02df@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:11:40 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: freescale: mismatch between imx937.dtsi GPU OPP
  and commit message
--

commit afd999f203571f5f314e686dbc42facdd65a3d63
Author: Joy Zou <joy.zou@oss.nxp.com>

arm64: dts: freescale: add i.MX937 FRDM board support

This commit adds imx937.dtsi and imx937-frdm.dts, reusing imx952.dtsi and
imx952-frdm.dtsi to support the NXP i.MX937 FRDM board.

> diff --git a/arch/arm64/boot/dts/freescale/imx937.dtsi b/arch/arm64/boot/=
dts/freescale/imx937.dtsi
> new file mode 100644
> index 0000000000000..7912a9c282d8c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx937.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +#include "imx952.dtsi"
> +
> +&gpu_opp_table {
> +	opp-1000000000 {
> +		status =3D "disabled";
> +	};
> +};

[Severity: Medium]
Should imx937.dtsi disable the 1.0 GHz OPP in gpu_opp_table, or does the
commit message describe the wrong hardware difference?

The commit message states that i.MX937 drops the local dimming and ISP
blocks and runs its Cortex-A55 cores at a lower maximum frequency, with no
mention of the GPU.  However, the only override in imx937.dtsi disables
opp-1000000000 in gpu_opp_table, which is the operating-points-v2 table
for gpu@4d900000 in imx952.dtsi, capping the Mali GPU at 800 MHz while
leaving Cortex-A55 frequencies managed by the IMX952_PERF_A55 SCMI
performance domain unchanged.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-b4-imx937-=
frdm-v2-0-5e27ceec02df@oss.nxp.com?part=3D3
