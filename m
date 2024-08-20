Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D4314B96B
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 20:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724186630; cv=none; b=e3vdOhUYjcKJLXL6ymWu30budRnEsGE0atTQvSfBsZYrGtUJMvWuZ2l7tqtXn+ukvDG+/1ISVb/CxgTohrQUvO9WTBybwB3w6CvG5hpxPGWJfe8duV6W/5DE8zhahxCyBt9hGn1IETXopTg1B4h5bjE3Y3ZgADKiG6MuSxooBaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724186630; c=relaxed/simple;
	bh=xHfODCvjIomWKvRJewemD/GWRqIPw46713cNyM5d/xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Idd/JNyTqAyCxLzYqd8BMUqiwQxT7bw0G+RPHYnCMjR2KE9TMXNJ1/5Uwx8F1KUyyLbQsXsnF8tSe9ORpYeBYMoN4h5jRcmr1yR5GwOX+/xPYf4iOTaEnBpCkYYvnBZIoS6iJ7CLJjDbiLMufGzCiLTVbR0kcKfzRnKfdX3Gk/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H10aH7ws; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H10aH7ws"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7aa4bf4d1eso793479066b.0
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724186627; x=1724791427; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWIfJWd1ZGj12rM78grkuzaaBYP2MwLZdKZAHIOJgtI=;
        b=H10aH7wsgvoipREEhX4IEnTISiF7wC9/hTe8dh+d4ZotzgUeNNg18ZMv+D5/Ibar/t
         KLKBcoYZxfWNyJXxNel/JGd7N5oE+9+dJduLvzGHeKpk/F+21kHRJFQxvq1xR34GoopN
         /cfdrFAPk2KOBkvbpAXJiz09E8s/MBRtgJ71NGx2rGZhcR/7gdsIdEcrDbNEiDwknK9a
         vuOF56qhB7aLLwlkDhrf5ECvOLLnW610Y7QKQ39IkpTqrHJGIbwDtpVOCoImLP3zINlM
         5F2pgxNb1e5rp5cibNjC31FH9/rUGPN05K7PfBskzc4RGWRuZoyocwLNu+N22evJbE3p
         cgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724186627; x=1724791427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWIfJWd1ZGj12rM78grkuzaaBYP2MwLZdKZAHIOJgtI=;
        b=el0pSXin1soRqsUIn5mlc2kx/yQOOvCYlBPeLvtniUpuyFsLUggvBgu2sDK5NFmDmS
         DIRGHUc29G/BThiBZ2isjIrcEJW4iJ3xOC5moNHGy/peZm3S7tOmuSWPFiPIRQ50MTKR
         8JU5NWHozR9dW+JkijdEaMiuJdNaMkfiX5MYZxF7p4aEyZwkDbdloEj7LL9XInqKaPwB
         uFYtFNYDoh+74mR0zWtbioYxIh5ukiJXTvERywZWuCWoBmoc2oIkdjTs8wdCqABNsv34
         sDm9q5ktR1yVKF5sDqAVwx/MYwT3KuGG9VaHGeF8GtHb1tTOSAHldRfUTLdP/P6s6v6Y
         2PYA==
X-Forwarded-Encrypted: i=1; AJvYcCVVD1nH2EUv+BZcBoky2X3LJ6aokowcuqKoSdPoSr7NMKbIcXvfdfW/0JdpFcbts09j6SU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhiGQ818PSEt0SUf8yS7sHrXw5o6mkvr6GytiWrAh4nQjnAEul
	Vkl/DRZt7LzZrHvsRGm2zLpZ9xVeTcwvQJF4s4RFpfgjX39FYAaO9ozPPtj6GWlUdUs8ifLo7NQ
	7cKh3y4CrcA4Sv3kV5FNluLB/XGw=
X-Google-Smtp-Source: AGHT+IGKmBFNaEkcmhZ8YrD4EIPSLBbxT8Mfphie51yJuPOU/MbjddiyRHp6dTacol6ihmyMquhDCEQ7QMM60RXHmFE=
X-Received: by 2002:a17:907:847:b0:a7a:ab1a:2d71 with SMTP id
 a640c23a62f3a-a866f8a54f8mr15491166b.59.1724186626921; Tue, 20 Aug 2024
 13:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
In-Reply-To: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 20 Aug 2024 23:43:10 +0300
Message-ID: <CAHp75VeDa1xvK1=mOwMaxvuFQo1B9g2ENUZQtmOdDfNV6zv-Yw@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 11:05=E2=80=AFPM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> Hi,
>
> I am seeing an issue with the PCA935X driver in 6.6.41 and
> 6.11.0-rc4-next-20240820.
>
> The pca953x is getting probed before its I2C parent (i2c-2):
>
> [    1.872917] pca953x 2-0020: supply vcc not found, using dummy regulato=
r
> [    1.889195] pca953x 2-0020: using no AI
> [    1.893260] pca953x 2-0020: failed writing register
> [    1.898258] pca953x 2-0020: probe with driver pca953x failed with erro=
r -11
> [    1.905575] i2c i2c-2: IMX I2C adapter registered
>
> This problem is seen on a custom imx8mp board.
> I am not able to reproduce it on an imx8mm-evk.
>
> If I select the pca953x as a module or insert a delay inside its
> probe() function, it probes successfully.
>
> The drivers/gpio/gpio-pca953x.c has the following comments:
>
> /* register after i2c postcore initcall and before
>  * subsys initcalls that may rely on these GPIOs
>  */
> subsys_initcall(pca953x_init);
>
> but it seems this is not happening.
>
> I have also tried to register it like this:
>
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1369,21 +1369,7 @@ static struct i2c_driver pca953x_driver =3D {
>         .remove         =3D pca953x_remove,
>         .id_table       =3D pca953x_id,
>  };
> -
> -static int __init pca953x_init(void)
> -{
> -       return i2c_add_driver(&pca953x_driver);
> -}
> -/* register after i2c postcore initcall and before
> - * subsys initcalls that may rely on these GPIOs
> - */
> -subsys_initcall(pca953x_init);
> -
> -static void __exit pca953x_exit(void)
> -{
> -       i2c_del_driver(&pca953x_driver);
> -}
> -module_exit(pca953x_exit);
> +module_i2c_driver(pca953x_driver);
> )
>
> but this did not help either.
>
> Does anyone have any suggestions on how to fix this problem when the
> pca953x driver is built-in?

So, it should return deferred probe when adapter is not available?
At least this is how we solve such an issue in ACPI case. I believe
you are talking DT here?

--=20
With Best Regards,
Andy Shevchenko
