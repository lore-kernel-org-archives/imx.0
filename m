Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5420435DA6A
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449504; cv=pass; b=j8dw4AAZIf3XtW2djEqzkE62MIOFJ+sOKEhcBZYNZyjvjrLmYYGQbKNlqUCnqdlT498yuUse4FS8/vpb81oIqWHfFYKYbnRz8xwzVNSwG2ThypLeqSZGthlGHJykRomPwxI5FxmyF2aUmAWWrtpVsx355/4kqqGkkrjBarBPb+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449504; c=relaxed/simple;
	bh=MNN0MxQutkVAICnu21/rtSu7MZP/rEU4Ta6qHPWAsoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zhk3FrB2JSky8A6g/EW6gIe3X7WQOK+2zJLf0wFxCgZs8Z5ZTfUdiCKrRVoBUIQ8lEBiVnsB8p5fRwNXwHGEBEDo7OZfeDp2eAm9q5HvAMSBMl9VMN/OIh9FDP65M9NubaSkoVWMm4lFvzrVuIWQ6qLuNgcEb4JK32Um5AWA+gE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSFQxdKl; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSFQxdKl"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d4cb7e10efso5289146a34.0
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 03:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772449502; cv=none;
        d=google.com; s=arc-20240605;
        b=gPAnhMZIVJEAVOp/glmgLxy5OZ28h7WbM2vy7WuWNOrYo3/74/BOQ028TzyztvEhh6
         HtpR8a92SdT3IfVL1fuX4ACNqvPFWHY9xxeN33yZymI9RdZ4A5H6Rsg5GdYbG3GYbam3
         rGuNtRIwfzk1aeV8xV32R5CSDbdb5aFpUCPkpusRwujSs1qlO6aPxhZjZJHVFO3LgnUz
         /cYDvTYQCobef08dv9QxB3L+dtNwMM+HbgwL9d00Mp9f9qJNoDUzQdIY29OMBtSRJCeO
         JnsAeDVQmJz/qH3LP+pjMqngKcr/96pLLomiocu5gnxW1fYOwMWAZg/0fnkNyQTQ3PJG
         Je5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        fh=5UWynSWu1goM6sHFYJGPgnz21pIi0h46mhMzZGOYsQU=;
        b=j9q7AtigMMf0Ob2dICxteQaERJMDQz7+4eST3wvHNNJ1GXjjITm8p8wLaAJgPlXygk
         cg8wQ+uUTIE5O2KulmCK9SXwMcTYNwEJgn4gzw8ZrCIJOJwSAUPk3+yvNcmg/Dd7fpTQ
         FEpSQ2XLT9YEiRS1kPR2Vecr3Jx0GUERKQqxRSJQHpSiryyQrCXTLnmHeyuuXegvQMji
         DA1GwbBawsjVW3zvyC3dfijWpczPUxqgaeAKkYhQ41V4pfxRhyd9oD4NKZ767i+PV4B7
         dmPSNUd1vJ+LjcNCRXLim9ggUGe/f6U68sM7V89jlO/itkDi9O1DjqXZL3hsTLDJlJYq
         H48w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449502; x=1773054302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        b=SSFQxdKlyP+tupXysWuH62JSo26hNzD29sUfwlb4qLh56nB7g48Scq0HQlJ1JC+LeY
         /SCSpqXF4Un0lER1up6kRwLhtYgt1UrS62zriRLb9zdGtYp2o6qzcXKK8uNwuVskYbgm
         GRIklh0gGEfkGDEdeQ4moGsMexFbxbDpQ3r694Bhv0jt6WzcgVh32H5J0icXs0RMsCbQ
         AZqm1xSzOHL4xWe3sRfpHcbDaAmEf6mhe2oRJRTczWzQXGgsMTIfo90cKmeTOffL3xCB
         Bbj1s4EfSBZEeg5fO0fdUX3XRMItjhDd00Czk5X71761v+tDIGJOV7rzGQlfl3xRFkpZ
         9iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449502; x=1773054302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpW1qD1SJXhXQMOWzRKDDnDlmrJmewCs6uD1CPB0kj8=;
        b=E/J8XB7UAi3hXbNl3QXesvZuu2Qx67XuiJt1vHngX4Ez/SAaagjH3PRehb0upytHqV
         N0YJjJsWKwf3rE5VCyTvUNloRU2RR4u0xlNlkZlozu5Y5sA4CETPyk3Q7odv43iVSwQo
         8xyx9rltC2BAn1lkmJiUdP3aU3iS2ju9s/f/bZYvKWZH0fLh8UWfuVRTVPP2+M5SM7Fd
         bdZ5ncUHkIibFSa5eWqbC6fflf8VnmDu4A4u3ALcelfwZUG4+M7jzSPJS7B6tnEIwL3L
         TAZOKkk9AmKyzHzCTDxMJmab/GNKJu2SfNZ+2zSeVdS8HTksuCxdp3QhybEW2zCjQZ72
         saYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTZprvZjT9U5VFphq048hPQHuZKNFPBg2jl9oJwUoRegfQ2gu6UgTkJxjNLYt600dxDLo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWrjm0p5QKgm3fukNUeX3A9YYP0OhH/lVLFS5jkqqksp9TMlIf
	2BkwHKefxrDg9qh32/4jDEdGyWSSZ/TJ62M0veqMG+dwCRcM0yuFW/8J2RETQvspPG7fSkq+DmI
	tlKKJPPBWuWYe+8hDZyqKAr5RYaLdGEY=
