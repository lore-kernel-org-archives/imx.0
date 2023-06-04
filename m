Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB284569F
	for <imx@lists.linux.dev>; Sun,  4 Jun 2023 23:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DC7C433D2;
	Sun,  4 Jun 2023 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685921035;
	bh=V9LESKCHeGbMcnFP0vVt52k0cpabNqrKbgbb3i99zuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0cNWYjdgd1ZX3ItgsVQ6VbQ9A8uONmnH4pGdW1YBmhWL+c3QfZHhy4vrpcLEgwTz
	 WqJ0wBBClaIrPq68VdtqiCbmaaWdeR0/YqnVrkQ94LdDKEGc+9quPspMH/pljOI+D9
	 cfLfVQWlC8EVqTKqd1NvKFNVwvMBYYxB2+uiOFf7nMIgKga3TUqkZG1lIJ2D0XWUkc
	 SnZkGp6qh3GgNFE0NCsECg27Y/yuh3Eut5DtkkcLzALqxiiLXhrhXZYCIhEw1m7LYz
	 E3AU00bBMv3FgvuCtcEFf80D14XwJgEalt8MxVFinXtAWVnchl4LqNNWYKvSgZgJql
	 A3Oq39Kk7wXEA==
Date: Mon, 5 Jun 2023 07:23:42 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, pawell@cadence.com,
	rogerq@kernel.org, a-govindraju@ti.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] usb: cdns3: imx: simplify clock name usage
Message-ID: <20230604232342.GF258497@nchen-desktop>
References: <20230517152545.3404508-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517152545.3404508-1-Frank.Li@nxp.com>

On 23-05-17 11:25:44, Frank Li wrote:
> Simplifies the clock names in imx_cdns3_core_clks[]. Such as, renaming
> "usb3_lpm_clk" to "lpm". The "usb3" prefix and "clk" suffix were
> redundant.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>
> ---
> 
> This patch was missed at
> https://lore.kernel.org/imx/20230327145523.3121810-1-Frank.Li@nxp.com/
> 
>  drivers/usb/cdns3/cdns3-imx.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> index 59860d1753fd..5d9ca3c3c71d 100644
> --- a/drivers/usb/cdns3/cdns3-imx.c
> +++ b/drivers/usb/cdns3/cdns3-imx.c
> @@ -105,11 +105,11 @@ static inline void cdns_imx_writel(struct cdns_imx *data, u32 offset, u32 value)
>  }
>  
>  static const struct clk_bulk_data imx_cdns3_core_clks[] = {
> -	{ .id = "usb3_lpm_clk" },
> -	{ .id = "usb3_bus_clk" },
> -	{ .id = "usb3_aclk" },
> -	{ .id = "usb3_ipg_clk" },
> -	{ .id = "usb3_core_pclk" },
> +	{ .id = "lpm" },
> +	{ .id = "bus" },
> +	{ .id = "aclk" },
> +	{ .id = "ipg" },
> +	{ .id = "core" },
>  };
>  
>  static int cdns_imx_noncore_init(struct cdns_imx *data)
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
