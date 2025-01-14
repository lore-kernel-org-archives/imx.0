Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE730205AB6
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 19:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736883822; cv=none; b=st2T7oFZTU3QjmLD7hllSHdJtGBqJLL+5kNSdshwDV5gPNTP1W9ZFJJVCxDwnG1HmDEfzZD0ow1fL77rRD9J0H23kkV8D20njD3V14JxDU9BVIboVo5rPnYoqYqOby0F2YXtZJE93qJ92Jo6H94SeenEvOBnaGOGB2K7ADZr8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736883822; c=relaxed/simple;
	bh=1gPjOfJWBv7udEX42R/lPZwZsVT3ZK5coiNp2Efpmis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iX5pe55tUhDTHTMTJh3H4QmYWFzZWfUZI4YRGnLrAmXb6Qo/j5Ip10AW4LEsBaAb9Jz8Fd7GzJHqmC+Jq5NOYmXzzK7uScRmYRoyNZj5SAC9OjdfRHSCuiTtvJxEJT2pOyyXC+MIZV3IoqYF0rHIHW1xnVMG1hvxEAXK6gBQQsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAdUsma1; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAdUsma1"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso1068688566b.2
        for <imx@lists.linux.dev>; Tue, 14 Jan 2025 11:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736883819; x=1737488619; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gPjOfJWBv7udEX42R/lPZwZsVT3ZK5coiNp2Efpmis=;
        b=PAdUsma1OqsYWn/JC7fpx3JVcg6yep8fa9a9kGqHpFtiF1Sut/abCUHShA6vpO+l/a
         6eGGgUthEMU6qunZawOA29E5FrUQaLVAm0j89lfPdTRbhriXy171uZ7hR6X8orSLHr/l
         uLwA++CP2PtS4YMfCTNHvbqXCN/05DoG2ERfFeqND5cPgQbiNzIJJlzzu92ytdLggkGW
         pd/evF1slxg0CXGNvs2e/Bb+23FyrmpwqDJZj2IJCSbXuhfijIi5vFr7gQOyGFjJ6StH
         94Iu1E0IFbnCqPh09f2DfJVS3ULVrWCr3+FI5Q8XLyZ11BNSazsZ8mdll5cmTrr5QlO4
         fxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736883819; x=1737488619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gPjOfJWBv7udEX42R/lPZwZsVT3ZK5coiNp2Efpmis=;
        b=Ft3V6fg/w6oUN9FSqqARRYVEY5nE3ySi53Siuk6Jn6i2RMo9qfAk36wmp9MZYW7nTw
         DTOXOYW4QvDOsbH+LXHjyhC3NA8oJTkBfgvNpG2wI/dC/pm4/ad2plbHyVq+jUHHcjqe
         RHy9s1z/9zpVoojgqoGuxMpNNpRGUphx9wiA5iucBmUJ1IXp4WWDmSz/8ZWlPtV6Q6k6
         hZ8YZSYOvgl+QnnL1vVaTjr20B9q4eISgXWOb+gRbg7i83yi1A/J3s+ORaUekYWg8nFl
         ZXv8NtWmRmbZZ43wEJMjWMR6gqoziptreT5KL06RSh3a9oqZLDO8VQ0WEY9Bi/0Rd4OE
         K9bw==
X-Forwarded-Encrypted: i=1; AJvYcCVA34nIKp9aqgLnIsMEcW1jgjPiajbsqcOuREXVfmR/SCpWKzQEdzO2nJh3Q3RuZY9L/Qg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxswZwAZES0Xifo9lfYX14lpxTyizWWNHuI6HKsTWr4szKtu6Kz
	5DlofQ9zfab2LdLnz5wS6+kc23+bDuwlVHuahtxSx0AHWrDnCM7Fsc9dhNHoEGtZ0isSgZWh4wQ
	l7B+5G7AO3ZafVvEFEAFbqSg+koA=
X-Gm-Gg: ASbGncsta8W9zq5z+swQ40pgLTA0uJMyhMvus+xKLoFv7pjnOcoTJidgUr8MhmoIkXY
	yn3yHH4nBxuvps7Fx9UGmgX73/owTLwHh+q29VBPR
X-Google-Smtp-Source: AGHT+IE4RbVs71/smgDj/TU9UMPWxR9g62d8TumLSWo8W/n9+Z0nM2yXhOXr7N7e9uaINKsYnz0zeibsE5WgKYib+Ro=
X-Received: by 2002:a17:907:9410:b0:aae:8495:e064 with SMTP id
 a640c23a62f3a-ab2abc78b52mr2090164566b.40.1736883818809; Tue, 14 Jan 2025
 11:43:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com> <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
In-Reply-To: <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 21:43:02 +0200
X-Gm-Features: AbW1kvZ6R2e3yRjumlny6gUuJSkRGD__NmZWUskaVnb9oMxLZs0nWXPBoBuMPXA
Message-ID: <CAHp75VfOhAmkpB_nhQE8m25p=3P2wvTfOnQFEsLR5KEktLy4vQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 11:55=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
> On 14.01.25 10:46, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutr=
onix.de> wrote:
> >>
> >> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> >> for more than 12 years.
> >>
> >> Reverting this to dynamically numbered will break existing setups in t=
he
> >> worst manner possible: The build will succeed, the kernel will not pri=
nt
> >> warnings, but users will find their devices essentially toggling GPIOs
> >> at random with the potential of permanent damage. We thus want to keep
> >> the numbering as-is until the SysFS API is removed and script fail
> >> instead of toggling GPIOs dependent on probe order.
> >
> > While I understand the issue this tends to get never fixed until the
> > entire support of iMX boards will be dropped.
>
> i.MX is an actively developed and widely used platform. Why should suppor=
t
> be dropped?

Exactly, Which means "tend to get never fixed".

> > Personally I do not like
> > this series at all. Rather let's try to go the hard way and understand
> > what's going on to fix the current issues.
>
> /sys/class/gpio is deprecated and when it is finally removed, this series=
 can
> be reverted again. The alternatives are either do nothing and live with 6=
 kernel
> warnings cluttering every boot or show users the finger as described in
> the cover letter.
>
> Do you see a different path forward?

Yes, try to write your scripts based on the libgpiod or the tools
provided by the project. I.o.w. follow the warning that SYSFS will be
removed at some point and prepare yourself for that. If some kernel
work needs to be done, contribute.

--=20
With Best Regards,
Andy Shevchenko