X-Gm-Gg: ATEYQzziH6jS0cXf+tGY2jxC6w9BOw/V0LjQytFi6QTg+YTjQFYg5RiCvX63lq93BkF
	EKNcHkLE6YePXbILDSS9Lal+7wVGNJL16dPQFsddIarhx6yJtRhl08LAPDjGpN2udfkm9dkyxcc
	cZRWXyk4lPZ3YxDFgd7ZKc1wZg9eWOpzOviaaPQUmacZUJBtREe6nRrF19mI00fNg0qPJ80ULs9
	rZNzmKjMuUsaNUI8tgI/UvOnvppJtXDGnZ07ROyI3PordkizRniGAN+pWBIH/bRd7+oEiPp8Imr
	PlLUxyB27OZgfhHVLu9W50b5HmK1Cb1ct+pkAbrsT6S/vy/CFvHkLho7sZiOFerlVPQT0131FuQ
	=
X-Received: by 2002:a05:6870:ad08:b0:3e9:1643:5977 with SMTP id
 586e51a60fabf-41626e0fc5fmr6099442fac.18.1772449502199; Mon, 02 Mar 2026
 03:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org> <20260302002729.19438-2-dakr@kernel.org>
 <CALbr=LYqfhMi4eGp18r20XFzOWqRYCB8tO0mc_TAydb5cgbX-A@mail.gmail.com> <DGS7NBNUSBI6.16D6UP28IAXYS@kernel.org>
In-Reply-To: <DGS7NBNUSBI6.16D6UP28IAXYS@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 19:04:51 +0800
X-Gm-Features: AaiRm52arKfwi8YCxjpEdTXQmweggZZESyxe8RNIzUhwuktCE_TgfQAoQ172OQc
Message-ID: <CALbr=LZ6Qu+oi0XiTZO4u+H2Jsv51jWazmK7xPt5EgK9DOy-hg@mail.gmail.com>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon Mar 2, 2026 at 9:36 AM CET, Gui-Dong Han wrote:
> > Applying the following diff fixes the KASAN issue. It was just a minor =
bug.
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index a8cb90577d10..09b98f02f559 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -2556,6 +2556,7 @@ static void device_release(struct kobject *kobj)
> >         devres_release_all(dev);
> >
> >         kfree(dev->dma_range_map);
> > +       kfree(dev->driver_override.name);
> >
> >         if (dev->release)
> >                 dev->release(dev);
> > @@ -2566,7 +2567,6 @@ static void device_release(struct kobject *kobj)
> >         else
> >                 WARN(1, KERN_ERR "Device '%s' does not have a
> > release() function, it is broken and must be fixed. See
> > Documentation/core-api/kobject.rst.\n",
> >                         dev_name(dev));
> > -       kfree(dev->driver_override.name);
> >         kfree(p);
> >  }
>
> Yes, we must not access dev after the release callbacks has been called; =
no idea
> how this kfree() ended up below. Thanks for catching!
>
> > With this applied, along with the PCI driver diff from the WIP patch,
> > the issue is resolved. I tested this on PCI and both PoCs no longer
> > trigger KASAN. I also ran with other debug options enabled (lockdep,
> > sleep inside atomic, etc.) and hit no warnings.
> >
> > I was working on a similar patch recently, but your version is better.
> > Not returning the string directly provides better encapsulation and
> > makes the API much harder to misuse.
>
> Ah, right, I remember you mentioned that! If you want I can add your
> Co-developed-by: to this patch to account for your work.

That would be great, yes please. Thank you!

And thanks for all your hard work on this patch series, it's a really
solid improvement.
