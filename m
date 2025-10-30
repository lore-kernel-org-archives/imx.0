Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C172D0C73
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761840012; cv=none; b=ABeJoq9SJ+XcffssvBQCbF3UnV5FLTzv1elcdkKl3WbNjyJl/ORbBs9V0n/JKU04F5D+Lpl8t3Zv9SwadYYaRcVxz/s8vpTbu5zNd/kJyzSsRT4QLuv0lDRqqP2pXBNFzdPWGW6K4F99/cyD6TwkpoZhZy4W96fsbbh5E0oQyxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761840012; c=relaxed/simple;
	bh=Ky4Q60KcF9tVrnVev4zZPdHy1WTFcz9x/SsAdn3+7Gs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jRQ93N36OPdhH7WcosU+Hzqi1CcUla3iC9Jyav2HlGsU/wW4v0mR0UtIwFq4cUn7j0RMIJ5eJsE7ojIxh6Fhg2lcNkynEL8kjvXh4OC3hsK+p6wLpRXc4Lm57VIdPA0rdcdZnPUjX9mRDFSc06FduuT9JPnBIjcgNOMJbiVOD/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vEV4A-0004VY-QL; Thu, 30 Oct 2025 16:59:58 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vEV49-006Egv-2T;
	Thu, 30 Oct 2025 16:59:57 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vEV49-00000000DJV-2o09;
	Thu, 30 Oct 2025 16:59:57 +0100
Message-ID: <b8b2ae426c8f79664f5b54c5ddb4511a086d3c86.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] drm/imx: parallel-display: fix
 drm/panel/panel-simple v6.17 WARNING regression
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Ernest Van Hoecke	
 <ernestvanhoecke@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo	 <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 30 Oct 2025 16:59:57 +0100
In-Reply-To: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
References: 
	<20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Di, 2025-10-14 at 13:30 +0200, Luca Ceresoli wrote:
> This series fixes the WARNING regressions reported by Ernest [0] and due =
to
> the missing conversion of the DRM_IMX driver to the new
> devm_drm_bridge_alloc() API.
>=20
> The second patch also adds drm_bridge_add(), which is a good practice and
> proposed to become mandatory [1].
>=20
> [0] https://lore.kernel.org/all/hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r2=
23ar3txri@3ik53xw5idyh/
> [1] https://lore.kernel.org/lkml/20251003-b4-drm-bridge-alloc-add-before-=
attach-v1-0-92fb40d27704@bootlin.com/
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to drm-misc-fixes, thanks!

regards
Philipp
