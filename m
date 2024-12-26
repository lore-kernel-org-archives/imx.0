Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2246C8C5
	for <imx@lists.linux.dev>; Thu, 26 Dec 2024 14:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735224274; cv=none; b=kGX9uBJYGk1MwWfTZmzRPNHmGGmJqKKDlRKTebsFBZxpLLaqtRqYflqdRX4QRghbU/xyjQ1PVL+OfWX86VJJziC5FSdABOpC5NI2R8gu7ELmkFTbPiohwQAYO/VLB/5OlPLxWvJh8pXmU0P9J9D9/lnqInF4M3V2CzkUT77lFBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735224274; c=relaxed/simple;
	bh=oiR1m+/R1lO7OoSCqZgA4U0p4g/dqDSxkVqMYZkRDU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u54JA0QdoGnrHb8S8MKQdqwcjjFKscXcrYrnf9e8imhHe3ytBnGwqNgpHHpf/sQY84+44WR+McFroA6oln+mpn5N+fzyoraZCagMdvMJXgatRwYDNgoZcCvT/7+7N15kH1ocoo3bNoiceEoVJ606zF5vXfC8e5ks4wIuBOsLKi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=we01aSk1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="we01aSk1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43634b570c1so47110315e9.0
        for <imx@lists.linux.dev>; Thu, 26 Dec 2024 06:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735224271; x=1735829071; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A7rn19r4HgbPbGx9r0DQ1iakhx3qC0hkuGhdxpRpgMI=;
        b=we01aSk151WR/72leJccb/WVs5TqH31TVzP8ThcWu2qb9Ewo9R49rOxtqxgn7EFdNN
         wFIaK0eq2jS6IS++3Q4EpbiZyum2PqSB+l1YltcHuQ+63GKaP+MFhNVzfrZ6cNpdQqBL
         J3AgpblcYl8TulLMLxlXFiF5dQbarVBPth+xB06hXCMSmvtKFvhRxstbKay+GdPhwgs/
         UHqwUxHKNtCDmPrzR4HHTdKb0w6p8o686uV3SCBqcY5Zh4ol5EY5uUwz8UqtEOL91+rJ
         TWrqVJwhRmajN4RgdUGcRMlvu0v6E/D/V5A2a26F2eiEb1fByfXtHV6bc0TdxL+t5Mxx
         LzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735224271; x=1735829071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7rn19r4HgbPbGx9r0DQ1iakhx3qC0hkuGhdxpRpgMI=;
        b=lqYQgW0UAIQfpMffyqX+DB2RQwDzRzejZt8E9B1xLgRTnbD9fczU9p9++gI1rKRDQi
         hz6XXjbvrzuK7N9ZDLhO6OU7GxKoht5jIBo0CcXTm0hg5LoXKwjtAmMaipe/9BGSiANO
         mdlhL1ENPN94SmzLt8VOXpj9azDmWqFjcqHilO9aaAzsndDocxxfpvpV8QH4ji+kvNZ1
         Olccwaf/S2d1KGZxFF3RGLoJjKarPe0h5dZc02YQAh7AQSaI4aIs9ALZE8usKtQgS2rB
         af5GOi9MUGaT0KAvZ6pb5ksue8v1szn9I1L8gQn5ZNM6JQJ02236QbKGqLo7C0PAyt9E
         MjCw==
X-Forwarded-Encrypted: i=1; AJvYcCU1nVUxyK1VEwBbCxgLLWzThYW3lU47mdtz9StcG761CACVYI2fS4SMBotApMj/YawI11A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQVMdzQ7SFYBFL9DDFR2Jm/2s/zsDfkuoiKNbrtGlAK+dVqaSe
	EW8TwDK7SYbwq21ZVtMNtJY2bAQl1+sEzyGrZNhB05jPqJe1bjLuOwZgFTXcaOc=
X-Gm-Gg: ASbGnctpyhROxVWmBgVpjqbUSoHyj/VNDZUcmfZOj0ymc8QbJE/FZPkxJTzM/8fq/1e
	2ZYe9Dhuxyx/oQpVfzbKKBSqw7VsqXLx3EE8Av1J4jNN2yvP1bSJBAGeSr/MHeW5O7fnex7Ef46
	RMhmkbhHFyZzHsFZcWuLTRPaxkJX753QHiP1P9rn/WtE13CMJhg/0htwcRJ0ckDLeHuksm0WOVb
	kE0ikJDYMqP2a7UHQvuEXypdijvR75k83ie7ks1LdM5HTyG/Dm58zA=
