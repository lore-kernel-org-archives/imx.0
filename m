Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE531D5ACF
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924173; cv=none; b=JokwPC64KuLmbRUxQEqaKjc5SETqUE7KpkZy4MnGRkvTukcqUBcs5zmi2xUb4YIoqeUHc1OoRE1lx7xw5Py+MqcyDO7eabU6fMQ74ROQO1pvj1rgn4cEu8WDDhq6t5mS7Kii1kAOZi+HMz0KB47ktHi7/3P51CnnyL9hFxSbnoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924173; c=relaxed/simple;
	bh=uplevQf1DBuL/p+VfT9NuX2d3lq3vkW1oymExHJLGkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+98qFUde8V549SvbqdYuy15LVrpKBy4wGD5qgbLVAwxPy8h74pl4z4VyubJFzTkq9xxFzWg2JaNWaWMnTEIzfn59ACsH/PTg1ue45JEyhhYx1QpzhV7aXdyxsVh9bTQ6gwQI60MhGPbdyGPHGN5Us/rVUfaGgE62IQPJ3Rhero=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=g7SNL867; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rRaUt3r4 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="g7SNL867";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rRaUt3r4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736924170; x=1768460170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NZWScfnhG5GpViQRhxbdTtAg65z7x4RzTUF+ZyOs9oE=;
  b=g7SNL867obHYVORxm7cu47iyxao3wUXZyaZ6GZ4yUnUBlpMUgo7ExpEE
   r1ecartrEQP8I0mb7kd0V4HoRJJZs3ehlSO6QQFggn3+oabHbQz7JbSWq
   pd7BN7Svn/wFm7MQICn4fKxjWlzpUZutnQIqsluhmK/0fCrqk+RD/KDRq
   Hxit0mh+s93fw9qnzAlGwzjpV9IMZXufi+LJJzPxGHL6lk55SHbC+sGWA
   dYwZXywvk140YACoYhq8AvTq/ky2nUiJzmqrTvJrufE1KGvxueTgY1dkH
   LQp5mmPTRsgT7lg04++bpBosyK/MY/KgW6KeYnxqVZnWLuqipChEEI9ij
   Q==;
X-CSE-ConnectionGUID: gsu/clicSM+xgQm8P2XkNw==
X-CSE-MsgGUID: /xlyy+hpQRu21QT+U+Ca/g==
X-IronPort-AV: E=Sophos;i="6.12,316,1728943200"; 
   d="scan'208";a="41055623"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Jan 2025 07:56:08 +0100
X-CheckPoint: {67875C08-2A-3C670366-E45AD810}
X-MAIL-CPID: 4DCA0B359B8F2B8B5BAA414B640255C3_4
X-Control-Analysis: str=0001.0A682F28.67875C08.009C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE05516A656;
	Wed, 15 Jan 2025 07:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736924164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZWScfnhG5GpViQRhxbdTtAg65z7x4RzTUF+ZyOs9oE=;
	b=rRaUt3r4mq0n3eb7lakp4IuWL8VHI5lLgQFtofeKLZDIi1fAcaaTZ8JIyAlDw5Us6wSQ0M
	xYYjkvmdGBCha/mkYW6snO2AY0f8xOYD0d4lNGon0ALqk+YPaCmXl+XWUEmP4Wp5xgS5TC
	XbYPn/PJGbavKZbz7kEp0oiJpEt3sAmegaDAZmydMLBH+AjMi3VOtpjk/ju5gB8ICgOT4k
	inRn5+MkpDdUx/JGMj5VSnuD4aIobLqC89rzX+rydW1EH4rB9/8Pnk04kW5AtmUmurtIMQ
	AyER144bIk1+4EKeu0xef4TWFv/uY+Jf8WONTsc+odM0AM1u9iJ9RbhdY9GmYw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing controller for i.MX9
Date: Wed, 15 Jan 2025 07:56:03 +0100
Message-ID: <6018578.MhkbZ0Pkbq@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PAXPR04MB84598515572A669E5856379F88182@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com> <4956524.GXAFRqVoOG@steina-w> <PAXPR04MB84598515572A669E5856379F88182@PAXPR04MB8459.eurprd04.prod.outlook.com>
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

Am Dienstag, 14. Januar 2025, 09:35:41 CET schrieb Peng Fan:
> > Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing
> > controller for i.MX9
> >=20
> > Hi,
> >=20
> > Am Samstag, 11. Januar 2025, 13:41:58 CET schrieb Peng Fan:
> > > > Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support
> > accessing
> > > > controller for i.MX9
> > > >
> > > > Hi,
> > > >
> > > > Am Donnerstag, 9. Januar 2025, 04:34:18 CET schrieb Peng Fan:
> > > > > On Wed, Jan 08, 2025 at 11:15:40AM +0100, Alexander Stein
> > wrote:
> > > > > >Hi Peng,
> > > > > >
> > > > > >Am Mittwoch, 8. Januar 2025, 08:00:18 CET schrieb Peng Fan
> > (OSS):
> > > > > >> From: Peng Fan <peng.fan@nxp.com>
> > > > > >>
> > > > > >> i.MX9 OCOTP supports a specific peripheral or function being
> > > > fused
> > > > > >> which means disabled, so
> > > > > >>  - Introduce ocotp_access_gates to be container of efuse gate
> > > > > >> info
> > > > > >>  - Iterate all nodes to check accessing permission. If not
> > > > > >>    allowed to be accessed, detach the node
> > > > > >>
> > > > > >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > >> ---
> > > > > >>  drivers/nvmem/imx-ocotp-ele.c | 172
> > > > > >> +++++++++++++++++++++++++++++++++++++++++-
> > > > > >>  1 file changed, 171 insertions(+), 1 deletion(-)
> > > > > >>
> > > > > [....]
> > > > > >> +
> > > > > >> +	return imx_ele_ocotp_access_control(priv);
> > > > > >
> > > > > >In [1] you mentioned devlink should solve the probe order. How
> > > > does
> > > > > >this play when the driver is compiled in (e.g. ethernet for NFS
> > > > > >boot) but this OCOTP driver is just a module?
> > > > >
> > > > > OCOTP needs to built in for using devlink. Or the users needs to
> > > > > be built as module.
> > > >
> > > > I don't like this kind of assumption. Would it make more sense to
> > > > make CONFIG_NVMEM_IMX_OCOTP_ELE as bool instead of tristate?
> > >
> > > No. Users could setup their own system with this driver build in or
> > > built related drivers as modules.
> >=20
> > Sure, but if the kernel locks/fails/panics while accessing peripherals =
just
> > because of the kernel config seems at east very unfortunate to me.
> > How is someone supposed to analyze/debug this?
> >=20
> > > At least for Android GKI, this driver needs to be as module.
> >=20
> > Any particular reason this needs to be a module?
>=20
> Android has a minimal kernel which is controlled by Google.
> Vendors could only built modules based on Google's Image.
>=20
> Updating this to y in upstream, means we need to change
> it back to m in NXP downstream android kernel.

Ok, that's an Android thing.

> If you need it built in, you could modify your downstream
> config, right?

I'm not saying I need a built-in. My concern is that a wrong Kconfig will
result in silent errors/lockups.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


