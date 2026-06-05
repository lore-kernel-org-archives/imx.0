Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333593D890E
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659484; cv=none; b=MF/kFm9mLbMiJ++yCRR5DaXJlnaQ7bN0i3eWrxOxKka1EBmlXqDcVJfbHMxxTl81Obuav4V8ExqxFxqT8AxugvhEXSxZXtZveZ7rwZDhGHeGU6CinqF1WaM0VI3mk5oZMmUsO6JH1fHJ03GuX237uQJBkclTB+x57YRoV+pDCAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659484; c=relaxed/simple;
	bh=0vd+vO7kT/Bwe+zNKztgtx34weofQNBHZTUxt16DUFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1POnfMwdsGCGwxQed2if9Eyos240EQMgA+o/aw9NTyZPylaLMYXxYI0teAbbqLLZiel3RkrPvozjd4Bh44PackLQxUp6QpyhgNtaLrpPlNmQ08itNY6FOxV86xSst/zdGK+0EgctWxkPKdXQlwmwAF5Uc9T7FguGZxS5ZOqFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJguLwja; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJguLwja"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490be03d47bso14886005e9.0
        for <imx@lists.linux.dev>; Fri, 05 Jun 2026 04:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659481; x=1781264281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6daWXnyshURFrvLbUnWsTDQNHdO5cag/yMoMIvHA3zY=;
        b=tJguLwjayW+uOfIon+OB/bF1awkn60EJcqfYt96eI3eAQfjxige29UYkbJu8NZEJhB
         4bLWbU9zdesQLaKQiuBzSyMiUqjJHHV2BS1cy9csBDWsb2ZtS8t49ubxF4+vZZ3u1Fff
         n43CskvO9R6OfNw0LrADtOIEfH/VHBzfxRZj0lHhLc5y0T9EV9NO8OoWHaR/Dn6Jnej/
         hziGh7j43iSQKIPNmYz7vHJISgDDU+PutmUui8uNdPPYvr1IwihhwjgfbREIrzOb5lXZ
         Jf5tcNJ4ddx2A9WEBdWWY2Q5C5eh3Y4WSObocZBAFVqKalYA9Lsqi/Y/o/AW1lKDVUFd
         UtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659482; x=1781264282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6daWXnyshURFrvLbUnWsTDQNHdO5cag/yMoMIvHA3zY=;
        b=r6MyEPmteQkyApIKqliNhHHHBkxG4oPoXUYKl5+nyGdVyDHoR3F1pj5jZC9pObzAJK
         dIxApAfo0k/k7FoQ6mzBW76J2xWT5jHOek1o18lsXu4Ep8SodQNQDpcAnmgbiNxjqYct
         WOObG+ZFJvWmAw9FYbbDdbBm+6iewdcltzX6Q1p/yoEPgpFiW7Gq63ElN6ZEbwZF+FJr
         a6yre8jItKg/InUo+Dsait71+ieLoL2VsriLo6uWoLbqxjZR+ZtbxXuEWXMclh7idrqB
         qAiq2HP5IkAkxt99A+HKYlzwkJBQJT2vZ3VELyZbTVNTWkfn12Ywx3D/tUNySWO2CiSN
         cbKA==
X-Forwarded-Encrypted: i=1; AFNElJ8CF22HRXJ3YzRljeJeR+EQfHtkOWos/yi37ZVtn4okHnfcwnUdmm/2aLeoVnf7p0NcflI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIwuv+0a/QGpL5Fo1/fqqknPFW1iTzqHmYN1dPK/Tmkf9mFJPD
	JGReF5o2r9X68r2sNeu4qKZeXH2qNribKo/dV+XtmGkGcN8lOdcqj+EffLt0RK8i
X-Gm-Gg: Acq92OGiHEDapKVYn/48zsT9leFUPCJsDdrI6uf3QqajfUDvqOa9nUNAliRdbYAELrN
	u5YzZoerB602SEpxsqebwL4r6kDZyPv+E5JhDoNtjl3OgWtwv+fbG8pQSQXZAvruSZ0Wgs6CND3
	FQOR7D4SIih/xRrzJp2lCZ8Wg6oCyozbKK0FprCFvQV2AW+bLOeRK4WCNP7LmWasSPuVmF6xbua
	iepw3LZxV/36LteoWe9wPRM7jmclfpO2BCenpq0Ev1Yx7Y2ufBiYlXesZSEiphc5jhgRVUEP0ku
	ssoWZOHjXNQTVlZXV+iqCc+9g+5fNcXKdJO+NRgV/wtSpCKvTbs8Tx/L0tsO21wi+hsZvkMm1+v
	FqGN1U0AEXyIxdEcbk5CG8r5SK7xZepxvyoH161bVpGbOaeR5nheHvJ2mmPo0aUe/VZGSNQyE4E
	x1ixPWRphu2wqXzqG1Ryq0m/d9+Gwwmk2bs5OAH6hnpwkf0qfO2s6T5zNzst0n
X-Received: by 2002:a05:600c:c0d3:b0:48e:6db3:ff33 with SMTP id 5b1f17b1804b1-490c265c091mr36372165e9.14.1780659481627;
        Fri, 05 Jun 2026 04:38:01 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:38:01 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] remoteproc: imx_rpoc: fix carveout name parsing
Date: Fri,  5 Jun 2026 04:36:19 -0700
Message-ID: <20260605113621.1479-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
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
index 7662ebd9d2f4..74719066905d 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -850,11 +850,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
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
2.43.0

