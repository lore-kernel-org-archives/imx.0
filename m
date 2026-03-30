Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8179239FCCF
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 22:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910831; cv=none; b=VLzu8/LYwnEMIEyKgjmn5r/Fnz90JIU98Qqt4ShU/7s05V1Hlrn92Pby+ZzaCczryd+5RSuu20hyXTD6hXCxEE3cTZVqK4vPKvv7lCFatvKcgz3ddLTCX5BppxwnQv9YQo+Bg2XqMO7/TIRS0XEJ2xzEknJnn/Y6Bs+Rlk27uZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910831; c=relaxed/simple;
	bh=p94/jOJ3SjCMoD5oxDZFByJj4VXqWa4cLYbwlpuKP8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VtQhbuCybKm4V5+yHrLVI1j8IwyBFTrQbg2DmTldE0++7POIa2HCCTZhfzthw1bmq6DMkWzSq/KKO1wE9fdbP/u1dZCG4TJV3I5uR/wwtgbYeiB1Pl5a6jCWsO54jv95fEjMz7X6Ckzg/6FCnJmk4IjDHz7zNvI8T/zCfbzfV1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 6F2001F8004A
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 22:47:06 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id D1741B2EBCA; Mon, 30 Mar 2026 22:47:05 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id F354FB2EBBF;
	Mon, 30 Mar 2026 22:46:29 +0000 (UTC)
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
Subject: [PATCH 0/3] drm: lcdif: FIFO underrun/solid color bug fix
Date: Tue, 31 Mar 2026 00:46:16 +0200
Message-ID: <20260330224619.2620782-1-paulk@sys-base.io>
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

Paul Kocialkowski (3):
  drm: lcdif: Set undocumented bit to clear FIFO at vsync
  drm: lcdif: Use dedicated set/clr registers for polarity/edge
  drm: lcdif: Wait for vblank before disabling DMA

 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 42 ++++++++++++++++++++++++------
 drivers/gpu/drm/mxsfb/lcdif_regs.h |  1 +
 2 files changed, 35 insertions(+), 8 deletions(-)

-- 
2.53.0

