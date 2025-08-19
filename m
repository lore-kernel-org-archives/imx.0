Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05A533CEAA
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755608524; cv=none; b=pL/cImQ1xj3CRWy6e9V2eMUDyWrsR9q456Igg0xrUdvwAyC6wDDjp0w7SFHDwhEJkZBxwHL7sD62qScqJRoKOg115uF59uXWWhadI7g6poT+C6Agpx5TgiQK5R9IObotDWaGVgH4V9N8+lVUI1pSqtvkFgLaU7umBVx7iYjcQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755608524; c=relaxed/simple;
	bh=xDml88sPMX5R8HY2YfDw7tFyskzPjxRWQr7bMllRWeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCkElmbEAl/C7Fwg0xLnrcKXNdbKqI0F18p8/mxdKYx8LTTn+MdOx1yIcgNN8LqyisOLYsabxDKbPLm0JPS9nEFtm3ljmIAM8Bq572a87QXPxg4Xj36nUw2wc7g0R/tqJN+lj2IkwDGwo+iszTUwx04oISqk7CwBZRZYIQjZVA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0kmmGPV; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0kmmGPV"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-333f82a3a9eso45057121fa.1
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755608519; x=1756213319; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxb1RM5Ht9n1r5SEfzEp8KCVi3ssjTbIBjJD7cNdVUs=;
        b=r0kmmGPVWXeLai0Rpw6lP2AXSWM1wUG/fWZT25E4LocWpXJl44uqVV5jVTDUUzvlnb
         /1wAy+nfu2tQw8s1ql8FCZW81Hpl/FiLo5vyOYs0X70LUZfjWxtwYD4O7JmASmaIFsJg
         22MtMoRBI98O7donaL8fo5AH4j3DWxHmvB0AYaWHQdOBPa+SqwJYkYisv3hD2DFpVjPG
         sceZj7v4HtPVq7ueCxIlYGcRd09dTCdxvt8EoKQ1Kfl07hUn6HQHZdtge0fQBV7ubooz
         ZAf5ijpRV13AFOvEw+lt9TbF7PZtRUvNBPxsBpPc6RdcB0VrXGSdHZthEh/QcxdIf36o
         dNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608519; x=1756213319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxb1RM5Ht9n1r5SEfzEp8KCVi3ssjTbIBjJD7cNdVUs=;
        b=r8oUfQv5jvMStnBD6vDXdWlttCpLceLOwm/9Vf9Q163E3mI4p33HHY0IVrtG685IFN
         nzhowNEfvPfZ39VWWxr92VJtasa7E7CJ+iyGPqgi9aYG2ADFht/X6VXII6okHlxSmgSE
         um9SmdfdHSW0bU6IWWnfH05KBMLh04GI+iZN5u0yYNwy/az2HTlhckM/mEX40yRxqTfD
         nZBy9SS+ZNeE104lbH2sleuZv7lJNWf0I2X7ooPb0YFcUEZMj4G9Tn/tnrAQ3jRuTjwb
         aUMk69mO4WY1ifbnOsrwm3o5IjdZX/6/yPKt6Z6XHL1u5Ms8a+JBSbyOSd4VXTZR/3tM
         62AA==
X-Forwarded-Encrypted: i=1; AJvYcCXwQA2wE4CbiQ8L4WTsffyrCnFpRTKyl7Y/Ma8kEqp/UFwrU25VVM31wnd9LW+4YWB6JSk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1xnRlq7p4f19phtuOey8rgJV9NmcNWNNxVW2fE/vIgkn3Kyh0
	jz5NtsvSn/z097NWI7wwtKMb7wnn/M2uG3L2nCsii+6BsFEEoXgJyGbDlAwz+S4r6iVWwTKeMLf
	1D6kFyRTbJGUZDjkBbMuQYrmjYU0Qp5dBCLaRXSC5kA==
