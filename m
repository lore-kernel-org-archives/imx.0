Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88356253F13
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794703; cv=none; b=cVrv+pMfK5ncjhYy8dCX8CyCEh8jLqDNeZl2/RmbXJghdzi8aNVaxwxFnbg80HGl8+Gsr/GjDIvuG1+SDhm8g3/SyWoV7aEnCe3g8fgcXSSCdyn99t4yqclcL3xP8nXcLDqJ54LnrdJJX2e0BvPppS7NXZMTBY4tZzxWRT3aWnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794703; c=relaxed/simple;
	bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEL4qEkxrKwVl4rjf3Njjp8lx3nlZVK2ARTH9168o9bADF78kq/qaGA78fG8p+pcjCL7ldTp9iw+9LLLHQZFOunjRuOPDY7LBlKakVt40oHEBerakbgqW3FR8RBRO/w318hmDTEY/a463iXJeVdKjj5j6XBaNcAJbNry51V7Ir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vHm3x4U4; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vHm3x4U4"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b6a349ccso5718979e87.0
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794700; x=1751399500; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=;
        b=vHm3x4U4trTZIjeUfZYnmkM6lH02w87++ahMHhnEt7Dam9cPWui8RSa8iFlA3v0pmz
         z4/OcoRBWhmHe8kndZmQksjj25hEgvVXg44WJrx/kAaBSbhvsQR9RvxQmWyvJulliR+k
         8IIRIgjCVv1Gj2tJziUtuz2+JmkartD9/bp0Gp1VS24kMJi9g62dMliVbD/GF6JiCSVA
         8kteaOfdzl2qcW2K5nN1ZjMwTeLTWTKYeXFVHCzOQ0lG2At5Lx1iAogQrN/JuIuXWgAE
         5+9eAoVzpE8TA4Fqa08O2lbmaPWYbXE1qZpIBdp32eBYLtw6e3A/pNB/JsMzMnasIYan
         fG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794700; x=1751399500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/ULaHUETU6DovdIQRhQ/RyujC0Dkl9fSx3NjtmEe7Q=;
        b=bTru0xkbw2AimjpUdfEVGUQyJ0X9Cx5V8f3hHSK1XROCJCOweRmwxamVHnWpe944kI
         ORYJtmMnit+GNyw0u5OhFqaifJU0WUcpz2MfamBgu99+6juFYvpKTb7h4+t6m+uryBUp
         n5Fz23zDdKZWOEv/TGQWpo7rTPuMbYrPYwTcI89w5RFfXrYQ55YQzPa/LGnS6rvvqUp9
         dciuT5MfbT/3r/YLW190Oj0K1yG0efu9UnWviS6YMVSe5OqLRtHwMPUxEyLC2k/qa/oW
         yHu1k5au1Q0M56kI4b6VoOGD+3naidmPyaphefUhcB4AJbptYARhdjJ250PpvaGC81dA
         gdCA==
X-Forwarded-Encrypted: i=1; AJvYcCVTEucyvxvFiaxhMeukCX5C9uYPJ3+9SDL93xeLrscCU+2ECGmqDXY8Lz5s/fC3p8y0HBg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWaOUVPvg3RQizpotCW/MO5IygLgAGgO6CJG+tbFQluILhmZtb
	TNM6e7wBtZGpnkxAJeX8SnLn1tcUA/RjMvvLop3voBdcUoPmMJAZJHZmsYTvCokrhCIsQxvMufJ
	Fh5D+QIwXi4z8xkysFFNwxxT7Mbm1Il/YkYTQdnGR3w==
X-Gm-Gg: ASbGncuKQ+KTclNnHRsC1lyn8C0PaZSLEKvlHZKQK6XSB0wQdeM+/ofzTd3SouMlxAF
	3YAcRTcHjY3dvexjfxXNZPeYeiUcOpyYkqCs5a/1p+MNNbe8nDrZNjacoq2oRLR15gDAaCE0gIG
	J6nnd502g4fivr25SNKD/49rWahO+btjHHjonB6LwpO4Y=
X-Google-Smtp-Source: AGHT+IE7ZhidhDycmbWSPBv1SXukyv4UOsTnptIV0NVFDdvfjdJisylDEZywOQMLRXTZuVgtEJHSpJFFFA3MmjtlJ4s=
X-Received: by 2002:a05:6512:3b9d:b0:553:358e:72a8 with SMTP id
 2adb3069b0e04-554fdd5d263mr47305e87.38.1750794699262; Tue, 24 Jun 2025
 12:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:51:27 +0200
X-Gm-Features: AX0GCFuix9QqcfdydgWIF-t3O-vbnn63nX5F5wQyNw4KZuxuAr9t5L-dWlGRbto
Message-ID: <CACRpkdYdZQ4rKXPbiUve4n-p6q+HG4QS_oFkY1JDkJeqP4mZwg@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpio: move generic GPIO chip fields out of the
 top-level gpio_chip struct
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:27=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> The conversion of GPIO drivers to using the new line value setters is
> moving nicely along and we're on track to have all the existing
> providers converted upstream after the next merge window. There's
> another piece of technical debt that bothers me - the fact that struct
> gpio_chip contains a bunch of fields that are only relevant to the
> generic GPIO chip implementation from gpio-mmio.c.
>
> Let's work towards moving them out of struct gpio_chip and into their
> own struct gpio_generic_chip. Doing this in a single series would
> require some ~40 commits which is way too many to review at a time.
> There are also users of gpio-mmio under drivers/pinctrl/ and
> drivers/mfd/ which would require cross-subsystem merges. I think it's
> better to do this in stages over 3 release cycles. This series adds a
> new API for gpio-mmio users, hiding the implementation details and
> converts the first set of GPIO drivers. Once upstream, we'll convert all
> remaining users and once that's done, we'll move all the
> gpio-mmio-specific fields to the new structure, convert the internals to
> using them and remove bgpio_init(). The last step will be done in a
> backward-compatible way, not affecting the users.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm in. And I know you will push through with it as well.
Patch 1/8 looks like a dream, approved.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
