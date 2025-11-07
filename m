Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE65303C8B
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510603; cv=none; b=qQdlqAL1+BfJeflQKW8jfyRIUZe05mVcnShm9B4bI8/QipNQ6DlclGIF/AczWKmbD5tnupp8D8NTung6QGRTPIb0sf1QxBOd2TvB5D/zRANV/C9QeUaNZdBBpNTRkrMCS6NiPIbY3sAoqN/KmjnFkJl03RSnPQh84/0tUvYH4R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510603; c=relaxed/simple;
	bh=O3bvkfV5QbGsc+GXY07pTF/lPqZFj/CEJygNCquciLk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X4o5bc/gLEoe0XOiZ4J9XNHyd94jRzmBqyAWnhwhv/YV3N/VIYTAqA8AH+FjujpUvckZKIEpIMVBs4IFMRhsGovAUXnOwp0TYbPE0pQ0KB+7Mvhp42w94nbZ7vyS5p7an8JeKzRDbvyGERtz5Ex84xDWh9e/3ZttnGq62U1vCCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vHJWH-0003HZ-Jj; Fri, 07 Nov 2025 11:16:37 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 0/3] media: imx-csi: cleanup media pipeline start
Date: Fri, 07 Nov 2025 11:16:32 +0100
Message-Id: <20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAADHDWkC/x3MQQqAIBBA0avErBvQwYi6SrQQnWogTZQiiO6et
 HyL/x8onIULjM0DmS8pcsQK3TbgNhtXRvHVQIo6rVWPgb1YlHCj29nGM+GgiPxgtGVjoHYp8yL
 3/5zm9/0AuPJy4WMAAAA=
X-Change-ID: 20251107-media-imx-cleanup-9022d941ae44
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The imx media device currently assumes that there is only a single media
pipeline. However, the media graph has multiple imx capture devices.
These may be started separately on media pipelines if they don't cause
conflicts in the media graph.

Move the media pipeline from the media device to the capture devices to
properly track and handle multiple media pipelines for the imx-csi.
Refactor the code to start the media pipeline from the driver to help
the reader.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Michael Tretter (3):
      media: imx-csi: move media_pipeline to video device
      media: imx-csi: explicitly start media pipeline on pad 0
      media: imx-csi: use media_pad_is_streaming helper

 drivers/staging/media/imx/imx-media-capture.c |  8 ++++----
 drivers/staging/media/imx/imx-media-utils.c   | 12 ++++++++----
 drivers/staging/media/imx/imx-media.h         |  7 ++++---
 3 files changed, 16 insertions(+), 11 deletions(-)
---
base-commit: 1a31cb2782104969e48c7ce7e4fc06e403fcb5cf
change-id: 20251107-media-imx-cleanup-9022d941ae44

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>

