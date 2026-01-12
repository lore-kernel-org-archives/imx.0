Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA63277CAB
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 22:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768256530; cv=none; b=KC+fate6+U45vZy3yGJvY8NnlH7mgpEIckK7xy86sXF1hTg6iWBBdOAClK83kCzuXya88kCwEaum4vnTOpTcQaYL25YRVfsY9f/AHA++nHP+C3zDvVUbcL6nW8Lho3nHvlFXaKwe7r8IHKv0pInrbXkod7xbsd9DXoLhBKR2fIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768256530; c=relaxed/simple;
	bh=PpVle6805UxjTJzUzVBlFwx6MAaoWGvgWT0ChdYxX5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khSTHT+H8m2wdZAcXLq9vFzdlU+rQett34Y+njlihr8kfMGvaFOQ5lU0OuuXVbDEMrmFzhxuqbdTVFwLH8laG9pUmFI0m9vGvVifgHx6bDbUikN+WjBAcU5MYnCZYSERKz7806zD4fl0zuI3lVdDKbSb1xP9be9k84cPliqnNTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=K5Gf50A/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="K5Gf50A/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0f3f74587so51509985ad.2
        for <imx@lists.linux.dev>; Mon, 12 Jan 2026 14:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768256528; x=1768861328; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
        b=K5Gf50A/hOaPSNtyCiz4XjLyijIFsrtfwQAiKkH8f3y6qRL3nwFNVId1bXXak8zSlG
         +6Ku/Is92w+asDzIPTPlcxvojh007epBNMSSHWnxsSQzQOmGMAfBr4ytr3/Naok+ZhJO
         RSN/TSF9/5IhBbNuIsDsPIIVlxy1RRu6ufJtNIZntAYXeEnDwUBOBaxdYW2O9O6BV5SC
         b0wupX6LMyaMlmlfAR9JXCGrDN39roXPbXmXH+dTft3345a4UkaYfpj7wWL6BDwikmtG
         HromrsfOq5gtY8v7e9FHp1yPEG2SeySsfsbGmPDYlcRO3WgGTjMKIdqzQ3fb+WfPYwKk
         h4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768256528; x=1768861328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
        b=nIZ2Y9QfwlvCCdfINcRFT8T9mkyP17Us9/jMGtw7ZSg7r7D+YXxf4k53dhjdVDt7me
         OqD9PDz9DyywlSY4jVA29zlsYwaiZZFuIS5oIE0Us4MxZekQz0wYVlmNXaB1ULPWVCKY
         mGQoetTFD5MbEggxVyL6/AiW6Hy8dv+EBKixM2sgOQcBBJ08hTCKfH8SS7LGoZraUaPT
         U3M8EM+R38odUmTB04++DUivbs7KdzcqS8HofViLqv+mP0xqKtoox5bNIsZsTBN6EtmT
         N+dkM46WyDTERFWxMvPSnC3UYZyMEm4JUYfFBsCe+A9m2TZNpidpiEsPw7lR1xa++aFU
         yzxA==
X-Forwarded-Encrypted: i=1; AJvYcCVbW5rxVbrRHbIeNf2xeeDLRHsQXEzoR2pw+iT1qjCfrhGRAHcKL6HsmbldLxTKMkqhmks=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5GgSQEHkcKch30aQoPkXYzaw6Y/e3CU+etnoJvxLlH8D+SK4E
	ZBlo6mrAqn/nKs5J8YVuecrMAlMszDoKiCJ3urEXRkNSm0I2uclp51cJQx/V1+ODQHdrkPjBp2C
	SafDXWYxXPVrVF2ItTsEUV6gDpDpL5Ds=
X-Gm-Gg: AY/fxX63ofKRIJH+kawSOIGfBAt9F6INgtet/uc7bhl6SsH3ty0QzabpE2SFZ+LfoRc
	gAALWsKo3JRbyaSj1bPPHf46H9pn00Ya4vQgoPzAp1zKAg+bgii7MvHwpVxuF336fJ7iy2TWQML
	ymhS3CIXuGqPY33Xr7OSWJHPkHUGs6ErQbGo1SkFZHeGG1v2ghLK6Gvm2Zwn9mZRBgxxVNTowct
	xAO7Uv/lkTX+7MXRnLiOx/vggu5qM2oiXUwsdTMcdgGaScFiCDRTHGWXDwNAmY5riAfyFeF1opK
	niFgiuA1+mqsHzEori4Ezvk4GzMY
X-Google-Smtp-Source: AGHT+IF7+Y5y+W1I/oKu3PaWNvUb9K8PSy+WoJh05TRnlBlC82+qzM+GksYGzWHyPWmgmkdzBXyTwo91e0gYk9qAGBM=
X-Received: by 2002:a17:903:40ca:b0:295:592e:7633 with SMTP id
 d9443c01a7336-2a3ee4c0fb5mr187274885ad.29.1768256527834; Mon, 12 Jan 2026
 14:22:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 12 Jan 2026 23:21:56 +0100
X-Gm-Features: AZwV_Qj9tssGMaPejz2Zl0XwPzPqVqwiSQM5-St_AAUm7gwon2Sgi9P4XfkbVUU
Message-ID: <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Fri, Jan 9, 2026 at 11:03=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
> avoid potential use-after-free ensure the irq is freed before putting the
> dw_hdmi->bridge reference.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev,=
 struct device *master,
>                                    void *data)
>  {
>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       int irq =3D platform_get_irq(pdev, 0);
>
> +       devm_free_irq(dev, irq, meson_dw_hdmi);
I have one question (so I can understand things better):
is there a particular reason why you went with free'ing the IRQ
instead of "just" masking it (so the hardware won't fire anymore of
those IRQs)?


Best regards,
Martin
