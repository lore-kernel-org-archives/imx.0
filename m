Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07184266AC
	for <imx@lists.linux.dev>; Wed,  6 May 2026 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075899; cv=pass; b=Vr1W3XTZzLjpvCmxtoFpq0V6w6fEPuJXm5tSSQhUty4q9Kx+nfudc7DUQ7MBlIGnj0duGEVlXm0bLKUhqBguRU49w2BI6jVLYgIPTaOZybGpqDElzpl7xz8uEOkCtHHqcmgQ9A7YANlOuHLTYKVQ++mlnRzNisevdi0xta0wSHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075899; c=relaxed/simple;
	bh=eaImYnZHNc8mXAJzozd++XRV+p2+tu+Ffdsrm6vJlbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8Sz0mgaV+4+HDQ96ULYZZJB2QsmA1Pl4XG0jjgUm8s7f994oOoCFh4ACBfhHGYk4MMPm1s1pVr135799oPXlvRkR73A1TbBeQcGcfF2Dhh6W1HiDl6gv/kBZaxO7Em9Rm+mallSdiLZMUlPn6RstTaTc52W+S7j+zyIrI2++rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuRrd1qZ; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuRrd1qZ"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6563f83ae9fso6918926d50.1
        for <imx@lists.linux.dev>; Wed, 06 May 2026 06:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778075898; cv=none;
        d=google.com; s=arc-20240605;
        b=a5qP4Jl023WE3Jcbsf88GYPeea0wdG4rTfC6l7nYSTD2fazHhbrGfEM4bG733DUBFm
         mWVwVYQ/8w/seOakZHOuq9AJEaYOxJRjb7JIBbzDSLbhk0uyaEdNaIp0hkgPPJEyfNYx
         XTFy4jEDzXTfBWCd7uKzdXG3SevFDuDEq6reisQ63hH91eNDww7gydEyaSvavS6Vnohc
         n3DjNHsCJCflC+mHn2mG5kC/EHdekx/VwIOeh4oE2tTsuLaJKhuBgBPtFbCt95XceNPy
         nZIN0O1gYoUeiSLCL9+/2Jy9E8TuSYCRpY86rtxg6ryPei+uHqHqsYMB21lk8n3tzR9+
         Ri6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yAGZRzNWoj71eYuAlCwOROEzF/QQfxUQn3hZ1d0klWU=;
        fh=dseSGs2Yn9+TFjaB1/6h4HbxcsdeTOk2RZFCvT019lc=;
        b=dhgYNUz9Ki4e5KgbZhrDhXihkmtxz77gC4WrCtmGfmZPiarRpEPmpw3AW26PgkqO4v
         PlD5sAm9MwWtPqyOWH2OApXotKUFzBGUTaVI0Y9vzpSYlTXE4Om7jt+1jPqTLFh2csV7
         ecbYqOlmn+QjBIlFQWFfqesvNiqd3fx4Z5mJ462TxZs6OfHJOeVA/tEAGK9XTLF3/cYB
         kWDjTCcmhw2kQdUfgSH+N2dHdGKEQhtXcCJ9cs8KVbUXFeTYCrDuX6TI43Ke9LsVLm1Y
         WYL+6MPgulCy7K0Taur0PoWR8KtNW6cgrE9GCWLquyloQoko+vL8OfF/8J0jphby1DPP
         LwYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778075898; x=1778680698; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yAGZRzNWoj71eYuAlCwOROEzF/QQfxUQn3hZ1d0klWU=;
        b=EuRrd1qZjch/+jvbUTHJ8u4YpR8zm+N56VIKtthjOytV96iPWQg++x5E1JXb2S1pPx
         y9zV9+2+EGiamgkop5ESaKpdN2WvjpzKnuo/N8AYMlpEamKuqJ7xM7HyyFUSXOvBw2aR
         LsC/VuVJ0bdDh+mnzk4qO9Ffjk13TpMZr7XRMGKP/O8FNFQX44mmcuz6QHvqBsdkJFX+
         /qL1yoKtrul1PcoOEYKMx+XY4SAj5rMrzl55+AoXntapzn9RuJr74Mv9bdv0Xvw4g3i7
         txBe4105wPaS4PkNVrgHM+FbFqqC2WSVERrlQdLvCkNVfePmIHTTTgeuB8PIX4pPZdzx
         dl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778075898; x=1778680698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAGZRzNWoj71eYuAlCwOROEzF/QQfxUQn3hZ1d0klWU=;
        b=m5gJ5kw+S8TWMxKlt7qavFBsv3TRqTHNaY4eWVZIE4bvCAaOWOmMfi/btX6ZQg136I
         bVzHS6kFIXykyvac684OdawM4tHsCkDnG9e08SQGCdBkE1tZ9FlGC1Gf5HpquUpwC2IN
         eMwhtDlegJcUGi2y7NOH/xS3hboWr4Dg6W0Iph2HaFIqoC31bNZEFddFwn4Bx02mj5/V
         ArjEPVsF3ypPhz0IccQWNAOlwQOD3vvGCqXGnBMGrZXZ8olsKbKi3omk7rD8eHeOywO7
         n2PhsCN8mtSedyUl+2Ri5e8oB/g1TIPMAfsVBtC2cQT6YHiCUozUdLFZ+68niHHaDIhL
         95Nw==
