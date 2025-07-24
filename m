Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A66A26A0F8
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355505; cv=none; b=LZxwoU8cbCxcI0yznqbso/Pvj4WNcpxRJU2eb1SG2VeI6KdrvgP4Q63McCb2PhpZwWcO4loL0KwcOMS8yvNBHdHCYi7o2TK3ozcNmnhyiDJoazwIvRxEFP7L5422mZzE2j5upcTfsP1m3WPy9FuI4NVMJs/lVgWHM5FR2ZPWFZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355505; c=relaxed/simple;
	bh=LO3S7VvW0yLWS/aA7Ztz2n2SjnGIc3GFyf0h1H0tplM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o63ivUXI6V+S25JrRZk6gDEQ2Aku1FkGvPjP6rRCGZEtNSrKT7AxYNC5Vx2Fpqj1kYHC/pubvAQuSlLNUzoDlqgHvkaU0hfTuyiShteCUveBwc8jdDKyR98DO5CRnGmXwDLLs6l/l4nLM5ydd4JL6/BcOK49pTV3QZMBr5bwE4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq7UivxT; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq7UivxT"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae35f36da9dso175889866b.0
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 04:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355502; x=1753960302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1M55MjNHLP2A27D0IMUuTEokYqJMg2OTuUCTRKpy8Hg=;
        b=Hq7UivxTkJMQm5CUZkrJzSEj0v8lm/UTjx4F4w05kGtPJET+AJ163XoMRu2VMx3F7e
         rNZR3j5yinfzu6KfOX1mQhHEfFeK+6q/G5AZ85DXYGtC7bycrhi7yGwQXLbAiRTQxINw
         7dxbuQYLWhB/SR5tqZTCUXyBs5uREDCX5TXET+NttPtQVehgBiF6rCwbm5cFYfFdPEgH
         nyP4zx9HZAUlrUfhtUH3WBJC57mD9eoHLvYJWRqJvbb0M6D50KEKgjUxnQv9oc3KQ6Ou
         tYayz8GhF7Ejr6pRb94z4RtF0OanLORNKcCz66gKtRF7W6pQIHUxcnoYlTTL+xs1S16r
         qhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355502; x=1753960302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M55MjNHLP2A27D0IMUuTEokYqJMg2OTuUCTRKpy8Hg=;
        b=QzXmhy4wSA/06YcxxBBrEk8IYf2zWL5WvNGrkz/DjgG0P2T5dT3yyKqy2O69ZhnUed
         1ju5Z9JvUCQjAGOzm9VxdxdbohWRMnyX/yzQY4ThmyoAK0vhO63xipPuXMVmOz3A+hZ7
         uH9bzREWQ6JyZSEumCFnDRTlD0IETzxggp1YmilFRvoqEDyYHvGb15Bo9z7VrpcfEilw
         Sr+k2KBb05Il1FX0Sf72BqxpOqIis5iXrt6Zez4Fe8f3+4uBjlm+vRL1GhovWb0wkNw9
         zCC2JYfPmKGEm9eAxu6JAWiCN3gMZLY7lEHb99r+K3sKy/stR+fVAl1yjOeoXX0Yp+hA
         OYSA==
X-Forwarded-Encrypted: i=1; AJvYcCXCBsq5j6517swa1NC1+9n9nJiEuB2JjYmknnrwFsNLmMbQWSy1wpZgQRSJw5zFgvOEYxE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeU31opNLRiYhuLwtlkKSIy/ph4XuamJPnMeoly7jFrRafvKaF
	LPsDHVKQH6P4APSD60qJDTDMhwcQxwf7Kz3rjACi0OV9XEYI+QCXsk7GHrJm/7ZvOlCst/2j5yx
	xYYon1CevbyWcqTc0kHrh9ZVjVN8ENbQ=
X-Gm-Gg: ASbGnctm6g1+mjY0CrlxENCSn9NUaGt3LcVwrz4heDSvmnDqoZRgmItXt9xe0nZUhN5
	1LEsG5gODEfvGwt1nO5bb6y65tVFAmvLrxmu6a3Aa/mZVxh8KMSubAZj1Npk4Pqg/8cKuuL9ZHI
	Xa6kp57vkRvEZ3NM1IZnVeqFI51Pkt8mV6kheZJYwun8vqt53G4P9LQnhzgCiVPr8dSX0XbroSK
	RVtYRw6iw==
X-Google-Smtp-Source: AGHT+IGQZoX+LT1IzNpJkxMjSxSTE0HFrqyLNxJY+NiaWstSlkBVLBDC3jnocxQOgR/J/b6wSO0Ggtf4mqZ5QLUuoio=
X-Received: by 2002:a17:907:724a:b0:ae3:6068:235f with SMTP id
 a640c23a62f3a-af2f8d4a15amr677213666b.48.1753355501419; Thu, 24 Jul 2025
 04:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-8-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-8-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:11:04 +0200
X-Gm-Features: Ac12FXzgEQ0Ku4jr2sgSveo2Ph25gzNpv1tdxFI9mpW2KmHkqCwhSh2Uki2L2dY
Message-ID: <CAHp75VdMmfV=z75K9AmB7GsWV8C1bZPLGi33duTCt+CM79spJg@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> struct function_desc is a wrapper around struct pinfunction with an
> additional void *data pointer. We're working towards reducing the usage
> of struct function_desc in pinctrl drivers - they should only be created
> by pinmux core and accessed by drivers using
> pinmux_generic_get_function().

Any link to the discussion and perhaps an updated in-kernel
documentation and/or TODO?

> This driver uses the data pointer so in
> order to stop using struct function_desc, we need to provide an
> alternative that also wraps the mux mode which is passed to pinctrl core
> as user data.

...

> +struct keembay_pinfunction {
> +       struct pinfunction func;
> +       u8 mux_mode;
> +};

My gut's feeling that this type of construction will be in tons of the
drivers, perhaps better to provide an alternative like
struct pinfunction_with_mode {
  ...
};

Or even with variadic arguments... (just saying)

--=20
With Best Regards,
Andy Shevchenko
