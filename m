Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D41226863
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416200; cv=none; b=tZd8n9cXQixFfQE5PhU5cDPPa9/mN6+HaTZuSrsRVL7FNjceFBFdWF3Q+5huy/KpOW4RbAi+Kl87yudM4bvPxdPY47NxttLLonSgcoOcCeHAnpN/PGh/wgTKRA5udzOYbKVFSSqJe0oX7cIkm7KwFk2CjMp+QNCglaUb8LhK8EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416200; c=relaxed/simple;
	bh=2zdxTOAo31wO0mQI7Cy1Mebp1MZ/20sxKj2sWKN90MQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=V2Xy9Mb2djzAPSGm4iEVr0sN/SgE31sXKEmgt3hems+Ho5bdqENrO/YQE2G+ECSh3504QgiSq8Q4arpOhGZgXDcnsdQyvPtCu0QhKTEeKK5S3dw+nJsD5MJWRsFcZp5w7C1QcYoyjsItbAoXnyTSt8XrvRBzLj6D+5Am898wZH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UEQQKtzQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UEQQKtzQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8EC531A2A4D;
	Mon, 26 Jan 2026 08:29:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 602AB60717;
	Mon, 26 Jan 2026 08:29:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FE10119A80E2;
	Mon, 26 Jan 2026 09:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769416196; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zd247lnTgm//7Mot/s4CRwgKu7aTLB1vlg6ipR1BxPA=;
	b=UEQQKtzQX01kRC0KKp+1QBwdn9M6lmlbMCMssM4G8Hf6XyfFJioF600O7pn9UJkYhjELzo
	PeYldsasnd9253Eei/kPGALVXExNCMJ40I5Eknal3AvJf2qN2H/IQSmIfMeQWLHqujfsdt
	wXo78MpRUy5kXspvqj+qTpqyUTlCQ0d6A8/sRzHYn/lyZb33aSV/98LRPRJj3T6Fb+CNg0
	30EnB6+7fojKyX+9tZn2DRRgfRfKMWV+v7/4cLscAlA+b0GeIVhdgtk56+/oQmXBVSFL/g
	pcXKF4M1xvyw5bdZvA+iSZ0P06cdzO8GVAaNHxMxoy4lBl+Xu32odfbM58bKlg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 09:29:49 +0100
Message-Id: <DFYDOVQ1DOQE.1NDH5JC5M90KV@bootlin.com>
Subject: Re: [PATCH 1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer
 dereference in imx8qxp_ldb_bridge_destroy()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-1-8bb85ada5866@nxp.com>
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-1-8bb85ada5866@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jan 23, 2026 at 10:22 AM CET, Liu Ying wrote:
> Pointer bridge->driver_private in imx8qxp_ldb_bridge_destroy() is NULL
> when a LDB channel is unavailable or imx8qxp_ldb_probe() returns error,
> because ldb_add_bridge_helper() is the last function called from
> imx8qxp_ldb_probe() and it doesn't initialize bridge->driver_private if
> a LDB channel is unavailable.  The NULL pointer would be set to pointer
> ldb_ch and then NULL pointer ldb_ch would be dereferenced.  Fix this
> by returning early from imx8qxp_ldb_bridge_destroy() if !ldb_ch is true.
>
> Fixes: 32529d384cea ("drm/bridge: imx8qxp-ldb: convert to of_drm_find_and=
_get_bridge()")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
