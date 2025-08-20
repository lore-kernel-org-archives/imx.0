Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415FA2DA769
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755683982; cv=none; b=Ddb29cwD4nVo0DglckV0RGtfuheFRnQzLvmQ5OzFBEs4bWH6540zbabUtFXfnOvQeKl2E6ltZx+9UdnoOsohEfRLxUeq2oQGyZ5XZz0QKzQg7PwIvMuYaUB0R/HOMmXUpgC0bxUDy4LTADfhyZaoe1T7Su8iztV+7RiTQNz+uxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755683982; c=relaxed/simple;
	bh=laiWuyKWR3ASNPyoDieuVX6zxtjO9IOYMfbCtl3c354=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdYsvVTVNyWtpXxZaoPlaE3MQZ0lkARnUr+k+cKTPFjSd8e94uaFNRK0dd1bZiXyf3jfk40aahoVPwf+jgienFl9haZFyCQ+Z9sYR4FzitRZ2cVFXIunx88X8GlRI3JpzyaU5EcdyNLTkLTDKTf2OZFCTEMvqY4briWWAzPL0SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8qbIADh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8qbIADh"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-618adc251f0so8432592a12.3
        for <imx@lists.linux.dev>; Wed, 20 Aug 2025 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755683978; x=1756288778; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPSwHXJiuPboMvGmzdZl86YoheXT2JJemMGGCNbTXh4=;
        b=C8qbIADhHGGFsEe+dgxI3BaO57WX9Sx1u6qBPH34f8B/uejLc0s58gZ0qA1QW93Ayo
         oYG5Z2sodYCOyFcLo6G7vSKMrCll7MswsN1/GV9jAuyqDafjmKV1mrfuwEwRymNwS3hk
         IbyPztPlxFV9IlSNdc4TXDoeaUYYydAhallMFDnJVtNYy0Ow9QR8KcV71WBZz19Rd8F8
         YNbI42XukagkgAvtDEUBaK8vtzcd8Seo+aBZGlpCnJ/43SrjtGtpGqLACLLJhKfoj7QU
         AIlr+6UGXNR31tcI7u9XSgs/auhR9h8RPV58TDujfIwuBKdPcDYGoMZS9eXdqV2QU3Fs
         7NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755683978; x=1756288778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPSwHXJiuPboMvGmzdZl86YoheXT2JJemMGGCNbTXh4=;
        b=LXqWWJBnDb1d6IabIO1Zu7VwZ8E3Hu+M8dWAl5QFH/K1yemqT8eDCbE2+mRdioD5Oz
         drHXkX1wdv4T2+uV0G2AY4VLe7auMvOc4Jfck6WfOETDT38VXbdfly5FscZmwSBQJ7mQ
         Pz0VDJmPj4gMGS2Gi4du4nBRF0wjiqr/ZLII/Yfz4JZBiyHfYoobFxPF75E9VLGSZh2c
         CzLxZaAMwAtJ7zhNt5wWPC5oDnSNXbaWOXOdA8zmYgKHwftRVlhAVwoRZk0T59lEO6d+
         R/aIWH8SPYgfSgaJjQrHsAIq/l50FPRQ55rRFCNQCH71Yj7txRn9ilvQRVB/7KwbqpLC
         m+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2+N7ALvUScOPsog8ShwuWGYyCM8EoAshJIPlOATzUe/ei/g/OFySTPl9VIcmDnfJiZ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXzF0XbD9B5pU43R84SdZSi6YA4FUVGFc/eMw5mOjgFgT0xxVf
	YK9mCOyJfnYIk8LTRffK/rg/hMO9ei8P/gKRkQTRrcDX/NGrd8QvEgmGu4VidJ5yuGeeObIbjkR
	aKXurugmHS0Xt5Ty9q6eJDIot3YvsDMQ=
X-Gm-Gg: ASbGncvL4ooT4iecn5lvnpivbrOwICCDzkhTTRMfaLiVLZkz5EMrw8EYDGnaxDInZZZ
	eGI/NZNOvbUhJXpcm6IkiA/ujrVP+ks+309DP+f2hwa/pxB0U/RlIFkKbiBr/sOmA2LYnMO8C3k
	XexsnI+rE+Dgk9ZsBPNxAgt18iyVT8yNkbhPS4Y0dmmVePzepEGBaahRuF5xDo5CPbDrdnuMjmU
	Q0AJ4U18g==
X-Google-Smtp-Source: AGHT+IFLILsumUxXGG8Le22U8VXLfiB3UImn/sKCUBHCwulcrWRoCPLLCjJAWxmPAx6D8QUNkGdtQmpTps7zJUlvWzY=
X-Received: by 2002:a17:906:fe01:b0:ae8:fd2d:44b8 with SMTP id
 a640c23a62f3a-afdf00e1d0amr167565066b.29.1755683978222; Wed, 20 Aug 2025
 02:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com> <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
In-Reply-To: <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 12:59:01 +0300
X-Gm-Features: Ac12FXycXziPzAbLNx1s7hMXfLqQ2mmNzJaOepqBGK1kK3uBfF-tyE-7OZscDUk
Message-ID: <CAHp75VfNhBrukJ46ahY77La5Ywkeu1xiC_eUbUj99ZQcderHbw@mail.gmail.com>
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

On Wed, Aug 20, 2025 at 10:13=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Tue, Aug 19, 2025 at 8:31=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Aug 19, 2025 at 4:02=E2=80=AFPM Linus Walleij <linus.walleij@li=
naro.org> wrote:
> > > On Fri, Aug 15, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:

...

> > > >       devres: provide devm_kmemdup_const()
> > > >       pinctrl: ingenic: use struct pinfunction instead of struct fu=
nction_desc
> > > >       pinctrl: airoha: replace struct function_desc with struct pin=
function
> > > >       pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
> > > >       pinctrl: mediatek: moore: replace struct function_desc with s=
truct pinfunction
> > > >       pinctrl: imx: don't access the pin function radix tree direct=
ly
> > > >       pinctrl: keembay: release allocated memory in detach path
> > > >       pinctrl: keembay: use a dedicated structure for the pinfuncti=
on description
> > > >       pinctrl: constify pinmux_generic_get_function()

At least the above I'm pretty much okay with. Can you still have them
being applied?

> > > >       pinctrl: make struct pinfunction a pointer in struct function=
_desc
> > > >       pinctrl: qcom: use generic pin function helpers
> > > >       pinctrl: allow to mark pin functions as requestable GPIOs
> > >
> > > I applied these 12 patches as a starter so they can
> > > stabilize in linux-next.
> >
> > Hmm... I'm still sure that we don't need to have a separate flags
> > field, but since I am on vacation and will be able to look at this
> > closer next week, I can't look closer to it.
>
> The qualcomm 32bit platforms fail in next anyway so I dropped the patches
> for now.
>
> Both you and Bartosz are on vacation so let's let it rest for a week or t=
wo.

I will be available fully next week.

--=20
With Best Regards,
Andy Shevchenko
