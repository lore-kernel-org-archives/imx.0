Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A9E1537BF
	for <imx@lists.linux.dev>; Thu, 22 Aug 2024 07:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724312785; cv=none; b=POrEqQHJ9PqEZCISZSxZ95e4U5PFPnQs8DbQSPfScguiWqExMEkTwMfF2W0dSrtwHuhLvXAWQsbF2tQeeJYa8t4Q4vBL1gEqOmGqqcYB2OUp1Jy/ubLpDo9BymcFhCtS2G3/EG+LNBt/SLyG4D0Ji71xOCSICzg5p1945XwvkLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724312785; c=relaxed/simple;
	bh=nN3jLh8XyxWWB0ocLImFJTJ/AWPcQeHYqEP2C0YoZDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekEE2XU3KmjteaklNjrM7RhkAPpkxagUBRI7vfh5J0uQG5t59hIsImRNsiRHjd5mR4AS93tPKg3Fu/FfjCGdQV5GAbxl73FwtgTUbYgedFNJN/I5w0mEPUmCO12Kpapv/Su2BohqkzGxBug7ixmKE08SbYPRn3w86QGjJi3uAjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aoRjYNIz; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aoRjYNIz"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC12420008;
	Thu, 22 Aug 2024 07:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724312781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OppYEcUmoLJEMht1bqkFMeGjddAvbTCwXLdsBIw5K6c=;
	b=aoRjYNIz04a8qgzn4QZQC/PlPmlK5q5YnIHvPW5/fg6hgt9BDMfyANCTjDv5eT0d+wc3OD
	4eVy/GObaMdKEXk4wSV0gpdNRscpPMwQRwq/REtN4CD00djpFtmpTo27oUD+oOQ0YjJCpS
	ubFxdv7xwKbOcKiOrgx6LxkvS/NZBBJYIzrUpbHzoKdOvZ/2+mx6PySvaRME+1k+Jde5bB
	d9EOrN1iCFFJ3sZAa/Mxj2QgcxRM9X/I5oYkpTWrPG2n6E/Gy0gp46V0xaaZQnVH1DSzGV
	SXqfi/iyOTqFjswQmxtY1PXGAerCOhSld6tpxQulNORslGjg9eKc3YDGI8MeVQ==
Date: Thu, 22 Aug 2024 09:46:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Frank
 Li <frank.li@nxp.com>, "conor.culhane@silvaco.com"
 <conor.culhane@silvaco.com>, "linux-i3c@lists.infradead.org"
 <linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 1/2] i3c: master: support to adjust first
 broadcast address speed
Message-ID: <20240822094619.08f1a374@xps-13>
In-Reply-To: <VI1PR04MB500513D0A8E03D49EA2558ECE88F2@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20240807061306.3143528-1-carlos.song@nxp.com>
	<20240821180709.1626dd64@xps-13>
	<VI1PR04MB500513D0A8E03D49EA2558ECE88F2@VI1PR04MB5005.eurprd04.prod.outlook.com>
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

Hi Carlos,

> > I'm sorry, can you rephrase "configured according to I3C bus mode" ?
> >  =20
>=20
> Hi! Thank you for your ack! I will change above to:
>=20
> /**
>  * enum i3c_open_drain_speed - I3C open-drain speed
>  * @I3C_OPEN_DRAIN_SLOW_SPEED: Slow open-drain speed for sending the first
>  *				broadcast address. The first broadcast address at this speed
>  *				will be visible to all devices on the I3C bus. I3C devices
>  *				working in I2C mode will turn off their spike filter when		 =20
>  *				switching into I3C mode.
>  * @I3C_OPEN_DRAIN_NORMAL_SPEED: Normal open-drain speed in I3C bus mode.
>  */
>=20
> Is this acceptable?

Sounds much clearer to me, thanks!

Miqu=C3=A8l
