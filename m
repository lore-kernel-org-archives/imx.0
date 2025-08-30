Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C39C5BAF0
	for <imx@lists.linux.dev>; Sat, 30 Aug 2025 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756541998; cv=none; b=hPWBSqFudmvq9coNHlI8fGX9MRWI5cmkOUfiYvdzncaVDzhFBby6KAEG1U5jntXCUZMJWCazDvVOg6mwnXi7j27NrfrPLlIuJQbAElRqpypyLsRFTIy7/HWkWh0K4NNfdiESIABg47L0wp5eEOl1654dnjVTPh8VB2WXAcCjnhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756541998; c=relaxed/simple;
	bh=VJVktYbtJWttedpN2IBIAHp9NC8Jjxgesn2RhZArsks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nuQ2MluADFZROrkAG/6iPEoeLvOwCKCZ6KgEx5Odx5+BFuYL9SFqkr0sC6iUb4oXdKmIMWTRnsYsOLXFSX1MqxDLbHr9qteEZoQXaPNwfBUc6XNh61gC2PC8JWflfyXuYXqatgkt3muDbhEudDqSMhRcm0oz8nhryTbkUF4JGK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeQaF9XP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeQaF9XP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afefc7be9d4so253245366b.1
        for <imx@lists.linux.dev>; Sat, 30 Aug 2025 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756541995; x=1757146795; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yz+gNr9wnP1FuUv8NASxp4fC8wPUaxLjhsHiXAOzrk=;
        b=EeQaF9XPYPJpFfT1UIfm+aUo1pdA6NbGTBO3JTMu97FWL1IfFHv8LODhIxHy7ZGBw1
         6tl/B7O7LIvpvt6umvQ/U5vQhBDgePY1f7hxs5iA6BsoRgt7/OS2pNC1t0eWedlfivAW
         2vAfKt6SB506MdRnp0wOnaGLpDsdIB05pz1O/yuh07VS3KKA5Kxxnmu+sl/RlZC66pcK
         PwWtovWsJAlNtsOuDa3Cvr8bEJl8eAvvY4vFbxAqxPdVXio/yeUUsjdx/y+Ycea8fsYy
         uQJFoAdDNv55x7KrCixhuqZGcgSqqn1Mbdi0xj2vtrbHQVZoedNwMXPR3hrHDA6nYSqh
         7UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756541995; x=1757146795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yz+gNr9wnP1FuUv8NASxp4fC8wPUaxLjhsHiXAOzrk=;
        b=Xp7VURIg7RmoRYpA5QKkHmicuZmEjsn4jmQ+6w2Fm4wpfRRCF936hDT4U3EX15DYA+
         DU5ULkjSF8DdOTou7Hlje3bLXLEuuy/x+yU9o702Bl8AJ+aSAdMt33dHiWK63w02oLNy
         Ywx7JQScVjSLyLXDIhVTi0VrRNDuA3hbZ+y0vEGcEEU8+GFYchzqW96M5PU/Na6eNHr0
         oxBhCpDQwZYdhAVXbLcXOHz4Ktd/JK0uK/Qdg6oIRGsbd8V9O1hcHz75O6GFtmsK/EWg
         25CPBonHTSurMrNbkm7Ap+AA0uDXSH8GTqV6acLuGoy5ZwufhMd8XQxQUnYxgwUE8b+r
         Z91Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnZu02RT2iSuVy6P/I7ySuz1M41xPOqjg7XyQMRwwY7HljEdK9nQWnJZEuhJQZShBAVT8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqcpOJWg5htJ5/lXt+YxwbK9NrzfGjXr7G/JZTMMVlvGDwK6yF
	b1L/6hYiH8FxH1868ETVR7/UukvcEyLKf+tcEewrjJ2zcrsGeL/LByEe23z9w7SQK9pjar+saQ/
	ktdQK6bBy+h2dhxtezM4CiWSHb1I0LEo=
X-Gm-Gg: ASbGncuPc7nxYvFiMyyPVZ2MmDToOpUYbB3JLiSXsETVIVvblqZ0bsS07QkPOQ6V7lN
	9MNCz1B/L6eHXKwpJsvkb4tU234Xf2eTTDKAu935eDOPubqHCYa6XEEfsNY5LS5tpzEAe6Cthbe
	E6ULQzlcyv0W+WzEeDKizLb9WTWRIvhXo3sUvIvfAzUTEO6g0a/CmaKNWhU0AyuDsPQpBnNXP4c
	yqiyBugcfzcu+Hp6A==
X-Google-Smtp-Source: AGHT+IFZ0wex4nlRzxOc5BG8ARrUjGz7n83ilxsIj2vkPtuKrq3/+IPw3T+K7YRUGhLq8JMm7BCY/eJH8jBRTGRUUSA=
X-Received: by 2002:a17:907:d88:b0:afe:764d:6b24 with SMTP id
 a640c23a62f3a-b01d8a6a72cmr138313266b.14.1756541994858; Sat, 30 Aug 2025
 01:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 Aug 2025 11:19:18 +0300
X-Gm-Features: Ac12FXwW6CW7deBsm3Aef2wv7I2Olg4IsebLLUGVz2bUvR7gVeqwu6XUXgRk6VE
Message-ID: <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 7:00=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
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

Note mainly for Linus and Bart:
I agree with the patches 1..11, but starting from 12 needs more
discussion. That said, I hope Linus can apply the first 11 ones to
make it easier to continue with the rest.

--=20
With Best Regards,
Andy Shevchenko
