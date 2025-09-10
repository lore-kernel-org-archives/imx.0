Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BD12D480D
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757500167; cv=none; b=jaNNZgnoIq5Aez8g8jagTbiXAn/Dj8YdC7rgM/u7Qi3JYpR5/1sknfhY/L24zFdARVWkVZdkDWvKylN7tiv7UO4klUkEjCu3ZPRf4FkEcbzx1XhgkDt1cb1d1V+e0jSbgx/jCCbPLmZnTgraz2zUdZxF+5aVbvWOIiKzfRTcG2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757500167; c=relaxed/simple;
	bh=xqqWloOyj1O6e9rQgZLm+mhhJUMO7/mt6SeAPf0p2Go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipBeMgZ42lg4vLPF5ikG5nzFTAVu4pQgaPhMWbHM92y+ka2g2pmJEJntBLSIubIlBgktLMm4yML1otE7FA+XO6T1l5tS0YSdXJcQCeqTEQ03XoDYa5xXIhAXx3/jrXIu210/EjbzXX+pVQJa/htjgh4AG39boYdLyh0PljxC8UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SK6Hwtzx; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SK6Hwtzx"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso7016675a12.1
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757500163; x=1758104963; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFR8ZPpFEPCVYzLk5x4GOe0UcgUOQwtlh+HxpxWLLgo=;
        b=SK6HwtzxhegePMIAC2aS72t/SgupuDO39WSrJYyGfie6v/GEzOiAGfgFxhvnJhAjIJ
         so3WZzcXLHhuS7xuAPR1BEYldzuGhR6VocOv5BILMDNnMIrjmJY3/VYqdTQltKI7/Q4K
         Jz8t0VDSrepfRU1VSsV0gsumSzwbEX+nOXwQADcAYttnj8brjxCsDfn+g5cBEHKd0AeU
         vOoekG0cV/MMqtIfBOWA/FBssg7ccmGBc2s2vRKY1GrRDIW0GgnYgmJ9W8y9yOwQ9jhU
         Q5F2CJQeJDU4bTezE4mKh4o1lx7XSvPwLMiAqXPLAo5dYS2lbydYmkTADAJww7kR41BV
         fnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757500163; x=1758104963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFR8ZPpFEPCVYzLk5x4GOe0UcgUOQwtlh+HxpxWLLgo=;
        b=fv8lCmZLxSjeVxSxZ+WoOL9kZ3RL+m0sdLgGkgCiP6DX0Lz6oyVEIqyxIdxwJToSeO
         CM8imwTcaefZnkXw/Wgo8jMENAIg7FzTiI+muyBvoKTn2ycMJ+YGeSDHZD3l+DTOA0tQ
         9E78mYUszDoddyewndKMm4xqsA82SxKjCvRA3ae/OFZHGyU5XzqD1BOSumyLm7wYp8tz
         DkYd93whor5UgURUkL6RiNXCrhooXhLAkeN8HKq9d2mUjETxgaf3MTRzvKCOB+LVnU9J
         EgwX4Ur7SdN2br/Zb2EULoh85vxOAuANoxyCU4pOVR5u0CSI7t8JVFXVcfi1ew9GhdWI
         z4tA==
X-Forwarded-Encrypted: i=1; AJvYcCU/PgVv4FS12byvxmtSEez8aCMn0aSmLHOwlg+w1okWYG32Xwqe1TNGt+PJEZdgXsQG1Qc=@lists.linux.dev
X-Gm-Message-State: AOJu0YynRidiHR50af0U3uDSCHbTrh6SM8DcOUZQjdi2vqe5R/+BpQvR
	Vjv+diPWgkD8B06z6csdS6Fez6H4a02LRiwNfDzyIAxvGbeqwqFLQlewCwwQ36XwMTxQOaf43ka
	Y/O47t9Q25GjIX1kaTByPtNAnBiNTpVU=
X-Gm-Gg: ASbGncvVMalZRhAQVxyp37eBXjWD3qJjRQOjraSB7CS1eglNglXbwEtxrT9P2k2g5dw
	214slqrbGSqd/6e0fxW3X8rz/ryrYcvTqVcLB6PI3jh4bPlndsFGM3L98jGHmUPRiTJU4SK4ZKL
	n1C+/x3YHY3jcybnvOgWlmt4OGgMuSxtarpCxUTSQFWMlLvTuBebtHIcC90s3F3ZWP5nulJlgPX
	8TOYs0=
X-Google-Smtp-Source: AGHT+IECula9dQIHz1fdQAkXI9rWQDEmBppATKx+V8i0x7QFJ364KiBjVFFTrRLIeHCkEnfADY+kNhoLNela/4vT6zI=
X-Received: by 2002:a05:6402:35c6:b0:62b:63f8:cdbb with SMTP id
 4fb4d7f45d1cf-62b63f8d53fmr6060144a12.25.1757500163205; Wed, 10 Sep 2025
 03:29:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com> <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com> <20250909-omniscient-honeybee-of-development-adca8a@houat>
In-Reply-To: <20250909-omniscient-honeybee-of-development-adca8a@houat>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 10 Sep 2025 18:29:06 +0800
X-Gm-Features: AS18NWDxCBzuENqe0ZeZa-sBoiFIIvg2ByB3rkyz5E1gppn1Dt3RitckbH6afXg
Message-ID: <CAA+D8AM=aRU-0QcgtxZ+=YBZ2+kMrP2uzSE3e+NJs3Z3zkrSVg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958()
 for iec958 format
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, l.stach@pengutronix.de, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 9, 2025 at 2:39=E2=80=AFPM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> Hi,
>
> On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
> > On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bo=
otlin.com> wrote:
> > >
> > > Hello Shengjiu,
> > >
> > > On Thu, 21 Aug 2025 15:31:28 +0800
> > > Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> > >
> > > > Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio=
 device
> > > > driver needs IEC958 information to configure this specific setting.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > Acked-by: Liu Ying <victor.liu@nxp.com>
> > >
> > > [...]
> > >
> > > > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int =
iec958)
> > > > +{
> > > > +     mutex_lock(&hdmi->audio_mutex);
> > > > +     hdmi->sample_iec958 =3D iec958;
> > > > +     mutex_unlock(&hdmi->audio_mutex);
> > > > +}
> > >
> > > Apologies for jumping in the discussion as late as in v5, but I notic=
ed
> > > this patch and I was wondering whether this mutex_lock/unlock() is
> > > really needed, as you're copying an int.
> >
> > Thanks for your comments.
> >
> > Seems it is not necessary to add mutex here. I just follow the code as
> > other similar functions.  I will send a new version to update it.
>
> Let's not be smart about it. Next thing you know, someone will add
> another field in there that would absolutely require a mutex and now
> you're not race free anymore.
>
> Unless there's a real concern, the mutex must stay.
>

Ok, thanks for comments.  Then Patch v6 need to be dropped.

Is there any other comments for this Patch v5?
If no, can this series be accepted?

Best regards
Shengjiu Wang
