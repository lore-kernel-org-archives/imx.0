Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1481C69C
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 01:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725585845; cv=none; b=e8+RYpMSLawF7Iw5QBm4TU7v8AEvsTfNAyhUhYjtfNNODLaXqkjP2vEh2TAh2H/rAliO10RHPhAMd7O2WUYz101VdvYGtbtkmXtybTl9nAVhHgA2ncqdT8hJol1X1Z4C5Ji891lyt11NkQ9DWv9yClrK1rnxORo8mkgTk+mzvbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725585845; c=relaxed/simple;
	bh=fuEix3DlvVeTuOrM1KkbRGOiFc9Wy3crOaLkMDjAa+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzYmdgxrNJ3uua14zwIBJcnDY0x/tv8AuOmf3cZBUTDS1DGKj6qsGnul/cUr914csIam03PSw9QgkHVqo15jEpH+/QSmgZO+QHgiIzMIi4tD7sX51wi56FJeKi4eTg/zBaieme6DjVY/AfKmE1HcHF3gcLZNZsiKGGfUc8emHfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba64D/AK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba64D/AK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d5f5d8cc01so1033644a91.0
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 18:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725585842; x=1726190642; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNUn9mXf5C6UNEuTt3eUfW8jIvalDCTepQKAUNKiQ+Q=;
        b=ba64D/AKkEy5ozYX3fTZwpnONFutU655ZKqKIbzTOhhnxY00hPoEu9gJBGj1J3zrTG
         9mNAXLLFz7exMO2NmfbP5+DvxI+pQgULhNMy90EKB6+IDc6hFL77NiFVWVR8Rp85c56L
         NfcbJMjqgOyfovQaMVehzAvBXTiYiRlMuDJpA4TT4w6f8UB2JojC0HTKXUOuLGoOfBZD
         E1Ky+52JfDgrDlvUGh3hw5xe5n3usYKaHbbYdMaJfnhelCvWBDlsJAWYxTRBOwJZuEIJ
         2G7PgLBjQHMb2sIYd5V5CRG0kvr/55V2k/a80CbHSiSTp70oxo2WXK97JVJBgAg/z3Rw
         S2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725585842; x=1726190642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNUn9mXf5C6UNEuTt3eUfW8jIvalDCTepQKAUNKiQ+Q=;
        b=X1x1pxwzf+zsHOCkSfuz8vYV5JLIZIxl88zd6ETh2qT0aaCVuWCZbhvMhy13sMNEE2
         hwF2jTRb60TeaAgYx5DSfkXSYIGvJbYTa3WImEVG4iO79gJm93IpP9y3pMYnS7d63ApD
         Fig5Ejvy+EzDyexn1irOYIqv1N3TeKFFQqrdUo+0J3Rj3fakr8YawihMS+9Y0fvw48QB
         nt6+wSHzuLJl5h/fSAUTdThBV+Y5C4wqyq9dXSaeoPoMPWVZ7Xd+22cxQtkfHI1Yu37m
         BIdFQ+AF9HPN0TkaVfYRWyPpzBxHP3ngrsJxKhcEKaPix9BTSx0+uVUA7/L3zY5ve2LL
         98gg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ8jL1PjmzymuJul8VVx2ieaNxeiTqhzjgx3d+JCc3bsTgnV8wAEU6D5qXgpN1Fg3pvrA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhkSfFwTemb8Wsm8Ngb7GfJIkupZjhcNOnZCMSl0rM79/6VWkA
	NE6ZKQr+STZ/4+tgQjI4dHDwytEFRyvvojUoTUJmu60KBgiTwJ9zKjIM15ae9axiWcbJ/xhp9bn
	4cVfl9IRRj7BTppM0gW9RFoeCXLg=
X-Google-Smtp-Source: AGHT+IEzidPjWUAxLPR+PLVPSNwJ7lIMn8k2LTrBVIUEZVpFdJ+OKRUvczF0LpmZQ/Y8yM7A1+ju97f0lISmBkyxGkU=
X-Received: by 2002:a17:90a:a018:b0:2d8:719d:98a2 with SMTP id
 98e67ed59e1d1-2dad50294d4mr1690680a91.7.1725585842408; Thu, 05 Sep 2024
 18:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904083103.1257480-1-dominique.martinet@atmark-techno.com>
In-Reply-To: <20240904083103.1257480-1-dominique.martinet@atmark-techno.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 5 Sep 2024 20:23:51 -0500
Message-ID: <CAHCN7xLmZYZcHyPh3gy20vFKP7aTDKvWu+a_mbG6LN2gdEifTA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with
 selected clock
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frieder Schrempf <frieder.schrempf@kontron.de>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 3:31=E2=80=AFAM Dominique Martinet
<dominique.martinet@atmark-techno.com> wrote:
>
> This allows the hdmi driver to pick e.g. 64.8MHz instead of 65Mhz when we
> cannot output the exact frequency, enabling the imx8mp HDMI output to
> support more modes
>
I went from 19 options on Modetest with my AOC 4K monitor to 31.  Of
those 31, three did not appear to sync, but not all the frequencies in
the LUT sync for me either, so I have no objection to moving forward
with this, but I wonder if we should have a note in there about why we
have a 5% tolerance.

> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>

Tested-by:  Adam Ford <aford173@gmail.com> #imx8mp-beacon

> ---
> This completes the patch series sent by Adam Ford here:
> https://lkml.kernel.org/r/20240904023310.163371-1-aford173@gmail.com
>
> and makes the cheap screens we recommend work with our imx8mp board
> without further kludging.
>
>
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/dr=
m/bridge/imx/imx8mp-hdmi-tx.c
> index 13bc570c5473..9431cd5e06c3 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -23,6 +23,7 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *d=
ata,
>                        const struct drm_display_mode *mode)
>  {
>         struct imx8mp_hdmi *hdmi =3D (struct imx8mp_hdmi *)data;
> +       long round_rate;
>
>         if (mode->clock < 13500)
>                 return MODE_CLOCK_LOW;
> @@ -30,8 +31,9 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *d=
ata,
>         if (mode->clock > 297000)
>                 return MODE_CLOCK_HIGH;
>
> -       if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=3D
> -           mode->clock * 1000)
> +       round_rate =3D clk_round_rate(hdmi->pixclk, mode->clock * 1000);
> +       /* accept 0.5% =3D 1/200 =3D 5/1000 tolerance */
> +       if (abs(round_rate - mode->clock * 1000) > mode->clock * 5)
>                 return MODE_CLOCK_RANGE;
>
>         /* We don't support double-clocked and Interlaced modes */
> --
> 2.39.2
>
>
