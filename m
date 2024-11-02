Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCA91F19A
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 07:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730532165; cv=none; b=q+79weFy9yt3WXJ0LXv6LKED2rBTDFkhBjQL8KjbKQJeycgVxYEQ+B5LfPvU+J3nbQUTebAWh52tU1MVaCOY3mSLS6V6NYngUN8UbpSe+5+1j4KRjCP4/g1qql2W3s+jP/jVx4rFFz+d9/xyYshIGwLBJzbvYbLHWLUMh8aFESo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730532165; c=relaxed/simple;
	bh=gyFTHNX0NpP78SUS367GYGGtHuwo0fSgRKzGqYo9bVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J52sJVyVJIE8fJuDwhIEKoraSIE1L4CxHqlV+iwf0VTayC8Ovr1XklgzvqcLTdcCgubseKEsdhHuNgHP6wKdCF/lwd7TSx+ncszxapkXVURyfXPO6qhpANxXBWqCvbjb+f5PHwo3WXHQNDzEhxZyYD9O50M2ULLS2uWuYrSFixM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=npTm+xwn; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="npTm+xwn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=pX+/3FO2uxR1q2Xk+WQT3k8Oa1+H08pdqnymIX1S4ig=;
	b=npTm+xwnOCJsurVHrgO9WDkItcIXCcbTn1Y5U0/SJ7OK5Ozb2MkZ3IAjxVk6KW
	M1XFx8eyW6MosYtE18EsCssXRS2rANsVZifIJdHTrIISB97DRIXjoLbEChIlG1qn
	ZzXl1KByQgyD5NFkkicJ5Q+/oE9R/3I0TzRHdz7YlXI9c=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnJtIX0yVn_rx5AQ--.14994S3;
	Sat, 02 Nov 2024 15:22:01 +0800 (CST)
Date: Sat, 2 Nov 2024 15:21:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	elinor.montmasson@savoirfairelinux.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Message-ID: <ZyXTFhEm9UCBii2c@dragon>
References: <20241030122128.115000-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030122128.115000-1-eichest@gmail.com>
X-CM-TRANSID:Mc8vCgAnJtIX0yVn_rx5AQ--.14994S3
X-Coremail-Antispam: 1Uf129KBjvJXoWruF4kWr4furWxGw1fCrWfKrg_yoW8JF15pF
	nrZrs7Jr48W3y5JrWUCrykWa95ZF9rXrW0qrW2ya45ZwsIy34FqF1jy342ga1DXr9a9r95
	CFyfGF9Ikr1DX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzc_fUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQiLZWclsVNF3gAAsU

On Wed, Oct 30, 2024 at 01:21:12PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio. This
> change will fix commit d469b771afe1 ("ARM: dts: imx6: update spdif sound
> card node properties") which moves away from the old "spdif-controller"
> property to the new "audio-codec" property.
> 
> Fixes: d469b771afe1 ("ARM: dts: imx6: update spdif sound card node properties")

It doesn't look a fix to me.

Shawn

> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  arch/arm/configs/imx_v6_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> index 333ef55476a30..c771d7dbcadcd 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -321,6 +321,7 @@ CONFIG_SND_SOC_IMX_SGTL5000=y
>  CONFIG_SND_SOC_FSL_ASOC_CARD=y
>  CONFIG_SND_SOC_AC97_CODEC=y
>  CONFIG_SND_SOC_CS42XX8_I2C=y
> +CONFIG_SND_SOC_SPDIF=y
>  CONFIG_SND_SOC_TLV320AIC3X_I2C=y
>  CONFIG_SND_SOC_WM8960=y
>  CONFIG_SND_SOC_WM8962=y
> -- 
> 2.43.0
> 

