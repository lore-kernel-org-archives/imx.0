Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738642E7F3A
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495675; cv=none; b=NpVSvFLJ6+Lv11sr6R57EQeMvyHBSjQoqgpsyr2pLWHpKEO23B1XoFK0bY3trgJPO2qE1779oMtwTmNte7D4+t02xHqYHC+AkExqpEaENiQRy+aRw8ZARqy6uG3oa4A1+y0u3hgY7/aW169eBYptRm9jb4FtSI5PLpsN+CFz/uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495675; c=relaxed/simple;
	bh=gRQHZtIOStP7wuE++LSCA+Pnj5NU5Z4UziS8Uaq9ud0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=NPqaX91xSub5ts79lzlZlhNQssv3P9gQIl8OfE8OpUjntoJT6M+zdjFXLDwnUw4dDHcyI18Y5cP47m07zWSyZkgMeEU42DsqpcxYcgT4F6MuFRA5906XM7xi8Cu6EHUwYRFo+G+x4325XpABm0dL++d+3Sl0jy4OxjsVzM93FfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bfk2onZn; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bfk2onZn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A94EFC63444;
	Wed,  3 Jun 2026 14:07:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D26B75FA0A;
	Wed,  3 Jun 2026 14:07:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C387B10888CCD;
	Wed,  3 Jun 2026 16:07:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780495670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PFvg3djomMWzre9hTQ9dk/lbkRqAxFGm6pCgYy2NVZY=;
	b=bfk2onZnMMpAmLdNd6w+nVZRM33a7lHvvQpe9Ql0TY9F10FDi/GbbTqv3CKbvhG67EzXgB
	PIWV1QMG/IS9d7NhaPN3gfhynlFUeYDfucFleKxwgtP4z9/Z9Zc3kP9GGeWTQJvNDPNp+H
	UBpgxELR+RtyE8uy+AwiJ4TCqBtxU0nMwo42TG8qdX6KyZ4Nz3IsXdAR62awNgsTULNBAR
	59nFnS87Nfq9utDnX6CRYn6moLdqyrf4UctzDdca2oI3femi0bYHteuI+cFx1uXgFFtQRY
	i6huydhKE0yhH6ZSMK7mrwO7DXbkogzLdE4KO064ew7agke55HNXE6DFsgBb7w==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 13/76] drm/bridge: imx8qm-ldb: Switch to
 atomic_create_state
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
 dri-devel@lists.freedesktop.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-13-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
 <20260530-drm-no-more-bridge-reset-v1-13-875d828d31bc@kernel.org>
Date: Wed, 03 Jun 2026 16:07:19 +0200
Message-Id: <178049563999.8577.16988709263683474525.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 30 May 2026 15:59:18 +0200, Maxime Ripard <mripard@kernel.org> wrote:
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
> 
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
> 
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

