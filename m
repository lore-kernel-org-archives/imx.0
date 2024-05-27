Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1467515F335
	for <imx@lists.linux.dev>; Mon, 27 May 2024 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817080; cv=none; b=XtVbHYzOuU+8Y3kVRwxxbwVISjk/68ide9BqzeJmoo5eLRlYYTUAQ6zpqwdOpDCyE+67cgCpfaVdwqgsADQOUl0+bs4fIK/R6OYb8esQKllxWMIFhDvARgyPFzeMx+/ngSYAHF/W/UHDc0eE0/4MiKngLOo2DXdG+rpNWY9/+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817080; c=relaxed/simple;
	bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+hChli/7bKc4Rc7FuFGyW20I5wlLggpK9lj+JhzXdxHNa17L4zahwJ9MOiZfX9BAE0dMeO9D10gr3vkLS1H+Fxgjdpl0jDveTeIkUkOt0EQTa9qOxGGHjakdCGSFJTtJ3R1bypmFrIhz85k/r8xYPvXGjZRAp5uPyRbQ79eG30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T1j1bFvV; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T1j1bFvV"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-df7812c4526so2412389276.1
        for <imx@lists.linux.dev>; Mon, 27 May 2024 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716817076; x=1717421876; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
        b=T1j1bFvVr/gKaDf9MBiZg8GmeKMtKuFRRmUMfSZ9/8U9y5ct56XYasvm222Hr/XSIz
         7vCINssXv8FtOr/i8eCQKWJTa3VltsYuFlxLtG+NefI7ZQPNQfDkDi/smsIrVy7BiQ58
         kg0rGisHRzYmtZ2XSaoXQQOSOZtaeuXAP76dxHNwlmyLd2TtKbAmxjGod3MjHonLD0IY
         EJOsNBU0c7Hx8Db0P5K9M0F3Ebsp6LgDOVrbNOU2lrDpgAio90t4+9JqQcti+eC1eaeX
         hKEOILKE0seBmicGBi92IVz2W/CVLvOmtKhYYvdlY6s+chI/+Dl+oUg8+Ancn5BfDYhR
         gjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817076; x=1717421876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sI4D4Go0OgKRyqVQduA3nP4L7zQphhNOPs9Kzw8Cmf0=;
        b=sjvhhFHxBBbR1zCnP/iNqBhZTxNytRgrxpQ8b8nfjxtmMUjodC1vOnOFiJYMJMKCP7
         7gNFOAwaU7Pip6PrWfUSssWt+A00Eo641VJd0Ksh7QadFNa3524Hd6JVBbvUEfxLlLTs
         KRaI9Kmt88rdttYrvHdzeECg2jlKkLMzWYFtPtRueO5bPtS6g9KJyc4L0pVjjuNmbCnV
         88Lf7kcg/paB4RR4th28WxUpLgz9oLp+0foi/l9z0z9yx3+qlkSeOjrPtmjKuU2osoqR
         IPXrTKfQJpGDW4kCmMgSZmyOrf5NPjZY1xsXQzx42EiXjNLGVcMG0x4U1fHJ+m4cKDDZ
         dqew==
X-Forwarded-Encrypted: i=1; AJvYcCVvoFNGlOWo465snS2YjJDByAYKjj4rPWpfXDeF0d5Dx4DpG/dRQbU2zkGZehiKWIVrg83ag1Mwh5nuXXj2k00x1uEM
X-Gm-Message-State: AOJu0Yw63LMSCRIV6Hs99Mtwuw2FHcQy3JXGsclJO+/dGXuVmlX2cURd
	xNBUKrDitnNoZfJzppyLM7acrhdLUqeLXe9EUxU31ehorkT/Prf1mbtb54JajbmVof/7H+TkdGT
	j1mHQnXJM9t5rn6SDmnBVzbwme01PWxIm41f+/w==
X-Google-Smtp-Source: AGHT+IG3ODce9dNV390Ozs9wlqpcGCT+NP7kvAR3YSrx49G8pypddGGuh8zJs0qLVCnoqGn9N6DYCNxnN4AlbhGb3Ao=
X-Received: by 2002:a25:d610:0:b0:de5:9d13:591b with SMTP id
 3f1490d57ef6-df7721c660emr8663079276.32.1716817076072; Mon, 27 May 2024
 06:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com> <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:37:45 +0200
Message-ID: <CACRpkdZFfjCitNiGVe=F4Jd_M36fqdG0ixD7396xEVbvqZUdyA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] PCI: imx6: Convert to agnostic GPIO API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 4:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Would maybe mention in the commit that the quirk to gpiolib
is already in place (people are already confused by it) but no big
deal.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
