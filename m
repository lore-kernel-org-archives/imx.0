Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977931885BE
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 15:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428407; cv=none; b=Ikyhn+u6xqnVMpNV+/xUbHQdC5g6+X9qxz82Ep1q4LNZ2kbbi+vP6yo7kh6yXtlnaM1rXVcYjX4jwdHf09UKURHhdin3tqCu4LpofdQ44NlvH42utVE35RGowvbES5MvPrOi+sCG+7MKI05pLD9PIcV+FFBWz04cquJNY2L6UiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428407; c=relaxed/simple;
	bh=quLM7Iz0pHRWa8l3KuQ03KzcWNl9y18mAhZfYfA8S3k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g9nj2FgdtvcgDTW/MJLaPCaFIWyGAQ3f+DsgP3OAMvoCyT6v+9iWKu2DYLu4fWBMz6zh3YpQaexq6NN0vyvmGQiwUm/YZL8YRUyhIiYA0FicQfnH8JbV+WpZQzK9qRYYtvzGMitJobIGUH0XzwVaZx/f2/LDhLhye+FW+GJ2UQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fXCulUc5; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fXCulUc5"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98515240002;
	Fri, 23 Aug 2024 15:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724428402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psfZHnc2IwERrT4CMt2GdaRFDHWnpUiBb00Vh+zfwqk=;
	b=fXCulUc5ZFe15DOGx5VX8dTHRQnUF33DUJMjgnylhpv/BL1Pi7ywKja/4/8bCIqs/65jyL
	Wv34Zp3sGTiowLCb3tHnU/wYm/Cq+pxdgzlLFpXRw/wnetDQ30zkm2rYE233RNFH78oC16
	wxjUduOf7GS76wuTTaQ8bpwSJp/7DwBnDkClOWbnIqS4BePA+F5Yptc6yVawLojgnitb3H
	xCUBSFmtbL0KejSbqfJs+mTEk56h+QjBSiX1O08FXGLvXtcxQR6AW6tXrURx/LHvF7rcIu
	IpSEkTsN+oF6aCcwlZz0SdqIShVPPPdODUSEhWKzovqfsXa3Niba3zWdVQEohg==
Date: Fri, 23 Aug 2024 17:53:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Stanley Chu <stanley.chuys@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 01/11] i3c: master: Remove
 i3c_dev_disable_ibi_locked(olddev) on device hotjoin
Message-ID: <20240823175320.4948f0ce@xps-13>
In-Reply-To: <ZsSr+vmyzcmQIN3e@lizhi-Precision-Tower-5810>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-1-7d69f7b0a05e@nxp.com>
	<CAPwEoQOXme+GofEhpXaBBmsyGJP-QQtLMJG45PTdNsSqFn391w@mail.gmail.com>
	<ZsSr+vmyzcmQIN3e@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Frank,

Frank.li@nxp.com wrote on Tue, 20 Aug 2024 10:45:14 -0400:

> On Tue, Aug 20, 2024 at 09:34:11AM +0800, Stanley Chu wrote:
> > On Tue, Aug 20, 2024 at 12:02=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wr=
ote: =20
> > >
> > > When a new device hotjoins, a new dynamic address is assigned.
> > > i3c_master_add_i3c_dev_locked() identifies that the device was previo=
usly
> > > attached to the bus and locates the olddev.
> > >
> > > i3c_master_add_i3c_dev_locked()
> > > {
> > >     ...
> > >     olddev =3D i3c_master_search_i3c_dev_duplicate(newdev);
> > >     ...
> > >     if (olddev) {
> > >         ...
> > >         i3c_dev_disable_ibi_locked(olddev);
> > >         ^^^^^^
> > >         The olddev should not receive any commands on the i3c bus as =
it
> > >         does not exist and has been assigned a new address. This will
> > >         result in NACK or timeout. So remove it.
> > >     }
> > > }
> > >
> > > Fixes: 317bacf960a4 ("i3c: master: add enable(disable) hot join in sy=
s entry")
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/i3c/master.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > index 7028f03c2c42e..852b32178b722 100644
> > > --- a/drivers/i3c/master.c
> > > +++ b/drivers/i3c/master.c
> > > @@ -2039,10 +2039,8 @@ int i3c_master_add_i3c_dev_locked(struct i3c_m=
aster_controller *master,
> > >                         ibireq.max_payload_len =3D olddev->ibi->max_p=
ayload_len;
> > >                         ibireq.num_slots =3D olddev->ibi->num_slots;
> > >
> > > -                       if (olddev->ibi->enabled) {
> > > +                       if (olddev->ibi->enabled)
> > >                                 enable_ibi =3D true;
> > > -                               i3c_dev_disable_ibi_locked(olddev);
> > > -                       }
> > >
> > >                         i3c_dev_free_ibi_locked(olddev); =20
> >
> > i3c_dev_free_ibi_locked will still encounter WARN_ON(dev->ibi->enabled)=
. =20
>=20
> Thank you test it. The below patch should fix this problem.
>=20
> https://lore.kernel.org/imx/20240820043818.3352614-1-ravindra.yashvant.sh=
inde@nxp.com/T/#u

It should indeed. With this change added:

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
