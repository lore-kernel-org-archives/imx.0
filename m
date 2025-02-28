Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F52580F8
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740736728; cv=none; b=AegzIQxOAyP4HDjz0MJnyPx3E1vmGaLQNMHMVYE3ga+KYOCf/tiImxGsOjLLs67g6uYzEHwkYCVo8+1B3KI6AnTwrcCi9XaMai7U5iW9gNqXtQ2LieW1RXz9R0E4Gj8yKYcYsJzswNmtIFKLZhIUBPCOdwBbAPaYFbhUNpZlF5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740736728; c=relaxed/simple;
	bh=+jxUbzZoR6vAP1oK+T880gbl0YheCVLNlrtzvpu1mMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pbaCkgMnjE+NEh79Ch/2Q2SXrHAqxpKByUsVURkSuhgAfGN4YmkDWRdPDXtpz0Ka/aI+lSwKWC7uYUmtGtDlV1hrmS7vU/gXhNl+e/121nJhZn6A3DrB8lhbjLafE7HfWqTG+IlyjJ5lXlm1fVt8Gbe0FxYjuV5kN7Rf3qx5Lhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=oCz2/SIY; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=L5ZuJXus reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="oCz2/SIY";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="L5ZuJXus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740736724; x=1772272724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R6z8SNGAWbPtFx1cjvVtRebtMxEHnuUbliJJnBLpEBQ=;
  b=oCz2/SIYR0y3vuzjv6wwXb2w3D12SY78iJrchDnJTq9KT3PtSMyWSIVd
   LIKC8cVLIb46iyrQVMY/BjXB0Z0adhxruLkmKI27tmUU+GaXEOGBB1u0v
   7KN5RpYdASBzARNqWg6k4WWdibS7O7eh16OmllXbKcZ7+VrrJRxkLQBv1
   esEKOaB8Vd1lb0aWppX4AKzzlxmdhrGO2zK7QC8btjLg5Ny0f36KZw2yb
   bSzkRwnlVk6O4V3UPBYJ0bmmt7UHznIuOPSgTkzV2r4AEIcXXVg4NSTHg
   i2n22wYtYqxr/eBoNilTOlhwwGccaayKAgplFA4ILVT3dBylMvRR3MGMp
   A==;
X-CSE-ConnectionGUID: xE6yXvstTFm0gqqdqTCQMg==
X-CSE-MsgGUID: gUwUTOczSCiyYZXoY2pg6Q==
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; 
   d="scan'208";a="42170542"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Feb 2025 10:58:41 +0100
X-CheckPoint: {67C188D0-2D-2895743E-CD1E7AB7}
X-MAIL-CPID: C994950F3C3B4C450EBA4E647F15245F_4
X-Control-Analysis: str=0001.0A00211B.67C188D2.0005,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AACD01688B1;
	Fri, 28 Feb 2025 10:58:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740736716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6z8SNGAWbPtFx1cjvVtRebtMxEHnuUbliJJnBLpEBQ=;
	b=L5ZuJXustp8emNgt0u+lkzIHHqx8ZnNQLz4D3Z97r5lDnHurm3e0ouRN9W4Trljbi8/4jb
	rwyVFcqkZSzS5BmvDvsc/5LvOdJKVyFIdVBzUWZkc4Z3rm8cDPydzbKf/o5AIER4SqTIso
	8c+bYF7qDKfvcHHqWtOP/DiA/5sbPQnknCJ57xzfqewwBe3KXhY84iAzfptY/JcNeIl6zA
	VHX+eH6j0v016n51NCkEK3Lw8G+JkvTTGGCYWZNWNaNI+ylX2KYwXzyyQrXNqRZsBKgVSF
	uljFLINGhoUbFi9bEBVFHqVzgOHRUFe8FTLOOeHZcU5mpEzFLAc49cq8WXQ0SA==
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
Subject:
 Re: [PATCH 2/9] reset: simple: Add support for Freescale i.MX95 GPU reset
Date: Fri, 28 Feb 2025 10:58:33 +0100
Message-ID: <2425297.NG923GbCHz@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250227170012.124768-3-marex@denx.de>
References:
 <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-3-marex@denx.de>
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

Am Donnerstag, 27. Februar 2025, 17:58:02 CET schrieb Marek Vasut:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Implement support for this reset register.
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
>  drivers/reset/reset-simple.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 2760678398308..1415a941fd6eb 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -133,9 +133,17 @@ static const struct reset_simple_devdata reset_simpl=
e_active_low =3D {
>  	.status_active_low =3D true,
>  };
> =20
> +static const struct reset_simple_devdata reset_simple_fsl_imx95_gpu_blk_=
ctrl =3D {
> +	.reg_offset =3D 0x8,

Shouldn't you add ".nr_resets =3D 1"? Otherwise this will have 8 resets
(resource_size(res) * BITS_PER_BYTE).

On a side note: RM says this is a write-once register. Do we consider writi=
ng
this register again?
BTW: Would it be possible to disable it completely (until reset) by writing=
 1?

Best regards
Alexander

> +	.active_low =3D true,
> +	.status_active_low =3D true,
> +};
> +
>  static const struct of_device_id reset_simple_dt_ids[] =3D {
>  	{ .compatible =3D "altr,stratix10-rst-mgr",
>  		.data =3D &reset_simple_socfpga },
> +	{ .compatible =3D "fsl,imx95-gpu-blk-ctrl",
> +		.data =3D &reset_simple_fsl_imx95_gpu_blk_ctrl },
>  	{ .compatible =3D "st,stm32-rcc", },
>  	{ .compatible =3D "allwinner,sun6i-a31-clock-reset",
>  		.data =3D &reset_simple_active_low },
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


