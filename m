Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0B61C28E
	for <imx@lists.linux.dev>; Wed,  1 Oct 2025 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759308399; cv=none; b=XbpZKKqgQgRrkTWWdFvC9e5rSsRvePzHN3+HKld86DRAK1v/p00MCeELse+eorZmHCkzESlD/yU8T0d22WXmlhH5bEyWzwGCmwJBWePQD0CWB5DVv5x4/TfTalYR+y1PhY6ES3GkG1Vn6j7l5l4JXdKozIzqHMT9K1XpsKiy5jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759308399; c=relaxed/simple;
	bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJseDoqu6aqrPrq5LRhBMm1tDM4azilNL+1+6pNtWY49Wr9tvpJIUuhfsBwfBwTZ2oo48/qi2VDF3q0GHSWJt/JAZ459zzg2xniUUa+owvO2yHWHxkY0nbvdlWc9LLhX3mBMDMuY4MNLQF0+BcB8OMGS6X+37UAfo/D/D9+w5wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OUabfKpZ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OUabfKpZ"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-578ecc56235so6352508e87.0
        for <imx@lists.linux.dev>; Wed, 01 Oct 2025 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759308396; x=1759913196; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
        b=OUabfKpZIL9ZYK40U+JGzwyK6GwM4ejWuXIiEerK9ouIh/V6/C5CqfwNmUnDOsIBjS
         lMq/+RY8wfRVeby0CplAMMCCLuYZUnqZf8BnHkBAYn1NHJM+WoVW8p02KSJgqe1H3Itc
         Q9bPt/IsV9EZmsvHb+LQ3NVkhuTbuEssmZXumnjUryh9nOdr1EUvORcI6XRoCQEXV56/
         23LM6IswRF0N4xNn02EHrWEfV2UPvHXjht0e655Cs0zRzs/h5m8LLt6k+RTTBEzN8q//
         Oz4LBCnr8JJBUlcO8Hl7v8pVVQekIZSMVXVm8AeHSlSVtrwGOmkbWtoOU8PWAqKpUkHy
         xMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308396; x=1759913196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
        b=EzS2mSeStqsf2vFBP7lGzPlYz941rmR/0PiLMSxzybbDGgDfNAoJRmiBiad/wasRZr
         iiwkjPrHjzlMB+R6aDh7b+ApAngOS0SGMVvTBODqvrVM3pbPsh/zNSOUnRwoQO1yKax8
         IHzBmtsBZZFwEPFipPkXtflcMC/YD+ojnKSnZFRLjinb7v/sPVPrDHRDSdQht6HIYEy1
         pOi1Jk9MbxhSaM2aqIxbBdP8OEawVfrypnhYDVQJ1zzqH5vQEv+hwzD8Bye2gmKyWnhC
         uDj71ZZN8m8IfRbyiWHg0+2gZL7gw/cH2e/OOj4fAhK4M4U9lnJ8FZksx6iRBKx1HBxo
         6mag==
X-Forwarded-Encrypted: i=1; AJvYcCV6sACxmXHq8goCa9LbuyyicPEKTqblCoFgAldBNz4R4KZTXeapZOxuLvN4BD8L0hHa7EA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4wfqorftwLIEiNkhgasDGDd52HshGwTPlkaHOrRu7y5hNhhHX
	jVqm3xXBVATqHovBdjqTk3RXC4w+9VUwxJBWd8MkVTUQ+7GK1Ltwr8U5iS477pN93wFWpKxVtEw
	OlSl6qVxbJlfaeeLzT7AAiMbqsBiKn8/ChPWt7OgJag==
X-Gm-Gg: ASbGncsbDnFdFsKlt2OoDWfsHbj3l89Dn17V3z4dyMheir20tySHaklJQfSONgtbQwH
	yQheG/bSdCK2TTphowM9eNGXCtPoXDS7YcstHD2qywhn7bgsXIAUZkglPyo4fGqjm1cZC15TXWj
	TxU519AfQ21PGSCoK4LVUuvkvJr3NxDy+YXXcrD3MQ2gRdbOXCZlfb6fK91m39Sj4ZzZb2Gfi8d
	anJmn/dOcZxeEVK1CZsKwl84fL3h5ntl+UHtRVN1TIA4ngxQ09ubbeiG/TEts4=
X-Google-Smtp-Source: AGHT+IFOdBqQ3obnIdTm7ru0JPzklPYFIUGqCI693FKE/9RlmuM5kKhUigWL4UNHwLKwqtrOVDs8F+QH4ORLFYFhoak=
X-Received: by 2002:a05:6512:ea7:b0:57a:6d7d:dd7b with SMTP id
 2adb3069b0e04-58af9eadd86mr760851e87.8.1759308395621; Wed, 01 Oct 2025
 01:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
 <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com> <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
In-Reply-To: <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 1 Oct 2025 10:46:22 +0200
X-Gm-Features: AS18NWC0XlksXBppS2yCvWpBaDAShYUzQK0jJOB31RgrqudBkZ0MvZktkc5Xz8w
Message-ID: <CAMRc=Mf4kv03+cfB7up==PUJyxHH6U3hHF3q6iKYZWVOZamSTg@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: use more common syntax for compound literals
To: Linus Walleij <linus.walleij@linaro.org>
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

On Wed, Oct 1, 2025 at 10:36=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Thu, Sep 25, 2025 at 9:52=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > This is a link to the discussion with Andy as per Linus Torvalds'
> > recent request to use the Link: tag to point to actually useful
> > information rather than just the patch's origin. Linus Walleij doesn't
> > use b4 so the origin link you'd normally expect to be added
> > automatically is not there at all. That's probably what caused the
> > confusion.
>
> What? I use b4 for everything, I don't know what gave you
> that impression....
>

Ah, sorry for this. I assumed the lack of Link is due to no b4. Should
have looked at git log first.

> I have however removed the automated Link: tags generated from magic
> gitconfig hooks as requested by Torvalds in v6.17-rc5:
> https://lwn.net/Articles/1037069/
>
> This is also mentioned in my pin control pull request from yesterday.
>

So it is a policy after all and not a "please"? Let me remove the hooks the=
n...

Bart
