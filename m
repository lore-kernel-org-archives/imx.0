Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC86134A6
	for <imx@lists.linux.dev>; Mon, 29 Apr 2024 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714374825; cv=none; b=M2QcsOR2NAAgncw4yOqEz2j8u195KzXUPry3H3n9/rM7g3rQTjkQNDGh+40/ySGclHN6xT6bIeAWAd50Mo17JdHivyKpMpsK6W85g6XG6VPPHKj0X7nlc88HjAOpzc2Sr6XAa33ulme318KOVGACh67P7lGvrMqCSBDO6NmqJLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714374825; c=relaxed/simple;
	bh=+hqrct1glvL58HkQZQ62f7MQqOS2zEStZd8S2vqKT2A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HFVLzNdLCa66a8I1iI9DL3jqd6DDdeSPOxEPV7zuXL76Bxzj+p96A+4Zk7vtcf9YD+hQf5g4MnafC+T+8WUVKuhqgYJ8Ag5RUST90MKG72I1RU0keX0KAY0Mj1YCeGK1mt3rLrwN1m5aU+eQidK7OTqr5puLWCWaJ8M0qIuIyp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSY9d8JX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSY9d8JX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41ba1ba55ffso12923945e9.1
        for <imx@lists.linux.dev>; Mon, 29 Apr 2024 00:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714374821; x=1714979621; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+hqrct1glvL58HkQZQ62f7MQqOS2zEStZd8S2vqKT2A=;
        b=XSY9d8JX6MGZqBlGV9uOL32b21lq/AgJUSgdWyjsP32kGW6zdce2SqE8xez9MEQEMm
         14HOwr+cfKAL8a6bcPY4BR8KY0ZL+ZGohvrp7t4ufQH7IRlrbDFLO5yZteTw8NBQq+RB
         1aFWHLLb50o282OQrGuZTXjEGpOx3X0HmJ01emAuXc1HJENj08s75U4RcUk7Q/3lfH2C
         iTWVDazWGYAt31zFQRgVcmGkk5JGaff0YYJWA1zagvV2ZOpITOPg93spwy935GUOmA6O
         lWIh4jrjKf+tKXHUfDeTm/B3xyZbe233DB0DMs6610J639FshbWp8Y77qENpM+i1OXpb
         RlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714374821; x=1714979621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+hqrct1glvL58HkQZQ62f7MQqOS2zEStZd8S2vqKT2A=;
        b=Z46GAWjnKoai3mLaG3y/+XUcs6bhqm7JzMMDuFTHzxi1RfL8rF6IvmXTLZsIk/EBDb
         dbiO89iR4H8uR9xpFosirdaGkzvG1yHFNflrBp2+IjhyGGNp9+FbeSQ/yTL5cDnJpGRG
         UJyg0y+vzd7TwP+wjh6A/ioZmoKx79yG45Ngq2ugQK2PvuKoGFGuOZTcicwd52ZUY0tv
         fgWqdIFMBHtORb10OJR+HiKRSFoKG8Cuhq7WFQnXoztRO3XKTQaG03DgQsAUmj0fhC0z
         +uCxCzHnOyB6qOceYHZ8C2RlQ7GYrHRqMLsskqCf/IMHCDdcLWimN1nlnQMsEx84mvVz
         3UOg==
X-Forwarded-Encrypted: i=1; AJvYcCXXnQVomKvJsbQddsY6zMB0nP+nxJByepYAkWFaYedyvcoAA9x3Wnz7egRlY1yfWAOTV+/SCU3ycbr+uKboIzwqRi+z
X-Gm-Message-State: AOJu0Yxu3f7ZIBdt2oODHhFnLuYflTeYpGj8JLnd5NFgGmkRu64g36x9
	MVGkITp0VnEiJNgHuptYRWBfHtI/iWx52Y925eylMjE0wafxf61L
X-Google-Smtp-Source: AGHT+IHsnOgDmNCZDHXtkTu23Oi6Kkv6U6smYB4eXQYcS48Rr+6Ht7ybUGYjW3UEpoXwMQOT/fjbHA==
X-Received: by 2002:a05:600c:458b:b0:41c:ab7:fa22 with SMTP id r11-20020a05600c458b00b0041c0ab7fa22mr3191722wmo.5.1714374820550;
        Mon, 29 Apr 2024 00:13:40 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:994e:fbde:478:1ce1? (p200300f6ef1cc500994efbde04781ce1.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:994e:fbde:478:1ce1])
        by smtp.gmail.com with ESMTPSA id a4-20020a5d5084000000b0034c6077c625sm7581519wrt.29.2024.04.29.00.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 00:13:40 -0700 (PDT)
