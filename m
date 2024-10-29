Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B699194A44
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730216528; cv=none; b=kOLz9Ft2EfslicZoVRwLybvBckB+T6lpH+zwkYvU6uErBFKxuHhUbDfNytD2OfD7R+gA50q00H3h+5zpc3sCM7I4xH0ZTSDhyXpSaLRDadmkamgQTuHVUmLDV4/k7cczjyoi8wUZeQYupCDaMDe5zCqffN2+y7xSy96FRUzzx6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730216528; c=relaxed/simple;
	bh=cOIj4qw7W/hSCbISJ2CLfQ6H770imsg9H9DMcgYKsds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K+5cpGUpjHgIcgnrMqwvqN5oyhDIZ2ARyNsEE1jzNW5pi8o1oWrp5hrAMrWch6n25G/3hStYpNYlkcY0/M5jCxC69eHWdqNK7FbYX5fWqw7JAv6JiIMQqH5L2oAfnV6h/6o6WjvxfDXMCpyIHA4xAF8wC9K3AoPD9xLf3R0hnY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=lxLTEbL9; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=d43V220x reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="lxLTEbL9";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="d43V220x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730216525; x=1761752525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lNiIgMzqjD7JnSewZ3IhEBUr+kDPKJaLJNDhMEfOTU4=;
  b=lxLTEbL9cJEU7xVWIwlSWlhu0os5tV7Ywn0TxVFkCBtS0galuDmfn+89
   RD7QgOtpBm4lCiDkqYAk7WlmtH63OnbmiS7A7N4htz7OSvmW9ag6pdCiK
   gXHjyeb8HExapJiQGKyTJfNqe7TsfVW51C9ir0SASe7pxqj7yr/3ar+gf
   aZbhDiGKX0CQDlOXsWkkkxV04OCuFikWZB42KrDmrTGqbw2moxl+1EJRu
   /RL91wUPaAOYIipp5BvRV9kVvLLOUBDnE5bBz9sOTXDdqyOkzmbXQXAhE
   jL3guTe1Us4YjN2aY9jXV4hrsgnVIB0Fuj3Z9dqMaYUuc8mm+T37Lzf9f
   w==;
X-CSE-ConnectionGUID: EJO/soQAQBiuZRY5p2q1WQ==
X-CSE-MsgGUID: yDbm1SmPS9mGLdueEux2rA==
X-IronPort-AV: E=Sophos;i="6.11,241,1725314400"; 
   d="scan'208";a="39741195"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Oct 2024 16:42:02 +0100
X-CheckPoint: {6721024A-2C-D31EDE1A-D52D6119}
X-MAIL-CPID: 86EBC639FFD8A347FFFA3158577E90EE_5
X-Control-Analysis: str=0001.0A682F18.6721024B.001A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E9BA165CDD;
	Tue, 29 Oct 2024 16:41:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730216518;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lNiIgMzqjD7JnSewZ3IhEBUr+kDPKJaLJNDhMEfOTU4=;
	b=d43V220x7dVdOZSIsV/ABOigjAWn9QuNLSkmlQvULgSyyfG5B4o9WUVvZ6wU6AQAhrDZ/B
	OHFJ24703OI7si9qkf0jNYI4+f49ms4xEDARF1fEsSrSK9C7NPopRClbjW44EL5fHoM9t4
	TfHkVZfwjcXp9Gx7e5AEjToGbaNQ4kvt37ma5drCtu2sP9DkhYu3ax82X/j/mmz+NT4vs0
	pBvubsZCNbnNuzUks36q1/D2IwEoHePM0tv8ec6Dqveiu64FqtMNwDGuaJOhqkeUu/s21u
	JRAoOtUu6WDvBGV+bS9Flpn2cYufQx2C58yMN2q8FcNTAqkFMaVs8LtiZNAFDg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, Xu Yang <xu.yang_2@nxp.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] dtbs_check warning clean up against fsl, mxs-usbphy.yaml
Date: Tue, 29 Oct 2024 16:41:56 +0100
Message-ID: <4608791.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZyD/QzKS7xqQ2QF8@lizhi-Precision-Tower-5810>
References: <20240926073951.783869-1-xu.yang_2@nxp.com> <6099458.lOV4Wx5bFT@steina-w> <ZyD/QzKS7xqQ2QF8@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Frank,

Am Dienstag, 29. Oktober 2024, 16:29:07 CET schrieb Frank Li:
> On Tue, Oct 29, 2024 at 04:15:54PM +0100, Alexander Stein wrote:
> > Hi Vinod,
> >
> > Am Donnerstag, 17. Oktober 2024, 17:36:12 CET schrieb Vinod Koul:
> > >
> > > On Thu, 26 Sep 2024 15:39:46 +0800, Xu Yang wrote:
> > > > Some changes to clean up dtbs_check warning against fsl,mxs-usbphy.=
yaml.
> > > >
> > > > The first 4 patches are used to fix below warning, "nxp,sim" is only
> > > > needed by i.MX7ULP:
> > > >  - 'nxp,sim' is a required property
> > > >
> > > > The last patch is used to fix below warning:
> > > >  - fsl,tx-d-cal: 5 is less than the minimum of 79
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/5] dt-bindings: phy: mxs-usb-phy: add imx8qxp compatible
> > >       commit: 76b4f2a5cec59e842de4b5989eb990a2ee8cedf3
> > > [2/5] arm64: dts: imx8dxl-ss-conn: change usbphy1 compatible
> > >       (no commit info)
> > > [3/5] arm64: dts: imx8qm: change usbphy1 compatible
> > >       (no commit info)
> > > [4/5] arm64: dts: imx8qxp: change usbphy1 compatible
> > >       (no commit info)
> > > [5/5] ARM: dts: imx6qdl: convert fsl,tx-d-cal to correct value
> > >       (no commit info)
> >
> > Did maybe something go wrong while merging? Only patch 1 has a commit S=
HA1
> > in this mail.
> > Also only patch 1 is available in linux-next
>=20
> Supposed script report issue. Only dt-bindings go to through DMA tree.
> Other dts should go through shawn's tree.
>=20
> Still wait for shawn pick dts patches.

Aah, thanks for clearing up.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


