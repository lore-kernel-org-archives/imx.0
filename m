Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584212AE8C
	for <imx@lists.linux.dev>; Wed,  9 Apr 2025 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209083; cv=none; b=GWkXx0lZvps+qHeLqdS7m+LH+QbV+ok19MYW4235uZ+eYCh4IUYBI8tq2mUibsIaomH9CCtzLy0OYpkWAw3IhoMlJgEnzjimIenq1qifWN2Pg6lNsVcjPFmrZMO23IboekzvtB/14ol6BRogqtOBiGh4OOkwdZATSUYEffHlzi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209083; c=relaxed/simple;
	bh=/A0/E6RW+zz/Q3F9MNhOyGXOFashPLIF47QpTHlLk50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FeYmhTeef4uimLKDS3lMnM+1zfu9OyaQTPWY9G941d+nDPHxoD6+DVHuOe0s9V4FY/G3EWxydY60yBslMLRQffuYCcZTztTem5P+qQMpbV3dn4DCnI6umQ3MFFLJt9PvgwWltpbSf5jmh17QytXD2wQC6BLZE96fwRpj29whXaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d0l6Y8rM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d0l6Y8rM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744209081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWzyml1e3e0sFCXu/PTQRw2B8guy4dfIE5xDJUgcYCI=;
	b=d0l6Y8rM170aJ85v1aSB8DjnHwDe8SumBL2NtsZqg3kTltpA4SnWGTyzIMyGVA6KWSBymd
	RRHMjd+PaO/tw/avX3kTbBOtBhxUGIfK1vqF28CbakRvqSdT5d8Jgj1vWwH67EH/LNCEOQ
	gNehPM91yeQrWVmZ9yTl0PHMFQ55etc=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-saO1b0GcNJyVTjjQbsDFEA-1; Wed, 09 Apr 2025 10:31:16 -0400
X-MC-Unique: saO1b0GcNJyVTjjQbsDFEA-1
X-Mimecast-MFC-AGG-ID: saO1b0GcNJyVTjjQbsDFEA_1744209076
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2cbdbbae026so270085fac.3
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 07:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209076; x=1744813876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWzyml1e3e0sFCXu/PTQRw2B8guy4dfIE5xDJUgcYCI=;
        b=B6/3+GehpYz+1g5WPht0abxvLO25ztLFXS6LXNe7o+Yum8L/yQmR8XSXUzXU6LS+Ct
         oc1ZvyEbXWOWeiew3gWmuGhblHQGUnSTJSI0VtKMvWdZpuJobxdWtizmDzsJDeQVZCim
         VRac2Ei1EKhJpWz41rjXUmq+azn11XXk9L/6HwtLVHR4K27yxQQDDeCyDV1BmrMBnSQJ
         NFXhm55XXFYnelTuF5BJgbntypcb1OkTaQ22FF49WHWBTILvpHgViv5ttHX+iFU+8MPq
         C5zjfarkAObeGiN+RplIR58H/MrDMTXcAjq0r/LSMrSEvg9UjrzLqg0GwuKjj9+AklzN
         I4zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS9OTl4f4TKlNLC6MOvqBV/2eMs2j1yrvd/4ZDkWdd/mjy7y1I/c4RkLzcVSGQU+jYloQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ9uOt1YojcM6apWY8xgprBBTO1cMXxi5dP7tsDrtGfnS1nk0I
	bxl92K4CnlTpyj3M/nv6XIV3PlXDzs9O2MOpWIoE+eQ4yUUzTKEuuF3LwINJJcF/dIvRNmnhhYQ
	ym2UCMKjYIuACjbDyHGV9pGIMaCXtxEH+3hyYgqUKF1jCior7PZ1uMw4tfjl73ihMABri/iy+yz
	ehpuFKL5Lnvv9DqJqsak1Dd9PU
X-Gm-Gg: ASbGncvNjmmJcVDBB5WpWSpZFr/6F9jcTeBg4leCguWe1/jjAXBD8a+r3YcBPD0oTNe
	O/+O3AD2qWLXmc5ZZcw+V0n+aC+kK6wCdyQqP3b5n1hxpDp6y7HZJLT0DLsMHD1EbjwWD
X-Received: by 2002:a05:6871:6184:b0:29e:32e7:5f0d with SMTP id 586e51a60fabf-2d08df909f5mr633844fac.10.1744209076140;
        Wed, 09 Apr 2025 07:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj15/sfKzjsjKYtAN6/sg9JG469/cZB1MFteleubs5OfTolZvlG+wELSU/pYcsvOH+TTr8CnoX3erw61YVCr4=
X-Received: by 2002:a05:6871:6184:b0:29e:32e7:5f0d with SMTP id
 586e51a60fabf-2d08df909f5mr633832fac.10.1744209075809; Wed, 09 Apr 2025
 07:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250409074529.2233733-1-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20250409074529.2233733-1-ciprianmarian.costea@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 9 Apr 2025 16:30:58 +0200
X-Gm-Features: ATxdqUHzKWaL37Ln9vA_iKRnaJ2sqIT6FJHzwrfyAc7evIoEaSOKgMOMRDePQYI
Message-ID: <CALE0LRscnNFzo-tdjBdQQSi=1EdMveX-eSXyhpg_Bdp6EFiKgA@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (ina2xx) make regulator 'vs' support optional
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, Florin Buica <florin.buica@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dXiz235qEFbZdxJnrg-r9LJ5c5J9KwM89jBIK4_yyy4_1744209076
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ciprian,

Many thanks for your patch.

On Wed, Apr 9, 2025 at 9:45=E2=80=AFAM Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> According to the 'ti,ina2xx' binding, the 'vs-supply' property is
> optional. Use devm_regulator_get_enable_optional() to avoid a kernel
> warning message if the property is not provided.
>
> Co-developed-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

I verified that using the following patch gets rid of the kernel
warning about using the dummy regulator, and that the driver continue
working as expected.

[    7.247679] ina2xx 2-0040: power monitor ina231 (Rshunt =3D 1000 uOhm)

So,

Tested-by: Enric Balletbo i Serra <eballetbo@kernel.org>

Thanks,
  Enric


> ---
>  drivers/hwmon/ina2xx.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 345fe7db9de9..b79e9c2072b3 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -959,8 +959,11 @@ static int ina2xx_probe(struct i2c_client *client)
>                 return PTR_ERR(data->regmap);
>         }
>
> -       ret =3D devm_regulator_get_enable(dev, "vs");
> -       if (ret)
> +       /* Regulator core returns -ENODEV if the 'vs' is not available.
> +        * Hence the check for -ENODEV return code is necessary.
> +        */
> +       ret =3D devm_regulator_get_enable_optional(dev, "vs");
> +       if (ret < 0 && ret !=3D -ENODEV)
>                 return dev_err_probe(dev, ret, "failed to enable vs regul=
ator\n");
>
>         ret =3D ina2xx_init(dev, data);
> --
> 2.45.2
>

