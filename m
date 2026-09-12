Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A153A7F47
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240237; cv=pass; b=DYZmm4/gu0RV7Onmsy1gKJghOX1NokJ/qYUuTSj0AFHQ32rveV6Dh2kYTYCYAPwjsaj+uCEeoEPKzV+4fWXOvFaLDRgCjenMnSabTFKzgv+qBneBdsrLVn/Pai1upLYsPJZFlsMehl89foHKjHDRQMzfMlEAq9PDs5FaTaEuitM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240237; c=relaxed/simple;
	bh=nC1HlSANXwPCu0TdcZsZ/ITYqsAJked312qQsvhydMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfjotLhVrZ8McjGo8FlDE4qbKarpaWCg0Jqzl+CPQDAwoR+J1wfye3n2VO55XgNy2mxTft8pywtWK54iNg+hCEFR9OYCOVbE1E7AQQc99FaF0sOSvqFs8QJWAQd/w099EnQF1c8VA0TvenS7izNez+sX9RQ2bWWyYHw8PRepWDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO4bRH/d; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO4bRH/d"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43daa8f4so7933847b3.3
        for <imx@lists.linux.dev>; Sat, 12 Sep 2026 12:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240234; cv=none;
        d=google.com; s=arc-20260327;
        b=HRV2R3dvh/Wwn21MwYktFRNTna/dp2TtbUbPMILZGNYNWeD2b2/m1HWzhv1mFTE/xa
         0DDhssfZ/iPHpop4ldoYUUdJO+x22Ht0t2eS193GbSKngWYWn3IRbXxXX2TIrZHQjGKD
         KaNmnUbkWF0Tx2e0zDYyvtzWPicFgaKzTVmqN9VlS/eeSAtdFwWvrtfsd23VpK4aTrxr
         kAn4koaX5Xh8PoRQy7ZaA6ZWqWIfHdUFgn4qHV/vP5FshXCkHoUyavcXZKDv+O0t1+28
         QJvS6yci8RIDuIg2AWNu0Q1XhR48bneHUlPr8pG5FkpEP39lAh9BvQJfZwuW4C9VQnLU
         E3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        fh=hG2ems7dHTgL/kWYjIrqIPPoCjEhwtPxxvDWEMSCpsM=;
        b=ANCrKM/HILquuCj9CSEeGBXsBxwi/EobC5hP7ZNGjOE8cnf4cAC/z+r5vroAJQ6ocK
         sask7jlAmckHwW/OEC2CxZtaSvznYyrR1MXfZcqib8fpDw3MHozWIOH0JL8wZL9eqdjA
         GJPNZJwyQehW1K7MojG8J4auZBvY73sjv9Zhzyuk5N6XtS2HJsvECD2rOsQF0JCuXA0Q
         DpVLRJRcm3igD0zq0Ya9ivu2tnVocr+8RE9A8NaBxQY6GP4x8WuEWrIhCR94BdOB6Epe
         GE7bF8j33hbln4QYD1MTaDJ5plXWParbRp5PISYBNCL5BMXmQWvdV/E/3UTNd3f5xx/8
         rCdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240234; x=1789845034; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=AO4bRH/dFlfqPwg5NBKTHBKEPdFtQdyXi1EN8WbArQXxoFJDC+ClFsKPEygF5Fse0R
         4SXbv5k7dgtWFEuI6GmFuIzHVpt4CQRnRmoqQm95Ms1JAmk4nLXfUn8i8581IK9Jtxjf
         J0/eiFTdaje9wcxKkeOxm+iZWA6M5YVu3ErstYP0qEAGLxA14uw4pIXihmnmpkA8dkYu
         Edd0/7Hp31rYsIAz5UZwc0xk1142MNdJeqaifHFLY3lM85mvx6EI+v1g5hPkFEvj71GR
         8jsxwinPRJ0pK214s1Q75blEBPTrNsUdS4c2ITw+9z4VQGCg+EZRv7NXj1YStuq6LrHo
         t73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240234; x=1789845034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=o8IFjQPdAeU+TqpeTe0iVVUe5U+TDklMOm2sfsj/CBEL6PQaF/0loFg4BpFqA41CTz
         skiRK9C4Jj4vf/SItbrvxGzL3+vdkJnFBmXVcIxYMmG4rycRlMjPFoXhEa8/fu10+/7L
         ka3aBNr+lUqinBL2kU7P37DcIMb5UAWN6TgpUX60BXeVLazD9hVfOA/6la0ahnqz5t2S
         QfWCpJoZCfpuQ6UdkCeJ8Ife7cb76wBP2tgtejBnOzVeCXKtbMeBCqK+n+QJR4A1ahHa
         bKbDuDP/+WdxY0mfV+5trOvf4NCaZaH55E/AebV4JowdjO8R6idmL4v0lDCictsrLwJq
         po9w==
