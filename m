Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A322EB845
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 21:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769463782; cv=none; b=a8EekOhgP/dwu5g7oF2pNOW+a5HFIMbZXcz1npFdS2JywnEkgHn0Eu726hPS6nWctlPWKkBIM2SirnVGjE1Gyeqaz3+ZNwlnoCsGL3l+aFJVW45gh8IGjCWBbp9To2Q5IDujhE/yLPjY3cTiYDaN17ZWzRa0gn2B4Ja9nVHTAFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769463782; c=relaxed/simple;
	bh=73pen9fR2exJkPM1YunKBvSq0N/4cqJ71LCdSCgplPM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=BrZE7Vo2gh/KHu/wT3wm0xNcXb0hgzP2L8y3McV4u1KAEkPRwWKCVsYe4rU+oVHEa6gROr9OBxTgYQjkROMeRFcIoFT67btDnnhfKPvwjLwUgDflTybRztym7d3j+qTICpXdSQVLvfDiiVmo1+T39yDSQC2aKsLqOyGB0lP1buQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rfT865Bl; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rfT865Bl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A00824E422B8;
	Mon, 26 Jan 2026 21:42:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 541A360717;
	Mon, 26 Jan 2026 21:42:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A18C6119A8652;
	Mon, 26 Jan 2026 22:42:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769463776; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+nALW3HhfFj/202n/g5QYkUrMwqhISiB3IrtYEa8euk=;
	b=rfT865BlG/dFY9zv4vg4gdieRFYvfP9x8eyl+e0aQqahaf8e+eZ92HIy5aUPHPA3r62NMb
	au66FcmmQ4dfPcSZ6m+jJYlAP22WC8R0bsionAbLUtg9SNB0NRAMNgcLlQSTZ3z/Fn6dLg
	rZ06H4rpReh7S+VwY7vw5rNqS6lzCwptsbC3+Cv9HH8niGer0AnV5Nct1hN+MlWi8TD+G7
	h6gB172QNxFtaZ/2DWRW21xWFzFbApppMN979MOP/zV+HWVsYM2bLtG51LIghNaBdS6xyb
	F9SQK+vd8m5T1nG/qXjDKXgI4jFawT2crvumJAJ+KmnMGVTIrV2xQ66+6HTNuw==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 22:42:48 +0100
Message-Id: <DFYUK1CQ2458.1LX5K13CHSVRC@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
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
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com> <516e24d3-511f-4fb5-9274-a20639618d4e@nxp.com>
In-Reply-To: <516e24d3-511f-4fb5-9274-a20639618d4e@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Jan 26, 2026 at 9:14 AM CET, Liu Ying wrote:
>
>
> On Wed, Jan 07, 2026 at 10:56:29AM +0100, Luca Ceresoli wrote:
>
> [...]
>
>>  * the bridge returned of_drm_get_bridge() is stored in the local tempor=
ary
>
> There is no of_drm_get_bridge() defined, so
> s/of_drm_get_bridge/of_drm_find_and_get_bridge/ ?

Ah, well spotted, fixing that.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
