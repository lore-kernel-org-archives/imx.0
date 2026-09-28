Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F64503BFF
	for <imx@lists.linux.dev>; Mon, 28 Sep 2026 22:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790634347; cv=none; b=WtlflAoiD0o547WF051WYAJ5z4q1radt/P6OV+iCMc40i6r3+8NBHAitk1qhCb/mf2FVTLL3pXRHMvcAW9+UNA9MSBcbX0aXg2mQ4wPzjJGkekD0jCZJQ1fQUQjLrqdN5JOUOCNtaztTYhnpmQb2qHlVm0s5eU0E7L3RGC6lpSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790634347; c=relaxed/simple;
	bh=CMhVbbwMjVNodf67+oObxNDkfFFuusEAICzl886gi4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=is4jZoYTwp6WvKaU6DUaho1821H9A3tjdxXaxv9NyPoK/MPzswbAQSuFJXpz2XMoWOATXSn+4SLPGc8dKQjCOWzDg4NJ1ZbfghjTFMMIwfmOWbJNlyC0d917FLhuhYpsKTrYq/WfNxZLEM8nJ9RVvKkjFzDkxSDEtdDZwLrozpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TIlb94vo; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TIlb94vo"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64b06fc66so24390831fa.1
        for <imx@lists.linux.dev>; Mon, 28 Sep 2026 15:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790634340; x=1791239140; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JArXmWr/mVGoLLKcByjQ5+EXzcvGruMpOpTO8U+lXSI=;
        b=TIlb94vohhHIkB3tYU8D9rUII1BFIflr/d+h9lOT66+Yg/bIEYunqi9HXutOQqA3Ip
         YS/DVE8W0m1owgVo/RTr+a5Pq63G8eGmJ1iHmjd4gbdijaxx+fVFaC7NHyGtaiEJOK2t
         BNQ0F9OaFoIkMoG4TNqasH6ftaZDy3Vu9mEUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790634340; x=1791239140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JArXmWr/mVGoLLKcByjQ5+EXzcvGruMpOpTO8U+lXSI=;
        b=aMyGMFj5WpsTILodZkTq8puB1Z8MEdj+Lia1lWWRMQIICK1PFRB+evC8bL226GMerU
         NJ7YsTkc89iQ2n2KfZk+IgtVqb+Yv5LyVE7H67lLGToMHwiWiBYRZeZMf1Z1rmD6sdQf
         pk2CE6oAPMBNUjSmjZeafpLb9MpBxcOkgAntMVN1KSjCS/bHDmx7tOVKJMrdRZMv3noR
         DA6R6B0mPjFr2eRTo9/2yxAjc9nJSxSHLy8k21mWa0sM5QL9VM64aBrJEwGjij7Llnqy
         uaX1qrn4n8VzfwoyK33ciTTOAWE+N/AOU3Gt+ZGBMFUx5StngCtAGgpBCbobXOaP9nie
         apdw==
X-Forwarded-Encrypted: i=1; AKwUvBwtMw8L6wPTELJgHLohIAKVKZDEfg7R5KOFKm4R9y7/TX3gI7XrylGQQce7xj+mMqQrpOM=@lists.linux.dev
X-Gm-Message-State: AFq9FYLL7H+h88FtQ8gqDaIsXBnLvxsz0OMTNIpKe7lzxSZ4GG+2Clbj
	eG0tm89mL2Yj/pacHkpF3gr8Maxbw5QWXWi8MyyeWxb23nOOAm/erM0zN+9kKQenpSVHHGcjREF
	ow+xZNA==
