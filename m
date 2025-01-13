Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ACE23314E
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770620; cv=none; b=RQC1lGveDbE8bjM/q9IECZCLsqofE41BXLsHK9kxXtV9Kdl+dZYasUEnYOjLFg+sVBf08aC78TdIQbOTGczUqhME1Rb5zGAPEPhRYylg4ICfKMo6+4XknvX1yOPKW3R17CfScG50guYPQfk4icvUHm2a+roz4fFb5POkDTlzpCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770620; c=relaxed/simple;
	bh=Un1kvi9W5WQQ+48XFletoPgm7L4mV6GyNZaoYgkco7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=trgWOplpusAdmHv/mQuOJSDt+iVg4GTznAnqaAuKLg3Dok24rlfQenQgCf5euSFG18/pKTuDjEySzDFFQUV3vo0fwlxPbVo3D3EErwnMcDSV/jwQbDXDqsf5PBrnnCahTzj2oFykhdW2hc1b7IzmeKDQfHV7oXRfH6qOJpxoFi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=KYX5/8OW; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ac7C9uQC reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="KYX5/8OW";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ac7C9uQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736770616; x=1768306616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h/I8ofgS/1dP08mnYQl4u8YsIuLHQEi0Cj5vHjiYV6k=;
  b=KYX5/8OW2pj9ixH82eLDLSQ0TN2PvikCQMmiaWWlFPRTdHTMioos4cQR
   3yvhfEfHdjIoi1kAXouSRHbEwHuNTS+jy/oJugkQ5QjQDACF2ofLrwbfI
   27CFmpeOJ47lUPCqfFfaeyPmlQBI1EAM4WSs8gKleAr//DMNL3pEuf2fL
   F1U+QitHX5V/EBXwXdPNCvTMCi6Yl/O3pH1RHSo7DZt5+HH8zuLXl61Pe
   0vMd7hOizD0mIqWnNJv0asj+yd3Y5Qfb+0ExDyxwNoUDLhCsnCE9tSB7w
   f8vlaSqZlPCdAkfZcjlldgvCyhqHV7k9YFWiOpf4GUNiF7rtG2Ddn+3ZJ
   g==;
X-CSE-ConnectionGUID: 1qdIUrH+QMyWDUbbj50IAQ==
X-CSE-MsgGUID: EUfQ4QiHQJW34iNFwyctOg==
X-IronPort-AV: E=Sophos;i="6.12,310,1728943200"; 
   d="scan'208";a="41016138"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Jan 2025 13:16:53 +0100
X-CheckPoint: {67850435-31-1CE016C0-E589DA3E}
X-MAIL-CPID: 120C5A0C0DE13FDF760E80BE027CE42F_1
X-Control-Analysis: str=0001.0A682F27.67850436.001E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09A9D16126B;
	Mon, 13 Jan 2025 13:16:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736770609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/I8ofgS/1dP08mnYQl4u8YsIuLHQEi0Cj5vHjiYV6k=;
	b=Ac7C9uQCZ35A/+fQR7yoeb9o+uj1ZH9FqfqxRd7hKAgFaWh/j+iTwniqK8GbVh57j87e9d
	yjYbycnZ4bUgeunosg5mLFOHd8hvvjNeJaGVzdkt3Un8CQ+wj9i4KIuskUtbjNkTD10xrX
	3BoV4+gVy2z4jbviap+kygofq0nUFr7GFLMo7tx8Ap0/PNPHEYqa20+RA2laaFtgxc+djW
	HKmzaECbg4tm2aJat6yqYki94rj3B4cGHhRV6DawPB6wWciNI3cmkAqHFELOJq8KtSG8pj
	H7DFC3wwhqJ7AfQSqrkfj6Avw4rD5mGCaa1NE2/nOwjVzJtWNCwB0Et+q2I22A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing controller for i.MX9
Date: Mon, 13 Jan 2025 13:16:48 +0100
Message-ID: <4956524.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <DB9PR04MB84615C152538FD411F462B19881D2@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com> <868241455.0ifERbkFSE@steina-w> <DB9PR04MB84615C152538FD411F462B19881D2@DB9PR04MB8461.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Samstag, 11. Januar 2025, 13:41:58 CET schrieb Peng Fan:
> > Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing
> > controller for i.MX9
> >=20
> > Hi,
> >=20
> > Am Donnerstag, 9. Januar 2025, 04:34:18 CET schrieb Peng Fan:
> > > On Wed, Jan 08, 2025 at 11:15:40AM +0100, Alexander Stein wrote:
> > > >Hi Peng,
> > > >
> > > >Am Mittwoch, 8. Januar 2025, 08:00:18 CET schrieb Peng Fan (OSS):
> > > >> From: Peng Fan <peng.fan@nxp.com>
> > > >>
> > > >> i.MX9 OCOTP supports a specific peripheral or function being
> > fused
> > > >> which means disabled, so
> > > >>  - Introduce ocotp_access_gates to be container of efuse gate info
> > > >>  - Iterate all nodes to check accessing permission. If not
> > > >>    allowed to be accessed, detach the node
> > > >>
> > > >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > >> ---
> > > >>  drivers/nvmem/imx-ocotp-ele.c | 172
> > > >> +++++++++++++++++++++++++++++++++++++++++-
> > > >>  1 file changed, 171 insertions(+), 1 deletion(-)
> > > >>
> > > [....]
> > > >> +
> > > >> +	return imx_ele_ocotp_access_control(priv);
> > > >
> > > >In [1] you mentioned devlink should solve the probe order. How
> > does
> > > >this play when the driver is compiled in (e.g. ethernet for NFS boot)
> > > >but this OCOTP driver is just a module?
> > >
> > > OCOTP needs to built in for using devlink. Or the users needs to be
> > > built as module.
> >=20
> > I don't like this kind of assumption. Would it make more sense to make
> > CONFIG_NVMEM_IMX_OCOTP_ELE as bool instead of tristate?
>=20
> No. Users could setup their own system with this driver build in
> or built related drivers as modules.

Sure, but if the kernel locks/fails/panics while accessing peripherals
just because of the kernel config seems at east very unfortunate to me.
How is someone supposed to analyze/debug this?

> At least for Android GKI, this driver needs to be as module.

Any particular reason this needs to be a module?
Which means any affected driver needs to be a module as well just because if
a DT reference, no? With no means to know which drivers are affected, despi=
te
checking for the DT references manually?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


