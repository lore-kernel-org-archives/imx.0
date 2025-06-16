Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15662DF3C5
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 13:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079649; cv=none; b=by30JKM8CeE8SXC4F7yQ5HjsmSQcwYeCJMiLP7fW1wSTKlXzUaB5A3dyb2ORPfTl5Vq0wfn0Y2Mb/TgQiqjvgzXPKxbf1iln52mbJBHrETVuGmozS8U2ZwL62nGVRxmHGIMEcYHaLoQWjRuoKW+RPxpo4nBZZ5w2/vLavMKkUDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079649; c=relaxed/simple;
	bh=bEkIwJKNMLdtIH3qoD09umnOzSE4UEjxHiK/ZI7dhJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMf8ECypVcOpkTBj0CCzCGOCZ54+EIZFzCV+pDddvebXTF4fOycPWEZaY5Z92Dbu8/1XW/ve4qbr2T1StkLsOjkrSm6bGZbfGEE4VjrQBMIxr3PQbVmSEbH9nGhCyuLrfpWzheKjilUu6JNH+BF+E1J5FzVjh4UkewHaQva86Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IdqeqLr8; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IdqeqLr8"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e81f311a86fso4165766276.3
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750079647; x=1750684447; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BRYkbvCVxvcI/mg8yKgS8W1N0iZ7JRBV2UIynjIs8JQ=;
        b=IdqeqLr8cOJnSLAlCQOSH9mzrIx4scdaB8PEFX1sUr1v61i+4JaOQa4t2+mXbR7T/P
         owJJy8s20LLh9LnrRYyNHT2miuv/LpXMRmH0aFXvPmJeEKseEaxFKzj13bd7OLKVHaRr
         KRUwWkxj77DpTwzJMJhtGkvdQJRO8GnH4oyUHXzFpIvr2FxE9giAzPasVNz5Od33AcxU
         N1dhpI/vHdlzVtOhnPovN9pQMRhubR23jxcJBA/ztJh3KbZB6QI78sPSp+wGfI+y937w
         3xbN9KY1VFtw8ey6Gty8OQr5uRw0sfKaqs1+8x415kL2+Gzq8sZewpVrnbDVtp3BTXM7
         TYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079647; x=1750684447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRYkbvCVxvcI/mg8yKgS8W1N0iZ7JRBV2UIynjIs8JQ=;
        b=Xcx5eCZ8cTbyscSyiN6I42RotgYQ0lBXh80tjiVLZaxvVo+7XailIhCfAt9Byf5Dbt
         X4f0irwEfPkTQk5TH3lSqM2EmkMJyzTxopCswee0x/KaKQ10cYFHBj0hefqXBbi9LXGq
         YfT8xX6bzEvjqEsJr2hPusEFirDezboD4Ufl2chm1ThQgBGSwauhExXYuod91A2miclt
         YoSbcIfHgI0lfwyicgULeumMTjfODi3CdCQrLI427vJe63ruqFjK61mEqcU7bVBhtSwl
         RCLnQD2EKpekawIP3wXqfP7yvVhv2ayvrgGmAqW/zC7FE3McsK42nY79liOie3kBJRTQ
         7bjA==
X-Forwarded-Encrypted: i=1; AJvYcCWEufgGFfFqLKfm+fcDYnv71V2HIpSIr/iPSwkyrfU9k5f8owwXHu9TQVsua5CbRB2+gAw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCJKw2c1Pntdr0YigSNkbm/cdPzYB3KBE0NYcwz7sX7tiD7IpM
	7ZoFMJOuK34pjiBZyAbFLwt4kT4Xgub2gksbN1y9bhfAle1V2mXnvbhqnWcseLZcsHFYtLGnVqV
	h3IDREpQ2QfdXFaGMZRy7fgBMftvR3H3seVfaj4OjXg==
