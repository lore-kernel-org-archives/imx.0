Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DC818A6BD
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329171; cv=none; b=nkQ4U6TTVFL/xZaojaXibDiA0gAWUcmZ3WThgxpddo5flM/CjHe2AI6xtGtnx7TQS1cXicXmJpOEtF/L6fx8xibgL6mJIWGKQD4+V4f2N6VkaNQOn/ssiK9+kpjL7Tduf+z8Hs1+QDppOquewSo3lFBoz+OdDUdf28WArez1idY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329171; c=relaxed/simple;
	bh=yzxkf3qnlHjhdOFSK3fOfMSJNtuPE68kc810je5Dnfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EntOHQaRrv2Z76/idrA+/569G2GxqZWMIcTyADMKOoz6gfWVBMZp1Sp5ofZ5JcLKZn3NIpKiOL/sfduNH6EzEIgSQP4zFSSCh97BSygbZmDBvgiOB5np1pAUYssOB41hYohvKumHP7VV7h+YS8cP97hTrLIuMQbrqEJcpyiJ8k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Uo2fHpDu; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=VGzw3KZ0 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Uo2fHpDu";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VGzw3KZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736329169; x=1767865169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSpAS96v39Vsr19bddnrz+ttBG5FohS67Nj+N6Ke34Y=;
  b=Uo2fHpDum6KTakd2sZGe4zdJa9cpQYntCJiIeLg2UsCyajNiPysht5Hw
   jvp1eiSmYP/CHMpz+tvXQ9qBXC00O383NZgSLl1EISKQyVZoJsVoXiQ3X
   XcO1n1z4vTclkVONqtvakMo795ly80GDsSRGp74EBrTZLWN4/TZ8ZqgbX
   2iUXTWr33WS2zh6DsVv9L5eaPl3JmSBAJiOVJIfLVPZIH3eoWwvwjmvki
   ObJDr3ScXAloB71BGiT0uZRQdR3NbffCzk0w6Q4NWkflGQ7anQf0HeGRi
   XMz6d/t4WVkLM3FF+CIhGx2zqrkFniyZWHIenIjZIzyPZbPlef3dUshsM
   A==;
X-CSE-ConnectionGUID: 6BfWS01oQP67s0pmEt3N/A==
X-CSE-MsgGUID: SO3dbBWwSmmoacV6464GnA==
X-IronPort-AV: E=Sophos;i="6.12,297,1728943200"; 
   d="scan'208";a="40915941"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Jan 2025 10:39:27 +0100
X-CheckPoint: {677E47CF-E-3C670366-E45AD810}
X-MAIL-CPID: B179332E72A9F6A992BFFF3D3F87A11B_4
X-Control-Analysis: str=0001.0A682F21.677E47CF.005B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C69C16609D;
	Wed,  8 Jan 2025 10:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736329162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSpAS96v39Vsr19bddnrz+ttBG5FohS67Nj+N6Ke34Y=;
	b=VGzw3KZ0q4zDlplgI3hXyXggwUT7OCimKWYnjXsTfb+GrPEBTxFppC0nXDBqne7dAHTVmh
	F+BR7rKmt8OSSVReQCzlrAz2m9DEQ4S8f6/k8YnEsnRvB79umifWKzbRnJDmDE6yUHEOAk
	1DBpPzaFH+wAAZQcf/3SfR+vO/s/WSpWURJfjG8GWzHw6D9Yg1bk3HUj+IYTKGh6HHf3HK
	NjnbHJbMmrT3j5zSQ1pmLM62Ofv9cInaVD5d1SGOehHhnJJ7ez+EiNpymg4zLinIMveOVB
	zbadwSZ+Ft2XAh3B5K2UuoB2HqQWDwmcna0yEF/VA76m/bCy4sW6NScSkCR9YQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/bridge: imx-ldb-helper: Use dev_err_probe
Date: Wed, 08 Jan 2025 10:39:19 +0100
Message-ID: <3553991.QJadu78ljV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <af600eff-88ea-498b-9cbc-2c441f47d7fa@nxp.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com> <20250107143900.988567-4-alexander.stein@ew.tq-group.com> <af600eff-88ea-498b-9cbc-2c441f47d7fa@nxp.com>
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

Am Mittwoch, 8. Januar 2025, 04:37:55 CET schrieb Liu Ying:
> On 01/07/2025, Alexander Stein wrote:
> > This simplifies the code and gives additional information upon deferral.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 13 ++++---------
> >  1 file changed, 4 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/=
drm/bridge/imx/imx-ldb-helper.c
> > index 9b5bebbe357dd..2c9b862af74af 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
> > @@ -167,7 +167,7 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
> >  {
> >  	struct device *dev =3D ldb->dev;
> >  	struct ldb_channel *ldb_ch;
> > -	int ret, i;
> > +	int i;
> > =20
> >  	for (i =3D 0; i < MAX_LDB_CHAN_NUM; i++) {
> >  		ldb_ch =3D ldb->channel[i];
> > @@ -177,14 +177,9 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
> > =20
> >  		ldb_ch->next_bridge =3D devm_drm_of_get_bridge(dev, ldb_ch->np,
> >  							     1, 0);
> > -		if (IS_ERR(ldb_ch->next_bridge)) {
> > -			ret =3D PTR_ERR(ldb_ch->next_bridge);
> > -			if (ret !=3D -EPROBE_DEFER)
> > -				DRM_DEV_ERROR(dev,
> > -					      "failed to get next bridge: %d\n",
> > -					      ret);
> > -			return ret;
> > -		}
> > +		if (IS_ERR(ldb_ch->next_bridge))
> > +			return dev_err_probe(dev, PTR_ERR(ldb_ch->next_bridge),
> > +					     "failed to find next bridge\n");
>=20
> Nit: s/find/get/, since "get" was used.

Thanks, you are right here. Adjusted.

> >  	}
> > =20
> >  	return 0;
>=20
> ldb_init_helper() may return -EPROBE_DEFER too, so it needs to be changed.

Thanks for spotting. Added dev_err_probe there as well.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


