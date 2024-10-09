Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBE81925AE
	for <imx@lists.linux.dev>; Wed,  9 Oct 2024 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728474043; cv=none; b=bmRx6eBdpwVDNc8KZEaNe4+6Y5yWTPmXhkoCVlpwOsIc+uPo7/V0pxVSa8jjpLPDghuAJbQKfl/bnngiqdlyOuBGdEozB9QIPwi8etBbLKHWVvyXIY0eSP70S5lJZfX0DqZVqyDGwx9XjIF34fewD1++J+OKV1RPBl3M7paZWVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728474043; c=relaxed/simple;
	bh=h9qy1eidkzqAdVQtLG/tBIVtqvb9J31253seEKXBubQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHvJ/t5WiA5c59Mpz1CJCxDhU8QjabzHUQQ0JzTYp7kZHXeZ5Ux4OfpSOHvQF1mrQQbLuLMHZD4CiHuptS5qfiQ7JdObGVazhgVFrKo8xgdUU7YqRU6CVGLGgj5x+R9CztoBvI6ul5cmBhkG+Om09WMPJENLqCX8V2qCnw+9mX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g91troVB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g91troVB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c8967dd2c7so8304802a12.1
        for <imx@lists.linux.dev>; Wed, 09 Oct 2024 04:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728474040; x=1729078840; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3tPa6oC3GkVBQqXt9lYWOj5WcXfTZQll2lZKEeta0s=;
        b=g91troVBRizQzcdn/NqhG+MOIG7dzbFDdM+My8mDPtS/6DLn6aIabKE2f2bdhXlpcv
         DI3Ei5HpFWOyCH1niyWkWjhFY7/NB5MOMNaG2oqB/8h/u/OS5Xv58aci0NaBAUI0fgXh
         +cBVHkkr1q/piBzFpEmyRISJDA+Me0y3CnhuZUVFYKbth+jcSX9JVu3dJcC2gcV92ElJ
         hCbIgUFsj+xu377x5Pt0EuvncazJ87+sxVtUxMbp7hp2knZeDNO7Zvi2nDWmvsO9eRis
         DEgUtR0NSLxagux+QRvaxFmHI1a0TrTaG32jN6mund828PHs63+4MFraIJr82eMpl1ki
         120w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728474040; x=1729078840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3tPa6oC3GkVBQqXt9lYWOj5WcXfTZQll2lZKEeta0s=;
        b=tyHi9iiT1iy1P62IFLB1kvx09ZHVmm7ZtpwB7iGHCssvll6WlEDZ/EZbRig0z9g33s
         Ie/uS5coPurYKWGXUmKM/Wx6ZzvCBMfNHHpRfFbcTdoO15Zlh8qTpbjO4OZyW2RM5N1z
         tuob/F4T3GADEKqSJ///CjvlYMi1F7wMNqisFfqoD5os/pqsljSHxQDwVeDSRrBLsggS
         DwEWwL87E566qSP+U6H35bKcUqhvwIIAZnZW/Tu1WD7KGPFF2DCzvYP96XtzFNieFGFD
         IvzQ7beZypxzjb4hyp6gg5MuH3AEer5nD0JMCT0K20jklgSP18hubD4A1sTrr/N+bYl6
         3pqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaKh3Oh849HjKTsi8v/u9h4IEEBhzQA4cqHICmNIEiajO4NoXkPSdQuVaoZVPVDUz3COQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy+fcHWAUkYbNu7XjFcS/BKS/5xw7k9ONFfpSJ3aU2u6Ma/Ff5
	QnV63bSFPimCfw9a2LnAuaEBPpf4VTHUNbRukiP9lCVqMdtAV3DHDiJRW+buPps=
X-Google-Smtp-Source: AGHT+IHzp7sGsoG0E3MlQedOjt1RQsHdAF3ZWTsO4nfIOk1uH4nyTFSaTS2XpHphmCpbogKsgsVUTg==
X-Received: by 2002:a17:907:e89:b0:a99:3f4e:6de8 with SMTP id a640c23a62f3a-a998d3832e7mr182256566b.64.1728474040413;
        Wed, 09 Oct 2024 04:40:40 -0700 (PDT)
Received: from linaro.org ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994a8da5d3sm495547966b.134.2024.10.09.04.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:40:40 -0700 (PDT)
Date: Wed, 9 Oct 2024 14:40:37 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
Message-ID: <ZwZrtajvhpq50QPH@linaro.org>
References: <20241008223846.337162-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008223846.337162-1-marex@denx.de>

On 24-10-09 00:38:19, Marek Vasut wrote:
> The media_ldb_root_clk supply LDB serializer. These clock are usually
> shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
> results in accurate serializer clock.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Any fixes tag needed ?

Otherwise, LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/clk/imx/clk-imx8mp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 516dbd170c8a3..2e61d340b8ab7 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
>  	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
>  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
> -	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
> +	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
>  	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
>  	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] = imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mipi_test_byte_sels, ccm_base + 0xc100);
>  	hws[IMX8MP_CLK_ECSPI3] = imx8m_clk_hw_composite("ecspi3", imx8mp_ecspi3_sels, ccm_base + 0xc180);
> -- 
> 2.45.2
> 
