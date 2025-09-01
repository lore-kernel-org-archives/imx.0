Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E4A320A1A
	for <imx@lists.linux.dev>; Mon,  1 Sep 2025 19:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756754558; cv=none; b=PUvox0acXKrXmGC3eIzrmmIArYTPDyvoJLzJqVNdt1gM/G5J/16EaIrVGi7V7rDlrV8E576qAFTWl8BeHlPeb2LPmc8iGR0iD+DCesdgBbBaLMKephN29UAd5d2FpZUMKhUWvEihhrtE488qsNKp+A9LkAVIb2OSLLa9MZogc1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756754558; c=relaxed/simple;
	bh=bEgP0yvmX9KvAOyKB8kFlw77eqxGqe3qY7fzx2tEl08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxBUSkclh65wnrA++W2TS2RV516z6p7pW+mmk+45KsBSMLDncMtjM2wtHT8IDeZCgk/GB7oJqAX58cXCGR1xjFBRcNH5ugSaW38gkaMz9FM0aOV7Amm0RTKzJ9/BPqhK5MMxnMmTF7cDo8YwjFX2+VQX56jnrL7HAD/qgI+sANA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IlWltOmk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IlWltOmk"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f6f434c96so2476952e87.2
        for <imx@lists.linux.dev>; Mon, 01 Sep 2025 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756754555; x=1757359355; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=IlWltOmkaEjd+53OqCmPSbCWWiqvCgDy+8BmLeb8kaw2aemNTuu1Ab55XMUwwgguqD
         ot4DBQA/iOsMK073L2aBcCRSRfpGm8DTecsEnHKfjVyRO3v41ow27JF4GSaUQiv5PiBM
         xALbNUFbnHg+r6IGAEOG0/6U9EtMq3aRVorOfi95U9naXz9NqMoy54MD8NlQd6cwtve9
         YVoqQjM5aDmD+NinSh5nC+AWzwsoHh+Ams4NJ71VSznCMMqjp2K+2SZGSG2epQ3ruP2I
         Azjjy4YGag2MhnFmkR69uSLsNrq7Ev5XH5jnBC4zaKd9ltw4GPi+y5mpfTd5sXt3BtBY
         C8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756754555; x=1757359355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7ewcbrPHINPUvrYPT4zyhNXGIzXoRLTJHpyb8YY7mI=;
        b=iDcgH2p8FTihxAUY35aZlWPs3cHycf5rbt2b9Ty818E18RYuMpKVCSJlLZrv9rJ7+K
         7sfHcQS36Gij8+rdUZZULWmMWMpMD6FtaC0vmzC1gfoujvlj5vSyZKAorV7h+c7Qyr9W
         2u7ea8qaDG6pBcBZdg1FHItFWCRCzJ/KS9dkzpQ5R/k7oy9/H3/l7UyOiug9CkpmFDBM
         oN4qn/zRszpzDe39RxQ0QM0yuhuv6souWvCfoEXAN+Vwlu3sCrRHczaS1bZDPLBG7D/F
         U40mfCmNgJrucyn8jT/IhTeZ0zVsJs3SHhhVxwAWLoqTxGPhGOXLnw9KZ/6mIhDpwORE
         MVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLo6zSL9xbzBF4jyNE2ek61hiIIlLH6X1uKVkaCNqiUWpfPlQ3vybQAuHtUn6GQ9djUE0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHLTR2hSF8K56TOBa85vaI43CoxIIjpAgwJRXvyt555LUyECix
	UofgKf+zMFA8Z1pM2Rb3AYistv3oN0jC2N6JnCT9W/O5S/LwurNNNn6LuggN2j/Wzi2kSZBMBdk
	SGZXD/wk81aRPZ2u1OfMc66EpqlBY5nCxPYr/7Gow8w==
X-Gm-Gg: ASbGnctRQLymUOwnFiOZUj/y7v66sf7t5wIboXArc2kywpwQfcQoKb6K7cnTzv0VF0F
	gK5C9nxqxG7Yp8yLAeeaLz/TWVeOCAss7NfjtnNfa20Y4JZ7kUBiDaPg1ZTNek/4bHvVGErNpXP
	rANoH05OHX07JClv9iv1dWrkQvbSGgEcBt+yy45UGnjylsYUeFKVtqRK/LJWpkPdUyVSLEZMuDy
	wgb6AYfiO6/DxVQdkQMIog3iozmKUD6YOClQjXOF6aZ09CR9A==
X-Google-Smtp-Source: AGHT+IFcWj/MxjmrVdPmxch8QritOIaLTRMlhZkDbys4s6fntW4mvCl/nwD9FPfF52jhBYUT32dL+MvS1Koz6TeQoRU=
X-Received: by 2002:a05:6512:1051:b0:55f:4f46:9f2a with SMTP id
 2adb3069b0e04-55f708b5e26mr2212325e87.19.1756754554484; Mon, 01 Sep 2025
 12:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk> <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
 <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
In-Reply-To: <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 21:22:23 +0200
X-Gm-Features: Ac12FXzmS2jWw7xFpjYhhy0Ln3t9KFQZe_l3JIooPobPNCmkv86DLX_8q8OSWPk
Message-ID: <CAMRc=Mf0dOvwsWb6uraCQXeauLYP0TqY6xsQnV3fM0w=wROW+Q@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 4:37=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:
>
> > That's not a lot of info but it fails in strcmp() which - I suppose -
> > is the one in pinmux_func_name_to_selector(). Any chance you could
> > check what the value of np->name is in imx_pinctrl_parse_functions()?
> > Is it NULL for some reason?
>
> [    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl
>
> https://lava.sirena.org.uk/scheduler/job/1758947#L705

Linus,

FYI: I reproduced the bug on qemu with an older ARMv7 IMX SoC. Should
be able to debug it and figure it out shortly.

Bart
