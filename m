Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE08114388F
	for <imx@lists.linux.dev>; Mon,  6 May 2024 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714997438; cv=none; b=T2v8lwXCMml/Sl+4dPOSJH4b+mtozLe2fDMNRh1oPAFYRGWEW1F6cjL73JYpipvUIMLdoLIg36EXbd0qaOBqvHJ4GFmdQprTibxyzIXF6F+ZidloEm9o85+XKvPFRk/iKkQtRNoKzzNXxk1lo+/4D2clljcIUd9mIYGp5Ft8xqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714997438; c=relaxed/simple;
	bh=NpCD5T+l+gGXtsoL7GDErBmJ6/RrNy8hQRbP7mriCTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbNDGjwEBVYWpk1ExLD79jKaa/djaIw25Oattwjmu+BTy/ATVlRq0Nq7DT6cfhFUisnEq4LJwKW4O0wW+JxbmHodh+l8BG+4BoTkVhGv6NvJDwQy3KTn9RoZ/joOPcyAFEBJSjhDjTTOnsCU57A6AnOiHrUcuUg7WojV2+Soyf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QAmUuGzX; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QAmUuGzX"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-62050e00cfdso8405887b3.3
        for <imx@lists.linux.dev>; Mon, 06 May 2024 05:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714997436; x=1715602236; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83bq6sZnjWOAj2QjLu2jyQop5vm1yVH5pagOdWkdqQE=;
        b=QAmUuGzXtbKGZY7gMveFfysKW/3UOJmrUQ5ifhdLyQ5M1uirxr7R5XkUei2A9L+yDZ
         OB6Bk5erutHj3aPUCM5vn8Z237qTk3RZNad1LyPEd1HU0kByBfbMfPOnx0vtruGiU1Ne
         AvwCL+kcwvDPUGRKfdF1piDBrn9qvmAMaQxooT2A+z9pPQWRbzBxYTwa7WSPmFQspxyU
         HXkxCT1pFk6ps9CDUSjP0ox6ZvfawwgFXqrhYLGreWwd3ciVySTA9nvZlDXex6TgdjGn
         EmTUevD49THXCXTA7dJ1wxMOHhk45+iCZb4s6e2iXE1wk3lFGYtEEGSmOCXDiUKS8R2K
         40LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714997436; x=1715602236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83bq6sZnjWOAj2QjLu2jyQop5vm1yVH5pagOdWkdqQE=;
        b=vFgVB3snazGqz3bvup6ZkZ58ND6bDWFKbYMjjrJ2uXRRxp/TONV/FLwDKYCcyTZ/qu
         4/1/H1fDIN7DUKqbNZN52g4UdmL3caZ32ToPha6UIwYZezLX1SM6DdYX7MsPHXgzRTjW
         deZiT0qYcewm+rBhvRdv/iGa7oi/FnxN7o71KMWn3XTWzjModV8CeqM8c2UDL4egUM5J
         sRkh+/94aY9N2gp0VOA1tE2fdB5Q0U30EbAXsLXvEvM5masS9yjp9hqZODnmi5qh67Dq
         Hzsd4iaTqXtxAi/q1pVzhYEW+vwjqjqFPr9iquEfrKvjSdJ9UzE575MDTbZsHDYVIkRF
         PjsA==
X-Forwarded-Encrypted: i=1; AJvYcCWSRf6kxVtAkEz4n3WPSAw/wAdZeHgKtyWhcJ0pe6406LuN9HXCcIs6ztbhUv4p0xOewZsPP74fdazPv7lEQeMBPmDF
X-Gm-Message-State: AOJu0YzR/VRpQqGa1jwBkTBcl1TRTDglbgsc7NmtCMfeSfMpysY4J//W
	rYwvB7gIlviPTYfsFOkM8ClyKuR5XiXfzcBjdYQ3RD67Tw/5XuNxGt0iw2ixVdTRyHwmwGzrEqu
	r3ZSkL7enf4oQi3yYkiA4REk3H0li21CkeiGoVg==
X-Google-Smtp-Source: AGHT+IER78l+XvV7AsX+dBbOeQ79q3sQzITzxy15JTynwXfGIedBRzHp3Bby/Y/eLvaqRahVeAP4r46dQsP2qbPRE+I=
X-Received: by 2002:a05:6902:2011:b0:dcf:2cfe:c82e with SMTP id
 dh17-20020a056902201100b00dcf2cfec82emr11080008ybb.55.1714997435752; Mon, 06
 May 2024 05:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com> <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 14:10:24 +0200
Message-ID: <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] PCI: imx6: Convert to agnostic GPIO API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
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

On Mon, Apr 29, 2024 at 12:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I think there is a bug here, the code is respecting the OF property
"reset-gpio-active-high"
but the code in drivers/gpio/gpiolib-of.h actually has a quirk for
this so you can just
delete all the active high handling and rely on 1 =3D asserted and 0 =3D
deasserted when
using GPIO descriptors.

Just delete this thing:
imx6_pcie->gpio_active_high =3D of_property_read_bool(node,
                                           "reset-gpio-active-high");

Yours,
Linus Walleij