X-Google-Smtp-Source: AGHT+IEs46r2QTrphoxhnYAjoEZ26B+gzvCJ6J2PHOuEvEPqcIAkbr1HCYher+BV97nl0i4rzQRD/A==
X-Received: by 2002:a05:600c:350c:b0:434:a91e:c709 with SMTP id 5b1f17b1804b1-43668b78c11mr157293045e9.28.1735224271050;
        Thu, 26 Dec 2024 06:44:31 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea47asm234453595e9.4.2024.12.26.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 06:44:30 -0800 (PST)
Date: Thu, 26 Dec 2024 16:44:28 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	"open list:NXP i.MX CLOCK DRIVERS" <linux-clk@vger.kernel.org>,
	"open list:NXP i.MX CLOCK DRIVERS" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] clk: imx: Apply some clks only for i.MX93
Message-ID: <Z21rzK6Nejti6lsA@linaro.org>
References: <20241225001443.883131-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225001443.883131-1-peng.fan@oss.nxp.com>

On 24-12-25 08:14:43, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Enable the LVDS gate, MIPI DSI, PXP, FLEXIO and MU only for i.MX93,
> because i.MX91 does not support them.
> 
> Update enet clk entry format to align with others.
> 
> Fixes: a27bfff88dd2 ("clk: imx: add i.MX91 clk")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> 
> V2:
>  Update subject and commit log after phasing out more clks
>  https://lore.kernel.org/lkml/20241203130530.1206526-1-peng.fan@oss.nxp.com/
> 
>  drivers/clk/imx/clk-imx93.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 58a516dd385b..5bdd2bdce46e 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -70,8 +70,8 @@ static const struct imx93_clk_root {
>  	{ IMX93_CLK_WAKEUP_AXI,		"wakeup_axi_root",	0x0380,	FAST_SEL, CLK_IS_CRITICAL },
>  	{ IMX93_CLK_SWO_TRACE,		"swo_trace_root",	0x0400,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_M33_SYSTICK,	"m33_systick_root",	0x0480,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
> -	{ IMX93_CLK_FLEXIO1,		"flexio1_root",		0x0500,	LOW_SPEED_IO_SEL, },
> -	{ IMX93_CLK_FLEXIO2,		"flexio2_root",		0x0580,	LOW_SPEED_IO_SEL, },
> +	{ IMX93_CLK_FLEXIO1,		"flexio1_root",		0x0500,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
> +	{ IMX93_CLK_FLEXIO2,		"flexio2_root",		0x0580,	LOW_SPEED_IO_SEL, 0, PLAT_IMX93, },
>  	{ IMX93_CLK_LPTMR1,		"lptmr1_root",		0x0700,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_LPTMR2,		"lptmr2_root",		0x0780,	LOW_SPEED_IO_SEL, },
>  	{ IMX93_CLK_TPM2,		"tpm2_root",		0x0880,	TPM_SEL, },
> @@ -177,10 +177,10 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_WDOG5_GATE,		"wdog5",	"osc_24m",		0x8400, },
>  	{ IMX93_CLK_SEMA1_GATE,		"sema1",	"bus_aon_root",		0x8440, },
>  	{ IMX93_CLK_SEMA2_GATE,		"sema2",	"bus_wakeup_root",	0x8480, },
> -	{ IMX93_CLK_MU1_A_GATE,		"mu1_a",	"bus_aon_root",		0x84c0, CLK_IGNORE_UNUSED },
> -	{ IMX93_CLK_MU2_A_GATE,		"mu2_a",	"bus_wakeup_root",	0x84c0, CLK_IGNORE_UNUSED },
> -	{ IMX93_CLK_MU1_B_GATE,		"mu1_b",	"bus_aon_root",		0x8500, 0, &share_count_mub },
> -	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub },
> +	{ IMX93_CLK_MU1_A_GATE,		"mu1_a",	"bus_aon_root",		0x84c0, CLK_IGNORE_UNUSED, NULL, PLAT_IMX93 },
> +	{ IMX93_CLK_MU2_A_GATE,		"mu2_a",	"bus_wakeup_root",	0x84c0, CLK_IGNORE_UNUSED, NULL, PLAT_IMX93 },
> +	{ IMX93_CLK_MU1_B_GATE,		"mu1_b",	"bus_aon_root",		0x8500, 0, &share_count_mub, PLAT_IMX93 },
> +	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub, PLAT_IMX93 },
>  	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"m33_root",		0x8540, },
>  	{ IMX93_CLK_EDMA2_GATE,		"edma2",	"wakeup_axi_root",	0x8580, },
>  	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi1",	"flexspi1_root",	0x8640, },
> @@ -188,8 +188,8 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_GPIO2_GATE,		"gpio2",	"bus_wakeup_root",	0x88c0, },
>  	{ IMX93_CLK_GPIO3_GATE,		"gpio3",	"bus_wakeup_root",	0x8900, },
>  	{ IMX93_CLK_GPIO4_GATE,		"gpio4",	"bus_wakeup_root",	0x8940, },
> -	{ IMX93_CLK_FLEXIO1_GATE,	"flexio1",	"flexio1_root",		0x8980, },
> -	{ IMX93_CLK_FLEXIO2_GATE,	"flexio2",	"flexio2_root",		0x89c0, },
> +	{ IMX93_CLK_FLEXIO1_GATE,	"flexio1",	"flexio1_root",		0x8980, 0, NULL, PLAT_IMX93},
> +	{ IMX93_CLK_FLEXIO2_GATE,	"flexio2",	"flexio2_root",		0x89c0, 0, NULL, PLAT_IMX93},
>  	{ IMX93_CLK_LPIT1_GATE,		"lpit1",	"bus_aon_root",		0x8a00, },
>  	{ IMX93_CLK_LPIT2_GATE,		"lpit2",	"bus_wakeup_root",	0x8a40, },
>  	{ IMX93_CLK_LPTMR1_GATE,	"lptmr1",	"lptmr1_root",		0x8a80, },
> @@ -238,10 +238,10 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_SAI3_GATE,          "sai3",         "sai3_root",            0x94c0, 0, &share_count_sai3},
>  	{ IMX93_CLK_SAI3_IPG,		"sai3_ipg_clk", "bus_wakeup_root",	0x94c0, 0, &share_count_sai3},
>  	{ IMX93_CLK_MIPI_CSI_GATE,	"mipi_csi",	"media_apb_root",	0x9580, },
> -	{ IMX93_CLK_MIPI_DSI_GATE,	"mipi_dsi",	"media_apb_root",	0x95c0, },
> -	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, },
> +	{ IMX93_CLK_MIPI_DSI_GATE,	"mipi_dsi",	"media_apb_root",	0x95c0, 0, NULL, PLAT_IMX93 },
> +	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, 0, NULL, PLAT_IMX93 },
>  	{ IMX93_CLK_LCDIF_GATE,		"lcdif",	"media_apb_root",	0x9640, },
> -	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, },
> +	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, 0, NULL, PLAT_IMX93 },
>  	{ IMX93_CLK_ISI_GATE,		"isi",		"media_apb_root",	0x96c0, },
>  	{ IMX93_CLK_NIC_MEDIA_GATE,	"nic_media",	"media_axi_root",	0x9700, },
>  	{ IMX93_CLK_USB_CONTROLLER_GATE, "usb_controller", "hsio_root",		0x9a00, },
> @@ -256,8 +256,8 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_HSIO_32K_GATE,	"hsio_32k",	"osc_32k",		0x9dc0, },
>  	{ IMX93_CLK_ENET1_GATE,		"enet1",	"wakeup_axi_root",	0x9e00, 0, NULL, PLAT_IMX93, },
>  	{ IMX93_CLK_ENET_QOS_GATE,	"enet_qos",	"wakeup_axi_root",	0x9e40, 0, NULL, PLAT_IMX93, },
> -	{ IMX91_CLK_ENET2_REGULAR_GATE, "enet2_regular",        "wakeup_axi_root",      0x9e00, 0, NULL, PLAT_IMX91, },
> -	{ IMX91_CLK_ENET1_QOS_TSN_GATE,     "enet1_qos_tsn",        "wakeup_axi_root",      0x9e40, 0, NULL, PLAT_IMX91, },
> +	{ IMX91_CLK_ENET2_REGULAR_GATE, "enet2_regular", "wakeup_axi_root",	0x9e00, 0, NULL, PLAT_IMX91, },
> +	{ IMX91_CLK_ENET1_QOS_TSN_GATE, "enet1_qos_tsn", "wakeup_axi_root",	0x9e40, 0, NULL, PLAT_IMX91, },
>  	/* Critical because clk accessed during CPU idle */
>  	{ IMX93_CLK_SYS_CNT_GATE,	"sys_cnt",	"osc_24m",		0x9e80, CLK_IS_CRITICAL},
>  	{ IMX93_CLK_TSTMR1_GATE,	"tstmr1",	"bus_aon_root",		0x9ec0, },
> -- 
> 2.37.1
> 
