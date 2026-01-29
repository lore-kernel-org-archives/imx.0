Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FD93559C9
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 18:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769709894; cv=none; b=lo1Il7nDT3hljQyTqvBzLSjk+nienSSnWAc+RiESg7A7sqlTiccOb+5II2EO3sFA1W+6IG2Bzfap14GiKfzb24FWQq3nMoXStRy/m+aXnAVCP3QUXtBPynKl2KbU1jgq+o53dgbl3bgMxLbd31uO2e2/1A9TDlkhtj9ct1JQFCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769709894; c=relaxed/simple;
	bh=Vbc4fF6hlBNkitlSC+EHuWt4P6fTGQhZwP23bbc3UjY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i37q1z1PCSRiL+vcQKDBTq05RVJyGr7VJ/TQ8MonwOTteLJH1Eu0TFpEDA/kXsBPNa5+qb4eNJn7AtHcYPHIiGOXGe7Rwf0dTzKGwH4KAoshMXcjf8tp8X8aBfzHVFWydcoHeWk6/D7KFFRigt7/rFSRpr4zUf2rWl9Ijsu8Fo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OjdMXNxD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OjdMXNxD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C1DDD4E42326;
	Thu, 29 Jan 2026 18:04:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F79160746;
	Thu, 29 Jan 2026 18:04:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A92E9119A884E;
	Thu, 29 Jan 2026 19:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769709888; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YdyCIL4tTO3l5a0xb6nABmf6t3g2idn2qNISzBqXvJg=;
	b=OjdMXNxDEjl077eYMhx024SVe6ch2lgEMk0wnPOhlyyfFyQKkGVtNZiKVgwbMOSVLXz+fY
	RUslP7W0xxAQ1kkDfhb1hjzQZpYkLQDy5mJdX3YVxVaYX+GHCbgOBehBJ77ZLN30K0SAYx
	/1Vw2avqaY8Iz5i4Oo7z1LFUnRD6cR2Nt8/cDoPGnLzu3qJOryR6664kFV6LDxYpqtf1Ex
	Owur6zTJuZTm62MyG2LA6PnLwcrYn+s4uz5aAFE4k/S0cfXqLbLpcKFk5IAlKSCGZK/Dug
	Akv6UOHnk5hSwustUsUHvriB1yt8HATSnRSMb91zXNbkd7+/YUhcBuD/0G/TXQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
Subject: Re: (subset) [PATCH v4 0/4] drm/bridge: add
 of_drm_find_and_get_bridge() and a managed *next_bridge, deprecate
 of_drm_find_bridge()
Message-Id: <176970988019.344266.16426730696131836269.b4-ty@bootlin.com>
Date: Thu, 29 Jan 2026 19:04:40 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3


On Wed, 07 Jan 2026 10:56:25 +0100, Luca Ceresoli wrote:
> This v4 contains the leftovers of the v3 series that deprecated
> of_drm_find_bridge(), added a replacement which handles bridge refcounting,
> and converted some of the direct users. All patches have been applied
> except the imx8qxp-pixel-link ones, which still need a review for the first
> patch.
> 
> @Liu, patch 1 is waiting for a review and it's non-trivial, it would be
> nice if you could have a look at that one at least.
> 
> [...]

Applied, thanks!

[1/4] drm/bridge: imx8qxp-pixel-link: simplify logic to find next bridge
      commit: 96476ab8690290aa27084b12a481e48f3af7afb2
[2/4] drm/bridge: imx8qxp-pixel-link: simplify freeing of the remote device_node
      commit: 42bb487369e56f8f07c82ac11fe771ba2b70cd68
[3/4] drm/bridge: imx8qxp-pixel-link: imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
      commit: 4eda1d5fe99db2a71da0156387b7b69e8e0dc32f

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

