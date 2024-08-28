Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90059170A39
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724845217; cv=none; b=JeWyOY09zSIGMdnoI3BHRwpR1P/F5SsYNHdZ0TFct1HJP9/56YBfCmZCC7Tv4/VpK2BI9QGsUk89nGiVye4PXj9Cj1PeBe/uogo+mwvb1V7J10mAxbF4XcR/bAhkSpRkOg3xASh2aXHLsz4HNiWz4FXRY5X0GmHwUN+KAKXUI+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724845217; c=relaxed/simple;
	bh=0jmzasQo49T8JkS5/bC+1aJ8RmASfYg9cfa6C3QFc10=;
	h=Subject:Message-ID:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pU8NdThIdvAGiEk/9iB3M8T7N90gs4o8xfbSO2fD8quJmGBVMEEXoPlMEGElzQrxugwGy3LGn36TX6eMLqYhPyPmygimTriIxvTHSPJahZlD6g58SwI2u9XAq+Bj4kSH63bjf74vs61ofGQOQTXlOVFFCx6sVGBkRd8+ExYf3nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=i+DBxZ0q; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rSh/iM2z reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="i+DBxZ0q";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rSh/iM2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724845214; x=1756381214;
  h=message-id:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version:subject;
  bh=ffvjZeGZJmRKF1zvX61+fIWrJOwF0Wh/xImpPka5JUk=;
  b=i+DBxZ0q1IaDtiWpc8UqJxMNqUmb3sPUBUmfojzxOfEMZIbeRt8bkEnI
   C0UjUSGCf4avBvC8slfL2m+3lYRTbuHvLtZO3j6wyeJ2o8JOxKg48pK2y
   lWrtUlaaFJ83fXZDWQ1PD2+hAUlUB7ZpVOivA7QN0IH+fNgKo1R8giHH3
   ZuFEhScawNAljogRUAVKpas5hLmzJtkWD/0iDpq3nsvWaJmSifcN4WKZ4
   KbT2RuiY2lxYGvD0bEv/Q/u6Kf7snji87xHykVCJYn/u+j83YpCGV6slA
   RipMm4uxOQnDfit2Vb5eaEvriEr8ASRPEOSZKKjBspDWG6qETBbf0Xrs5
   A==;
X-CSE-ConnectionGUID: yY4hhAa1T3y70yq7jwMCGA==
X-CSE-MsgGUID: PS9BkWz8Sw6Q+BXY98Dnsw==
X-IronPort-AV: E=Sophos;i="6.10,182,1719871200"; 
   d="scan'208";a="38634586"
Subject: Re: Re: [PATCH 0/5] TQMa6x / MBa6x DT improvements
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Aug 2024 13:40:12 +0200
X-CheckPoint: {66CF0C9C-1B-5FF8EC80-F6CEE9F8}
X-MAIL-CPID: 6B768D1F620E28EAB96671C719A6CEDD_0
X-Control-Analysis: str=0001.0A782F24.66CF0C9C.00F5,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CA0716126B;
	Wed, 28 Aug 2024 13:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724845208;
	h=from:reply-to:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ffvjZeGZJmRKF1zvX61+fIWrJOwF0Wh/xImpPka5JUk=;
	b=rSh/iM2zmUXu6QxTAewrjO8si2lXpjXMnhrfPPwxdzgoTxKnZsVe0wL4SUjYyNHd2sUcnM
	ayS1Dc9cp96iNod2d1hIeU8qluVHDvxiV8K7rd4MWSein6i181xZ7v+UCTKSj2aqZ9sEH3
	nLWFN2KvSFbegb9zAO3Hf9B0LJBbBKm37ZtaOJ/dXKx19zcuRQuTPXVvQT7vak5onqeDuT
	XeSmve7cjndzX5jFSn459qnyXwpcBvJddUpx33BVD/ctT4SdN7lq5C3wcYRzasSm2gyZC3
	4DDoUMIZc+Dxh7uFdo7X6MLaEI2p3p1/6UPRhW5ShzENDPVZIuxoCk4fQk/g0A==
Message-ID: <e132095c10096c9ad7acfa89989a8f91888c6437.camel@ew.tq-group.com>
From: "Niebel, Markus" <Markus.Niebel@ew.tq-group.com>
Reply-To: Markus.Niebel@ew.tq-group.com
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com
Date: Wed, 28 Aug 2024 13:40:05 +0200
In-Reply-To: <Zs6Y6XoqU4DBLvbL@dragon>
References: <20240812143431.98323-1-Markus.Niebel@ew.tq-group.com>
	 <Zs6Y6XoqU4DBLvbL@dragon>
Organization: TQ-Systems GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

> On Mon, Aug 12, 2024 at 04:34:26PM +0200, Markus Niebel wrote:
> > This series brings following improvements:
> > * use a more specific compatible for the LM75 temperature sensors
> >   on SoM and mainboard
> > * move I2C pinmux entries to variants that use them and prevent
> >   doubled declaration
> > * rename node name for onboard USB hub
> >=20
> > Alexander Stein (1):
> >   ARM: dts: imx6qdl: Rename USB hub node name
> >=20
> > Markus Niebel (4):
> >   arm: dts: imx6qdl-tqma6: move i2c3 pinmux to imx6qdl-tqma6b
> >   arm: dts: imx6qdl-tqma6: improve compatible for LM75 temp sensor
> >   arm: dts: imx6qdl-mba6: improve compatible for LM75 temp sensor
> >   arm: dts: imx6qdl-mba6b: remove doubled entry for I2C1 pinmux
>=20
> "ARM: dts: ..." please.
>=20
>=20
> Thank you for the hint, will resend.
> Shawn
>=20

Markus

--=C2=A0
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/
