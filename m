Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B516025D544
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738093; cv=none; b=qLGfvtr8uawFsiNqMhlQzoHNv4N9nHuR5p73ZamGtwCjMp2EehQI13F8wIjjGvRVueu0q5Vw+aNcApPFUxznXyOcq+MQ5Crg7DSa+OmDjMNCIIEBk2y1JsMwb8p+vK5Rv1YxKkIrp7ApMLa8hnhPCP41rjU4amwjhUK25IckPAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738093; c=relaxed/simple;
	bh=YmZwe21JQSoM02pQA3VHIdehiaTkyyio0c9TQ49QU6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e7VGeweHBk5R3FRzcePUe8VIoPAGWueEjk2Dr1bWWBeEM5bC+1jL/Ti//uxjmml3e3eO+2YPaewoVOBRX9f1B0BVyOqctNsSvAnovpiIRxONFl6n2L3/VOA6OeEHj/ynr94uJ/7onVYFI3eO4K6oeqPATII9HIjlTv48XEDhdu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=G1RN9nYx; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=euyd0mwT reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="G1RN9nYx";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="euyd0mwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740738091; x=1772274091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/QhhlC9uU19V9J88cHdgykY4awBetTHBnxL1KmQ0R5Y=;
  b=G1RN9nYxLYRT5lJ4nOIRSQGz7aN9ZtZXpumnsPlg/28ulEbECeOoZI7n
   yhkHBbiQGXMwWud2Hu0WtMPPa7jER5+3H+irEQVzssS+lgYaZh7p5OfkD
   ntB2oUCUFYb/JWg1bXH01iSLmpsdUl+evtgFwuwvglhE3NNYKEP1r4IJj
   56or3/0Wbknbpqou42HmsSMyaHML6em0DRvFIaeguVMnDQ/HCbjTxMf6B
   4imvCPDvRytF0zYh/JKaoWQuaBMRLJ8DpGtEj6t4o9G2wTPe+sWja/QVT
   vU7oDWDsApK3SDKAYyZjBCve2P53BZdnTun3procj/ofTjtCRDkFV0/2W
   w==;
X-CSE-ConnectionGUID: iRr4JPuoTGmOPgXGpB/sWw==
X-CSE-MsgGUID: /XNPAa7+SRufdkOdkliC7A==
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; 
   d="scan'208";a="42171468"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Feb 2025 11:21:28 +0100
X-CheckPoint: {67C18E28-2-2895743E-CD1E7AB7}
X-MAIL-CPID: EA36C0BEDADF546230EE4332BB39D6D7_4
X-Control-Analysis: str=0001.0A002112.67C18E28.0040,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B9E8168CC3;
	Fri, 28 Feb 2025 11:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740738083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/QhhlC9uU19V9J88cHdgykY4awBetTHBnxL1KmQ0R5Y=;
	b=euyd0mwTUQC8rghcISeYrvLp+e7Pnfs8TQ7r5JTkCNqvnyw0ANilA7BZoghCHFXpeopLTR
	momj1MWbV7jthBuGgRyi9sHlWesBOHTym4XU7zGDW8AhMsqmiwVkixCQr77vwqBYddE9Zh
	pKpz0kQ7taADcCxGzvDNuHJg3jMaX4QSuomEjGTA14ylL1UpUXTM1GvdR4iAflpUoIKM7v
	3Ig4gUAI+gPhdMKPmSfmBLhZ7AHPIDRaGEnNt55UEgLkNkEXvz1efsvQke52dxzSNKE4Rd
	k/61BxrVWSQCvVWsonKTLQtICKW/M3d2h3+ilzVX/Sa1yXYY7ecJX5rG/jeXLQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
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
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
Date: Fri, 28 Feb 2025 11:21:21 +0100
Message-ID: <4658624.cEBGB3zze1@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250227170012.124768-9-marex@denx.de>
References:
 <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de>
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

Am Donnerstag, 27. Februar 2025, 17:58:08 CET schrieb Marek Vasut:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, add support for this variant.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 1 +
>  drivers/gpu/drm/panthor/panthor_gpu.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 06fe46e320738..2504a456d45c4 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] =3D {
>  ATTRIBUTE_GROUPS(panthor);
> =20
>  static const struct of_device_id dt_match[] =3D {
> +	{ .compatible =3D "fsl,imx95-mali" },	/* G310 */
>  	{ .compatible =3D "rockchip,rk3588-mali" },
>  	{ .compatible =3D "arm,mali-valhall-csf" },
>  	{}
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/pant=
hor/panthor_gpu.c
> index 0f07ef7d9aea7..2371ab8e50627 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -67,6 +67,7 @@ struct panthor_model {
>  }
> =20
>  static const struct panthor_model gpu_models[] =3D {
> +	GPU_MODEL(g310, 0, 0),	/* NXP i.MX95 */

Are you sure about 0, 0? With this I get
> [drm] mali-unknown id 0xac74 major 0x0 minor 0x0 status 0x1

Using GPU_MODEL(g310, 10, 4) I get:
> [drm] mali-g310 id 0xac74 major 0x0 minor 0x0 status 0x1

Note the output is GPU_VER_MAJOR() but this table is for GPU_ARCH_MAJOR()
(and the corresponding minor).

Best regards,
Alexander

>  	GPU_MODEL(g610, 10, 7),
>  	{},
>  };
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


