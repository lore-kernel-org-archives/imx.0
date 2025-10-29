Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1213F354712
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 18:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761761044; cv=none; b=eyNfIjiQFtvuMrpCOg5AiW+0MJE7YoG+1WTdS3GpgPYHcmHene0I2cwxNSG6Oa2YiewAPxwXLU4ElvviQ+N8752t1MEOcO+jTV4oZSqgEy61YEFbTaUFxVB9DJ1pCtc9lIigET5L7OlNT/0Uta/CkjmIyBKrPN63DmluRa9aSH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761761044; c=relaxed/simple;
	bh=eY/oR6gIBneCiyv1U57xLJ4h9FoVnMvAOPH0It6RWj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDAMoDPEDX69NWONPI35FDAvjFVXgNPJG9KFvTEfjEr0yEjOWymwOyOxV3KerQPvVAJffYmC/X3O0+v4L0bhpEnR8Q18fZikyO4EHcc6f9L9W8ql88JuP0fHQHy6Kq49ZFfmFtsXcMSMjUlE3to9TwXffN19TpubArRBNQHJLkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l4XNVpdg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l4XNVpdg"
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E28794EE1;
	Wed, 29 Oct 2025 19:02:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761760922;
	bh=eY/oR6gIBneCiyv1U57xLJ4h9FoVnMvAOPH0It6RWj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l4XNVpdgcKPaIF7GwHLThY9iMTK5s4n9KB6+6dGhPmHrvNmzZFyA6zNy1U8lfFjyc
	 m76vHEJqWHAZCMSuid3In3EoHG9551FwW9TLAUXQidm+5L6WuZ4RvTEyi0V1FXZdOM
	 z5IGxTTO22ARunLtV4WqwGeO6uYXkhRIWMbM+uI0=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v6 4/4] media: imx-mipi-csis: Support active data lanes differing from maximum
Date: Wed, 29 Oct 2025 18:03:21 +0000
Message-ID: <20251029180321.153680-5-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029180321.153680-1-isaac.scott@ideasonboard.com>
References: <20251029180321.153680-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call on v4l2_get_active_data_lanes() to check if the driver reports that
the number of lanes actively used by the MIPI CSI transmitter differs to
the maximum defined in device tree.

If the number of active data lanes reported by the driver is invalid,
catch and return the error. If the operation is not supported, fall back
to the number of allowed data lanes.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 838a1ad123b5..4224ea2d80b6 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1034,6 +1034,12 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
+	ret = v4l2_get_active_data_lanes(csis->source.pad, csis->bus.num_data_lanes);
+	if (ret < 0)
+		goto err_unlock;
+
+	csis->num_data_lanes = ret;
+
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)
 		goto err_unlock;
-- 
2.43.0

