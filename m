Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B642230EF95
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 18:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755628318; cv=none; b=gUQwCwm49a5uuFecPFnOUzycnQqK/BJQxaNbAIt+R6EdoRnPpV1mg1d9FYc7+YoCXmFu9r7TtSgdCg8jvA6RzKv3fZvLomeNlVsd03ND/57y4f8Huzko2F5SMl79/1g6CXi3gkN0ubaj3/NjGMy4atmZ6hfvVYu9rSTcqkKqQ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755628318; c=relaxed/simple;
	bh=ELVk40zB/S/lTRU9qhJakzcG7jLCkklBrhAYe+KgKyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTLOYpBu7RdkBHqnVj0YndDydi9VdsbbblrY2WJm/lgYaoQ9itH8BbN+RDrlYj/A2zB2Ncjz967qz3UHGR98Zv+1G89zAceYkMcLS8cPNh+sKZz7D8IRvsHaBkFOvCPiNtxfhDroxWj83WsZjxXX2N8SDtyk8jn0kDI4QOy5G4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FA9WYc7X; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FA9WYc7X"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb78d5dcbso797311366b.1
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 11:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755628315; x=1756233115; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nduGwRgCS4jl5SzExLMSPPD9EivCrI3lCOm2UzUncAk=;
        b=FA9WYc7X1vQvSCtCUIKM9X/rNUbV09tGGRoODRjjpu3ixfxabRmCKU0SWYhz7ndBbn
         P3LkakgE0+CCUBHYqDIDBQX5QS4mTtTWW7nvDVAakuz6LaxPNxV6/7JdeqHjdEzjlHBV
         5JlLCNit0PqmQuF2x2eg6a6fByhbeGJ7+cgbzSAv//SWopbYCAGivRgDwwUcwqcdnt13
         +5/Vue7FQcYxPoybPLYIaaXmP6d3qclMlvCXB/lMu4uQONr0innj1FCkFQQIyleDOuoZ
         2n96UYAJgBFqVXTDEQioUFj94QvUjW9DkfVjL0Mdka9vphibt4W4nqA1J9JUollfFXjg
         WLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628315; x=1756233115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nduGwRgCS4jl5SzExLMSPPD9EivCrI3lCOm2UzUncAk=;
        b=tIcwLUBjFSokiqpooGMhggPOldXJLCgxNUHKf0AgqHbXNJyli0HHk9HjThcLx1aJse
         VglYkPmHyn5Xe37lGHzoRd6XG9vyaSPBGD1vYTPLA8oo/mvFL2wFeZjryPhFvTZa7V5r
         pBuhkTLm5ElBad2N7MM1dpUWwQmRY+DvqjlSkYT0pRhdnkhQQpxSkTk3MmjGUM28cSPT
         r6hf0zgmK6eS1lIKlFs+emn2FbyP4Z8IbV9EnRn4CHwfLIDcRrB+ZmmjVprnfPnrx/Sh
         4xyxivSIngv0IyzbU8lQsosEguXe0SZPwGM8ALeB2mj31xS74mUWtODB+CQ9Ri1PUtWW
         lwlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbjwhPzq++x2UGzIxXS7vE0xeTobvxJ7/nXIYXKP4l/TFlZwIwg9WXqg8Fm9nZVmlFNaQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqBc53ObYXITNPFVQEz48Szgiw+kgeDCis3g3VFc9sYdSQrOyY
	V+UMCNjavMcg0Z6PXAyC49ahZJMUp5rx34u+wqg5Tngw03Y2PUmfw/n7si40XzVpa/NBwFfitne
	M/oH91hxw07lHfSOZc84VdPtogpGqBKQ=
X-Gm-Gg: ASbGncvkSOiHUjVljRCvjor2eVp8jQjfWlFU5JH9yIXce+PlXZK0Drh6yok6cZkWtkb
	TDp7hkwTYRyJE8G+4JDYE7R43FEHuKsJNsJv3D2ZA1sedXtU6Rl+CGz1tUXNYojtamH+ferHV+i
	50yQbBwq1YDNHxZ0XX0/8eRwun9AfRNLTLohQzeoC21Xf74bXgqn6z9/248m1RL47EI7vs847se
	vv5vgQ=
X-Google-Smtp-Source: AGHT+IF9qpemszLCjKdTIPsWz0t4GcsgIaQduXYK/rUO4127Ry+Cx5d3EXzVvEU87daLwDxw0y5nugBK0Rk2QA9qZjg=
X-Received: by 2002:a17:906:dc8d:b0:af9:1be8:c2aa with SMTP id
 a640c23a62f3a-afddd1e42e4mr344769166b.45.1755628314808; Tue, 19 Aug 2025
 11:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org> <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
In-Reply-To: <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 19 Aug 2025 21:31:17 +0300
X-Gm-Features: Ac12FXzsYRtjNObv84CHy6T-R0DRBoqbq7I0xmmsDobIVB43mAqIdnnlLv2k1FE
Message-ID: <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 4:02=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Fri, Aug 15, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:

...

> >       devres: provide devm_kmemdup_const()
> >       pinctrl: ingenic: use struct pinfunction instead of struct functi=
on_desc
> >       pinctrl: airoha: replace struct function_desc with struct pinfunc=
tion
> >       pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
> >       pinctrl: mediatek: moore: replace struct function_desc with struc=
t pinfunction
> >       pinctrl: imx: don't access the pin function radix tree directly
> >       pinctrl: keembay: release allocated memory in detach path
> >       pinctrl: keembay: use a dedicated structure for the pinfunction d=
escription
> >       pinctrl: constify pinmux_generic_get_function()
> >       pinctrl: make struct pinfunction a pointer in struct function_des=
c
> >       pinctrl: qcom: use generic pin function helpers
> >       pinctrl: allow to mark pin functions as requestable GPIOs
>
> I applied these 12 patches as a starter so they can
> stabilize in linux-next.

Hmm... I'm still sure that we don't need to have a separate flags
field, but since I am on vacation and will be able to look at this
closer next week, I can't look closer to it.


--=20
With Best Regards,
Andy Shevchenko
