Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D99288C8B
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 22:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758667322; cv=none; b=p5iWYZo3tGsFcTW9TLeUB+/IeyzgrUiB9CP8RG8yk5YHp8m/05L8QYRq1XCQfeSsGDBuai+ZTAxwkZmI7ssNCOLLEO6VXUwSarU+z0lWonCKEWUudXNITdeC+ZNQvfWeSqNeiTlkMz5+VppGUy0L9QV8m4cUxNTVWyu5y3xYT90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758667322; c=relaxed/simple;
	bh=6SWHpC7XT0boWgdfna8gc+pG3x0qlvgKa0qIbsC+iC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXd10aX1N6rJr79SQw7jPiOTA3dZS4mKN5qcNweBLIgyhePnQ5TDqnrMm5iEvRckebd+kd9zQlnFruEi8IenOBiWryrRWjvB9BvjQHMK6h4seacA8U2xZ98GEeOnsFyFPd9dZ8CLRSrA0Mp5pxY265ppTIUte3D8vFUD3YJKh/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dIq9Abn4; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dIq9Abn4"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-578ecc56235so1420529e87.0
        for <imx@lists.linux.dev>; Tue, 23 Sep 2025 15:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758667318; x=1759272118; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SWHpC7XT0boWgdfna8gc+pG3x0qlvgKa0qIbsC+iC4=;
        b=dIq9Abn4QZQbHIpS4GIjqljIPUFhmrT5ZDJwO8ueO9S9CiflyEKBIrWCGGedZWFCOt
         WwAn4alPcT0WVm9x9s7TODr5CvC0Vlbbsud5qjIoTDsBkqYnEawUIlKb/EkzHmJyaRrT
         XHjdy+JtyYQdBfPZZZ5U9XpbW+LQZZflT25Wa9k79P2rKxJuiJ8qgDkjgRqfSFoHh3jm
         YFe4msTHvQahY6a9bqPcT950FUBB7XIlJt9/BvIewHefptCcVR+04fAO9KeGTfIEnw76
         hLPGu6RN0ZMYJJAFT8HtyFYUn7qOwI/hi5nG8Wf7FY3F5p/kkTY7oEekGV1yeGUJuGBT
         iHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758667318; x=1759272118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SWHpC7XT0boWgdfna8gc+pG3x0qlvgKa0qIbsC+iC4=;
        b=gGANIBNXY2kLyPH/HPMVjVcazbYQgu3ekdXtA8R4Yb6tkCtrvfcuKXqW3vXKQQXco4
         bE4lItBlbubvIjeGCMJVKkAzzdM/aXOZ3DkGfOHWGh+evQSdu0yRBD5Iu7RBoRbvf1Tg
         vtG32gZviE1TM669jMsZEVOVdfan3KZ0VaApvdO+DhfbivyQzX/CqfNPomFVRGpJP6ZZ
         7qa3DeA2VsKT6A02agq+lK8o3Aj30ufpM3Y0qTY/obzASkpOkTIA11X6bOknJczgvwcP
         nvg1K/IV9FYaskEGhSYRKBdfC8CX7F6Z9imsswL/vHCpjRoKknM1K7LoPePkEbL1KOYJ
         hWkA==
X-Forwarded-Encrypted: i=1; AJvYcCVmYdGdDAhP0F5iP9kL6u1saxfbXLfPpCPUiTBbtI1sjZzRU4H/ymeHEhUQl4oOjV89EPI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkZsfOz5YmfndGydeyZMnQk2Cq7sBbYu8mJxfrYVBa4yb1EntJ
	j01oFdrNF/o/ZhKkUhr5XxcJpKM7MUCjLOC/+LlbU2H+D71rzYgk7868AmL2kAjKFne2B8Un8TT
	Fn2z/mrMwCKbSiELd63flg3cOOEXz8bfQfjU35/V0TA==
X-Gm-Gg: ASbGncvAWsnIeBDf6hSlS6aP9sNExo67Eh6be8rQ2gQvahuoVLJm4aSKSHOkqq2mFKW
	4uMab1nNRklOUcjwXiL2T4Db86nHkTqbZIMzN8cLmrvhsVkdGT+g64shcEAfkuerif+fwqimjM+
	8jg5AvEOvRkbwdJ4XFTzVZGAKV+q8zlsQ6rXOtSw/f/99P97k5U1fAzi2cWwqWMeeJb6rN2esJB
	DjxUAM=
X-Google-Smtp-Source: AGHT+IG99GeGJ6EJmRFtaCX57MxbFFNDKEJDSpjz4IOp4Xv1ApJ9GNzknCU6gn3AgKwY56E7tlVN9VixGw0iGQWzSiA=
X-Received: by 2002:a05:6512:4007:b0:57a:7be2:21e4 with SMTP id
 2adb3069b0e04-5807051c520mr1245993e87.9.1758667317970; Tue, 23 Sep 2025
 15:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Sep 2025 00:41:46 +0200
X-Gm-Features: AS18NWA87kQOtTQ-6Uw89hDflE_WXMd3ykrYMsrH2sWDsx3-k27OaCZ6EKQ1YIY
Message-ID: <CACRpkdY8AN5vRQEt=3QzdFdPkvx0FLiv7QmwZ=eqZBSn9sUtng@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
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

On Wed, Sep 10, 2025 at 9:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The (typeof(foo)) construct is unusual in the kernel, use a more typical
> syntax by explicitly spelling out the type.
>
> Link: https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-1=
3-9f723dc3524a@linaro.org/
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied.

Yours,
Linus Walleij
