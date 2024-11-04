Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DE21B0F2B
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730723091; cv=none; b=ERPZRrExUPM/ZIt926oiRPVh6OLlSrrXOB/TI5OEBo7VA/Nn/0zCBIdXWKyc263QoMDsUKrrOpOPw8NhlhESquT3ID6smAvLALUGvE8ZDW68cYMMrZ1yBCiaznJ2UkP1K6EL6vopWV6570rmfYnvT0Ji1iSvjXqfeKQW7vi7TaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730723091; c=relaxed/simple;
	bh=LaY31D8K7Uu9gLsVDS9MJ9I0MMD6loTYipnIxJrHwSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrhHL7Irnxcbhu0ChgHnGyVRjFzlxFBWv1h48OAJJ8LrYdW8tr0HjjUw2bvBlkJjE6kLLyOi5ecyYeFLBjKTzCWsmKUhSzOgkwHaAYFuk7Ntff8sK/Pm0+pdswVLRFG9nwOxLx47LqksEHB7uwALvYHIz/9q/YSl5CVsYEDoGj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ppGVm2cy; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ppGVm2cy"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539eb97f26aso1857065e87.2
        for <imx@lists.linux.dev>; Mon, 04 Nov 2024 04:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730723088; x=1731327888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WamoS/BgPz7m8LVkuxxtzepst1v3gBVxNsdSxv3r2v8=;
        b=ppGVm2cy5ViPGtF3j6qjdAox17tqXv8u4L7fZncGIZ98yc41PIQGuPLm53TcrNYzOE
         4TBz/vIWjsV2vKeFPXwhTGbkXVXys7Qgz7vxNzUwPRsWGoo0ZRiZoZIlD2lzYR15wg0q
         m6rqsH9X/WS406HjA/QuPxHgc6s6dQmt0dCfRM9cJ0Azi3Pcn5K7USJOK08ibpq/7iSP
         5xLT363b91ro+83rp3YNnfS5/cTfLD9TvmupaTYDXfRdyzK/5FhW39uxRBN3sWXWuHuV
         XhFO76mLvYRHbyFRJDC2tCG6a7D9CDZ5KJbSEOLEwcgXaP9dOGf1zWvt7YMivee+fQjr
         mYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730723088; x=1731327888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WamoS/BgPz7m8LVkuxxtzepst1v3gBVxNsdSxv3r2v8=;
        b=OFdFNhwzun6LmTdOHHcJkSU2HiHmq88wI2cTmwhgZ1338Qj1nMNKDd6fe/00QyQYCh
         LsBmO9h3BwQqGU427hG5hTtAOUwe+r2pvmCw2KzFtAAWcgFlzTYBl7aeGs0ro8kNwnO1
         6iQm3JE4J5gaudowBTEXZmrnynNZgOjh4ZyEU+ATeGPdC5g5O+AU/cxlye6iUJfl/kX1
         /iOCO16rNAVE9qbn9aQgxsbw6Aoq0cxv1EgZnVUzNgZvR7XQr2OS4CP2jNoANdkLdh2y
         J2I2SN38Bm9Gxw+rH7QFHirOLv7oMlwMbKTQsqf3lFHFnR3tMiOfG+qGllhwWwIheosV
         FcQw==
X-Forwarded-Encrypted: i=1; AJvYcCU0JOtoFfxb2qHR7couanTAuDA+19z5s8aqJkicJ6R76ld/V57L7NX1hlS0R92BbzfLED4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTgU4DbDcWZW9VWgbqauqoIcloSCg721G9g6yESYRg5DaMwhJ/
	IXOOecaJw7gl+Uo9h8bgRT0mT8gskfzB7a+D5rU+YiSgvqQzHzcEzPdInqMzoo8=
X-Google-Smtp-Source: AGHT+IEtBPydnkTY9XAl3wpUMUwj+iBOUPGy5O30ju0acWB7SwvbYZVi+55EBXKr6UE4cG8VsD+3aw==
X-Received: by 2002:a05:6512:350e:b0:53c:74dc:2252 with SMTP id 2adb3069b0e04-53c74dc2378mr6549281e87.49.1730723087398;
        Mon, 04 Nov 2024 04:24:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc95a6csm1666091e87.4.2024.11.04.04.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 04:24:46 -0800 (PST)
Date: Mon, 4 Nov 2024 14:24:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Arnd Bergmann <arnd@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Lucas Stach <l.stach@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx/dcss: include drm/drm_bridge.h header
Message-ID: <ix34xln3tl6l2h3jt7t4bhrydxfmh2m53dkl5rugxj335p7hgb@kfauvwrusipr>
References: <20241028163527.2425783-1-arnd@kernel.org>
 <2byo7263izup45hcdyoxr57sh2dzdasnwotpfqnayqe6znvzjt@adou6qmyhq6y>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2byo7263izup45hcdyoxr57sh2dzdasnwotpfqnayqe6znvzjt@adou6qmyhq6y>

On Mon, Nov 04, 2024 at 02:10:54PM +0200, Laurentiu Palcu wrote:
> Hi Arnd,
> 
> On Mon, Oct 28, 2024 at 04:35:07PM +0000, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Compile-testing random configurations leads to failures in
> > dcss-kms.c from a missing declaration:
> > 
> > drivers/gpu/drm/imx/dcss/dcss-kms.c:95:8: error: use of undeclared identifier 'drm_bridge_attach'
> >    95 |         ret = drm_bridge_attach(encoder, bridge, NULL,
> >       |               ^
> > drivers/gpu/drm/imx/dcss/dcss-kms.c:96:5: error: use of undeclared identifier 'DRM_BRIDGE_ATTACH_NO_CONNECTOR'
> >    96 |                                 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >       |                                 ^
> > 
> > Include the header directly.
> > 
> > Fixes: 004555a18d57 ("drm/imx/dcss: Allow build with COMPILE_TEST=y")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> 
> Unfortunately, it appears I lost drm-misc push rights. Maxime, Thomas or
> Ville, can you help push this?

I can pick it up.

However I think it is:

Fixes: e7033bdfd43b ("drm/imx/dcss: use drm_bridge_connector API")

With that

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Thanks,
> Laurentiu
> 
> > ---
> >  drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > index 3ec721afc30c..63a335c62296 100644
> > --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> >  #include <drm/drm_bridge_connector.h>
> >  #include <drm/drm_client_setup.h>
> >  #include <drm/drm_drv.h>
> > -- 
> > 2.39.5
> > 

-- 
With best wishes
Dmitry
