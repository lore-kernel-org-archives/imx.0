Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2041C2D94BE
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884899; cv=none; b=SDVdekpXHoU+VfTUKlbILnFCisQLZut0PMQtUhqpVK7gU8L1djILog4q3IANpesiOekeMrBw/+UKBgK9r0EWeBV/n9HCb0vZ/1obrIZsLy0GLup7p04SyERI02Uxethuax/qq06iLJH/6NLkWlqijm52PxzRHQ//xCqF/I9JxN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884899; c=relaxed/simple;
	bh=KVlTZD38YWzAz5smcQFmlr3HoJ9kXtqQrAAT9RQglt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDrzDG1nMBMUryjRmeSkJLn9L1T7Xz9Yq08ogFGyYW8xJuF0x7o+uwa8wrWX/tLPR05Or7sQ1ZTY1fcsmAlLqBBpGU/tEDB6c2CnnI4RfUfSKcFlWgQ7m92l0tMLDGLiR0y17tZAClq1qUDU9BSxEo2fi/Jz+Zc3hCBhDJ97aQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-531fe8d4619so589239137.2
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 00:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884896; x=1757489696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+a63vXZQbYfBRMYForQk38b20jSe1QhqlF3QJeCGYE=;
        b=ucNDNe/H8XjRpwiWDEWBi/t/4t+Z39uDqFCB+Z0tiEcDEVxrAYHvHtMelTL1GO00QA
         wLIXYUy7VhNBgh5y+I/c8rZzYg+Yvze8bzMLd1zOQzR8xQPxg0Jh+Hq7mqQR7iszTWOx
         IenIrgOxkZXZvG0sFpcjOxCXlBbYXQz77CQ1v07idpLmF2+tnpjprAKZtLH6nmftz3sT
         omRX71nPjT0R1P/fUFVSzoXpoSLJK2UCFoWHVyRhWHidausjguZaGkbN9q9mIAgYkdZ+
         EFYDOvIiIotCsHyt0th42hpgiX5HwyOXT8m8XV70cZh9FcSmDAraInYVqCKjTCJJBKhf
         IiaA==
X-Forwarded-Encrypted: i=1; AJvYcCWcshwT5bQeqenKc9jwzQuEEXupyMi1J5YbB/p7dZb/Bt79XzjswgQP9wBJs/ydpMJjoaU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxpy+m0sFE9CkAeeC1dD1Yl6EuixPJ1FHoC5xFti4HR0am7d7N
	h33zT78UP+jPYZSvIqL3Jy5NfbJq69HC9l5aQ8X4RVUdj4V9MoCElRvVyZsjcXmO
X-Gm-Gg: ASbGncuAe4qleMxxWWS/A2gFA0azIGspH6QVo85HUwoo4fv5hpqikCUYSP+POivM6Yc
	D3vqISaqEjCGkVNk/+jczdDIxtJ/Bk3gZRSJ5T8DJL5FY3DAhHzC6PJR/eDz1eZhOAVYuK0k0MT
	uOuH7ai7MetBfeQTyYiANTHOTTM6lhaSevMu7NN6VyRNtAy0nYYvK7FLkQyH9ysQV+zg2stCabu
	8ZJ2d5t7223foc56K1/asCUbx55OciyXbWxMnbrgZI62hLJHjsE+VBP6mEtH0ejWOCMai/Iuuse
	Jsy4xqHDwk020qmS1kpzQYNEAOQodnkGV/xbij/LcuqBLsGYSw+AUaSY6G3VnRtlqwMcXRHsFMw
	3XOXYiBsWww7nYxoAASNc+1iSSSl6kBdFGHyi/eG4TJjxs2jrImpMRnym07HWGb4QHl2AA8s=
X-Google-Smtp-Source: AGHT+IFZjx845EACspN14aKor+BtmxxciNT6JA2OSCFsiwIVL0QIH48b1k93LXIynNL3tspo/s2HTA==
X-Received: by 2002:a05:6102:6050:b0:534:cfe0:f87b with SMTP id ada2fe7eead31-534cff05210mr165378137.4.1756884895822;
        Wed, 03 Sep 2025 00:34:55 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52aef458d62sm5115686137.3.2025.09.03.00.34.54
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 00:34:55 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-895fc1c8f05so2246074241.3
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 00:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEoRspvIh1hinZUBK+hagwmZhCqZCyoPKveiBXiKS8z44iFbKAQdfOcHn1YeBJ2pNkcEc=@lists.linux.dev
X-Received: by 2002:a05:6102:3581:b0:524:5266:f74c with SMTP id
 ada2fe7eead31-52b1c8811fdmr4486002137.31.1756884894118; Wed, 03 Sep 2025
 00:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
In-Reply-To: <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 09:34:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUd1PeUbdkmrhaFstknwP2x=03m24gacJBJgEeCDf7toQ@mail.gmail.com>
X-Gm-Features: Ac12FXyh8sb0bID330gK0HQPUvNSBJ0mn18x9ggidNhkopon3DqspiWAPKYplC8
Message-ID: <CAMuHMdUd1PeUbdkmrhaFstknwP2x=03m24gacJBJgEeCDf7toQ@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, 2 Sept 2025 at 22:46, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
> On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > How does this keep (or allow) I=E6=B6=8E generic recovery mechanism t=
o work?
> >
> > What even is the "generic recovery mechanism"? That's the first time
> > I'm hearing this name.
>
> "I=C2=B2C generic recovery mechanism" (I dunno why you put away the I=C2=
=B2C keyword).

Your original email had:

    Content-Type: text/plain; charset=3Diso-8859-1

Bartosz' has:

    Content-Type: text/plain; charset=3D"UTF-8"

Note that the Gmail web interface does show me the Kanji character
instead of the intended "=C2=B2C".

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