X-Gm-Gg: ASbGncsuLbj8us/bRLJsZ8JJq3RkIzK1tD8H767MV5qT56GzwOn5iPw+yYLSQldH0HA
	5gJmaCHiJxjh1HaAn0o9AdKcxxirIyIzyqgVNN+lD3tEUm/s8qX/xSW55kGG4YNI6Mlv3T1QmQP
	n6X3mZ0BH1VpUUFOgwCuSuiptye1aNVXMjH3vETYHFLtOm
X-Google-Smtp-Source: AGHT+IGi/aEqL6Rh0/QFbFi5llqcB5Z+A4DQiJChk6fNONAKpDZLCVOKHVzGhfBOvJ/fA1gHl6Xt6hW+mpx8lzQMNck=
X-Received: by 2002:a05:6902:150d:b0:e7f:682f:9536 with SMTP id
 3f1490d57ef6-e822acb5383mr11988415276.46.1750079642672; Mon, 16 Jun 2025
 06:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602131906.25751-1-hiagofranco@gmail.com> <20250602131906.25751-2-hiagofranco@gmail.com>
 <iuotfsnaft3623lchzop6sbu5ox56scdr57uia56qm6ummcvzt@yisczcdzbc3b> <20250612173132.ixgctqijtd33vnmb@hiago-nb>
In-Reply-To: <20250612173132.ixgctqijtd33vnmb@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Jun 2025 15:13:26 +0200
X-Gm-Features: AX0GCFuvpjxjHJP5wI9sLNmiJuYGa1YHq-TFuFSLYi0hAhYmQqrk1asShtl7yPE
Message-ID: <CAPDyKFoHHMv1MUnT-ZUTDiwZdMChq1KooQxnNDx=eettpoTAGA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] pmdomain: core: introduce dev_pm_genpd_is_on
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 19:31, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Wed, Jun 11, 2025 at 10:32:28AM -0500, Bjorn Andersson wrote:
> > On Mon, Jun 02, 2025 at 10:19:03AM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > This helper function returns the current power status of a given generic
> > > power domain.
> > >
> >
> > Please correct me if I'm wrong, but this returns the momentary status of
> > the device's associated genpd, and as genpds can be shared among devices
> > wouldn't there be a risk that you think the genpd is on but then that
> > other device powers it off?
>
> I am not fully familiar with the genpd's, so my knowledge might be
> limited, but I think this is correct, if the genpd is shared.
>
> >
> > > As example, remoteproc/imx_rproc.c can now use this function to check
> > > the power status of the remote core to properly set "attached" or
> > > "offline" modes.
> >
> > I presume this example works because there is a dedicated, single usage,
> > genpd for the remoteproc instance?
>
> Peng might correct if I am wrong, but yes, I believe this is correct.
>
> >
> > >
> > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > v4: New patch.
> > > ---
> > >  drivers/pmdomain/core.c   | 27 +++++++++++++++++++++++++++
> > >  include/linux/pm_domain.h |  6 ++++++
> > >  2 files changed, 33 insertions(+)
> > >
> > > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > > index ff5c7f2b69ce..bcb74d10960c 100644
> > > --- a/drivers/pmdomain/core.c
> > > +++ b/drivers/pmdomain/core.c
> > > @@ -758,6 +758,33 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
> > >  }
> > >  EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
> > >
> > > +/**
> > > + * dev_pm_genpd_is_on - Get device's power status
> >
> > Functions in kernel-doc should have () prefix
>
> Thanks, I will correct this is next patch version.
>
> >
> > > + *
> > > + * @dev: Device to get the current power status
> > > + *
> > > + * This function checks whether the generic power domain is on or not by
> > > + * verifying if genpd_status_on equals GENPD_STATE_ON.
> > > + *
> >
> > If my understanding is correct, I'd like a warning here saying that this
> > is dangerous if the underlying genpd is shared.
>
> I believe this is correct, maybe Peng or Ulf can also comment here, but
> if that is the case then I can update the comment.

Good point!

I would not say that it's "dangerous", while I agree that we need to
extend the comment to make it really clear that it returns the current
power status of the genpd, which potentially may change beyond
returning from the function and especially if the genpd has multiple
consumers.

[...]

Kind regards
Uffe
