Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64FD2ECE92
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761034072; cv=none; b=ncNKc5pXKeQSbwgums/D2DwvIPKjaQIznSuCZhM1DXydkwfd2vDiZcny/TprFTva6IuGiq6cMEKhMJpK/TRbTN4pSXALFn5bkCUNa9yybWfYJtk+ym5B/JeIz/P2MUk2ZLAjKMj7R0JJfukwzE/AFfv6GAG3lv7ew6gL8i8xePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761034072; c=relaxed/simple;
	bh=KX8ZO3Auv88cdBaxObOo+VwnKCNwmQ3G5RcSBR8MIUQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qu/0KP+70oiUyyoQ82jh4Hey4chkMCNYJKCsWnj30pO0OCKG8RUJOXC/c83qHSDjoY3+twCHFef7rtT46TEiAQ9F8RztWIq+y/MKvwaiH5sbjhAhsfdc1LehyUCQ+eusvRFpaKCTu7xdBJn3VnRUZjtW8DogBbXKg4MkEmVYg2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=a8vF6VyQ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="a8vF6VyQ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c3d7e2217so6846160a12.3
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 01:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761034068; x=1761638868; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=llmJhZD012rxZY/wm+1U/bowfeca4YxBvqXnIKJ9gBs=;
        b=a8vF6VyQXHPdUjOsw2c7Wpkn11pApa6ktfPAX24aa/sQGJZ6W2mKHf32/ZelnyzaQs
         yPMB0mYzwWz1bbmRpONyUWtJGeS1JAcA9fXtlyaLBV26DZxLpTYTnjphsib6HEO1zMq/
         LqIJFYEp4abz3/G6toca7d5yncxJSXzfUBU5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761034068; x=1761638868;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llmJhZD012rxZY/wm+1U/bowfeca4YxBvqXnIKJ9gBs=;
        b=PPXuFs6WwyURHbRS0f7CBiLMESSAoNVmEse0DEkkPX5arnze8xmax2VBCM0O2yb4qR
         O7WH38pZ80sEcl1lwp9ToyNa1dHVrUQp9liLg9no2SVEMQC6tlmwmT1Hy8cm+5d6e/81
         THHQr+Tll+MBJWkMwxuQZStL71E9kXuAwIanSLvkEpKEEUsy2mzHE+9vv+5dyVNhWrtI
         C2StKx/VaiVbahQ6OxI4ErQL3/v0tScQ21McIbdhCYky/Dhtwc1BmPYRQmcXV7q1pe99
         37b7fTKOfkBNFlw/V6k1dYz2bthk8e2qgbUpYuEU5uQ5xdl6nc5apYUjiGIymnBJCR42
         P4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUqFf3uSa+WDJi4vqQc5PwfUatLWFaEEtj6a1aUt9twWSpE8uC8IR0u6eAFLLqlX+4QEzU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwC1Mqp5nWdYV/Ba32LOveQGUGzRUEn8DBDJUvrcB+4aDpn81Xp
	iQCvneKyOVfJtDUA4FXtibfQbGCRR2mgXExQGwSuD8jxKU7bRMWvbx+7OdBPlMXb3xY=
X-Gm-Gg: ASbGncu94seueXGVhk0nwQdm8r7opi+s4XUfp2JnMFLFF7ws0OxYjO3AeHwhLgPqcGJ
	xOw4uHJS7L8wyztw01INrKAsqQvL4IziwkZU1oQhdbvmCyGMiePZZL3VxOZlssfDwGuzQoiCTwb
	fqw3Ix8tn53WPc/7tUQeGTV/NT8uo3UQ42G+rEk5PTXYqsZzEFn+xPG3SEBRxH+BFt5JiO88XFe
	dgTm5OyAM3yYYbaVRHzgiVQnx97Nonnn//S8m4gss8w02+P56N0Rnf6X6++5hCnuYu5A0oh1u59
	O3oy38unGAhTGTe5B17VW2AXF6o2wTHngCnXasmqx4nrfQBVUB2EWeH407UqIz1r1tzm4cWFVQH
	QBFK8s7yEh0C6neMa7XvXgtb33A/biDCuCfvkPn0Tj3FvqRG8qYrjQmR4hRFfzLsXD++zA3icnG
	83/nuFrEHxmKMES0fQPlF3Sg==
X-Google-Smtp-Source: AGHT+IEGcQ2tB+9FLkcsMzH3Z3OqGyaRZtqOqXHeWD/7JycNzUq8R6JyQRoeUwJtVWAc3tO+BkBXoA==
X-Received: by 2002:a17:907:2d23:b0:b5c:74fb:b618 with SMTP id a640c23a62f3a-b6472c61933mr1959457166b.12.1761034067061;
        Tue, 21 Oct 2025 01:07:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab65d6sm8600484a12.14.2025.10.21.01.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 01:07:46 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:07:44 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
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
Message-ID: <aPc_UBy5-e6HIW9I@phenom.ffwll.local>
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
 <aPc-Wad85lQWbqfa@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPc-Wad85lQWbqfa@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 

On Tue, Oct 21, 2025 at 10:03:37AM +0200, Simona Vetter wrote:
> On Tue, Sep 23, 2025 at 01:29:56PM +0800, Shengjiu Wang wrote:
> > The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> > in HDMI and DisplayPort to describe the audio stream, but hardware device
> > may need to reorder the IEC958 bits for internal transmission, so need
> > these standard bits definitions for IEC958 subframe format.
> > 
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Takashi Iwai <tiwai@suse.de>
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Would be good to get a formal ack from alsa maintainers before merging
> through drm, just to be sure.

Sorry wasn't fully awake yet, I meant that it should be recorded in the
commit. dim has a check for this stuff now and it fired for your patch.
-Sima

> 
> Thanks, Sima
> 
> > ---
> >  include/sound/asoundef.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> > index 09b2c3dffb30..c4a929d4fd51 100644
> > --- a/include/sound/asoundef.h
> > +++ b/include/sound/asoundef.h
> > @@ -12,6 +12,15 @@
> >   *        Digital audio interface					    *
> >   *                                                                          *
> >   ****************************************************************************/
> > +/* IEC958 subframe format */
> > +#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xfU)
> > +#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xfU << 4)
> > +#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffffU << 4)
> > +#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffffU << 8)
> > +#define IEC958_SUBFRAME_VALIDITY	(0x1U << 28)
> > +#define IEC958_SUBFRAME_USER_DATA	(0x1U << 29)
> > +#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1U << 30)
> > +#define IEC958_SUBFRAME_PARITY		(0x1U << 31)
> >  
> >  /* AES/IEC958 channel status bits */
> >  #define IEC958_AES0_PROFESSIONAL	(1<<0)	/* 0 = consumer, 1 = professional */
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
