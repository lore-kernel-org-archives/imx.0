Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32203A1A46;
	Wed, 14 Jan 2026 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406949; cv=none; b=PBsrP6ebaf8Q2Hmovt7zKMROtRC+GcLXpflICymMsSFy4EBcwgnn0lL3UV5rMOsrmT0wJ04s0MLR7AALqtXYO+m+79rldRfsIMS8WnLbwucQCZ/4Vo7Q7KA9e5C+kmKiOCuGGlQrX5y/hXsADcu8k5vF7h1SxpeivJwp7bgBLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406949; c=relaxed/simple;
	bh=RcWDWr8WdqPhjE1J0vAZphz5xlYpd8I6Uc8jAUxHLV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcjZJ/mViAc4QGbqovzNuSvVvuA4MYR3LmuNgQ7bv2P7IMyP4XLBSxlZWU19RdRJ95zWU+fnR2oaQcxyLo6fwmewqhPxHKbZmTRr6+QJLbnnxniWPYIkqrY3ln8sZ7BswllQyfFxU8PIo8cZbQXPKh+RCXpjuXhCUqakxnSahc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNON+7sM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNON+7sM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECE9C4CEF7;
	Wed, 14 Jan 2026 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768406948;
	bh=RcWDWr8WdqPhjE1J0vAZphz5xlYpd8I6Uc8jAUxHLV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNON+7sMgvAO846vVwuFiwEchPZY5sEB8s+BwIKxwK+FoldG+9Rc0SfCB6XBlDrOQ
	 yWaA24WCZwBS+INft/dKuws0m8eFL0s8/oYvLas3DIgWLeqWtdacie+fz/FB/ZdB5c
	 OIs9f0++VWq3LLygegd0fBNBqD9dh0hRa13NAdrHsbG/IWuyGyDCDMb7ex/oeks0/D
	 B5zgWE+alovSasC99A+EGt7qShwFFdVF2lpCYcFbqJFoW2jDNc/aSiMjFObRN7WPTY
	 GG6vBsj/RugTAlB5zN7qSHBbmCNr2hZcoJEUfrm4CNfcCb/pK0jw+iikU40Jr/snS2
	 jpJbm5gt6kegA==
Date: Wed, 14 Jan 2026 21:39:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: enable RxTermination_override_sel
Message-ID: <aWe_oNDOqHnQo0X2@vaman>
References: <20251224111807.2925675-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224111807.2925675-1-xu.yang_2@nxp.com>

On 24-12-25, 19:18, Xu Yang wrote:

What is the with the CamelCase on the patch title! We dont do that
please

> This is to resolve the problem of wakeup system by USB3 device insertion
> if HSIOMIX on, in that case, the USB3 device detects RX term on so the
> USB3 device doesn't downgrade to high-speed, we can't expect CONN wakeup
> (for USB3) happen because the 24MHz OSC is required ON to trigger it.
> Because the device works at Super-speed so DP/DM wakeup can't happen
> either. Then the entire systen can't be waken up by such device attach
> event.
> 
> With this override bit we can force the RX term off when enters system
> suspend, and disable the override after system resume. Therefore, the
> USB3 device will always downgrade to High-speed, then DP/DM wakeup can
> always happen. It will correctly switch to Super-speed later when the
> host reset it after the system resume back.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - rephase the message
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 92c5c233bad9..e991a480b882 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -51,6 +51,7 @@
>  #define PHY_CTRL5_PCS_TX_SWING_FULL_MASK	GENMASK(6, 0)
>  
>  #define PHY_CTRL6			0x18
> +#define PHY_CTRL6_RXTERM_OVERRIDE_SEL	BIT(29)
>  #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
>  #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
>  
> @@ -630,6 +631,7 @@ static int imx8mp_usb_phy_init(struct phy *phy)
>  static int imx8mq_phy_power_on(struct phy *phy)
>  {
>  	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
> +	u32 value;
>  	int ret;
>  
>  	ret = regulator_enable(imx_phy->vbus);
> @@ -646,12 +648,23 @@ static int imx8mq_phy_power_on(struct phy *phy)
>  		return ret;
>  	}
>  
> -	return ret;
> +	/* Disable rx term override */
> +	value = readl(imx_phy->base + PHY_CTRL6);
> +	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> +	writel(value, imx_phy->base + PHY_CTRL6);
> +
> +	return 0;
>  }
>  
>  static int imx8mq_phy_power_off(struct phy *phy)
>  {
>  	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
> +	u32 value;
> +
> +	/* Override rx term to be 0 */
> +	value = readl(imx_phy->base + PHY_CTRL6);
> +	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> +	writel(value, imx_phy->base + PHY_CTRL6);
>  
>  	clk_disable_unprepare(imx_phy->alt_clk);
>  	clk_disable_unprepare(imx_phy->clk);
> -- 
> 2.34.1

-- 
~Vinod
