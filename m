Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4743D1885B4
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727688885; cv=none; b=jVs5njp3cMDbDOV5YfmsUKrw6o2Q3jhVAluxNPl3H2K/AhGogjok9hXabWgkL0OPEQetcpWhpkjz5UtF8jidngex9/MY4SFAYULUKTfDtWaO3AEBnX4gHwqnmRQzQTO/KLKvhn3VGVn+pRLRiRDNaX4k2rsA2CSg6ddKUHBk6U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727688885; c=relaxed/simple;
	bh=T376I2MDrJytTDm4/y8a91oboBCmnAZ5VqjHr2jS9eI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VsAkwYgUFQLCCyCGu1eiwdCDBDAksmQgmV54Z+yLgqJ4ED3gjppCZBcCuhHawGFV87kR4D+XbUqBLdsImxXpOgUAzdS8ytLF0MCWM077f8LIkp53dUyiM0KPQD37kfweiD1Clsejynn6sx1h35gSLfQQgWPofYQc5GBo/0j7toE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ydffyoc8; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ydffyoc8"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4E7DE0007;
	Mon, 30 Sep 2024 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727688880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T376I2MDrJytTDm4/y8a91oboBCmnAZ5VqjHr2jS9eI=;
	b=Ydffyoc8eP4yYmGUFFPfMukBflSB14CFQqzVpdFCQVXOhkgFmcNq5KDYhOMWjosOOFYNYY
	kbb9gKnvQVf01UV4UFGS5mDyVS+0lzu8eoSb8zdchrGyinkVkjVWi9YGjg7MPossiNNybH
	yPM1XObl+VqC+rlPqMCExq1eTvcylkH+w3ZRiBHmCo3jwxrUxI2f8FbIrfTTbJ62e0c9nh
	jpK9K+POPRlo2t9/TZg/YrZEwCJGtrmo6UMAiNXqQ8of5MMkvMUaiZvJq/MUnJPoIIckp0
	VcNid5AG0Pmz7qVfe0Sz63yqFGapO6lxBikxNy2Lu2cvTMGTPa+2jwnl6YIVFw==
Date: Mon, 30 Sep 2024 11:34:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, Ravindra Yashvant Shinde
 <ravindra.yashvant.shinde@nxp.com>, stable@kernel.org
Subject: Re: [PATCH v4 00/11] i3c: master: some fix and improvemnt for
 hotjoin
Message-ID: <20240930113436.318a7c0f@xps-13>
In-Reply-To: <ZvWTjjuRU26dTyKT@lizhi-Precision-Tower-5810>
References: <20240829-i3c_fix-v4-0-ebcbd5efceba@nxp.com>
	<ZvWTjjuRU26dTyKT@lizhi-Precision-Tower-5810>
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

Frank.li@nxp.com wrote on Thu, 26 Sep 2024 13:02:06 -0400:

> On Thu, Aug 29, 2024 at 05:13:57PM -0400, Frank Li wrote:
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > --- =20
>=20
> Alex:
>=20
> https://lore.kernel.org/linux-i3c/20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.=
com/T/#m16fa9bb875b0ae9d37c5f6e91f90e375551c6366
>=20
> There is some discuss about assiged address, I already explain the reason
> and ping 3 times,

Pinging will not help as long as the code is not clear and simplified.
I honestly think the PID should be retrieved earlier in the HCI part
and that would solve most of your issues.

Otherwise if that is not possible I still find hard to understand the
big picture, the comments and the code. I've already spent quite a bit
of time trying to improve it with you, but the logic is still a little
bit too specific and complex from my point of view.

> These patch are actual fixed hot join issues.

It should not be the case. Hot-join should work without the devices
having all the time the preferred address. If hot-join really does
not work, then please split the series with the "preferred address"
handling being done apart in a second series.

Thanks,
Miqu=C3=A8l
