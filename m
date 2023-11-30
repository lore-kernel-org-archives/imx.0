Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFF2A2D
	for <imx@lists.linux.dev>; Thu, 30 Nov 2023 19:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DM6ceKIh"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 109F01C0003;
	Thu, 30 Nov 2023 19:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701371766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mE9/tLP0eyYG3y00nEhJnVDwOaisqMrxBjBW9/Ybvm0=;
	b=DM6ceKIhBV6tIWBT1O5ejGiMHISZq82LwOsjaEZcszhe+L61E5vrnfgwaLv1tTDKpVarRP
	lQfaK3Dz/6iem1wLq2aORwPTg9BRG0gRkygmx97qDxoaDFuHBkSVaFlMB13DtRZeMsiRXV
	RM5qHfvJrT5U9ABu2DxecrN+isoBUJpNuPKwHQmyQFYR6YuURpD5KlwGVNuSvPA+/Rs3G8
	MsaCKdBURif4juKKYVGjk50hqlCmcEkhFq4pJnDV3CdTj5N49BO6dCBDetH6BTOvhSGVgZ
	Hj1MffyQ1K9Ntf49cvTRlmc+on0RYu8MlplBKwSpXFdKXrnAIyDgGvPiS4sHzw==
Date: Thu, 30 Nov 2023 20:16:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 6/6] i3c: add API i3c_dev_gettstatus_format1() to get
 target device status
Message-ID: <20231130201602.2944cc9f@xps-13>
In-Reply-To: <ZWjLMNKJElPI6uSo@lizhi-Precision-Tower-5810>
References: <20231129221225.387952-1-Frank.Li@nxp.com>
	<20231129221225.387952-7-Frank.Li@nxp.com>
	<20231130111959.11afd8a8@xps-13>
	<ZWjLMNKJElPI6uSo@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
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

> > > +
> > > +	if (!status)
> > > +		return -EINVAL;
> > > +
> > > +	i3c_bus_normaluse_lock(dev->bus);
> > > +	if (dev->desc)
> > > +		ret =3D i3c_dev_getstatus_format1_locked(dev->desc, status);
> > > +
> > > +	i3c_bus_normaluse_unlock(dev->bus);
> > > +
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(i3c_device_getstatus_format1); =20
> >=20
> > There is no user yet. Maybe this needs to be done in another series?
> > Same below. =20
>=20
> See
> https://lore.kernel.org/imx/202311070330.5mylauLR-lkp@intel.com/T/#t

Then this patch should be part of the series you mention.

Thanks,
Miqu=C3=A8l
