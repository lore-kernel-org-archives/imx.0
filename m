Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376B19F115
	for <imx@lists.linux.dev>; Fri,  3 Jan 2025 05:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735882585; cv=none; b=TFMgPj0SsKY3iIMNgW180C0cDUpULEczFcAFRES9CwsC68EwmJDSzQfl8uCDk29/3fs3Y1iMOyWitJ5+2kVknEIw0dmJ8PYwKdxpFrHQqiTP+DaWlwdB8nCIpNIX7T/Y2GGtgC184jKHQGWOraVcDJIHYxsuAK9Ih2DQoeF7i9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735882585; c=relaxed/simple;
	bh=9okAlr1d9wvf4E6yVwtQr6UO2uUHaXRd4lakH0Wf+PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGLcCjoGW2XxiaquHTnGRkqzmUbsI1CaX0OnaoV1m7YUUTtFfIeEhqQq0JeReZEac0rp1EUOkcE2akGGmct4JT74Qy9ZZG3ZZxClIuguYW/5Guo7Tau4ReKb/03Okq77uH9DCpKr0R2yYjl0Td8RddhZhXRWuLYK1QT8+wq0gEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ncUPTYo1; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ncUPTYo1"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso128169921fa.0
        for <imx@lists.linux.dev>; Thu, 02 Jan 2025 21:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735882582; x=1736487382; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MmN8unikKCAbDTYmOgv4w7VHd2QHTqvHtpUA+yq5Q+w=;
        b=ncUPTYo189+TCv5z5Jfm7rqwht3cGm0UpKFlQocWgp8ybUHOCZhkYBk2yKCjk2y6yZ
         ap1VMSsudDGDyaEVwlGlNlA84nDwNOJLtLYDA124o5krm4isMinERK751S48dtcXyC2f
         QppdrJICtrhqxfpwvWLmd1tMNCVRYq15p3NTqY1bm9dkVOGeztkJT+Tm8EQj7FxXDg+K
         KVb4Pmom6JBnxv+FugVJZSi8s5yI1W0lVH624fQ38NjtBNQ0tnenAgyx1hqeg4l7MvWF
         y92QQoXCx1l3HkvW2Yc/BtYVpm1YNt6c1sU2QVA0cc9DjGy/nGHLcgagc8zpb1LKGOVH
         nMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735882582; x=1736487382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmN8unikKCAbDTYmOgv4w7VHd2QHTqvHtpUA+yq5Q+w=;
        b=QW1HG/wpCv1GVh4eu89M1l1Wc88x3WH3343u9coJEkQbvswVY3yxTnEdQuMfjifQ0G
         hXnNajsFRlZM9hp6jWS7i2sDLxaLA/qAuZUYIWBBhq3v66/DF53nVmr1jkP5uGOHnYVR
         Tmd7dgGjZ+iYI8eSCF+eWXfL62GK+bD/yInKRIhVvB/cM/BJgcdb4ozgkwZ9HPzMFBIz
         2EVeTpi5s5oHakcA/tcAD+dPdSO4enmZCY1Cb4EIPjDu3NVxeLeBBb2QjEkSlzTTHlHm
         E2nKMHocE1vTeHojGu/N9FuBXJCOMQz8GkB64mwxhXWkFCxr+I+HVkUYG34rjphBzdsx
         Q2Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXlK/mGQZuv9tPtVLb6HvVqSyAupTZq6Ci6tca7j3bGLNPjy4qlWcNLOX8aATkiAsncgxQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx09vjBKBh1gAVqvwExeamyhaR+sDJhafyqPbC0Z9Gj3pFXK24b
	kw68LQvXBaQbEGvZmVw/YDQQTVe5YlDEm1aBpqadjGNV1ZgYjNLITOQIxaOSgDQ=
X-Gm-Gg: ASbGncsI1eHtWc78PZF3uJUUCpQi4sFIU1e5d0eE2WBj6Ne0VaWbgZTjo9zeH/Jr70u
	yiPAeEtKyydZ/6+NI73AIxzEDqoKwmMfW2M33N6U7FDQYi8bXNKO1Pag9HovIt4F371w/9eBfh3
	DVmmE4S6STHyvlp829Rp8CqK9RgCrhRMAqHTvd/BYMOdZe+KkCmI+C5Sxk1L0c0z5ajhzZTf+dK
	m2jmqby0aq7bkovWZ6SZnsmoAd9UC3+dgq+OlXaVpJQhfeSlzuxAuEQSN2mO8QMJA3bzovWOB90
	pWOOOlzdI0yrtUrSAdZuZ1WopFHIcqJJACL0
X-Google-Smtp-Source: AGHT+IE6OID3IdhzMP3XEYNXHpLMaRxF1DCc2ymnBRQhO5cl+gFLOI6zrATEO677AB0hiGN2d3yNug==
X-Received: by 2002:a05:651c:2114:b0:300:38ff:f8cd with SMTP id 38308e7fff4ca-30468543d63mr161870081fa.9.1735882582025;
        Thu, 02 Jan 2025 21:36:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad99d6dsm47284711fa.28.2025.01.02.21.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:36:20 -0800 (PST)
Date: Fri, 3 Jan 2025 07:36:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <a62utyd6bjhx33ru2aaxwiesexcltbgdcvhgd57c5uyl3htuoa@2kdgodqrqabu>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-3-marex@denx.de>
 <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
 <2f2bdcb1-6d83-4939-9dd0-3fb206202273@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f2bdcb1-6d83-4939-9dd0-3fb206202273@denx.de>

On Fri, Jan 03, 2025 at 12:20:19AM +0100, Marek Vasut wrote:
> On 1/2/25 6:58 PM, Dmitry Baryshkov wrote:
> 
> [...]
> 
> > > @@ -97,13 +100,36 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
> > >   			return ret;
> > >   		}
> > > -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> > > +		ret = drm_bridge_attach(encoder, bridge, NULL,
> > > +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > >   		if (ret) {
> > >   			of_node_put(ep);
> > >   			return dev_err_probe(dev, ret,
> > >   					     "Failed to attach bridge for endpoint%u\n",
> > >   					     of_ep.id);
> > >   		}
> > > +
> > > +		nextbridge = drm_bridge_get_next_bridge(bridge);
> > > +		nextbridge = drm_bridge_get_next_bridge(nextbridge);
> > > +		/* Test if connector node in DT, if not, it was created already */
> > 
> > By whom? And why?
> 
> By the HDMI bridge driver, see 1/4.
> 
> > There is no display-connector bridge, but there is a
> > normal bridge chain, you have passed DRM_BRIDGE_ATTACH_NO_CONNECTOR, so
> > now it's a proper time to create drm_bridge_connector. You have added
> > the next_bridge_optional flag, but it should just prevent the dw driver
> > from returning the error if there is no next_bridge.
> So what exactly should I do here ?
> 
> If dw_hdmi_parse_dt() only exits with 0 if there is no connector node in DT,
> I don't get any output on the HDMI. I have to create a connector in the HDMI
> bridge driver instead and not here, right ?

No. Please make dw_hdmi_parse_dt() return 0 if there is no connector and
the flag is set. Then create drm_bridge_connector here.


-- 
With best wishes
Dmitry
