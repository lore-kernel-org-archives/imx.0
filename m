Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2651B1A4F12
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758786731; cv=none; b=Uvww0xoQqRyoio1KqlqT9Q3jO/NNPXL8CSi90IuItEWAAVAW6BqzSi0Yc/Cw+3BD6gz/eJDdFyjipIRT2N9TYsabf9gfqWkY6PJvazoui/oSC0L2gbw0efCLsW70zbuvKgAoTOvWkgtXhdpIKztUS9g+htOyhQ2aRhxoS+w55oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758786731; c=relaxed/simple;
	bh=Umxh39nHGfkgypJPyOPbacKoWCRJ+9b9PmAXkmDpko4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODBe67xUmCwrca4qHNDWRi/6Nu5msApqYTN7+cIsGgtGpL17iI44rJrCX1N6gEN2zNHoYR7G9lo/iIXyZ1Me5nbWNjw/9YXx4eThH5THMpJyTvrG3OnTm5JKHj9HY3AzDtwDN+KqgC2BGKngNC13t4WiQSaMTa5l9nHQcbzbEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N9e88Xma; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N9e88Xma"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so663518e87.0
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758786728; x=1759391528; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=;
        b=N9e88XmasiZxEZ2AteCsIoNUmj93Opv58udyFAGaLtaSdCVRePJgJKL7Omp2DHFaO+
         mK4ikRq7f/R50jkyh4AMmS98K0w/OD/L1lQQWRUc3EtIBc/n6zrTzFA0jT0XXw5MLyxj
         ZsLddCyRtK/DY2y3pog2k4DE7mfoAba7Xy7v7p+YS5Gfm63LDxXzvOyVeUfNRW17Heom
         hXcZtJe3srv4rzrt4ISIIF+VklUPbpZgE+cSfDcxxCkDPhAOwhelmtx/zMf1o0fCftDa
         /TSqaaze1I+W6STU3AKekTh1YBGo4F6XoGdOu5mYkMoqoeJX/BC6aThUCfthOwD/ZJo0
         LKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786728; x=1759391528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pmdbPSS1+PFGOQZXgEhCWxoqVsYqlqHhZMSV2rIROA=;
        b=U1tjwvbCujNLxizdo8+BNkXR6gSlBGg1IsJpNVXggh4IHsiQ3slTRNke5MAsz9Enly
         WWPhnWdlI2ydeN2QBmjU7SRV8RA/NJtJK2hdGYI0M36VZFC0s/jG+0mag7Gdgr+ErgGK
         RjVKp7PMrTwnh4WLkqSYd4Mb6sMxfYLTvXDGRuSpAnfqLgSDgZcVTGX1KScB6hdbwRwD
         audxsV30tMxwOyVvEtOzaRIRaOI6GVMkyVDigUoiH/67MkilwhrAbcAFQoBtZctpu7Z4
         ZeNf/kapUnnWnnp1u1JfjWDHQgKW2uFWCjOXCAgrumPaqYeM97Z95if002HlmuL25Q+P
         Ir0g==
X-Forwarded-Encrypted: i=1; AJvYcCX4UouKSCJMSPDNTNpdrZ6aJ23Sq6u3+OWB7+W+sJl0OGXo+vyixcDj6Y3UvyhWlfHw/z8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOvOUFtQs6jRKWbviEruFDPntwCTSI4kqI4XORL1iVm8+wyA+d
	SlZt9kxoW4Dk6Emrf7bFtJ2y3WXKQNlZv0/OIFYw+la78qWQKQ7di6M+32B0eJ3zclpNIDHZ+Cn
	tgyMbNHXsShq3WjuekrN0OizWYfRIJNlAhxuO4hiuaA==
X-Gm-Gg: ASbGnctgDsdb91Tgc+u/BCrLDSKrMQszD8aMNEvxSkEt0RtZudhNfrCiGa/KdSXUzrE
	yVLCyms4GOQCiobUZItVwRwHlB/snuEJtQbAqwaLu9tp4AuRZEc/imoe5MiYwebiYFu1vcAFnjY
	hMZfF7PpJlLtFasirp+xuS4v+FQQhi6KoDCMt/PYUVBTFqDYLEpQUB8MPSjYm0VES6M5JDM2FcH
	hfyDjCADKn0HUD9k/mnqawLbagLg+8HLAshHg==
X-Google-Smtp-Source: AGHT+IFjDFQMappKZZFROu+v6o3bME1MjtTxrIbJ3f6pWVz6MpCD55Lk6Fra5LzFmOtZoqCjtC5vbl0PRHtSU8AsH3Q=
X-Received: by 2002:a05:6512:3a8f:b0:57e:4245:114e with SMTP id
 2adb3069b0e04-582d14effcfmr700774e87.24.1758786728179; Thu, 25 Sep 2025
 00:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org> <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Sep 2025 09:51:56 +0200
X-Gm-Features: AS18NWCh67p36-1DiEra54BRYeOZGMgpqlB-NSoS3MdBtkk6GMB-z9-7UGdMnvw
Message-ID: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	James Cowgill <james.cowgill@blaize.com>, Matt Redfearn <matt.redfearn@blaize.com>, 
	Neil Jones <neil.jones@blaize.com>, 
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 9:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Thu, 11 Sept 2025 at 12:02, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The (typeof(foo)) construct is unusual in the kernel, use a more typica=
l
> > syntax by explicitly spelling out the type.
>
> Thanks for your patch, which is now commit da3a88e9656c17a3 ("pinctrl:
> use more common syntax for compound literals") in pinctrl/for-next
>
> > Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1=
-13-9f723dc3524a@linaro.org/
>
> Looks like you (slightly) missed your target. The correct link is:
>
>     Link: https://lore.kernel.org/aMAP9hAWars0T83r@smile.fi.intel.com
>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Hi Geert,

This is a link to the discussion with Andy as per Linus Torvalds'
recent request to use the Link: tag to point to actually useful
information rather than just the patch's origin. Linus Walleij doesn't
use b4 so the origin link you'd normally expect to be added
automatically is not there at all. That's probably what caused the
confusion.

Bartosz
