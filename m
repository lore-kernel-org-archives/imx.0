Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D4A44AB9C
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429327; cv=none; b=OmMV7pVLhC/Q3/hwx47YugHoijf9xuwDvODn1+6rny/3u0C6cCB1ZxxWRVkCgFTfqx6n4rtmR7ICzJmkldT3IA1JL6chynrGWUEGYYBy+8vFhfHgT8N1lNq37qPPgE3CcuoLcTwLGEkvLvFT69Zu1jQh7msS7+ksmqHqKfhheEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429327; c=relaxed/simple;
	bh=9/dYBTHrq7EV9WTV3/3yKdBwLkKoAWFK0mO9gViXnSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrDdgCHDoFZejpuB0DuUNyKDaaLFpUhWt980xo296BjZFCm3KhebAZMvzR/s0p6w5/ZV0ag/G0rmxM5HF5fsREQJTnziv1HnYI5ZHxbjnIIp8DQQeGEf7aTit1AGyPTSUgFaTeA+ELhFiHWNyywgGm94hMIU/aBPAPDA4XFAzf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHvoq7PM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHvoq7PM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f707e5d75so1697554f8f.1
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 09:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429324; x=1786034124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KN9fvuyUrAB/AWwJUn50v4AmnDRRKrkHVX/t4wvTSMI=;
        b=IHvoq7PM12PZQkjVkNmPy3iHGZvL2JqtVv6qlm4pf0tL0hWL1atIxtSeo/I0bBEQqn
         qlA9vaWuPSO2/O3Rx3bShO1itJV/5YENwyM/SQcvAJpRBBGSY5z6xluMhmejs1587gCY
         nZSFwvj2RiWkWnAStCoYvfwlzeY5gILD6AhqbLxpUXKJ2aZdqW6ok5J/UBpVq7q2FHj5
         KLwQfsZPkhb/hSzZAyZX1E5UT4/8UMAfcvXyP0Y6vyaOZXdfNxB5vXsQFpwy1sl0On+1
         axj62SzTyFzi2LxXpPMhqxkI3LPOH2RU5r0yYbbq3/YpNpbCuKHAGcP0RpkDXIwNLZwz
         brUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429324; x=1786034124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KN9fvuyUrAB/AWwJUn50v4AmnDRRKrkHVX/t4wvTSMI=;
        b=dIugG4Q5QKfYXJmRPF+B5doWYKLeVwv+IHDj2z81+ZMuvpqGNh77b+p7WzMCH6ibU6
         0aEEdMQ4tgLJy3/VVeu2Hj8H5fOfV+bzMcyjnUEoV+BhNsKT6AcarUm+sHmbZWFAG9At
         7Z1A8z6yO3FnEQ92wZnBB2APH4Iss94ZSpevB4WIzVP5rExvuq84r0TuA5CiLHHd2vsT
         OlaAo07aQ23yMGcwPxGhp8YdWz/T7D28VFpmIeMq4FAw5/qX+aI+H0aFDYphc/kBPw3T
         poNTTOfScA/UWDj5Jau9xgYYAPyHRJ6F87gdYDThATJvND/KFJngwKd+xq19wtPmpa8m
         7ryQ==
X-Forwarded-Encrypted: i=1; AHgh+RpisZv2F8GbWmMs9V6JvedmqljAsmL5YDoA5N8RwTkpPl7bZTzMBhrusQBd+55wmtszyAs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRiCKrWrV5YXu7YMIbDVtQomSlaIS3XPzz9gUw5IX81n18TlaN
	C4TNG4Ok+oqDNoAr51b/GcpEGyoqA3oytCiisicggHWX0iYT625oCPSQ
X-Gm-Gg: AR+sD10JkMEktlGL1BW67thObL3l8k/BdUl4RjBkwL2qDrGpANPmb5m4jCmFsiQFekV
	VKvRdSV5ofwVVvhxkFSB5h2oPD9E8OZkPDmkOXehSWvDxJz50rdvOga9WEALuVPL1kbo3zy+9Dd
	PYBz2X8cpJnU36XPaKws2VfBtv5PKqXul14obHjHvzNWD9YCx+8i6Mjo1yTf5El9O7p9XkmySJ+
	ym9+b+U0atzm+L42x3D/3xno0aGVWaS7vZVp3DwLv93JCOgxvkLGYpAczTAc4AyCbsDLbdZXA/E
	OsY6PLo0lJtjXCbpmXB/2QO15n+0BtyfIGbcsbMyVZxIwQZtOi6NmLiFHWk5NIGtJEsGAu4EZqU
	dB3tx3N3H+eWb33FqLnj/fpKLQRQ2oMv6Qu4xxLhNoai2KzpCQiSPvkMgcwsMVVivhs1cUqGie8
	eG+czBOK7vZqtrAKn8jTGdIe4Y2oxFoaIhgs8XswtRzPE5ph5zRjRhy9U0YZvyRX8JGdEwCIfYB
	HrKuIG+nuCmgA==
X-Received: by 2002:a5d:588a:0:b0:47f:9751:cb3d with SMTP id ffacd0b85a97d-47fc822e715mr4862784f8f.8.1785429324205;
        Thu, 30 Jul 2026 09:35:24 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:23 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] remoteproc: imx_rpoc: fix carveout name parsing
Date: Thu, 30 Jul 2026 09:34:10 -0700
Message-ID: <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The imx remoteproc driver assumes that the names of the reserved memory
regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
conflicts with the devicetree specification's recommendation, which states
that the names of the devicetree nodes should be generic.

Therefore, instead of relying on the node names, use the names passed via
the "memory-region-names" property if present. Otherwise, keep the old
behavior.

The definition of imx_rproc_rmem_to_resource() is added to a common place
as imx_dsp_rproc.c can also use it given that it suffers from the same
aforementioned problem.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++--
 drivers/remoteproc/imx_rproc.h | 21 +++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 745ce52cd822..ce9bdfc1fa98 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -643,7 +643,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -818,11 +818,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (!of_property_present(np, "memory-region-names")) {
+		dev_warn(dev, "using node names for carveouts should be avoided\n");
+	} else {
+		if (nph != of_property_count_strings(np, "memory-region-names")) {
+			dev_err(dev, "invalid reserved memory name count\n");
+			return -EINVAL;
+		}
+	}
+
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, a, &res);
+		err = imx_rproc_rmem_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
 			return err;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 0d7d48352a10..3632bc375c71 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -7,6 +7,8 @@
 #ifndef _IMX_RPROC_H
 #define _IMX_RPROC_H
 
+#include <linux/of_reserved_mem.h>
+
 /* address translation table */
 struct imx_rproc_att {
 	u32 da;	/* device address (From Cortex M4 view)*/
@@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
 	u32				reset_vector_mask;
 };
 
+static inline int imx_rproc_rmem_to_resource(struct device_node *np,
+					     int index,
+					     struct resource *res)
+{
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(np, index, res);
+	if (ret)
+		return ret;
+
+	/* "memory-region-names" is optional */
+	ret = of_property_read_string_index(np, "memory-region-names",
+					    index, &res->name);
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret;
+}
+
 #endif /* _IMX_RPROC_H */
-- 
2.53.0

