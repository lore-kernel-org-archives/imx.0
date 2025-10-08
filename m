Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5466A2C08BD
	for <imx@lists.linux.dev>; Wed,  8 Oct 2025 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945885; cv=none; b=k3RsF3dhwmXoOcSPmGO5tFPOh67CIxZUxneOibX902c+JkmoJvGAnA/RdYMslXALnVMCQ9BlDW5ZqVc5fszFq9ta0Z5mIx59RnV6qv5mvvEzFq3I6qNvwni+YE7Xxeze/P1z64dLDEfSs5vdhNk/JiWZPUYSME6C8eX0soNOtyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945885; c=relaxed/simple;
	bh=Ei1TQpJJM/k/5T/OWbAHNDniKCCdLMm92oIiguShVJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUJKrX/ItVoeXikwUKSujwvv5p/4gCPQ0wdGoB75alXSzXcEOjAhudamEM7d3h4dOerUObgVJXabpJ2C5xTe7EG1z7sBhinxZT5wizcm8Y9iXwBK39XMabeWAoEdonvR2EimWNo0eNTiqUIo7oJoFafY0amgym+c6hZvptCNG2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dJHG4+tv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dJHG4+tv"
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ADB5AEFE;
	Wed,  8 Oct 2025 19:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945787;
	bh=Ei1TQpJJM/k/5T/OWbAHNDniKCCdLMm92oIiguShVJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJHG4+tvNQJvBhrjQmPVPUsWIq4TeUBmgqOlalawALPQKYC+8nt5H3ril0Ou9t0Ft
	 Q5X0vzjjnssAATqFk8LxRr5A8G4y+4W8K4M9DhtmeFELXSBoMAz2JUYSCkfqDWUWRN
	 oIjAealv12ovyd38X0KTlzh/DkwLBklhRPeYCkGY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 13/25] media: nxp: imx8-isi: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:40 +0300
Message-ID: <20251008175052.19925-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_m2m_get_vq() function never returns NULL. The check may have
been intended to catch invalid format types, but that's not needed as
the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
the format type, so the type can't be incorrect. Drop the unneeded
return value check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 6822c2f7fc69..675f1d2b65d9 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -554,8 +554,6 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq))
 		return -EBUSY;
-- 
Regards,

Laurent Pinchart