X-Gm-Gg: ASbGncuOVRrSM2+HBQvKIU4uKf0O6ANCsctK715K69itXNKjw13ejMzG0H6ZkvbKeg4
	3TJB/EL2ivvyujPCEhbhxVx0MBuPeqzRn2hs6D+wi9uoreRqfmRRQRSkevYRr2X3D8x4o1WIK95
	TpGcd+TSIka41oBrgixQgubDAWz/lv6V04pdSeWPZaKuIpSF38NUgCXUs8rdKOHnSCqDFLgoltq
	7VdhFU=
X-Google-Smtp-Source: AGHT+IE7bjsIxvb3/p90/iX8lbM0JfYfSlfdYQ83gKcwpD46fl2MWv7BXJs8CRajKFvUVpb0cf1UMxfJ5zwUc8D1bZs=
X-Received: by 2002:a2e:a490:0:b0:332:20c7:2820 with SMTP id
 38308e7fff4ca-33531348988mr4833881fa.5.1755608518741; Tue, 19 Aug 2025
 06:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 15:01:47 +0200
X-Gm-Features: Ac12FXyC72fjsmfBKj8qknXL2IcZGnP7oQB_by_QmlQnlUNrEkhpI-BF0K24mIM
Message-ID: <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
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

On Fri, Aug 15, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Problem: when pinctrl core binds pins to a consumer device and the
> pinmux ops of the underlying driver are marked as strict, the pin in
> question can no longer be requested as a GPIO using the GPIO descriptor
> API. It will result in the following error:
>
> [    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already request=
ed by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
> [    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100=
000.pinctrl:570)
>
> This typically makes sense except when the pins are muxed to a function
> that actually says "GPIO". Of course, the function name is just a string
> so it has no meaning to the pinctrl subsystem.
>
> We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> other platforms as well) where we mux a pin to "gpio" function using the
> `pinctrl-X` property in order to configure bias or drive-strength and
> then access it using the gpiod API. This makes it impossible to mark the
> pin controller module as "strict".
>
> This series proposes to introduce a concept of a sub-category of
> pinfunctions: GPIO functions where the above is not true and the pin
> muxed as a GPIO can still be accessed via the GPIO consumer API even for
> strict pinmuxers.
>
> To that end: we first clean up the drivers that use struct function_desc
> and make them use the smaller struct pinfunction instead - which is the
> correct structure for drivers to describe their pin functions with. We
> also rework pinmux core to not duplicate memory used to store the
> pinfunctions unless they're allocated dynamically.
>
> First: provide the kmemdup_const() helper which only duplicates memory
> if it's not in the .rodata section. Then rework all pinctrl drivers that
> instantiate objects of type struct function_desc as they should only be
> created by pinmux core. Next constify the return value of the accessor
> used to expose these structures to users and finally convert the
> pinfunction object within struct function_desc to a pointer and use
> kmemdup_const() to assign it. With this done proceed to add
> infrastructure for the GPIO pin function category and use it in Qualcomm
> drivers. At the very end: make the Qualcomm pinmuxer strict.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
(...)
> Bartosz Golaszewski (15):
>       devres: provide devm_kmemdup_const()
>       pinctrl: ingenic: use struct pinfunction instead of struct function=
_desc
>       pinctrl: airoha: replace struct function_desc with struct pinfuncti=
on
>       pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
>       pinctrl: mediatek: moore: replace struct function_desc with struct =
pinfunction
>       pinctrl: imx: don't access the pin function radix tree directly
>       pinctrl: keembay: release allocated memory in detach path
>       pinctrl: keembay: use a dedicated structure for the pinfunction des=
cription
>       pinctrl: constify pinmux_generic_get_function()
>       pinctrl: make struct pinfunction a pointer in struct function_desc
>       pinctrl: qcom: use generic pin function helpers
>       pinctrl: allow to mark pin functions as requestable GPIOs

I applied these 12 patches as a starter so they can
stabilize in linux-next.

>       pinctrl: qcom: add infrastructure for marking pin functions as GPIO=
s
>       pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-str=
ict functions
>       pinctrl: qcom: make the pinmuxing strict

Neil reports of regressions on qcom platforms so I assume it's something
in the last three patches that's causing it and I hold these three off
until you have time to look at it (and focus at just the final qcom pieces)=
.

Yours,
Linus Walleij
