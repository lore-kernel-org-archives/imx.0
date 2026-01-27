Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F1F2EE5FC
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513759; cv=none; b=l3NyX93ubqqCHh+23GUMHGqBSFXlzMKAFAhM6BSpqBKaBXBjZLztU248jxE8bw88Es/2RKGJ61eD01FrWCE7Qn0bGCx764QdoBds0mzTlg+Qu2Tt8B16pk6Lgk6YABpdZRZugV7TyJ15Od3tQnM+AW37e+Y7WKiVwTVZE/3hZAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513759; c=relaxed/simple;
	bh=QL8RoeDUA8eMlFjn8gJ+CtM1JFXzQrae1TH3QeY3SEI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UC2vZpZxVJ8eaiWpKfmrbEDhdu6xw4FHHEonZAiNFoG3Aof4LYhTkwM3sK+Ly5Ye4481WMeWb1MEnn4uMgl+p52yhnCKynMr8J9y+WOdPiOeV2HFztI1YSiTUhKnWv3Q+T19HdilOKFWerBxqG3nADBbKwyhFdVVk0lo7Bw2dx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1YGgGIVy; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1YGgGIVy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 79A10C211D0;
	Tue, 27 Jan 2026 11:35:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AE3E606F5;
	Tue, 27 Jan 2026 11:35:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7B54119A8686;
	Tue, 27 Jan 2026 12:35:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769513754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bBLN7ENPe3Q9NBmrjF+3h0cFLO9t/L5okE+X/cur5CI=;
	b=1YGgGIVycHcNeIQP0SC0IRTGBJ+nm3jJhZ3zuBT2cFmsQxZvyd3yxFSsgJXBxgDS6pbqdj
	/j4JLGOCRCFwvfGP0LYt5CdAZ9JCUEVQMr4XVfbEZ3g9iyTNalkXsQPUZDbV7fYaRN1BTo
	cy4k5FG0hcRLzE6cR7RRq5Ih1JZX1/avtOXN5JHIjEEdRdG4zolP2S8Crx5muhuwZ68zbJ
	LmjQrsbdAtPAJ3CO0229JDVuKEfUWYXsHSXKlGMKA6JIxHEoWoykM/dO6WLxnhb/lq57Ns
	2HwT9QSG43Kj/jVUvu5ezQM3XUaSL/FGApUQ9div0BX1BHyuN63gNiqlqFTFKw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
Subject: Re: (subset) [PATCH 0/3] drm/bridge: imx: A few fixes
Message-Id: <176951374753.94588.10653964166300906894.b4-ty@bootlin.com>
Date: Tue, 27 Jan 2026 12:35:47 +0100
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


On Fri, 23 Jan 2026 17:22:14 +0800, Liu Ying wrote:
> This patch series contains 3 bug fixes for i.MX8QXP DRM bridges.
> Each patch fixes a NULL pointer dereference issue and stands alone.
> 
> 

Applied, thanks!

[1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_ldb_bridge_destroy()
      commit: 852c68bf42965ee38b465d2d6f7b965eb0b5dc1d
[2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy()
      commit: db7e7ea838c916ee4cdf26bee126fd36f58295dc

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

