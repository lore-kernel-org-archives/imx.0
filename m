Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249CF233721
	for <imx@lists.linux.dev>; Sun, 30 Nov 2025 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764508199; cv=none; b=k29nwOKX63eRG6nPhdkEF/A5/xWQE2om5iS4j8ahBDGEA3gXbNS34sphcZNX4AmV9MBRA3XFwLcT3u6qvC/1pVkZCWq9wbooAW0kaXrazgDyyZr2e+Ew6auW6O+1dImmnI74o9XlVlYxgx3DqwgEVzAJOW9CR+sRfqMN435ZQxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764508199; c=relaxed/simple;
	bh=GiWaax2Wc3zbu9RvrCaY6s8VLk1fuWJvLLtVwMu0eLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfAGnmDalt7uiyNxIfcJarUGymSTLs6b+WaTvS9DdWOsAA3jqCgH/hW66r3wCLgKABWyuD/jPBsm7r35Aj/TjPR2NXSF4UgDfGwiFikUmQkg3pPoDIXLuQTkrCFhAZ46UlKcRDZYArgtuk8G32OfjIl7EqDH4o3Tr1KmG8c4txg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=PdBtjL8U; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PdBtjL8U"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29812589890so39031685ad.3
        for <imx@lists.linux.dev>; Sun, 30 Nov 2025 05:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1764508197; x=1765112997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNmbbxbBaoTz8DomyGsXnxRB8wBP1F/AJR530QwYnIc=;
        b=PdBtjL8U+HlixIaiFGME1LjcYlNJ5Rclo3jHwo22k7Z70t5rZXks+CjyYMoIqlKgQQ
         DT9rjJhaphWn+uj8NhSWE12HV1PD7N3P7UMMkDNG9K18OYhMfLj3EGK6WXGBMQ6aFojW
         MMMaySZ1jUvrY7ftXzj9P1a0oPlKtG0RgVxLjS31sUaadDeHJWFBJkHp4n3AMJ86Auew
         rLKlzKmoN5mRGL0vp9Rbt0Ddt/8XvSEHGRwceWcjfUSQ/a/KkjZDlHAGbVMCizFbtYhC
         3kAxnMaaV9B6q34Q3xni1DQk/Pk9nqdqg/vvacmyQWIK0tSUkeEIIrgLLjuoTYAYcIPl
         +Iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764508197; x=1765112997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNmbbxbBaoTz8DomyGsXnxRB8wBP1F/AJR530QwYnIc=;
        b=isqnYVApnBAhMCYxam61nW8RJwFWERQ4TAoAReOGi6iJfB846lurxBsS/T6ONyyX99
         XFatW4XrXhnJibYuIZH1ULkqqbqqjoAQJVeOqWyUdOSBxxYZsX1UjcI3w30DIWw5y4R2
         cwlSoi1JR5qIWNcmFGSYoRQD4f9bKW48pZsUvTSW/TGUWJYn4XednTDjxykdHL/tULsX
         Slf8CC2S0y3MCfYlRLA3DQKKwhhKNo1RxRs/qsn18yCDoeyh9HvlBrusQ2zTqGGV5u2x
         2h5eOH+jPBJlB4pFUi9U/KXQL+1DTfSGEfPmxa78RGp0gr948xQp846R2r+AOG2SNBuG
         hong==
X-Forwarded-Encrypted: i=1; AJvYcCU5TSp9IjC7FTeP7h9TZXICX7MpQDXuosYF0lDJo1umXRxPHj4dr+o8Se3U+mUpHMzhV10=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQoiOum3P7JHgHSOxpNBAfPwabnlfcVZ3VKDpWBkKtI8NFNfzF
	a3usMj1oSStZ+Bp8aYCnX5PI/yIWYJojDkPAeAIYXgWF6+0OANQJa5o0PP0S729JT7h/w1AL798
	rRiySntIIwt1mv3ooZLfdaKhqahoWqp4=
X-Gm-Gg: ASbGncv05saB/3Prvfikm4W2hFXaDXOWm6OoU9Y3irpbQs6cZyNQ4VCP1Ww96yPB6FM
	/cjxKZzHBw3Tvw/HmPVuzOq/Xw0694VXJquKiuLVcNo1JpD/ge8P/f1qLrnWU1lx+A8ovh/YJRd
	LI/UYt0EQQDPnGw22egrNOqtCnxRp1moneEYO5hJQRwkewfuIPd62ltPCgYOGYaBLr+IIaht8KL
	3e+5TTEBZA6kOq+rS7u9roigaLjklvFfi1ULIFX/BJDRopnb+PvArCDam31BjuMa4yZ4bWkz6MQ
	MUJiKZ4GlEh0NirMbaSwVpDLz0ef
X-Google-Smtp-Source: AGHT+IG53GhYkY/+dF5qGVT19Jadft1SJnnMvw5Wcu0qyYtU4QLG8FtzqF0lB0krYhtMk3QufvRzdFqig5aHMJFxvm0=
X-Received: by 2002:a17:903:903:b0:295:a1a5:bae9 with SMTP id
 d9443c01a7336-29b6be86b48mr332545755ad.8.1764508197220; Sun, 30 Nov 2025
 05:09:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Nov 2025 14:09:46 +0100
X-Gm-Features: AWmQ_bkqQ0yeDiiVRXlgzLTrdqIA678_lHRrauQKV29M6KsFuJAoinD-iLMIAaM
Message-ID: <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com>
Subject: Re: [PATCH v2 17/26] drm/meson: encoder_*: use devm_of_drm_get_bridge()
 to put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Fri, Nov 28, 2025 at 5:54=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to devm_of_drm_get_bridge() which puts the bridge
> reference on remove or on probe failure.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c | 2 +-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c  | 2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm=
/meson/meson_encoder_cvbs.c
> index dc374bfc5951..bf8588a5f6dd 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -241,7 +241,7 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
>                 return 0;
>         }
>
> -       meson_encoder_cvbs->next_bridge =3D of_drm_find_bridge(remote);
> +       meson_encoder_cvbs->next_bridge =3D devm_of_drm_get_bridge(priv->=
dev, remote);
>         of_node_put(remote);
>         if (!meson_encoder_cvbs->next_bridge)
>                 return dev_err_probe(priv->dev, -EPROBE_DEFER,
Would you be happy with me sending a patch that replaces the whole
logic in two meson_encoder_{cvbs,dsi,hdmi}.c with
devm_drm_of_get_bridge()?
I see two benefits:
- simpler code
- a patch less in your series (less maintenance burden for you)

What I'm not sure about is how this series interacts with
devm_drm_of_get_bridge() which is why I'm asking before cooking a
patch.


Best regards,
Martin
