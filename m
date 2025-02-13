Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA127540E
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739488119; cv=none; b=buL2isJiE+n2MfUIjcyvHTq9xhug0ZsCBhK7EAFIT4MEKdpRbIkgzKs4snROt/87tTFZpgpNlT5lX7vWk5N/VFI38cVE2iWs9eGA/R4fCkq8VbchxOJ/jO8/uuAl8XGKe80TB9TIzzGqpNVD9QoC+ueYHymuIea8fPLhRqfeR9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739488119; c=relaxed/simple;
	bh=pw5Trl6WSOLmRGktW/AyhNkYVoRUS5DcJhxwkCT/3YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSoR8wK9WoDf7FHSsl2sOIDTDDaqok2GugwK18+NmhaX0G2kwLJvpnnrX9W9kNJzSarDCP1CCRwLd/5mav7jWeDE8m8aaV4Wuw2a5jZD12oJmdjvAoE1d2vgr2yfSOP9Sn4CKrOmpQGAo5Vgqx8gcVXMM4W3agconextodPZtak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zR08ACWz; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zR08ACWz"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-308f53aef4fso13813351fa.0
        for <imx@lists.linux.dev>; Thu, 13 Feb 2025 15:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739488115; x=1740092915; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUBjtT51s4wV2MPoudnhQZ28ji68QbGJUnDNgh8IAN0=;
        b=zR08ACWzfHcIucdj4pewrLNhOP5NsZwkKAB8raQN1+HcGlCjk7WK02koZKcCPfb2XR
         HxGEDzx0+DLPHrq692ons/m6kPTUlJXpNt7BnCssB7aCGizqbIYqHEkC2z2fi4qCIdNM
         pqtcglvkZ7dU9E13SnOb9Bfgob1EXjrf7h9DR/02NdXaPA5+Lql0cVgdNDjVnEbA1JhE
         eMvDqIJRfYa4fCwcGRtQY4z7VErwWQPYgsfpAhxCOrtmDa5hMcBj9kxNe8NDL6iDDw+Q
         Fvgsng3yQ/4eVRHO927XBVXLbMBalpH4rbdxIdwF/mJQcdAb8FdOggb9ESmCNwXckhfm
         WUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739488115; x=1740092915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUBjtT51s4wV2MPoudnhQZ28ji68QbGJUnDNgh8IAN0=;
        b=hLdTPvTJNHczOn93wVntwJVe7a1iF1Re9XNyqOhwghCwR9sNOx8KgblXv+OIlRUmsl
         4Fwf8yGIIG18sBhK0yDIYg5D9jGTP9JNVhEXSKHFchRkfrkzOuTHSOx2y/XRM54l4Kin
         eu+T+mBDBDryTggATe9BVfFSs8xAmHCh7B6PFnj/52G/Th3kH+Jj5gGxK/AJYuQBTjrH
         2l+xkq1XZ58GHTg8LnQ+nkhSIh6uvaLVR8q9xe9V6cneXL4M7qwdviJ9f2U2nAzKtgWw
         Eaxts1FMcvj8slmQKEp1SZDdYaYfgenAmNv/cVwBo91YsrYA0DBMuRXDW9wrNjshbWsw
         /aVw==
X-Forwarded-Encrypted: i=1; AJvYcCXo3UdWo0ZvElxGm6H3l9nxp3G86s47FUVUGwwAKXmF8T44VoS6NY0uidxons7z70SlBJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm3gfCGE7WFqjRuJ3LWTarvTTOS8U3CbIig9Z+qQMfiTpn/jUR
	FvJ6z8TbsHLMtYQ0IaRW/NSF9C5Gpo8KhjVedbATBUrlhFxu14jIisf+Ty1GpeyKhXmFuedzlzE
	FY9x7RLgOQ2QJ7GZ1/njvlfjdlDh+pfP9c5Pl6g==
X-Gm-Gg: ASbGncu3S9QUfewywroQ3eBFZYtRYu6/9bqzGlCliJ/30+QoRQ6ZSG+J4jOalIm99QW
	yw0GQocjWmivIlytXAwy6cblw+Rl7CKT4XoPpX6PDrONEbnH+c0trRHwPRUQVKsYFQaHzvT/t
X-Google-Smtp-Source: AGHT+IEVWXCqJrvxsHxcZL4ZxvM2GsuebHsyj7dz5JO7/xqltXyqdp/l2Ux5PURb/ieBVbdSBfLPkgDfAXIrq8+S/4E=
X-Received: by 2002:a05:651c:b23:b0:308:f479:5696 with SMTP id
 38308e7fff4ca-30903654242mr35095691fa.15.1739488115501; Thu, 13 Feb 2025
 15:08:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206181714.417433-1-johan.korsnes@remarkable.no>
 <CACRpkdaNDJrGZ4Y2PPUWQfm6BprfNACYWD7srs3sYHMEsdX1Ew@mail.gmail.com>
 <DU0PR04MB94963632094E71ABE730631990F12@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <CACRpkda7ZRR+1_6bJN+qgrsb=GQyyujg81uie6n5rX_U3tAynA@mail.gmail.com>
In-Reply-To: <CACRpkda7ZRR+1_6bJN+qgrsb=GQyyujg81uie6n5rX_U3tAynA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 00:08:24 +0100
X-Gm-Features: AWEUYZkfplyaRnifHzEv_qQadNa-hUxm_UQdgzSoGXyUPeH2JlW8BW7iNBD2UjI
Message-ID: <CACRpkdbCDOPGJ7wzicYcE+HA8vLVKoZLfNB2BiOY9KbYH93=rg@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: add locking to gpio direction functions
To: Bough Chen <haibo.chen@nxp.com>
Cc: Johan Korsnes <johan.korsnes@remarkable.no>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 10:45=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Fri, Feb 7, 2025 at 7:21=E2=80=AFAM Bough Chen <haibo.chen@nxp.com> wr=
ote:
> [Me]:
> > > I have no idea why this driver isn't using gpio-mmio.
> > > Not your fault though, just pointing out obvious improvement opportun=
ities.
> >
> > I check the code, for vf610_gpio_direction_input()/vf610_gpio_direction=
_output(),
> > to let the input/output really works, need to call pinctrl_gpio_directi=
on_input()
> > for vf610/imx7ulp/imx8ulp SoC.
> > Refer to drivers/pinctrl/freescale/pinctrl-vf610.c, it implement gpio_s=
et_direction
> > callback. Also for imx7ulp/imx8ulp pinctrl drivers.
> > This should be the reason why not using gpio-mmio.
>
> If this is the *only* thing you need additionally from gpio-mmio
> then what about just adding a new flag to bgpio_init() function
> in <linux/gpio/driver.h>:
>
> #define BGPIOF_PINCTRL_BACKEND      BIT(7)
>
> That makes gpio-mmio call these callbacks when setting
> direction?

It's easier if I demonstrate.

I wrote patches to do this, will send them now, test it out!

Yours,
Linus Walleij
