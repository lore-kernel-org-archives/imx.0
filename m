Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECB322DC24
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848020; cv=none; b=CY1DPEJnqr2pt1Myr9YHVzXlc/bNqo3iyvqGGbMpWO5rECem5noYGI7NZtEuc1QwQSpJygXVJT3QLU2zaNNuQnUiLci3bY3DwihLTu/1Bvad7LFO8PYJcGJvliLPPwtjljF49Ao7Fl4kDX8bEFfqjZxaYDD576e43XO1xCRKUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848020; c=relaxed/simple;
	bh=E+VrihHoR/h4+AypzLacJOvZczQ9U9IhBYbAbtlvTqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Va6/N1SYDR2kEYp4d0GEzmVI7swvf7+thnHhK6+z6MvMneAPfYhMyIW6/ofdlgOvOblRd2bYh5HbszVNCzbpP7Dkp4fURTAQMLzHOMufPz7UMdvKfpOD3hbWKde6UJfK2yD/ZC4cTgKdM2gJebLRcRpSzm0wrF5uxaGnOaymZUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYBqn+JL; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYBqn+JL"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so922491666b.2
        for <imx@lists.linux.dev>; Tue, 14 Jan 2025 01:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736848017; x=1737452817; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+VrihHoR/h4+AypzLacJOvZczQ9U9IhBYbAbtlvTqA=;
        b=cYBqn+JLvRbX0bO8Ne2ZhvU5igheKNIDDBylg6fIUQmL0ybONZOVlS1th6lJ4hgNIS
         NnWO07Z11grPsNIvGYmpNW/+GDzSAR+9D2JAGjUb0PPAn4yzB/e5Fyc6+Ov6QEv0zAyp
         wPs9iXcS1mDXYNDbaeBQirOPUylZLhZYZ4OhTKEypvCUlYeeog6cGqo8dKtt7zmeqaRa
         kgdiSsU0UQlx/Hc/1oDcMH1H0CfJqua1TeUI+jIJIVVSAXWVnHDzaRW1hP1/dAUhw25b
         SKT1odLfm0zJeaQC56Hk6N37okIMXipQx3xFM1DjF99mwn6iPv+hpOG3lewqprndv1WK
         QTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848017; x=1737452817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+VrihHoR/h4+AypzLacJOvZczQ9U9IhBYbAbtlvTqA=;
        b=WcfLacUbTV1ERzE3Rl/mE/BV3ppJrm90w3huVEUlgWvWQA/Gcqna1kytVEXKv2m8s6
         hC8RW3EwicGTwKTfHo6z9/3THBVsyU9v3av9ZZABRNNwQrIjcLl3xClb8HjaHjMDYjqv
         sVUk0DWux7GxSrKURmqrmZqOpcTp2hYkm4fFconSAFTSaLE37jKKx/eeCDD+Y5v3yj6P
         REywWDWKTPdhflZ5Zd3VMD9eFWZw+xQ3UMUXEv3tPiimM+YUjDqkN6t/plUQdDpM/WVq
         pCTdLlJ8D5RgZZEX8SVkygHrgq3QbR1/xd6GhrjeUZeZctz+CLOEf/AEE3NVyobS1PHq
         GRUA==
X-Forwarded-Encrypted: i=1; AJvYcCVqEYb60fr3wHZP0PD2XMCOI+ef9tDi7I4t71FmzT5YCOR/rfSS0qwn2IR2f59K5S7r+QI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+PHk3h9p2XpKilXgs3CnQbqz2LE//4YocIIjhkU1wxK7IsTS/
	VhL2jYH/3gv7HY7PppMG6Lve41/HQtzag9tFCXNUnDvUf+urwMxINVK4GL4U0mU+LruQsIAEgkm
	96cYedxrrxT8b7xMPKs5M35SGAUY=
X-Gm-Gg: ASbGncsSCaTd93MTi/NdZAeqfV49MzWQc7VR2Dwn6STwCxlRZeTejvCJ5uDJ89PMMTv
	Yd9bDjIm39e6eDfVhYsn72I13MUL6At2VCR1NOQ==
X-Google-Smtp-Source: AGHT+IFB5/NOc1qfgm0NgEd7l8XNYPb3tMAQ0jaKenktvVwfRG8D82BYAhUkdvtS+fobYNTzvwEa9ghZFQ38VtjGxFE=
X-Received: by 2002:a17:907:97d6:b0:aa6:6c6b:15fd with SMTP id
 a640c23a62f3a-ab2ab6b52b8mr2244703066b.20.1736848017120; Tue, 14 Jan 2025
 01:46:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 11:46:21 +0200
X-Gm-Features: AbW1kvYvnNBxyhX_hjX1s4aWMd-PZURmFnQFTxH_PiHAl6Q2MCYnAuJKZPMjNzw
Message-ID: <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
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

On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> for more than 12 years.
>
> Reverting this to dynamically numbered will break existing setups in the
> worst manner possible: The build will succeed, the kernel will not print
> warnings, but users will find their devices essentially toggling GPIOs
> at random with the potential of permanent damage. We thus want to keep
> the numbering as-is until the SysFS API is removed and script fail
> instead of toggling GPIOs dependent on probe order.

While I understand the issue this tends to get never fixed until the
entire support of iMX boards will be dropped. Personally I do not like
this series at all. Rather let's try to go the hard way and understand
what's going on to fix the current issues.

--=20
With Best Regards,
Andy Shevchenko
