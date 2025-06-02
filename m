Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE71622FE0A
	for <imx@lists.linux.dev>; Mon,  2 Jun 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748874555; cv=none; b=qhDBjxi1DaxR2G1KShA/L2TQBLJU6p3/fQFIjOUXO4N+lftkrbGOlwtvD/PJutVvvL8H6vRPTMvlqFt5MgqoklSnEAujEWoqVHYMW+eGEd5dnpjuke/iQghYX7DbhAEYKeGG4LQA0XCtyN+FbCgUJtm4DqmP1Iz816MNGzEuQ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748874555; c=relaxed/simple;
	bh=rhjmV4tsCvaacoEnKGwAlw/2XVBaEUByFXzh2gQxRJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B1IbstzTbtxYrqHqnKpPjcmeBPycp7sxTor6PvgplpFmDNSn81xxl4yNOKuX/DjK5lPLIM/RfglZX4jbg04iInWG9uE4iUXWQryBN/cwTMk5hgTcMwETdQkkFdADz7dCAzyBpHlg6uBTde3QDyrEZatXcAfFKlD9Uz9sAc2K690=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=JetGkI+l; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=r2BWx4Po reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="JetGkI+l";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="r2BWx4Po"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1748874551; x=1780410551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B52/43dJXMkQQpbPKyUY4ll+o7hNau/O7LBggGmj6XI=;
  b=JetGkI+lPfvuImGhqFJt9n9Gy6JAD3UlFf+ZZ8AjO9sjwLOL2XQGxjlN
   kb6CP/9nnchtfbFWZCDdc1SmSVFlS1TeZQthSzCDbPVg5YrYUxvCU2KRq
   VZGGO7RUZFyhR/L+fU1VWj9mFsLJPSkPWPINpAZ+MSs8uggNQkVrgt6zS
   mEBjdYVG7t4ejLZpLwq6zQQmhjSbDX1etRNLcKsUig3hvW/nqdHeSOjTQ
   nUKzmcgQRbU9k6RHnrm+DpQEgxLYsVa8YCmG6exMhkiEuTuypV5sMlf2C
   YKyZM+YhesV56ZMvsLnCdGHuMLSkGmojOtvJCf1eUzg5Gv2FezYuIAxyW
   Q==;
X-CSE-ConnectionGUID: ZWVTTkzFSzy6NUvHswA9fQ==
X-CSE-MsgGUID: E8RWZSoVSa2M3OxK+K3hDw==
X-IronPort-AV: E=Sophos;i="6.16,203,1744063200"; 
   d="scan'208";a="44403954"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 02 Jun 2025 16:29:02 +0200
X-CheckPoint: {683DB52E-C-BA2A3BBA-F71352A8}
X-MAIL-CPID: 1D59A8A4AC5FBF65F5124298CFB95C0D_5
X-Control-Analysis: str=0001.0A006377.683DB535.0013,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A47F16B352;
	Mon,  2 Jun 2025 16:28:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1748874538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B52/43dJXMkQQpbPKyUY4ll+o7hNau/O7LBggGmj6XI=;
	b=r2BWx4PoEvzhhX9uMKZGYVgt+weGtIL8pmNl6IIcDO2m+t4J5X+NUzv3cBNw1jwHqrSuzd
	xULAg7Fhuaxk4XF9wIUiLWG/+Yn1+6y7wxz+ZUoEjFAqlJYNcz+ZUAztRWIploRY3SHr3s
	x1y6xP7grntWDuIXwNBpE6TL9OAYwcpSgZ1GrKBXj7ExovdtWuUAT9hHhxQ7y/7Xo4GFhz
	XG5QTg5EyPU8/Kt+c1GYH0EJok4AVIEasBhxdB2zp793hBGVtbEXmDbqn4bTF6f4lfoxch
	6NlRakZLOiu/mRYnR5AorgChx206NQWcacs2/Id7r/KOLHkp3ZOZjTXXAGRkKg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Gregor Herburger <gregor.herburger@tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject:
 Re: [PATCH 2/2] arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind
 devicetrees
Date: Mon, 02 Jun 2025 16:28:55 +0200
Message-ID: <5019298.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aDnZ/KjP/mMDhwF0@lizhi-Precision-Tower-5810>
References:
 <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
 <7298658.31r3eYUQgx@steina-w> <aDnZ/KjP/mMDhwF0@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Freitag, 30. Mai 2025, 18:17:00 CEST schrieb Frank Li:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen, dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten =
Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know tha=
t they are from a secure source and are safe. In doubt forward the email to=
 the IT-Helpdesk to check it.
> ********************
>=20
> On Fri, May 30, 2025 at 08:29:27AM +0200, Alexander Stein wrote:
> > Hi Frank,
> >
> > Am Mittwoch, 28. Mai 2025, 17:35:52 CEST schrieb Frank Li:
> > > On Tue, May 27, 2025 at 08:03:55AM +0200, Alexander Stein wrote:
> > > > From: Gregor Herburger <gregor.herburger@tq-group.com>
> > > >
> > > > Add device trees for the MBLS1028A and the MBLS1028A-IND and the SoM
> > > > TQMLS1028A.
> > > >
> > > > Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/Makefile        |   2 +
> > > >  .../fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts  |  68 ++++
> > > >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dts      | 118 +++++++
> > > >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi     | 291 ++++++++++++++=
++++
> > > >  .../dts/freescale/fsl-ls1028a-tqmls1028a.dtsi | 117 +++++++
> > >
> > > New dts file, suggest run https://github.com/lznuaa/dt-format to nice=
 order
> >
> > Thanks for the suggestions. It does some improvements, but I also disag=
ree
> > with a lot of proposed changes:
> > * Wrong indent of SPDX tag
> > * model property should come first IMHO
> > * {gpio,interrupt}-controller should come before #{gpio,interrupt}-cells
>=20
> I checked code, it is specific rule to make -cells before -controller. It
> should come from previous review comments.
>=20
> Do you have document or mail list require -controller before --cells ?

There is Documentation/devicetree/bindings/interrupt-controller/interrupts.=
txt.
While not exactly saying anything about property order, "interrupt-controll=
er"
is stated in the very first sentence.
Also from a readers perspective having "-controller" first seems
reasonable, IMHO. "-cells" is necessary because it is a controller.

Best regards
Alexander

> Frank
>=20
> > * gpio-hog property should come first in a hog node
> > * sorting gpio-hog nodes by name instead of line number seems wrong
> >
> > There are some more bogus changes, so I'll skip this tool for now.
> >
> > Thanks & best regards
> > Alexander
> >
> > > Frank
> > > [...]
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/
> >
> >
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


