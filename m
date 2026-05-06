Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165DF1946DA
	for <imx@lists.linux.dev>; Wed,  6 May 2026 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058600; cv=pass; b=qY1S9jGrC9yntN9HvdATIsbzKc7mp8qDZ6vf0ti9/8JqCjuIAQx9zf9k5NNUz3BpzIPLPLypT8wpEVW1cdytjt4tVS2csbRq9N3uJNjARanYRQmyMbmFYsTGRSNUCaKQ+H0DqD5RsmMnlYSljN77iH4/1zw1AiVuapj6O3FbPEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058600; c=relaxed/simple;
	bh=36tAG94Ia8jgi8QJHIfMyYsmOTCZP7DubPze3fZ1KyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAU5X3UgGJVcY6FrDkUE00aSG/BYt6tL0erpyPQ4nmOY1dZvAuX7rN0Gnmq4EPFI8R0L+Z+Fgf86bzKrU/UmRPqkFNNXmy3IoJc3qL6ZFkavcWUIcn9phZuNweaDYdtInQ7zorvt7Ipx66yQaW9gLhwf9aFpaFcF/Tn3lYr7Iqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAIxMlGH; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAIxMlGH"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c305f381eso5225824d50.3
        for <imx@lists.linux.dev>; Wed, 06 May 2026 02:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778058598; cv=none;
        d=google.com; s=arc-20240605;
        b=dDkV4RIenYGoHfcNnP3JQJLOQDHul/Kt6/lAmbANTF9cbxPkkTp11jrSM2QyJ2a6PH
         lOs8LmzF14D4XQ+nYxtq8uw4KIvPxGY2EE767YbizdpTUQJvCfVEzsQNlGNgMLgrqIaV
         qhapZ3oc0qoqqSb1Zy4Steq34z/3ayEDc+iK6vUjwqYuOjphI/GiS32/hMTopPfkCyqK
         MiFB6MYt3yWnASVaa6aWiKnMUk4ariRbPpdmyc6hsBMu85JQgkomHjxPz0bf+xtQkIgq
         P586Ks2ymaTvWxN9+mrDmokQoURUS3BH8cMkChq4ST2my/e2eLOpc8v3QVzgpPuFwRWi
         RaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sE63xfK9tF0qLxfLTzfosY8+mfJCa4vX8lI44vR4HdI=;
        fh=EWJK2WIKyQ/C58A8K8zmsTVyjxZ0hR1Y0TNPPHA2lfs=;
        b=U9jqjWMc1jX+/NM63ZwCw2m9h+ZwWrbUjGgw90tAYSok8McHIMIxg+VU7KWtscWxc7
         1KJbUHQkRiH3MbilRLwgH1+w+M6i2FDG3LFze+VzrpZVQmrQY1zPasOBA1ke+4qKRuyR
         yZ8zARBRJo0QiuhlvGBqyHAyvBhkxjshhaKHNjSDHq3OICk+A14uku+Qq80WGty6vVzF
         +VXr3lYPyDvLqrRMnNyuJ71XSwCKvX62SUd8GhjJIbLHP6xbgKq2PMKq0LtsUWZlls4j
         ntDnl7KW5d22zovx/ZDBgmOYzdLzF7Sa9NKnBz4XAM57++kGuDfd7Zp/YgKfAIB9/ATW
         tffw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778058598; x=1778663398; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sE63xfK9tF0qLxfLTzfosY8+mfJCa4vX8lI44vR4HdI=;
        b=fAIxMlGHb+O8NmGHIdMjgTp6H0atrAbpBjVEuNB0pGp3UNwvf3LuKylEWFPAuVD3Q4
         CaHCdnyo3hzMXuy7SFJ4HuRxzzuDVsXYNu6oNS1kq6FzykNgyQe9aFeAmKZ5L+zjMrX+
         L7Mz7ml/X8JT6bo25Bo25V4fB+JCszOsDg02DtrBppM5MlX9/FI03tjzPMS5yjbKVAGI
         RuB2WvhDeiCo6ooU5eiuCkgQEJPezsw5eb8NbreKr/swzDQmlMFlQT61yt/sV9X/hftH
         Ort4TFVkfDyUOu2zr7IRHgLbntiQYKMJFUVS5ssGTu8zcBDzrsvAXUXjn8M1bshMNGfo
         qL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058598; x=1778663398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE63xfK9tF0qLxfLTzfosY8+mfJCa4vX8lI44vR4HdI=;
        b=YJduubwtsdtgllxrXUUDWjqeIFe6qAC921dFJneTCl8jkIhIGSHUJCiz0VLMniJWRv
         k/v167hVzJ99UoOZ13Yirlb2qyD2v2BzTjBbCcJLVQnL3Zj8i7qKT1TdCZ2oDPxzn325
         FXcIJOsLlyZAsWOD/lxqOTtxJJrCe4Vm5Cs7ZSiIyvZkfrhFwvkDVCGr7Xkk0eTVrW6T
         xLrehVo+M9ylQ9HXY11mBdP0pNUoU8GHVP5KsaIcriwVwwSMeJ4dSLcV6M3S3CEkI760
         wY2/fh3fpjmctzYb7dMQgEfGvVdwJ2THJUgzVLFuDm1IUN7hidz7bw7jzGKIhqNnFtto
         Xe3w==
