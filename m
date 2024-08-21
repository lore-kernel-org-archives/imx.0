Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC922599
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 00:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724201419; cv=none; b=ezaRJmM1RWC0YNlBMPHWGqwgWr2MVhi22Kp4k6s1nB93HrexBl7Hl/g70pT9wkQZtLJ3+it4VL+gMx0Ox26grofZowXAYlFtyrtEF4KnfQPe8Pai5QJ1pCughTFl+p9J+fdjjfjgEottq5/N1dSShrwTzEwIyecLyuDF0lKiagg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724201419; c=relaxed/simple;
	bh=msnacrG5UMQf3gDfya9KnhEJ/6a9EztOkkXB5ytvD6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T26zRyjsE2kR9ZsOZnNA6SQMpak5cxiKYV5qAlEgzojIE4MMm9CShmqbXUgGjl8t9GR7V28Qbm1eOFdwBH+NuCwKdihEQdnbl5ovNi1Ty+JTUKX41wefgIzaEQ5V8Y+EigZzgLFouc3q0g0+wYCEOY6yEzrSIsq1NpeHi3fOsig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvBX7sXE; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvBX7sXE"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-533463f6b16so882181e87.1
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 17:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724201416; x=1724806216; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoSSvwv5odqYZjwPeP5RG58rSx4Vvocb8gC0RlFGkyY=;
        b=bvBX7sXEhdcMW13CKoJD90v0yQJ0DIfVY3gQ6G0DQefywSXpMLkGJ0tDZOOAAyumva
         dLlI8KnPGEYx2IR1O7WxhyVte5cG19C6LfxB/psN9jYgkqa1HDgnTlf2T93C03a4D0oN
         /yKsJzpLaT62vi6JjsP2Y4xiv+fqaWG3IXs6jJXIzsx4/1wZxC0h3Q6QGz6Hh9XlSnwi
         prNV1OansMUYkWdTUXvzxx3sWQQDs+lTSqcGS5f7MVANQ7kODHKietYwx+9wQGmmGDFE
         WVkSyAEb7B1j0C2qKuso4hCF9hxk9budZBPuXDDA3c5j0urQOBujd1fw4HLZLLFNNY5k
         8pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724201416; x=1724806216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoSSvwv5odqYZjwPeP5RG58rSx4Vvocb8gC0RlFGkyY=;
        b=L3mic1fh3wJqS30L+ldzx8fS1kVSpGBD1X4eFMZnojdOGTJvMER+I/uspSl0BrRPrW
         Xu1X7GjDRCAnvnCSx40K1QMQ1BsxiaKfB7ewSI6DftOpKTXpcsyV7FD3m8JS8486z8Qq
         GIuuaL19dah6+O6x/CAl0HKuSZkEYgJgNH/KND6Zq8PhngYrbzIbpf8obPQYJ4xY2CRz
         8kolt+Fw95wY0D8aUkG6WqUs85c/bdSaaXdwjPvnu2s7HhYMJxEhLwEx3mVM9hy1ugG7
         nd2AsXGyH9i0tLhx1LwhYLs+Xf+vpWuNfZ5hw3JuVxfhBAc2JEhJCkkDQYSzBMneSISG
         0FCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi2y39CvqyBKLj/zEEyiWvYqEJVDNdttV/GbVsIkHC9cfHjZeYlIiRl5LMA1b+tv7GUq0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt4mtT4W+TrKUq//nxTbE8LOg8fAj9Q3/uKteV4nl+HywXzkC4
	mr/8h+JMWVTf3C4Y/WnOppjkRdHTJBq91R0pkc6rO0jJxd03iFXOZZLey90cvgCyHN0dv8iVkgx
	zQmE5OUaxjm0cKzNzpNrAEgMxaOY=
X-Google-Smtp-Source: AGHT+IGL5tlotafgQN+H2oUJsy7bZc97bFjxi9+qWaGa49KFqvRVw45iOBGC5pZO03tsbf3cUpFaLShwN4gYw0QAdfs=
X-Received: by 2002:ac2:4e09:0:b0:530:e1f1:8dc9 with SMTP id
 2adb3069b0e04-53348590f43mr242435e87.46.1724201416012; Tue, 20 Aug 2024
 17:50:16 -0700 (PDT)
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
In-Reply-To: <CAOMZO5CymmmUUhBrYwyCJ54sj=55wAVMqWpuYRbJOhoaroCUXA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 21:50:04 -0300
Message-ID: <CAOMZO5DUmw=PZ_v32Y_xkbOTkQiR-9BPmNH7992YSV0m3Yhbfw@mail.gmail.com>
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

On Tue, Aug 20, 2024 at 8:18=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> The pca953x driver tries to write to the i2c-2 bus before i2c-2 is regist=
ered.
>
> This is the point I don't understand: how can the pca953x driver get
> probed before its I2C bus parent?

Disconsider what I wrote above.

I'm trying to recover from the arbitration lost like this:

--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -491,6 +491,8 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct
*i2c_imx, int for_busy, bool a
                /* check for arbitration lost */
                if (temp & I2SR_IAL) {
                        i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
+                       pr_err("******* Arbitration lost\n");
+                       i2c_recover_bus(&i2c_imx->adapter);
                        return -EAGAIN;
                }

@@ -1487,6 +1489,7 @@ static int i2c_imx_probe(struct platform_device *pdev=
)
        i2c_imx->adapter.nr             =3D pdev->id;
        i2c_imx->adapter.dev.of_node    =3D pdev->dev.of_node;
        i2c_imx->base                   =3D base;
+       i2c_imx->adapter.retries        =3D 5;
        ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev=
));

but still get pca953x probe failure:

[    1.756761] pca953x 2-0020: supply vcc not found, using dummy regulator
[    1.766564] pca953x 2-0020: using no AI
[    1.775333] ******* Arbitration lost
[    1.783811] ******* Arbitration lost
[    1.793701] ******* Arbitration lost
[    1.797455] ******* Arbitration lost
[    1.801209] ******* Arbitration lost
[    1.804964] ******* Arbitration lost
[    1.808562] pca953x 2-0020: failed writing register
[    1.813602] pca953x: probe of 2-0020 failed with error -11
[    1.819222] i2c i2c-2: IMX I2C adapter registered
