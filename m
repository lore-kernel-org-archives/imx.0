Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD607383C66
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991285; cv=none; b=f1nBHCNf34HlR2qxLHW5B783VtaXH5j2PyEcDb2qHvsrQxLfS4bG2Ph/zcatNaameiKtV+FHIYWvxq5Mi9h8GWRR2rZORSXVhIGoIVKHFFkJP2x0Cs/Slgz4n08diUWAIpLAgrvOXiqRS65MUhPu6LiFFKuND2bSc0kATZV13jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991285; c=relaxed/simple;
	bh=zF4YvrG+EB8JDL3R6ViMoPNp6HVm/PdHGw9XeWtWNP0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ewum8zLt+yHba1nPHnv4QV8Lnh4O4mWmHmEviv0dfMs88ETmKeODmiWO//UKgl4stGvmLIMl+ZFXrN/j2eY3bmeMsTadUWezUldgi2E9iolEx0BpmJi0Gc8HLvWGMoQt6bxNVXAVrgVDF1X5R5A7GQQNkFXtaQh0iPf/cvA3Xik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xXMrahGT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xXMrahGT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3739B1A37F3;
	Tue,  9 Jun 2026 07:48:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04C3D5FFC1;
	Tue,  9 Jun 2026 07:48:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E3FA106A2A94;
	Tue,  9 Jun 2026 09:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780991280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zF4YvrG+EB8JDL3R6ViMoPNp6HVm/PdHGw9XeWtWNP0=;
	b=xXMrahGTUeXtXkGJ1zr5F+G2D852jhc0/A03F6lBVcfVrqhzqKmoQEv40R2zqW46cZb6d6
	hjDKHl0Ur5/kPTFE/PJ/7TEAjbBgzB6uQhLLJIkJYFDjjTSoEOx9QwzRYfA118qcc/odXr
	Hz/1d4uUwhmoOmPoq/n2fCNgxMgvxOg4lZKcSBkP3v6OqjqmkI66vOm0TiK0yPR/5+ohAD
	2Cf5wZnQShXjtrfW5ZZQIXYEN2Wj3ewmIrG+S4x/muNFYbtWCjIstkGSpo+yflrDbrMyEs
	KBFw/VyPOjX/cHVPSscxfEfQ2IftJzHJEmcwawDGO+k0XjHEt/hZ44sXn9MRdA==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 09:47:51 +0200
Message-Id: <DJ4CPR3MZ41U.2HKE3R0WUGSOY@bootlin.com>
Subject: Re: [PATCH 00/37] drm bridge hotplug
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Stefan Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <DIXTUCXAU68V.1T7X89LMEUF2F@bootlin.com>
In-Reply-To: <DIXTUCXAU68V.1T7X89LMEUF2F@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Mon Jun 1, 2026 at 5:44 PM CEST, Luca Ceresoli wrote:
> Hello,
>
> I presented this series last Friday during the Display Next Hackfest
> 2026. Here's a summary of the discussion.

For the records, the presentation slides are available at
https://bootlin.com/pub/conferences/2026/display-next-hackfest/ceresoli-drm=
-bridge-hotplug.pdf

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
