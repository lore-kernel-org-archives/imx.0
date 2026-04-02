Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA3B35DA6C
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 03:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100848; cv=pass; b=Vcwl9JwiFL8R+eTEoupY5Jy1wRscs0VeZc2odLn/6mcDRB9QSxmpaIndMR1UG33VPe7K/GCSN1b5+fz3xjYIR20s+OJMMPmXA53svWgmG2+M3BVFv4YRWW3RqX8X8oHjr8TwMCYOnqoR7RpQyDzl3aoHaE2BopBFOghfeMw1C5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100848; c=relaxed/simple;
	bh=UhjLtvzDpou06cQXwARfEzgAAWqhUpj/dJrjnc9MOWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/GjYGCbCruKUlmXSZoVzR21QPHraYBMqeYotgtpXQNbGILOVtsjLgCkxgus4huu2avcL2vexOyfvYESAAkV3WrAqWdTmZvlNfmWtUP4ArNjtEL/ENuNp2i1HJTJT+LhR33ug8/3TilV96igU05oNgQWlsnVGFHCZHINoRzLrIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+7lYuR3; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+7lYuR3"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso232260a91.1
        for <imx@lists.linux.dev>; Wed, 01 Apr 2026 20:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775100845; cv=none;
        d=google.com; s=arc-20240605;
        b=XlvAKX2WJrW53b5RFm1G5fMFUUxkvLLdX9rm1L/jJ03S3uzD0GYwMtAPbFjV378Kag
         Z5MBBbkSLWCAuIhyj2MohITB2HW7xiVSrylxbySmy3APXJyHAWfvRh2KOAn0/ZoyMlTD
         As9viiUKsTAoMGkf6CoJZ8b4yvfhCLAaVf95waU2dUt39T8BGWyetRD2U31SmPw6Npfz
         MsljFdvfQAC+JtTljywSy2qk0oOD8lNrEETNd/mXFeXT2N/i0b7HMaI2Z7ArHq5R+wX2
         GDpMRZr/4nRo3XkT50e56yrz1qToDo+Tcp+LwPjDNzsS4aw3aoWMjuPsSKhqeyhbsXl3
         OZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/J2uF2/Ma2hV+2GrDKzcXv6J/tpkVJTVgjFT4h2TI+k=;
        fh=hPqlruw52n5FMFQ92yn33CfszW/NTKJg9TGpwwfIoaE=;
        b=GKYILQwI9oMdIFoXLYgv67Ux7B5CvlXfSjmZN397Epzr0uu65oC3rQNMkP1RWhKZce
         ICg4mxyJil6WWuKmiQzXF0PYPOyKXi7mYCweZYIvI6YzdeN3hzFK4WR0O0pMYGTDRgeL
         WJN/66RNzRw6s/Hc4OA//ThPSVPP4FhMv/Sw7KYa+Kv6AA33tTDLLRZmKCSUlbNcolFt
         rp8E2gFccQCH1mK7DvphStalDw4BikcgVE8N+mawvFOXOZ5C0RTZbVrXlLdMR7Q3ovA6
         pF2+X306wWKIYcFU/BqhSbXB7TVT5R4PxRL39UhULtCRgmQISCftV5DbeAyuppFgaH4Q
         EdHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100845; x=1775705645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J2uF2/Ma2hV+2GrDKzcXv6J/tpkVJTVgjFT4h2TI+k=;
        b=F+7lYuR3R1uEtHv5EnjyD1Ly+n7Z/4uvszUxQS+sHBVebSsaPKy0AW7s6lHooNYaTm
         DoDoL6Hz/rH6XYinrEizVW5y37YugdXAZ4/CTQTRPs5HeCSgaJd5fwkwsb6NMWhbeYSV
         ycFxqjViWVTtGBxs/X/DPJh2yX9L1tjs6J9CQk1SnA87cUIL45KTFf1WBT1mw4KoAFOJ
         a2rrgjQthCe5aak3giTkWMtdaKfiqcrUkAYFN9vHXcB5CRdq7NT/M9gOi3Ht8x/FM5w6
         iOAVLc2Ld5N+pObJFOdVkyoRoNL9s2IOAHhxsjhQnORH+aFWRAoRrV5kPOW3DmSmvVYc
         iMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100845; x=1775705645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/J2uF2/Ma2hV+2GrDKzcXv6J/tpkVJTVgjFT4h2TI+k=;
        b=UjeMF3X4j9aJAkShd/NYu8s6ChxFfJ0+WuS6gUhQRSDcY7wAsow4TDxn4TSR3TCxKW
         zkD9yCIjN4VWiEjHZ00EYHLHs4409if90mnfZMSADn3TYMQgH+ZY8k8qlf7fzUGCWclQ
         VifahdMTPzMNqdLwXRm2XeCGfw7Jw2RyX/GtXGybole7La4XtxCAA0hAp05qQXe3vljR
         VbW5FvlbZo+sfBP7uGDWR9AB9pAJYiWWLNo/+ZW3Hx/uSmuXEJD7yocvsH272sEVULPD
         irRs3Q22eWB8VE+6kMz62ubxrR24TBdc7cc7Whj88KwPBqZ4Xhg9v+hHEXi+ohC0iLAT
         IpGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmMgMM1vgSbCkdKoOAgxT7DAhg/UCp6nLs7FMNCX1zyq1VotFxa1sAzrUkApF8lGiXcbU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn234Yp41qEUsn7z4ZBbK1WCulMSM+7bhWIUrJd66KxEOJpR21
	FV3IgwKFWGjrzIVkTWgXh3ypjJX3JfWFuS/ry0dsvFUedwN3rs6RdiYS7vLziNKluk/mltvdiPL
	43o8itWQXRdb7FofkHrhWt44re4d+NzY=
