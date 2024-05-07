Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD7614D6EB
	for <imx@lists.linux.dev>; Tue,  7 May 2024 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715076244; cv=none; b=h3uoNEx+RMrCfR//HF/TDicmc3ZK8FmO4K+tpVR6r9JPSFdHnLwMLgSvPBVXp47VYsb/P7HX6OnfJJv1H8VT5sv6WKt4tZbho79fZ9k+p0eYI6XUxlXuOBtQ6K6AjZl8AnORFiJEH1nx+RfLwO3WlZQgdMWiSPL4zDz4dMQjV7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715076244; c=relaxed/simple;
	bh=jnbmoIfEkquEEjiJBAjqdCDBxOD1+Yzt7A7OKiFlJfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+ToFRVU0uv9CJKQ2xtvVSqSwDTYZYhI0lnm8CTuS4VT6R15sHJMtsbUOxM0Tw/KPPj1Fqp5hVkci4XQBf5SloNPNNEtfemAb/zpzZv1hWLjjJD9bkuDs9cBXSXw/YzFZNc2nCnCAoVdCGM8sXGKy2mvDTZUMq3Zc9THRnAgUYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eSWFfF2i; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eSWFfF2i"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-61bee45d035so33308907b3.1
        for <imx@lists.linux.dev>; Tue, 07 May 2024 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715076241; x=1715681041; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENlfgQ3ADPUMWuBuiOLhnFoQNEtfud/j+QDtLaNAUG0=;
        b=eSWFfF2isag5BkVVqio8/7d75ImIE5HAqOnjWvdOiSjOZrwZWqo5MT/ew+ycr0UzXJ
         2HDiqRXnpJF2rj9g46bW3BI9U7ojn9XkgmlEu6M50S7gyE8ImP83KErxGuC8nCcx2akU
         VDfHnqG0u7Rd5kXz3o51nyjFwje+ry0yWGMNkzC3zFqLBWDhmQpgaDxHa2CeHeixqNg8
         Qr3RIjX8HBsXrqrUHYDEIwr7n/hFi0rs1LdDIwMZPtDFgYyXTqM+ozNpU+yhQddVQHV1
         1qj3Pc74DDgI+XCC8ynIC8lW0H6LVstFjBIO87fOLIkfkobJ9AidJUvJc+O+gN3UfWga
         tYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076241; x=1715681041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENlfgQ3ADPUMWuBuiOLhnFoQNEtfud/j+QDtLaNAUG0=;
        b=tSp8zbN3OgOrtjmlJMHNqrTSoRU7bC6hGAifB12ZxcJKpHUi0L1L3GJKrffsA/lfsx
         D5UInAK1d3jp5vnKX8LasEs6k4KAYPlbDTO8uNnrPdqM/hr/tsXo6Mta+w/1mFroTaYD
         rRqKRkgWf7ch2IC7ys0at0TXlJRr0z1+6ix/YJF+W5QUbdOitncaRM+hm6euyv3plIES
         9RNVKv0HPN67rfl8OanO9DvHSbRbwQ+tAAMuwWEkrqL+d22YLsefuBD4C4xEGL9Rj9Es
         G0ddPQJ9FUD8+IZNlBGfdCSjKMHC0fd5yAElcQo7ihFt0P6aG4sKCszzx5MT3nVkOYRg
         MTNw==
X-Forwarded-Encrypted: i=1; AJvYcCV0w9UEjY/peLkk7xenI/qfPLh5R0BRKtlbp2QlcJWWYhCxEy5JqUjRNUmSG6c8uw4DnPQqysjeA+852c7hyjmZwF8X
X-Gm-Message-State: AOJu0Yxas5Ue2/qw80AsTfZaEyOL7C7j1Bb78hYN6zJLJhBX3Yg/a36c
	O5Qqrt902Vdw5qLKm5fcbp3EibsCIRgYpaQnTMr+Twm0tKPm1hQ56oFrjoOJV+rcWBVDN+ZTS60
	YeYM/bGYYEl0SsEVAlfGTyj8K+ioYofNIKUdiWQ==
X-Google-Smtp-Source: AGHT+IE6RbboWA6zivUgxElWhiInYBOoZKZxCooBjJtVLVKzpcY065ewr27Om73FjNB7+c1CsbFfoFINBaR1I1fIna4=
X-Received: by 2002:a5b:912:0:b0:de6:3c4:c3a with SMTP id a18-20020a5b0912000000b00de603c40c3amr12223334ybq.10.1715076241415;
 Tue, 07 May 2024 03:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 May 2024 12:03:50 +0200
Message-ID: <CACRpkda=a3X=jyZKQoOFrfgzpE2C+rZ9UC1VDnCvGL7QP4x4BA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] PCI: controller: Move to agnostic GPIO API
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

On Mon, May 6, 2024 at 4:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In v4:
> - added tag (Mani)
> - fixed a polarity bug in iMX.6 driver (Linus)

Looks good now. The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Perhaps the use of  _raw accessors could be avoided in 5/5 by some
elaborart polarity quirk but I'm no perfectionist and it can be fixed later=
.

Yours,
Linus Walleij
