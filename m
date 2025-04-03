Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E91250C19
	for <imx@lists.linux.dev>; Thu,  3 Apr 2025 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696373; cv=none; b=H5DPSyY0kB++WWNe5zkwKLSZr5xxRXLVh1e4TBb+vN3VbBftduZnHlfA1VKq8jQu2v/sIfzJ51Jp5Jdvbjdn9yVRWBZ7jgY/mj8h6xCIz2XX9nCeYdBLu3f66nLYSRaAT7kbLhv1Ozy2TQl3uaZT8PYC2LIdW6411+SZQQ9Ircg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696373; c=relaxed/simple;
	bh=2bb6Ld60XxrGe0E0RuTu+nVe0hVCJMLe31QcComJ1fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LErXMMp0GoY2vSCZbhIAxfR8Tj3h3ky1jYbOdY3Q4RpJ1wclVoUx9m4U57C4ULyHg813Q4GT0ipeLDJWQfjgBV+0abUYgkgKhH8Mb9MHeAxUN5B7qYDy+UHKUHZN32JnodGmPVTd4VdunaxL2xpN0lm98ADM7fSw2BhFzgToI9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2GPCJKX; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2GPCJKX"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224100e9a5cso12352925ad.2
        for <imx@lists.linux.dev>; Thu, 03 Apr 2025 09:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743696371; x=1744301171; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ymem3tx1RtUYQNeKWESyhB5mrJPO3NU+wgpTLwBG5zw=;
        b=D2GPCJKXwKog4HYp2XP2FVlayKJFysEPf0TLnExjugcFSJpCjgW1uUjU74FOaSdP5C
         XI3ZCRipAmIvit/Pp3vXlJDJ1rNMITf22NxV1F+zSTkEObGENea42CI1KaeEA4N8m0yL
         qRzpI0X3mre6i6mi+mwGpUdTgHnovmt0EhOr9Or9H1Nd0xGWQH7orAUt9e2ygbhinDbU
         jnNmsFFAs5tvU9U6+Mmbc/YnT2ULXqdqjh0/0AJO0UR9Ujus0LK3sG88eBT3jg2fbUKN
         rW+gnO8aajNtZ+8UiZOV8is9GVrR+j9xPwgM8YPDyCaIBXWZ91v/88pYaPTKpOAzqMKu
         GMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696371; x=1744301171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ymem3tx1RtUYQNeKWESyhB5mrJPO3NU+wgpTLwBG5zw=;
        b=J0uEbPDWHZI9XW3cc8ruhCuLOHq6/6sEuPctekVdLzVP83ToNNi1BJ7LJRfFI6z0Jc
         +muEzVYnvYggFr4EWx/qsHhzpM/XVABYX5EBmJ9MiDbKmhuzhttpghHVn1hpMS9AFcJJ
         35epxMCRyuzXjPmbJNW/zuRm8tNOqLKjugSN9gmGsSBDQCbeq4+0IhPhBXGtPtDEO5d7
         9S6oxyzrvmcBt6lf1WgoQU6S7Htcbmbmpd/Z2l0KpSEfLvsJf01CR68z3MBy9RKG+4Nk
         MFIm4sm6wpumeHhFM4lVmUrKaJAbOrKZu3an7YxSbMfFjDMH9DoldxlHUXhJ8HnJgp0+
         TIcg==
X-Forwarded-Encrypted: i=1; AJvYcCWfvdZaT4OW91B/i3OfQhohlUBvi9vpLdOdJ6PQiaJ9xG0n74MxEhDRRkzmHWKJlDD7pyI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQMH1GkTG5wYAOZm08F9mjJ2AVRlrplus0nkG99lJlZbBph1UU
	3jACeQXBAEk8yB4KF/G5bmEmSgnt2V5w5pUKkPyOQRbh1qH/CrchoLbp2w==
