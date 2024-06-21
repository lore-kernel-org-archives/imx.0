Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C691684A8
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718992376; cv=none; b=nWOJ0qTNk1ZtvWLbWUSq99v1JiP9DBo1leKHRwag/LuA3y+X7aZMWlY+NpHySOdTn6W5vESOtFb2SgSC4hoomAckc4IE5QRiSpjCfCtMtaB/tP2b5U2rzuyG2Jjd3DZ2P2VVgVQXWXOooQ3sPiyd448GgbFaWHebPnSkbZ8XWQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718992376; c=relaxed/simple;
	bh=l+e3TBsJGHgEO+B6v7c2lE1gihkDrqoV70vknaAijVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NoHUZjLGSWttVSz3nXQFD3CVs0NpWox6XD46C8uwFe7ZjPob2MK3//JNbxdUmSG2t2oJwqqiAhOwsxRDS3iNIsdTULHEJ5Vs8dNwY2gGxw/KqGKqKAF82xk70mSU62ozvEqumBhW0yUV6kZQrDFhxhWf9MMG/xM8aztwTuhPBYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgQUlZUX; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgQUlZUX"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c2c6b27428so1750123a91.3
        for <imx@lists.linux.dev>; Fri, 21 Jun 2024 10:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718992374; x=1719597174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eceM7eGroF/1YftF1UIl+bHo7iAVJgd1bq1phB6robE=;
        b=IgQUlZUXLbiHHc9RcuDLtjMCYXJ4xJjHDhrmkIniANVDjZ+hvSJ1ppJWhVQkCLJu94
         sZqIaVc0eZZSJxgQKFgMJRMZ4GBS60+dMZV8cCICSjTBee1J/R0PsExLnkZs2267PwOK
         5DonNvJnrFn8ktIm/mYM95CUpra1YKdV1erQcmyVKL//4dxVdDhF9OuXDF6IZcotjCsl
         9tpROcJW2C98VOhLXvzYUAeEmEpKdc92CppnxF+s1VQdhgLq5n9rBkFZ+16DWvaL4oqy
         QIVrRl6WmbR4ZRr05ObIy5eMs1vbpn1eKp9Ue9a7vky32jlPZaaZWqOtsvDJpTnnVmG4
         r4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718992374; x=1719597174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eceM7eGroF/1YftF1UIl+bHo7iAVJgd1bq1phB6robE=;
        b=SZsFukQN1euTmNtc4tIo1jJp9anubzFxco2lcxHDBXAjjKN7Xpt1RNhKRdC1esBqCU
         6q5HVIARA+xrErva4r91nf5nLyaOcyxy8Mc+HJA3Pbgj1YDpfpCxPnYDOWUSfsWIPF1h
         CjFvb2Kjo/9mJ4bL8x2waHJNFoe/fKFrl1R0FLXL6apUoWAhkSvcZ2bprxxlPbPDUdFp
         20g3lOmjRREwz5AkJMtadUMK+faX3Rtps6BD746qdkZLNVQrXcyqzVtByf8Tzna/r9k7
         QMl0d+mo+WZPV21UlSwWinsilxQn5cN7vSRzn2Na1InPGYe2+c6L/oVSMXlo/45bwpaX
         wluw==
X-Forwarded-Encrypted: i=1; AJvYcCU7EgYoY92y0y16eshisAuv+27VD5E09qKeGP6zUGF9yoV1F5MeSA1v9oCD8DFIslg3XOC7fAaQ8gSluXpDwGVeL14r
X-Gm-Message-State: AOJu0Yy1Af1Ir+Tke5H5ly5QwaOe/an41IscXyc5U6Yw4K/nb5zBGLoE
	nzeBmgWVR00mNd9i1NqVvasx125l7Y3V+7sZ5qC28/zgF8aW5xRelMAQh1ZPnir3o08g/MzzHFO
	9lvCpjRxdukZ4gyPepQ/hs9boHQA=
X-Google-Smtp-Source: AGHT+IGayfrnXuX32A8k7x+SGn5TpPg73uu0SeCkfjVvVUrHSzOi3yXl1TtWyEkUmcLr+2LUM8tReB5PmJphEOGdAos=
X-Received: by 2002:a17:90a:e615:b0:2c2:f2f9:a121 with SMTP id
 98e67ed59e1d1-2c7b5d6a450mr8877807a91.39.1718992374293; Fri, 21 Jun 2024
 10:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240531202648.277078-1-marex@denx.de>
