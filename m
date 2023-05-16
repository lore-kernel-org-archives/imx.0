Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A61881E
	for <imx@lists.linux.dev>; Tue, 16 May 2023 16:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81033C433EF;
	Tue, 16 May 2023 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684254848;
	bh=a5gD6Sj2I5YN1JdKb6fmBN6fLXBHxziCoDX0JM00sqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLKshx667MZY3r80PjDOVG+7FWMX01YuYGt1yw90uoPbquW2BUeLngRKkIZDcOBxr
	 rlGZSjBHuZLG45fPyH8+0WXp/Pgz5latxrdbFPe6Ye9HO4T+wA7I1n818XGez3vpdd
	 j7ctedMTOLqRIL6ZdyY1avZBpPG7ZrxHvT1jSxuM3MCZJy/SoJ5UkqpWUttP6qLufS
	 /g6fkOLnum8xOd53DX2MXKL5hiEz2W+n8c+XpHG2ktB8arJJ3BHsrcmXjvOxs9oivy
	 pM9F/nmY4YOoUAQnpxQZoZTif7eKDipWLCudOTQmdJZsSFRvoqoeXDYfSQZE+IGn/y
	 qOps90klCQwoA==
Date: Tue, 16 May 2023 22:04:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, fushi.peng@nxp.com, imx@lists.linux.dev,
	kernel@pengutronix.de, kishon@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, robh+dt@kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v4 3/6] phy: cadence: salvo: add bist fix
Message-ID: <ZGOwfFlqWIrAXpHy@matsya>
References: <20230516154329.3155031-1-Frank.Li@nxp.com>
 <20230516154329.3155031-4-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516154329.3155031-4-Frank.Li@nxp.com>

On 16-05-23, 11:43, Frank Li wrote:
> From: Peter Chen <peter.chen@nxp.com>
> 
> Very limited parts may fail to work on full speed mode (both host and
> device modes) for USB3 port due to higher threshold in full speed receiver
> of USB2.0 PHY.
> 
> One example failure symptom is, the enumeration is failed when connecting
> full speed USB mouse to USB3 port, especially under high temperature.
> 
> The workaround is to configure threshold voltage value of single ended
> receiver by setting USB2.0 PHY register AFE_RX_REG5[2:0] to 3'b101.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

This needs senders S-o-b as well!

> ---
>  drivers/phy/cadence/phy-cadence-salvo.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-cadence-salvo.c
> index 2e3d4d8fb8eb..b9866dc146ce 100644
> --- a/drivers/phy/cadence/phy-cadence-salvo.c
> +++ b/drivers/phy/cadence/phy-cadence-salvo.c
> @@ -91,6 +91,7 @@
>  
>  /* USB2 PHY register definition */
>  #define UTMI_REG15				0xaf
> +#define UTMI_AFE_RX_REG5			0x12
>  
>  /* TB_ADDR_TX_RCVDETSC_CTRL */
>  #define RXDET_IN_P3_32KHZ			BIT(0)
> @@ -247,6 +248,8 @@ static int cdns_salvo_phy_init(struct phy *phy)
>  	cdns_salvo_write(salvo_phy, USB2_PHY_OFFSET, UTMI_REG15,
>  			 value | TXVALID_GATE_THRESHOLD_HS_0US);
>  
> +	cdns_salvo_write(salvo_phy, USB2_PHY_OFFSET, UTMI_AFE_RX_REG5,
> +			 0x5);

single line reads better

>  	udelay(10);
>  
>  	clk_disable_unprepare(salvo_phy->clk);
> -- 
> 2.34.1

-- 
~Vinod
