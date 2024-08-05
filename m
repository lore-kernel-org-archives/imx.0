Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06614148312
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 07:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844138; cv=none; b=uAD2ooDgCTOndhExUNZY9hPAa2yZ74OeNOA0uCjgjmHfMPN6vu4A4KNoFuie+meCo8JmjXVm4ItWhZ7EtkmC5fgIImxo51z5HgeIMP62UxBNhLceR8LIwYsBYyaDsXdbx1UTi6GjoT5MK2qWKAy6MLftQjaCDjxo8it42aVpbpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844138; c=relaxed/simple;
	bh=m9jMRwN7D/g9ylb+qVmMEn3jD7LEDE289u1oCoCvFi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2Ti5x6ywu5lNmTiNh8VHeypRF5kEQIWnWWIrC4uquj/vO5YCpCadlBwX/QNGKdbMx9nKQk491QbOzvte7MaPQD4kfQsCAPLE0Pvjy9AeGMd4m17v4E0sRALfb99kWsDoTYDDGplsbkNLALrtVuqShG/pwtAaDXIMX8/SgylbJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ssGDOK2A; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ssGDOK2A"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so14060543e87.2
        for <imx@lists.linux.dev>; Mon, 05 Aug 2024 00:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722844135; x=1723448935; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKGwudayEl/s2GCBYHOT4CD2FeDk2bfVh99IyAaA7Kk=;
        b=ssGDOK2A3tvxlkkpwx88qidXsTtVbOngx7/f4JlbReo3mcXrtRZ18/u8WK+au6Vasl
         Xo20zYvBfn1SqiW5x7kyH4E7ZA12FoScMbX4yhtpmIaKXCLeLfey9NeIySwdsr/tUl18
         Vcn/2RQTnh4I6BsU5vnkPzcOrEvrMh9ANb2y9RKmnocylRItENvQEsZN3kuO3lQBkI8N
         ArhfSsFtSLWq3FPHbJ3t31VmD24m+9a9lc77f0+2AY2mOZVhXZgHzIfdsVP/dYjRziTi
         Qf6WYPMJdqCqEakZXPUgJK4E5J+qCBS98JtjWpjayUDsrwk28uJKS6OagB8OuBjdUIWX
         +Ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722844135; x=1723448935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKGwudayEl/s2GCBYHOT4CD2FeDk2bfVh99IyAaA7Kk=;
        b=jzYbZNzSQ+pyf5Sl9ry7m4NdUtJ8jpKkznXRsPeeVw3Ud0nCBO6tm8e3CoEUhJ/zpn
         +9eKeIxwmn7P5e1wFQ7GS/JWfLQjvphnF/ffVRXFZ8T1XJID5XuCtZv+YKWzDnvyNpwo
         QNv9kVsuT85ViIk0shuZdpxGvD8bSnM79zmZsCi+j/uSxM8HZx8QgcjVbjnyLDPb9VIC
         +ICX1namvVtNv3PTvpITI8shrfQS46pLE1puVzju+vje19+dF0Pokkszr2x2Aw9wPUDC
         JZLdjseq28Yp8js7GeNvOqgmI6RVb7f0VSfYREIkeWZs/xV57KFGbvAJNtiTLqkxkgWl
         oqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3ne6q27VO0+il7HlAiuIq2P/DJY6ajUD+aVg56MZmFCP7qgla/f8alZ25zqkKG5uWOeaFGV8w2Las7dG2s2tXhk/0
X-Gm-Message-State: AOJu0Yyac0vIwTiAwFcI1wf+tDaQKLQsh+3iq0Lq2WX0pFptDEfvAm+V
	BntCQ95FQdw8mSyf/wYz8i/01iVvTqi6hAIK5cbRLaliyKmDACVtfDLiSC/zDAUIq0Lb+7x0cOq
	EgM6Dgxo1OeNZSJxylGgUp4ycGfkL+uOOeo0qBg==
X-Google-Smtp-Source: AGHT+IEXIMB9nJG0TyIkPR9yKzdJtpYi5iceZ1E2YZ4ASFuMPTP6yq98iQjwWp8kP8YFpv+0ZSWlHsT8AQDqV2sKD8k=
X-Received: by 2002:a05:6512:2804:b0:52e:fc01:ddfa with SMTP id
 2adb3069b0e04-530bb387c7cmr7077635e87.7.1722844135078; Mon, 05 Aug 2024
 00:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240716-adi-v1-0-79c0122986e7@nxp.com> <20240716-adi-v1-2-79c0122986e7@nxp.com>
In-Reply-To: <20240716-adi-v1-2-79c0122986e7@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 09:48:44 +0200
Message-ID: <CACRpkdaiG+Gr+asDHsztR3A=iNNCUsCFXfrW2ZUidWYLn9RcVA@mail.gmail.com>
Subject: Re: [PATCH 2/6] mfd: adp5585: add ADI adp5585 core support
To: Frank Li <Frank.Li@nxp.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
	Jun Li <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

thanks for your patch!

On Tue, Jul 16, 2024 at 9:29=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +struct adp5585_dev {
> +       struct device *dev;
> +       struct i2c_client *i2c_client;
> +
> +       int (*read_reg)(struct adp5585_dev *adp5585, u8 reg, u8 *val);
> +       int (*write_reg)(struct adp5585_dev *adp5585, u8 reg, u8 val);
> +};

The read_reg() and write_reg() accessors looks like a reimplementation
of regmap.

Can you check if you can just let the subdrivers access a regmap
for the parent MFD device and use that to read/write registers?

There are many examples of this in recent MFD drivers.

Yours,
Linus Walleij