In-Reply-To: <20240531202648.277078-1-marex@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 21 Jun 2024 12:52:42 -0500
Message-ID: <CAHCN7xJA2i+k-n+02Km+83YXVEse=NDR_KmwQzhdTmCAJkP+BA@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
To: Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, "Lukas F . Hartmann" <lukas@mntmn.com>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 3:36=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
> Allow these clocks to reconfigure the Video PLL, as that results in
> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
> clock accuracy is low.

What happens if you have both a DSI (IMX8MP_CLK_MEDIA_DISP1_PIX) and
an LVDS (IMX8MP_CLK_MEDIA_DISP2_PIX) display and both try to
reconfigure their shared parent clock when their resolutions/clocks
may not be the same?  I looked at doing that for the 8MP, but I was
running into display issues.

For example, I was trying to test an 800x480 LVDS display which needed
a pixel clock of 30MHz, and a DSI trying to run at 1920x1080 @
148.5MHz.

adam

>
> Signed-off-by: Marek Vasut <marex@denx.de>
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
> @@ -547,7 +547,7 @@ static int imx8mp_clocks_probe(struct platform_device=
 *pdev)
>         hws[IMX8MP_CLK_AHB] =3D imx8m_clk_hw_composite_bus_critical("ahb_=
root", imx8mp_ahb_sels, ccm_base + 0x9000);
>         hws[IMX8MP_CLK_AUDIO_AHB] =3D imx8m_clk_hw_composite_bus("audio_a=
hb", imx8mp_audio_ahb_sels, ccm_base + 0x9100);
>         hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] =3D imx8m_clk_hw_composite_bus("m=
ipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
> -       hws[IMX8MP_CLK_MEDIA_DISP2_PIX] =3D imx8m_clk_hw_composite_bus("m=
edia_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300);
> +       hws[IMX8MP_CLK_MEDIA_DISP2_PIX] =3D imx8m_clk_hw_composite_bus_fl=
ags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_S=
ET_RATE_PARENT);
>
>         hws[IMX8MP_CLK_IPG_ROOT] =3D imx_clk_hw_divider2("ipg_root", "ahb=
_root", ccm_base + 0x9080, 0, 1);
>
> @@ -609,7 +609,7 @@ static int imx8mp_clocks_probe(struct platform_device=
 *pdev)
>         hws[IMX8MP_CLK_USDHC3] =3D imx8m_clk_hw_composite("usdhc3", imx8m=
p_usdhc3_sels, ccm_base + 0xbc80);
>         hws[IMX8MP_CLK_MEDIA_CAM1_PIX] =3D imx8m_clk_hw_composite("media_=
cam1_pix", imx8mp_media_cam1_pix_sels, ccm_base + 0xbd00);
>         hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] =3D imx8m_clk_hw_composite("m=
edia_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
> -       hws[IMX8MP_CLK_MEDIA_DISP1_PIX] =3D imx8m_clk_hw_composite("media=
_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00);
> +       hws[IMX8MP_CLK_MEDIA_DISP1_PIX] =3D imx8m_clk_hw_composite_bus_fl=
ags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_S=
ET_RATE_PARENT);
>         hws[IMX8MP_CLK_MEDIA_CAM2_PIX] =3D imx8m_clk_hw_composite("media_=
cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
>         hws[IMX8MP_CLK_MEDIA_LDB] =3D imx8m_clk_hw_composite("media_ldb",=
 imx8mp_media_ldb_sels, ccm_base + 0xbf00);
>         hws[IMX8MP_CLK_MEMREPAIR] =3D imx8m_clk_hw_composite_critical("me=
m_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index adb7ad649a0d2..aa5202f284f3d 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -442,6 +442,10 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *=
name,
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
>                         IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAUL=
T)
>
> +#define imx8m_clk_hw_composite_bus_flags(name, parent_names, reg, flags)=
 \
> +       _imx8m_clk_hw_composite(name, parent_names, reg, \
> +                       IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_DEFAUL=
T | flags)
> +
>  #define imx8m_clk_hw_composite_bus_critical(name, parent_names, reg)   \
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
>                         IMX_COMPOSITE_BUS, IMX_COMPOSITE_CLK_FLAGS_CRITIC=
AL)
> --
> 2.43.0
>
>
