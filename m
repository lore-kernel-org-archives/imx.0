Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B052D1FF7D1;
	Mon, 16 Dec 2024 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734344124; cv=none; b=THb6juqH9Xdgr9WNQnr05tmfxSxZ5WGhrLr9ljgEyLe5si7hvJ9O9BfMO84Ibm1eC4Cq6b9wR0vvlHZnVO92boBNRGKyqwUkXHP/v5xK9bJ8U8CTjOsX6d16v+SqvK/aR2z1ipSAy73llHRitYNqtXoWvJlraMW1cSmMesxndVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734344124; c=relaxed/simple;
	bh=xBL/Ai+09SBq1LqnT0gwmOi4aMFDp3mfzJuqznKFiEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAE/sA1CFeNFuIw+VEOuBk2GkvfuX+TxhLxuE6OanaypRzA+7mFHJrFgrJLLmJlMbGhpS1/JQ84vCn+LAvGcWCsU6bF3KJxy0bzjdbjsak3eiPdEZIKew8tJsheIYROUFaGjJw8QuAiPlmf4XtiAU/MQkk5b2Q3A0mYnwn4Ym8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+OiWbJ7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+OiWbJ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F2AC4CED0;
	Mon, 16 Dec 2024 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734344124;
	bh=xBL/Ai+09SBq1LqnT0gwmOi4aMFDp3mfzJuqznKFiEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+OiWbJ7It/yYoXyptEOyUyAUxSofMveQJjItgtbGR+izni0//d+xHQpCWN6PApS6
	 H/Qrdzm9k49R77Y8b3KHfCSVrA2ojc0Fjp6esBDsBQMb+1CZGlcEIzU9La7HkqoOIm
	 8vf0wVoehQQRkh0sTzXDFwr84bp5atvo63+5txAgoMfFQ/sg5CvRjcEXaRRUxsjQdc
	 7s5XqKlzAtRoQcth5y5/AOlHQwBUXtL9+QTEFpeOcqkD1ep3ESrzuG3MPYa9U9JXGS
	 kA/GZaCPCYPuLoP2ntPbpa8OsYkXgO/BmOt0kQdpOo6iUA3QbERR9O/lT+pdtY231H
	 ER57yclsr52SQ==
Date: Mon, 16 Dec 2024 11:15:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Bai <ping.bai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com, peng.fan@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH] arm64: dts: freescale: Add basic dtsi for imx943
Message-ID: <z6udhrqfmbelspe3eiz2q6twqvn4nkgxnfsdyxdv7ow6llxiz6@qhbaobn63icb>
References: <20241212093555.1376568-1-ping.bai@nxp.com>
 <20241212093555.1376568-2-ping.bai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241212093555.1376568-2-ping.bai@nxp.com>

On Thu, Dec 12, 2024 at 05:35:55PM +0800, Jacky Bai wrote:
> The i.MX 943 applications processors integrate up to four
> Arm Cortex A55 cores and supports functional safety with
> built-in 2x Arm Cortex M33 and M7 cores which can be
> configured asa safety island. Optimizing performance and
> power efficiency for Industrial, IoT and automotive devices,
> i.MX 943 processors are built with NXP=E2=80=99s innovative Energy
> Flex architecture.
>=20
> This patch adds the minimal dtsi support for i.MX943 with
> peripherals like uart, edma, i2c, spi, mu, sai etc.
>=20
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-clock.h  |  196 +++
>  .../arm64/boot/dts/freescale/imx943-pinfunc.h | 1542 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx943-power.h  |   41 +
>  arch/arm64/boot/dts/freescale/imx943.dtsi     | 1284 ++++++++++++++
>  4 files changed, 3063 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-clock.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-power.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx943-clock.h b/arch/arm64/bo=
ot/dts/freescale/imx943-clock.h
> new file mode 100644
> index 000000000000..64b9d5d4051e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx943-clock.h
> @@ -0,0 +1,196 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#ifndef __CLOCK_IMX943_H
> +#define __CLOCK_IMX943_H
> +
> +#define IMX943_CLK_EXT				0
> +#define IMX943_CLK_OSC32K			1
> +#define IMX943_CLK_OSC24M			2


Why exactly are you adding clock indices to header files? Nothing in
commit msg explains that.

Best regards,
Krzysztof

