Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA871C579A
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 21:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724188454; cv=none; b=ap2Q21l3DXiU+91xnPBFP1TOHgrOcmeerThf2zGVLSe1CGSQV5oPg+tNquC76ERAtFWe6wCEfbnh+C8VfhlpSU9o8kcCzplVfKt63WK6BScungF4j1WImTMSl8/NZ5m9plrnW9vWW19tXdlg0mBAMGjoW/TzGAFSIg9A0t6Prkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724188454; c=relaxed/simple;
	bh=ZwQt+rff1B5sI5B9eMQJbttgfA71oEimpv/iurMNl1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PX770HT3AAP/LjCnaI2gOnlF4iwg2N647IWXhzbGeUrMlvQCdv0A0TyIgSdnlEuC+2AMfRhIKexBeJMJLefIMtyWvGzV1/dIfFlwU9TI8hrOoECQPifgrsv1kDUADox4cylad4JjsSH9uJUOuguIwqA4jnxQcOv9I5a/koDMmYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7a1QpJo; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7a1QpJo"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5332f488c6eso5616048e87.1
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724188449; x=1724793249; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z27G+KZ1i6csWDLjej9MQz/SC3L2sZ8zDE2Y5uQJoKo=;
        b=m7a1QpJo6qCHC24RqFv07A34dGv2fsK3KVChU6QTrmiiPcq3AMunPicmbG2ZSNnLvF
         8g0FVyOugEI+HhkMLyPiL6Yaoou2y1wzy3EqIEhtbv+B0gx9QbgjiwF+UaqNefjk2Y4T
         jXa6RCaYscZNattyByWoGwdM7xb+3/fQj1ixz1mR4H3rhoD/oo0jLNRFXphwfkmNbyWE
         oweCZZh6kvy0iqIMNyChS5sf77kKFTOwPwORdjrWAC22KHIzr4Sy7JyLYazT9yos+04M
         oI1BIlt1Hn86R6XKrCxJY4yL1zIwY/Xf/edUNxw6/k9B0DPcyX2A+jeJU/5nh8UaVALD
         odjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724188449; x=1724793249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z27G+KZ1i6csWDLjej9MQz/SC3L2sZ8zDE2Y5uQJoKo=;
        b=u71YcjtbwWjclZ/3ooGHu3VnZUs6J9Yhs46AD/z4b/JqAwpoiq88tgqNYhrmA0g6cw
         LeRbDhRawk68xxEycErIfe7uopjNW2vPMHv0edKE1ybyME1RFHqolMujRwBEox9GeW6Q
         2ttfDUm6aj/8JrR9Sd2T51QhVcJ22XZiALTN0ul2W65LzpG0Zlc0IX2vUq0dhlhKSY5f
         eBymCbxxWJsDSIRe0NEdfu8WpEsH7peqeviwe55SS8bMB3cjU9RccXcI/fEjS9HTLRrw
         sFFK8oQSb+pKkpsivGF9yzSZ+2p1O61IqeH8TMFcbg8NMKBztXsMuYC977hydhVRGlSR
         pHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvBBPJe7jtWKSoaRzv4iRQeEoUsjaGm5GT5Vb1Plm/x/lh11ZXXd/UjaWGx8YCfp1peIo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNf6TNEDQ/bjfxHvF+wJD6OGbnaketRxfm/A/ief+Y6Pro2cR2
	dMSMi/VR5+2Fwu4vs+1NJ9k0S9d1dUgGw9ViwDA7afuJetx7Zed1w3kEnqVpaABolsOTXi9eUP6
	cCt4mCVv7cpgUqzH1KF40Cml6gCU=
X-Google-Smtp-Source: AGHT+IF5fxjqQVY8jq13alEaHc6Dggvp0nXeEc+vPBO5OY1WoHB0rGDIxclqhzig0bUy4UUSJRhaHA9sg7yJNmCE5DY=
X-Received: by 2002:a05:6512:4026:b0:52c:9ae0:beed with SMTP id
 2adb3069b0e04-533485eb474mr12866e87.52.1724188449021; Tue, 20 Aug 2024
 14:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <ZsUAc/7jtfQyNU6m@lizhi-Precision-Tower-5810> <CAOMZO5DLBUwbXukzVJBZx4iOTAR3seX8m6Wdj+a8u_ixvBwkDA@mail.gmail.com>
 <ZsUE3DXG9Ryo0ylT@lizhi-Precision-Tower-5810>
In-Reply-To: <ZsUE3DXG9Ryo0ylT@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 18:13:57 -0300
Message-ID: <CAOMZO5BtU4GEgWYsFKtZHmTLfUF85F5M1dVB=XVg3p1uq2HCig@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 6:04=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> I am not sure how this happen. i2c device should be probed by i2c bus
> driver. Only after i2c bus probe, which scan i2c device, then i2c device
> driver probe can be called.

Exactly. This is my understanding as well.

I don't understand how the PCA953X driver can probe before its I2C parent.

For now, I am registering imx-i2c like this:

--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1639,17 +1639,7 @@ static struct platform_driver i2c_imx_driver =3D {
        .id_table =3D imx_i2c_devtype,
 };

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

No errors are seen so far.

What do you think?
