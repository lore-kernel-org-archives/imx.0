Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E5D253322
	for <imx@lists.linux.dev>; Tue, 20 May 2025 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778267; cv=none; b=ACM0FX6nXqPrb/PzrWn+RwYN4lpq+t5dKeZsDPJNC/i0enz/SID2cHMwqH7Ha5lp/54dbheX1aGaGlWZ35nbM8kkOpqk8Gi4B5MDRawfeY1KW4fhksrgxpnY15E9IT8BRIHaS1L2e/d0jCrLwHnVzSS+ZcQOf871eMwPle+OxFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778267; c=relaxed/simple;
	bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIQHvB39Spja3CdxhGK1u66iUBJzl9kPef9WDIUUyq+IgVt07TWNQKRLYyuv6stDaFBuVKIXLQ6nhth00IC1Y6ho13ArUxNSYhMlH2WEsGnDpznlIv7hccUNq4uh/y42o/31t1WRu8j1gu0HPvzUHgh/iajNMNL0dZtJ1JSFKzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6KK0dey; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6KK0dey"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-329119a3a8eso31733141fa.0
        for <imx@lists.linux.dev>; Tue, 20 May 2025 14:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778263; x=1748383063; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=;
        b=U6KK0deyKYJq8z5l57ATVoit3zR1XkXSuKdZVe2VhOIV8KzCeFrxZMBtUDhwQ4oks2
         7Hu2eGUJKehTvGcTGRQIlI+vV0J7PjnXcv7iDzt8dmMMxEY1+fSf+qF/zgNQKiq8xqK5
         fwcp3tX1rCGiE3lFaDCjI4apb/aDQNmUuUmK23OZBOobuysdHutfmawapNetyU/kIstv
         8tNU3ZrilMo0Qo7ftZMAq24fyh3v9957sV5tz49353DDIUnC2poS3WrQ6LWisUCcQwQ7
         o9X5A51N+M48x2kBCz9tOhu9lr4FTDFnICuxmt0+IIMD2vkene+8RRu16qFK3pGQ1zWt
         m5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778263; x=1748383063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHvnk6eJiZC4DTGMLSqijxExjKpOHRj4wKmfj14AumI=;
        b=VibiQCFRsb+BoAPWdRMALGYG+kdeEb8RCQkkLMxNxB1iWJllcrTxKcKJFDKz61KSZ5
         lrmG3nKofHZFsD645trNWPTTFt4yaE2CkCy2xeUyKe/SKvjnUOw2vpJR7BEVbEtYmspG
         dWZ+Xtt4Dxdl5ulclYi71FW+DEeXgkGQMCtUaRTVaHvG/j9to6iw8M2nnzQZfSv2P+Dn
         3axmHMHlnHxJweaSQfKARpQaBHipCmHEdTGt0KBsyj1hIdzyWsEBveANKtB+/dXLj6V/
         vqi8ltfhL3XPxbw10G89yK9mxWzoXT78MG6i2kKjYclsSlg0wDHekbR8ZWT4cVMUXwnw
         QCNg==
X-Forwarded-Encrypted: i=1; AJvYcCUo+IImFWNlczHmMUg6cD8hNOoU0N2H6ZKi9vbtKUm2nMfi8XxO/j40ljAPivRFyw69ZAE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy22ZOzgJCV1n3YVxJ//dl8X+InsQFtH3QEDGYOhNlkpPXSzSZC
	WBkPM64dZs9WCziA0U9im7yw9u+copYcSTM1XTjfoaPrwp0V8xmGnols7nsGAtbhf4GU5Mm3ABk
	8Lc+lFQmQ8Fd2rA3AJOEutEO4/Xcts3DZV1Zag9OReg==
X-Gm-Gg: ASbGncvUnjNW4ox5IWPy9oPhSd69twje/0Fu5YiE+1rYmAPRyCuJ8Tarz7fI5YrlEPw
	JFcSnr3zV11AXyV0e51Fe6LHU5q/vO7Y9sGeB3Pj7GLC4PnkXJ5R2MiA79kkToPaB/+Myi7JnFp
	ROrhn3w4PKbutQ6yDCn6r9HNj8O6QtzYX5
X-Google-Smtp-Source: AGHT+IFzz0NXs8cF08Snmi4Ha7S7U5h0KKvjptJb+slPp5Gi4FWC7Nsw049EmovcMdDEvihhptYlSs6FgkwmCbzFvc0=
X-Received: by 2002:a05:651c:54b:b0:329:1550:1446 with SMTP id
 38308e7fff4ca-329155015ccmr33138651fa.0.1747778263381; Tue, 20 May 2025
 14:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
In-Reply-To: <20250519-gpio-dts-v2-0-b9e77173e9c5@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:57:32 +0200
X-Gm-Features: AX0GCFvwSq-oMiFu75DMDv5s_mCNJqSxwG-LnpvLIXP8m8Y6ivyc6Hrx1bC20zQ
Message-ID: <CACRpkdb4OeD_yaUsGJ9Ugz3LZTCMdz1hbH-cX__ixEPr3Snd_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add 'ngpios' and 'gpio-reserved-ranges' for
 vf610-gpio driver
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 8:01=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:

> Not all GPIO ports have 32 pads, so add 'ngpios' property to specify
> the number. This can save some memory when alloc bitmap for GPIO,
> besides GPIO tools like gpioinfo will show the correct information.
>
> Some GPIO ports even more special, e.g. GPIO7 on imx94, it only support
> IO0~IO9 and IO16~IO27, so add 'gpio-reserved-ranges' property.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
