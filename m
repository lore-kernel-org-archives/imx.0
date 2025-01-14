Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7871820013A
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 19:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736883545; cv=none; b=I0EiXUvqB+2VAxAwJLdAhYmmQztk+VqGKoV464BlC4L1nJMBeOQqbnWUZke6xTrG/TkWrJcdUJ2uTvfCqwIk7z7ASVwJPqKXbhuaJnOpyECcvAYjQ9jqG+6AfxL6TqO8AEs2F5ipnKGRSbui4c4SYpkK7i5d0vN6ZmsQszkwT08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736883545; c=relaxed/simple;
	bh=SvjhFkZ5JDAX452mdJcA/v29Qpr6Qp4g/a566g7672Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCPWcxy9l2CUQ94SUjTpWaPQsbdPy0yiRiJVEeoqhJXc7jhxr6bb6/DaIdbK1uJCidu6Cv3hxnK4ONaPlvYFmMtNqQGz5avPa9ZBUbfZmZllpUEUSZQuShKpL+jZ27mbaVFb+ng7ABK+Cg7Z2SFn6zWW8qlL8a8jNzaYQlRexrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfscKFe1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfscKFe1"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaeecbb7309so1105979966b.0
        for <imx@lists.linux.dev>; Tue, 14 Jan 2025 11:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736883542; x=1737488342; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2kWKgGJwqIvg8wFPSvtYgSdMXhyo06JgkJuml3qb60=;
        b=AfscKFe1GW3OCM3y8z5ZONk8b7dNhmqB1abscIS82zhqLMEwynXewNOGS3j0wN9PyV
         TlrXPeezemQS7p3+mBUHbGMGQNFlr+mfG3iV7oxqJYA4KGsa5uAwE25ZWFQGWiFbr5D/
         C4WYgO0dUnhxj75K8g7lJWFh2IFqX+yumUDImaJMl469WWlL2nfz2ZwYnFCt2rGrocvR
         HUr75CekAWCO0xAnn8S975P+n10gqWh+TgE/DI8AAqUo37kqa2cyb8Zqdu4zEy/5CeYs
         x6bVTBxzn9Dxwwp48QpJgOYvOIGpQxVjLTUnCyrnLtQ6YmSp1BnNmgNtQbZ3u4u0YV23
         ZK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736883542; x=1737488342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2kWKgGJwqIvg8wFPSvtYgSdMXhyo06JgkJuml3qb60=;
        b=MQgIF7JVGizKPLfC23hh43JkakJvPhtryTWELqY0KYXxhM5gBS1mcHMC3cZ5wEVwm1
         Z9C9KmTccbnlGUgT5d+p9T6AH5JIfMevDo77s/BnIgcOP6JcIaFFwKvdNG1/JwVp6z33
         U72beG4H2HB9v2VkkkiAc3CxGfr+PMAZPfFNyct1EH9WiUJj92yrkfqlCZV+IowYywFO
         ODs7/zG4AeFmLzXdpxRSh79DBXbVuBrfN6yggQe+E1PYxi6ipta6uErDxMQ2BRp8VVPG
         q4Fpc9f6vOKbAt1WJgVSHqlErQC7MHI7IcgUTCJ2ypIcrOpP9Oc4mpf/GIrm7XRs6vgt
         1Wsg==
X-Forwarded-Encrypted: i=1; AJvYcCWF37rVKECM+mlN7aB+YIB9Nq85K6CcnELng763x/vJP7sZlba36WlBRa8i56sG3N/aPjE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEV17Ty9vngJofA8Ge00mqiMUFPdu8IyZyXqx5cLSIAaSVcEXg
	Uz9+9WXO2iLG4yAzMKUa++fg5MPjEDe3p32QYlbe1iKStkonC5ojmDrs9yrT57QP3dTXxHBfAZM
	L4V+iXRM0rShyH/mpZo/3vhUR2s0=
X-Gm-Gg: ASbGncsKB+rhOdVEgk2ttANTenNC+qaVDePsBqXzupothDPdjSSVVK5oXAN/zfws97l
	SRkR+Dg1QpyJHkF1pw3fJHBurSW0OYj4F/UbfKi5g
X-Google-Smtp-Source: AGHT+IGVObRTXkJgLmP+wm2jP1YHrpOKzkqy6VxBJmEYGfuoYeicXpLRBMTRDYNPxmMcfQYiic3FDlwA+bhaVFvq/20=
X-Received: by 2002:a17:907:7e91:b0:ab3:f88:b54e with SMTP id
 a640c23a62f3a-ab30f88b5d5mr877315766b.31.1736883541610; Tue, 14 Jan 2025
 11:39:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
 <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com> <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
In-Reply-To: <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 21:38:25 +0200
X-Gm-Features: AbW1kvafmnO2knYXImFWgVHzWQ-97My7fO0qROrQj8PrD4sC6j0CFR5lpTEhMPY
Message-ID: <CAHp75VfAmqzKxgXTc9TqeFOeGSr_D3NmCa0M7+4Zf37CofrHeg@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
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

On Tue, Jan 14, 2025 at 12:06=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
> On 14.01.25 10:49, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 12:20=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutr=
onix.de> wrote:
> >>
> >> Some drivers have had deterministic GPIO numbering for most of
> >> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
> >> ("gpio/mxc: specify gpio base for device tree probe"), more than
> >> 12 years ago.
> >>
> >> Reverting this to dynamically numbered will break existing setups in
> >> the worst manner possible: The build will succeed, the kernel will not
> >> print warnings, but users will find their devices essentially toggling
> >> GPIOs at random with the potential of permanent damage.
> >>
> >> As these concerns won't go away until the sysfs interface is removed,
> >> let's add a new struct gpio_chip::legacy_static_base member that can b=
e
> >> used by existing drivers that have been grandfathered in to suppress
> >> the warning currently being printed:
> >>
> >>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
> >>   use dynamic allocation.
> >
> > Warning is harmless and still a good reminder for the stuff that needs
> > more love.
> > NAK.
>
> A warning is a call-to-action and it's counterproductive to keep tricking
> people into removing the static base and breaking other users' scripts.

Are you prepared to say the same when the entire GPIO SYSFS will be
removed? Because that's exactly what I referred to in the reply to the
cover letter as an impediment to move forward.

> I don't understand what love you think this will spawn with regards
> to the i.MX GPIO driver. Can you explain?

To fix the bugs you found. If it's not the GPIO driver a culprit, we
need to find the real one and fix that.

--=20
With Best Regards,
Andy Shevchenko
