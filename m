Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26943DEAFF
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 18:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154871; cv=none; b=Pj/C9XbCaXeA9kNMFxE+PX901/e7MfvgJPA6WaEOV+0N5n6jnCJLPoLeBZyUFM9vH9FA5Uw551d3qx0XYiNWxgzq8a8O5wxGn/+RbXarNlIPT7AM7XU8M2hOmuI/eGCIbH4kKCx7k38rQ3UMYc6IlwILRJ2ZDWHmfW9u8R/w5jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154871; c=relaxed/simple;
	bh=ydSZkaQ8Uxu9GeZQ4CRfuJ7uVlE0OBZivEdCNJgK+P4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XaZHxEqlcXc4dV56S69+RBxAzf4NEPLBsVG4YLmhwslQL7O0CwOkUFUArzwR/f7nN2ZiWt+A7mgzbQ6mjCkkFULCcBmDpJ+KKKiQuX/HU69s1vskGRXQq9CAn9KmQg1oI4SXMafhtGoOBvnx6iGP8yGdxNuBF38XagnHckORNdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 280231F8004F
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 18:34:28 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 9F669B4012A; Thu,  2 Apr 2026 18:34:26 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id F21FDB40126;
	Thu,  2 Apr 2026 18:33:51 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2 0/2] drm: lcdif: FIFO underrun/solid color bug fix
Date: Thu,  2 Apr 2026 20:33:49 +0200
Message-ID: <20260402183351.3281123-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series brings a fix for the FIFO underrun/solid color bug (in the
last commit) and two other changes that may help with reliability.

Paul Kocialkowski (2):
  drm: lcdif: Set undocumented bit to clear FIFO at vsync
  drm: lcdif: Wait for vblank before disabling DMA

 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 18 ++++++++++++++----
 drivers/gpu/drm/mxsfb/lcdif_regs.h |  1 +
 2 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.53.0

