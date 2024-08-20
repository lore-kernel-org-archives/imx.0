Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC1A49651
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724186862; cv=none; b=WlKI3N0KRCN5UTNdmEGb2QGr4bMGU7TIoJjHtnzrFl+ReXbMRbYrsIwPeKU3TdYjk57BcXL1NdPFPYsMIvw1e7Bec6g91rqDmwZtpKcl1YQZ/YaYjK4C+NEmSZjz67hjfIKGDVS8zw3GSQPjFUdmnUy/mismURqICV52Q/FY51E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724186862; c=relaxed/simple;
	bh=20jKGGT+L0EemIZaHolnCYzOefW0OCFwhE2SGr1OXOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkF7L0UFMmOLVmS7hZ59a+L647am/WaMMreuiGy4t2bvQNvBwh7CZLSAuveeDtkf6irXLmpfq/PW65topgLDjrccOoTM4ldK183HdoXs9TxYeL/uF21iURPYTP4K0dNUZdq7Ups+l9qa/8lwFiVybJL4PioUuPTFumqRTQngFfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHB76aMm; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHB76aMm"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efd530a4eso9158838e87.0
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 13:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724186859; x=1724791659; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uykUVslv1+/fS0lVXK/wTmxMrj01bPI++FNqDHJmXmQ=;
        b=aHB76aMmiP/K1O4dnwerFYVzi5DRZxp4O7TAtv7O0goZbTabRHypd63V8EntAXKOE+
         vdv0InxIahmJcoDhNcYkeVrDpv8CqiQMu/Vy5LyQ0E+sKXZHeRxZT3Qk0uGrtQ59hv2c
         An869Qo2N94QRGG7syynXKwAs01mdN8+kOx/cx+7c0fEChUr4Z/N84aPby5k/zuFP5uB
         DlYey2ltMIpw/efHAXbF9VMgaad8B5OZ3THGlZoMjYSw+9LGrD32yURU53m90I2odIVa
         1ymNxl4BsPsjQ+6xM2cpyo7BE4Udf4gxTuD/TTMt7NVSpymHbvRe2OJJUud2ZB7ew6Qv
         wEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724186859; x=1724791659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uykUVslv1+/fS0lVXK/wTmxMrj01bPI++FNqDHJmXmQ=;
        b=DXiN7XeTumSlVLcK8HsuXaXAKGsZeUZZlwsQG4o1QWeZeA2rhlR5AQspOS+RzLGDXr
         V4uKnIXBNzSpPX7NA1EkN0V0KBD6Te3gDLVhT3NwhjmtuNcMnNE0JQd47v4Xd2pghWWJ
         gvRNtVYMkAk9OkoYZ75QNueacj/DwfYhCw2M41mVH8sfr5DArNyuv4IJw0/sTkgFkW6e
         1IZcpJTr3Ulrf1s9AcmzSynWpqVzIaMz257dG5M8dnDOfQTow2oDz9OTyzSe7Hp9VEhl
         UCJR8n8Hvy+o46KNucCJzdvyPJ0o1HSNx4ZKuYMqe8a29z4E/NI0b8ssGKiKwdMV+lc7
         6GJA==
X-Forwarded-Encrypted: i=1; AJvYcCUg1Gs5AHUcBuNeVPQWr/yYiF+qKRwDj1HSWwH/PzBGAYbcDHfubZIa4vivbZ7/60R5A+Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQamyziPgb5jq8P8NgjKgwLzYDbSLWLfEENduazIMX4p91xtWR
	skQaZXRPntsmhM7HgZ50bMirrPAFc4wa7u7bueO3Bs1lmDaTTO6wIZoXZ3hu8vVID3z1iDMz7GV
	LYuq6fpcXLUJpB60lfmRGj47Sxys=
X-Google-Smtp-Source: AGHT+IHk01Un61zxCq+yuKZXrMijzTM+kp6mFCLY0BarTVDvWLm6zKKJx8BxgzrLN0AUKvDQ2F9vOo/qoezSuSKT5tg=
X-Received: by 2002:a05:6512:3da8:b0:530:c1fb:5192 with SMTP id
 2adb3069b0e04-533485516ffmr15292e87.16.1724186858765; Tue, 20 Aug 2024
 13:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
In-Reply-To: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 17:47:27 -0300
Message-ID: <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding the i2c-folks on Cc.

On Tue, Aug 20, 2024 at 5:02=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
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

If I register the i2c-imx driver like this:

--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1638,18 +1638,7 @@ static struct platform_driver i2c_imx_driver =3D {
        },
        .id_table =3D imx_i2c_devtype,
 };
-
-static int __init i2c_adap_imx_init(void)
-{
-       return platform_driver_register(&i2c_imx_driver);
-}
-subsys_initcall(i2c_adap_imx_init);
-
-static void __exit i2c_adap_imx_exit(void)
-{
-       platform_driver_unregister(&i2c_imx_driver);
-}
-module_exit(i2c_adap_imx_exit);
+module_platform_driver(i2c_imx_driver);

then the pca953x driver probes correctly.

:~/stable/linux$ git grep subsys_initcall drivers/i2c/ | wc -l
15

:~/stable/linux$ git grep module_platform_driver drivers/i2c/ | wc -l
75

Most of the I2C drivers are registered as module_platform_driver().
