Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437D22DC44
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848192; cv=none; b=Yjza8F2i9K7BE8zCNvvV1w+a8PRR7uuC5/nwaM2I1TkQbG9/CWxDAeWn5T5UIdKyfLgfXOr1cgPJN7RBJIPcSAWy1gD4kFss8aijb+ubznK/yEGmhFqhoCkHs7oyBlbjPpNkgzCrFsCdOnqg7mle5yLwUvTxKWsJDcbRMMtFX60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848192; c=relaxed/simple;
	bh=3XUEIKXhj11O+kUNhaFonLT84lykcMgjTfyuLIRbQb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgdZxBtEm5Mix9k33J3XTfaggU4fTfxs3TXFd+M79IiRKX8RHPb+MHg7lhPDxDt/X7MogtC/wkkcEz7Jrl7NBNP97ZLFWFmOfRUqv5FpXYuOuLU0SjT4vN14+n6O8r9LCBmloiDR6lY4qVET7Ht3HgRzVjLnImBvH8HOKJAoMwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FULpMtel; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FULpMtel"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9e44654ae3so847843966b.1
        for <imx@lists.linux.dev>; Tue, 14 Jan 2025 01:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736848189; x=1737452989; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwP1tti+yLWvcbErin2Brt+AMboascV0NwMOTqURVnc=;
        b=FULpMtelkb9oopYR2a2s44DxtBV8wucp7JuS+wsWmAazKNnliaPcdVnaFhZVthIiZo
         LC+0AApntBr3/w5POYVh5xJhVNUAkvC8FnB0SMMUF68IxcLI9hhj+lnXSRtNqrHz8OKo
         G4mWjuq5swkg2eJyj8M3fnH+K8wqYmRzFVXwopSEiCZI6WqX4JWqA2eIkAOkWEn5wUnh
         G3A70CQAGez3ACo2ejSgipfaIjYZgdoUQbjIgeQAxZPEejr5xU+KqnkDdQaoJpv/OJWh
         Wl4TAqZA2aiTFcMFvVoy2BmWkNsxgQS9+3eTuhDmVd1kRM1qThJ8kH6wQekknAF1FU+4
         wepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848189; x=1737452989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwP1tti+yLWvcbErin2Brt+AMboascV0NwMOTqURVnc=;
        b=GkU7E4vlCRLNWLvxp0xk2+6I1n1ksRFdQLpTJHL36tMgiMFqrChHlUXHzcAaEmUp5j
         i2i3mBGtyegh7Lkx1gX3P/aRcKhx/2p7Zyecl56aXnzgY5EM91q3IoLQEIqLkoTAtV/s
         LEwft3ibAMcPNzxUhETvDE+dzgylprs4TsuFvKW0VqMn0L0jQaomVDQoO2I0WlRCt9PX
         UsVYovhpY/50ObEUn8tgZp1oxHvYkQsL7l2TtogaRCAj3SiaOz7eS64qk2V74ipTRQRF
         wkAJ16Un6u+SPjcTEXRNPS5hJzfTS5nRJXqwAQ3GrK/Jq+7m38576LxXd12cQZJqIT22
         y+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT4ZD8eLhksWuxG0Ma53C3Z3dFOASfUj3NoXNFVzosPJyxdMjLaIL+/ArScfhNvW6lqls=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmQ8TwQ3kgSlutuDmtfa0L6yWYjFsXoCDJAcgNxadFvZxwNJId
	u7wVxHyLhWKiRq0RCPfSfljJNDeAnKmxe37TpxpUDzhQ5MOx7Pv/DCKvNQ6dTvDuPU1nkNusNl+
	Acov4JUZxTBbC2I1v6PNT937hSJk=
X-Gm-Gg: ASbGncul65Z3JI/yd3ds4W/JfiYUdwq11RDVtv12Uoo8Y2cRcLu1Uuv4LeyDx8QLRD1
	L3HHzXr+CnIyttdbk1UdtRGWIgSQwM+ocoqvbJA==
X-Google-Smtp-Source: AGHT+IHSE0X0c/RAV6RHPYce2+Lu6HtvF4f8pJXDO50RUlRMfR3JVOivMCp53pLKP3YuDBdiRYv5612VS1G8WhdmTEU=
X-Received: by 2002:a17:907:3e9f:b0:aae:bd4c:22c0 with SMTP id
 a640c23a62f3a-ab2ab70aeccmr2153858366b.19.1736848188749; Tue, 14 Jan 2025
 01:49:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 11:49:12 +0200
X-Gm-Features: AbW1kvaXInedzCQDKle5HtOug-2PYAvJssuAdg06rMQek_Ee7DEA41pCoh3PZGI
Message-ID: <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
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

On Tue, Jan 14, 2025 at 12:20=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> Some drivers have had deterministic GPIO numbering for most of
> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
> ("gpio/mxc: specify gpio base for device tree probe"), more than
> 12 years ago.
>
> Reverting this to dynamically numbered will break existing setups in
> the worst manner possible: The build will succeed, the kernel will not
> print warnings, but users will find their devices essentially toggling
> GPIOs at random with the potential of permanent damage.
>
> As these concerns won't go away until the sysfs interface is removed,
> let's add a new struct gpio_chip::legacy_static_base member that can be
> used by existing drivers that have been grandfathered in to suppress
> the warning currently being printed:
>
>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
>   use dynamic allocation.

Warning is harmless and still a good reminder for the stuff that needs
more love.
NAK.

--=20
With Best Regards,
Andy Shevchenko
