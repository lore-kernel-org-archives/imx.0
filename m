Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EDA405C8
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TxZk4ixl"
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 0BACEC13AD
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 14:49:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9263EE0009;
	Tue, 17 Oct 2023 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697554190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EKj1C9R90LP8I9gAVutZrILL7DKw51ojM2nAHRNjCCs=;
	b=TxZk4ixlicRIp/4Ps3f+sezpa4q8mtLWj4oe7Byd36WixDBXRuVjTaFqlgCjCoTUnugI37
	i6fruBhlMXWVotKpuFTJ6mlOOsG9tPqM2PPlxZ8mNcRHlxpyj34GGIrKhnRDyPt9TjePd9
	szT/b4qoKkak9uqtlBk6eVM+e3nAF5b74j5JlxHME1Q8ZchY03hfxvgJ/i5czh+fdeIpMr
	bDGXpvLsZJDCVEUemPt6KYmww2exDJixY78LbNNFfQutfMUxw/cHbvO68bDhRWtKqBbJ39
	75gEG/4SV5SKotlDLU0L47OwgAEoJi2sQAT6AS344MSYIrP7DYBvTT78EliF1g==
Date: Tue, 17 Oct 2023 16:49:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/6] i3c: master: svc: fix race condition in ibi work
 thread
Message-ID: <20231017164946.623abd0d@xps-13>
In-Reply-To: <ZS6cRULPrwWjCL02@lizhi-Precision-Tower-5810>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-2-Frank.Li@nxp.com>
	<20231017161658.2de6d9f3@xps-13>
	<ZS6cRULPrwWjCL02@lizhi-Precision-Tower-5810>
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

Frank.li@nxp.com wrote on Tue, 17 Oct 2023 10:37:57 -0400:

> On Tue, Oct 17, 2023 at 04:16:58PM +0200, Miquel Raynal wrote:
> > Hi Frank,
> >=20
> > Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:32:27 -0400:
> >  =20
> > > The ibi work thread operates asynchronously with other transfers, suc=
h as
> > > svc_i3c_master_priv_xfers(). Introduces mutex protection to ensure th=
e =20
> >=20
> > Introduce
> >  =20
> > > completion of the entire i3c/i2c transaction. =20
> >=20
> > Did you experience faulty conditions or was it reported thanks to
> > static analysis? =20
>=20
> Yes, I met. But it needs my slave part patches, which will be ready sent
> out review soon.

I believe several of the "fixes" in this series are related to newer
uses (typically your i3c slave support) which were not in the scope of
the original submission. As these new features are not supposed to be
backported in stable kernels and because these are new corner cases,you
may drop the CC:/Fixes tags to avoid useless backports.

Some of them however are real fixes for situations we may happen with
the current level of support, please keep the tags in these, and move
them all to the beginning of your series.

Thanks,
Miqu=C3=A8l
