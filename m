Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ECA2DCF61
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603582; cv=pass; b=cku3vSqaygR5HkD55gPopzyb6Msulen3wnWcUeo3kp/Z/3MlE5jr844spsDbVx7RUE8okfBgRgskt+KX951TuE316m2IM7hLjv6TwnA87nAGHaI+eaa6BIWZsd5+M0rMecmWGgOXJxpy2L0Ij6iYJ7Q+mBrEeS8AQl8h+uB3g98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603582; c=relaxed/simple;
	bh=K3r/uuB9DjtFjtec5JH8int/QbivJw0k9sJjH2QyFnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENfzRtTo5QDgK6SjRezTJt5EtGgdxoLdABMo45AgNHfZBJyFAS04Br9H8ooHX+w8NEsq2Ouy2Ev0ZV53ueCtuQFBzBueflBgM9vXfZZFLOnUwmj+3gYdb+nKGk5wT/NWseA1I32t3GHYZ5wdtIaJOo006paAbNHB/RmCeuOXU0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkJJNEBP; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VkJJNEBP"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e61e94e1bso2894793e87.0
        for <imx@lists.linux.dev>; Fri, 20 Feb 2026 08:06:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771603578; cv=none;
        d=google.com; s=arc-20240605;
        b=BGnzma9AlRIeUTzkJoZHIOTTIlIpBGYHBtymkq3RCImCgytD2C0tokzn2oS8SGubRw
         +jzO+y1MUO6YFozqQjiHTCKs5qoFDgg1uPkDzixhPNKzjaHwWVvhrC5ZDiInt0wDaaCn
         ExCwm84DuFnE2HMHffhrezLnRd3pWrztOm14XteTGoe6ALj9aPppAqBeYiQ4KXSQkhc4
         k+r+S9uuUsf/uKYbvVoXTvxxS63SReA5PKZ52afXR0FTpUOxIctcgWug3Ck4X3vL2Vfv
         pewd+K6ComcM6yRcvh5150Pzl1xjIspDK1SF421T+MSKX5sWEUaP630/4Ai5kpbX6T1U
         +sdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ea/dIgf/BwX1ubesAWWjAQYYJ/yBsIN9H/BMqEq7CN8=;
        fh=mEqC/3X9waY6jyG6DGb2yDma35nTMjbmIoARubxTrvc=;
        b=lgmVKrphqjI/tdc3Eyi+4iCYVmaPAC7f6Tx89w7otojEIjDsLVz1pENGfYsZsPLUrD
         uS7e8sIDJeu0DAFdHqAL1vno1UxMbApy4ew+vkRTC5ZU8b9v9QQk0ms4MH02Y5SUYGYI
         mxukIc31WbgAx4ZevPgwz8W7EvkXuhLrSCRgFq0f+7dEcWCEghEBiwR9TdlJRjad9sZM
         If7ir0hX9B9vy6zBAM1uxa5yyOYvSGG7koLsK9/83suUYSGJJ4HSh8R7W8Z9+fWDlJfd
         oXA1VO8DtOitMpX649QCJ6T1vxXYwrahdQ3vPXRVFW5D2HVVgm40plFriSNB+r/19EkS
         xfFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771603578; x=1772208378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ea/dIgf/BwX1ubesAWWjAQYYJ/yBsIN9H/BMqEq7CN8=;
        b=VkJJNEBPeuDlWjcJdqDDFqgAfppZ9R5CR/AZdkOhRksFN8eCrK+tolZADK99uAnm1H
         syYwCvXJoMgN7jQd495RtxG2JqDYfmaOVJszGSc9IoL3bAG7AznbkvwL/0/jlafpWcHC
         VHAvDh1TaT5nKwB55wjLKMOhJ0nMz0GLMZ5I7WL8Y29rbRpqBVD6Gvi8fKdKeRQ3ME1O
         Kw3TJn/GkstbVvrDU7eYcQx+WV+Q0BPsSBu0A2C9hDIt/KNL795NIOhta5nWwftCu2sz
         Xu6kGwRyP9S3HpNSLF/HUQJ62/t4szdsKj6KcMPsH3x9g+NtKP0jGabiVt8LnGsB2Ya2
         pzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771603578; x=1772208378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ea/dIgf/BwX1ubesAWWjAQYYJ/yBsIN9H/BMqEq7CN8=;
        b=Z4jSwlbLKoWlTQo6hGmx9xu3kBjsvGKyZxjn/sCKALt6qkmu/Kgi89W/wqDoqRzUWK
         +rw2TovKD6VaVES4c2OErvMrCuP26PpmUVkbvbWdUHqrftUbc7j5ILYdu1HSyzYZ3OVe
         q4y7LKa5ERN9EYS6Ubk4YutZjVQbTjiArxR4TPt9CZLQK535qOtuQHF+XhRIC3YzdlCR
         a4zclw8i7GfA/Qwt0hLWTDlLUYy2iCMhe8UsrLN1mYfoyEhOW8kKvlYNSPGz/oZ0cZ8W
         JJEhr8GWxgqZ/71bCQVIEIWVA/1HiSz4vNm9X4g9Y49gmq3SsJi7m4rtqSHoDBK0aSXN
         lbcg==
