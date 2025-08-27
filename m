Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF0E279DAC
	for <imx@lists.linux.dev>; Wed, 27 Aug 2025 16:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756313203; cv=none; b=gNbDPmadnHuYP7xmZdegoTYTZTI0dcfURIeOzSuU5g97n4Gc93GElH0sC0T/tivORfJDHdQtZJDgeLETHNB7jMoSrUJaG0QUVajEOmqicTTnLolHSz59+pxzKUrA1kE76RgxcOk1aRJBoVtuL2KedyRREgYijM9roFIWjz/Hy2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756313203; c=relaxed/simple;
	bh=/Oe8mL8TjjkGnR2jG5Rxs9VLauseuU6oqwYerqQXRro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SXVegh48XytBWHwLxhe0TOhJXQUTJ9D4/9Y2s7u3e5PyiPP/RyrTXtNLIuIoiqIvO/lz/pDRHiIQQaP0JKvvrJaQ0T36ncuMlilLHZd8jQXmmlngWhJ99pj23aQxLO5I7rw/5/HCveAMBdhwzdcIShThU4bCHhoiLMIQC8pJTtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aXZpBKpN; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aXZpBKpN"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f469ad067so85156e87.0
        for <imx@lists.linux.dev>; Wed, 27 Aug 2025 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756313200; x=1756918000; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Oe8mL8TjjkGnR2jG5Rxs9VLauseuU6oqwYerqQXRro=;
        b=aXZpBKpNzOkgTXP1i+rCLQlimV7yoN2s1v96IMY1AEBsdwaogvAPuhV82omba9Sl2i
         LVkT+/j2HNMZfGGLfl66LjMvNiArsxu9sNqy+VIadyo9d5E1z3nBGfY5tdaPMspL01o8
         uuH5CzTViljnrfsT75xcSVbkXSiW9dDRLrKVhw+pTafxXPiIOKM1emmuuukqhbAgDkdE
         NcqfbbakrteGsEXnOp9KQHeoFHwzZjWibyC0F00if6vlwy0yrplDGSgpVF03662qtMLP
         AJSyKS69RV7jZuGt6895e78CrG/s7o4vbOqiKE6eqD+izKbKGMYTOjFI+euBZn8ajkeE
         ysCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756313200; x=1756918000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Oe8mL8TjjkGnR2jG5Rxs9VLauseuU6oqwYerqQXRro=;
        b=azP2lcnfw/t8htf7r0fmlAZc5R0BjuWfMlckX7uM0f9cBajybqVKH4Uol2575JuY4h
         OYk+W9gphTxHdNd0M1hh7tBWk45hpnIzTUwrXnZ5lglibHL6dN149MG6QVI9Eu95Ncav
         XbRack4H2rT45x/xnTZlwhYHuvjuJHH9AS3LeHbfLU7jV7htuBK/2ujfxr1bu0O1FUHh
         R0CBjkr9DV9b44061/2URuDcEAFkuxwAmsG/VPLNTqfRUxblPVcogemf+r9kATCa4PbH
         3BHJecxjgTTxKuEXAh5IREy5U611wm6Ek7gZJLwr44xe9EPJqxj+OHGxGk0OvdED0q8s
         kudg==
X-Forwarded-Encrypted: i=1; AJvYcCVD1j/qeS/JGhxZKl9vGDdOs7kotbBhKNwLbFWBDkXMsFbGSNJn0Pgs6Yv+7wozYA4mpFs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+njwjDCJJ2gkpH7LckMMJRYBNJSxIybPmgsvyvK0QnhrlhlPw
	03LM3kSGGzKeHqB0HnNG4kooYyXBs6BbURWFxPvLXsGsEVQoypdVbUWKIQDf+qbkF7i8OPNRB/E
	kcms6F7UWXG3ur3WjAcxKWtwb5BMQ/BgYUNMpCDKNgA==
X-Gm-Gg: ASbGncsZ4r60ZN31kXtzx3bHpqw85Q2l5ghZWX0QG1ygUGGrC1dYSC64JV1pDL69VA+
	I74oMlEISYknsVH4uykrk5H0JxkBesmhC4D35Dj2SK8OV3mNz7GLwooT0PAgmju5EZPpnwEsJcz
	W+I2G3tdm9XIrRMj/cqpVCsLdSFdMDfRRONegvMEqvhuaLh0rWccD7EorawcWaT9qreRj0dCyEa
	BgOmE5MrR9bRkfWgm8Z9J5jKj5nVmcUr0b6yGJ1K9VgzfsgLQ==
X-Google-Smtp-Source: AGHT+IH2vScJrK3ld667OkWoypLYcKly6TqnbjFjPvpTB4KCLVEthUMwQrvNGz6iiIbdkdd5rCAEnq3AM7MI6KeEyo4=
X-Received: by 2002:a05:6512:138c:b0:553:2969:1d6d with SMTP id
 2adb3069b0e04-55f4f4c6a98mr2026962e87.13.1756313200214; Wed, 27 Aug 2025
 09:46:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk> <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
 <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk>
In-Reply-To: <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Aug 2025 18:46:28 +0200
X-Gm-Features: Ac12FXzUBjVjZcm1OFCa8B8Pt22rGMmSNEEFj8GwunzU7aycJyqw28vaNlWwNSA
Message-ID: <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Tue, Aug 26, 2025 at 08:19:37PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Aug 20, 2025 at 8:41=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > > On Wed, Aug 20, 2025 at 09:12:49AM +0200, Linus Walleij wrote:
>
> > > > The qualcomm 32bit platforms fail in next anyway so I dropped the p=
atches
> > > > for now.
>
> > > FWIW the i.MX8MP also seems to have been broken by this:
>
> > I can't test it unfortunately - would you mind sharing some info on
> > what's failing exactly?
>
> I've just got the log I linked above.

So, I've been looking at this bisect email and clicking the links to
LAVA jobs and I can't find anything. Does it fail to build? Fail at
run-time? I'm not sure how to read this.

Bart
