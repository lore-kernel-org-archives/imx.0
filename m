Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E6B148858
	for <imx@lists.linux.dev>; Fri, 29 Mar 2024 12:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711715330; cv=none; b=WeYE3WsTqnOcZsFH9URp8YU92cwnT0eHFaX7cAnPDYdrr3xWCjCOEhGMXiOBqZXeo+4EZqWTL3P2DSfTAOZsadv7JB9bhX/0kwUt/TO9ygOKksA8pGMkABonYNBEsdFnf2DD2uJeVYY7FElTWCS+bd8l8wcXB5EW4i4NWesZFAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711715330; c=relaxed/simple;
	bh=764c3pjO6u5CEwXzE5Ddk/WTGKPMneIjFGs1pBnqEVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gb7zjuQ5YNNc+Cul5rT4FFOEgQ2OZ/mU4dbhqG1rqf8cSdgxuYWPZ3PZlVjc/hchyFDmo2CuJixlY5Q/8kDWaUMVlElkhK5u4f68rgKBSEpTYrCO1LBNz7DO8JTx3Uir/Krc/cngCZ6UCcrEHzwQ80Ac9tidDg2gn6gWfZYLoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=A6JWQORY; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="A6JWQORY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LGyBgMV35yeeHHBEgeXzXGS0G5EIZCLqefBgjneqAWo=;
	b=A6JWQORY4YFGFIHy0WRDX4l8vTe1JOogRDHRkDWgOCnDR8y6QWGLvIadIP+i3q
	ptuJRgXdOB2KqYThCcXIWl1EosjQdxZMvXaOSoTb9I9mDT/D37TtQJwhBlLvIsLT
	M8ijXCsi2q5OlXuZoyjWQYMpGYDOno9avUW7n+z3e6lmA=
Received: from dragon (unknown [183.213.196.225])
	by smtp2 (Coremail) with SMTP id C1UQrADnTxnOswZmO0ZqAg--.19469S3;
	Fri, 29 Mar 2024 20:27:59 +0800 (CST)
Date: Fri, 29 Mar 2024 20:27:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: imx8dxl: update cm40 irq number
 informaiton
Message-ID: <ZgazzrWidHHn6eg4@dragon>
References: <20240305-m4_lpuart-v3-0-592463ef1d22@nxp.com>
 <20240305-m4_lpuart-v3-3-592463ef1d22@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305-m4_lpuart-v3-3-592463ef1d22@nxp.com>
X-CM-TRANSID:C1UQrADnTxnOswZmO0ZqAg--.19469S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF43Aw4xCr47GF1rCFy5XFb_yoWkXFgEy3
	WxWw15Ja4rAFZYyas5Krs5XryUK3yxGr95Xw1kWF4DWa4vvF909Fs7Jan5Jay3WFWjkryD
	Ca1rXr48A34agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0I38UUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBRGwZVsVCawBUQAAs6

On Tue, Mar 05, 2024 at 10:54:57AM -0500, Frank Li wrote:
> Update cm40 irq number for imx8dxl chip.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

s/informaiton/information in subject.

Shawn

> ---
>  arch/arm64/boot/dts/freescale/imx8dxl.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> index 9d49c75a26222..b9d137d69f5a7 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
> @@ -243,3 +243,14 @@ xtal24m: clock-xtal24m {
>  #include "imx8dxl-ss-conn.dtsi"
>  #include "imx8dxl-ss-lsio.dtsi"
>  #include "imx8dxl-ss-ddr.dtsi"
> +
> +&cm40_intmux {
> +	interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +};
> 
> -- 
> 2.34.1
> 

