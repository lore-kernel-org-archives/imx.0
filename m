Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C92459B6
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736946284; cv=none; b=KEn2auJJoVIuskiN/QSTKKaO/9DTdM4O0wyS/XzqCLza7M3in4ggnPrVDfvnQ2ZX5A+vQpeVZvEuz0+O91X60cFuJAaUKGb3CoeHsZAiYQV5Mb1ZV6hqIc+jLTf4/HqoCTg5SavXiqlkAMuL0A+763i646lS/drpiCDJbC/jvqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736946284; c=relaxed/simple;
	bh=e1ivajvioQtb+yXA5SvDQN7tPZvYwGoki2gbx3ncK4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+BCYdARvNll5pihPqmXplQteeJRhxvJPn8LO0WTB9AocfTEiAiCt3wLlp7pFS0pKSeeMOEsHZ+gikn4FTPE/7uPpRm9irRhbZLW9JW1KA5cJ3yAZJgGryY5KVoBX4FN1XkkA/EiPYGCO04cDMmB5KRUN6xrq3l472O1ciNG6Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V27O6YL+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V27O6YL+"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216395e151bso10752635ad.0
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 05:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736946282; x=1737551082; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iZlRWczKMuYSQpBwQS3/Wp/dw4gagy0ZZEnfpiDku94=;
        b=V27O6YL+BNH3DdYnGN2wFg3zqn0y/vDJd1SyiU1VkgEpjZgNZ/ZZRWQgbxk1lEeN8C
         7q3LBrtgEEkS9rzv2nlDXvu0CpQXK2sxr/Cjz0vYUi8IGqBNhAyMuZlTaP2cLFosrPvP
         6tXKnpqgQQEiTH/9wMuO2OrhpE+PYih7KWidJsESIrvRAg0mOjBXIUD/vSd0rPO+xLAt
         AgiO0Cwj4EDUlT3PkV/fuN4VYq7f2S5jh4hs49cl+a9/D20y2wn5hO7dj9Nty3D2tfQ7
         4j/F0chJvpROQKcRkjvc456i4r7NgXK8+Al7ziibehL72UHT5Fci+Uji+vFrsaauob/N
         PFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946282; x=1737551082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZlRWczKMuYSQpBwQS3/Wp/dw4gagy0ZZEnfpiDku94=;
        b=cdnX/HrCq3sVXH41d683OILIGc6pkPcVKmUDST0MSYH9afosBIzBr2ZLYFiWPx/Rrs
         QuWbG6aYcH2K2wL1+XrO0hF5FQ/WnyxbKtqm9X3N4wPIvRUfUaZy/h0tZO9E+IUDyc/5
         CJjruHuiZXRBgRmY6/YMVpEj00f7xrMzUcO0jiEdRwC4H9Em5JsoRHIxnanLk3RSwL8y
         I+MM39RtizIYVIk8XBEkWZgcU3/ias6n6fvLzbKd9Rf4GNqGndE7CHebGnQbz3palydp
         t86lMRQG0c0zjNXN2yKTk+53V9aIx9M1oyAZnUlg7wHu40bTYr0fxOFwsytHqe1Pwdy/
         ZVrA==
X-Forwarded-Encrypted: i=1; AJvYcCXHEOyuj5J8S8D40VQy9Yp/z4T9e1dQFeIgGpwxuOpOLvpB4d+lXpWcbwCMBF9zIOHSdAU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFNonp7oe1PHFSVtAgbf6wiQDIBilbANXSgnuihC/mVR17JJ8S
	6uEgz42PSe6RBHOEH1oWWAqki87VzrsnKPaRAavYszhNewzFYyIE
