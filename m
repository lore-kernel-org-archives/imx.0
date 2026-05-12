Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A785B383309;
	Tue, 12 May 2026 03:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557682; cv=none; b=eymSmMx/ZGvy4CiemLjvemsGDzFKnLEH3zX71gv8GH1GReSZVe7crc/pHxeDWXR9JWCfY9JyirG/1ZlG+3hKjF5Id6nfFxeSS1fnOEvo2YkNm74qPztA4bPLQoz3S9JVvvKIQiH5MrBq4FNkL6P96CZmBTSZZpfLaWWAuHiAUI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557682; c=relaxed/simple;
	bh=nG157jKMYBa7xM0NI2PbeEgV9zZsCwwL5OZpeKGj6Xk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IylQpuFeFB7uuleX1YZe16r8T+3s1B3srB2pDM7jor87ulc8ajPRr2fTMnB70k3mS8bEDF7dNScOKgByF+I7NH33qUgTxlV9nYxgmPCVO4nXOjMyiZ+h8G0s2SGCOEL98JnLeVQRfHdcFaKEaRwUZmcTIc5GSL52A+fGul7dTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8pDjods; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8pDjods"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBFEC2BCB0;
	Tue, 12 May 2026 03:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778557682;
	bh=nG157jKMYBa7xM0NI2PbeEgV9zZsCwwL5OZpeKGj6Xk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=W8pDjodsNvgGdHogsIZTdaJuPFnOPx/jC6saApExUU4Y1lB1nQRFZYnBV0EcY9C1X
	 xd9mwTBSN07asUKIW4EmMaYFJnF/X0b5g0TTVspK609YkU3Ig5SxepyLXhJgrnvBnD
	 bgmPAjWu8FmfzXbDsZELUGYRLWia3yDvCzbjHlwu1WcGn0T7lVY/JGwMhdCbWg724d
	 qpGvGcJYUvmZhHopA0jD5425h4wI7hR+frF//Hjf3bHfyyJ4zuojJD99Ykh3jLMRaW
	 H8gJPPQHjQBQk59OfghHd4A6NO4jPi6xf+M8K4XPOq76fX9OAGNqqtwN5an7T5mkYG
	 iaLbVuQJUgQzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: imx8mq-librem5: Correct link
 frequency list
Reply-To: sashiko@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260511090924.269106-6-mitltlatltl@gmail.com>
References: <20260511090924.269106-6-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:48:01 +0000
Message-Id: <20260512034801.ECBFEC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Strict equality check failure due to integer truncation precision =
loss
- [Medium] Device Tree ABI / Backward Compatibility break
- [Low] Mathematical error in commit message derivation
--

commit e44214657fa2d9bae2190f57c8fa133a21051c14
Author: Pengyu Luo <mitltlatltl@gmail.com>

arm64: dts: imx8mq-librem5: Correct link frequency list

This commit updates the device tree binding for the imx8mq-librem5 board
to correct the supported link frequencies for the hi846 camera sensor.

>     According to the hi846 datasheet and the register lists, they are
>    =20
>     mclk / prediv * multiplier / post_div1 / post_div2 =3D
>     25Mhz / 3 * 90 / 1 / {1,2} =3D 187.5Mhz, 375Mhz

Is this calculation completely accurate?

Mathematically, 25 / 3 * 90 / 1 / 1 equals 750 MHz, not 375 MHz. To achieve
187.5 MHz and 375 MHz, does the post_div1 divisor need to be 2 instead of 1?

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mq-librem5.dtsi
> index eee390c272105..959a5c8dcd0d3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi

[ ... ]

> @@ -1122,7 +1122,7 @@ port {
>  			camera1_ep: endpoint {
>  				data-lanes =3D <1 2>;
>  				link-frequencies =3D /bits/ 64
> -					<80000000 200000000 300000000>;
> +					<187500000 375000000>;

Could this exact value specification cause the driver probe to fail due to
integer truncation?

The hi846 driver calculates the expected link frequency using the formula=20
mclk / 3 * 90 / post_div1 / post_div2. Because mclk is exactly 25,000,000,=
=20
the C integer division 25000000 / 3 evaluates to 8,333,333. After the=20
subsequent multiplications and divisions, the evaluated link frequencies ar=
e=20
187,499,992 Hz and 374,999,984 Hz.

Since hi846_check_link_freqs() performs a strict equality check against the
device tree values, this mismatch could cause it to reject the frequencies
and fail probing.

Additionally, does completely removing the old values break backward
compatibility for older kernels?

Prior to the driver update that dynamically calculates link frequencies, the
hi846 driver strictly required the hardcoded frequencies 80000000 and
200000000 to be present in the device tree. Appending the new values while
keeping the old ones might preserve backward compatibility.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511090924.2691=
06-1-mitltlatltl@gmail.com?part=3D5
