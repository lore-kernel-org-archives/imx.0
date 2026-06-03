Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE90229D270
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495673; cv=none; b=P3WkUr9bdTwT0txtmwbNQurOyS2JSvE+mUg/d6PV/zJt2Fq3+PSEC2KHklmqPwYa0ZhPxRF9xot/qjZgdTOzmHyvBG+iO146yVa/1vsFmc7y1x0yuCWQonoBvgZ9dZc3igVWHj/VezUa7vRI6u+OFcTi/pNyA7+ZfDVdDHjfyjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495673; c=relaxed/simple;
	bh=51I3O/XsWuZHmT6cMDKe+v+IeralsNmQZRBVeQWwY3Q=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hXNGoVE9m0dvzg+vJNoz5VEUEeIX94TWYc6Wvh9MbVeWCGIJygpgAZQdxYBdP8+lwJDmP6AmrYvBXw7Zqj3pYXNTA+QdV5pHFBg9otfjivPDpvW0x0DrINs8EYyPHANkXRFt5B0s2qvd1LPrPfVgedQtmw/0fGDgy9hjh4Q+w3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mXe2m+k4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mXe2m+k4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BBF574E40113;
	Wed,  3 Jun 2026 14:07:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EF3B5FA0A;
	Wed,  3 Jun 2026 14:07:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0009110888CCF;
	Wed,  3 Jun 2026 16:07:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780495667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cSCYjHnuHKgR8zSICDARAiMJImdIYE/yFq1+v1b+7mM=;
	b=mXe2m+k4LjQny3jo+eqNktp+qUnsgG7kCo3aBxKBDzPji/ZoTiv2AQx4UoqPfPxjGX/9PY
	SSlGzzrQfgH9LLGEYJe0MBtuEakx44mheSvJWRnxCRdklMB9vJ3MmB/sQs3drCrJxtd1cb
	kYseiVr7rsm7Q87Gs0K9mcNOE8/JcnoS3oNID71zNYOHB4yFvCZS7imkyCrcJ8RqTaUuwX
	1h6w2ui46eK7WpzYpqnLD+8nV+phScvr05kcxTE11ncW9ndCVqz7AXKBZ1eeyuYgLnlB6N
	deyyrQ8Jnu+I94TccxYeD60/EYyeJJn0kZxiMYOrNJ2IQ5M475GA4OztwsQA1g==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 12/76] drm/bridge: imx8mp-hdmi-pvi: Switch to
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
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-12-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
 <20260530-drm-no-more-bridge-reset-v1-12-875d828d31bc@kernel.org>
Date: Wed, 03 Jun 2026 16:07:19 +0200
Message-Id: <178049563997.8577.8799013752650694198.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 30 May 2026 15:59:17 +0200, Maxime Ripard <mripard@kernel.org> wrote:
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

