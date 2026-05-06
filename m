Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C846AEE1
	for <imx@lists.linux.dev>; Wed,  6 May 2026 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076188; cv=pass; b=F8fTlfhZXUEvgaJ1qabJJDW+UzwZFd3LviUC96HUQa3VNMqnyV6Vph98zWn5Qoi1pD+wItLphC/w8iyc2m6rMaNXw0W1FuYamcx9bjFNBgFrSciOZlMwaIyClGVFjnnBJaaQZlw79kYpq5kcboS7GWXAsXCzKUIfsDpaPpKq6G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076188; c=relaxed/simple;
	bh=+RS49Kd2DbvtubK5kt5W1aYVEDo05KG7Xep0OnmpGgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBJK7MIg+FRuO4Ng2EBFkbLAjjYcv5YYEjWJ5H1cxjr1HvZwEEh1jrXnkZGs0efEAjTk7HpvZKWaUBlSDT8zysGlvwMANcz5e0OLJ41FpHQpSmotudte9OgYxGxZryZePiCEnE/kDt+nor+GHjOdNvvdXCfFsZoxGHTBbQdmrJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9L5enZp; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9L5enZp"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94de664b541so2007227241.1
        for <imx@lists.linux.dev>; Wed, 06 May 2026 07:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778076186; cv=none;
        d=google.com; s=arc-20240605;
        b=PRTQBnfZhI5iXfLj1A9/1L/VEuDbXtILoErpZQ5UzDx59wohgQ/Dmy0cduPjLwdPPI
         1eHIlknMup+oKfM14UA4SH0itXjVExE6pkj3/QZP4NNgwgOwMIGCjqSCLFozmuLaxVqd
         iFEpVkzFglzHPteJ3cdvYgfSLMSwPCa8pNSqkZ2WfTrcUA7b359egUmR0/bg+lF9pgA0
         somJWBfIrRw6nMFv7/Z0hLrxmAdW6I5pEEb03RyLi7SxsTog47SQnU0MGe4UkM5HN/XP
         pPQYnb3CkVvAR26vUqxROxJSntde5SKJ274k32RJ+3sGnHft8BOIiJQciKCYlKFHdOz/
         YMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        fh=8rUN2jO6YqiLk5ux6TnasGFS59ES7t+sd9sSr2MSTS8=;
        b=e6xY1RULblMvxjXGiciW/v9zY+TyoYLVkLbmwLz8Eqq87B7SoanQ45YblxSenL92od
         OyqNEu+pglnIgKgYpNxdtYVopN1ixFL3hifGzuQ4UoVUkWBBP1z9UV7Qs5Q5VwsyHY7M
         vRo4IaZIl7yx/pT3AGB68dUy63tf5C537397PE6Ial0ANtSoki8CMQV0ai77dDhbbMN6
         VZiKH3N1YPq3CqVfkuEUM2k4RBOAxJOwztozDM8am8dGSBr+QzNu4tTI8t1zuM6yqx6x
         I2H6eBf2UIr4aTqvflN7KMxG/SLJ9HkLAj+hw4c47bVfLK2yEljLdxzdsm+KDn1gQMhQ
         f/wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778076186; x=1778680986; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        b=k9L5enZpoLlEDs4Ai23gcXwpZ0Cc6Jf3/IB7ggGPfOEE5CGrojcoeTE1pbDXpgboy2
         sDI/xwKjjoA/ovoPbdeOlMkUOcejEgGmoindaB0dwx+JX3XV3mrNd7uapKn9iFbL4psU
         ocQjev+yHwX0e/JMweRH9n0cIVcHyl1FMjSuRCRGH3oDr8ub96AojSjOSVUUeRVgTgjI
         zRXV/X3Gkcu3fQ/jbTDfUtlPeoC5dRR5gspCJO9Jy+MYoO2z1NLuDgYy6KG42RrIb/tZ
         uO7ZfBT86dMOi6M3ThpQHfv5YoUcoekbO79T9vNPRwSfi8I40/tFpejmbZxFnyLL96ND
         BSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778076186; x=1778680986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        b=AlIKrMZGa8FWRt4XsDQ3lDIwvdvmZOyLHPxX8xHL8FXItqj1kxo2giX4gKotlboBfs
         kdS0gvSde+4VaRFdaqKxlA7tz5+t8oirMlGZzhxi0HgJnnDCVXqUaVp23G39mLxcIG1L
         RufPR01uRPFyrM2ClWqj/ALbxEVK4Rk9+ZUctEgfABMTthkMdLw+AMJpP+SZbhip87mm
         srBNEJUKy/IrVgn8Cd77bphTj+yVOvkEaaW08mD3pWSrMOztzjDtvcG+9Cs7eiLZHG4v
         uFql9zl7juMo21Aac19JtUZa836jBitXHfVdaLTMQkwUknqpZ6XiVW42QGpb+lmGSZje
         FKug==
