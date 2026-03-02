Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D4535F619
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449325; cv=none; b=biF48JqEPdA46mA7A76R340F/f8+xElfs+siGVxdsmyTG9JOaZ3vVmD8wSBaRWPum5mHRt/RqPOtP/2sFqD7jGDYJ/dWVqrqnOMqtKx15BxWYR5XCk2daEhbKSxlqE6Mp/0y88pL3lBxhcJvVmBnijcDhOhu6bFE+BBJcMJiNRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449325; c=relaxed/simple;
	bh=FPUUwSTSnHifTg1q09fFBxiGrVRvJtWxYMGk/Hf/oPM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rmBzPUXgEUVHURdw7DdKKXyOfPSVtQliyEFEfj8asiRhZDtxFScWKgILDzycW7PzUuWDqx3P0i3yOKzlSN8HehQGSVZz/gllfPwODh0OCS/xHmsVRWT5gBID13v+bzDJnTbYr8xy15m1vp0yDBN78Y3E1cA5xilzvk1BCuEJW8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQKSpBts; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQKSpBts"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b2965d4bso1118560f8f.2
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772449322; x=1773054122; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l+QuPdQBDjcL4VBMNAL4KvWg4+YAGNXrbh3ohkf1cXU=;
        b=eQKSpBts/fW6Za3sbwjaUl97hidHx01aBSGbh1bG55KdMGiuOlsTgLFj8PzMYW7uDg
         Ce0EB4a0BAGvtJprAyAhv5FKNPUh1jjQNQacvAsECX2l143pJ2qY7aj5U2QpoOJS79lk
         4e61ieIcFteyiaxBxKrfVRFSAb1hZtbvph6b2HpZGagP+BHJjVgWbAeMF1YP+HM5xwNn
         0zSj/MMDfn+414UcE+wl2z4tz4s7cYk18hFlV1sYypFwCxeM9UrB0X5T/EiyGRNvuHIJ
         Jk1LSKHa61H2EJzLhvMXk3XqAkWTlQp7ndqODKE9ZD367AWrMG0EI3NMPeI1wc3cqMHF
         xrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449322; x=1773054122;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+QuPdQBDjcL4VBMNAL4KvWg4+YAGNXrbh3ohkf1cXU=;
        b=SqGBotyg2t/NJpIaIQ2yva8ixIhSz/Ngw+s2upBx8cqloa1e7BR+YJzQ3ZdKSM+sRM
         LlaVLk+6HCQH9t/wTnUjT1aUel6IJoA8jLtnar5iAWAzDdBukmVN+yfiLYozZghGk2sG
         ZasjInI/ennEBM+NdYpqBFSx1Cqdd1/tMg+Hqaot0ZORyRijIs8XBDOFEqo/JC6tVyQP
         xOyz+MMk1xtJL4QME+O+o8OXtas3N/v/r9HJ15xea0gDBrtHXNyjL2ugvZfssX72F+Ni
         dvMH6qbtdSQbs5kYQxe5slTHYcSZxslPfgD9vSruwTLsbQe/GRICx2YVs491b/hGjp6k
         3rqw==
X-Forwarded-Encrypted: i=1; AJvYcCUwLnIOUDRbJI4QBLfTY1X2+FhHHxPbW1ZkG7I+Yjyw9RB/rS1nmNJAcz0dn88lLJ+JRyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAnqXEpSfRJJ6FQei/T7XfrCZqhAWOYBJ32Ah+Ac2FV9q5leS5
	AfpsJeqgJ7J34vpAqmzp4EH5b/ba4Ql6+vKjMEuCSJpbqe8L1/QLd26KkF/Xsg==
X-Gm-Gg: ATEYQzwf9snRxEvDyGFEncK64RPAQGr+MKidZ5a/G9JvyM31igFMw07ggYO4dHeEcEn
	IQ203lwl2nkSiV0EbiR8EcMynoAjmyICTufqGENL/yVzGUXnN6T5NR4MzqnCi0/Q0u3W9POY0B/
	4LZyfxPYCVV4bGQCRxBTNa8I6UM9etFZZF9IdQ/x0MQDF3GJ5KecyP7lXOWISSQu0x223F8NakT
	wXMLTNcondyKM6gaZHGs/It94X3UxFi56ul0epFc/snhdJS0VsWHJLFQbumevAXGUwXKsikKiM6
	S/p+Kw2yblr6N7J0Oq/5yr9rsy9f7HKR3mbhnt19LAUDY/ps7p8lmhCyBOUl9Z/aP2WG66VLTuG
	wMNQh6T3ytNg49YtKkLEAFNaJ4bScGCRRGzBmt439vUtFY3/WqEfHOk396yCVzTn7BnvDZVCsLR
	Sk7jKT4v8DTqQ0hRyA2pKfSkDCgOKCzrs=
X-Received: by 2002:a05:6000:2483:b0:439:ac53:a94d with SMTP id ffacd0b85a97d-439ac53aa50mr10380328f8f.29.1772449321007;
        Mon, 02 Mar 2026 03:02:01 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm26841661f8f.7.2026.03.02.03.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:02:00 -0800 (PST)
Message-ID: <de48f967a50b8f780dbadc562833ae6626be5268.camel@gmail.com>
Subject: Re: [PATCH 2/3] hwmon: axi-fan: don't use driver_override as IRQ
 name
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Danilo Krummrich <dakr@kernel.org>, 
	gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com,
 nuno.sa@analog.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-sh@vger.kernel.org
Date: Mon, 02 Mar 2026 11:02:44 +0000
In-Reply-To: <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
References: <20260302002729.19438-1-dakr@kernel.org>
	 <20260302002729.19438-3-dakr@kernel.org>
	 <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2026-03-01 at 16:51 -0800, Guenter Roeck wrote:
> On 3/1/26 16:25, Danilo Krummrich wrote:
> > Do not use driver_override as IRQ name, as it is not guaranteed to poin=
t
> > to a valid string; use dev_name() instead.
> >=20
> > Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> > =C2=A0 drivers/hwmon/axi-fan-control.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-co=
ntrol.c
> > index b7bb325c3ad9..ec4bbb104449 100644
> > --- a/drivers/hwmon/axi-fan-control.c
> > +++ b/drivers/hwmon/axi-fan-control.c
> > @@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_de=
vice *pdev)
> > =C2=A0=C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, ctl->irq, NU=
LL,
> > =C2=A0=C2=A0					axi_fan_control_irq_handler,
> > =C2=A0=C2=A0					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > -					pdev->driver_override, ctl);
> > +					dev_name(&pdev->dev), ctl);
>=20
> The devm_request_threaded_irq() API documentation says:
>=20
> @devname:=C2=A0=C2=A0=C2=A0 An ascii name for the claiming device, dev_na=
me(dev) if NULL
>=20
> So NULL should be sufficient.
>=20
> Nuno, was there a special reason to use driver_override ?
>=20
>=20

Not really. That driver was one of my first patches so most likely it was j=
ust some
copy pasting. NULL should be fine.

- Nuno S=C3=A1