X-Gm-Gg: AYBFou04f+XRgjmYBClntfZ4EnHL8kGyP9lf5UNeX/2W0UYzqF/gISndEh6xfdSs9r2
	Ic2XJeC1RsYJWWhV+/5LWrFJ2X2mTrT7PpRSJ5C1Cm3FoCc85+ENASaYwmVCZb6Riv/TwD6G0no
	rbVbQGHaWTrbkdmDS7NoKIO1b1c8cY22U+TrducndUfbtMFZAOXBPaBsnhWqXM3+k3p6IJczzsM
	ts66QsMESPez6v8Cd/Od20t/bWQ+jO2L5U9xm4lENW1vnMJGFHmI9+O/CWcYB9f8CwDb4O4eGVM
	YtwJFlQWZ5PteObPzogpBXsA9zfDWMftHmHu1eGy33axc8Po1yj9CLCv5Z4ahMN7VtQAXeCV8fT
	EMw+BM8NQlROqwyXKryvfIBNrmEHTMOvRi3F8TmRQ3VaDln1zSFdWD+rvDj19o4M1kqTwO6tAyD
	xm/ozjhROA+hDeFgh0T5L+bdVvN4C0POFhbmvyCSBopLF2zk458SdF0bWUp/J+5GgjmrI0gQmU/
	ElgKfZCncvbx4DbNMibfe2kT6kuLLjfTsQYRw==
X-Received: by 2002:a2e:a551:0:b0:3a6:5ec0:796c with SMTP id 38308e7fff4ca-3a65ec07cb1mr19334201fa.19.1790634340449;
        Mon, 28 Sep 2026 15:25:40 -0700 (PDT)
Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com. [74.125.230.99])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c2ea5d2sm31979491fa.18.2026.09.28.15.25.40
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 15:25:40 -0700 (PDT)
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64b06fc66so24390791fa.1
        for <imx@lists.linux.dev>; Mon, 28 Sep 2026 15:25:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwTVFsid4T/0kXn2NFifxO5Ij5xIGbqzwNJJniWzMPm+JRLppqubw2NCyJ0GRMkdVO2fPw=@lists.linux.dev
X-Received: by 2002:a05:600c:6986:b0:49c:fa21:e73c with SMTP id
 5b1f17b1804b1-49fe66f147bmr235241965e9.18.1790634033791; Mon, 28 Sep 2026
 15:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260928161605.2271412-1-arnd@kernel.org>
In-Reply-To: <20260928161605.2271412-1-arnd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Sep 2026 15:20:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzWmSjWZ96sBYvRLr=EbYqqBZ71o2BqotUsxRf5zqjTg@mail.gmail.com>
X-Gm-Features: AclHuK-sVszmxzKslRXTzUjiQ3wDqpSD15BZhQhdtvRJFSFfPWjQSieqaRkgVN0
Message-ID: <CAD=FV=UzWmSjWZ96sBYvRLr=EbYqqBZ71o2BqotUsxRf5zqjTg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: add missing drm/drm_panel.h inclusions
To: Arnd Bergmann <arnd@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 28, 2026 at 9:16=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The devm_drm_of_get_bridge() declaration moved to drm_panel.h, but
> not all callers include this, which leads to build failures in
> some configurations:
>
> drivers/gpu/drm/imx/lcdc/imx-lcdc.c: In function 'imx_lcdc_probe':
> drivers/gpu/drm/imx/lcdc/imx-lcdc.c:404:18: error: implicit declaration o=
f function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaration]
>   404 |         bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, 0=
);
>       |                  ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/verisilicon/vs_bridge.c: In function 'vs_bridge_init':
> drivers/gpu/drm/verisilicon/vs_bridge.c:306:16: error: implicit declarati=
on of function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaration]
>   306 |         next =3D devm_drm_of_get_bridge(drm_dev->dev, drm_dev->de=
v->of_node,
>       |                ^~~~~~~~~~~~~~~~~~~~~~
>
> Include the new header in all files that need it.
>
> Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

[ ... ]

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index e7f9e6d58927..e50737432071 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -36,6 +36,7 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>
>  #include "drm_crtc_internal.h"

The above one might not be necessary. drm_bridge.c only references
devm_drm_of_get_bridge() in comments.

Other than that, this looks OK to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll assume Luca will apply the fix since he landed aa8a8c7e4641.

-Doug
