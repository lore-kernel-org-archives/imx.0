Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795652052;
	b=ceSKvdehH+OLjDaIm5w0BxkIQbnom7fBxMFb6vtUNtCYokKv8JVpLF1hrVGL0mwuKi+P
	 8Fj8Im2hly9+Tr3W6Tt1gEMBQkq15Kd7PzgFHcHRlX73qNAbidxNI50euw16tedHyySen
	 5g2/vQCvQCZ8HHLMAtTg0wIMtaQKbFVEiTsNVVtyJXgBpXHN7bvpOgSp4nzt5KmjMRU33
	 vrigNOT79xGLth29JlcJOMVGBpOAZ0Y5GCmz0iG0lll7DDODjANTvJzxlLpP1BPJPb1ux
	 seYj1+BUg5ZzYhrIfrtYvPugy2KbwaeFIThcG3Hr8Xsz/kWfPtnaDV2ivwMUtFtE31w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=;
	b=kcwd0lPdNOq8u3DWsrI2u0gLNLil16gDjK5G7QdlZVoAUWSZb6Tf+qwMYguDThvQv9QU
	 nhTP8LFMUiIVl3pLUuS+jPRQOD7J4IZ7/cWG3ryrTVZngCDXNORJImvSIBq3VMK+vX1Ya
	 RCUNBzAOhZ6oLebpktoS9gIb/eztXSLluf0NNR2cRSCNcTq7WevuZuBZkl/5kzwn7TH1O
	 dOIgYREghDS6LdBd3/Txx1kQXfyrGCehDNCV0RgMlrCvmkobXVTpdgzCM3bQlvLkW/GZQ
	 5DrruYDtcqFLwNZfgbYhhdDzAriqgfAi6cMKgQB/40prl4/V1U6CcJL01DKPi94EaHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vdeURCBy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DD5606A31E
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 00:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21DD5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vdeURCBy
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso13600250eec.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 16:14:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795652051; cv=none;
        d=google.com; s=arc-20260327;
        b=Ce5ulXtSEQ86E0x7LI2/gv3YPDIeJZhr3gD6BVvvvPoD05mYUIwG6HKXh4bkbvY5Eg
         cqyhqO3ONoznZCu9RPjZwB2OD6ZgOBe/IBH5BNdOWQ17w+6VDqgbKv2xshE0EsfCYocu
         clmgQ+F+Pf6zwTfobrS7nJ/6mERX98awtEAzuT4NtkJvl3w7GgFwrZcBM+/A/2BP/s37
         EyRvkmrGAn5srXi8MxHDphjVB5Na+eky3/RZq44ol39b8r2pwCXNJC6PmP4NzAauV2xE
         n972f9qBl5XD8NX8JfVMY75oqe4AKysdYX7c5WClrPEeVUODJzY10pSC2diw2iqvHpnh
         h1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=;
        fh=W84BSlwpwRHrDoxHdzf3/7Biy8k5CLZYQwGvxZg5Nr0=;
        b=W38Nj4/A9AsfgcgF+MU+SZsvdImSR4w+WxiYmhcEaZFrXGoO785cSOWoT76wlByssZ
         MVWIubn77OIGt1KCCzgsSEnTYhVPPNvjDBYrBaBJJjEr3k2x8aIRr0uKGiAW3/BlwEuK
         A84D/xNugNNsK9AsRkotjhDO5y2/Y1HoYy5DuB/xhVFnXTeGPt2CnPJCLc7sgJRnBG2x
         qjD3L94ZV7IGD7uWsTMJd9w5BAlmoQD9BwBbz80qFkI58PJDx64o8xOyXNZgwPRTr/SD
         l0dVAAJA3yAxfqbHNbBAUlEHviF60miZavSm6xbACH493STGrMG7azxn3N8wO0HPO6mq
         7nKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652051; x=1796256851; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=;
        b=vdeURCByaKm1V+mRf3Eouq3PVX75+rOvdsnGJVuxEVokA6LYWVKxcx+aHjdExjCKPG
         M8pYqsDBglSqzY2bi7H8KPzpxFCi3CDl4pamk923m5unWF1mKBNfK5K9mUDMrNeBRubO
         ku+QZyTaPDFkPG9IHdxMWYFNjedRH6VSA96HP6pIWwSbR7Xu8q6Wn/f8zP/ODn8fCwQ9
         yhrYtzNlnVh4k8sYfRU0Yiz422IKzTQpX7C+BKOol/shtesg8g3sCDtrTXpX80SvH+im
         KLhdZFzNzJli9JlgfejsRKp3TUE1fCaHxz1ooorwvo592AEW0cdXnHHgJkTCJfw8fMDn
         EcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652051; x=1796256851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZyKI2qUNxqXt+wcWqV0BvUgrOWmkIinXejzZ4Is8tdg=;
        b=MI5Y0Sz2lDhP6lzmD8A+Zh6EIGZ/crFXsSfzeo9bh8ZXE9HZIASXbvlsN1Pqpko0nf
         egZ0ebNJf45m38/co66tdlIGTdMMQ0n2PK1VufDHMWttqSQfBNBNqP6SNxSMIcKXiy7q
         cNkrMg825YgQkXamYo+r1D183GRwajEC7+UzpUqPSq6PJ17HMSdvn92Y3J5VXQ0Qypei
         fFQWUzOP84XqFAkKBEGXgICRd4GWoQeODy2/d8Kdc8scgFYQL6xuo+5bhP4F0hRU1bNR
         sn8yqPABZzB4ibDIDHbCGFkOtUusX0T6qF+sj4Hb6zZdXBw2og5Zw5HD34PWsC81zXI1
         Y7AA==
