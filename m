Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F285A15E5DC
	for <imx@lists.linux.dev>; Fri, 29 Nov 2024 22:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732920843; cv=none; b=K8bUcftSUG4JddNnQH7ypOVxjiYloCGAZqUPC41A6CGSuAw2/E0se3aksFfyPRXqclmNYI45oVSe0cnkGNEfIzjYMeE0BbxEO4e4P84L4eIwqS2Qgoh8s2cPSSxSfz77qRIkKXl1sB8p+4sQQTu/oc9Q7uK8G/HFNviuTTkNI3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732920843; c=relaxed/simple;
	bh=WKyfqIey8BdSBpHRzlBKwl2jvnn1XIYjneHFkheyqzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2aKq36KEATqf6mJFH1F3mFPHCKxdpNoeJlL4hZFF0C6V53t52qTTt/9LAXVtSs1gaZtn5bHE8U0Wuq5mYrR+H7eoZwkcP2x/wB7TOfDrLq8k5iGuQaDGnh4cAXmXvDJ6fUL7YqR3ESs2zJTZcpGRIOs10E7VplSzwOWVjDwuEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pHoyYY5U; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHoyYY5U"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53dd668c5easo2446655e87.1
        for <imx@lists.linux.dev>; Fri, 29 Nov 2024 14:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732920839; x=1733525639; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKyfqIey8BdSBpHRzlBKwl2jvnn1XIYjneHFkheyqzM=;
        b=pHoyYY5UPr692oYOASazTf/GCldPvKwshD3JqAEuPEBiYbzd0ttkBpUuPhoyRBLDMa
         5WffC30GKulQToJOuSPzBH+kmb4/IJmIVKvZ8+QAj9XHpN+9eYwR5NV1dkAM7lW6LeUe
         v286WYbWFhqkj66ZOSAl0bQ024UWyBkc+qo2X7E/x/9V+otgzIzoMIGQP38GRlJ1GOB3
         Ro2c+B2TVwgGAfjhKz/tipjlAwCBRiNqT5a6X4GeswCCw27zXQPOlBWIoV1B6czbh7Hw
         f3mMzIo0twZAqL8kbjPscqi7cbC0zyFKAe5v0jS8HkBS6UxUDwMtzGywReoXNJtrVuRQ
         9+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732920839; x=1733525639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKyfqIey8BdSBpHRzlBKwl2jvnn1XIYjneHFkheyqzM=;
        b=Ta10Vj088CjZHr1GjnABlmAT7r1izvtXPoqjOHSUlbqbzuU1N2m0x6h+kDzuxOaBZO
         jWsaIl8/wpy6dtfhCWZrjU3E/pvYkXQUUdGHn6v5nFhX1TocHLhXvAECFrR4iK3yulJu
         wy/rPEO93HD2AWgq7EHrpVHyyaqYUpJJftYF6YRFLCpjJM0Rx8tlI/nPeLKAKQ8kSXgS
         9I2h1CVfa0tbg8MXY4DyAlLfpdXFejPcUpNyIV/dAMjtxs5PhjMFwA0SZuhPXQTjVqm6
         NkheS1JTmaSFCf5tUSI9KBaxTvhQGPoUg9pza9PWgBCR7GPv7Gg4mcVM2wDGmN1rA0VJ
         KCjg==
X-Forwarded-Encrypted: i=1; AJvYcCXVQy4kvBN732FPhVMFlcMEOuZNY6NR1JFTKXtDJ6Mv5PXQDGjXUuk2KHfkq2m1ECNU7AI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3ZwXchmY12keCQEy0Y/BOk3HvD8T6OdcJnP0JaJgHx9cNxFUB
	WSITGuyNoCS/xzGDcaLqznlZYKpQei8bFXpspVCGLhSWpz9fDLXeDlPseiFeWFltD6yrwWwm3en
	sRDREaCJad69Dx1ICT8NrSJIRuMoTgvitG0dRXQ==
X-Gm-Gg: ASbGnct+awMLEDoAWlljC0mpGltQ+WktcWTQAhYqtW73qbKIygrei4P7QpaMvPPKQJg
	e+DjoM3BU1Z59NcMuGsi3rSv/ozKkLA==
X-Google-Smtp-Source: AGHT+IGcVRupOMbTvZ7t+jprssuIrvHdEDt/2Twz85iMQXHN5G0PwHo8oCHXUut9lX73sLXrsQN4D4noECo1WJcQuBQ=
X-Received: by 2002:ac2:5687:0:b0:53d:ed29:43ac with SMTP id
 2adb3069b0e04-53df5080beamr3485099e87.28.1732920838933; Fri, 29 Nov 2024
 14:53:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127190605.1367157-1-festevam@gmail.com>
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Nov 2024 23:53:47 +0100
Message-ID: <CACRpkdYAeM+=P0ymMUQhn3urV9HMWK7+4FkNDZevfvz_AbSF+Q@mail.gmail.com>
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
>
> Fix it by selecting CONFIG_PINCTRL as before.
>
> This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
> pinctrl"), but it is the less invasive fix for the boot regressions.
>
> The attempt to build Layerscape without pinctrl can still be explored
> later as suggested by Arnd:
>
> "Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards."
>
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-=
8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Patch applied for fixes!

Yours,
Linus Walleij
