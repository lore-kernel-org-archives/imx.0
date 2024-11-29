Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1A8AD23
	for <imx@lists.linux.dev>; Fri, 29 Nov 2024 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732875339; cv=none; b=WUb9UTS8MI+33w1YRj/7mCHNeeamrjZQ9S3mOCf1uY25P3tr11Tg44ZEDJbjS1O8tnUNyvCjwOTmq6PdaIfSyBOkrvm0WG7GCGOFU6/X5gx0N58mcDpqAzaNdjGhAXnTI1xCkDUDtBZh0NJBYqf8OpahI7xfqivlii+c+1Xt+a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732875339; c=relaxed/simple;
	bh=qQPy6i3/EG7SgAsDgJ7tcQgjkT4hHUsubysFlz1hhtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IrA6hIuqQZq1wB9DaNi5vuTXSxH+SsPEeDYnETFe7JmISN97VXBGSPugatlsWhdiOv5HtB+ecysc31LC/KvIrmpK+bipNReO0/rfED2x4U92k44zOX2Vp7hRllwj795Wcz7TvAMSaQ6rfRmm3kGxMl/vBzuKaaaxhE0+z7iXhJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZR+kEwO; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZR+kEwO"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de92be287so2662471e87.1
        for <imx@lists.linux.dev>; Fri, 29 Nov 2024 02:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732875336; x=1733480136; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQPy6i3/EG7SgAsDgJ7tcQgjkT4hHUsubysFlz1hhtw=;
        b=pZR+kEwOAjek/Gj9P8MPm5FIHt7+N8mZkeihqu0ShG2Vhvmv+gJ/SbZ3LgDOK8u5L5
         upYwL4ZET30KoWwflfHyWQRCyYrT0NERR2GFFLl9Xz7JgOcTEuID/zOpsf/KOnrhTbO6
         5XlqM6WBDJnqNIzQPsqr6wZ/v5+Ecs8XVAvNt7pGSyV0u9if5xh9z1R5ABmCbw23+4jG
         vNHTAjrU3DvUadUSeonP20EzWSGF6keutGJ9pXDzVYxGT46J6FTgYX3Mj67e8ovbhgpL
         UOwtyGzPZPZ9J/WYiuzkXpbpCYeQVXveSZWTG9uxyrIxen8TBkEPzzL973Tk7Pz2enrO
         dlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732875336; x=1733480136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQPy6i3/EG7SgAsDgJ7tcQgjkT4hHUsubysFlz1hhtw=;
        b=TtseM1s4U3ZLH6XSQX+KiW6v5EwKMpK9Fa6qKYK2agDnvf4DbwdQQQFIErPJATLsWO
         msoO8l7/7S9779ddO9KRC/C0V8d8rwAvUbZ+1tVbSWCexJwCXnQDH+t/63YLg30c02fx
         hBXK+OJeKH/gZaDaYLVDNuJ8nG5LtSP/alZwyw4vRkgkxouAGUbTpAtDLH5hg1txzORX
         LFAXa2FSdJTWuLFLLV40q0VcloYXX1/5Tn03cZ9jnlz0ARpTaZhSDlzjVmblQV5pOUmq
         2d4eqHXkGOS4ih96gcVP5NNzK7QqHpoMbxQKdyhr4/cViGrBgZ6WqDI/ZQE3/9kWg67x
         xQdA==
X-Forwarded-Encrypted: i=1; AJvYcCUdFLhHOvGe/EuHhYPaMW1dtuGVzg3xCoG7Xm8tmdGKO+HcmbT+XBwb6mhCX2/IbALpyyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9+X2CL7ybzWiuiNg2ZTgRzSN1Em1Mp7su/7/M4IOYxQ5St+m3
	8dwFJAMZKsQnAVV/HyLzIoFfZ31k9ehPQav29NgB4U1Z4ZA4n2HElLne/rp5ytfoVNdKnMdt22A
	x4hbsTMOuU9r7OVQ6vbsrb/nQ/hFzaUit/3juTw==
X-Gm-Gg: ASbGnctFuzaCMgLa1WNNW+0yoyIk/4PSkU2wrb5jGkjjMKgKEdROSHIIjeXukSoQywU
	+j8TkKiLl7H7j1Il6IPUpeloM4zI8M0g=
X-Google-Smtp-Source: AGHT+IFwxzHGLoQ35MKeSNR2cgIfiurNhDiRo3KErOd32grmbH0flzyugkwmEZz4WwTuMZ23JOnl8sVitNb7SKahsFU=
X-Received: by 2002:ac2:4e08:0:b0:53d:e077:decd with SMTP id
 2adb3069b0e04-53df010b258mr9365909e87.46.1732875335602; Fri, 29 Nov 2024
 02:15:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127190605.1367157-1-festevam@gmail.com>
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Nov 2024 11:15:24 +0100
Message-ID: <CACRpkdbJgrwzh_D5=71dMPOx3jgbyUJOiP-+16JUdL79zDEbTA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux@armlinux.org.uk, s.hauer@pengutronix.de, 
	esben@geanix.com, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux@roeck-us.net, arnd@arndb.de, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 8:06=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
>
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.

Fabio are you pushing this in through the SoC tree as it's ARM-only
or am I expected to push it through pin control?

I expected SoC but asking because I don't want it to end up in limbo.

Yours,
Linus Walleij
