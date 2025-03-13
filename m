Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1176145A11
	for <imx@lists.linux.dev>; Thu, 13 Mar 2025 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741898618; cv=none; b=nnNwDv5DkAO2KFSQTq7m5aghUcgw2nZ5fBLGR0X7jk7qiNxEoG0gdT2xfg74EANyF3EHsMz1uBpTifuywVhvCK1nrKKzENNhcFZCPvF81bh3oznBaMznIiPGBk7Lw28q2GPbvTIOFXlbyjc2EuZWlbmW3xRyHZNo3+q84e4PXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741898618; c=relaxed/simple;
	bh=ccHwzvG96CR5T0Gvfx8o6oCisIE1ifVWFlNtR62urwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5wsl0/YzS3JliEyPxcGaVtgMk1YhzSCsxvPN8IZEt7Tj6ssGJCuXeqUdGmCblQ7b7ZkkuWvK523Q736ZGicFrFzlT/tA6eD4vVOqiVoJZole/TRHnkXl+VDy2UI3u3+sr14+FfB3UNncsFr6nDf2QasGyOK4a5dVYKDNwV116U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KbLmisDU; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KbLmisDU"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso1213242276.3
        for <imx@lists.linux.dev>; Thu, 13 Mar 2025 13:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741898616; x=1742503416; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VnjZC6vr5EXhWiQG8PDbTXzoInugv5bUtef8UzNIT4=;
        b=KbLmisDU0v5TXzqY+JkivrOxr9Xsz9b1Gqsj8yNLExM0kS5DsTVQ56P9IvnufphiyS
         nTvpOgOESbzt3HUQUu6PLEyBzGQ2PJwjA1t0uUlllCGCFoFUP7DWNZJlJtJxGnHis566
         5AMU/WlPrdp+DJdx6zGjJebdQrhvf00M3bfAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741898616; x=1742503416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VnjZC6vr5EXhWiQG8PDbTXzoInugv5bUtef8UzNIT4=;
        b=Zr9dwPw7h5IAzUEp1oG0FwJCkPvlcTWxnlIZ8wTrP1jG+0p2WEBWLnytlxglS679Dq
         Gy9VsCP2cycc+XOu4OrciQrSfojhAgbx7pjVQjkw6eNi0j88Bu5LzHaESkZvhiWQiIPP
         0cuOaRSdm82+C/gZWdVhqrlrCOKV/kQ2ACsN7qQ8CfbVjJtB86Ho4vMzsoh9yTms2Xcw
         Ty4HKAy+X4f9tq+C6cm/n8dxQhT763/03t0Gjnvoy1NbbTRppkzLBQ/O/vIdC0WwrCNv
         xPBExxSU0mQ5nvnE97shYZ+S5CGy3mplV4tWY5pA3WDbnGun+fH1AvGkZ8X1fDWoyh+t
         Pwpg==
X-Forwarded-Encrypted: i=1; AJvYcCUOqrVIXg0x239CShl8GnLRcSAynGCvDyoDRhJCctwB8oLkthTewOPs9MRKybBcOmxxfPc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrlzxSvLLsKn/kw3McL/DfkQzdMd53jl/lvV8Pue2LT7pEvfgm
	zfspW+oF+4b1Qorcu+IYwjS3W8k4fQGzCS5dQYsO4sUue77R4tG+uwdF5dA6EKK23AGL+Z5ON+f
	uAwLoMIipnYNagxtEVfBFPm9+35OiqUlxbQK9Vg==
X-Gm-Gg: ASbGnctnBEY34kmgHAwc+3p59hXSHPxy3S3bxb/EtI7btAxf4dM6cArZ2pl0AmRGK2V
	uTcWzD3ERvY4EIqEuYMEk5Z1EtuJkCH76yzv08e+LHj60GyTKy8sV9GDDVHwY0zG/4RFs8+S6U1
	M2MQ64gtFgZBgPkBfmI15DLeQnLHbNOr1BPDNsBlGYWeEzhwwRV63FseMkjA==