X-Forwarded-Encrypted: i=1; AFNElJ+m4ftbXhEBZSNvuuugflKCEY5RqmQODXMk1I+mzEQp3jP/VkffgJBPmV9u0Y8uHgt57qQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHSSYc8UYXTWf3F6kORdOvcPPZQcL2+RuWmhKx+AeyvePoAVYt
	LZprFS5DuHZaJgNy/WKB5yDbNO8qesaKlLITQKVPf+1T1sorRgqllT3F5ookpezwxRv7Z4BK1cE
	Ow+spLumiNcQy2fs/n5IviZ8LCaIQ/M0=
X-Gm-Gg: AeBDievh8dPZw3En0yM0AC+5KxumfhWFPhoR/L1hgTpNPH/ZDaJsa3830VirAkzFfCW
	lrnICvopnr7OzZgeannQfsWVa50mnuJBtzltlAoTvxcm46Leg6WfbeaauG/smg7R1Y7HeLgCa/W
	Zmp2yIDs9eYxKoQBzktB+gNfStL1pviKmBF+Zc4gYgrj9j6ar8CiYUvf33mGGODrJbCqv+tE0yX
	yU5Npah/ML93NJ7MJqRAim6IGig4LBvSM0S5ut8wIH+ZBFf30Aa4Qyjv/pn7lGIPkr9uuppThGe
	M6rpfbyBlpjtEARjF0GKw/D1U+jtaQ==
X-Received: by 2002:a05:690e:1447:b0:651:bed1:19ef with SMTP id
 956f58d0204a3-65c79a4a569mr3077966d50.62.1778058598028; Wed, 06 May 2026
 02:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505082145.603262-1-lgs201920130244@gmail.com> <afrn-zcfiRpJzIcO@raspi>
In-Reply-To: <afrn-zcfiRpJzIcO@raspi>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 6 May 2026 17:09:47 +0800
X-Gm-Features: AVHnY4Jk9YyDPydkL71fov0bFSSu9j0Lq1UdfKpQsP_hQX1hR4bNL4d9pygNLng
Message-ID: <CANUHTR8OD=uNMC3aVDc2oNeUwAWcsPsCRda+9RckpaUOhwHSqw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
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

Thanks for the review.

On Wed, 6 May 2026 at 15:03, Liu Ying <victor.liu@nxp.com> wrote:
>
> Can you provide a minimal fix for stable tree by not using the cleanup
> action?  You can add the cleanup action with follow-up patch(es).
>

Yes, I agree. I will make the stable fix minimal by not changing the
helper function pattern. In v5, I will only avoid using the cleanup
action for the endpoint node in imx8qxp_pxl2dpi_find_next_bridge() and
release it explicitly with of_node_put() after
of_graph_get_remote_port_parent().

> Why do you need to initialize ep to NULL?
>

The NULL initialization was only needed because v4 changed the helper
to use an output argument together with a cleanup variable. With the
minimal fix, ep will be a normal pointer, so the NULL initialization
is not needed.

I will send a v5.

Best regards,
Guangshuo
