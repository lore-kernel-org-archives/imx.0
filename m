Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E4F14291E
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 20:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713903760; cv=none; b=hTguFvxPlL/521HleRTb4jlIQWv5gP9FvtjiKnzhgvNwfGcrnRBv+iDwVunTuu3vFbKQZFQNoeTg2uJxizt1zhALsoB7PV9QLydQljHqjIZaotUgsP6p3QPAc8LlcTH0OVlvp7B861A28QpsXOiJpKRSn1eSaDLqOH30oxN5DH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713903760; c=relaxed/simple;
	bh=ERg1J41d06etnj+H8lues6SdgOvc50LdXU0Ny6V07n8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OF6pATJYJ0i5B6XovwaCkjACM/Jnm502EBjRG14Ce/49Ro8tVM9zarH4uyGv1vY0ktTVemp8PLsSqB/yE+Wj+nXtIGy/2WD/MGjFWiATZUErudoZWtlR3PhcqdYbgUVqBQLPXRkkY+hqxnXEhharTW1wucPzToUxMh8+J1G4wE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dse1GhFA; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dse1GhFA"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ae3afb81d8so461772a91.0
        for <imx@lists.linux.dev>; Tue, 23 Apr 2024 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713903758; x=1714508558; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERg1J41d06etnj+H8lues6SdgOvc50LdXU0Ny6V07n8=;
        b=dse1GhFAraaOPqgfwB2IBcJikaehWP4T6C7Isbopzt7xUtxHEefA0rKbXjduirHCD1
         AM6MgRNrVZcXcn3ap2/1JuyYSBOwKXpaIuUgbwK8a7zG62kxKV206nUdC5naZrsY4Pue
         sVE1sRwOqgK//2eTtOP4mY/lUaZ5Tb/No8026RwEGihMswBHqC3UaFxtgGAJBxnnMZzJ
         r4RVcGrvXcg4RPZzrwmSDT1VkNCuNSdX2vPgTnuSbFkmyfvCfY8ybMDxRhBASbSYTa95
         sN1aNiUL/HlID3NipiryqIWkOXFsn5qAcmjaQXVJc2VlkngJoC/vlEEceQafFo44MUZV
         2/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713903758; x=1714508558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERg1J41d06etnj+H8lues6SdgOvc50LdXU0Ny6V07n8=;
        b=wmFyICLQc4RIe47y6oPzV4s58a0nou/7ofDNHp/e7LBOMFAws68IPiBOgyvIbeV5hi
         g97c7nt1YblZQ1E0WdtoVXJvf3U1N/0iiA+EbX/LgqxoMsc+hK4Mkn/GV61hm3TYATGe
         lHj0DidGighS5S9vVZs1l4mn9Y2FGZUgigOf1ozonkgIQOJ7CXvj15CpmJRX3zY7RmfJ
         pHCu7TIRh0PGEs1TMagEbg6WJCPaX3WWxEml9D0BVRDHXeGQjC3t1u+S0vClg/fgzUiy
         pdOrjH/gDMXva7eyY+qidzBgV/y9wU5kkX4o8kBbY4E8Ju7LAiOGWPTujfOQG7CKCH89
         vPXg==
X-Forwarded-Encrypted: i=1; AJvYcCVCQ/t4pI6vvyINOGPwm6M1T+emgO7fH5BeFwDv5hh59gh/d4mNYd06wAnH3AkuNV0QKRoRnaHAwxLvetYdet8UuQ89
X-Gm-Message-State: AOJu0YxRSVLG77QcblMntJnDBYa0DqqRSJLvOxPq3/U7IahPKjFQ9dzu
	jQToyat9l+zIHl+F7j0lIdlr7ZN+JTMyKfkBMGR9jS0LK7gzfUfSK/jyOBLwZw81CXsZgC/xQoM
	sF7XBkwC3yvLkI16JCyY4ef3tAAo=
X-Google-Smtp-Source: AGHT+IGueta3RswI0M/FkR9FwKeiGdRf4qn24eyoS2YMfXNjlyVhaYbnUKY9bbwjHMq/YHliJwPYRdqyRkDdJn/L/O0=
X-Received: by 2002:a17:90a:408e:b0:2a5:3f1f:a1d1 with SMTP id
 l14-20020a17090a408e00b002a53f1fa1d1mr521558pjg.0.1713903758085; Tue, 23 Apr
 2024 13:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-4-andriy.shevchenko@linux.intel.com>
 <ZigSiCBIwoEIPYoG@lizhi-Precision-Tower-5810> <ZigUL7exXBSbWDIR@smile.fi.intel.com>
 <ZigXJJj4e+oaANAt@lizhi-Precision-Tower-5810>
In-Reply-To: <ZigXJJj4e+oaANAt@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 23 Apr 2024 17:22:25 -0300
Message-ID: <CAOMZO5CTiXWMXgi35c4M4XsdZ26-QiArXcBcViYnwTAgd00nDQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] PCI: imx6: Convert to agnostic GPIO API
To: Frank Li <Frank.li@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
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
	Pengutronix Kernel Team <kernel@pengutronix.de>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 5:16=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> if (IS_ERR(imx6_pcie->reset_gpiod)) should be true. then dev_err_probe()
> will run and print "unable to get reset gpio\n" with error code
> -EPROBE_DEFER.

dev_err_probe() will not print an error message when the error code is
-EPROBE_DEFER.

That's exactly the point of using dev_err_probe().
