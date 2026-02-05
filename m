Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769E3612E4
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282940; cv=none; b=CLMHV6wtsWemR/FI6VdeoWW5PpVuxkvrxoTkonTCFe5oZONNpXLbc7sEUSfdo65oxqpCzZ+sh8kaVOLeLxLCbga9ND2GSElKCTAQqk31h21OTTr3LBcZyqx3Nt8fd1qXjqO4vmdPGmu36MGs5A3tr1lJCTcuCfMhtFq1NMMffVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282940; c=relaxed/simple;
	bh=IhnniDnleOJRYD4v165EXk4k3ynNf9KHvznFDNU0nvA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qQz3RQPb+HtM+bTsky6NZ8Eikk+nObY8OfY+AwDPnua65InER89A6OYmmsq2HJd7DJcOH4w3mdlFkMK48ftOQmaw/2PzKRhj0NJTg2TVZCaebJOJPqL61uZlxG9zF7xNpRv0wAVFWZ4NLCIA3qtHtREeWy7+CaPNQc4X3omjynM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qyMfgDWd; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qyMfgDWd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 18C254E4240D;
	Thu,  5 Feb 2026 09:15:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D84C2606FD;
	Thu,  5 Feb 2026 09:15:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FC30119A88F8;
	Thu,  5 Feb 2026 10:15:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770282937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IhnniDnleOJRYD4v165EXk4k3ynNf9KHvznFDNU0nvA=;
	b=qyMfgDWdUTQb39ZA2e1rwvq040Mn39QlnEq8ButdLERRRFFrDldcetAZz+hJupSCvCKMSs
	3og3PxJEbJRAyHmGx4MLBlkufiTOxvW2QYvBFnt8UO0i8jCimxuR2GjbKG2D7YwV+5okuQ
	rMW9UwhQF5csUeyDCNqbcTiOIuqNnaFNRPKj3zf0QYteZ5rfgKHxAiiyy+ut2KXZIs7bZU
	5C19+DI9/j2CckJoiR48hRSQoqChpmlXeiChe6pVVD5StioCCW8iqm9MV/pYha+/sYkroQ
	kt3lCj+TGNCKjsuZt36p5XGAlFgknB1bKdmWdZnLorC3NiHf+6vvyyVFUdUvxw==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 10:15:31 +0100
Message-Id: <DG6WXBLE7CZ0.27X527V71HZ7N@bootlin.com>
Subject: Re: [PATCH] drm/imx: parallel-display: check return value of
 devm_drm_bridge_add() in imx_pd_probe()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Chen Ni" <nichen@iscas.ac.cn>, <p.zabel@pengutronix.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <louis.chauvet@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260204090629.2209542-1-nichen@iscas.ac.cn>
In-Reply-To: <20260204090629.2209542-1-nichen@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Feb 4, 2026 at 10:06 AM CET, Chen Ni wrote:
> Return the value of devm_drm_bridge_add() in order to propagate the
> error properly, if it fails due to resource allocation failure or bridge
> registration failure.
>
> This ensures that the probe function fails safely rather than proceeding
> with a potentially incomplete bridge setup.
>
> Fixes: bf7e97910b9f ("drm/imx: parallel-display: add the bridge before at=
taching it")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
