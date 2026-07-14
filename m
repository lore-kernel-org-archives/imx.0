Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5261F47B409
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037344; cv=pass; b=M3dfzCBlFv0nlkGrkYusB958auPEcaRWG8CqnT5bzFwnfGOpEZIh/JTzjXq1c+ffphcJnVuRz0ttTwB3HIzPHaOum14OfPbpCE96QcVTiYf6pxLkRh3B47Rm7evpESrKARJA4pAow/XP1uOD5zKxQ+rix2nmJ/tQ7S1+YHevyf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037344; c=relaxed/simple;
	bh=zDPVzXyo4cmSR7Pg/m8TZa/k3WLChGab+vHvCk0kZs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bg4x/qPq2Jgk33Yw66uFPjSnPQivrzRkD+eS7EumrcQTuDvg712RpevnBHS62PJjTbCwIdDZbS5eE4KA8tKyDrXcIQCiQfbWrOB2fbzM7pwAxwNcE5e1UD2dGcQdut9jbJTcUuPWscLKGBTOBIUiFP7vmApIufLXrHbdWHTOdYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=oDQWstXw; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="oDQWstXw"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so3296681a12.3
        for <imx@lists.linux.dev>; Tue, 14 Jul 2026 06:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784037340; cv=none;
        d=google.com; s=arc-20260327;
        b=eI43F/Ncj6LQXHX0Fh0N1pDScyEovYwrnTtfOkCG3pynOWhl7Rhm3hC4jKdMZwZhnz
         VcwhH9vFgLES4BgLYB8lGwU6/9VPEjd4f82Fc1VRmCqwsKB3RHPP/ADbGshvecPvNSLh
         mmZmxIUbgg2JKcy5lKn3IbhwDF7r9+CgPu/3zjSheFC0i3IytQx4zFbtqSw+HAOTvm5u
         f+ZbkfCXwbr2pPNApMsEoVeCMkLnE/3bZH/EJg0YU7Q+inKb85IiZOISOfFEcYd2MO59
         JFC0Bryzi1h6wrNGSqbHU9ZFFi/L64xXpR4JJU46LZrT2u7WNcb7zH3eeSqCIEDmEKmk
         x8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        fh=4Z8kPTrDRk+XxmM7yms3Uqoyg4awMW0O3vzhijqXFig=;
        b=aOtxaYJc/gskFfEn5QSJwtRDoce23swwOOzrBkgQHcMx/S9d2hK7vs17GwSzAdCa5G
         69AZZCtmcNpbEbI+2VpNa1/Cs1YCM+havevJLFYEtSbHiMsBnU9RJIdNPRoHTYYjHX3t
         JF6k783EVugyJa9FqDLm6/g8URw5CM/hrN5+Mwop+oqOCDaIKaLw4dren6isKL2McWDy
         wtAiRzR6b/aTpQgdNAIyRu6WWGyeCxdFH3JnSZRsHagZw42HkoWFt9JAstCscHVmQKuL
         lAuvzLZ8t1HszgoSju4N1P9n4NjvhZZoDH62YFl1SQDymOuiYjm17COsecckayKurJ7B
         pHBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1784037340; x=1784642140; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        b=oDQWstXwcyJUleOmOllGKMD35o8GPzwvJufJk6X3MA2m0K2cqTpE0CyZF8cPP+eVV/
         nVVFDRC8xzUjbIfqOmJoh1R0xvkzKzh6pdxcSav1eHQTfE2NImdQlhBso3LQja2V3fx3
         xW2s0a4I1n1r/Bcccq49TeHHBI9iMExKzcljM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037340; x=1784642140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        b=L9CVU2KNna4qMwkq23jl7U2+3Xpp26dTmBdLyR4HCk6dfKXkv5q9e2sSQMU8k2HYOD
         WXoCC1V8m1Bz9VpU9nn/Q8VRFMlyHUpemvjWqsrEq+V5qHPBd2ZduOdKgpwT3cj0oHc1
         lCWwn0dC2KYCd46H+Q5Kv0rqeV91gFsRdTfekHQhHgyqyFypWzDjPKB1dq3OEJwhO687
         z+Gu2rNya+Ojuh21h8wS6Ke0yG/YbdzDbfg3BGFzUlryHC0jk1lKpANFvzwMln2JV692
         Xhd5KYs4wEo21RxDzKBxZa5N/Y+zpfPZvvgci+pwKAZMkMk13fgtz+QCuOVuJe01odiT
         jYnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwXVHvHapeFWXWqvLi94nMWwog/gzvZZc8Cwa+W+Fw+mMZ8YC/HIQjennpMnilqflpyTs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP3MWUB2DyVMeQii1ENhkdzyqCMZDVoV++tRnazkSMNWAoygCY
	0xRcglwGPevYXvP5D9EYrogB++JMwS9oEK/8GLrmo5cmiJ2e9LGEtL1cRLhlHApp4D0jKSZP3E2
	GaEOiZvI7i5AY2qWyhGplk1NgID7cWQoLQOYDEEDdGQ==
X-Gm-Gg: AfdE7cnYkzA94aRbRQwttyP2z5wqlSd1nx5WuZ2UURvBmryWrK1ky1Y/S8mGpfrNFm9
	jby0tTitqMfOiFn/jmJHQ66r7F/pZsdxPcfAuuLJmO371tpdxqG/l/Lm04LMbXFFGn1wh6BBeTE
	5bjquiSGNfgYGbq/FppK4Aw0oHlMHSW4wLI69yLRATAZWuai9/+IqLkrc3r5iUNb6RY6qafeuTe
	op6S7jqufz1Na6zOGPk4kJdBxp0XVz3B0vT1/3IfQUIsiPiiG3+clnGvovhc5fmhcC2OkknyB8e
	XwQuxl3BZm3oAo97S+qoZkSGin2jFJ0=
X-Received: by 2002:a05:6a20:450f:b0:3c0:9c19:65a8 with SMTP id
 adf61e73a8af0-3c110a30fb2mr14802853637.64.1784037340342; Tue, 14 Jul 2026
 06:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com> <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 14 Jul 2026 22:55:28 +0900
X-Gm-Features: AUfX_my4HWQr0GTS92czUivB5kzuMCNXDtWp5XUMf9HPpLFf89A5CuHvz5fm-hQ
Message-ID: <CAFr9PX=UE0OtdR+XSZShPXUp9BSL=NN6tr_CSoyNPSxzdLa3nQ@mail.gmail.com>
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Romain Perier <romain.perier@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Tue, 14 Jul 2026 at 16:25, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> A driver module matching devices using an of device id table is supposed
> to declare that in the module's metadata. Add this information for
> several drivers that failed to declare these.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
>  drivers/gpio/gpio-msc313.c      | 1 +

For this one:

Acked-by: Daniel Palmer <daniel@thingy.jp>
