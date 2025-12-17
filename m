Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5EB3D6F
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 00:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765929714; cv=none; b=pj374eTus1bB+dfrC5w3dV8NblqJUic70i0h4/u7TneJDh9k9vH++s47hu2Kvi+gE00UGJlltwVcasBXekuV0fdgIe5PhwnlrSzMt3QkXskZXgxyMk1FkgG32kcU5VgkqbvMv+L/f/u0vsY4+Xn84AwfV7W9unWNd5CSp6HQEEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765929714; c=relaxed/simple;
	bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g6MCpUcMy9TY6OVl/7WOenpL+brhcijCFSOBpHcC5F4LJL7C9bs1eVBma4bX2GAL6fgJtOav89vQLHN8d7tSD8YPFwDu8VRzZI5VEgBnalpdfrrvWYzKtpm9wrr3IG5JH2K2NAOdUh4TAnEumuSY/dDczjmmbBbuOm7Yaz9BRPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=UpsLkifG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UpsLkifG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so30328175ad.3
        for <imx@lists.linux.dev>; Tue, 16 Dec 2025 16:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1765929712; x=1766534512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
        b=UpsLkifGrUmfyydhK5y666kqPKqjqlt0gFT98GC6qpO7Szp+x1HCBRE1ZI/uiz1Dco
         woQleHc3KuZ5lf9g6sLdfhIh7fgRYSH0aZn9cV8+5hO0euvo3ZQa4lV1E6YULopUEMgg
         df0sRZg2iFIwyky2LdIgKGScmBQoDpd9433UshPQ2mxRGnShXtRJDVhqEFg+4dg5EKtT
         RocHSU/9NSZxuP2yZYyAX1z0skGG8sj+3P7/X8GvPfPwsdWa+S1dqB+fO02DYFBEFbjz
         Eu02HmNOFXuNtTkun9N277HKhHW9hYNGr/cOpx5xnWyvLxGbfOusnKtiULadoGxS/GN9
         +BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765929712; x=1766534512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O5eCzl8UBxQzsjN75O8DpTQOlVvtN45HumiW/nT7Mrc=;
        b=eJL+DXzNVk02mVMJrLOihBhU5GjLW1Sn591cqCDmk0esEmTe/dlbutwyIfohx0ZbNI
         Q7bcOMs/VVucV2IjRNxxf8QMIuPksnY6480gskb/WcTYnf1fyVusG3qHWJRtq8yv75H5
         z0edjBOWIdwIB1Jza/j94QITnIJ4FvmpI3wqoDKmP7b5b0+AbpmdbuJdUOv7/6V8sdEO
         xxYYdOV9rFnHAop+6FI0hBALziNnUJ3yUftXfyhRDzGxiNkyO6nIzckEdzW+BJevyRz2
         fYIHWG0MyDn7lH0ahiMBKNNuoR5dEt/Ohc5hSIsUG/qvPi9wMhnvGAUdxyng1JquGtbg
         9Sgg==
X-Forwarded-Encrypted: i=1; AJvYcCVdSpunLmInCSAALs9v/JVtCT5gf9H+FJIc4G7/YmpqyDxlHWYrZIRHp0yxlB7ENq4Oop4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx00np+NSn6pSBGLGGLmf04FIkJmUlJHSbGy++G9APvAMi3HNa6
	mKDocF/UdmEjX85y02k21TBaCgEDbuskqDX1F7Vx8shn4lVnzStVGb9adPmSJBX0UzpmnfKu7Qe
	rG97PvaVr4AuX1akFze6egN8LT8MHlQs=
X-Gm-Gg: AY/fxX6camFujMOFbkhHyHL/CO7ckHdFH3VU0vZhQIcFXzk1oeGHsDPQxL5wp9m3GeV
	iz+oJqI9XkmqHoTxsIIgb/sYcddBs5UKjgqLcOTBszcLjDxdYjX9/hexI7UbO5dT+f7e0ykoiYM
	vJDWTPeZxapLCiEafvFNc8kEJ8lTzgATXLzSdX5j9u4BJ9FtW26/hRmJFfJTiQcJLAUAPJSador
	uFh/W8E/Km6bL57XpenIy9o6qWRESzMcYYGUq1gq+7a81x9pY2RIDdJfxWDjSAfFh04iDuTfSxf
	0ff/Ndua7Lyr+P9J6xL+7vuXGmQ=
X-Google-Smtp-Source: AGHT+IGJCumVLPI6LXTb+R3wbQ5b6SSgqQC0QLByiXYYrEmbkjlG0jzydWOiaHp0sl9AgFqwMi+afZ8/iOgSdsy9IWU=
X-Received: by 2002:a17:903:1446:b0:295:425a:350e with SMTP id
 d9443c01a7336-29f23de66ebmr152982955ad.8.1765929712310; Tue, 16 Dec 2025
 16:01:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
 <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com> <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
In-Reply-To: <DEZNGU4VJFK8.Y1LKWVTD7O8K@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 17 Dec 2025 01:01:40 +0100
X-Gm-Features: AQt7F2qigiuBf-2umKIaZyZh98eVY_wIo1vz8CYcqmMw3ZJiZleOgoOUFsOFlyM
Message-ID: <CAFBinCBaXRNBHpY2uYy4FxyAOnRA4NxJtHbraG0=j_U6Dzz2=A@mail.gmail.com>
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

On Tue, Dec 16, 2025 at 1:46=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
[...]
> > What I'm not sure about is how this series interacts with
> > devm_drm_of_get_bridge() which is why I'm asking before cooking a
> > patch.
>
> Apologies for the long delay in getting back to you. You might have notic=
ed
> some discussion about the overall approach, and I waited for it to settle=
.
That hasn't gone unnoticed!

> About devm_drm_of_get_bridge(), it is a very different function so it doe=
s
> not affect this series. The name similarity is confusing indeed, but
> devm_of_drm_get_bridge() has been removed from my approach, so one less
> source of confusion.
I have to confess that I'm still confused. drivers/gpu/drm/drm_bridge.c sta=
tes:
"Display drivers are responsible for linking encoders with the first bridge
 in the chains. This is done by acquiring the appropriate bridge with
 devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to t=
he
 encoder with a call to drm_bridge_attach().

 Bridges are responsible for linking themselves with the next bridge in the
 chain, if any. This is done the same way as for encoders, with the call to
 drm_bridge_attach() occurring in the &drm_bridge_funcs.attach operation."
Does this mean your series effectively deprecates devm_drm_of_get_bridge()?

> I'm soon sending v3, and I have updated my patch to
> eson_encoder_{cvbs,dsi,hdmi}.c, actually splitting it in 3. I'd be gratef=
ul
> if you could reviewd and/ot test them when I send v3. But I don't think
> there is a need for you to send any patches related to this topic.
Regardless of the questions I still have around
devm_drm_of_get_bridge(): I'll give your patches a go in the next
days.


Best regards,
Martin
