Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894A1284695
	for <imx@lists.linux.dev>; Wed,  1 Oct 2025 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307817; cv=none; b=i+4LC3SvOoN2JXNdFOSbIhwxmC1mrwMuoSNAECKiXhDpuhRVKnQJqRvlCyASgXWj4SJVKlXmp6KH9RX3UeHKOAAGTtgShECTrzraGUlN6b/lk8KSCIWv3cXcQIISeGVbwykno//u5g9myZcSl3yltjh3TwOdwWtV9NXqCoNpD70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307817; c=relaxed/simple;
	bh=gzIdYM+jt7Tm5Uc0vWk+e7hcdztHdOIk7pXCG5DPn00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iu7kBZSFN8mOz2kctoa9nyO84d+Dyn+xbJKTPl+FxHBRdU5UrzX0kGkiGPa9Ivd9KQNh4jrYuDnQn9F9UX5vgqTCxsLfBDLVygVRZXJfp55Dq7ZeiZd6ylGy4Q5qxfk8o0bbvCcGWJDrY4XUe7zEvmhGRRyyCBInRUef472AiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vW3Wfl6j; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vW3Wfl6j"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-373a56498b9so8836251fa.1
        for <imx@lists.linux.dev>; Wed, 01 Oct 2025 01:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759307813; x=1759912613; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzIdYM+jt7Tm5Uc0vWk+e7hcdztHdOIk7pXCG5DPn00=;
        b=vW3Wfl6jyQa30hQ3ITEO/vqgUe0c/zu6xVMlrkI7UxrcNdLmPOyst7nwt6pODNz1PV
         oOplbCOApDS/yQ+s4cs4U6x9osgAmVmPEdk/cCyVyF5M3+6YEMi8yfXpBArDxPCYhn5w
         kUJGr2JYyoXy++XHu5ig5N3lBd3ybAKlVXpS4VXRrbywBhUPZVSlkUoMGo/2ZOw6kRvA
         qv6/vso2cPKP77Ny/4kSCeaoI/DAxJqMfTCccY4Rq+UekSBWTS5xb+rvBUPa4V+RdwHf
         TXb6bNL3ue1yVHkUc/r8AoOHCfwfSNCiahzu2nScBqrFlmTqap/XYojjwnJguEckqwnY
         gZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307813; x=1759912613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzIdYM+jt7Tm5Uc0vWk+e7hcdztHdOIk7pXCG5DPn00=;
        b=g4mGUklmKm5PYFd9QeWscLSsqIxJTRkH5uc9uh5r9v9zH35rcHLZpz/PeimFYSV6NQ
         mEyY+sFBKSj7eNV/Bq30h5+Jplo9U2JiAqyTkDGw9wsqQqQfBcE+sa90kWa2uouzOiK5
         NdYq5FL8w7o0ehnbgxCsutpEGC0D1/R5m9BdYy3UXRltUQ111vc8qsl45hLaPt+Qx0lF
         pi/Dw5gF3Fp9g22bPByvgOBwSwVFKuL4d3bt2nWQnejpwKLcvMhvDQukuaZFCljuIMkU
         H2vuqUECRFZ8ruNzMdz1xYxKbNG9TwDUJmcPDRT1w9nEq6o2Xtw+TAGx5Y89U6fiDvPu
         qYRg==
X-Forwarded-Encrypted: i=1; AJvYcCWiAM51O+NZ5kSGf6yZPe5t2R7R4oEaz4+rVCdS1uInSi1WvYG8I1vYJ8D4zaZeK6XgOTQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxobriqVpSwNlDH38L25qWoN51S4uAjxpVBSb09wP/RiveKlLgl
	/0TGsAiuROG5csHfDr38wZ7Q7ycLnLQvgekSewTwd1W44WFYdzekP7MyoIVzav1IN9gYFxSbTPe
	RnosJyeitexQwgExPXpAHD3aw8fj3g1k7Zu+P6ebOag==
X-Gm-Gg: ASbGncuPwiFZdO68RgtFmVWknsKQwdVH8SSBU/JbU5DSE2qiS4WgQo7oYIyqte5+tMU
	CeKFNuo1Qr1hOHQELIm5ktYNzJl6y88XawnnWzTu9FGa5LbAEumjIw4HIEcbMZ7nEBMi31bsfSx
	B7cus80Sif/QMJsWfirtPvdtKmizNHUER/RAWO/3TUu/kYKq9MGQYvVHjBt7jrIfDjSaO/qEHvI
	yijs8Ko/nP+utHGfVuG16Lkp9+qCdj6Vsqk8Ug1HA==
X-Google-Smtp-Source: AGHT+IGR364l0fZkqCbX1kIjKIvYDxXIcwBHw+lqJUfFGXSzirJ8uNvUMS79/HggJOLuN/qEVcxWH5dtrV9+RyqdghU=
X-Received: by 2002:a05:651c:210c:b0:357:ccfc:64ac with SMTP id
 38308e7fff4ca-372fa205204mr25896051fa.4.1759307812626; Wed, 01 Oct 2025
 01:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com> <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
In-Reply-To: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 10:36:40 +0200
X-Gm-Features: AS18NWDoMdvnOzF6_wDEnr52XVC2ihE3QCB2mnLOoQUz_n36xv-rRAEh7yvMfRw
Message-ID: <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Lee Jones <lee@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
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

On Thu, Sep 25, 2025 at 9:52=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> This is a link to the discussion with Andy as per Linus Torvalds'
> recent request to use the Link: tag to point to actually useful
> information rather than just the patch's origin. Linus Walleij doesn't
> use b4 so the origin link you'd normally expect to be added
> automatically is not there at all. That's probably what caused the
> confusion.

What? I use b4 for everything, I don't know what gave you
that impression....

I have however removed the automated Link: tags generated from magic
gitconfig hooks as requested by Torvalds in v6.17-rc5:
https://lwn.net/Articles/1037069/

This is also mentioned in my pin control pull request from yesterday.

Yours,
Linus Walleij