Message-ID: <9d1ac78951439bbcdc2f294713f55ee34e30f84e.camel@gmail.com>
Subject: Re: [PATCH 0/3] iio: cleanup masklength usage
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date: Mon, 29 Apr 2024 09:17:18 +0200
In-Reply-To: <20240428142343.5067c898@jic23-huawei>
References: 
	<20240425-b4-iio-masklength-cleanup-v1-0-d3d16318274d@baylibre.com>
	 <2630ef8c8363b4fa772a2ff2c95cf115ad3c509d.camel@gmail.com>
	 <CAMknhBGQB4MC8ejEs_uLgb=iKehXkoetgHjZnCvCKQbuua5kfA@mail.gmail.com>
	 <20240428142343.5067c898@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2024-04-28 at 14:23 +0100, Jonathan Cameron wrote:
> On Fri, 26 Apr 2024 10:26:31 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>=20
> > On Fri, Apr 26, 2024 at 2:13=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail=
.com> wrote:
> > >=20
> > > On Thu, 2024-04-25 at 10:03 -0500, David Lechner wrote:=C2=A0=20
> > > > While working on other patches I noticed that a few drivers are set=
ting
> > > > the masklength field of struct iio_dev even though it is marked as
> > > > [INTERN]. It looks like maybe this was not always the case, but we =
can
> > > > safely clean it up now without breaking anything.
> > > >=20
> > > > ---
> > > > David Lechner (3):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: adc: ad7266: don't set maskleng=
th
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: adc: mxs-lradc-adc: don't set m=
asklength
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iio: buffer: initialize masklength a=
ccumulator to 0
> > > >=20
> > > > =C2=A0drivers/iio/adc/ad7266.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 -
> > > > =C2=A0drivers/iio/adc/mxs-lradc-adc.c=C2=A0=C2=A0 | 1 -
> > > > =C2=A0drivers/iio/industrialio-buffer.c | 2 +-
> > > > =C2=A03 files changed, 1 insertion(+), 3 deletions(-)
> > > > ---
> > > > base-commit: b80ad8e3cd2712b78b98804d1f59199680d8ed91
> > > > change-id: 20240425-b4-iio-masklength-cleanup-86b632b19901
> > > > =C2=A0
> > >=20
> > > Hi David,
> > >=20
> > > Nice cleanup. The patches look good to me but there's one thing missi=
ng
> > > :). As you
> > > correctly noted, the field should be internal to the IIO core and dri=
vers
> > > should not
> > > touch it. Hence, you need to make sure not driver is using it so we c=
an
> > > move it into
> > > struct iio_dev_opaque [1]. That's the place all the intern fields sho=
uld,
> > > eventually,
> > > end up.
> > >=20
> > > Now, quite some drivers in the trigger handler will read the maskleng=
th
> > > for looping
> > > with for_each_set_bit(). Hence, the straight thing would be an helper=
 to
> > > get it.
> > > Maybe there's a clever way...
> > >=20
> > > I know this is more work than what you had in mind but I think it sho=
uld
> > > be fairly
> > > simple (hopefully) and since you started it :), maybe we can get the =
whole
> > > thing done
> > > and remove another [INTERN] member from the iio_dev struct.
> > >=20
> > > [1]:
> > > https://elixir.bootlin.com/linux/latest/source/include/linux/iio/iio-=
opaque.h#L42
> > >=20
> > > - Nuno S=C3=A1=C2=A0=20
> >=20
> > Sounds like fun. :-p
> >=20
> > I will look into it.
>=20
> I think this one might be miss marked as [INTERN]. It should be constant =
from
> the driver
> point of view, but given active_scan_masks is meant to be visible to the
> driver,
> it's length should probably be as well.
>=20

Yeah, that did crossed my mind. I guess we should just make it [DRIVER] the=
n
(likely with RO statement).

> Sure every driver should be able to trivially work this out for themselve=
s,
> but
> do we care about stopping them using this?
>=20
> It might be worth some nice iterator wrappers with names like
> iio_for_each_active_channel() though I'd expect those to still be accessi=
ng
> these

That looks like a good idea. It would make it more clear that member is not=
 to
be directly accessed.

- Nuno S=C3=9Fa

