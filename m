Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A6125F780
	for <imx@lists.linux.dev>; Tue, 20 May 2025 21:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747778025; cv=none; b=CxjNkVtFuS4wAmXLWVwlP/AmfIfXP0X6AATRQo0qsN4sI7ANkBWY7FBqwBlec0Aqn5dYpieDtXxPAqD2K6pMIuYE0OiKUtBLje9ke3Y8CXqvhozgZ0IIR6CGWo1bp0/TkTSujM9rPkjx/wJUUCuQs2bZJBlE4m+K4PV0RF561Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747778025; c=relaxed/simple;
	bh=BuzhlNqyJc6n1p51Wy6w2ws8ML+CaNuBHjlDaIn4jws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEYNGlc5gWxuLyewYh9PRWkO6YPz4yrKdPXAwVmX5BkeJ9UKkCDYVLwOUNM+/lHCjRuKXhh0K/pm0l0r6wjaEvIBvNwTkkJY7dcJEFMpSzA1j4p4NNf20g24t9iQNRqzPJgPnavtEh7QdW4m9Ug8CJEJzQ25F+eCZfGOijSe46U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hU0RqNnh; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hU0RqNnh"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54d6f93316dso7182430e87.2
        for <imx@lists.linux.dev>; Tue, 20 May 2025 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778022; x=1748382822; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuzhlNqyJc6n1p51Wy6w2ws8ML+CaNuBHjlDaIn4jws=;
        b=hU0RqNnhmVs6fcSGbFZ0kWlN1o7ziMNWXcMFwwymOrgevaymUemnFXyoySltohTrpz
         pH1WP3Zh5J3W1Y5aQUBwLAHdRbR3ySMLJ6t/felv8TH10tPfqVociGPXRsl3lm9HPDKy
         NHBdOJmxcOhpFkIv5Tty8wHWdEUoGyn8vKbwigAcigs51aGU+ItRzKcItaPSd7OHk6uU
         3j5GThTFgm64qg/4yNImR+O8MTM4Q/puuoiSN+ZTq0wNvkaNA1b/YdljPOwW+YeC24ul
         SmnmDboAmqbFDO3DVCNQ9vkrp7L68RZlhe3qcikETm2DCgZMYdF3IgnN/CjxpOZ8C2Kl
         BGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778022; x=1748382822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuzhlNqyJc6n1p51Wy6w2ws8ML+CaNuBHjlDaIn4jws=;
        b=wknkYSUiyJQs7iw5w8USnaHkKaF8VdIK+D6uub0M74ibX/Z7kZr/lTwXwni9y6jWNZ
         PS7LoWrGkZu4EKEMyR5MikWqU7DfX6svLJxJUkKKU1kgwrqOk34920mNqpF3wIvprbHe
         KhCQtFBZB1mRZCK9XjQwQwVFYVX8d2nj9Ddy2s3pjHQcAFjY7hqa6mtKg0YcoDk0tG/E
         adR4F+ZmF/kD5oxQ4r+V+PIgOGStcqn9219m9ldOSXaiBO3QMPwqGIgrKKh8r8jALhv2
         Q+8ptBAvlle09SVGfd0ceXFTEKhq2I3NEMq8CgAGy8lHzljOoo2oev0luEFU1XfzCTRG
         a6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoEWFtVprLEvVbgudXKRv5qiVKpNwb9zyW6kSvvISIY+gLNfOFQjVlQydR6IllfDS1SLg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdTG7B8hhaNg9zjfb9KVHPESPlYd79RXWyeNZYYuS/JfLTAk1l
	alE0S/pREfh7UroRNYztwib59/kZHa4bEf+Ym4hlMTdGIgg1cRoJhTOwcifTVCvfQjc8jf0HKiX
	nq1GPaY2nN5EFnYS0ffFZ5eAyQHKAQnLAhiu4VUdI8Q==
X-Gm-Gg: ASbGnctUwBPSjEu/XwEJSj2/ivMnS9x6ZKEQdHiGPOofbjHEkviBLWqDqky6gy10pY4
	VBCjg3sXxFgGV/WuSyG/RqGLptTILC/LsOpam49J+4cNkeCJLpSKn4v98bdy2Dmo46q443vVVx0
	b4qngtypiIoy6z+zQBhPuqucojcRUqlj1/
X-Google-Smtp-Source: AGHT+IFDmcGo1axArvFCz2dx6uFyFqkML6kJ22pcoHKMMAfAxgp0/2ysMJ6m5JO5I5AyQlwSQbgeg4ij02FeQU7FSkQ=
X-Received: by 2002:a05:6512:6317:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-550e71b4e43mr5955773e87.16.1747778021614; Tue, 20 May 2025
 14:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com>
In-Reply-To: <20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:53:30 +0200
X-Gm-Features: AX0GCFsoSIZvC7lGTFU51O8wPs6RsCUHG2kDfSqZhe8h4hkLrUFi0bw--0irOtg
Message-ID: <CACRpkdZRdFLyGJrgAf32V8snnYW1gPvbtxSPQaSBFSMkt+y08w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: add ngpios for vf610 compatible gpio controllers
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Haibo,

On Fri, May 16, 2025 at 12:57=E2=80=AFPM Haibo Chen <haibo.chen@nxp.com> wr=
ote:

> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"), vf610
> gpio driver no more use the static number 32 for gc->ngpio, user has a
> chance to config it through device tree for each port.
>
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
>
> Besides, some gpio controllers have hole in the gpio ranges, so use
> 'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
> correct result.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

the patch looks (very) good, but it seems the .yaml DT bindings need
to be updated with ngpios as well.

Yours,
Linus Walleij
