Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E31428399
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157064; cv=none; b=KZ0w3YuiBKB/pwRAtlHNpxZ+kqo9P7CdirYbmXV6em9gIfhokFU7/SVZyTAcn0y1zQm/BcBYgfzY94qlwikTiBfZ2RGdzKtSiLIKZk9mw0IDYB092ogviOQCnUJuOfxJ4Oon6k5Rtt9bZ0sWhmE0cBbrCAYSca2shmEMMR08fTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157064; c=relaxed/simple;
	bh=i5bV8DJtt0kW/7rs56nYtMMFUHI8Xh3Xhpcajvy4BqQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryfazzt1FVXFSOIJhRfh6dNT/zOSCWD66APGn5Pkj50kIefxq9JQ4YoWCOcVrk6ZSBZcr+eme7E9qJ0Jh8eO9qg8xa5rkI+7k3JaWZITi907OtvZtqpEhDMlN2oCR0FX747rOY7/zi7dGtVftQ/lTeM6GGgGOJnLni0a8+Wo4Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lJwpP/g9; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lJwpP/g9"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55ce527ffbfso530362e87.3
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 00:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755157060; x=1755761860; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6lyA0E3BsgF3c0Firp9DhkX0QGDczU/GAUF9m624y8=;
        b=lJwpP/g9YIpvE6huMriNlD1QV1ZL3+Pzz9J9ta1F+99MPN7LFMF95ohhIQFROP7Rym
         THPlMWhp8682VFmreJ72OtWrYXZoVie17TSgFdH920tMlSwrbSm9XA5PbvnMlXaQjN0X
         R5J871Qmz2GThRuR/VOJaU1T4ah59CjDYqG6ZISl+J3Yhc9H8Cxkm3T+YdVdN1UGn6Lw
         QfI30OtRoncI7DWQhs5khg4yQkn4VJOcdeRm+kyulKaY/wgwrpS8KRfcAKWp2yM04FHF
         GBAqiWsDi0AyJ6RHQflhHlHMA+xeZu8/t5aFNP6dJh54bBOSAkhwwWghMi/plfGjiWiH
         gGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157060; x=1755761860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E6lyA0E3BsgF3c0Firp9DhkX0QGDczU/GAUF9m624y8=;
        b=Aav1Y7PnRwz9Up/d7lrz820sQFh4UXrgiUDs5XeKNb4IspdTKQFrpBnGwD2cskG0HT
         C5YlYgnzy8iAwxilBqzS6khxGpMMxFEdslM7BVMqj9qpHZMMukdBWrd5epv/0TrUwVa3
         WmHbQzUyki26ImrgUu/nXNcy5xz5oIlcyACfRx9lWvzsIBKmWJ2agAcp2wmCh05T9kdi
         Wh3hAV0Kbo+UXnNwebjitedba0H4yKQjS85qxTRCT8wTww75OGZBsCloZp/q0rzsW3NZ
         fhCSFdGUwc1w9eMlhhUSOTBf5rFEv7v8en9qXwew/9iVK+kiStOwH4pohDLc19XQEx1h
         7ikw==
X-Forwarded-Encrypted: i=1; AJvYcCXd2lGKFRCDiw5FVqDe4/Yfl59VGDtl9aY91sx1qTZtUzi11FJ3x6iporIlpwhri/YrYsM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx84bdxuT+SbNwH7I34y/FQm9YJNjWZCzdbRtrQ/Hnvnyfrhuf4
	fqm4QgUO24VWlne6O8nunlUjAdnfvhtMIRpUGyN183qrolnKXeK05oQ/iCl5cwMWFSvbk1t0EZE
	mcGHTg7HVZCK36gU0ho+gAVinKf71DwgojATdj5o6eA==
X-Gm-Gg: ASbGnct6w2OuzUV9dBBSqIx5F+ryFUh+ReEwMjFnFfn8e1UNAHBkAB0KSaUYl8wM5Wt
	Vv27aOYWEAKKx6HjFNJCvS9+ZLd4n0kvXdEuqbmqXU10uxbIqBeb8KCakzS825gGJnnf1t6cYW6
	DFdoH0VMQlSKQvDLSdNIv+K/wYEInaAZ9aiM8/du07hQEayeBqPA3qrGfhXIZfyiUH1qxAJSrIt
	T6ytNQKHyYBaCp983gAXnLKBCQng99c8YtvIoI=
X-Google-Smtp-Source: AGHT+IH95og7bwOhUuHKkvwv0kTue2EveWatnb0pXZcfIY30oh+DnenMVeGiemPUTLNRulqOQX9vjsDh8YkJvs9r6SA=
X-Received: by 2002:a05:6512:3d29:b0:55b:8f02:c9d0 with SMTP id
 2adb3069b0e04-55ce4fe3984mr762477e87.0.1755157060157; Thu, 14 Aug 2025
 00:37:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Aug 2025 03:37:39 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Aug 2025 03:37:39 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CAHp75VeSA=AYDKOV5XQ5nnz7EZRmnhbbVyJrcBUcMO2LrRMTmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
 <20250812-pinctrl-gpio-pinfuncs-v4-3-bb3906c55e64@linaro.org> <CAHp75VeSA=AYDKOV5XQ5nnz7EZRmnhbbVyJrcBUcMO2LrRMTmQ@mail.gmail.com>
Date: Thu, 14 Aug 2025 03:37:39 -0400
X-Gm-Features: Ac12FXy2K4h4wcbTuyQHNLoBpmiM4n8vonnKvWP5_H1uDnS85jqeBZjb-G5DXZs
Message-ID: <CAMRc=MfzSq+7EY8cV+J_AePve6r+yV5QEHqG=Z2N8Afmy+Bc2Q@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Aug 2025 18:57:00 +0200, Andy Shevchenko
<andy.shevchenko@gmail.com> said:
> On Tue, Aug 12, 2025 at 10:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
>>
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> struct function_desc is a wrapper around struct pinfunction with an
>> additional void *data pointer. This driver doesn't use the data pointer.
>> We're also working towards reducing the usage of struct function_desc in
>> pinctrl drivers - they should only be created by pinmux core and
>> accessed by drivers using pinmux_generic_get_function(). Replace the
>> struct function_desc objects in this driver with smaller struct
>> pinfunction instances.
>
> ...
>
>>  #define PINCTRL_FUNC_DESC(id)                                          =
\
>>         {                                                               =
\
>>                 .desc =3D {                                             =
  \
>> -                       .func =3D {                                     =
  \
>> -                               .name =3D #id,                          =
  \
>> -                               .groups =3D id##_groups,                =
  \
>> -                               .ngroups =3D ARRAY_SIZE(id##_groups),   =
  \
>> -                       }                                               =
\
>> +                       .name =3D #id,                                  =
  \
>> +                       .groups =3D id##_groups,                        =
  \
>> +                       .ngroups =3D ARRAY_SIZE(id##_groups),           =
  \
>
> Can this use PINCTRL_PINFUNCITON() ?
>

Yes, it can. I'll update v5.

Bart

>>                 },                                                      =
\
>>                 .groups =3D id##_func_group,                            =
  \
>>                 .group_size =3D ARRAY_SIZE(id##_func_group),            =
  \
>
>>  };
>
> --
> With Best Regards,
> Andy Shevchenko
>