X-Gm-Gg: ATEYQzwBxhu+kbUFXUhxf5bHp7xVaigrskoBfWKQcFm8mrJ5OpECQ+Ukwdpoc9JBnEZ
	PfmvHzfppDeoREmWKv6bdSh5zgDPzJ8Qg1u2yZrQEnJHCXykeEVbfH6rgGXItxdL+c3Wiy9HqMo
	L9WXocoUkwd6g2m1xbO0tvxxdetO9iWkfbpY7mrzQqL7LGmqdvTEhK5auS3P82B6wF1nxLvSwzU
	5Xjno6yTANxqyNiyWg4K04oDkW2KKs5kz+176XvpahJvfb/tJUHfxHpJfbuuocuQoKrBZCQUHa6
	UUPj3HI=
X-Received: by 2002:a17:903:32cc:b0:2b0:5990:cf1e with SMTP id
 d9443c01a7336-2b269c80fd2mr58675965ad.33.1775100844939; Wed, 01 Apr 2026
 20:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250911-v6-16-topic-sdma-v2-0-d315f56343b5@pengutronix.de> <20250911-v6-16-topic-sdma-v2-2-d315f56343b5@pengutronix.de>
In-Reply-To: <20250911-v6-16-topic-sdma-v2-2-d315f56343b5@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 2 Apr 2026 11:33:52 +0800
X-Gm-Features: AQROBzCSdKcZaLbfDao98j_I1toGLvfE9bJe_Lqq7ufOyEXTyqcaETde8D_cryk
Message-ID: <CAA+D8APVK8SUSK7_mQ0Rr5EYSSkxaWG52KYRKN=XpBV-dZTskg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] dmaengine: imx-sdma: fix spba-bus handling for i.MX8M
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>, dmaengine@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 6:05=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Starting with i.MX8M* devices there are multiple spba-busses so we can't
> just search the whole DT for the first spba-bus match and take it.
> Instead we need to check for each device to which bus it belongs and
> setup the spba_{start,end}_addr accordingly per sdma_channel.
>
> While on it, don't ignore errors from of_address_to_resource() if they
> are valid.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/dma/imx-sdma.c | 58 ++++++++++++++++++++++++++++++++++----------=
------
>  1 file changed, 40 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 3ecb917214b1268b148a29df697b780bc462afa4..56daaeb7df03986850c9c7427=
3d0816700581dc0 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -429,6 +429,8 @@ struct sdma_desc {
>   * @event_mask:                event mask used in p_2_p script
>   * @watermark_level:   value for gReg[7], some script will extend it fro=
m
>   *                     basic watermark such as p_2_p
> + * @spba_start_addr:   SDMA controller SPBA bus start address
> + * @spba_end_addr:     SDMA controller SPBA bus end address
>   * @shp_addr:          value for gReg[6]
>   * @per_addr:          value for gReg[2]
>   * @status:            status of dma channel
> @@ -461,6 +463,8 @@ struct sdma_channel {
>         dma_addr_t                      per_address, per_address2;
>         unsigned long                   event_mask[2];
>         unsigned long                   watermark_level;
> +       u32                             spba_start_addr;
> +       u32                             spba_end_addr;
>         u32                             shp_addr, per_addr;
>         enum dma_status                 status;
>         struct imx_dma_data             data;
> @@ -534,8 +538,6 @@ struct sdma_engine {
>         u32                             script_number;
>         struct sdma_script_start_addrs  *script_addrs;
>         const struct sdma_driver_data   *drvdata;
> -       u32                             spba_start_addr;
> -       u32                             spba_end_addr;
>         unsigned int                    irq;
>         dma_addr_t                      bd0_phys;
>         struct sdma_buffer_descriptor   *bd0;
> @@ -1236,8 +1238,6 @@ static void sdma_channel_synchronize(struct dma_cha=
n *chan)
>
>  static void sdma_set_watermarklevel_for_p2p(struct sdma_channel *sdmac)
>  {
> -       struct sdma_engine *sdma =3D sdmac->sdma;
> -
>         int lwml =3D sdmac->watermark_level & SDMA_WATERMARK_LEVEL_LWML;
>         int hwml =3D (sdmac->watermark_level & SDMA_WATERMARK_LEVEL_HWML)=
 >> 16;
>
> @@ -1263,12 +1263,12 @@ static void sdma_set_watermarklevel_for_p2p(struc=
t sdma_channel *sdmac)
>                 swap(sdmac->event_mask[0], sdmac->event_mask[1]);
>         }
>
> -       if (sdmac->per_address2 >=3D sdma->spba_start_addr &&
> -                       sdmac->per_address2 <=3D sdma->spba_end_addr)
> +       if (sdmac->per_address2 >=3D sdmac->spba_start_addr &&
> +                       sdmac->per_address2 <=3D sdmac->spba_end_addr)
>                 sdmac->watermark_level |=3D SDMA_WATERMARK_LEVEL_SP;
>
> -       if (sdmac->per_address >=3D sdma->spba_start_addr &&
> -                       sdmac->per_address <=3D sdma->spba_end_addr)
> +       if (sdmac->per_address >=3D sdmac->spba_start_addr &&
> +                       sdmac->per_address <=3D sdmac->spba_end_addr)
>                 sdmac->watermark_level |=3D SDMA_WATERMARK_LEVEL_DP;
>
>         sdmac->watermark_level |=3D SDMA_WATERMARK_LEVEL_CONT;
> @@ -1447,6 +1447,31 @@ static void sdma_desc_free(struct virt_dma_desc *v=
d)
>         kfree(desc);
>  }
>
> +static int sdma_config_spba_slave(struct dma_chan *chan)
> +{
> +       struct sdma_channel *sdmac =3D to_sdma_chan(chan);
> +       struct device_node *spba_bus;
> +       struct resource spba_res;
> +       int ret;
> +
> +       spba_bus =3D of_get_parent(chan->slave->of_node);

if the chan is requested by __dma_request_channel(),  the chan->slave =3D N=
ULL
Then there will be an issue here.

Best regards
Shengjiu Wang

> +       /* Device doesn't belong to the spba-bus */
> +       if (!of_device_is_compatible(spba_bus, "fsl,spba-bus"))
> +               return 0;
> +
> +       ret =3D of_address_to_resource(spba_bus, 0, &spba_res);
> +       of_node_put(spba_bus);
> +       if (ret) {
> +               dev_err(sdmac->sdma->dev, "Failed to get spba-bus resourc=
es\n");
> +               return -EINVAL;
> +       }
> +
> +       sdmac->spba_start_addr =3D spba_res.start;
> +       sdmac->spba_end_addr =3D spba_res.end;
> +
> +       return 0;
> +}
> +
>  static int sdma_alloc_chan_resources(struct dma_chan *chan)
>  {
>         struct sdma_channel *sdmac =3D to_sdma_chan(chan);
> @@ -1527,6 +1552,8 @@ static void sdma_free_chan_resources(struct dma_cha=
n *chan)
>
>         sdmac->event_id0 =3D 0;
>         sdmac->event_id1 =3D 0;
> +       sdmac->spba_start_addr =3D 0;
> +       sdmac->spba_end_addr =3D 0;
>
>         sdma_set_channel_priority(sdmac, 0);
>
> @@ -1837,6 +1864,7 @@ static int sdma_config(struct dma_chan *chan,
>  {
>         struct sdma_channel *sdmac =3D to_sdma_chan(chan);
>         struct sdma_engine *sdma =3D sdmac->sdma;
> +       int ret;
>
>         memcpy(&sdmac->slave_config, dmaengine_cfg, sizeof(*dmaengine_cfg=
));
>
> @@ -1867,6 +1895,10 @@ static int sdma_config(struct dma_chan *chan,
>                 sdma_event_enable(sdmac, sdmac->event_id1);
>         }
>
> +       ret =3D sdma_config_spba_slave(chan);
> +       if (ret)
> +               return ret;
> +
>         return 0;
>  }
>
> @@ -2235,11 +2267,9 @@ static struct dma_chan *sdma_xlate(struct of_phand=
le_args *dma_spec,
>  static int sdma_probe(struct platform_device *pdev)
>  {
>         struct device_node *np =3D pdev->dev.of_node;
> -       struct device_node *spba_bus;
>         const char *fw_name;
>         int ret;
>         int irq;
> -       struct resource spba_res;
>         int i;
>         struct sdma_engine *sdma;
>         s32 *saddr_arr;
> @@ -2375,14 +2405,6 @@ static int sdma_probe(struct platform_device *pdev=
)
>                         dev_err(&pdev->dev, "failed to register controlle=
r\n");
>                         goto err_register;
>                 }
> -
> -               spba_bus =3D of_find_compatible_node(NULL, NULL, "fsl,spb=
a-bus");
> -               ret =3D of_address_to_resource(spba_bus, 0, &spba_res);
> -               if (!ret) {
> -                       sdma->spba_start_addr =3D spba_res.start;
> -                       sdma->spba_end_addr =3D spba_res.end;
> -               }
> -               of_node_put(spba_bus);
>         }
>
>         /*
>
> --
> 2.47.3
>
>
