Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1EA1DFFC
	for <imx@lists.linux.dev>; Fri, 26 Apr 2024 15:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145206; cv=none; b=g8XoOvm1cathZbm5BOyIKoM72BCrWS/UGj4Scx//+wlSb6NF+kY5n01vw69iLDDs5Q+38+gn1MyK1DtCO1GrC8WrGWqsU7pfEE7co1guV5N2+zWvjx9R3wxfkFCnrHFZ3/DnFUQxyYyNAcMmyRZgVH6xniKUuXTCxipZxoBK3zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145206; c=relaxed/simple;
	bh=AVVZ5WrV0O90cPI1zVj+G1z5pclK2g+nTkMkPWRPIUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMmPQ6pbagGx95w5dJUs/EUzwZBYJDHBjF3ihkdtJkjPwnOt1dTv34AlsJyDQA0IZhJEdrBVCrs2OZS+NrGYztAkc+R0+qqG5as/j+j+H2Oe8gjmuvK/kavD+MmNeAGppx8YUKhQ3vgQSpHwS6dc/CN1/5exddBBq5sdYDQzaKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NKdy95Na; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NKdy95Na"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2db101c11feso17419871fa.0
        for <imx@lists.linux.dev>; Fri, 26 Apr 2024 08:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714145203; x=1714750003; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbd496awCmr7HV9PAhWCpLFPL9uks2P0WpKxk3j3S2c=;
        b=NKdy95Na+gWvgG5HmqJ32aMfc5OD0uLH+VjN3Se1TyiTWpOzq/HlK13v2Mm/vhggka
         YS390p6IfgIfR0y4L26aYPbSQo6QzBgaMsvQlcUoa/hOagDRctnsemPiOsYcC+J2mPaQ
         7H2EYLZV1iEHrG/uoEY+vA2Xge9G23BkzC5JLPsEZyVuoE7N2jxmrWG6+iyg+0y1JF2m
         w6gg2C82dGuwYacY+l8hdvZlFGnGRAoiblJE78oA6F/ZIOrATO5TOk9WPkrWwqEHfLIS
         ODBt7JJPYAEh9TCe0MJcwDClbX+WlKz767qZ+GBleFlQ5ceRks5QR4NWoPVZiz8Zd0GF
         Ia9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145203; x=1714750003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbd496awCmr7HV9PAhWCpLFPL9uks2P0WpKxk3j3S2c=;
        b=SHWmAaIbs5BJrYa8t+yzKZN44JL1yWAm3H3X2UQm2h3YWHiRgMCjiqSDvfhmpUxdY/
         915uf34SDBz1cfKVQaZVpnJ1ewUAsSK/MJYOgyv2kLZyyzh3m1VCRM5YUnSSALZpQvNO
         ajCrkNKXhDW6zSj+v36c/475VbF5Fh/iaPQCkPpqNP99PbIZ5K8RUTmteElAiCAFLLip
         bXGZmV3yRuVPYApCmU7tKNdMUwpnpxstN9Fug8l1r7amW941Ayocxp2MjvqPU36C4K8p
         zrvJ2/MI45FLVdAIjFWBlMAZehfGmUouTRTh20x6FHaY20CDblC8g/a6HhxTNAa6qwiY
         uP8g==
X-Forwarded-Encrypted: i=1; AJvYcCXyj3FnZE+ffmJNHBnhWUWRcIpeJrzr7PrjPXRCe0tug7Lpf8O69Sie+5FpLU7tjGeSGZv4M3VVxXOp7WtPmfG58qmY
X-Gm-Message-State: AOJu0YyC+iriV7sRNomeZi6fqtbQfRjA7ch7/VGwrJKgxyfIPrakArXv
	7rgLaLToV7q/CwwzmZPP7GOAZgmz7rd6hQjJ5vVFfEdmEI3NWElfD8u4kyJwXB/CpT7KyqjcwId
	+C5LsUvPsfYYvZ5qnAZ1UXgm09P3lD6xVIKdgAg==
X-Google-Smtp-Source: AGHT+IH6bJsIpLONbn6Ung3Qp+BKBgv7mt2AD4Ou/ORighgXlV/9uin6jCJ7tuPKYhAsygqcEvDbEhvhpwLHHZkypR4=
X-Received: by 2002:a2e:7c0e:0:b0:2dc:f13f:8a96 with SMTP id
 x14-20020a2e7c0e000000b002dcf13f8a96mr1122749ljc.5.1714145202834; Fri, 26 Apr
 2024 08:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240425-b4-iio-masklength-cleanup-v1-0-d3d16318274d@baylibre.com>
 <2630ef8c8363b4fa772a2ff2c95cf115ad3c509d.camel@gmail.com>
In-Reply-To: <2630ef8c8363b4fa772a2ff2c95cf115ad3c509d.camel@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 26 Apr 2024 10:26:31 -0500
Message-ID: <CAMknhBGQB4MC8ejEs_uLgb=iKehXkoetgHjZnCvCKQbuua5kfA@mail.gmail.com>
Subject: Re: [PATCH 0/3] iio: cleanup masklength usage
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 2:13=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.com=
> wrote:
>
> On Thu, 2024-04-25 at 10:03 -0500, David Lechner wrote:
> > While working on other patches I noticed that a few drivers are setting
> > the masklength field of struct iio_dev even though it is marked as
> > [INTERN]. It looks like maybe this was not always the case, but we can
> > safely clean it up now without breaking anything.
> >
> > ---
> > David Lechner (3):
> >       iio: adc: ad7266: don't set masklength
> >       iio: adc: mxs-lradc-adc: don't set masklength
> >       iio: buffer: initialize masklength accumulator to 0
> >
> >  drivers/iio/adc/ad7266.c          | 1 -
> >  drivers/iio/adc/mxs-lradc-adc.c   | 1 -
> >  drivers/iio/industrialio-buffer.c | 2 +-
> >  3 files changed, 1 insertion(+), 3 deletions(-)
> > ---
> > base-commit: b80ad8e3cd2712b78b98804d1f59199680d8ed91
> > change-id: 20240425-b4-iio-masklength-cleanup-86b632b19901
> >
>
> Hi David,
>
> Nice cleanup. The patches look good to me but there's one thing missing :=
). As you
> correctly noted, the field should be internal to the IIO core and drivers=
 should not
> touch it. Hence, you need to make sure not driver is using it so we can m=
ove it into
> struct iio_dev_opaque [1]. That's the place all the intern fields should,=
 eventually,
> end up.
>
> Now, quite some drivers in the trigger handler will read the masklength f=
or looping
> with for_each_set_bit(). Hence, the straight thing would be an helper to =
get it.
> Maybe there's a clever way...
>
> I know this is more work than what you had in mind but I think it should =
be fairly
> simple (hopefully) and since you started it :), maybe we can get the whol=
e thing done
> and remove another [INTERN] member from the iio_dev struct.
>
> [1]: https://elixir.bootlin.com/linux/latest/source/include/linux/iio/iio=
-opaque.h#L42
>
> - Nuno S=C3=A1

Sounds like fun. :-p

I will look into it.
