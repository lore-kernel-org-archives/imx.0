Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18391EB195
	for <imx@lists.linux.dev>; Mon, 19 May 2025 17:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674988; cv=none; b=Vr7ApPXqV0Hjz4C6ouQ1X+7iqtcy8mlvZxLq4GqIfMCJRkwgVCMa+HxJ9mY/OIck+g+4B/AYlGlFDta5/PSZIJ5CIG9Kw2/Le3gnqCv58cVIFXMJ7WYdkiTBAMBFAcUOZpi+u+fI0EJB1rJbvYuJjOQ5sLTsQyg9UuvOPpIvmdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674988; c=relaxed/simple;
	bh=PKBq78bzubgMQ/vHAE1CkKGTFKeq16OIfKRTurY/NKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NmzKeVBkb58jCXngJ4ms75QTEn52nT7XSgA1ewCmWEIe5Ybz9Iazaz6TY87nclB6BVtVahXJQNO/JyMNZYrXYhfS/tbOACENzCJk+ElMk2uCFIJ8QRExdJTYhyrvOhmYifTMFCzWI9F9f9VEj1qDz9qivDA7B+7xnRLPd3T6Ob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwzzH9w6; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwzzH9w6"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-527b70bd90dso1696299e0c.3
        for <imx@lists.linux.dev>; Mon, 19 May 2025 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747674986; x=1748279786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7omkwwv22LywzPK9OnluDC1evnMI2mYZ/bT9rkSvGw8=;
        b=jwzzH9w6woz77NNUMDMUnAY5PHstVvasVKRSSlEhsjZk/UlE8UX+w8FKlxHnf32Q9E
         M6x+7TZoCgcOv9lp7P3xiXqRKIPl9ILUh+69blg9xm8icE9Eeb/lIht3aFdNPbc25qbB
         UkicqQzWQ8dyhhpnAO4gndsMOrtsNDccY4YHUr6vHaxrU8GNPJO7cWFpJPejCo8WF2gS
         pvYprYuVLWwC25nMe0Ir1KDQ7sQXhp6zOChI0y/IqMzWNMHghhD8OW3a0xiOozM8ku1g
         EOaXN5zC7CQ/Xo09FL8EQJXQHZpqYAonc2wO2s5V+ZsjQ3A5FDBg1Ug+VcCAoIA6HGe6
         Rs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674986; x=1748279786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7omkwwv22LywzPK9OnluDC1evnMI2mYZ/bT9rkSvGw8=;
        b=O7bfCQs+UT93l2pzauwuu2JP5PcL/PFjl1pwpvHCeMj9yVCoA/TnkhZyVNKksumNO0
         8a6AwAjixbwuPZZUCraL1Cq8/0HyUOASCGkErvBqHaVo0o7dYIJOicqQeAZUIcR6qOXj
         adwSBDGZB1c2zZx0mkIsLBCo/L3pOEo12gbPiSdDRwjYAH4dyYgFiHNrxzqR3EIrnKpx
         LaKHswkQs3gEri7fm1Ro/4QRYNLcxkBKy4blagKk+9q5FVHpKqDgOLw2sDtnKt8pHXyR
         WfIrDNQCrrIwlIICZxELYsXQJIv5Jsz4JbzhFSxz/9elOxPOIFhSG1rdL4uJFATD75j+
         sgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqLmzwzcouUlbLAShIEnBvuA7xA+vHcCGpBuHBewvrx1fzKMkXEHsrFZw20cDPpCbfqPM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQOXSCqr61kdrKUvShDiKSBbPK7nMk0BblPY5mWFOQ7X/sMh1f
	R8/qRfaTxsvoPN+t/Gajrf9UQr1Z3gu5qqVA3YgAfA8N7Cc64sH12HqRhW4vy0em0vQ=
X-Gm-Gg: ASbGncuH/E25L2gi394YgqWq/faU8WI9NnvxCqaNmmlBhtfPe6O3XzgcjhkOyy6br8C
	rvxQjdtRbxif01ESKePcKrDC+jaKAo85sm2YDct0WRBpR/br2HBwwIgs1Q376I3H2ieRo9f6q8n
	0HxaoSpdus6W80GIuTYD4Q+nIv9WOkD3KZT12XtYXHNLYLVMnsOI+c2tD61uhPJOB/Oj+pKbGHd
	aw7G/X0oQFGvpnCCyHF/dzZ0Us0WR1B6+lh7sNj23U57+i9kJDgnEMdhuQ7inqOe+LH37Niu7BJ
	MiaZhyUDnJJVYXnseco/yChRQkRd3CMeAEKxpZPK/Rk61sQ0bq+bmGfKyU+g+z48lUU61C8RKay
	WYOvbY161
X-Google-Smtp-Source: AGHT+IE6q6gZqSe9Ip0nuMzYQBfcuFkViraMC2BkT8AsUnpaWIwgC9BeYahAGarm+vPPXTf/z60teQ==
X-Received: by 2002:a05:6122:8c0f:b0:520:3536:feb5 with SMTP id 71dfb90a1353d-52dba97c622mr12664280e0c.11.1747674985608;
        Mon, 19 May 2025 10:16:25 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e983sm7003647e0c.31.2025.05.19.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:16:25 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 3/3] remoteproc: imx_rproc: add power mode check for remote core attachment
Date: Mon, 19 May 2025 14:15:14 -0300
Message-Id: <20250519171514.61974-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519171514.61974-1-hiagofranco@gmail.com>
References: <20250519171514.61974-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

When the remote core is started before Linux boots (e.g., by the
bootloader), the driver currently is not able to attach because it only
checks for cores running in different partitions. If the core was kicked
by the bootloader, it is in the same partition as Linux and it is
already up and running.

This adds power mode verification through the SCU interface, enabling
the driver to detect when the remote core is already running and
properly attach to it.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Peng Fan <peng.fan@nxp.com>
---
v3: Unchanged.
v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
suggested.
v1: https://lore.kernel.org/lkml/20250505154849.64889-4-hiagofranco@gmail.com/
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..9b6e9e41b7fc 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 			if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
 				return -EINVAL;
 
+			/*
+			 * If remote core is already running (e.g. kicked by
+			 * the bootloader), attach to it.
+			 */
+			ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
+								priv->rsrc_id);
+			if (ret < 0)
+				dev_err(dev, "failed to get power resource %d mode, ret %d\n",
+					priv->rsrc_id, ret);
+
+			if (ret == IMX_SC_PM_PW_MODE_ON)
+				priv->rproc->state = RPROC_DETACHED;
+
 			return imx_rproc_attach_pd(priv);
 		}
 
-- 
2.39.5

