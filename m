Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880845BEC
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 23:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724198208; cv=none; b=gv3KS723xCXInHC+8FNbsO+9fvLkTPz4eLLKI7obl1P3ydYtPAB74+50K+MKoCc68tQmTlsghayWHQOBEGlAoqRUAqEKIhUF1Ss4DHaREW5dTcz4n1SP5GB92+4/XZgRlCipZpx0se2rAOZl7GYRjYqdyZFYkacKY8387bs+J9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724198208; c=relaxed/simple;
	bh=xz4OC+9BQHEFLvYvlpWiMwlUUwfX25q4QeHkD63nSQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rv8xATSRVEgdsEbdvl6OgXNxBpICheOj2ULao/nUHiop2PmwTpQTprcKy6t2dJmowpgNo0rJTlCARxPunhOyj8kXZ42OyxyPMqXXzLg1b0pFwMsG0zFFkzes6ZDoA+zaJQk46CWjUeixPc/25WxwSOg7YzhsaedWKUjcpso/C6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ch+qeYzQ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ch+qeYzQ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f3ce5bc6adso38561751fa.1
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 16:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724198205; x=1724803005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xz4OC+9BQHEFLvYvlpWiMwlUUwfX25q4QeHkD63nSQ0=;
        b=ch+qeYzQDBzUvZZ9Y0PFNZGnUAKlExautmRWgFVFE1iPAEnsuHvE6dkDCpKCk+ILNW
         3vvFIxyWwGI29WY4wFHe2tTvb+g5LJRRH7uYgC/zZfvaeKEcvqWlv4veA2lvqRCTB62s
         3xTwHfz7/HQNfWYMqqOX+Ln53A9kuHHCspptjhO2NG5O+iBw0zm6FNjCtzXSFVjohXhI
         /ny6CrkrL9kHxWSeIYXAdwxk9jshZ3EMwxfVlJXxoooOf4ovW+2xfVI0BGMjfaO0NJvO
         uJvefHqcYxJ+ZNFwf7WpJa9dctoztba5AOMTuBJ1UCs7mSSZc+J6OzMNNyxpFz7ZE6zV
         jndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724198205; x=1724803005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xz4OC+9BQHEFLvYvlpWiMwlUUwfX25q4QeHkD63nSQ0=;
        b=p5g1Tj+mCsU5Nt6GyEmY05ab8DIwh9UKHOhKRGOHAC7XEXfmFg3ReR1erQuESXMoYi
         jDBsO3EjLEYfzMwgDlRrGBFzyB9kSbsNnt2NXREikQgdzysN2neoSj27YDDQB8+rfub8
         jZa7T7XMvPgOYjAAJRsygp1FZUbWOWc/nBsVWUt/qKni2Og1MwMiDc9tGsORYpu3q4Go
         ykTm8hG2wtpB16JITCWXdLmjjoj5g9WeLtB9Wn7mvT3r57ofsbvtL4XuMsEI+ZCHXasv
         r2/F8qN9JLz9cDRxRZXQK4LHu7/tx74wkEkDwOiaQsS3GRyzxMMLLopeg9qzL0WLtUr0
         cneA==
X-Forwarded-Encrypted: i=1; AJvYcCXn1/NP9Dzki+XcmdTpgTsly29WceYvwU1HZ9jIn4nVgq6cb+puHewTVPZRXSc2iUofc08=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2xQC1axu75f5FwnXteFP50sphUsoz8s1MLN0szvrg/LQV9qt9
	u3WuJdYKOIMCkpYxuD2onD2hQsDXu1aRSP2t/dmxomPtL5hBrA44cnRD2+JtQPWbyI888qQP/JD
	7GJaSVzYZpQCfG6ntuYx5oFp1PoY=
X-Google-Smtp-Source: AGHT+IG0TkElo7se4gr+uSbTT3YfP5VNfjT6kygZN6wVGQaSiqMPf8kKqtvmXN/0qZMCQJUHf8oKkk8LFRt/ZIu+Ha0=
X-Received: by 2002:a2e:9515:0:b0:2f1:929b:aef6 with SMTP id
 38308e7fff4ca-2f3f8b3ccddmr2899941fa.36.1724198204654; Tue, 20 Aug 2024
 16:56:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
 <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch> <CAHp75Vd3uUge7QFb4eOZb_nGNDu-GFDTZMyS9aZSm-D4LkT97A@mail.gmail.com>
In-Reply-To: <CAHp75Vd3uUge7QFb4eOZb_nGNDu-GFDTZMyS9aZSm-D4LkT97A@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 20:56:33 -0300
Message-ID: <CAOMZO5B2p8JCGON7C5CzyFzsed0Es0wFrq9XKY8mvSeHiVV7Gg@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, Aug 20, 2024 at 7:07=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> I bet on __i2c_smbus_xfer(). Which comes from
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/i2c/busses/i2c-=
imx.c#L549.

Yes, this is correct.

> Very easy to check is to add at the top of i2c-imx.c the following
>
> #undef EAGAIN
> #define EAGAIN __LINE__
>
> and search for the respective line in suspicious files.

That's an useful hint, thanks.
