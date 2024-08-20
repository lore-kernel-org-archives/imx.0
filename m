Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A753118E035
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 23:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724195934; cv=none; b=tkm6BdTha4zOkUZcpDs63Rn50mKx/au6Fhs1mnKWUmlSkS9varUcgyfFHe41Sv61bVgIlJI2JTFxXei5KFfxj0zn9Cf14StbHWdDapGlPHUunD2ok9yWR8Y3UMq29ex4qQu8yz78cVmd7yI4SLGIUr5eFxfNkyuKVKv2Veh9Bq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724195934; c=relaxed/simple;
	bh=d60nT1u03Qy3Q7s2fv6T2XrNNU7KG4m5JFfp1UY20n0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6Z15A1+UlQ7IxudvizLGeKz9K/Z4SfuONCBsGVqRSQUyYdLHAgILssV+rQ8U5dF99h0DdgBl2s92V6tJoIBqB7Rfw8L+UUCGHw3ZH4pL+GhCsKguv5YaqjSsw0NXUHjTQojvNHk2XLKB2fCWOCEr27xwpRPtqqRCFNUdj6re2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CI98CNAw; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CI98CNAw"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f00ad303aso7773234e87.2
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 16:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724195931; x=1724800731; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF6wfgyRdYKFN8d5+8XVfRoeXiJGMMUTPZXUm54bPBc=;
        b=CI98CNAwxzTM61mV8+sKpccbQKFp8XpiiL6cj42PTiSGgmbc4FDU5Fdx+vtr9QYRZ9
         6B2wSnu2U00HUPYj4ghq/ofj2BD87H3DXPlupeCk9N82ZAU2RqvPYk1i/l48CAPlmVX1
         hMz1U6eaAmtkNXXFpzreGoiStGk1Gh9geK2Xk1HR9TIra44sdRDjzxt8iXUdbmLfvnw2
         gNJ+3Pdzd5vF5BBINY6kgsYKhmQyl5XiWdpUxaC++RJ8cLbUm4SyZORwiuRqDEM5Y0zD
         dQ+jXIOP0Z3j7Xf+kv3gAlJQOHsZLXDpjQN1EIQDU3WrXwDBAmP6+Dn/haG/2wSgKeW3
         m0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724195931; x=1724800731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF6wfgyRdYKFN8d5+8XVfRoeXiJGMMUTPZXUm54bPBc=;
        b=eVHpE5gtq5UsCPAqnjYJU8U7/ux/RrCZnQZZAJqq5Gi8CwNaDJ3cmwdHkU+y11fosN
         gaxGkqbT6hbLMsF6Ayj9zWcxjiXeLyYrq5l8UclhMSjfS+t9nlTIw68GBm77SL9mj6JG
         bOnHVeCoVfRGhC/sdyPQvKN0VoAW0lrve+aq3WCaO60ot3yq67vl8JESAOYhkGbEq0UN
         ocT3FYz5u22VN2fFegDkqCLN6ZeF0eU2UoNVesmrCtl07RTjQVWJck+JboCswpgjurQb
         mgB+kp8xemAOL2P2+MEw81GY1Wf4Xo0bxUUp8jPA6D1zpiBrJH8LZRh1c2B3d9DTqYkQ
         5uGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUov/t7eaMFjFynDFfPnc9rZCXCjM6QNWuUyXleSppZuUmnQjbvTXQ7TYHZ78u3CY8VhcE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSZuMllJcj4nD5to5jlsCX7REXwUew1me1WKpbETWgstXXTpQn
	anZHoK5XqrOHscRN2wSlXpNx3mNezKQXtcY/u6bZlQiJZLudseAbw7q4N9AMyWMNc5RAgCiMXWH
	qHyKMd6Q1um0D2oWZM/RamyNhHXY=
X-Google-Smtp-Source: AGHT+IE1Ov1daYK0RsGFoMEB0RO19ht78k22yFLni1S5zEZjKgYuK2roDvpFAcrUbgGVXqiTfaLBjGwsK78HhqStM+U=
X-Received: by 2002:a05:6512:3a94:b0:52c:e084:bb1e with SMTP id
 2adb3069b0e04-533485565cfmr211475e87.13.1724195930268; Tue, 20 Aug 2024
 16:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
 <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch> <ZsUXEkc5A5IBLpJv@shell.armlinux.org.uk>
In-Reply-To: <ZsUXEkc5A5IBLpJv@shell.armlinux.org.uk>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 20:18:38 -0300
Message-ID: <CAOMZO5CymmmUUhBrYwyCJ54sj=55wAVMqWpuYRbJOhoaroCUXA@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Tue, Aug 20, 2024 at 7:22=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> This is where:
>
>         ret =3D regmap_bulk_write(chip->regmap, regaddr, value, NBANK(chi=
p));
>         if (ret < 0) {
>                 dev_err(&chip->client->dev, "failed writing register\n");

Yes, correct. This is where -EAGAIN is coming from:

[    1.745657] pca953x 2-0020: supply vcc not found, using dummy regulator
[    1.752502] pca953x 2-0020: using no AI
[    1.756579] pca953x 2-0020: **** failed writing register: -11
[    1.762510] pca953x: probe of 2-0020 failed with error -11
[    1.768298] i2c i2c-2: IMX I2C adapter registered

The pca953x driver tries to write to the i2c-2 bus before i2c-2 is register=
ed.

This is the point I don't understand: how can the pca953x driver get
probed before its I2C bus parent?

Thanks
