Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B320CCDE
	for <imx@lists.linux.dev>; Thu, 23 Jan 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737623981; cv=none; b=aGp2T1AD+eNoxovkpgAobRt+wJjNL213exUoMkxPO7w5NxWRwbJQYNYxwH5PtI56HKcNiNvh2UvxWSyaX4le4NyoM2DDNW+0EV1CyAMaGDLU11Rh4hkrSRJZoX//WVFHVIt7J5OqMa0dhkFHrNxGqt05nl053nM5xaX1tQgvhpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737623981; c=relaxed/simple;
	bh=oB4W4SH6htOtdlhb8GrE+2UJqq21f/9wPF0wA34Zojk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEQyNrn9EVOYQ0RTfaRXx43XGa4nVHL2RgONMl12jpDHCy2xLPkfvFEiPtuov8+qrX6ORoGg5gFzPT7aAVwOVtrdkpf02I5mjmrGYTchTHoQgY2NISNRHUbsFW/D7PUk6K5coA+t2iXOrEw+zlE6Rhh9Y53j3q/QcqJo81HeVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r4hoV8x3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r4hoV8x3"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30613802a04so6531961fa.2
        for <imx@lists.linux.dev>; Thu, 23 Jan 2025 01:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737623978; x=1738228778; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB4W4SH6htOtdlhb8GrE+2UJqq21f/9wPF0wA34Zojk=;
        b=r4hoV8x3pPL9J5HxfwLpABawO9Q+BjsgTeCKg2u74/44UBdwa7L2CsqjdZbcCoc4eb
         3TeY+GvACT/y+r+tvBFcKuNq3fG0Lx1cnPTjaRrIybvKMn9kMuSetgde8uXmDcLEeXmB
         eeyzgELzW2u44GyeZ9KYLCFjTiQBBNnT++0mJyi2v+t6l82fNPMHug6Hx/omGOlkt4Bc
         kkUTCpIK1GrkXAN+W9wDVh6ckbh+eYOwqiVMdgQjvNQPkzeA4OqbFrOZPXuhaAeG68xu
         FW+7rBsfpbGU+bKg3H7AI/S7QzmhF+z0YPjlwCWS03lVkIOVP0nkAhkvOVbY23Zhs/Dx
         LyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623978; x=1738228778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB4W4SH6htOtdlhb8GrE+2UJqq21f/9wPF0wA34Zojk=;
        b=hluQbuP7RbWsqyqPTjf54qTYc7Mk+m/EOI2dbKmjFNvmfIt3KB123+1IEmomk42wSM
         jBrAmp66brvICPr+/cJgR92MHQq6SufWny571fvWqLbt2faZJ3AR0dh5KOn29S7s/eQn
         sDWAlqycY8x90XNKsa0g2ZkPC+RfSuKKKLTNlqdVIRDbWMqxBEukN/gYLg9FgRunNpIE
         KJBZBB7+qr1ZWoHdYGE5FwkqNAWHqSzFa3/3LmX9ZLqBY/7ltk93peT62ljjekPuVicb
         OYUdg66AXMth985sZtbw4Pl5/l2dvEFU4v3+qjlHUxzZvyipwEYWG6gloLlejAStcF+8
         3nzw==
X-Forwarded-Encrypted: i=1; AJvYcCWzG+NjBpF64asmQsprz7y26Tps9b1dZa89C/BCWC21NA54S5HjXST6pglCTC8X5B3ckGQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YynwKCeLtgLIc6erikvY4/ee79l/6bg+ECutoFjZujOE00W0Nx+
	UlT+agnLozMIAAsw4kfwlrs52GThySYKj/SLA2vKgE3NI67jT89kFhDiusCnASJeJqNPQ4DU8cu
	Ve3rhxeO2qJuJlIi0fA2LecrBliruLGx+JhdRgA==
X-Gm-Gg: ASbGnctAI0blIVJvmQPtK5UxsPa+HOX/s0XaXZGAYjzQG9ShAShysOxcI4qhDWc9v9E
	lQHvKYNWFQxmj6OMXqMnj5sCYp4kKQtKtmGXdJ0QEmitomaa/EtMNFjCxXiRuAcr2NZ8PYIhQjN
	w0262Zqf4jJ/85OhffcQ==
X-Google-Smtp-Source: AGHT+IGbSoxSTFInm4TCaCofKOLTJWRiuDcAw2dKFZSYyjUZBr9SIVV2X/zkpumKU3mLaYhF4wBklmHsUPwTqe2gouc=
X-Received: by 2002:a2e:a373:0:b0:2fb:4abb:7001 with SMTP id
 38308e7fff4ca-3072ca5c94dmr67603241fa.2.1737623977535; Thu, 23 Jan 2025
 01:19:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
 <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de> <CAMRc=MdYB_XHCaurs1mO+KGX7rB5zFT3zCi=UbNY0rSbMEJdWw@mail.gmail.com>
 <3f21523b-816e-488c-bf0a-c6677c375a18@pengutronix.de>
In-Reply-To: <3f21523b-816e-488c-bf0a-c6677c375a18@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 23 Jan 2025 10:19:26 +0100
X-Gm-Features: AbW1kvYo_Qrh_r7UXUMBdQ5UCw_ecPTbUqtFHQIGsKawdSRJFwErHJRVdlHKD1o
Message-ID: <CAMRc=MewWr8nrUBgWe+ckTuVdmLC=grkw1aWeXnWszcaBZvZvQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 11:37=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> Hello Bartosz,
>
> On 15.01.25 17:52, Bartosz Golaszewski wrote:
> >
> > I recently wrote a user-space compatibility layer for sysfs[1]. While
> > right now it doesn't support static base numbers, I'm very open to
> > adding it except that I wasn't sure how to approach it.
> >
> > Is this of any use to you and could it help you switch to libgpiod
> > without changing your user-space set-up (given the support for static
> > GPIO numbering)?
>
> If the goal is to have a drop-in replacement for sysfs outside
> of the kernel, I think it needs to maintain the same numbering.
>
> I am not sure I see myself using it, because the new projects are using
> libgpiod from the get-go. My issue is not with removal of sysfs, but with
> user hostile deprecation approaches.
>
> > If so, how would you like to see this implemented? A
> > config file at /etc that would list chip labels and their desired GPIO
> > base?
>
> Many GPIOs tend to not have labels. I think the mapping config file
> should rather map GPIO controllers to a base address. The same thing the
> kernel is currently doing. This assumes the numbering of the built-in
> GPIO controllers is deterministic, e.g. by consulting /aliases. I haven't
> checked, but I hope this is already the case.

Well, they will have labels, it's just that the label will be
something like "6e80000.gpio" which can very well be mapped onto a
predefined GPIO range.

The file could look like:

/etc/gpio-static-base.conf

```
6e80000.gpio 12
foobar 340
```

Where the first column is the label and the second the static base
that must be less than 512 - ngpio.

Bart
