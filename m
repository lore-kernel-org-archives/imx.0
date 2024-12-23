Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61771487CD
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734948215; cv=none; b=HRiyX7MU0rxSKB5Xxi823/81Dj0cQFhgwR+/pJbXOacAJauyw1DPJP+WOTOh8Fa9z2ygPHm4BtlEWpMzJXKY75ozifJoNl6H/B/3dA/nfgUmvQ+OiPxDx+HyFgklpyzYpeHSIvCM/Dmect1Iym7RYVjQDYc6RGLIj1eYoB/JjbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734948215; c=relaxed/simple;
	bh=DOLYlH6STvsMsUzEwDHLVF3LyCNq6s0sEMgtIxL/u40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zh3OmwMy334Lz7w6p3/E6e8bVfqpumLR12qn1pg9TY5TdZl9Ybf9juzU+CKcuQc0MbJYt7JVHl9a91O/aQqRuszqqTPNz1GaHBO5ZFBqiSFGFSFm+mE+dNM4T8yGlor/Vi0jWDBmvTpb/+gnLwzjosvrhNnAhkNLOEenp4ehQ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5162571e761so1222707e0c.2
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 02:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734948210; x=1735553010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwroZ5ftifLjf2sYQGLnTg3BTauvYFKzYd2jyBf2Tpc=;
        b=Sh9H4zji4rEaDRf111xKFY6ePBGDaNd++XgmOuZIQcOCpUlC2YAVx0MZYbtaWLMFsV
         Yxl0+O2C0aVDOm4EIUJeflNVjC16+wTRV/Uh+qTg3lx1lRFH+17XVkRhrYy2hQWMMZ20
         8zG867IHvAmzjUPDX0yL3MkdDopLxwLs+Yd5zM7bkh1A9VcWPTD+gTl2rMd7nEU560WG
         qcokeN/mbN4KEmrn83fE6xMZI9Hg7vlqDd558++b/sdC5tHM/BJePCFw8BkNmUg9MHvX
         MTq1NVrGb3sKVV72YoSh1rw//2XTdhdKY3dmpgKwFV64JHM2RChDwumOL2e9wFpELwer
         8iGA==
X-Forwarded-Encrypted: i=1; AJvYcCVFLvnkHch3QzlsMDTJ+hhNo2UhcNxgQ1z9IKma9j0hT7DLlI1qMg/yGYU75HNFrcKyYMw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYTrJeWRL7PxF2csk8UihdtkMSpCXQf14g9mUE4jsVa7sDXcCa
	ea81AVHefg9Qx4Ooqjrmp8cL5afG8D5AY6jlaDVb2ZbdMNASb3t44yxFnm3r
X-Gm-Gg: ASbGncvmm/MP+tzlcMOCbfZpvxLoRJ+RfOEFgS0d/t8ZrXt1SFkyLfDcsuElDI3g/kI
	+IQiyIIGKIx4JenY8ivrfqeb53trCrn0ZXfv8UYaM4mFAJDsWxIpi4lrf+vadpS/EnnRNP9kMKA
	zACkv6CDx6KE1ETHAFe82OPFQlAD1Yl5A9rWXE4QggkXaSpo2sLyRafEsebtk6D2/glby3ciIy1
	75f/ZSdOwEXyt4qhZaFYdV5VDKagTQFyBKL4ryE22IEAW2iAQe9cFY+b6hJmntUAqV78JF2bQUd
	Yv22LBe1uup/IvQmcFk=
X-Google-Smtp-Source: AGHT+IHkdreCYhsNoacsG13R72DLES5hqXxTj4kMyr8/ztPMiiR4sPcg1INUi56NzStTDWUgkN2thQ==
X-Received: by 2002:a05:6122:486:b0:51b:89e8:5cf0 with SMTP id 71dfb90a1353d-51b89e85f5fmr3363495e0c.3.1734948210392;
        Mon, 23 Dec 2024 02:03:30 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bb4297sm960133e0c.16.2024.12.23.02.03.29
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 02:03:30 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afe70b41a8so1124449137.3
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 02:03:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQaiXVHNQvmnOyrm8Q84GhLv/2OGOWcYq7dAlSVqdxxtBmtOydVPcHwZpZaEJEG8KLYbs=@lists.linux.dev
X-Received: by 2002:a05:6102:32c5:b0:4b2:bceb:1ac6 with SMTP id
 ada2fe7eead31-4b2cc45eaf6mr11513750137.17.1734948209264; Mon, 23 Dec 2024
 02:03:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <28f88e536cab0abd5712787350b012bb0f1eacb5.1734445715.git.geert+renesas@glider.be>
In-Reply-To: <28f88e536cab0abd5712787350b012bb0f1eacb5.1734445715.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Dec 2024 11:03:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSPVcOYyDBsoHOVZP9RO4=RryefeH7nGUaTUZRL1OtNw@mail.gmail.com>
Message-ID: <CAMuHMdVSPVcOYyDBsoHOVZP9RO4=RryefeH7nGUaTUZRL1OtNw@mail.gmail.com>
Subject: Re: [PATCH] firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, Dec 17, 2024 at 3:37=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The i.MX System Controller Management Interface firmware is only present
> on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about this driver when configuring a kernel without
> Freescale i.MX platform support.
>
> Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

The issue this fixes ("the whole world is exposed to i.MX SCMI firmware
questions") is now in v6.13-rc4.

> --- a/drivers/firmware/imx/Kconfig
> +++ b/drivers/firmware/imx/Kconfig
> @@ -25,6 +25,7 @@ config IMX_SCU
>
>  config IMX_SCMI_MISC_DRV
>         tristate "IMX SCMI MISC Protocol driver"
> +       depends on ARCH_MXC || COMPILE_TEST
>         default y if ARCH_MXC
>         help
>           The System Controller Management Interface firmware (SCMI FW) i=
s

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
