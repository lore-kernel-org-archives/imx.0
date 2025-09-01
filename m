Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57105277013
	for <imx@lists.linux.dev>; Mon,  1 Sep 2025 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756732859; cv=none; b=PA1wv8DrkR7Z2Bx0iVOtGGswrhmfmwo3V3rM6amVvTze+D0q8e3MfIyREXWkgM/w2gSa0xjPtssVxp+sLp0s2jq1xEzI0zz3C/l9g+ag/ggHqIGRUCCObV2pb758gZw78PBCCWHEy0LKw74ILJJtdPI1+DfnLa2bBRGyLhu/UWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756732859; c=relaxed/simple;
	bh=+FzHD6P3GIG+WbvurBqu4eNuHXM1ihNGPdVL0Rl46EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYr0+VPU+G37r+xMs7ArdU1X3b43c2KOipxEcSrxqqua5THUwzOAyIob0dWFXElKe7lwEcMDrf0jKkjwY1LeI+XOXLemICrlLTIudEFzq2xLP4i3zZoMbiNdhdOopcqbKdPuHEFeSRFLnccWpkJcilALgdVFfMPWjndKo5yUkiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bcLBy/Sf; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bcLBy/Sf"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f78f32580so908629e87.3
        for <imx@lists.linux.dev>; Mon, 01 Sep 2025 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756732855; x=1757337655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ApJifxHePLgmXB9tTWAWedH0XfL5fOO8paxsOA3xkw=;
        b=bcLBy/Sfbtx5Z0N5WF7xPH2yzIb8Bxt2FKZGsyUNPgNhajJTzKfck3vlJpVBZGH+ND
         3kZdNDaBfcuyU2VYA/dxHqhhQXMCsRFnNUcrgSZO5hQ5Pd2ur2rAjlryA60AFIdvx+r2
         S7UoJlSJSbtJ5Sdtc56FynFwE244u3k/wgMEidsbL7i2Xk+BV1F+3UQBkXjLCaJoABej
         Wj1P48BAE07tLvLFDCxvpGLMUQHjzwOuiIyPp9u66M5XjR27Xrun5CX0OOtII99KCu89
         gzcovjbAtHhrEfx0Ge1dvPgksBToVP18np9eP80Dhu4VHp43bZP3IaJ66L1fyiGsZfoJ
         cTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756732855; x=1757337655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ApJifxHePLgmXB9tTWAWedH0XfL5fOO8paxsOA3xkw=;
        b=PTVS+z0jfECM4nW0G41v/AZWzJQKmhi2hYwmgy3RDGyJBJHVuhO3ROmgW9MqfGNvYH
         PS44uWi5UPzRFIumE1SxsUiWRuhjtmuvwPBoF54fLCCmI+24zsZZpCoyEhPthFejNQ6M
         500J+0ZUFh4x5xr7pE01dtCepVusSvkkyK3gZJ9Bhb1tl+JYad+ewhd1kzeo39exliCa
         8qPjTBPMr7Zd02Kl09zSu+GhzulaAA5VgN+cHLmDpBuo0sAATxXS+l8zXJn+DirdeKS5
         hvpunKxyTz2gg5WiXXaBMqZ+2rlDIOVCBWDovzreJUglyAa+usrlP8OUc+zRNiu1XpAK
         kBzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfckNoAAvBpnTQOrEBKhZw6yT9PSv9tRKOqxYn4uUpGYm5AuWWHhUgAMmZG/NHpZRXsNI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy54I5nKWJ1f+sVsE/yCZllGsY6QlGSgy256HejR/vDly34fQ2e
	275iWRWibhGwO/ludYzs+UG+HQtarkQY7AM/9X+BtAWOGQHCTurEVwbmFZXe56BT7HWrbiOk6vY
	FUm5Xg7MsaDe6YfpylW+FtlmjCm4jcMTzfNfNJ1xBwQ==
X-Gm-Gg: ASbGncuEpmDwi1kx0y4MGnVdNobDvEscISQNaJo89BspkT6fnNPaSj94dL+iLILDs41
	7MOV04aYqWrJESFduw+2P5HX5nYev8i9rgZZ7d0U8p+MDT6FaIge+DVThJBkLS6dYmx6o70sJmx
	Km8G3zlRqSvs9Qu6VrooMrR9Rim2p0THvGLzzhsd7t2+WTAJUwAwSgZNjUJMTwV/9pnhuuXtPpT
	zJvC3E34ohSUolZsQKgNNJqjpT8tQ+wvZgd0Oo=
X-Google-Smtp-Source: AGHT+IH912XrSXzjBk2qT9512Zc2BnDvh2hCyUh1tIL/e/b5XAWzm9U6VOUb2k8kMnjWcaLf9C4w4UWLuNtsABXzYyY=
X-Received: by 2002:a05:6512:2513:b0:55f:4016:ad2b with SMTP id
 2adb3069b0e04-55f708eae52mr2361617e87.30.1756732855435; Mon, 01 Sep 2025
 06:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org> <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
In-Reply-To: <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Sep 2025 15:20:44 +0200
X-Gm-Features: Ac12FXxw4k3UY5TBARAefSnKyhMDuDCBaUNs2qyNKYW8yrbkHP8etuyQPhIAuGM
Message-ID: <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
To: Mark Brown <broonie@kernel.org>
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 2:07=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Aug 28, 2025 at 06:00:14PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The radix tree containing pin function descriptors should not be
> > accessed directly by drivers. There are dedicated functions for it. I
> > suppose this driver does it so that the memory containing the function
> > description is not duplicated but we're going to address that shortly s=
o
> > convert it to using generic pinctrl APIs.
>
> This is still failing for me:
>
> [    0.628221] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000000
> [    0.636506] Mem abort info:
>
> ...
>
> [    0.801855]  __pi_strcmp+0x20/0x140 (P)
> [    0.805704]  pinmux_generic_add_pinfunction+0x28/0xe0
> [    0.810777]  imx_pinctrl_parse_functions.isra.0+0xf8/0x4a0
> [    0.816289]  imx_pinctrl_probe+0x404/0x520
>
> Full log:
>
>    https://lava.sirena.org.uk/scheduler/job/1758025#L704

That's not a lot of info but it fails in strcmp() which - I suppose -
is the one in pinmux_func_name_to_selector(). Any chance you could
check what the value of np->name is in imx_pinctrl_parse_functions()?
Is it NULL for some reason?

Bart
