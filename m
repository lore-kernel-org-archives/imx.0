Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B811D1DE2D7
	for <imx@lists.linux.dev>; Thu, 16 Jan 2025 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737042443; cv=none; b=XyKqZFC8ikTiMhCabBBYAZgwyrLDXAq2uacXQnNo9iAUiwpTwia5ypYq8roK/uc9UFGainfdsrgJB6fDjdLel/tadByYExD5E1zwncFbNoHuKWdL3XklSOn7NwP4UeLgsbuHen0NqY2IwtG4yHt44td4BKvugI95yKFjxEWyrac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737042443; c=relaxed/simple;
	bh=oUMae0uNztkFMRAMHW/PncD10PfK19I9hFA7mAZx5Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nte8EklScGKvfCoTAy89QW0gEh2bbMUPjKvqNA8w3Hu9OYA65XGi+sYcHRbx7pLKdxo5ZJzRUigCrZgjJqokQEfsiarFnJ2PV6rxrgVl5b2IxW1aXAH+IJc7emRuiQSu48Bo/Vk+qtL6VvpfvWcVEcUTQ80Jm/hO+pBIzECkNhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=CbBAYa+W; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=q84Hb1aX reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="CbBAYa+W";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="q84Hb1aX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737042440; x=1768578440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xaChV7cBaPbe1ohg9NpCLfsng9nL3w34aCRLwnxNG4k=;
  b=CbBAYa+WaSly/B14mFopKDDD/PZyP4ReK2DmzjGVjdroYPIW6xoNY9Yy
   3240LcBz2f0KBldoLJ+Iews5PgyJEnvIy2D6bpEeyfwdm0wMaPL6edMES
   RQs1TXND2c3kQ/Ezo44vHs52P+KFqPkHNa1fMwGB83ktBaX5qBs9HFtQv
   OryBLO8py27i0LrLWiBAY8cL6tJgx+7dgMJCq1IzNLW5zXJAsYIgZ2DpC
   7CqjamPFclmNXfzT8vBQFRdpaiH9OFgrOU1rPNmLLL8XI6aAW0GY352Uh
   2U+8OqbVLjqPsqSpRDuyWldQWKNUOBethVclkWUZ3zJB5e3oqc6bY4UBW
   g==;
X-CSE-ConnectionGUID: Z8Lhc84ST9Sp3IP0z04cUQ==
X-CSE-MsgGUID: SEv8VNHrSiOJkb1NNtdBdA==
X-IronPort-AV: E=Sophos;i="6.13,209,1732575600"; 
   d="scan'208";a="41125076"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Jan 2025 16:47:12 +0100
X-CheckPoint: {67892A00-8-9B2B6168-EB6F31C5}
X-MAIL-CPID: 90A1698403BD0B9F8FB62E6BA9D3AA5C_5
X-Control-Analysis: str=0001.0A682F2A.67892A00.0070,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A19716CA7A;
	Thu, 16 Jan 2025 16:47:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737042427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xaChV7cBaPbe1ohg9NpCLfsng9nL3w34aCRLwnxNG4k=;
	b=q84Hb1aXILJupHME6TrWA2bx9eU/gG8zZ86RGmnwEILXf6dARbwt0meo4wpX/q1uveY+yv
	TYGVw5m05b2/YHgfexJmxAjFrtp0iTyq20kenibvvS3sOSFKI14GAyyEThGFxBKyHkMy0S
	8IG2ns828l8rajwcQRpHqNwDWmZb99aRmuN557t58j/9FJyfml7ksD/7l6L130O4mRKuy8
	Y244VHM0El07B0KfnfRRDdSpSzlGecGWvlx1zJpsq4JpS7iBJeRr6IqbDTO378qZF74Tp5
	/ziZ2rqZS98Buy/kT7fDqAPJWqisGvJV5bUP61EWCrxpdf3OClvFArbO6c0aQQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing controller for i.MX9
Date: Thu, 16 Jan 2025 16:47:05 +0100
Message-ID: <2768326.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PAXPR04MB8459EE43FD37732822893343881A2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com> <6018578.MhkbZ0Pkbq@steina-w> <PAXPR04MB8459EE43FD37732822893343881A2@PAXPR04MB8459.eurprd04.prod.outlook.com>
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