X-Forwarded-Encrypted: i=1; AFNElJ+W/XapbWKFBc3ZCsiJYJypZOCiSCp0HPtdG2P4shDv9tl6g0PqUhz0ajgAsBo7Rh0NYbc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw85w9+mpywCdUbEaQLo1O//FZiR3Ag6b3R4fcqUsy6ms1YsQ4Y
	rJeXm/FC/SJBPLq1/BBrEEEvB7DOzXOgOkfxrO4HjlsnYzEcZbwi6xmuW7xsku/BsX9G3Zx7hSO
	kJWVxF17K6dobAdHZ6ULgjd9XXNP1KDc=
X-Gm-Gg: AeBDietcaSq6z1tUYJvbBVauFumP5wGd9Q8QoVLhw191pCgFT6yDlaAyLiUCK08Bw6s
	w84FzEklkWrQ6Aej+UlWUmsZEZthqIr5/evvYwh09nDnjryp7eoYdTpvGTev/V1MFh5iIqEKFQp
	JW+lTmh4qxLVMAh2LkK4c0/RUklSraAxJukG70T4yXSRyi1EA61AG+WRejW249ztdUEUfoWhxzm
	CTLXEcWxgxm6xHfZoEXJIFN0OVtjeEzWg393RAFMuuk9aLEOznzgmnUyyamARUumqYS+UigyRbk
	1sY04EREwcge0fJ5MJoD2cpE9cBYNAeD+DfuE2OOZD56Hb9/Kw==
X-Received: by 2002:a05:6102:4a8c:b0:605:889a:89a1 with SMTP id
 ada2fe7eead31-630f9041b24mr1272953137.23.1778076137325; Wed, 06 May 2026
 07:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
 <20260501095433.1609309-4-mitltlatltl@gmail.com> <OmTXoHZJTSGePymL9I-1Cw@puri.sm>
In-Reply-To: <OmTXoHZJTSGePymL9I-1Cw@puri.sm>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 6 May 2026 22:01:22 +0800
X-Gm-Features: AVHnY4Jp93agdi_Y8mXGWuXYD7rYu7UJTV_Ohq4VXA590K98lCrI7__F8JibURM
Message-ID: <CAH2e8h6YM1D6K-SKg8UUL_-jJ0uuEvU1iK-xZtguNTurfO-U4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: hi846: Add 6MP and 8MP modes support
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 8:51=E2=80=AFPM Sebastian Krzyszkowiak
<sebastian.krzyszkowiak@puri.sm> wrote:
>
> On pi=C4=85tek, 1 maja 2026 11:54:32 czas =C5=9Brodkowoeuropejski letni P=
engyu Luo
> wrote:
> > Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
> > mode for years. This patch adds 6MP and 8MP modes to maximize sensor
> > utilization.
> >
> > Note that these modes require 4-lane MIPI CSI-2, as the downstream
> > driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
> > operation on the target device. The register sequences are extracted
> > from the downstream Windows driver.
>
> Has this been tested in this form at all? I tried, failed and looking at =
the
> driver I don't see how could it ever end up using these modes in its curr=
ent
> state. It can only cause troubles when used with 2 lanes, while 4 lanes a=
re
> completely broken.
>

I may have messed up. I tested it with two more patches. The first
patch removes 480P and 720P, the second uses a new 4-lane init list.(I
just sincerely followed the downstream) Since I didn't think much, I
thought removing modes would not break things, I just tested without
the second patch, so it works for me.

> The driver defaults to its first supported mode, which happens to be a 64=
0x480
> mode that only defines its register list for 2 lanes. hi846_set_format wa=
s
> supposedly meant to check whether the mode returned by v4l2_find_nearest_=
size
> is compatible with the used lane count, but it does so too early - it act=
ually
> checks it against the already set mode rather than the one it's about to =
set.
> This means that you're never going to be able to set any valid mode when =
using
> 4 lanes without fixing this first.
>
> And even if this was fixed, with 2 lanes this makes some calls from users=
pace
> that previously succeeded now fail when v4l2_find_nearest_size happens to=
 match
> a mode that's only supported with 4 lanes. v4l2_find_nearest_size would h=
ave to
> be fed with already filtered list of modes to fix that (which would actua=
lly
> make the check mentioned above unnecessary).
>
> Of course these are preexisting issues in the driver, but they make it
> impossible to actually use what's being added in this patch and to add th=
ese
> modes without causing regressions. So far these didn't matter as this dri=
ver
> was only ever used with 2 lanes, but they have to be fixed first before a=
dding
> any actual 4 lane usage or modes that require 4 lanes.
>

Thanks for your feedback. I think we can use specific modes for
different lane modes. The snippet like

    hi846->supported_modes =3D supported_modes;
    hi846->num_modes =3D ARRAY_SIZE(supported_modes) - 2;
    if (hi846->nr_lanes =3D=3D 4) {
        hi846->supported_modes =3D supported_modes + 1;
        hi846->num_modes =3D ARRAY_SIZE(supported_modes) - 1;
    }

Best wishes,
Pengyu

> S.
>
>
