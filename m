Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B923F270ECE
	for <imx@lists.linux.dev>; Fri,  9 May 2025 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778643; cv=none; b=TIWCypNapmETXfWqLnyavLYscu2JQ1JY4sV+5Hu+dXTPaBZ4K9/Qzd4liRramu++z6YOmdC/4ZdddXTdISEKgmOKllHWbCadnCFIXo9sDQxUnoQNKzRrBgE0q2chtskfWozT9tiF4nIlUx/jzr3AKvRgvOVH+J3I8d7oJ7cYWkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778643; c=relaxed/simple;
	bh=GmgLDcYQyIw/YSz839e+qQM5KL6RDCNHqO2F1hLqyEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkAGS1/nvvxXsbrMeollOfVqwN8v2HyBtrr6RZeimiuucJOAZ40ARov2D44cQEqQx6XXXVnBNVaRgWF4w0ctFUeJBpgvepq+h3zVICxUGN+02hSHxh3g5H0u239gRQqDbbehqBGH/Ubvai2hTbNOCdEXQmqsdQX/xMvaMxRB/jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=YlaJVlDD; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="YlaJVlDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=NayRbH+Za6jxrlNZRjNmkKSqs2Xv5DXjaUGWLMkJCjA=;
	b=YlaJVlDDmaVnGqHNZVFamQwncF6km7Bx+FItRKfR6TspwW098A0Gi/STDfSGNh
	53Jc+stXuN+KoneyrNrCEGUJYaSHct5O1gKM4V/8paX/mrQQK8FptEj0dGhKgrMk
	IhxHMPaESFJinRDI0mdIYQLMs87pgjUJ5lC4zD6SpatFs=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnPuNhtx1ojC+mAA--.27459S3;
	Fri, 09 May 2025 16:05:55 +0800 (CST)
Date: Fri, 9 May 2025 16:05:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 2/8] arm64: dts: imx8mp: Add pinctrl config definitions
Message-ID: <aB23YOkCMnA4F3hV@dragon>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
 <20250417-initial_display-v6-2-3c6f6d24c7af@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-initial_display-v6-2-3c6f6d24c7af@gocontroll.com>
X-CM-TRANSID:Mc8vCgAnPuNhtx1ojC+mAA--.27459S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW5XF1kWrWrGryUuF45ZFb_yoW5Gw43pF
	yqkry3Zr18tF47Gw1Sv3Wayrs0v3Z3XF47u3y7WrW5tF4DAw18XF1Ygw4Ygr1Yqrsag3yF
	9F1qvw1I93sxGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeE__UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgVIZWgdtb4IEAAAsc

On Thu, Apr 17, 2025 at 12:14:03PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
> register is written in the dts, these values are not obvious. Add defines
> which describe the fields of this register which can be or-ed together to
> produce readable settings.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> This patch has already been sent in a different group of patches: [1]
> It was requested there to submit it along with a user, this series also
> includes some users for it.
> 
> [1]: https://lore.kernel.org/all/20250218-pinctrl_defines-v2-2-c554cad0e1d2@gocontroll.com/
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 33 ++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> index 0fef066471ba607be02d0ab15da5a048a8a213a7..19a23d148246f4fb990050a9d06d20b6e769f254 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -6,6 +6,39 @@
>  #ifndef __DTS_IMX8MP_PINFUNC_H
>  #define __DTS_IMX8MP_PINFUNC_H
>  
> +/* Drive Strength */
> +#define MX8MP_DSE_X1 0x0
> +#define MX8MP_DSE_X2 0x4
> +#define MX8MP_DSE_X4 0x2
> +#define MX8MP_DSE_X6 0x6
> +
> +/* Slew Rate */
> +#define MX8MP_FSEL_FAST 0x10
> +#define MX8MP_FSEL_SLOW 0x0
> +
> +/* Open Drain */
> +#define MX8MP_ODE_ENABLE 0x20
> +#define MX8MP_ODE_DISABLE 0x0
> +
> +#define MX8MP_PULL_DOWN 0x0
> +#define MX8MP_PULL_UP 0x40
> +
> +/* Hysteresis */
> +#define MX8MP_HYS_CMOS 0x0
> +#define MX8MP_HYS_SCHMITT 0x80
> +
> +#define MX8MP_PULL_ENABLE 0x100
> +#define MX8MP_PULL_DISABLE 0x0
> +
> +/* SION force input mode */
> +#define MX8MP_SION 0x40000000

Can we have all these indents aligned on the same column using tabs?

> +
> +/* long defaults */
> +#define MX8MP_USDHC_DATA_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | \
> +								  MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)

Can we indent like this?

#define MX8MP_USDHC_DATA_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | \
				  MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)

Shawn

> +#define MX8MP_I2C_DEFAULT (MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | \
> +						   MX8MP_PULL_ENABLE | MX8MP_SION)
> +
>  /*
>   * The pin function ID is a tuple of
>   * <mux_reg conf_reg input_reg mux_mode input_val>
> 
> -- 
> 2.49.0
> 
> 

