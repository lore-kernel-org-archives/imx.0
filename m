Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A384537E9
	for <imx@lists.linux.dev>; Tue, 25 Mar 2025 07:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742886018; cv=none; b=E/WTpV38akds/CCCFfiOqjFjG7hU2WE8o7Xc90D4RyscblycSDmTHCWbLeNvpULFHAuo9LJ28armb9agBoRGlQZ9IG4k6VevmL0pV55xGhiOZV55j9XPtqItSKNAEsy4yGSGvc5dD4MwpKsSyAA2e4CsRm163kkhMESJ4iuIP1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742886018; c=relaxed/simple;
	bh=+JqXqW6GFX+G61Bz3yT7Trsp0s/RlbjFyxsJA6Yi36Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cHtMcj9IxceUIs+iZDKDFgCvEQlIL/SOAYI55YSaANfQuUFAbh+I5UAp9MAFBwzDEMT8CheiK/yB/+jVJzA6QCLaKrt9fJeS+SEzqGXFJ8CdIuxhl4716mheTw0n5GKc17ZS9B3+A9o7kPUCPOelFaf1rTF4ezvlEzy6XhJfJOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=JO5JS3P3; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=g+LXzTJV reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="JO5JS3P3";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="g+LXzTJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742886015; x=1774422015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IY1LRasI1a4gFwiAowe/BlaLi9qjAct5Q0v/7Pv3fzc=;
  b=JO5JS3P3VDwQnLH1aJ/87xDTqMTYj439JWoeQA9hQvXxsCqlgMRtL4VX
   FRv9Bn30CZXrrjbgV5WutvcKl9dRdCYqRDmwFcm4AFsW07hNHnZPuMrcg
   K0NmXjYHDm0qklJFSf9aUngv5fkisMCGU0H8g7HLJlphRYM6hCw7pBBtw
   NeX+OxOV9HYFWVocHrMKtOfS8lXl/lWkQtCnEDIZ5T42tRvZjl+pb9Zqv
   QceW8yu13eK3Z154iAOXcKZeH9Bmw82Va3COnjCed+EKg2ZJx6NcLEaj2
   dCn++qU4EpV8SFnXZxIIXF1AAfb0VLDAD3gunegK6cFBS+8STVE+vBUCC
   A==;
X-CSE-ConnectionGUID: wLTuKKJvS5uEe8ivLhc3ew==
X-CSE-MsgGUID: Yk3E/ZCrRXKmkvWbyVJD1w==
X-IronPort-AV: E=Sophos;i="6.14,274,1736809200"; 
   d="scan'208";a="43135474"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Mar 2025 08:00:11 +0100
X-CheckPoint: {67E2547B-36-903EAEAC-E04C76C8}
X-MAIL-CPID: 5ED2254210CBCBBAE887422E760A4071_5
X-Control-Analysis: str=0001.0A006372.67E25477.00AF,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2D251632F7;
	Tue, 25 Mar 2025 08:00:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742886006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IY1LRasI1a4gFwiAowe/BlaLi9qjAct5Q0v/7Pv3fzc=;
	b=g+LXzTJVJqyoxffvyz8jSMsqghsG9czM4ntoP70bldxrkl6PwZuP0nAC/iIQ1doTUeZu5e
	2GK1wKUKixhDvNAFOvNRLAtM2ilE/aXqZLe5TXIzXg+Ss4hb+hDfCzHJR8GvbroSDCXlz8
	3HH/9ZEi3aJ07NCXqcZ7vYT0UQ5zX4NmtP5cMZAk+J8JwuqguqjBu+/39+cdzcQk+NE0s0
	+1cMiMmP2hiMeVFM0czr5iYVDb8/Szl/WpA5aEabwAQ9v+52eJDJ4qkchtBrDsaw3zRIvG
	ezps5JR5w/9paFGiHgw7unrftOPv6PqhrNMd6r0fxfmYfGArFAApZbWnFutKAA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Marek Vasut <marex@denx.de>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Date: Tue, 25 Mar 2025 08:00:00 +0100
Message-ID: <4643598.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <e8e9f36a-6d05-425e-a0e5-89689424336d@denx.de>
References:
 <20250321200625.132494-1-marex@denx.de> <6144881.lOV4Wx5bFT@steina-w>
 <e8e9f36a-6d05-425e-a0e5-89689424336d@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Marek,

Am Dienstag, 25. M=E4rz 2025, 00:35:41 CET schrieb Marek Vasut:
> On 3/24/25 8:02 AM, Alexander Stein wrote:
>=20
> Hi,
>=20
> >> @@ -1890,6 +1919,35 @@ netc_emdio: mdio@0,0 {
> >>   			};
> >>   		};
> >>  =20
> >> +		gpu_blk_ctrl: reset-controller@4d810000 {
> >> +			compatible =3D "nxp,imx95-gpu-blk-ctrl";
> >> +			reg =3D <0x0 0x4d810000 0x0 0xc>;
> >> +			#reset-cells =3D <1>;
> >> +			clocks =3D <&scmi_clk IMX95_CLK_GPUAPB>;
> >> +			assigned-clocks =3D <&scmi_clk IMX95_CLK_GPUAPB>;
> >> +			assigned-clock-parents =3D <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
> >> +			assigned-clock-rates =3D <133333333>;
> >> +			power-domains =3D <&scmi_devpd IMX95_PD_GPU>;
> >> +		};
> >=20
> > With the SM release lf-6.12.3-1.0.0 AP does not have any access to
> > this BLK_CTRL anymore. See [1]
> I just built SM 6.12 and it still requires the reset, without reset I=20
> cannot use the GPU ... or ... which BLK CTRL do you refer to ?

I'm specifically looking at [1]. AFAIU after that change AP has no access
to BLK_CTRL_GPUMIX. But this is just from looking at the changes.

Best regards
Alexander

[1] https://github.com/nxp-imx/imx-sm/commit/a3e5da9ea51144f513ac3909fa151f=
a7df394100
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


