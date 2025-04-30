Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FFE2609D0
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028327; cv=none; b=hE+wmcX7vm73p6f7pBatKk3qAQj11FgLp7Rx+YLMh3RUXa6A9zQxlR/SGZrEnZm9CfqOkn3RbdkCNGZRsHyI0Yk6ty/RFnvhDBDlja0nFqoZj465jb4+icsMgFcXWc6sr32uPqxJjlrWJr1c+Mm+AVfMhFsiAtvdASuESfKj+hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028327; c=relaxed/simple;
	bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALSFamAjyv+ExgCw81K29zxxNOIP1/2mDXIkPvZ/ZzCoiLNUCJd4fW5pyEtL5lYggkksQRIT9ySTQs59XMqOoM+HU42+QESkcuHGgcC/6s/TrtB55ZaGIyMbs4mT4gay93OBAF4UPL5dl5nP/u11fJLs59AyTbune8EjF4PexE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R5Ts7Bbs; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R5Ts7Bbs"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so6321659a12.2
        for <imx@lists.linux.dev>; Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746028325; x=1746633125; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
        b=R5Ts7Bbs5fvJhGf0cY7fooFMf2kcjZw8+bNOy3HftA5qmX203zimc2Yuxj4VHzZ+xq
         8sf6K6fsl5e3Y43qsAQTupJcLTJ83B5j2q9xTGQdYixzOWOSK9G33+g77W66W5AIfIpT
         LAbVih9nwudoJj6cRGI0HLaipmQix/Dn/kL7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028325; x=1746633125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
        b=dMxaoKaspDKagQabL4Jg7FflcXwnOogu3CWdk4WU5CGzjoiZJpvMALBWEzE4rfXkNX
         C2xBaPwj5RBfjoK/figyc0MXnCD4tvdIXzEdMiU0G5w5Lpysgz4s0jjmWxVtPWL+rnUi
         ct56ti004ec+NVv+HQifJ7ErTZU06ioutEXjHkaeY6p8Ma/YWqOpzSFE7XhJQyyyEsKb
         jX3rLf/0acCHGFe6tevMSNvVEJcRQOFnJE42WLF8L73LNM1LnknSb3E8nGFTIA+WEY/t
         2Oj0AmtF79qxEb+K53bZ86IwGqgTF69TRUHmHR51zuPgHOk6K7eFc1HwP08OJE/j1Q4o
         nYkg==
X-Forwarded-Encrypted: i=1; AJvYcCVKVO9y1pzavzXLWLfHDg3Akt2SiUGakKat8CzP1ZxFjzqi8VMNKv1aa7aVCNpAx5iCvDI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ2Em7KVfaDAlQhUI/jYmxwFybGR43t1lFVdshn7GXOqvG8qlD
	qrtmi2NHothawcEs8fwCIxO/7+z2mDVaPZyrUFnPKgfmAeZqsYigcQ2h3TbDIzDP6MDyhYxHiDo
	=
X-Gm-Gg: ASbGncsf/qJhTmkfU7xo/BOQWBpRW3U5w6JzVxlQ/LEiVuu94eetAH6bst2YeC42IH4
	jy6KXQfK3DkJI9cYdXw4Vxb8DZty4XCNOYBIp/MHwkOmq9MxiMKxvlqzgh5zBPOQ0QkB7iEtEFO
	Pimr9Vqy44PbpHXBpcOcIK7N+hWJHTXEH2qirkmZjoWec9GNVgJjCu7XfMkyZi9O+LU4vj870QM
	RqFshl3t5LebQs2U4Y7+ZhTEw2ges0c8Z1jDHdBFQMyhW0CaeI5GnVKF4m8y9WFcFWLi1dFA9Cq
	Sf/UnY6AAtJIy9hnJP0nog8umBsvPMmy3CP0DyeSTrgPcsJEAfXIuG5YFqjOlz+HfLkOjrVehpb
	fAf/n+6Gy
X-Google-Smtp-Source: AGHT+IHb5TtaopTjQtTuj/aP7gQ5cEeObFVZf2q6dMxETy6ngSiSc18N4ESKK2dEcx8b/OKFrlL5UA==
X-Received: by 2002:a17:90b:1f86:b0:2fe:a8b1:7d8 with SMTP id 98e67ed59e1d1-30a33355ff6mr5056095a91.25.1746028325073;
        Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com. [209.85.215.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3477889csm1806638a91.26.2025.04.30.08.52.04
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af589091049so5664889a12.1
        for <imx@lists.linux.dev>; Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/21rgzZV6gZDhWTsKz63fG51hhVlsKc68VUKkwV5UXsCA4wajFByFpGkc4h90+I02jK8=@lists.linux.dev
X-Received: by 2002:a17:90b:17d0:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-30a3330bd2amr6121407a91.17.1746028323966; Wed, 30 Apr 2025
 08:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com> <20250430123557.3d8b1de4@booty>
In-Reply-To: <20250430123557.3d8b1de4@booty>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 08:51:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
X-Gm-Features: ATxdqUFfYEEYqvpO67K1TXBYapYURxE3d7Z_gt9FzIWHk5tUMzE1QBIfnvJL-xI
Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Christoph Fritz <chf.fritz@googlemail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 30, 2025 at 3:36=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Doug,
>
> On Mon, 28 Apr 2025 13:59:50 -0700
> Doug Anderson <dianders@chromium.org> wrote:
>
> [...]
>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> > Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
>
> Thank you for your review!
>
> However I'll be sending v3 with some differences w.r.t. v2, in order to
> fix the 3 bugs reported by Andy Yan plus a similar one I spotted. The
> fix just is replacing PTR_ERR() with ERR_CAST() in the 4 cases where the
> involved function is returning a pointer instead of an int.
>
> Your review/test tags appear global to the whole patch, thus being the
> patch different I think I cannot include your tags in v3.
>
> Let me know if you think I should do differently.
>
> Sorry about that.

It's fine if you want to drop my tag. I didn't have time to review the
whole thing but I felt like I should at least review the drivers I'm
signed up as a reviewer for. That being said, I'm not counting tags or
anything so I'm not offended if they're dropped.

My understanding is that the hashtag at the end is at least a
semi-standard way to say that my tag only applies to a small part of
the patch, so it seems like it would be OK to carry it, though...

-Doug
