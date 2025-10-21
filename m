Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1562EB84B
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 08:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033823; cv=none; b=sa9DaxQEYTlC+NO+IJpfYDIr2LOfPLRs2qxp8yY+tRX94JWEjytUppFhs7Tl9G3ftuXOTXjU9BqD0pMnXtgNPTckhd/2D6KKS8Hi81SyTWftKTtzTUuRrH4XjYCaiP5gN8uNsgBzJJbdpkWRX+nIreK3voQ0eE0NTw4s2q1Usc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033823; c=relaxed/simple;
	bh=6Mv7HAoZABWuGvs2JyOm9HSzUH3AHVBCynCtVRwyJAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3503fvq5DYcsRPLhysUG5PcQkKXOjGoLJQDm8nE3isiHvA9QFjJgl7Mhq+weZpMDxkrPaHNRpCRTIIyJ7Kxsvloi9xgqU5jTzBcGhZMhlg+K6i/I7l/ZOycymlfvrQIpeL4UW9hx/FJTBHOwrMIkzpjBjps1GUrTRnOHXQY6+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=IG3bsFXr; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="IG3bsFXr"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b48d8deafaeso1182908866b.1
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761033820; x=1761638620; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eZOCk0G+WIeYYVlPWpiKCZVOUjneoPQzsl6dTiB4tA=;
        b=IG3bsFXrOSjQVdUUYLglQbBs4424cmMPeTbikwSGat7jiDXftLmX4OFUseFrZPeGZl
         ZutPs0E3NImDKvjJHm47fSPyvAJADhINh2694XYsTxoEbH1/eCaMFb45gqEMzlx9RQcl
         OPrSz22XE0MF8mWi8zlcJ5xUOLeP46pZSSpmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761033820; x=1761638620;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eZOCk0G+WIeYYVlPWpiKCZVOUjneoPQzsl6dTiB4tA=;
        b=KpwjEsqsB8TZWIw2UrpxelSsUqrMFlPvGeAKwJ9/pykzrnLOSkpoA4SwJuaQ9BnbVT
         3ohS+xENaWb9zTNO5VpmIDzteJmXT9qH8o2YNFVDuixtoM6jagbcZCRe7sVQaUfLSFXM
         dr9U5jhUJjmqOp7EGTc1QI0zwASDJgkLhSd+P5fiauQf7SAv/4X7ZrsEh2niyutb6WZr
         uXtqwhr5zvrQqry8RISFAxfJngM16BPL2DXWdma1KzBtxEB5yp+w3cVLdispVDSTdCQA
         msS6jDkLpqGwAZ9nwfJiF1q/R5vTTI+edW7HN6GYC8SAmw+4VMzimXlwZyMNSgGZRhlL
         Jpqw==
X-Forwarded-Encrypted: i=1; AJvYcCVZLjqPkXZVmj+OuB97cKCc7HoMD9/WpkJQ4dTU9WDQjHwDoCHe7D50B3EvM9r1vd8UjpU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwU/7AkZF9A8QIce3OORArbnydLFF2D9EXyqsFZTyzYooSH/0bN
	rpZytmVkoZrz+ad5YhitJCk2mT0KdOoJPUt3iysFQS/TzNJ5rjLsQ74KO61tHZahlKI=
X-Gm-Gg: ASbGncv03yZT/A+Ps2pBkqFDXDZe0GmpDxMGeY4xPOrNR62XzQ9lRSiEWPj7w0iv44G
	eVda06ZNIKyYJBUUFm9h2fG01toMfT2KAFZABdmTSa9hE6GVzmHka2f5XMhVbw3HmThMHRdLoX2
	qNowqa25yvSCjCVWXIjeZcKE5/GfruTiwEcmwdk22LfUrTvENakAlWCTxhpa5Sq7FqGGjzA/9GJ
	v8stfPZFhSZeH6WBDrpMcAAOydnLOIQh7hfjRikeOOAlnVitDG8+PjcZuEDIaj+uN+ED2ppuAA3
	VXwPDFq9+E+2GL+DrypAFu7+yK3LPiATlDlNN9QYjteCoLrc7CzCdPR7ulYiGRt3WdHRqZUJiom
	Do2GFtLuElUpJ+7L2T6F8VT3F7UoeUX6WCh3HOhGAVDiyHVhoIrb3iE/rm7/lUN/LX1JfMFr0U0
	jwrkIH6aXkiyg=
X-Google-Smtp-Source: AGHT+IEbmSLB+yRFZ86qxeD7wG4TxM9uG6ayZpPpFTz88clAHcJph5RIG47VQ/I34aUFg3RPcxflIg==
X-Received: by 2002:a17:906:fe41:b0:b04:aadd:b8d7 with SMTP id a640c23a62f3a-b6471d48347mr1967108166b.13.1761033819926;
        Tue, 21 Oct 2025 01:03:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8581780sm992513566b.31.2025.10.21.01.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 01:03:39 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:03:37 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 2/7] ALSA: Add definitions for the bits in IEC958
 subframe
Message-ID: <aPc-Wad85lQWbqfa@phenom.ffwll.local>
Mail-Followup-To: Shengjiu Wang <shengjiu.wang@nxp.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923053001.2678596-3-shengjiu.wang@nxp.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 

On Tue, Sep 23, 2025 at 01:29:56PM +0800, Shengjiu Wang wrote:
> The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> in HDMI and DisplayPort to describe the audio stream, but hardware device
> may need to reorder the IEC958 bits for internal transmission, so need
> these standard bits definitions for IEC958 subframe format.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Would be good to get a formal ack from alsa maintainers before merging
through drm, just to be sure.

Thanks, Sima

> ---
>  include/sound/asoundef.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> index 09b2c3dffb30..c4a929d4fd51 100644
> --- a/include/sound/asoundef.h
> +++ b/include/sound/asoundef.h
> @@ -12,6 +12,15 @@
>   *        Digital audio interface					    *
>   *                                                                          *
>   ****************************************************************************/
> +/* IEC958 subframe format */
> +#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xfU)
> +#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xfU << 4)
> +#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffffU << 4)
> +#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffffU << 8)
> +#define IEC958_SUBFRAME_VALIDITY	(0x1U << 28)
> +#define IEC958_SUBFRAME_USER_DATA	(0x1U << 29)
> +#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1U << 30)
> +#define IEC958_SUBFRAME_PARITY		(0x1U << 31)
>  
>  /* AES/IEC958 channel status bits */
>  #define IEC958_AES0_PROFESSIONAL	(1<<0)	/* 0 = consumer, 1 = professional */
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
