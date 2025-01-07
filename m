Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793BB1F190D
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736260763; cv=none; b=qjO6pdxkLAwshOa/9EXzhbgStoaFdn4Crp6oAXX4obVj1R+oRHxroXpTIFSajirATpfe4T1CVBaqgJMNU1Fkls8iC/L8UaWsQ8iaDF1aC4il5oPe2c+6gjiAOFyMq66R5TNU53h0XcSysGHrUnwwar1d+umlt3WnzBmaJnY22uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736260763; c=relaxed/simple;
	bh=RzXJqG/FmF5zsK0WCzX91dul2JVytj0UnvkL/ZMKLis=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mEMcRrF6ZoogFKEwWCP9b7m2l05P7tKNQJ4dapaVAM0VHpzRBoqdkKEw4Yu7qRIVf2AFmAtgv7oRwk7eCqamEkVeAAQX5pxgBquxoVu0TsYB5DsxMhDjfGJvSg+m/3Y3D/KKEIvpvm68lribEFnkx5zjCWAksHWaNxNpII+ZbCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=c1FNrdPg; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=laJXCPIj reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="c1FNrdPg";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="laJXCPIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736260758; x=1767796758;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eYGgzKe2dBjNP8LEUStETSrsELJHNVnalENpqOKVwUs=;
  b=c1FNrdPglHKHZIo5QQZ8VCYnYFd33hNXVTSa8QHXNTU4B+8CHZVUqnlu
   D/mQmsjwkx9ZGPPsyilUKp+sRWFmtC3Bwpp4b0uKRri6bjFwfqo3rE2Re
   U/jf2zyF/2LMhYZMkCk6kq8Hs+vjWepctveHsreF3+bwg8LAc3XlKUofN
   TRI3fl1yOz+2GF371cx5TZfpNsx1S1pOikx/Xz3qXKljWIvBLaRqZKOXw
   kYiDMhSAmp3k1iOoTWzAkmwaWCncdZnwuT8N7Xk/JPykM2MEviaIzSR3S
   6IotvbMzR7wiFyJJE+fn6EV2GAOuDUoBDEDbJ5d8M2Hekf8z213/8FiQN
   A==;
X-CSE-ConnectionGUID: 3ptBPW95Q/mfJCiipqbFMA==
X-CSE-MsgGUID: vI8y4gO8SLmUXMhsEOy5iA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40897241"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:39:16 +0100
X-CheckPoint: {677D3C94-A-C6D8D88D-F91F9E6B}
X-MAIL-CPID: B2782B6C606DFAF40351BE195C9BC1F1_2
X-Control-Analysis: str=0001.0A682F27.677D3C94.007C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6F3A160B22;
	Tue,  7 Jan 2025 15:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736260751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eYGgzKe2dBjNP8LEUStETSrsELJHNVnalENpqOKVwUs=;
	b=laJXCPIj9QxHVqI0UmrLNmVPIYs5az6MNhTYmY7YW9Yl8UqrX9pKrsM9SIjuWPS2GxXCr6
	y9xospczOxhNvk+az9w7ePQff67Ggd0ARo1fzgTRHpjk0GwQ7vpjXBlBxcZ0AdeyDapJxN
	VDjHhvH2Uka/ce0VOswI4Kf7OOzX3Z6ARHi5bRLJ9mv5DL+TtdD8J80biBGM4WeedAf3yR
	2tokzIerTpmc6+zs1RFZWJOPIu44l7OYZwY9ADLEjdo/8RMBoOg0xHsLK4FpiBxmPdeIQU
	Vw4iFlH5Q0c5M2Yvi6GcQm7tv9cOzumLy5/2K+KKU7SdppHMj6VnskR9rut3iw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] dev_err_probe usage for imx8qxp DPU pipeline
Date: Tue,  7 Jan 2025 15:38:56 +0100
Message-Id: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi everyone,

this is a v2 of an old series still in my queue.

Changes in v2:
* Rebase to next-20250107
* Remove 'imx' prefix for commit subject in patch 2 & 3

Best regards,
Alexander

Alexander Stein (4):
  drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
  drm/bridge: imx8qxp-ldb: Use dev_err_probe
  drm/bridge: imx-ldb-helper: Use dev_err_probe
  drm/bridge: imx8qxp-pixel-link: Use dev_err_probe

 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c   | 13 ++-----
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c      | 37 ++++++-------------
 .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 19 +++-------
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  | 26 ++++---------
 4 files changed, 29 insertions(+), 66 deletions(-)

-- 
2.34.1