X-Gm-Gg: ASbGncv+R/741Q+PMRNLIKmOLHCsFZa4YjUT7pzNL3d8vab8NW1fjzMFqoCFQQo1h4/
	6UOfXVn3drTpLGvt5bWd0DyScewY0S94BDE5j6bTqqce6jSqdBqOxRkNtN+qOuRsjfuY4PvHzrc
	RtJ7UDXiYULXLGA0pvOHn0lOJ13QDPvWZ6PTzwliueCEUhp14q5DtpDo+3UYn4vsA2aHceOzRIU
	7cTEnaCu5W5HDwHQ+90AR87HBvxnfV1zhJmiAwHzbmsV3bCydh4W4Nq0LaxYjIberNWfKCcjrJA
X-Google-Smtp-Source: AGHT+IGP1MoK+TswjCTX6n6RwzyNOH2KSgOcYC27N3Q9DsQ1b+VWnKsHu/ZOWjDg/b36Z9NPcODScg==
X-Received: by 2002:a17:902:f605:b0:215:98e7:9b1 with SMTP id d9443c01a7336-21bf0b76a43mr47212525ad.5.1736946282107;
        Wed, 15 Jan 2025 05:04:42 -0800 (PST)
Received: from rigel (60-240-216-120.tpgi.com.au. [60.240.216.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f1386efsm81502525ad.75.2025.01.15.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:04:41 -0800 (PST)
Date: Wed, 15 Jan 2025 21:04:32 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with
 static GPIO base
Message-ID: <20250115130432.GA159787@rigel>
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
 <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com>
 <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
 <CAHp75VfAmqzKxgXTc9TqeFOeGSr_D3NmCa0M7+4Zf37CofrHeg@mail.gmail.com>
 <40531a5e-993f-4532-b071-6f233d6923f8@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40531a5e-993f-4532-b071-6f233d6923f8@pengutronix.de>

On Wed, Jan 15, 2025 at 08:07:38AM +0100, Ahmad Fatoum wrote:
> On 14.01.25 20:38, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 12:06 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >> On 14.01.25 10:49, Andy Shevchenko wrote:
> >>> On Tue, Jan 14, 2025 at 12:20 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> >>>>
> >>>> Some drivers have had deterministic GPIO numbering for most of
> >>>> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
> >>>> ("gpio/mxc: specify gpio base for device tree probe"), more than
> >>>> 12 years ago.
> >>>>
> >>>> Reverting this to dynamically numbered will break existing setups in
> >>>> the worst manner possible: The build will succeed, the kernel will not
> >>>> print warnings, but users will find their devices essentially toggling
> >>>> GPIOs at random with the potential of permanent damage.
> >>>>
> >>>> As these concerns won't go away until the sysfs interface is removed,
> >>>> let's add a new struct gpio_chip::legacy_static_base member that can be
> >>>> used by existing drivers that have been grandfathered in to suppress
> >>>> the warning currently being printed:
> >>>>
> >>>>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
> >>>>   use dynamic allocation.
> >>>
> >>> Warning is harmless and still a good reminder for the stuff that needs
> >>> more love.
> >>> NAK.
> >>
> >> A warning is a call-to-action and it's counterproductive to keep tricking
> >> people into removing the static base and breaking other users' scripts.
> >
> > Are you prepared to say the same when the entire GPIO SYSFS will be
> > removed? Because that's exactly what I referred to in the reply to the
> > cover letter as an impediment to move forward.
>
> No. But this gives me an idea: We could make the warning dependent
> on CONFIG_GPIO_SYSFS and add a comment to the i.MX code suggesting
> users do that instead. What do you think?
>

AIUI, the purpose of the warning is to remind driver authors, not end users,
to update their drivers, as the old behaviour is deprecated. That is
independent of GPIO SYSFS - that just happens to be something that makes the
change visible to userspace.

Rather than making the warning conditional, how about making the fix for the
warning in your driver, so switching to dynamic allocation, conditional on
CONFIG_GPIO_SYSFS not being set?
That would provide a path forward for users that want to dispense with
the warning - as long as they dispense with GPIO SYSFS.

Cheers,
Kent.
