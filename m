Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2B6202F84;
	Wed, 27 Nov 2024 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732736187; cv=none; b=JjkL5D9hpvCERg4h6SxqwVlox+HVcY3zj608f+gg7OOO1UDCB5VkW9QWoQR96KdatZuT+VBctL0qtxiSLRv000Rag89LXvnVZ4kbZHV4Ch0MR1f2d66HywBmh90ZHqYqoj5gwY4YkgnRlxS0bmYt4ATepPYn2Fgl8ILqmGP3F/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732736187; c=relaxed/simple;
	bh=oKtZKcmXb2M6spKPqMefrmKou8p8fKIrTlFjEhi5x+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgeOr3ImJo+XKwq7AtzxPsJGBZAqxCm4m5dzTiNYkehesbsQ2PF4afdtDZW3ZsfLVfek48jEprHTOxHMKQhyKqcQQVewEYPuoLA4VDKMos4ssww0U0dUl/OIyoavAt2hupuDuQrGDRGNSU+hIJGUek6m3tOQKmKB7LmGMakmMsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnaYfYac; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnaYfYac"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffc76368c6so1299811fa.0;
        Wed, 27 Nov 2024 11:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732736184; x=1733340984; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKtZKcmXb2M6spKPqMefrmKou8p8fKIrTlFjEhi5x+Q=;
        b=fnaYfYacelItF0UjejE61PODGeGAuZym1NGnnexRVNBZOXqNlLZ5Bu9LomUey+Tf01
         SZu3d9dhS5STZeu54Q5dIPlDhmJOo3F7uKgFbkQE6jTruOFbrNX7OBPQdThKhyY35FLM
         SyyvNuHvDuCsL5SzLu9/0BheWfJAsB8/KmNtO5xJIziiKOOcpGsmHcQ0b+dXB/5nfI9A
         xFYtxr9IjtzAs4jPkh1shkyoC6EI+V31fnTyN6bKl6pZy+ldiXqI5iQiIxWwhW60CzR9
         /C7RjKEuIKiYaoyIjBFqSajdeoWqs9GqwI2J4Hq2Jr8VkX56bOb25F1qPoIa3306bgSZ
         wKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732736184; x=1733340984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKtZKcmXb2M6spKPqMefrmKou8p8fKIrTlFjEhi5x+Q=;
        b=VlOQ+B3RUAQcRfEMGKoYDfuO8L6WzVk8uPtVOaOKD6DFFtEW2hKRsZlKnT1Ww1xB43
         rl/IBfjTINT1rpf4HaHbC0r5eNt6X0fvVAFvGQDE2iBXvJ0HBvZB/HQwD/dvm/HO7zso
         c6FXrbFbDEyrZaOMdMu4kzl9AdD9jlG4b2aH1fwrZCuMq1TTBKcD4nxRg2XIg0Iva3u2
         NM3rzbdk/nutqUhBRRamZRj9Xl3j2TvYjY88i8F6CVcRU9Yr7iJgLQNnkkFQMoKt4OF5
         fLmsRH2eNPMyqxyQVDy7yJzMtZku/HBWQL96EXcVDt0VlRIPO3OBXr7K/oCvJJ5w31nf
         JYig==
X-Forwarded-Encrypted: i=1; AJvYcCUF18slYOXLVpBZhWdpSD2ZDKrFH/j+Qo+MgavJaEPYFSjQ2Rnck9CkaG6wY9GbQa1jwYHw@lists.linux.dev, AJvYcCUi1DoRIxg6iVqtG0U5ASWHaWzeS3KpgQ0b7xBVOKOzqm/21rb15PaJ8ALwXDFEc/DhiCg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMoQT9HFk5i6te2G/h1ec8L3ixlThtrJvx6KwAu5+R/WNPRhdI
	qh5woD1T7++h958Dl3n/0TT2cE5s+m9wNmwivwrk9fMKqqjUaQubLSqA4XGmCscRa9rm48nVKDq
	vzZb2gHiCzkvDIWW8GoMQ3E9bLNk=
X-Gm-Gg: ASbGncsJJCPtmk+USIVsPEBUojDLq7DxcnSEdip11dhY7o5tcXp6Q5Kv3HlV1PAAW/J
	S1AyW/pHnyB6OPaCUAzlIld/s1WcJCmAJfgfWgZboZenqdsvTdrVvIDLShkcQ4A==
X-Google-Smtp-Source: AGHT+IFPeS8nF9rsPbtVwAeT0yJgfR0bmbDXQw0nAIv58Wn7uVNgUUVKZ7ZtSZ3kSyKequY0RNGC6L25fA0S8ZLitnQ=
X-Received: by 2002:a05:651c:2119:b0:2ff:a8dc:6fb8 with SMTP id
 38308e7fff4ca-2ffd5fcc1f1mr40204551fa.8.1732736184044; Wed, 27 Nov 2024
 11:36:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127-imx-pinctrl-enable-v1-1-d3431a98253b@kernel.org>
In-Reply-To: <20241127-imx-pinctrl-enable-v1-1-d3431a98253b@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Nov 2024 16:36:12 -0300
Message-ID: <CAOMZO5CbgmGpJvurf0Ctomj5dDOt=dC5X8XvwaqsM9Ce_uXhUQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: imx_*_defconfig: Fix i.MX pinctrl enablement
To: Mark Brown <broonie@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Esben Haabendal <esben@geanix.com>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 4:25=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> When the i.MX pinctrl drivers were made user controllable by 17d210018914
> ("ARM: imx: Allow user to disable pinctrl") the select of pinctrl by the
> arch code was removed. This change means that for the i.MX specific
> defconfigs nothing enables the base PINCTRL Kconfig and things that depen=
d
> on it (eg, audio on the i.MX6 UDOO boards) stop working. Explicitly enabl=
e
> PINCTRL in these configs to restore functionality with them.
>
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Signed-off-by: Mark Brown <broonie@kernel.org>

I submitted the same fix:

https://lore.kernel.org/imx/d718ddd2-d473-4455-b21a-15024e46787c@roeck-us.n=
et/T/#mc71dc21d99e0b013c5ce46c0d90940fd8806ae9a

but as Guenter pointed out, there are other defconfigs that select
ARCH_MXC, so this change is incomplete.

It will also cause regressions for people that have their own
defconfigs (where PINCTRL is not selected).

Then I came up with a v2 that simply re-select PINCTRL as a minimal
fix for the regressions:

https://lore.kernel.org/linux-arm-kernel/f65d65b3-b60c-4c5c-a002-81370821ee=
1f@app.fastmail.com/T/#u
