Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ED813B5B9
	for <imx@lists.linux.dev>; Mon, 27 May 2024 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716807959; cv=none; b=lOw39Huiiw6IDPn57JCjWHjlvtOQ6RJ43pvMuemzKQiOc1nUhLRpUUMIGqP1pYoCJqALhs6Pau/3C+aeFw4y1ZnDLw7oNB1McnGcrUFtmkWmqODyQok2gNC/XJ2rCYTtg0F/cioJuzj7CMe2jlj3DTzg9GlIwBU7V8Odt4jlGls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716807959; c=relaxed/simple;
	bh=AGOTuEx3RxbJzSknO6FX7GZtQcyn/9D9jvyJ2MsACYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrHd8tZTvyGGmSKn8RVk88AWOP/sQS29hJsvIfOHgYYFjTSo2IDLKYD+fLwqbaHkk/XbUpymjMzvHyYiED02pi7eEzNmk8LihzUbBesa9pRnxYfUdX5jAGpk/4+x4n4R+FiLJmP2EiSjL/jdPzx2T15D/GUNksEXhEk2QaVrd04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j10luvSo; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j10luvSo"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-df771fa2b8bso3016806276.2
        for <imx@lists.linux.dev>; Mon, 27 May 2024 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716807957; x=1717412757; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGOTuEx3RxbJzSknO6FX7GZtQcyn/9D9jvyJ2MsACYA=;
        b=j10luvSohe/hQEnKTsn+UxmyT32Tug82moHa+9PgFtzMlDDLA3JWzaPDiSm8lh9hOH
         3tomPhvNX//p5oR106wUwlu1KsESystllXk82sNQLhKd4NthT7lITR3FkRCL8yFKdGEe
         YeIQqTvSUj2dG373rk2db9iuARTkTM8xSNSuTfxmvfSj39fe4+8gCgyddS/GiAz1sBGT
         4s61W77rStObdhzcm828OHvKE0kWAzBPv44Ney/glyI9Sn1lQ1b88l1WlN9gG3E9BQpB
         ivWgiWD7naeAccmali4dZ91tf0zTD0TRjaeTkPEnFQ4SdXYlBYWSNjcjEWYbdkD4jdIm
         b4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716807957; x=1717412757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGOTuEx3RxbJzSknO6FX7GZtQcyn/9D9jvyJ2MsACYA=;
        b=LB7njmtfGSarYwOnEjbcZBblefQMpkeej5pVCV6sxHi6XXUbbnsUOBrjEID5oJixEQ
         NF5dwqIr2G3GjRxTwZM271eVMWD/rgPrCu/lObmPJPn/eEOv9T/TAam3yZn/usT1JNTY
         EJT3xSAmAmrWHaezZ69oVp7cs2R16voz9qyvl7GkevYyZCDzd04ppSK/GIj5HusQ8GHy
         H8OdOhzVsFj39QQayfHemJktH9z8kG80FaeHBnEwXU+7Uqft/lmBwEgOWpiDFa/yj21k
         LPoRk5k27dKu1SH5sclX/aTGMfD67Q93u+qXj+elu5haXFyOI1I/OXlXDXC1gfUHUDNI
         DzSA==
X-Forwarded-Encrypted: i=1; AJvYcCWtJuT8OP00Enjp8Dnle/hpIQ14oIcRN+oaQBgkjneqEduSp+zlfCKuHTSAoGdDX4ycM9FYVq6peB1U76q8olSumhVS
X-Gm-Message-State: AOJu0YxpqWwO3LtwXG4hJ22zcJ6+EWm1FxI8dyaJx90ObsBn8FDx7HSd
	ammiIOGyvjF28R6oVjqEUkwn4CgoEfTserhYImV1j09bbhogvrLPSf6q1iw2ccT1aVwGg1pJGxp
	8f164Ztn6q54etBrTdE3Bf7a1sHf0vfp7vuzpFw==
X-Google-Smtp-Source: AGHT+IE+x2RNUDIXzBVJyvvEPGXIeKYYisMGL9Wmwd7yQrZe3Q62nlZKoeWKiejefMIQx/H55NGFKTgn7UsM+pYsbXo=
X-Received: by 2002:a25:ced3:0:b0:df4:d5f4:3ef2 with SMTP id
 3f1490d57ef6-df77218adb9mr8965780276.20.1716807956744; Mon, 27 May 2024
 04:05:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
In-Reply-To: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 13:05:45 +0200
Message-ID: <CACRpkdYbOTXmap-vJy4JNZSaZnE=yzC35EPD2F=bD8gWdD8-GQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ARM: imx: only enable pinctrl as needed
To: Esben Haabendal <esben@geanix.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 12:24=E2=80=AFPM Esben Haabendal <esben@geanix.com> =
wrote:

> As not all mach-imx platforms has support for run-time changes of pin
> configurations (such as LS1021A), a more selective approach to enabling
> pinctrl infrastructure makes sense, so that an e.g. an LS1021A only kerne=
l
> could be built without pinctrl support.
>
> This is a very late follow up v1 3 years ago [1]. The situation seems to =
be
> unchanged since then, and I have tried to incorporate the requested
> changes.

What is the verdict from the i.MX pin control maintainers on this?

I can merge this into the pin control tree for v6.11 but it'd be nice
to get an ACK from the maintainers first.

Yours,
Linus Walleij