X-Forwarded-Encrypted: i=1; AFNElJ85mw5iXMSupc8cSD6rPdQFMHzgZtg7f8FbJcCO/i5Su1b3TVO+aedSwVN9vfss4EIBRiw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKHpFeu0kxIHJsKemk3NBLj8JhRIBAVmiAbY9594HNfQxb47dw
	uwGgIYcYkIiRwuVibAPj1Ks7sWqnJ80JP6V26bKO0fxig7sbAAb4SEPzXfuHdcoPvIdtZ7qnBy1
	o/127KewE7HzdUCiXQG+7IB5oiTWtZjo=
X-Gm-Gg: AeBDieug7ck/YhAHsKOGlYq5K2gCwUFMuawZxWKmWCEraeHckMVGKIXQU8cZKloskKl
	Ji/yumRpeafI549P60iZi38Dl6mt3KjOSG7VLspwIBBVWiTL3QMDrgSn8DRykYq336lzs4MGDqR
	2XAQbWwfUkbd+rnVb2jxDGKuKq+vhaDm8p9iUGsnQdmy2xe2lPR+Nm4BQJ54BFhj1JkMOAUNOnf
	lfPa/gn8vp3j2Jj7wwPmckS8H+bikHEAjKFJPESi5KOyyO6Hql+rVKQhie98lXHQFvLKS87bA1I
	gJ2HUfeYj1bdM5+LQPn/V7OGhKPUJw==
X-Received: by 2002:a05:690e:1688:b0:651:be8b:e87e with SMTP id
 956f58d0204a3-65c799989cemr4075950d50.34.1778075897748; Wed, 06 May 2026
 06:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260506092324.635014-1-lgs201920130244@gmail.com> <afsO9TxVuz79FFQ0@raspi>
In-Reply-To: <afsO9TxVuz79FFQ0@raspi>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 6 May 2026 21:58:07 +0800
X-Gm-Features: AVHnY4IW3B6qWimauAAC6R2YoxAVTsxlXp2RYpmYRhFA5w6dajkgOR-Qizc8_E8
Message-ID: <CANUHTR8PNO-3hfEMCz4Zz_2ERLonE7OyNzPWtAaDtVpNB=YGhw@mail.gmail.com>
Subject: Re: [PATCH v5] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
 device_node cleanup
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Liu,

Thanks for the clarification.

On Wed, 6 May 2026 at 17:49, Liu Ying <victor.liu@nxp.com> wrote:
>

>
> By "minimal" in v4 comment, I meant not to use __free(device_node)
> in imx8qxp_pxl2dpi_get_available_ep_from_port() and
> imx8qxp_pxl2dpi_set_pixel_link_sel() - please keep using
> __free(device_node) in imx8qxp_pxl2dpi_find_next_bridge().
>
>
> >   - Keep imx8qxp_pxl2dpi_get_available_ep_from_port() unchanged.
>
> No, please fix imx8qxp_pxl2dpi_get_available_ep_from_port() to make it
> return int.
>
> >   - Do not change imx8qxp_pxl2dpi_set_pixel_link_sel().
>
> No, you need to change it.
>
> --
> Regards,
> Liu Ying

I misunderstood your previous comment. I will update the patch to keep
using __free(device_node) in imx8qxp_pxl2dpi_find_next_bridge(),
change imx8qxp_pxl2dpi_get_available_ep_from_port() to return int and
pass the endpoint through an output argument, but avoid adding cleanup
action usage in imx8qxp_pxl2dpi_get_available_ep_from_port() and
imx8qxp_pxl2dpi_set_pixel_link_sel().

I will also drop the unnecessary local NULL initialization for ep,
since the helper initializes the output argument to NULL.

I will send a v6.

Best regards,
Guangshuo