X-Forwarded-Encrypted: i=1; AJvYcCVQDuJncVsVV6oXiU09X3BQ0QEV0B3JqlHK7xTnybVTJ+tafM/l2bm0LW6I7t09H5vx5WU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYhK6qSqUPC7aXan+2KawY4u2jP3qmTRE4YnnXyhd87r/MDm0F
	AB5LeptklXk8VMMTvqM3Xgq1m1OXpJvMOswY1DUoxrmgBJxhhcreFVUHak3/Enz4NX7zEC45arE
	pKyaIoegtAiYU9Ps/o9JprvAj6gk6JaVS+cKZcQBc9w==
X-Gm-Gg: AZuq6aIRm2im4TPncLrOUKcgOcu51I8BLGSd+WhhIsuI40pBa+deJbuRpUOQrFAoT+G
	Gk1nfp4GAqnYFoqB15rnKQvwduwxNYOMS9C43kiqtNMU4EfgGUBOY/dn1rI7mVzvWKMUEs2Rf5E
	stvhZXSX5mDgPHpuOXQnd6Ttf4TInaIZqP+6nyxPPRek5ENX8tbO9bU7f1Rj7sBFN1HnII4S1QD
	K9Dpe1mG1uH8Nh01cjUzVr0T0wVW7EQDH1yQE6L3rSTtzTIsz6FpZmAdBn/AJdGJBgPRlBDVTub
	cgW8ygmi
X-Received: by 2002:ac2:5692:0:b0:59e:1750:ffd2 with SMTP id
 2adb3069b0e04-5a030c1b8cbmr858936e87.36.1771603578271; Fri, 20 Feb 2026
 08:06:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6245770.lOV4Wx5bFT@rafael.j.wysocki> <15658107.tv2OnDr8pf@rafael.j.wysocki>
 <CAPDyKFrgXG5X-y0teE-wVvqaeNepStMN3=0M4zkZs8Kb88U22A@mail.gmail.com> <CAJZ5v0iszxD9WV2Nfy9=usmP84Lf0aE9nCxKTBP-B2=zxqnoYw@mail.gmail.com>
In-Reply-To: <CAJZ5v0iszxD9WV2Nfy9=usmP84Lf0aE9nCxKTBP-B2=zxqnoYw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Feb 2026 17:05:41 +0100
X-Gm-Features: AaiRm53HxQF1tOkMo5VvypfLHpHjnHoc2QI0G7rk63N_f95cyKTBUJNKPV1R6uE
Message-ID: <CAPDyKFqP1pgyv3F+krKsViE96oyYF-O=Q7+bresDf5Okjeh6RA@mail.gmail.com>
Subject: Re: [PATCH v1 19/23] pmdomain: imx: gpcv2: Discard pm_runtime_put()
 return value
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Feb 2026 at 15:07, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> Hi Ulf,
>
> On Sun, Dec 28, 2025 at 4:52=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Mon, 22 Dec 2025 at 21:37, Rafael J. Wysocki <rafael@kernel.org> wro=
te:
> > >
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > Passing pm_runtime_put() return value to the callers is not particula=
rly
> > > useful.
> > >
> > > Returning an error code from pm_runtime_put() merely means that it ha=
s
> > > not queued up a work item to check whether or not the device can be
> > > suspended and there are many perfectly valid situations in which that
> > > can happen, like after writing "on" to the devices' runtime PM "contr=
ol"
> > > attribute in sysfs for one example.
> > >
> > > Accordingly, update imx_pgc_domain_suspend() to simply discard the
> > > return value of pm_runtime_put() and always return success to the
> > > caller.
> > >
> > > This will facilitate a planned change of the pm_runtime_put() return
> > > type to void in the future.
> > >
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > Applied for next, thanks!
>
> Since you applied this one, I'm assuming no objections, so I'm going
> to queue it up separately along with the patch changing
> pm_runtime_put() to void because I would prefer to make that change in
> 7.0 to dragging it for another cycle.
>
> An ACK would be helpful though, I think.

I was still hoping that Linus was considering to pull my pull-request
for pmdomain, but it seems like that may happen. Assuming that doesn't
change, I can re-base my next branch on Monday to drop $subject patch,
but please wait until my confirmation so we don't end up having two
commits in linux-next for the same change.

Kind regards
Uffe

>
> > > ---
> > >
> > > This patch is part of a series, but it doesn't depend on anything els=
e
> > > in that series.  The last patch in the series depends on it.
> > >
> > > It can be applied by itself and if you decide to do so, please let me
> > > know.
> > >
> > > Otherwise, an ACK or equivalent will be appreciated, but also the lac=
k
> > > of specific criticism will be eventually regarded as consent.
> > >
> > > ---
> > >  drivers/pmdomain/imx/gpcv2.c |    4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > --- a/drivers/pmdomain/imx/gpcv2.c
> > > +++ b/drivers/pmdomain/imx/gpcv2.c
> > > @@ -1420,7 +1420,9 @@ static int imx_pgc_domain_suspend(struct
> > >
> > >  static int imx_pgc_domain_resume(struct device *dev)
> > >  {
> > > -       return pm_runtime_put(dev);
> > > +       pm_runtime_put(dev);
> > > +
> > > +       return 0;
> > >  }
> > >  #endif
> > >
> > >
> > >
> > >
