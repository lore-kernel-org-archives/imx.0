Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7F713A865
	for <imx@lists.linux.dev>; Thu, 28 Nov 2024 07:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732778953; cv=none; b=IJb6wycR/V4I/9r8TWjIPoXnqhdhyNNQK0kYbWBxR4rZIkB5K1/EVkrXxKmEfy+g634tC75YsJt7FNoquc1Rs58Q673zG0E7UGHnIyEtrTbpkvLewwTSH7KkoAD7Axe+Ryf5lF1gj47qlK2nFfSShorPV6n0elYZZ2w+KLMAALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732778953; c=relaxed/simple;
	bh=hnITB7I8SJTEBKb/NwTkMI207yONLmWpTrZjCwmoSJE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Axs60rsux3WWmgaboi7uVpQB01/I0AejDkM3w6z6sFGe4Zxe2a7X1cFx7st1rWxRZ/0V6pPGxOOh2sc6hCPEAEOqsF+TgqCMN3TeSeLkyXXZ9ZazdIRtWHqTXWgmloo1t+SVvu6Ue/0tpyWywgHhiPi8ghT9TOmZ0bw1pOcgWas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=SM2Bnz0v; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="SM2Bnz0v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eoG8SgndLKsfnHcsX9KenvognL0Wa8mDSUjeF58ZhfI=; b=SM2Bnz0v8vH9gaihAjPdeFB9dy
	83Y67OwyN5Y1wrJeu2SAdnFNtJazbncNz8LdA+F4YEP4OhizrWMOjbDh+BfnAX1+YVnsWiizvnsZF
	frFcXF9wOUS80cswWG7WzyPjiiRMEopS5/GsFsA5E8b6r4IJ3HP/deoyk3NjjTB3pLFTQOpFYD7fe
	f2mhEf6MADLclsaJmQl2Ydo6F4Hn/p5Rdx53ywLXc1kaYqWdHsX/2vXZY5xCu8Dw/lQdDeD8p7DAZ
	/GLJVcgRB+B8eswMZlF2gYaiLR3W6jHOAFp9ngfO5UWLvrJKwe1RVXOwYih9eai23iER6YoPjCLni
	E24tSAMA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tGYxV-0005qs-Fj; Thu, 28 Nov 2024 08:29:05 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tGYxU-0000Zd-3A;
	Thu, 28 Nov 2024 08:29:05 +0100
From: Esben Haabendal <esben@geanix.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org,  linux-arm-kernel@lists.infradead.org,
  imx@lists.linux.dev,  kernel@pengutronix.de,  linux@roeck-us.net,  Fabio
 Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: imx: defconfig: Explicitly select CONFIG_PINCTRL
In-Reply-To: <20241126194146.1193094-1-festevam@gmail.com> (Fabio Estevam's
	message of "Tue, 26 Nov 2024 16:41:46 -0300")
References: <20241126194146.1193094-1-festevam@gmail.com>
Date: Thu, 28 Nov 2024 08:29:04 +0100
Message-ID: <87ttbr6clb.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27470/Wed Nov 27 10:59:44 2024)

Fabio Estevam <festevam@gmail.com> writes:

> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
>
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
>
> Fix it by selecting CONFIG_PINCTRL inside the affected defconfigs.
>
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Esben Haabendal <esben@geanix.com>

> ---
>  arch/arm/configs/imx_v4_v5_defconfig | 1 +
>  arch/arm/configs/imx_v6_v7_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
> index 875c8cdbada7..1af29d12129d 100644
> --- a/arch/arm/configs/imx_v4_v5_defconfig
> +++ b/arch/arm/configs/imx_v4_v5_defconfig
> @@ -83,6 +83,7 @@ CONFIG_I2C_IMX=y
>  CONFIG_SPI=y
>  CONFIG_SPI_IMX=y
>  CONFIG_SPI_SPIDEV=y
> +CONFIG_PINCTRL=y
>  CONFIG_GPIO_SYSFS=y
>  CONFIG_GPIO_MXC=y
>  CONFIG_W1=y
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> index 0beecdde55f5..73f7aa7e75f7 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -204,6 +204,7 @@ CONFIG_SPI_FSL_QUADSPI=y
>  CONFIG_SPI_GPIO=y
>  CONFIG_SPI_IMX=y
>  CONFIG_SPI_FSL_DSPI=y
> +CONFIG_PINCTRL=y
>  CONFIG_PINCTRL_IMX8MM=y
>  CONFIG_PINCTRL_IMX8MN=y
>  CONFIG_PINCTRL_IMX8MP=y
