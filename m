Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A81AF4D3
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724237716; cv=none; b=Ik6Ej14gd0Nem78rUH+uN5bEyZs9Cj3HM65WMG4HK+WQ1/ZKSi5HJIt1VAEvE/z3oNt1+l2H/n/hxRHsugVT39oN0mIDj6evxLWydfwbuqr5m/xDJCyy4Rk59txw7gPEMNtKqZxEF0tWoV7QfwjUcEQpjKvvQMWbPws+NnU+KQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724237716; c=relaxed/simple;
	bh=LdumwN1jo/n/KBtkjPSwNc2sSNEbK5/h0uSru882m18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSnWoSDih5Fb3fXDCrSghV3l1euGpv/6s9AzXwnZDTql6FKRM9qsqPat3lSMdArV3vSAvjJetsxmsRoAgtwvfA0b0VrVrgdQz6rSVOnPw1c8IVQy0MT8uUL9o1JXr9NMyNjgtjsugm49xDmuYYNEkowYSOf0Qhiu7hQZENUW1pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esOi2FQn; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esOi2FQn"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e1654a42cb8so1798578276.1
        for <imx@lists.linux.dev>; Wed, 21 Aug 2024 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724237714; x=1724842514; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdumwN1jo/n/KBtkjPSwNc2sSNEbK5/h0uSru882m18=;
        b=esOi2FQn4uvD7xbowE3j8xWqHs5K/UEWm5N4IoCvXbehcZL1oaGXUtp/cUF2XoLaDn
         EZO+iWAoWYklsSA1HtqPhpyS573jfgGS1+DlaGDz+H5jUwWjW7ngxfMxJC8mhZUZbOuY
         oraqITjdYXP+Bacp1hr91aQTt7QczuyGOvLCmTpImmwS5PT8t4PrTLQF3hFwyzIFORdM
         /gM/yUapAP05LlruWil+67okbU+8avVEriH0tuuR0AZ9Y7cfCCHZpg5/HvfYZ4nt+ojd
         uTBt1NIZOg4JmwruJmdrVK4Ev39wU9ForyMFmbvrgmRahjYA6UKecB8EEVZ8LOhC0XJ4
         aDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724237714; x=1724842514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdumwN1jo/n/KBtkjPSwNc2sSNEbK5/h0uSru882m18=;
        b=m2Edn+MqScK3cRRknVs8BcjEamUjgGM0Mv1RdEniZMHzB5LxFGfwMgRgCEHkHTGG1X
         ufY0aey3lSXiF5QmncZiX7CrFO2zaH7XpZbuPOh9eTTJF4TNtzksV9QR/xgDBtU7grmv
         UnyO5O7E8xjKe/T9B8sNhtTHJUMnMrtXlN4Y1uZS5vIkGs70/T3FH0rroizK1t0tCPja
         2ulGAWFc3lsaLNVztw7mzvg6f/J94lOY86Qpti44sMLrPDAHAsopZFfmarAqwlHt5+q7
         NJeRaMIVHJwyt63wRsm5PmK51rjWJGi67i3DF+WwbgZa6vp00n2wngtRLZ6HHo0/5NNh
         HxBg==
X-Forwarded-Encrypted: i=1; AJvYcCWaAV2bq2fP4OjVcoKkJW1sQqKSVNZ2wobxitxuu6BSoyDzZdeQ3+apdIXVhJDah5Q0ztE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyaa4vI23V2wW5JPwbyeLOBrzPILOUb+4/rRgw8WLdS/LpU+pE4
	LwIRS3W1HG3PR8PulRrml6s6mTIj9er6v5SvyRIft9r6VMh+JgcKLb3+iQAkB/L6hPPHWXay8Tl
	qsozAtTxDPpbsRgOGxlNy+CAPUTs=
X-Google-Smtp-Source: AGHT+IH3vI6LbwOUVb+46FaZR6BIKjdGiYb4a97FSAhxpbogC94O6y5okZKDM4QDYpM3D9grOhSHMFn22LgX3CznpNc=
X-Received: by 2002:a05:6902:18d3:b0:e0e:af13:b773 with SMTP id
 3f1490d57ef6-e166547b8cemr2745174276.23.1724237713710; Wed, 21 Aug 2024
 03:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
 <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch> <ZsUXEkc5A5IBLpJv@shell.armlinux.org.uk>
 <CAOMZO5CymmmUUhBrYwyCJ54sj=55wAVMqWpuYRbJOhoaroCUXA@mail.gmail.com>
 <CAOMZO5DUmw=PZ_v32Y_xkbOTkQiR-9BPmNH7992YSV0m3Yhbfw@mail.gmail.com> <ZsWDicqAjmkHgaPD@pengutronix.de>
In-Reply-To: <ZsWDicqAjmkHgaPD@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Aug 2024 07:55:01 -0300
Message-ID: <CAOMZO5AzHT79v4BnfoHqSt+S0F7hk9xYMZQPQOtXswqK4O4ygg@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksij,

On Wed, Aug 21, 2024 at 3:05=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> Do you have a multi master i2c bus? If not, can you please test
> following patch:
> https://lore.kernel.org/all/20240715151824.90033-2-eichest@gmail.com/

Yes, this fixes the problem, thanks!

I will reply in that thread with my Tested-by.

Thanks everyone for the help.

Cheers
