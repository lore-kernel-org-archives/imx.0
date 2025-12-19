Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B9534B414
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 17:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766166959; cv=none; b=feIeO0wzR9rL7toP/TDhBC+b3X4r40AWsAj9GwjCf6kmUXX7jCfSNL4quKZYmtmuhbdsDNAd6wKFJsP5x684y2Y/gtLXtvGsfQi6ewOUdCUHMR7j6FnDLtDSgSs2YG9CaPOrJEtWg0QIir5uraYTYm21q53nPhY8K+xg3C5f3Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766166959; c=relaxed/simple;
	bh=C/dxzWmUyQn7qnsvQu3ac3uXeH3+vuNaJagg0C8Atsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvTxDvYs428luzMxw78Htku9B9+gsQuO5xFJhsZJiCA8WENoR73lPyqrBPYrbaI1jrLhAlfhpLxLuTMrT4HVMuDu5h9rQZMeHLrmIOFOt6j6YTVpLBB9vfMOd7mZ2Y6BYPTtPE6DnMCeD0PG5bA/Va+7PGZxUNnSOw5D4mH6xlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vWehg-0002dt-7P; Fri, 19 Dec 2025 18:55:48 +0100
Message-ID: <04aea865-693f-454c-9207-c00e67ad74cc@pengutronix.de>
Date: Fri, 19 Dec 2025 18:55:46 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL field
 before using it
To: Stefano Radaelli <stefano.radaelli21@gmail.com>, vkoul@kernel.org,
 neil.armstrong@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev, Pierluigi Passaro <pierluigi.p@variscite.com>,
 xu.yang_2@nxp.com, Frank.Li@nxp.com, haibo.chen@nxp.com,
 linux-phy@lists.infradead.org, Stefano Radaelli <stefano.r@variscite.com>,
 Leonid Segal <leonids@variscite.com>, jun.li@nxp.com
References: <20251219160912.561431-1-stefano.r@variscite.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20251219160912.561431-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 12/19/25 5:09 PM, Stefano Radaelli wrote:
> Clear the PCS_TX_SWING_FULL field mask before setting the new value
> in PHY_CTRL5 register. Without clearing the mask first, the OR operation
> could leave previously set bits, resulting in incorrect register
> configuration.
> 
> Fixes: 63c85ad0cd81 ("phy: fsl-imx8mp-usb: add support for phy tuning")
> Suggested-by: Leonid Segal <leonids@variscite.com>
> Acked-by: Pierluigi Passaro <pierluigi.p@variscite.com>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> Reviewed-by: Xu Yang <xu.yang_2@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
> v3:
> - Fixed commit message line wrapping (75 chars)
> v2:
> - Improved commit subject as suggested by Fabio Estevam
> 
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index ad8a55012e42..9458b6e5fcf4 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -504,6 +504,7 @@ static void imx8m_phy_tune(struct imx8mq_usb_phy *imx_phy)
>  
>  	if (imx_phy->pcs_tx_swing_full != PHY_TUNE_DEFAULT) {
>  		value = readl(imx_phy->base + PHY_CTRL5);
> +		value &= ~PHY_CTRL5_PCS_TX_SWING_FULL_MASK;
>  		value |= FIELD_PREP(PHY_CTRL5_PCS_TX_SWING_FULL_MASK,
>  				   imx_phy->pcs_tx_swing_full);
>  		writel(value, imx_phy->base + PHY_CTRL5);
> 
> base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