X-Forwarded-Encrypted: i=1; AL+hErHZBo7mZjfu0IeJ9Afd7q8aQbAFaHArysjTm+S+vuvwnlwUVBkzxbIe2FK+3RHsEGBK1Dw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+JC939dGwy0PRuJ+589ccRe5OURK+fNEJOFWzLj6Cx05XI2jSB
	t0g5pXWRVDVfJcmpJRpw28o2/2FQAV5wvtXWgTTvD5QXnebenggveesz+8OpFk+gFJ4Eq1b5JqP
	L8P1oaZjHAU9Z99h0AzEpHY/oEEEbNUM=
X-Gm-Gg: AZFdTZdC3A5hGrBgbhvmB2fN2AtyfafmO3EG72VHyBlJxT3hEEKI6VkTqoRijalL4Ca
	y4qdyKwWLnBaGdsN0acJxAvCnyDPNgtziCbRwYdGqt5ecwtPoyUcLd/XZfJ7pUvgiaPWca9RaL/
	6oSIUv0Y2pnEKLlQr70MA9KAE4T3x4gta5yjY6hwasWP0D4vDb4ZuoBwsrMSK4GdgH80A3pxYuk
	uBTkApansLEtNDM4Sc1EB4TJtnpHdO6b8KHrzGvidjLUV7S5EtHEllFgewwzyz2YRuouA97ufVC
	wBgmqQFSi/i6wuVrr8trwRW2CIJsPSKoYWNTwLDDkWWTjb28RaxyWQ3qGg4sgMBwXLw3agUzp91
	772yC6/r4pH9IWT2Toa9pCMcoQ4f32fXkHU0/5xE=
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id
 5a478bee46e88-386a0c0757fmr16642087eec.20.1795652051165; Wed, 25 Nov 2026
 16:14:11 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
 <20261125072026.2997493-2-prasanth.r@lineo.co.jp> <mo4vj2higl2dmabkeslouimdgoeofqlkyjnngytv5wmub2h4w3@t2ayiiw4qaoz>
In-Reply-To: <mo4vj2higl2dmabkeslouimdgoeofqlkyjnngytv5wmub2h4w3@t2ayiiw4qaoz>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Thu, 26 Nov 2026 09:13:32 +0900
X-Gm-Features: Aa3M54oCRfqrPa_wvFbRD8sm2OXWz8lngNEw2_ns1ZE4Pa74ZiYvVwkIIJgdohE
Message-ID: <CAG7eodFb_-1RPoe8Ha97NhxWXo7BdBjkFvWNOQ7PqYO3U2KCXg@mail.gmail.com>
Subject: Re: [PATCH 01/12] rtc: snvs: clear the wake IRQ on unbind
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	imx@lists.linux.dev, Support Opensource <support.opensource@diasemi.com>, 
	Prasanth R <prasanth.r@lineo.co.jp>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, CL Wang <cl634@andestech.com>, linux-mips@vger.kernel.org, 
	Paul Cercueil <paul@crapouillou.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marco,

Thanks for the feedback. You're right, I should have added proper
error handling. I'll use dev_err_probe() and address this across the
series in the v2.

Thanks,
Prasanth

On Wed, Nov 25, 2026 at 6:18=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Hi Prasanth,
>
> thanks for the patches, please see below.
>
> On 26-11-25 16:20, Prasanth R wrote:
> > From: Prasanth R <ragaprasanth@gmail.com>
> >
> > The driver has no remove callback, so the wake IRQ set with
> > dev_pm_set_wake_irq() and the wakeup source enabled with
> > device_init_wakeup() are never released on unbind.
> >
> > When the driver is bound again, dev_pm_set_wake_irq() finds the old
> > wake IRQ, warns "wake irq already initialized" and returns -EEXIST, so
> > the driver prints "failed to enable irq wake".
> >
> > Use the device-managed variants so both are released on unbind.
> >
> > Tested on an i.MX6Q SABRE-SD board by unbinding and binding the driver
> > through sysfs.
> >
> > I used an AI assistant (Claude) to find this and write the change.
> >
> > Fixes: e7afddb2b4d2 ("rtc: snvs: use dev_pm_set_wake_irq() to simplify =
code")
> > Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> > ---
> >  drivers/rtc/rtc-snvs.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
> > index d99a352d6..647952dcd 100644
> > --- a/drivers/rtc/rtc-snvs.c
> > +++ b/drivers/rtc/rtc-snvs.c
> > @@ -383,8 +383,11 @@ static int snvs_rtc_probe(struct platform_device *=
pdev)
> >               return ret;
> >       }
> >
> > -     device_init_wakeup(&pdev->dev, true);
> > -     ret =3D dev_pm_set_wake_irq(&pdev->dev, data->irq);
> > +     ret =3D devm_device_init_wakeup(&pdev->dev);
> > +     if (ret)
> > +             dev_err(&pdev->dev, "failed to init wakeup, %d\n", ret);
>
> If there is an error you should return here. I would also suggest to at
> a proper failure handling for devm_device_init_wakeup() on all the other
> patches, albeit these drivers may not handle it today. Furthermore these
> days dev_err_probe() should be used during probe, so you have a pattern
> like:
>
> if (ret)
>         return dev_err_probe(&pdev->dev, ret, "failed to init wakeup\n");
>
> Regards,
>   Marco
>
> > +
> > +     ret =3D devm_pm_set_wake_irq(&pdev->dev, data->irq);
> >       if (ret)
> >               dev_err(&pdev->dev, "failed to enable irq wake\n");
> >
> > --
> > 2.43.0
> >
> >
> >