X-Google-Smtp-Source: AGHT+IEEE4ZRBNeQADkkl6AKxkknaNJwbIuG665QnVzs56LBEdogUl2yhgopg+J6ZxgJ7v7x+mgi2noSX4lE2hICHLY=
X-Received: by 2002:a05:6902:284a:b0:e5d:b7d8:ad3b with SMTP id
 3f1490d57ef6-e63f6519314mr51690276.19.1741898615842; Thu, 13 Mar 2025
 13:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250313-mxsfb_probe-fix-rollback-on-error-v1-1-ad2fb79de4cb@bootlin.com>
 <468c6352-3301-4f0b-a2d4-d6a013417a0e@suse.de>
In-Reply-To: <468c6352-3301-4f0b-a2d4-d6a013417a0e@suse.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 13 Mar 2025 21:43:24 +0100
X-Gm-Features: AQ5f1JoTykMqff1C-O-bh1Cbl3u9Tnh0pBlLKwre0Ge4smXB9EbXTEwKnEK0dhM
Message-ID: <CABGWkvqtj+05sdOuXg1WO99VNm9qdFgcYWEGuUPPZPoHZa6Dew@mail.gmail.com>
Subject: Re: [PATCH] drm/mxsfb: fix missing rollback on failure in mxsfb_probe()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Michael Trimarchi <michael@amarulasolutions.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

On Thu, Mar 13, 2025 at 3:40=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 13.03.25 um 15:25 schrieb Luca Ceresoli:
> > When aperture_remove_all_conflicting_devices() fails, the current code
> > returns without going through the rollback actions at the end of the
> > function, thus the actions done by drm_dev_alloc() and mxsfb_load() are=
 not
> > undone.
> >
> > Fix by using a goto statament, as done for the previous and following e=
rror
> > conditions.
> >
> > Fixes: c8e7b185d45b ("drm/mxsfb: Remove generic DRM drivers in probe fu=
nction")
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> > The offending commit is not yet merged into master, and even less in a
> > released kernel, so this does not need to go through stable.
> > ---
> >   drivers/gpu/drm/mxsfb/mxsfb_drv.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/=
mxsfb_drv.c
> > index c183b1112bc4e9fe4f3b048a2b6e4c98d1d47cb3..b4273e678d26dbc3dee2014=
266d61470da4e8010 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > @@ -365,9 +365,10 @@ static int mxsfb_probe(struct platform_device *pde=
v)
> >        * located anywhere in RAM
> >        */
> >       ret =3D aperture_remove_all_conflicting_devices(mxsfb_driver.name=
);
> > -     if (ret)
> > -             return dev_err_probe(&pdev->dev, ret,
> > -                                  "can't kick out existing framebuffer=
s\n");
> > +     if (ret) {
> > +             dev_err_probe(&pdev->dev, ret, "can't kick out existing f=
ramebuffers\n");
> > +             goto err_unload;
> > +     }
>
> I must have missed that when I reviewed the patch. But this call should
> happen much earlier. right at the top of the probe function before
> drm_dev_alloc().

I had added the call to aperture_remove_all_conflicting_devices()
after mxsfb_load() to
keep the splash screen loaded by U-Boot. So, IMHO, it would be better
to add the
goto in case of an error rather than moving
aperture_remove_all_conflicting_devices()
to the beginning of the probe function.

Thanks and regards,
Dario

> Conflicting drivers need to be kicked out before
> setting up DRM. Could you please send a patch to move the call to the
> top? No extra cleanup would be required then.
>
> Best regards
> Thomas
>
> >
> >       ret =3D drm_dev_register(drm, 0);
> >       if (ret)
> >
> > ---
> > base-commit: f9f087d946266bc5da7c3a17bd8fd9d01969e3cf
> > change-id: 20250313-mxsfb_probe-fix-rollback-on-error-3074b9080f34
> >
> > Best regards,
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
