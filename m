Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAD218C31
	for <imx@lists.linux.dev>; Thu, 22 Aug 2024 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724324879; cv=none; b=bJJV6lSw7Z46W0k8IIUZXXPE8MdQFUIsaevOxiB4z13mZ6VMw7j4XXKAlnmkNzQiVgxKHHmi91IVByAMVzgKjuU87RjJTzQEd8g90oJ+VhPAHMGVNrLWvS+XpBcCGhxTCf29fTzV2O5ylUiSeg5+6CkbHcRJyBdo6B/bAaIaSC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724324879; c=relaxed/simple;
	bh=9o9vX73qQ0xPZivCudFLswGZR+ZgzahslDW/ZVYd0hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtR6EFFO1Zo8KiTQWDlSPcpGbv6nUhQrU+8y8bwSFxNjd806LfYfBNWNJ+jqYA6WcLg/t0n/lcKHV22h5/WWkMRcaA+qm2E2wPSEcabp0q7aze3vOma9QRJ9NgJPGTA2TjLKmpmX62i09LC6ScTFmOkleeVTUBlXQV3Syzj9bvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8iEw0nd; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8iEw0nd"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53346132348so774629e87.2
        for <imx@lists.linux.dev>; Thu, 22 Aug 2024 04:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724324876; x=1724929676; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWaGIP6dDqiqkhtgs+gT8HH4PnvScWFmXNsEH5TKZxE=;
        b=e8iEw0ndeyiHekqnKXyEZDNIgATr9OD7LRXghQl24qs7kF4g3VoR4S4mxtE/E3C7mF
         B3qtxvB4JiWWLGmK5t0G742p2plQWH72WPHpXUf1P8TrTFFvoTFIYhOqI/dunYBlXepI
         IjLLphC6GQI56L26v/Zyv/CVxvPhUTQr6X5WOeNVGKKm9qZzkwFszrZr7bvSd7CkrNhX
         LzceMNyWuIb5ljAjkx8HQaBE9MymcZHsNxCMsNtluCKXdZ8K+frAaw/n2/M0298xJYO0
         QtQXRFPyl9+GrReZ2v2qL2nOc5x0T3X8zWcAB1fA1f9xkuVQSeq2/mRYgblqJOCj2cpe
         /Cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724324876; x=1724929676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWaGIP6dDqiqkhtgs+gT8HH4PnvScWFmXNsEH5TKZxE=;
        b=m3Cc+LvhAiO61Rtz7DqcnBV/04rpjvEL50eTXJWVTqYWJmiCoWJQiUEVjwtlhUQDBP
         cpJHpDDiAltxK8hK8c101WLzkNbCHb/jCjrBaDRAtlFK5Ul94/e4RileUvubiltjvDp8
         0bqyXOp3hxLS2HhmdHTExvS8ED1RstgYH/s94MPEXBFW802jBQeKmQLr9zNNWYCFItae
         80/HmZNuwiO4tteC4UgVopNvvhsvFMClr+bE0XNavmwUCIW1HMGWFVDoY9NRlWyMwioh
         L53W+I5hq9f/MUqNWUlecOc0/wnxriA+hBzolMqE7XhDPofeG+l7JFkr/psAQEebg/Be
         0iFg==
X-Forwarded-Encrypted: i=1; AJvYcCWtt2JzQJaAkcIbITOehGu/IKJs0b5GlK8rqsQrX6oNDYorsYkUPoLT0eIxukajnfbjsqs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZpWKHpphS/1SiKebwLwLJ6ygXMXhLxDAu2y4IAB3+h6veXgX9
	wqXlfDaootXbaEGYyvmh7BdN3ExVf12n6UxsspbbVWClyP4KUzpVzDYFWzgR4WVp9BXnAiUxP/g
	2Tw9xVE6u2JVq0KPeqNMAis4rOGw=
X-Google-Smtp-Source: AGHT+IHxKn71fneXC0mOrCUQ8O/UhiKqicMYXk24eeQeis0vIsw8HOfefDPZQlRbqHP/GYh/E3J4H1ACbYbxJuMH6XA=
X-Received: by 2002:a05:6512:3d91:b0:532:ef22:eb4e with SMTP id
 2adb3069b0e04-5334859576bmr2742345e87.54.1724324876122; Thu, 22 Aug 2024
 04:07:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819072052.8722-1-eichest@gmail.com> <20240819072052.8722-2-eichest@gmail.com>
 <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
In-Reply-To: <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 Aug 2024 08:07:44 -0300
Message-ID: <CAOMZO5CeT+LvQ__3GUf6teL3=8pZe5qxmFffYJX-h3E27UXwtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master mode
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, Frank.Li@nxp.com, 
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan and Oleksij,

On Wed, Aug 21, 2024 at 8:01=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:

> This fixes a pca953x probe error on an imx8mp board running linux-stable =
6.6:
>
> [    1.893260] pca953x 2-0020: failed writing register
> [    1.898258] pca953x 2-0020: probe with driver pca953x failed with erro=
r -11
>
> Could you please add a Fixes tag and Cc stable so that this can reach
> the stable kernels?
>
> Tested-by: Fabio Estevam <festevam@denx.de>

I am sorry, but I have to withdraw my Tested-by tag.

For debugging purposes, I kept 'fw_devlink=3Doff' in the kernel command
line and that's what made it work.

Removing 'fw_devlink=3Doff' I still get the probe failure, even with all
the series from Stefan applied:

[    1.849097] pca953x 2-0020: supply vcc not found, using dummy regulator
[    1.855857] pca953x 2-0020: using no AI
[    1.859965] i2c i2c-2: <i2c_imx_write> write failed with -6
[    1.865578] pca953x 2-0020: failed writing register: -6

In my case, I can get the pca953x driver to probe successfully in one
of the following cases:

1. Select pca953x as a module instead of built-in

or

2. Pass 'fw_devlink=3Doff' in the kernel command line

or

3.  Register the i2c-imx driver as module_platform_driver():

--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1586,17 +1586,7 @@ static struct platform_driver i2c_imx_driver =3D {
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

or

4. Use the NXP vendor kernel imx_6.1.22_2.0.0 kernel

Stefan, do you get the arbitration errors if you try methods 2 or 3 above?
