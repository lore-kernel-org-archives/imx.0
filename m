Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7D21CCEF7;
	Tue,  1 Oct 2024 20:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727812812; cv=none; b=MiQewwYZb/xEHE0Cbw3IPfh5OCBJ+M0+gRj6fRi6D2SfsIC169JlNkZTCRtKogb8Q7r3aATMPrXy+iL9bodlG2CsjM4B0pnjiHlLDg0m3+KPb8M3F2TUEhZpNVSkvMHnb4IRXaHDksJxkjcH4ccwmDv9MnyoYSXAwa+KK9+MCPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727812812; c=relaxed/simple;
	bh=9nxNhpLrx3HJEq9JhEouMSM4YNgGI4tmenEeJnI7KaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uv3R5UQQFHXY4/67gY2qRHQb+mwRPUm3qcOsVmfUDEEcZVtVOt8oQ/WURwSl0yTqJLLneMGENwRtqOYM/oHnRU0UYRWe7Wl01C78Gj57mHI0i1PYOj669xWpRdebsWaSrFHuXvgS4PHfbCD8JyhSiNgmAe0Rd365/lWom24HPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=IUyVDGGw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IUyVDGGw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20b7eb9e81eso29551745ad.2;
        Tue, 01 Oct 2024 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727812810; x=1728417610; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
        b=IUyVDGGw6Y9vtAHd0mMNs5en065dERe7qVaDoa2O6Jzbf8/X5RXsCqqce/d/Q+Rlqa
         6/6fYcoc3brZ68cvYiPPeMqmiMjypaZaePi6suVpXtPNsI5bZf3JNOt6UDL6Ju0FTCIv
         Pa9pSkUKbf8vV2JG9g6z5iK8/hGUvGarzsGCZRg7Yv1Uukl8EFd/c39Xyubqx0vGooOZ
         yPb5fC1vZL0YTe2Sq9+HcTzJKm9nDJIHuSjzveFPI3hmjuGRsmlGhaTze3Nk36izvvY4
         3/TM6P9drGVF+AyWVmNODZLxc87p9tTa7iOzj1yEtr96DbUAGhlMwg/zLFCUHjeQbk0w
         WYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727812810; x=1728417610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
        b=C5NhmpbrUTX+8gXsZmvo0cArRpIwjmcP2OpI/OpRDGzYNeCVyWp5bv/fhL2tpcY1oQ
         YKUiBqAl2TxjD2T6oSx4yVOagLn+hDmobIHGvLBsRvIEK1il228LOLrB5l9f5kmdlBFF
         0WCMx71jWMkg1sB1fVRGkfLaWxW+IsQiyU+yPlBDEJYgkEKFLJju0JXtKE3mhj3sH6jv
         2Us9gsAykgjbR+gRsta1LVwbbumU+UOAxfYY3WEOZv04HItsA689REHqzMODOvhV62/A
         tNuLNxS9Maft+FgcjqBuMAQLm+rx0DUlq6lKC9jjLHheVeD8gIWkc6A69GxxgmnPLcBL
         ZogQ==
X-Forwarded-Encrypted: i=1; AJvYcCULoxZmkE+9UuIFIcuebWLusvTSpAecg5yoUqEqpTvSV/l4LWkEQv+rPTz/WVMNU1rN8Zg=@lists.linux.dev, AJvYcCXIzd00RFy6IPF0W67GpOVJaWeG9shvmAurg0HAfVnuJOczCJsiPKAu1XBp1pgwCggwSOnISrqKqAE9llA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrZlGZ4jDrwiiX5OkD2Kf/xRBxXaf3xA/r793IrhgD5/fVg6fj
	s1eRXV0uY3CF4VCRnZychGHO4gA7B/RsI99en/Fkr9gzltKnHDuKEg2UxQjtdXmgryaxJNc9MF4
	VuTzZg6gQL2Y6UcuYW/tCUAjG/V4=
X-Google-Smtp-Source: AGHT+IEzN68oFH6UETNrpbvCGpopcDsigqPvgYKygFNF7D6FUqPz4x1zQ8ZA7UoZNXXUi84OPMM6AhdceSvhM1DdNJ4=
X-Received: by 2002:a17:902:e550:b0:20b:720d:734 with SMTP id
 d9443c01a7336-20bc5a5cd06mr11151925ad.41.1727812809889; Tue, 01 Oct 2024
 13:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240930223550.353882-1-rosenp@gmail.com> <20240930223550.353882-3-rosenp@gmail.com>
In-Reply-To: <20240930223550.353882-3-rosenp@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 1 Oct 2024 21:59:58 +0200
Message-ID: <CAFBinCB1Rz+C=Tj+RJAL5KZbk9K7cnpF_uR6rKkMeqyCuDBo4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: assign reg to memory nodes
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Antoine Tenart <atenart@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	"maintainer:SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT" <soc@kernel.org>, Marek Vasut <marex@denx.de>, Jisheng Zhang <jszhang@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, David Lechner <david@lechnology.com>, Nishanth Menon <nm@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Enric Balletbo i Serra <eballetbo@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Alexey Charkov <alchark@gmail.com>, Denis Burkov <hitechshell@mail.ru>, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Wahren <wahrenst@gmx.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Nicolas Chauvet <kwizart@gmail.com>, Tomasz Maciej Nowak <tmn505@gmail.com>, 
	Robert Eckelmann <longnoserob@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, 
	"open list:DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT" <kernel@dh-electronics.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Rosen,

when you re-send this, please drop the Amlogic files.

On Tue, Oct 1, 2024 at 12:36=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
[...]
>  arch/arm/boot/dts/amlogic/meson6-atv1200.dts                    | 2 +-
This file was dropped with [0]

>  arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts               | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-ec100.dts                     | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-mxq.dts                       | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts                  | 2 +-
>  arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts               | 2 +-
These got updated with [1]


[0] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commi=
t/?h=3Dv6.13/arm-dt&id=3De2a3f11ae11c9f9ee780bf49f00a69f12dce3529
[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commi=
t/?h=3Dv6.13/arm-dt&id=3D7947fd2d350e6057e7514459c7ee2db39d1096a2
