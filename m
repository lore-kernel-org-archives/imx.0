Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336064;
	b=wiifpnyxtqalqdYRQKkqiyszQ3ktNcWL06tLb28R1AGGfaT6W9fPGgovFdX1UYBFAcrx
	 gjQxT6S+UECJ03ABsXAnK72vU0Xtkr/i188x+JPLZv27HwFsttpNW1gdvTIKoamHmcn9/
	 iC/6P+VFoS6cvm7v5xROch86PNwPOGU/pwOb/B6XBoKShH6MRsoecrfIBtUGAKO0ay5Mc
	 fY20yzqEPc0RlL7X6a7FiFo65s3VLty/bZNFa4WtaQTnlEcrYqjSslhTsoDw0K2yW6dqo
	 tj7XjZ3Vb2/wam/8oX6uT5FK84cb4QTMliFfOJu02d4+JxiNiA0dmWZ8OmrUGxIAIgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336064;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=efq+sMbzNjZyhwXfbjg8VWkqug3+OI3tsebeW4D/PIU=;
	b=cpLVu+dPvFsd9XfkZct4tY8dpThbvNNARey/9fgVXBjEOC7mDuhIpLTvHrz7DEQdMRA6
	 ydf/JBqvv7M9lKgHDaI1JCIWnpyPnB5fPHBCG0NTeunrzGnxc9ckMkIoyxVDMoKZpy4/p
	 nBScdZ43Ji9+sOaaeTZ/yxhRzWXlmlC6kVNpNYLn5em7Ny9VJDh6h+Tl6z0L3r/xDWWxR
	 siu3R2bL+Hjw2Z5iH0NFs7usRBeNhTjuEI+L6DnIwfGY8ir8+CC8OZEfjzmotH/U0gCy2
	 bL3eAfWIksVYJCXTUFQLfkcVL/kwNhMDrxRH2kFqCy93k8HK0t8kbv95Ns3JWvU6jEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CR/Vvyc2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1363760A3801;
	Tue, 10 Nov 2026 18:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CR/Vvyc2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993961F0089F;
	Tue, 10 Nov 2026 18:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336063;
	bh=efq+sMbzNjZyhwXfbjg8VWkqug3+OI3tsebeW4D/PIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CR/Vvyc22RD2JiePxg+38VVtT9e+8/bE4LPXBV9gnT7T1G5bqbQq+p2COFmXXLApM
	 cjJQWTflBCoTIM4dTORPYiABScB+IWbKm00ZBMTedVLf6Zf5pTntWqz8amVAqaDiLL
	 6PaldL+MoV8VB+KpjPKOTeH5jOP7uTYIht3GvzatE7CbK2aSP/tldrx6Rmi57uv8Mz
	 lbv/obyLnK1EjEHG21piRASXLaeFSvtn3z0ibeqNeioBbgxHa7rIZ3whQZKvzGXAMS
	 NfaM9oGnfPdL54LmqN+clhtdFAFvICbLmSEjnKHPKJ5Jc2HVH8t/iCHq+fQhmUSxbs
	 VFxsPi5QJKa3Q==
Message-ID: <sashiko-outbox-207596@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: imx8mp-var-smarc: Add support for
 Variscite Echo board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <3cb427c8d5c6244cebeca5310bd03171f5685edf.1794334398.git.stefano.r@variscite.com>
References: <cover.1794334398.git.stefano.r@variscite.com>
 <3cb427c8d5c6244cebeca5310bd03171f5685edf.1794334398.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 18:41:03 +0000
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
- [Medium] arm64: dts: imx8mp-var-smarc-echo: missing uart-has-rtscts on
  uart1
--

commit 2120b57aa36b03b0bbf74c4c8b3c605d83172578
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board

This commit adds a device tree for the Variscite Echo carrier board paired
with the VAR-SMARC-MX8M-PLUS system on module.

Link: https://variscite.com/carrier-boards/echo-board/

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts b/ar=
ch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
> new file mode 100644
> index 0000000000000..341d8af16cd82
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts

[ ... ]

> +/* Header */
> +&uart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart1>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Should the uart1 node include uart-has-rtscts?

pinctrl_uart1 muxes MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS and
MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS, but without uart-has-rtscts on
the node, imx_uart_probe() leaves sport->have_rtscts false.  As a result,
imx_uart_set_termios() clears CRTSCTS and imx_uart_startup() ignores the
RTS pin, leaving hardware flow control and RS485 unusable on uart1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794334398.gi=
t.stefano.r@variscite.com?part=3D3
