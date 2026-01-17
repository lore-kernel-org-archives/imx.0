Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4204D329E50;
	Sat, 17 Jan 2026 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768629603; cv=none; b=JQ4f//jJouyizTyl4xfkA+LJ/HMnImzMmoCpgMYXnlXXXNZ/gXChJI5cwo/RFpneJBcd3MQI7wokBZU1F/cqtpHyiQwRdqi88FazUevLOEZItPAIno4UOP6gvPJfgOMc8USGNYQnzlT2QDVG6kWRs5s82bR/LLRY5VkJmnKJnLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768629603; c=relaxed/simple;
	bh=5wA58oCXUxGlCXvDN5IdgcPYcqa5jAaI+xL+nK4vmFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6cCNathFbXAkNfAwbDuFK6V4XCop/JPcmkmcrLSfmY4UBRXv+V/kZZZDpRxoJMAr1RkYgzVjF0f+ceLFuQ5RGdkzLRrTIMUekyyjR4XlyO22fMCC+sTTI2fYnJO77M8s48a8v9F4otX1DZqEwHF8CassRHSyJJdOu2EcbDeT6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YY/aAuj6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YY/aAuj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7319DC4CEF7;
	Sat, 17 Jan 2026 05:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768629602;
	bh=5wA58oCXUxGlCXvDN5IdgcPYcqa5jAaI+xL+nK4vmFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YY/aAuj64PKTk0mvb0ZcnevakmRwNpgxG6RmISrViFchP9gSnHba0il5lVXA7kd7Y
	 Y//m5bCyNBMTGQZljnQeAm/ccxfL/CmuNuL2uYMdLIwmU8ODKNftrB8Z9XNs/cHI9w
	 fL749X44EuHp3b479guI3n8qdPIBOdPvkHKZpH2cifNqxEW1mSV0bMw29AZ60KAIEL
	 vBL/rEFzLdche39zSpKajiCJ4Ud+NXVDX9FOdl5+J8dJSLspG4psqTFrGZXec6OJPq
	 i3ay70egpvrOXxDL2oPk9ZMyKba5O+7dwdNVnrfTnQC8P3ksEd7Xn5lJsrtuOvQI3s
	 pk73whqwKIHWA==
Date: Sat, 17 Jan 2026 13:59:56 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: imx_v4_v5_defconfig: update for v6.19-rc1
Message-ID: <aWslXMyRc3w6rkos@dragon>
References: <20260104-armv45defconfig-v3-1-f712476d44d1@solid-run.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104-armv45defconfig-v3-1-f712476d44d1@solid-run.com>

On Sun, Jan 04, 2026 at 11:38:52AM +0200, Josua Mayer wrote:
> The i.MX ARM v4/v5 defconfig has gone out of sync with some dead options,
> some removed and some missing.
> 
> 1. Add missing options no longer enabled by default:
> - CONFIG_I2C=y
> - CONFIG_LCD_CLASS_DEVICE=y
> 
> 2. Remove options enabled by default:
> - CONFIG_CS89x0=y
> - CONFIG_MEDIA_CAMERA_SUPPORT=y
> 
> 3. Remove options that have no effect:
> - # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> - # CONFIG_INET_XFRM_MODE_TUNNEL is not set
> - # CONFIG_INET_XFRM_MODE_BEET is not set
> 
> 4. Remove options that have been removed completely from the kernel:
> - CONFIG_USB_EHCI_MXC=y
>   Removed by commit e7018751d2e6 ("usb: host: ehci-mxc: Remove the
> driver").
> - CONFIG_SMC911X=y
>   Removed by commit a2fd08448f2b ("net: remove smc911x driver").
> - -CONFIG_SND_SOC_MX27VIS_AIC32X4=y
>   Removed by commit 3fbb01fb583f ("ASoC: mx27vis-aic32x4: Remove unused
> driver").
> - CONFIG_SND_SOC_PHYCORE_AC97=y
>   Removed by commit 440534a0ecfd ("ASoC: phycore-ac97: Remove unused
> driver").
> - CONFIG_SND_SOC_IMX_MC13783=y
>   Removed by commit 83e7e2278680 ("ASoC: imx-mc13783: Remove unused
> driver").
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied, thanks!
