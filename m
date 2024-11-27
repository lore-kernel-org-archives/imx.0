Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E961FA27E
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732712728; cv=none; b=kd7Ii7a9kzTta+ZgZUCfst40Ww+fINYB8ZhLL035yig/i8+U4LemLoR3nvJjPPF5SwMPIw7fqpZV5b/a0aKw9SA4Txz1fF6cvs2xM5+BIsGkPB255XfShXRS0k63fk8+pV/eCqMYXJOcLHZoAJ1ZexgoeH1vZ14sJ3Lkqv9kEAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732712728; c=relaxed/simple;
	bh=JWguV4ToF2QcRnKcxBJIEOIGkDScq8Qbzo8ZD4VshFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcxWm5NJSbCaCleEDVB8waLP/vAbXsUTwVmX3LLW8M9xx2Hqz9WiexQbvQWPrmH1s4B8heiZxd0PVifjW9lfONYFzMTW5Q3SJU8ZsCMCTB2w08K2HvgAPvPyrF4oG7Y0aoOB8MHliJ5xju28ZPTPUvhBCC5XsqRBLaBYzjWsBEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tENpty6g; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tENpty6g"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53de92be287so3586212e87.1
        for <imx@lists.linux.dev>; Wed, 27 Nov 2024 05:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732712725; x=1733317525; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWguV4ToF2QcRnKcxBJIEOIGkDScq8Qbzo8ZD4VshFU=;
        b=tENpty6gq5Yme9dumRwjhc4Pyr2TkfovlIJ98wGELk17lKjUhb7aRL8LvOPJGUeagt
         CaEIGZi6MnYoVGRYAMoQc2ZxdUQNjDJx1BUS1jm4f/axQSnqSQ6AxUZ28yTtsHIORCY0
         1uzP4t1wS5tyUJOup4rFYyyixvzxoEv6WbdDVz6dk3xpWnNza6R0MnufN58BP3ayLFvz
         NI7LWnAUh6adEupdxWDQgQt1TOPZiHJ2QoWgRrG8fE6zoyWeDxLndvrN7szBnVZkDnsj
         8fYlrY3rKkUHKvEbj295E6IlLtGIJSF1CagMPHCEBnEgIGEP83ggRgV8W6HO7tzubPHE
         R86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732712725; x=1733317525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWguV4ToF2QcRnKcxBJIEOIGkDScq8Qbzo8ZD4VshFU=;
        b=kFlC2QPA/Ui/0Q9MW/JjkAJ7/T5tCciR9R6RpPi6nZo2N4XDsU2h9rRlLsMwZz6jXs
         uOUZtLciAYCjdX3fXbgXVPadfXaGETv4fTIotiHGtOS7Kk7ZSieTr92ksvhx/D1ebHXw
         Pdmkd2Gl8DM9xm0MebvzhAlV1MiUOOKItd6kXHWEUcAOPuJL5xfI+bAFGLyvmnfzb/Qz
         QauT/0dnaOM7nrotKg97rHXDdu7JbNvpopIlj7YyngJfYpitLuEwX4qCOnLhVnfC/X20
         zLM4ywxfTx32gqIcDvnCjXpn4bWJ2m9c2/zoOFyHWu8Q64Lu9MDflNQ0cd9D/EF7Hl1a
         +pvA==
X-Forwarded-Encrypted: i=1; AJvYcCW+RM0zVyIaSY94AmjvD3uew51M/FzVB5rmT17sCF6EuYhFW4OeQraaaeha00XCpsvJiWw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqMn3BAdzVrSSo1Thtqo4gMSf1KouWuOvZ02Iu51HtJvTpVGUN
	TdYiU1QrPePKH+Kxak4MGVNLhAKPB9im2MFE2bqELKuBxPmBs0CGMCFTTKb62f07JhFUS+WaFRl
	npKPZ8r2Lp7jnUMZJm8GEtzrzqkSDXd++uWaGLg==
X-Gm-Gg: ASbGncuVsN4CBTU8Cxe33zA4lUIba/E81ZkzcW6i3XonQbSopWMvQhkOfVhnYSYoqZt
	xNywJtFrWJ5uyumUEcghD/CegZPC0tB9/259SS0rj/wf1cUjlVvsrQXI/SMH9sa8=
X-Google-Smtp-Source: AGHT+IEW70dmWc+Zu4iFDqoZyqt5wTasE9+nG9+piD8DreA9MLGeCWLPA46y+3oz3Ex0A0CWovi4P37z6xX0qSUicKo=
X-Received: by 2002:a05:6512:3988:b0:53d:c162:e0c3 with SMTP id
 2adb3069b0e04-53df00a9864mr2557883e87.4.1732712723628; Wed, 27 Nov 2024
 05:05:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127071450.3082761-1-haibo.chen@nxp.com>
In-Reply-To: <20241127071450.3082761-1-haibo.chen@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Nov 2024 14:05:12 +0100
Message-ID: <CAMRc=McQ8J_x40YEUQSN7prGovHoTqvoePq-HznUdpjYqO_cCw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-pca953x: do not enable regmap cache when there
 is no regulator
To: haibo.chen@nxp.com
Cc: linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	marek.vasut@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 8:15=E2=80=AFAM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> Regmap cache mechanism is enabled in default. Thus, IO expander wouldn't
> handle GPIO set really before resuming back.
>
> But there are cases need to toggle gpio in NO_IRQ stage.
> e.g. To align with PCIe specification, PERST# signal connected on the IO
> expander must be toggled during PCIe RC's NO_IRQ_RESUME.
>
> Do not enable the regmap cache when IO expander doesn't have the regulato=
r
> during system PM. That means the power of IO expander would be kept on,
> and the GPIOs of the IO expander can be toggled really during system PM.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

The commit title should be: "gpio: pca953x: ..."

This description makes it sound like a fix, can you add a Fixes: tag?

Bart
