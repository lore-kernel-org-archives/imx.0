Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0439833859A
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592547; cv=none; b=o53ngGbtka9uyS0fWhDXwu35/wGxx+uzECeHfFJJQAovky5JCNbO9oLu2nkwvao4bytHJVaPgTdcGPMs9JRDMDyY9cUth91DxuxtwQCx67pWntHa1FbXdcaSqDsUjSkrIds13YK0JClwwhTycydywvoOsVJ8uqNgltX3Z9zJQsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592547; c=relaxed/simple;
	bh=UP+WW7Dc9SoOQ1SJaOin/KlKCDh8HTR0VomQ0nz2Kek=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aJUKdIQCpR3sUousPi9b3E1s3m9ClDbhz/HVFieeTUvBaH0HMR/Fd8psf+PNzqtZIjPdd7i49P+0+Li7D811QDIu8N3890DUBVm22oQS1xT1+NNMSUWb6GVxOkQFqX5Jd3RAwdscp5rQiRv8y8wrYE6iDmcdLT+mkPAiv1OGyWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=al4dvO4v; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="al4dvO4v"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4807068eacbso2316855e9.2
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769592544; x=1770197344; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UwOcfsfrDBPmMGisp6X+dkj3y6n6qfrea/qIENi+t2I=;
        b=al4dvO4vAGA9aMJDkRNkjm/V2vQ6mTIaP+1RYXuyOt2uxwroosp/eBfSGLkHtz2l8w
         qwk9mTMU6vTiBvhHAkv4RloCiY0ZHDxZANgMrQBljb+HEI5F4fLtxjpVSLyXe+TVcpQ2
         sb4tDicu2ZJ0Xy8iDPxJIDjyyu+dFQFsvPR5kqqttJhwrBshh8RSrHMtH8Rnu0wRWtPM
         zTi5BpQn3RveChmvBqiGTQnUz5RDCuKCoIRkMGZFyu3OvPj6+yQGIne4glppRjX4mxmK
         w7y0KLzyVTZu3dU3B79uQU9jcXe0AoXHU3vPn2MsCPyOLVyhGZWjlfXww9VfPJwg5VHp
         obVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769592544; x=1770197344;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UwOcfsfrDBPmMGisp6X+dkj3y6n6qfrea/qIENi+t2I=;
        b=HQn7epcitP1JYWzC68juuuW0jQQ1Ab/Nr9Y07/3a3HEe0mLMu6jvc3+6esVTIz7wN4
         wKm4q+AJSMY8QRab5w6JI7MJQQmOiH7/+VTMC8T8jmvNspiMooYE4KFI8QK+JLdsGx/d
         tPdDskV2eTfEqDaI3sw/gBALmzmkgLgwTczVSIv3XGnu3u5hpQwzeCQb1xEmciRk6/vJ
         7ZIWkhZ7gDMfFI5G4mri2qoGXApilRJ21Ya8oCXAc6YCmajrrNoCeZxOk+9U10HZX5fb
         8jEfXOy5tu36qzLyxslBTNV4h6+D+JHeAVfktoVWwXxX5wtW72RLFVSTLJt/pj4Y1W6G
         Sq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiA1utszBnmr0wbSM3ysl5wQ/gqunNm+Y8ahhzrpj6Jv0SAScQf2PWWoyiqEOSppiyuGw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoOYVFTm3BC1Xsz2yVRP57vjwtw0q6CR8xkwoejDi+WUH/Q8tn
	3zpdw0qSu+6uyQ63afUnsR8MXxJhVWBHl46Ik+ETETxR/az9X6Osd24A
X-Gm-Gg: AZuq6aK0PZi7NFt63EsNnE5QlditZwYjJZ5v0A5fCuhgxVHZOgWYYtgvrLF0bSnUJ0g
	hObSpjZ+FDcKtOInwdMe+oQWm8OihIqP+MMqA6/x/GRCpkSqiGcx84YK9RtRefNkgqPIFe5JPSp
	ivxPiZk7PGbK65DYrXfZBx5V6zNIRJdwx6QCYJkAGZCBkm4BSPENLf+diUOeVfuM5LjHWB8sqWk
	HNQ/3oyGjeIWQcUWXmcnN1EN0jyHtqjLqbONu+cBEln6Dr6RMv/1dBGHmA0suoXxngkJLsdTwcN
	dZXtE8qWN5UNW+st3VYxBOMXAUcT46ygOvZ7lDjPkkU6b+VIxTQfzn5tv4fbU5mG1UxqtbIhLwe
	cRV6X5EX2nAk94pj0n65Gfiv+TIG4PLS4ugdat8TXXzKqAktOq0Kt2nM//fiQxE+GVI0nuawBCM
	Oa12cc1Gn4APn9pZBdc0k=
X-Received: by 2002:a05:600c:458a:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-48069c6970fmr52404085e9.19.1769592544055;
        Wed, 28 Jan 2026 01:29:04 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm129275515e9.9.2026.01.28.01.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:29:03 -0800 (PST)
Message-ID: <a820c04c224366e31ffbc6d7fe38068f8aab4137.camel@gmail.com>
Subject: Re: [PATCH] iio: adc: vf610: Add missing check for
 device_property_read_u32_array
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Chen Ni <nichen@iscas.ac.cn>, haibo.chen@nxp.com, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
Cc: linux-iio@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 28 Jan 2026 09:29:47 +0000
In-Reply-To: <20260128042700.2260803-1-nichen@iscas.ac.cn>
References: <20260128042700.2260803-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-01-28 at 12:27 +0800, Chen Ni wrote:
> Add check for the return value of device_property_read_u32_array() and
> return the error if it fails in order to catch the error.
>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
> =C2=A0drivers/iio/adc/vf610_adc.c | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/adc/vf610_adc.c b/drivers/iio/adc/vf610_adc.c
> index d7182ed0d2a7..d53723ccc5b2 100644
> --- a/drivers/iio/adc/vf610_adc.c
> +++ b/drivers/iio/adc/vf610_adc.c
> @@ -871,7 +871,10 @@ static int vf610_adc_probe(struct platform_device *p=
dev)
> =C2=A0
> =C2=A0	info->vref_uv =3D regulator_get_voltage(info->vref);
> =C2=A0
> -	device_property_read_u32_array(dev, "fsl,adck-max-frequency", info->max=
_adck_rate, 3);
> +	ret =3D device_property_read_u32_array(dev, "fsl,adck-max-frequency",
> +					=C2=A0=C2=A0=C2=A0=C2=A0 info->max_adck_rate, 3);
> +	if (ret)
> +		return ret;

As Andy pointed out, this is changing behavior so it needs to be properly j=
ustified. Also since we
are here, maybe use ARRAY_SIZE(info->max_adck_rate).

- Nuno S=C3=A1

> =C2=A0
> =C2=A0	info->adc_feature.default_sample_time =3D DEFAULT_SAMPLE_TIME;
> =C2=A0	device_property_read_u32(dev, "min-sample-time", &info->adc_featur=
e.default_sample_time);