X-Forwarded-Encrypted: i=1; AKwUvBwZ/4Xz5kYRKM8TtP3iRH01wtej/sl+0A3QcxWFGo45LwI0EtijbKuWGSO8w1Qa0wo33VU=@lists.linux.dev
X-Gm-Message-State: AFuF++n3iJ3yaOBHsptSrK87eFzmPIKIs1D9XFeUM3muTpRPInYIFfOj
	QHjSukfrd3/6Maikf5SaMrA0rakcg4S0tPV7TRhCehgcdlpWV8z02L93rSpdNxcIOEIH8AWDulD
	zmxpDCNBDZMY3e7TGk7tWQKUrwJJNfkM=
X-Gm-Gg: AYBFou1GBknLkS8fTT4eDqPoogaomNztF16bL6nXtNqnFNpzOOw46gI7ZSzp8KLDKR4
	E9WTlK/u4xKpEwXbO1s083uR2U4ObZB/Xm5h8/YOIGqfmptb19VouZFQSCF4arAX/jGLFlvYPRJ
	fjUrHI2eCEXJA9CyWCVDTEFtKenW0OD3I7WZuCZLff8FX/cMQZFNI0OUmEtCd0ByQoCmikE/ygb
	U5posL+KFPhWDsrJL0Q023J2utDW2zxgkM6obFKh7vaTR1FfOktQglWeCKOUiJ70zYlDOlXmDhI
	y9ykRn59EOJpGxFJ1ec68BSAY8bmCABwzKDDxlUKi+6FPNhqUUdu
X-Received: by 2002:a05:690c:9a91:b0:873:5bd1:98b5 with SMTP id
 00721157ae682-884b200e9d9mr29464677b3.39.1789240234520; Sat, 12 Sep 2026
 12:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-6-sumeet4linux@gmail.com>
 <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
In-Reply-To: <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:40:23 +0530
X-Gm-Features: AcwNN1WFgZ6qmRCXqz0Ywv_tzPCCXsJ0jqSiA_xFTFPzs4rsV6HyVJPe6GfuozM
Message-ID: <CAJ9orWRgatqn5gLx5+eDu7-T4s2PWcoVQPvuyMBgEp-KwDwkfQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] power: Use %pe to print error pointers symbolically
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org, 
	thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org, 
	sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com, 
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/09/2026 08:17, Sumeet Pawnikar wrote:
> >       }
> > diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supp=
ly/cw2015_battery.c
> > index 1bcb60cf763d..48643f7bf503 100644
> > --- a/drivers/power/supply/cw2015_battery.c
> > +++ b/drivers/power/supply/cw2015_battery.c
> > @@ -658,8 +658,8 @@ static int cw_bat_probe(struct i2c_client *client)
> >
> >       cw_bat->regmap =3D devm_regmap_init_i2c(client, &cw2015_regmap_co=
nfig);
> >       if (IS_ERR(cw_bat->regmap)) {
> > -             dev_err(cw_bat->dev, "Failed to allocate regmap: %ld\n",
> > -                     PTR_ERR(cw_bat->regmap));
> > +             dev_err(cw_bat->dev, "Failed to allocate regmap: %pe\n",
> > +                     cw_bat->regmap);
> >               return PTR_ERR(cw_bat->regmap);
>
> return dev_err_probe
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

As of now reverting the change for dev_err under *_porbe() function
and planning to post V2 for this original series to use %pe for review.

Thanks,
Sumeet.

> Best regards,
> Krzysztof
