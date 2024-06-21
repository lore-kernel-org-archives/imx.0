Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EE382899
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 04:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718945330; cv=none; b=KHZwAHrJ6Dcfx4GZtHVAGvlmVCmjf5MEhOF0SHoytw9c2TiTjPCRBL00WZXKnj+pZJFbnhfLKxzQArn9yGZCWBm11FAjzsyc/9TuMt24+nAJGOyrYJ9DmLdaw3buVh5MVO35L+rk8NKoMn0NfWvkOb1m8Xei2hP0oQhkBN/aEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718945330; c=relaxed/simple;
	bh=okAC9j6W98urT9FWKNpZ80XLrOwm3rAjrBQGcyQaHLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUbNNcsRqt1sLpWdfvedZNgz+DPgdZtMnftIOf3u+nyau5joN0eBaudc2fjU9gU5ML3xfR8jtOFeEkc0ebvZc4/MDUazpkUfsGdGcRACalwyVVyojyt6HDhqd+GxD+EQr1mYktSAPSrqYgaElxHPRuNHoI/LGtZcbGikehhMEpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z5MFAP2t; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z5MFAP2t"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52c819f6146so1955636e87.1
        for <imx@lists.linux.dev>; Thu, 20 Jun 2024 21:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718945327; x=1719550127; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2WGzLpSHiAFMQ6rhulZPDgtq0nr+/nkWynRADUnWeOc=;
        b=z5MFAP2tTbShQPbqYWyMl1THGRJ7j/e7oCtRdze4jZyHUcqAqhnBKjyea7MszSAdHk
         KWnlDD0g2o81nrYnb1HMTVVUYZpwpoxL8LIDdBvYYizKOeZndeqEcT9Eknhe6ik/w+m0
         4d+w8qnoKDhK30npgN2ZhVeb+LvVqpjuCQyjIWQOrmkP8R4WAu8J9Rmf4asFVMnkbZtm
         ZS3W8xIptoM+W8nISmyPtIJY5WVktaLuje3a/JIrMOroVaK+tDzucnreW6d7QeL1tzGK
         bzuskdqwkblV+0MkGWaBuWo2LHugmc6q96Z70831f4eo0a36MZYG8wK4HGN07erz475C
         PVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718945327; x=1719550127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WGzLpSHiAFMQ6rhulZPDgtq0nr+/nkWynRADUnWeOc=;
        b=shLNnKU+gtw/VqSi57e83zxoRiQiqIeeQSuC080RqnMvh5QCcuSOaPMfybKej4FTfD
         uiB+tqERTD/cEiBpTt6HwW8Q8YmULHeMJNI1oeKdF44MiN3cLm+J2vxB9OV8XmLooJDr
         Ce0htk6QuXYKBJoguMTi68CFU451qWJnJ6HYP05iKdiLYJAA1MohBAOjyv6JwvmuU2YW
         u/3GBWZAHkQzeCJphcEW9qXg7C0j++d4Zyx0mit8GHyS4bzSNhjZ/YSaMqTW7V0NFExa
         TX3RPmC9f9NVx0VjrjBQqvo4zTrbjfiB9+FKoCsJVmt8RmODo6pdv6f2GRFL9e07ObuO
         KWLA==
X-Forwarded-Encrypted: i=1; AJvYcCUCdmDq7kBdbgSDtfaLXPd2moxkG1Rqm/+WZWccIXzGwZRiFBYCz1JTNVzjGaAlY/Wxnx+MOCjpRrboiTjH3CUnzH4P
X-Gm-Message-State: AOJu0YzthEKUhHKvMpD8Pms5IgZP+CoB1+IVZzRSxji+xtI5Nu8USW1m
	r9ulj29IE8d1YdgNZVlpl2cZ949qTDMeHUKZUlS2bxkVPlsFlbchGJTroaia11M=
X-Google-Smtp-Source: AGHT+IHQ/LUmDuyLZQ0IaCKcHTZmjchVpKw8WeCnkMirzzuExs8oyd0Nlj5f9/vavkQGjh28g4RcMw==
X-Received: by 2002:a05:6512:10c3:b0:52c:859c:91dd with SMTP id 2adb3069b0e04-52ccaa594cfmr4875472e87.5.1718945326588;
        Thu, 20 Jun 2024 21:48:46 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663cd5fa47sm632123f8f.0.2024.06.20.21.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 21:48:46 -0700 (PDT)
Date: Fri, 21 Jun 2024 07:48:44 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	"Lukas F . Hartmann" <lukas@mntmn.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
Message-ID: <ZnUGLCZYrSdW4f3S@linaro.org>
References: <20240531202648.277078-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531202648.277078-1-marex@denx.de>

On 24-05-31 22:26:26, Marek Vasut wrote:
> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
> Allow these clocks to reconfigure the Video PLL, as that results in
> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
> clock accuracy is low.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Lukas F. Hartmann <lukas@mntmn.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/clk/imx/clk-imx8mp.c | 4 ++--
>  drivers/clk/imx/clk.h        | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 670aa2bab3017..f11dfe2028319 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -547,7 +547,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_AHB] = imx8m_clk_hw_composite_bus_critical("ahb_root", imx8mp_ahb_sels, ccm_base + 0x9000);
>  	hws[IMX8MP_CLK_AUDIO_AHB] = imx8m_clk_hw_composite_bus("audio_ahb", imx8mp_audio_ahb_sels, ccm_base + 0x9100);
>  	hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] = imx8m_clk_hw_composite_bus("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
> -	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300);
> +	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET_RATE_PARENT);
>  
>  	hws[IMX8MP_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb_root", ccm_base + 0x9080, 0, 1);
>  
> @@ -609,7 +609,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_USDHC3] = imx8m_clk_hw_composite("usdhc3", imx8mp_usdhc3_sels, ccm_base + 0xbc80);
>  	hws[IMX8MP_CLK_MEDIA_CAM1_PIX] = imx8m_clk_hw_composite("media_cam1_pix", imx8mp_media_cam1_pix_sels, ccm_base + 0xbd00);
>  	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
> -	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00);
> +	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
>  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
>  	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
>  	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index adb7ad649a0d2..aa5202f284f3d 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -442,6 +442,10 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *name,
>  	_imx8m_clk_hw_composite(name, parent_names, reg, \
>  			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
>  
> +#define imx8m_clk_hw_composite_bus_flags(name, parent_names, reg, flags) \
> +	_imx8m_clk_hw_composite(name, parent_names, reg, \
> +			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAULT | flags)
> +
>  #define imx8m_clk_hw_composite_bus_critical(name, parent_names, reg)	\
>  	_imx8m_clk_hw_composite(name, parent_names, reg, \
>  			IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
> -- 
> 2.43.0
> 
