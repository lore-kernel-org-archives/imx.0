Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415AE4448F
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DIhz5rgP"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7F301BF208;
	Tue, 17 Oct 2023 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697556191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVpv3WCrcUghzXlwdsPDnGHWlQrs/lOsKY8Fyqs4GAM=;
	b=DIhz5rgPZ36rK8mD+gdaQxrgw0fY9/A9YOcPdTjc33JOXHZBlVR7ziGYL/IkzSV2WD8qsu
	o1+OMbjIyKh+jUnWN2FsTxHXsjJ6GrdABSJjnpZAx85w1dOCOmdUm+Ffrza3nA/b1VzFUq
	/EAa/1gP+xXSmYOh8MpxexztnBM7aw5LyUGfVRuSji7LGLDmZeZG3YZndJhxXHTis5wQ5a
	TL3mIJQjVYQOOrJCV2PhoIXJ/r88LrVfprNviuTNsUtgNzl8aqwcXruVnzx9yCdHvkHvVt
	UxZDlDn/zDQPuPEUffcwqonekT4QHbxLUYfdaHyn735jx0AQOsd2Zr5+txiXFQ==
Date: Tue, 17 Oct 2023 17:23:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/6] i3c: master: svc: fix race condition in ibi work
 thread
Message-ID: <20231017172309.2a251393@xps-13>
In-Reply-To: <ZS6j/tpqEppFADk1@lizhi-Precision-Tower-5810>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-2-Frank.Li@nxp.com>
	<20231017161658.2de6d9f3@xps-13>
	<ZS6cRULPrwWjCL02@lizhi-Precision-Tower-5810>
	<20231017164946.623abd0d@xps-13>
	<ZS6j/tpqEppFADk1@lizhi-Precision-Tower-5810>
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

Frank.li@nxp.com wrote on Tue, 17 Oct 2023 11:10:54 -0400:

> On Tue, Oct 17, 2023 at 04:49:46PM +0200, Miquel Raynal wrote:
> > Hi Frank,
> >=20
> > Frank.li@nxp.com wrote on Tue, 17 Oct 2023 10:37:57 -0400:
> >  =20
> > > On Tue, Oct 17, 2023 at 04:16:58PM +0200, Miquel Raynal wrote: =20
> > > > Hi Frank,
> > > >=20
> > > > Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:32:27 -0400:
> > > >    =20
> > > > > The ibi work thread operates asynchronously with other transfers,=
 such as
> > > > > svc_i3c_master_priv_xfers(). Introduces mutex protection to ensur=
e the   =20
> > > >=20
> > > > Introduce
> > > >    =20
> > > > > completion of the entire i3c/i2c transaction.   =20
> > > >=20
> > > > Did you experience faulty conditions or was it reported thanks to
> > > > static analysis?   =20
> > >=20
> > > Yes, I met. But it needs my slave part patches, which will be ready s=
ent
> > > out review soon. =20
> >=20
> > I believe several of the "fixes" in this series are related to newer
> > uses (typically your i3c slave support) which were not in the scope of
> > the original submission. As these new features are not supposed to be
> > backported in stable kernels and because these are new corner cases,you
> > may drop the CC:/Fixes tags to avoid useless backports. =20
>=20
> I don't think so. The issue exists. Just difficult to find it. If there a=
re
> i3c device that use IBI frequently. The problem should be trigger. My case
> just make it easy to trigger the problem.
>=20
> In previous existed code, IBI is supported.
>=20
> I think it is typical case, which need CC/Fixes.

I am not talking about this patch in particular.

>=20
> Frank
>=20
> >=20
> > Some of them however are real fixes for situations we may happen with
> > the current level of support, please keep the tags in these, and move
> > them all to the beginning of your series.
> >=20
> > Thanks,
> > Miqu=C3=A8l =20


Thanks,
Miqu=C3=A8l
