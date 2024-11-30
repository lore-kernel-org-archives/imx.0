Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBF7148838
	for <imx@lists.linux.dev>; Sat, 30 Nov 2024 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732966715; cv=none; b=LwCbZjGk0WGAoBjOdKUWm95Fr//DZTxD0vsLGjjRn9b6nSBpXEB6Xk+VMon/NIQKxGMAjO9TBPWJ09jPD8KYVZfneAz1Kj9LgdwP02a+1EYgnrzr8ObsjIAb/S0S0cMNZSofCxS7+f8ZJP+EhsONGlfmctjoFu+CbWPj+EEwK7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732966715; c=relaxed/simple;
	bh=llwMWTWTWdxE0Hpd9KZKubPcqkDdkWEnwBHV/Go2mvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNz6f6wsA3guxvwjLVlwMF5+2XjIzvHb6E413N1nRfLdjit4j3ZlcaTcbOgDKNFggD+XIhbjvIWaOp5bHg8SQ1IgP+7VuISLa2qqi4CfaemVrFiScPEpp44ZdK3/m2IRZMQoOx93BWTH6r5cI3CAnoOgLvSghIXEsPmEVUcPCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9UwqHFn; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9UwqHFn"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-856e7bc5651so1570287241.0
        for <imx@lists.linux.dev>; Sat, 30 Nov 2024 03:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732966712; x=1733571512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbrr2qfB6+/BjJuq7E43lJE1sJas5MBGpSJDZ+XWZO4=;
        b=P9UwqHFns/BShyXKXH6Ygs5aOsbgQBrkG4PJAnjNct6r4Xeh9ds5DdkDqci44w7Si1
         00gIrt11RQhtscJfO9ikrH5m7gUIWtjnJXBdqgp8MZU6gsySDbyC+X28Z3j9rAdYopO6
         UGEq8TlI0GqeIhAvalsSFpHcjrPXi7tYFG8Ue3MzSGw4kog3iuCoAUjor/KFSSEUbzpp
         4eAC+VRlSrLRkgx/R6NTy751DtbK9EQ0er7JrwPXrDIfj+Rqo6VXTuv15Eza2LcKhlag
         QzU3qNxl0rbwSaL5p5/cgyFKImvixv/ZNptRa98YKSKHLwS4WlMoaasWPY2tydOeDmgj
         T/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732966712; x=1733571512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbrr2qfB6+/BjJuq7E43lJE1sJas5MBGpSJDZ+XWZO4=;
        b=it673FkCHD3qIlC6QgSvLzASBcPWegymsAWXqdafI5l9ItWJw8NJZmR7CnBjFOVvxT
         7MFKHwa3g5woFuZ+2vc7TM4ix598lH2fiP8at+dALblwAMLzHlT3YCm1yhztUAiHYGkj
         NpX7+x8Y9eU0SKrvFzdqhQD+dPPDnQWS2GDwcEXUhz3mKtMDVxR040PagnxASfgs5Zh7
         n/oVy7jdxG3ocrzfaAX4mg/xBGPpb81IVGDSttctSUTZivve1g6KE55iNfLVmNKuaKVv
         WNODE5DNGSqfBDrLIcbj7v3dLRMcWMA6veXVc+SFIy9AGitxuyCZQxQm2JxrZcggv5pl
         xGpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9JODNOjGx2uxeJIYmTx7IiMTSPvTFrRQEBzDCztLeZehSWOncCX/XfrnLWu0scK/1plo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoyIFP5Nw9NYkmLGR76JTmChIJlef29KvYlfiJw3hKISGgIvnT
	3rWY+Nf+dlY6nQhaybYEs7Nsndj/DdnkyPLWfHObLqh44RfdHtb3hiZA98Bv7vF+xOQJ6qoyn6k
	tJwaRBiQ8HgQQcepl6Oi5V8LFxgs=
X-Gm-Gg: ASbGncsK5Y3yo0GN5IhsR+EbymWDG3H5RazqjpCqwoPSdjQhzCCMUgUhb1csjGVax5X
	NLJHyxgVOk4vr2lb0bzAJI29bwLmdrA==
X-Google-Smtp-Source: AGHT+IEOjlIPuE+ZgXLyvfndQVoFGvXTAQTOLhdzhSDM04yBi3Tp+D0cxFQCuCqvm5sj20DBHerEXbDd1U2rr4EjqZ4=
X-Received: by 2002:a05:6102:1519:b0:4af:586c:6197 with SMTP id
 ada2fe7eead31-4af586c620emr14093624137.0.1732966712559; Sat, 30 Nov 2024
 03:38:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com>
 <20241108-b4-max17042-v4-2-87c6d99b3d3d@gmail.com> <a7182597-b45e-40cf-baeb-60f69ec2365d@marvell.com>
In-Reply-To: <a7182597-b45e-40cf-baeb-60f69ec2365d@marvell.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sat, 30 Nov 2024 14:38:21 +0300
Message-ID: <CABTCjFB9ybKmNh-xuF0qaWQc_j4zNXW36vimdrEPh2hzP1VsBw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] power: supply: max17042: add platform driver variant
To: Amit Singh Tomar <amitsinght@marvell.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Purism Kernel Team <kernel@puri.sm>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 29 =D0=BD=D0=BE=D1=8F=D0=B1. 2024=E2=80=AF=D0=B3. =D0=B2 17:0=
3, Amit Singh Tomar <amitsinght@marvell.com>:
>
> Hi,
>
> >
> > The solution here add and option to use max17042 driver as a MFD
> > sub device, thus allowing any additional functionality be implemented a=
s
> > another sub device. This will help to reduce code duplication in MFD
> > fuel gauge drivers.
> >
> > Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> > ---
> > Changes in v4:
> > - rename module_init and module_exit fuctions
> > - rework max17042_init
> > - assign chip_type in probe function
> > - pass i2c_client as pointer on pointer, to use same pointer created in
> >     MFD. This allows devm_regmap_init_i2c to cleanup gracefully.
> >
> > Changes in v3:
> > - pass dev pointer in max17042_probe
> > - remove prints
> > ---
> >    drivers/power/supply/max17042_battery.c | 116 ++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----=
-------------------
> >    1 file changed, 92 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/su=
pply/max17042_battery.c
(...)
> > +static int max17042_platform_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct i2c_client **i2c =3D dev_get_platdata(dev);
> This seems a bit unusual; can't we just use:
> struct i2c_client *i2c =3D dev_get_platdata(&pdev->dev); instead?
> > +     const struct platform_device_id *id =3D platform_get_device_id(pd=
ev);
> > +
> > +     if (!i2c)
> > +             return -EINVAL;
> > +
> > +     return max17042_probe(*i2c, dev, id->driver_data);
> and then just pass "i2c" here ?

This leads to hang on freeing devm resources, when unloading modules.

Platform driver version intended to be used as MFD sub device, where mfd
creates a dummy i2c client, and passes it to max17042 via platform data.
Sequence is: insmod MFD; insmod max17042; rmmod max17042; rmmod MFD; hang h=
ere.

My guess is that it is caused by a new pointer to the i2c-client. New point=
er
created at `platform_device_add_data` function call in `mfd_add_device`.
Since C is pass by value, new pointer is assigned to platform device data.

--=20

Best regards,
Dzmitry