Am Donnerstag, 16. Januar 2025, 03:09:02 CET schrieb Peng Fan:
> > Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing
> > controller for i.MX9
> >=20
> > Hi,
> >=20
> > Am Dienstag, 14. Januar 2025, 09:35:41 CET schrieb Peng Fan:
> > > > Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support
> > accessing
> > > > controller for i.MX9
> > > >
> > > > Hi,
> > > >
> > > > Am Samstag, 11. Januar 2025, 13:41:58 CET schrieb Peng Fan:
> > > > > > Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support
> > > > accessing
> > > > > > controller for i.MX9
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > Am Donnerstag, 9. Januar 2025, 04:34:18 CET schrieb Peng Fan:
> > > > > > > On Wed, Jan 08, 2025 at 11:15:40AM +0100, Alexander Stein
> > > > wrote:
> > > > > > > >Hi Peng,
> > > > > > > >
> > > > > > > >Am Mittwoch, 8. Januar 2025, 08:00:18 CET schrieb Peng
> > Fan
> > > > (OSS):
> > > > > > > >> From: Peng Fan <peng.fan@nxp.com>
> > > > > > > >>
> > > > > > > >> i.MX9 OCOTP supports a specific peripheral or function
> > > > > > > >> being
> > > > > > fused
> > > > > > > >> which means disabled, so
> > > > > > > >>  - Introduce ocotp_access_gates to be container of efuse
> > > > > > > >> gate info
> > > > > > > >>  - Iterate all nodes to check accessing permission. If not
> > > > > > > >>    allowed to be accessed, detach the node
> > > > > > > >>
> > > > > > > >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > > > >> ---
> > > > > > > >>  drivers/nvmem/imx-ocotp-ele.c | 172
> > > > > > > >> +++++++++++++++++++++++++++++++++++++++++-
> > > > > > > >>  1 file changed, 171 insertions(+), 1 deletion(-)
> > > > > > > >>
> > > > > > > [....]
> > > > > > > >> +
> > > > > > > >> +	return imx_ele_ocotp_access_control(priv);
> > > > > > > >
> > > > > > > >In [1] you mentioned devlink should solve the probe order.
> > > > > > > >How
> > > > > > does
> > > > > > > >this play when the driver is compiled in (e.g. ethernet for
> > > > > > > >NFS
> > > > > > > >boot) but this OCOTP driver is just a module?
> > > > > > >
> > > > > > > OCOTP needs to built in for using devlink. Or the users needs
> > > > > > > to be built as module.
> > > > > >
> > > > > > I don't like this kind of assumption. Would it make more sense
> > > > > > to make CONFIG_NVMEM_IMX_OCOTP_ELE as bool instead of
> > tristate?
> > > > >
> > > > > No. Users could setup their own system with this driver build in
> > > > > or built related drivers as modules.
> > > >
> > > > Sure, but if the kernel locks/fails/panics while accessing
> > > > peripherals just because of the kernel config seems at east very
> > unfortunate to me.
> > > > How is someone supposed to analyze/debug this?
> > > >
> > > > > At least for Android GKI, this driver needs to be as module.
> > > >
> > > > Any particular reason this needs to be a module?
> > >
> > > Android has a minimal kernel which is controlled by Google.
> > > Vendors could only built modules based on Google's Image.
> > >
> > > Updating this to y in upstream, means we need to change it back to
> > m
> > > in NXP downstream android kernel.
> >=20
> > Ok, that's an Android thing.
> >=20
> > > If you need it built in, you could modify your downstream config,
> > > right?
> >=20
> > I'm not saying I need a built-in. My concern is that a wrong Kconfig wi=
ll
> > result in silent errors/lockups.
>=20
> You wanna me to put this default y in arm64 defconfig in
> upstream kernel?
>=20
> If yes, this could be separate patch to Shawn if this patchset got
> merged by Srinivas.

I don't know what others says about adjusting defconfig. But at least
add a comment to the Kconfig help that if built as modules, any
other driver relying on this also needs to be a module as well.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


