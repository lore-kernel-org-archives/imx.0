Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8271865E7
	for <imx@lists.linux.dev>; Mon, 26 Aug 2024 16:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690155; cv=none; b=YxcRVj0HQdXdD74i97Yx+gn0mJVItvn6OvcFuxkEvC8z9e6kQSoDe0t7ObuZ9SPMjbSiwud89ujG9e/aqaAC+U5dbJsd+olojejRMgv/qhlCbtsB8BpofLAfT9K5NTHIDaJrpWDzvNRkC9XOxht2uyejmZW3xxadyyiawfNSqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690155; c=relaxed/simple;
	bh=1Fp7vCAVfUq6/YbsJlztZq0VRK/XwicwkPHvc4kaONY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cHMhhda0LiXNs9acUZPlFPzmYYxikwoQt/vHljsDWIohBJdl0a0cp74DA9h5dG+OJ0P0tsMCsKT1/E2Uu35onnENXRh+CLpw2cl+S3XdZ6Yh2hOJBdX4zI2YMj1sqcDudBn4DD+ZW3Z5eYdl1C6swwUmhGzh3TPX7RHeNBZBbNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E1XI13bh; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E1XI13bh"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BE7B1C0006;
	Mon, 26 Aug 2024 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724690151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Fp7vCAVfUq6/YbsJlztZq0VRK/XwicwkPHvc4kaONY=;
	b=E1XI13bh+XFuTg45imTzbBhWhln/cSeAgaMkOQQ0awFH2PxIP4F53XWkT84zKWnZVUlVxL
	/FINkvp+c48A1Qe1wfmnY92XZ5bOdbeypcE/fF7J+Iu79RZsCgbP7j0JuPVgxOsoGhKPqP
	3SLgCxu97x3ct0bF0OQeSUCR4nUqUND5GNuChxwdMyr+c8PWFbetwbudreNZwc+HX4Wher
	NrOZPPZKznuY0GD/fg1I4la3AV38Bt/4+2fAs+8pg+i0u7IDycMLV0/lXYqqE71269F75Z
	5WjoqBwNBDPOqjauuVHbYGPGPULMuUxafk8qCVQQPoV0UsF7r4K24ZTd7uCdVA==
Date: Mon, 26 Aug 2024 18:35:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: carlos.song@nxp.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-imx@nxp.com
Subject: Re: [PATCH v3] i3c: master: support to adjust first broadcast
 address speed
Message-ID: <20240826183550.39d36e0e@xps-13>
In-Reply-To: <ZsynnIWGIlmWPdzW@lizhi-Precision-Tower-5810>
References: <20240826050957.1881563-1-carlos.song@nxp.com>
	<20240826101323.746b617c@xps-13>
	<ZsynnIWGIlmWPdzW@lizhi-Precision-Tower-5810>
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

Frank.li@nxp.com wrote on Mon, 26 Aug 2024 12:04:44 -0400:

> On Mon, Aug 26, 2024 at 10:13:23AM +0200, Miquel Raynal wrote:
> > Hi Carlos,
> >
> > carlos.song@nxp.com wrote on Mon, 26 Aug 2024 13:09:57 +0800:
> > =20
> > > From: Carlos Song <carlos.song@nxp.com>
> > >
> > > According to I3C spec 6.2 Timing Specification, the Open Drain High P=
eriod
> > > of SCL Clock timing for first broadcast address should be adjusted to=
 200ns
> > > at least. I3C device working as i2c device will see the broadcast to =
close
> > > its Spike Filter then change to work at I3C mode. After that I3C open=
 drain
> > > SCL high level should be adjusted back.
> > >
> > > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com> =20
> >
> > Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >
> > Frank, did you test it with eg. the Silvaco master? =20
>=20
> This problem only existed on one board with specific i2c devices. I have
> not such boards in hand. Carlos work closely with me and tested by our te=
st
> team.

I understand you may not experience the problem, but the solution must
not disturb setups without the problem either. That's why I was asking.

Thanks,
Miqu=C3=A8l
