Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B71165EEB
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724184164; cv=none; b=lD+R3gKsaF3H4pokBsPo+JElulrXp3bArOAHhRLzcM6aN3ufIjOmZgpiqckCqKdYCMdqusvhAx4xBybEjK/FuLqVIkaiTTUk+MYX/OvenQHraiI4JtM2rdauipg84mEQC13Vf9NEVxVhHxkvEhrCGXOd0Pled5vQ5HXgW3nbEGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724184164; c=relaxed/simple;
	bh=Y2gvoPnwuPcNweX0gDBFnW2CM9DEQuzmLotgUqnurcg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=b1dy92qNlspFGzta/krceloZWQzflkqfEo7jj3mwLKoGfRTEW0j0wW7r+80aIJHls6qQBft51rl8t74PYTZttmucgGWWv2s4wOaPY3pPmEIA4o1vKnwjtchaqwWUdDgE0QTP/QTFijiJdcpbun/r/Hqv6xIAyMtwfEnehLOZTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbrP9cZW; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbrP9cZW"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f3f0a31ab2so9810611fa.0
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 13:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724184160; x=1724788960; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wn44GeaNGcKT5PtyKSFiDbQH2xpZLcD1VE9Ua/7Rbm0=;
        b=AbrP9cZWFVROvi7IJ95z+msFo0a0uH4+IvYE2x1QTHyGCTPN1KUfNyI/yaZccHQzfu
         JavMzTipLPSujXVEMdcHJu/XkH8HQGrReOZwOImJMVjeA2PnxqaNcV5JUwdVmNyikbNw
         3nE6m/KXnN6A9sEsHz3ny6RVkIq85xVN+tsmbX43DQrN1XX6AMt923TUoR42fevLBu8a
         cTW7cOtyj5MlWrkx570/cb15XAZdT+yw81tCiN+E8yl8sOPMNp2A82uuSgWkCE7z5TE0
         HQNFuqXzrC/RH0DA1pNtwlyAGf4n/F6wyyoOMeveO5oXZ0szbKNhZIpe6uwQrHziSVUA
         Lotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724184160; x=1724788960;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wn44GeaNGcKT5PtyKSFiDbQH2xpZLcD1VE9Ua/7Rbm0=;
        b=cFjVkMokjxj4tIEn5DlWfMakOjHN3NyJ9zCS6+1iGlScciiAy7fI19t/sTiwjflreB
         wkU8Y98mQOz90siznqITTZRwcaa2RmdFWnkBRUIkRhZJPis3+leGFkquMJU2k63Uq129
         BdEg4mkxZGsybBhMfnMpkGDjkb92pq9Z1aCK2Wc0qt7DK4ohqPPbN+LmiB7gfO33IJWi
         xy6xoyPlwzNnHthTsz/WB6IsNnyBDnaSK74H5VV6VLlQHEQ53Hz/y89NRTZ0whg3m/Rg
         6V0sb9ApgP04rIq3S8IRZd1znRuWuWfSxfWZQnMNAtgaur91pTwZtmbUS5Y5gvou0uZh
         GDjg==
X-Forwarded-Encrypted: i=1; AJvYcCUdsuGN5cSHH3bvDHHx6f/ld2JScX2gtx6QZ4Fy5tb/JETBZJr1nwMvsMmhyUSC0Xt5hNM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8NUffS0WQeeZobpSuAS/xpLWMRTPArZ+2gul5nZhRPuWWvupR
	LMD8rwBkO+bQPvTRzBL6qVCdcIy4HjUwcdoWVU6h8ez9y0PNQ8U6Cqmq+FBUol5scNfMbBLcXsS
	pJUyFN4GsTSC0h+fDFOuyrXGFEeKTFwaI
X-Google-Smtp-Source: AGHT+IGICkMdmQeBoPAcCsMpSkAODPNo2FxX+Phd9Wq4JO/GeU7rwvtJw5JbyIDLW6L5Hy+XNSJKf/t1p4GjGIvjyR0=
X-Received: by 2002:a05:6512:114e:b0:52c:dc25:d706 with SMTP id
 2adb3069b0e04-5331c6e3961mr10034068e87.52.1724184159657; Tue, 20 Aug 2024
 13:02:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 17:02:28 -0300
Message-ID: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
Subject: pca953x: Probing too early
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi,

I am seeing an issue with the PCA935X driver in 6.6.41 and
6.11.0-rc4-next-20240820.

The pca953x is getting probed before its I2C parent (i2c-2):

[    1.872917] pca953x 2-0020: supply vcc not found, using dummy regulator
[    1.889195] pca953x 2-0020: using no AI
[    1.893260] pca953x 2-0020: failed writing register
[    1.898258] pca953x 2-0020: probe with driver pca953x failed with error -11
[    1.905575] i2c i2c-2: IMX I2C adapter registered

This problem is seen on a custom imx8mp board.
I am not able to reproduce it on an imx8mm-evk.

If I select the pca953x as a module or insert a delay inside its
probe() function, it probes successfully.

The drivers/gpio/gpio-pca953x.c has the following comments:

/* register after i2c postcore initcall and before
 * subsys initcalls that may rely on these GPIOs
 */
subsys_initcall(pca953x_init);

but it seems this is not happening.

I have also tried to register it like this:

--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1369,21 +1369,7 @@ static struct i2c_driver pca953x_driver = {
        .remove         = pca953x_remove,
        .id_table       = pca953x_id,
 };
-
-static int __init pca953x_init(void)
-{
-       return i2c_add_driver(&pca953x_driver);
-}
-/* register after i2c postcore initcall and before
- * subsys initcalls that may rely on these GPIOs
- */
-subsys_initcall(pca953x_init);
-
-static void __exit pca953x_exit(void)
-{
-       i2c_del_driver(&pca953x_driver);
-}
-module_exit(pca953x_exit);
+module_i2c_driver(pca953x_driver);
)

but this did not help either.

Does anyone have any suggestions on how to fix this problem when the
pca953x driver is built-in?

Thanks,

Fabio Estevam
