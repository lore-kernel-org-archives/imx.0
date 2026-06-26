Received: from outbound.ci.icloud.com (ci-2003a-snip4-11.eps.apple.com [57.103.91.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E4E2771B
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 00:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782432540; cv=none; b=LulW5tWVYWna53ushy76ekk2x5mIyPTnGbAdwHp0QFxGWC0Iyp2WIazSwtp7aqYEyMhGNIMinCEee43sITDY7ZW65o+ELKwWNVStjc96yMZChAqOcBoTgRs8LvFe2+7z5K7cE7f0FNVv4JkTPkkXzQA4TwIfQUkD4XGA0M9hqUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782432540; c=relaxed/simple;
	bh=9vVl/jIBUNxUVlMfSPMhFeVNHE8C1soyxuND0Ev4jgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyZ/2ipGRYBZA5uXIj945NDhO0wCPqJfQQ4LS9DJLe5XpZE+fTM4YBmeMss4TjhoGSLH92AbbWu+KVXAr6P9zHJxYY3+oF6JNlHcogYCRN6dtrknngutzxzKBlG4Iskyc7HcOCUryEaO3dXum0VgMmh7edk/cew5jCXB4I6LXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=A+Qmsujq; arc=none smtp.client-ip=57.103.91.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="A+Qmsujq"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPS id D41541800284;
	Fri, 26 Jun 2026 00:08:54 +0000 (UTC)
X-ICL-RepId: 019f0142-10e8-74ad-a658-05469e604257
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWA0cZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwddAEYJSANaBl4cQQhJAlUHWB9CFA5aA1QOXAQXG18CQh9bFUs4Wg5bBEcUFxtcAAlLRglJHQ4EVAddBV0=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1782432538; x=1785024538; bh=nZ7wgtXyvk/3FeFYVtkDe9ED7DEv3WBSl1ucjzdxUyY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=A+QmsujqOS4jOUxaNydR3ytr/pC7Irog7UXG0XvYfLEZYvT7haKlmiAQpuTt731eoCdN5Xe2G8eUrZD1LkRlqVuskrGLrBKVgHYInLLgmr03ynor5QERotET11Lq2+uO6YIe+Le9cfpf+kPfoenJIdUHwWyPnIn3Pe8yWpxc2bjwEx591y8uPlPyGi2wbHJIdDpDQ5LAX/yRXDCn3uqap0+eu0bNE2BuAHYVfZkCm+78cho3VKt6yM0KFX9lHxDm+sQKpT878x1/JwD6rwBWIr/cFkijHDRWqOnRW7YvHtDBJL7PgCCEu/deIvkdaqVJzUZ7DpYN57cODnO5FDdQPw==
Received: from bigre.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPSA id 45965180017C;
	Fri, 26 Jun 2026 00:08:53 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	kernel@puri.sm,
	Vincent Cloutier <vincent@cloutier.co>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	imx@lists.linux.dev
Subject: [PATCH RFC 1/4] media: imx8mq-mipi-csi2: Make reset release SoC-specific
Date: Thu, 25 Jun 2026 20:06:57 -0400
Message-ID: <20260626000715.1111803-2-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
References: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDIwOSBTYWx0ZWRfXzl2hTTyf+UFU
 OufgbIX8ySBfbVloFrhMkgVmNYuVoNY7R+T8/0taSiKkviavsuFD07nBqIXUyJunGfwEXqhO3Bb
 iBW94lsTc+GZInNgDnTE5By1CT8cJehpcqWb0vjUtMjKVvbsK3B0P09SYOeKWgCqSubrXSbBfHC
 ZVsH+9iXR9G5aok0bwP2fMy9FiCzCoBM94YRRpJTEhqmpaeSZtITcESOsyT1AsjvCtfK9i1qnNd
 YDyiol9JzZkIVkqpjK3dhP52ntBiNDywTwFUrp+WKxPqReMSGk9Irxz0Sw9t0y8Cd1wK2GSNunN
 zprrJc4Dp//grnW0RB8
X-Proofpoint-ORIG-GUID: rMND97hAp3EnijlxfVwQdwYJpHhh4OWz
X-Proofpoint-GUID: rMND97hAp3EnijlxfVwQdwYJpHhh4OWz

From: Vincent Cloutier <vincent@cloutier.co>

The CSI-2 software reset helper currently asserts the reset control and
then releases it again unconditionally.

That release step is required by the i.MX8QXP path, but it changes the
reset sequence used by i.MX8MQ. On Librem 5r4, which is i.MX8MQ-based,
the unconditional release step prevents the camera pipeline from producing
frames after reset; captures time out waiting for EOF from the CSI bridge.

This series enables the Librem 5 rear camera on the second i.MX8MQ CSI-2
receiver. Keep the i.MX8MQ path on the known-working assert-only software
reset sequence while preserving the explicit release step for i.MX8QXP.

Make reset release opt-in through platform data.

Tested on Librem 5r4 with the existing HI846 front camera and the S5K3L6
rear camera added by this series.

Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
Assisted-by: OpenCode:gpt-5.5
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 950793297496..xxxxxxxxxxxx 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -76,6 +76,7 @@ struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
 	bool use_reg_csr;
+	bool needs_reset_deassert;
 };
 
 /*
@@ -244,6 +245,7 @@ static const struct imx8mq_plat_data imx8qxp_data = {
 	.enable = imx8qxp_gpr_enable,
 	.disable = imx8qxp_gpr_disable,
 	.use_reg_csr = true,
+	.needs_reset_deassert = true,
 };
 
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
@@ -363,8 +365,12 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 		return ret;
 	}
 
-	/* Explicitly release reset to make sure reset bits are cleared. */
-	return reset_control_deassert(state->rst);
+	/*
+	 * Some SoC integrations require an explicit release after reset
+	 * assertion. Keep this SoC-specific so i.MX8MQ retains its
+	 * known-working assert-only sequence.
+	 */
+	if (!state->pdata->needs_reset_deassert)
+		return 0;
+
+	return reset_control_deassert(state->rst);
 }
 
 static void imx8mq_mipi_csi_set_params(struct csi_state *state)
-- 
2.53.0
