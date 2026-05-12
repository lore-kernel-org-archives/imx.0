Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23D83CE48F;
	Tue, 12 May 2026 05:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778564746; cv=none; b=KFd7yKi09C5cdYOXYVjGvNqH2HmY9uwYoD9OPCBFNXC+mitm46ZKojO0XbO8e6B+rctnVk1zt5awf5Wx3GOxVSgt8jwhW0exwK8TAc6y+OIhEHUJFrgADBiFKUSGvjytYzx0EHSM+wkMLPaMK43fyu3alNYe2r1bGbEz0gmem7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778564746; c=relaxed/simple;
	bh=m7eqOE7dz6YTHppZE7h30fUHc1l55jXnJs7JnS92WRU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OW+dAoPwX6B6DTr6qUvi990bCGOkd/sp96qBxMYFHeg1xDxDMglsYXft4BCdFMY0BGyVnCZwI+Ac0LtoaZzfw9OMIUjthkbgBjve0dUAlMxXxUWtj5Ok2ZR2LduDhJ+ENic5WADwWet+ZKOn8fbm6R6ICQ0njdnA9AN/iSiyTEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEEd//dZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEEd//dZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF297C2BCB0;
	Tue, 12 May 2026 05:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778564743;
	bh=m7eqOE7dz6YTHppZE7h30fUHc1l55jXnJs7JnS92WRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UEEd//dZFk4EfiXKbX7kmKqVy582CEydqr01/mcT3krWetN5oMX7xSc/zksdfua88
	 YY9mOikxSDZjTGjNGni4Yo/RVUth8hvOVLRFXZX+cEM3A+qyBQ489N1h3JVv4PssdM
	 MdXrf3/82/OD0IslNAK7qZgOzOUhM9eJmnf0QJ7mhABWVMVJFKX19xjMtRV4HuBSG1
	 EABEkhKHOQzRhAYKhGGKbZe7+kcv3VepMIgq+xMaN5X5jCLEoinFVoadkDiBWdp6dV
	 83uHBOa4bcHoHdYcqLMK3w+R7GdggFZhtRHooKB7HuPjahCnD0hUK9mnM58cyhozdO
	 Xq6bKqRibyRTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: imx8mq-librem5: Correct link
 frequency list
Reply-To: sashiko@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511103927.279550-6-mitltlatltl@gmail.com>
References: <20260511103927.279550-6-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 05:45:42 +0000
Message-Id: <20260512054542.DF297C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The exact link frequencies of 187500000 and 375000000 will fail th=
e exact-match validation in the hi846 driver, causing the sensor probe to f=
ail with -EINVAL.
- [Low] The arithmetic formula provided in the commit message is mathematic=
ally incorrect and misrepresents the driver's internal logic.
--

commit 1a95e1bc9a680037635b3deded93622acb02b6ed
Author: Pengyu Luo <mitltlatltl@gmail.com>

arm64: dts: imx8mq-librem5: Correct link frequency list

This commit updates the link frequencies for the hi846 camera sensor on the
imx8mq-librem5 board to match the expected values calculated from the mclk.

>     According to the hi846 datasheet and the register lists, they are
>=20
>     mclk / prediv * multiplier / post_div1 / post_div2 =3D
>     25Mhz / 3 * 90 / 1 / {1,2} =3D 187.5Mhz, 375Mhz

This isn't a bug, but is the arithmetic in the commit message correct?

Mathematically, 25 / 3 * 90 is exactly 750. Dividing 750 by 1 and then by 1
or 2 results in 750 MHz and 375 MHz. To arrive at 187.5 MHz, the division
should be / 2 / 2, which corresponds to post_div1 =3D 2 and post_div2 =3D 2=
 in
the driver logic.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mq-librem5.dtsi
> index eee390c272105..959a5c8dcd0d3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> @@ -1122,7 +1122,7 @@ port {
>  			camera1_ep: endpoint {
>  				data-lanes =3D <1 2>;
>  				link-frequencies =3D /bits/ 64
> -					<80000000 200000000 300000000>;
> +					<187500000 375000000>;

Does this regression cause the sensor probe to fail with -EINVAL?

The hi846 driver dynamically calculates expected link frequencies from mclk
using the C expression: mclk / 3 * 90 / post_div1 / post_div2.

In C, operators with the same precedence are evaluated left-to-right. With
mclk configured to 25,000,000 Hz, the division 25000000 / 3 occurs first
and truncates to 8,333,333.

Subsequent multiplication by 90 and division yields 187,499,992 and
374,999,984 instead of exactly 187,500,000 and 375,000,000.

Because 187500000 !=3D 187499992, the exact equality check in the driver:
    if (link_freq =3D=3D ep->link_frequencies[j])
will fail.

This rejects these mathematically ideal frequencies and aborts the probe,
breaking camera initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511103927.2795=
50-1-mitltlatltl@gmail.com?part=3D5
