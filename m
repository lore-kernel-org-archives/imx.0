Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5523E16A955
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723546983; cv=none; b=ttOZEYkW3ExFZWeacXbNSj0e3EBWXIz4HNZ5thNOlWSlZ3Ohb5EQdWyJQr7merSwjzFI/kgjXXafHnJanbpTSKUujq0rjP0M/u08OXZ9PBhmQPH7KkJ+XB7z/QsBR4mNgrMjsLn1mEtrZ17j+YTRqIY1b3l9HQPRVc9ThAubb8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723546983; c=relaxed/simple;
	bh=PwUa5/OanIErRHAvEgE9UQwuwofhy8HwKU6/7A/LFUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AAfjHnggEpDfF/mCW8yqRsa9j3ONmBnnxDPJsKHBCbecHfOl3vwuB7go18AGvCWPYDcNG+S41gYS9ZHFHOxVOYO0zgDNbBAs84qrfZHkTvxIAAYQjI5OrkC+noDQZzl9qqPpc29Q10XbBysq9h4Bl7k4z1/yhD5mxtxI7POF5Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=YYba8t5A; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=pKGZPbvS reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="YYba8t5A";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pKGZPbvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723546980; x=1755082980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BX8/YcQITWwz1XEoFgy9ZmyJuYxThxbscbz2octGzAE=;
  b=YYba8t5A03+yASvcoMRUnGJtY32FtSZxhi4STzpdEJr3FjFsqcnlT7mB
   ib1GdQoQs9UjJeoGnswSLBQbK2X0mlzGOxYwoM/NXD3YkOiUGiVQ1stCm
   ma9NbgmBYwWTt5l0pRGyhcTNzoqz0S1dERamxdAr6kyFURm/hWfO9fzef
   AnWJuepAbjhYrejgFAyECpUVypPJO24gEA4fNhAepAOv8oVOtqDi7e8jV
   z+d9mQ50oy8tFAO9t1W454ZFLCYmGa+okiKL1XAhvwotQN4awebXVh/h5
   46BSEZaSz9BfWb4pK+bFw1zVGn8ldOdbJZ8VMd8FJWr+9Yxfko97yA1za
   Q==;
X-CSE-ConnectionGUID: F/Gzg1pvRoySPc4KafHwrw==
X-CSE-MsgGUID: dgzq19lBT/62vuCWd0dEMg==
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; 
   d="scan'208";a="38383452"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Aug 2024 13:02:58 +0200
X-CheckPoint: {66BB3D62-A-45EF2B36-F6E28480}
X-MAIL-CPID: 8522DF81CEE9203FFD6B6412A29F7287_0
X-Control-Analysis: str=0001.0A782F1B.66BB3D62.0069,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3070E164987;
	Tue, 13 Aug 2024 13:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723546973;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BX8/YcQITWwz1XEoFgy9ZmyJuYxThxbscbz2octGzAE=;
	b=pKGZPbvS8nX3DhTjo+uJRpFLzFrd/5oQ7jlkpOLLK7qGpyzGCTxMZwbfgr3maNhy+a/sDe
	FoFv+qrZ7XjuT2+h/FUwmSoexwgbd0KNmJTtZSMpP2P1SuT2rnx39g/ksZhL+3tGqp2EQ+
	Q/caBG8ibAJVRMVlbYsWmBBeyCykCNr7JoVvtdaYNi26fGjdpbOib0uyg9VEPvfijc+zSG
	CEVLVlafOzKfGb46I6zD7JOdvCY+N26AhMlRucV04FCjsqIyD+F39JLRaVYYO4U9632ctZ
	G/pF85M8j6P7JV9bpPTuVtLNAC5OFONnQBhhCZiwsjLD3INKbaLsx15hmvv85A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Markus Niebel <Markus.Niebel@ew.tq-group.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 5/5] ARM: dts: imx6qdl: Rename USB hub node name
Date: Tue, 13 Aug 2024 13:02:54 +0200
Message-ID: <2621134.Lt9SDvczpP@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <82ee2be2-366e-40b2-ac95-e755443032be@kernel.org>
References: <20240812143431.98323-1-Markus.Niebel@ew.tq-group.com> <1901821.CQOukoFCf9@steina-w> <82ee2be2-366e-40b2-ac95-e755443032be@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 13. August 2024, 11:44:28 CEST schrieb Krzysztof Kozlowski:
> On 13/08/2024 11:27, Alexander Stein wrote:
> > Am Dienstag, 13. August 2024, 11:20:08 CEST schrieb Krzysztof Kozlowski:
> >> On 12/08/2024 16:34, Markus Niebel wrote:
> >>> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>>
> >>> According to microchip,usb2514.yaml the node name shall be usb-hub.
> >>
> >> That's not true. The schema does not say anything like this. Old name =
is
> >> correct. NAK.
> >=20
> > So, is the schema incorrect? There is the dtbs_check warning:
> > arch/arm/boot/dts/nxp/imx/imx6q-mba6b.dtb: hub@1: $nodename:0: 'hub@1' =
does not match '^usb(@.*)?'
> >         from schema $id: http://devicetree.org/schemas/usb/microchip,us=
b2514.yaml#
>=20
> If you have a warning, shorten it and paste it so this will be obvious.
> If you look at several bindings, the hub is widely used name. I think
> the schema is not correct here - I do not see any properties from
> usb.yaml being used here (for usb2514). What's more, if you compare
> usb2514 with any other on-board HUB representations (because that's the
> only point why we have it in bindings, right?), none of them reference
> usb(-hcd)?.yaml.
>=20
> These are not USB controllers, IMO.

I raised that concern in [1] already, but nobody commented.

Best regards,
Alexander

[1] https://lore.kernel.org/all/3633627.mvXUDI8C0e@steina-w/
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


