Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B116223D7CE
	for <imx@lists.linux.dev>; Wed, 13 Aug 2025 21:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120314; cv=none; b=HFLre7tlA9jBnyNyAV7kJG6JKvdFk2RS+b8QASPeAQ3PPKPahqlE7h5nHQlbrBvosrzUBNBVbAVdh5UAXrZT9roRP3BsAJOJNdrWyt5aTgjelvnCPjG8mRMJJwO9eWlooGXAnnz56hhGuIH/Gn2HacX7iK52L3lLC21N6wcn5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120314; c=relaxed/simple;
	bh=CkT54CRblH1F+6eGF7vyDkkegZAjjR2e/2MQz6Cq0XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QROKmXW8/GHsLZ/j4fexPmXMPELq1ayYIdyS7tMNr6H20TzhmkJQ0JoiITaLUpgJhs7gVNxqPVFRNKRVs4JI9yVrcMnTJzjNw/zBNkMXa841c1paLaY7HC5KBNgt2Q4g2CSfx+jhfYW8zWNo/VwqE2ocXgL1tHaB7Iz/a6wbFfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pAH/72oH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pAH/72oH"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E5A6DF89;
	Wed, 13 Aug 2025 23:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755120257;
	bh=CkT54CRblH1F+6eGF7vyDkkegZAjjR2e/2MQz6Cq0XU=;
	h=From:To:Cc:Subject:Date:From;
	b=pAH/72oHusIMzR+RktSQgmXJLEEvGdeGXw3s6oErfAhYl2RXs3YaQZTuPOHOq7BCy
	 5cNX4evSnRfim5pjlTFmvnVAvx0nc6I4nsMmLjPthRBuDBIKtE2+xuZvgkmHLbmP9O
	 daMzB9xuuCOnChiKxa+Ir7VbT/I8KoxShlx7vc3E=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Leitner <richard.leitner@linux.dev>,
	imx@lists.linux.dev
Subject: [PATCH v2 0/2] media: nxp: imx8-isi: fix streaming cleanup on release
Date: Thu, 14 Aug 2025 00:24:49 +0300
Message-ID: <20250813212451.22140-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series fixes an issue initially reported by Richard in [1],
with a proposed fix. I've recommended an alternative approach, and gave
it a try.

Patch 1/2 fixes streaming cleanup on release. Patch 2/2 then cleans up
the driver a bit by dropping an unneeded structure field.

The changes have been tested by opening and closing the video device
while streaming in another process. I have also tested suspend/resume
during streaming.

[1] https://lore.kernel.org/linux-media/20250709-imx8-isi-release-fix-v1-1-c47c659ce1a6@linux.dev/

Laurent Pinchart (1):
  media: nxp: imx8-isi: Drop mxc_isi_video.is_streaming field

Richard Leitner (1):
  media: nxp: imx8-isi: Fix streaming cleanup on release

 .../platform/nxp/imx8-isi/imx8-isi-core.h     |   3 +-
 .../platform/nxp/imx8-isi/imx8-isi-video.c    | 156 +++++++-----------
 2 files changed, 57 insertions(+), 102 deletions(-)


base-commit: 078f1a7eb48eef9b3cb78bcd2254356f3a332358
-- 
Regards,

Laurent Pinchart

