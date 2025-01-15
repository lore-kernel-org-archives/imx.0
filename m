Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78C22475D3
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736942433; cv=none; b=pdkdu21FDaqIGt6ircgYyx+yyqbjJ2ZCbzH+wBWcKDW2UIXq/KAoNLDViThDoNoT+rlAu1htkwbPcXLih9HcAT9nfTq4v5nYObtDHhqgMXtSPsw9VQxeELTlEAKIKwhSfyRWFiOKVCX6CL/LOQjKzqWNta/1Up3k0i0vSSs6lI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736942433; c=relaxed/simple;
	bh=2gVENKObdf0yD4+Qjax0lZMr103GKoN9lZ9RQF8JuYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCIkXFsgs9IwmqyeRVxfEUGzCb/8DfWqv4Ttt8M/+BKe04bQGdKX2mt9Rhy3GDhLdf/XqJnjM7uFToHckyZ76rT9ZoZYgtWjHfmK/GqTeJMgxahMpQgIIeE5bt6hhEWOb0dr3kF9lfovW5o3lAdLnKvHyPsf4U1IUAZTjf3q1gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CM2djsuY; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CM2djsuY"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3002c324e7eso62883641fa.3
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 04:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736942430; x=1737547230; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gVENKObdf0yD4+Qjax0lZMr103GKoN9lZ9RQF8JuYw=;
        b=CM2djsuYrtccsXx37lhLuHEH09ndoZr6m36Y0rghhTsipiybwkK4+Mp6taygjQCV4k
         blHL0s9rgYxSdie2I+T4grkS8FUNNytWIfs4VF08/iILN398OgEdzGU2X0WPwXYr6RqW
         rq2O/lHOfBeCkdybsD4tUm3hviwQh4xcuoJlwhGTRiH5hfopp1g+/exqOycbe49XmxME
         agwSNyi8a6G9Qh8V9MVklFdOdE1G730KcJ8Tme+euHGjZaiqa5ylV2R3N8VPv69vqkiy
         LGm2cX4RN1BKSWFb0ufHnVbkZihwNaaIAfxhEeeg32fNisU2fbRxVz39M/FTYkttRyi0
         5DmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942430; x=1737547230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gVENKObdf0yD4+Qjax0lZMr103GKoN9lZ9RQF8JuYw=;
        b=TQFKAaXpS4FhXqiKu3hf8kz4YEZ8Y5IQDesEBUCb73ZfuZe1o0x1fhj/f7Z5vg8/XZ
         eHy92doSh56bef9WEW6uJhMjeStuO2NarKGbAi43f5suyRA+r16jk/K0BDIqLS+8ETr2
         lxWu09+QFz+1nBY6AmdsgiLcP0aD6M4KIJ3edpU2k9veJBKbuMyxiYGqnw1HFgT2FJ37
         kHYXOhO+ai9EizG1puG3cD8dX2ChxxzPe4IUwucfyV2IlNoVab7g9HzRAwCJLKoZQueA
         k+srU7aDnfwg+jvgmqX1j7XRSbf/7qosZP4YuOX6dIuTREy60NSkyb1oHG6qPU8QaVKb
         1Kdg==
X-Forwarded-Encrypted: i=1; AJvYcCXWKgB9/yP5tfLwfgEfWmH9dKDsK4TCuFSNJVnMj3QVNtKIbdqJyEobT+4AzEF6GzWMZa0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRkIVcwKxEqVVAdwb7tt15jFriIQWMixSh6Nc+KzKFtBPq8jrF
	3hL1xg/xVZQECmOmowdI6J8OyuDKp9Ax8c7MuqGnasaNhpa7KHiCn7d7eAsBN9p0Yubj+rYe2Qj
	99q2xudQansezjEUvO89mMVXF2arGMaMa34fBpg==
X-Gm-Gg: ASbGncst8+R5bZhQQsGjpamEUo3vhC8NEKZ4QSMlLXPFpHtwkucXvjRTtUz6eAvqXAT
	SsYc9Zb1URwsKfHAw4Pqnyeq3xlQDhIYZozSi8Q==
X-Google-Smtp-Source: AGHT+IHZ8JRFA9z0BuxNxyKFpxc+uTJeyjFf7mDX60c40bksrJbFP5JGtyqLP/0FmsVVL1BT/l2aWdaK1Gw0mCFy5FM=
X-Received: by 2002:a05:651c:4010:b0:300:8ff:d93f with SMTP id
 38308e7fff4ca-305f4575ec2mr56064611fa.22.1736942429711; Wed, 15 Jan 2025
 04:00:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 13:00:18 +0100
X-Gm-Features: AbW1kvZbTfRxw2_bbKGeAzy184NtDYFQ65gHsjdE84o_WvgwJ8_KVgNBHdw_LLg
Message-ID: <CACRpkdbgv5BhP_iv1fV7-=w6qF3H+=GiUJz=hQko3rcd6uq4BQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:19=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:

> As these concerns won't go away until the sysfs interface is removed,
> let's add a new struct gpio_chip::legacy_static_base member that can be
> used by existing drivers that have been grandfathered in to suppress
> the warning currently being printed:

I think entire drivers, pertaining to in worst case several generations
of SoCs is not the way to approach this. It could be a SoC or, more
likely, single systems using a SoC, that has a problem with this.

If you want to safeguard this I would use some code loop in the
gpiolib(-sysfs) that looks at of_machine_is_compatible("foo,bar-machine")
to match the top-level compatible for known problematic machines
so we can be fine-grained of this so when that machines retires
the driver can start using dynamic GPIO number allotment.

Yours,
Linus Walleij