X-Gm-Gg: ASbGnctWCmBDzoX2oxvQX1vp9bCtmlWGxxEsMQT3jDk6x4Zxs8BvtdVyxHZ0rGwwCKd
	0jZYYcxe/UTNOzd44OOmHZvU/DsEG2WYNVUsi2Jfs1u88Vg23y9s8rMCjbFkJYhgVIkWIRWyahK
	UxwYJq8Chi9ydrt5Q+fcPzUNIlakCbiXAhyp8ZYWNwwV7ktUSpEr0FMD7qZmcYl9MJoxEQf+Jgd
	8IDWgZPjnDd39Fydoqw8YB0Oe9V1HXYS3QBDHZ9kMDUgC/sGXeoJMjc0BRCFxVTf5L6qTS6+6SX
	j2xTRwM0N1NQFheu35brPWsWFfvmHtkO5xcvf7Ia0H/sOyB5HVfqF7g7ow==
X-Google-Smtp-Source: AGHT+IFZkonlx+6d8LKTvVVrgjpNIPXSRTv3sgQYVB8/1U4DEhJPtbnWrrEfecPZfpwRnFXq86U+5g==
X-Received: by 2002:a17:902:cec2:b0:223:fabd:4f99 with SMTP id d9443c01a7336-2292f94a06emr338298535ad.5.1743696371495;
        Thu, 03 Apr 2025 09:06:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97effe5sm1727414b3a.61.2025.04.03.09.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:06:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 3 Apr 2025 09:06:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Florin Buica <florin.buica@nxp.com>
Subject: Re: [PATCH] hwmon: (ina2xx) make regulator 'vs' support optional
Message-ID: <2a12e6be-c253-4542-86a0-aacb71671ed6@roeck-us.net>
References: <20250403101516.3047802-1-ciprianmarian.costea@oss.nxp.com>
 <dab2f459-240f-4e4c-9bf6-8c0285354cfb@roeck-us.net>
 <4efff19d-b5e6-49b5-9a15-e4af622c6ebf@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4efff19d-b5e6-49b5-9a15-e4af622c6ebf@oss.nxp.com>

On Thu, Apr 03, 2025 at 05:29:26PM +0300, Ciprian Marian Costea wrote:
> On 4/3/2025 3:15 PM, Guenter Roeck wrote:
> > On 4/3/25 03:15, Ciprian Costea wrote:
> > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > 
> > > S32G2/S32G3 based boards which integrate the ina231 sensor do not have a
> > > dedicated voltage regulator.
> > > 
> > > Co-developed-by: Florin Buica <florin.buica@nxp.com>
> > > Signed-off-by: Florin Buica <florin.buica@nxp.com>
> > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > ---
> > >   drivers/hwmon/ina2xx.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> > > index 345fe7db9de9..ab4972f94a8c 100644
> > > --- a/drivers/hwmon/ina2xx.c
> > > +++ b/drivers/hwmon/ina2xx.c
> > > @@ -959,8 +959,8 @@ static int ina2xx_probe(struct i2c_client *client)
> > >           return PTR_ERR(data->regmap);
> > >       }
> > > -    ret = (dev, "vs");
> > > -    if (ret)
> > > +    ret = devm_regulator_get_enable_optional(dev, "vs");
> > 
> > devm_regulator_get_enable() should provide a dummy regulator if there is
> > no explicit regulator. Why does this not work ?
> > 
> > > +    if (ret < 0 && ret != -ENODEV)
> > 
> > Why this added check ?
> > 
> > I know it used to be necessary if regulator support is disabled,
> > but that is no longer the case.
> > 
> > Guenter
> > 
> 
> Hello Guenter,
> 
> I've just tested and devm_regulator_get_enable() does work as you've
> described, providing a dummy regulator.
> 
> But, according to the 'ti,ina2xx' binding [1] I see that the `vs-supply`
> property is not required. Hence wouldn't it be correct for `vs-supply` to be
> optional ? Using 'devm_regulator_get_enable_optional()'
> 
Yes, but the reasoning you provided is different and suggested that the
current code would not work. Since that is not the case, the change would
be purely cosmetic. Also, I still don't see why the -ENODEV check would be
necessary.

Guenter
