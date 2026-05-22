Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A3B3D79F2
	for <imx@lists.linux.dev>; Fri, 22 May 2026 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448838; cv=none; b=BRQ6NlWmQs+I9CyF0EC+FJNGss6k9aAYuTaCG8gYWpaNbvhI2suf5TZor8VxGQepBA1BNTjAHeAACkFfBbRVGVvb+UREvW0+8PU+IFokm724NYMWJ2JWz7e55rs4yhWSki47FbmI5GZZaZoEPfaZSCizGnrCE+T+AwXwUFsQMmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448838; c=relaxed/simple;
	bh=VR+oYjaqTda/ojWwOj+jXMPjefM4/+bZEZNGcaE/kiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsypeN+SffWXGymFdwvCNNXDav+X6g+b8erz00CtKLJVBzfdLb9lpLlMwKvQG/rCUFAR+4xbXBJtIbBJamP2eouJuiDyg2pwyu29jPV0wd8wwfE/kbE9UZaq4UvpJk3IunkzD66UJGquPsLVLB2ys/R2ZIoOz8lVKltjF9VBBzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLYIgaMP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLYIgaMP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48909558b3aso73147835e9.0
        for <imx@lists.linux.dev>; Fri, 22 May 2026 04:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448835; x=1780053635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzM3FKLrWhS9Bb2TjExjJmxAKhc1IFpSqwHPLv7ULGk=;
        b=ZLYIgaMP+02l2ElLDeFKKUK2bwCmlXyh8zwU/EvAB++35LMbqXcmI83M7Plw6p3E8R
         nGi0qJ5nR9CwYfACrWDipYPyf1O7WGem3riWE37h5/bVTGxhlZurFSVpblQvjSLlNYAY
         M8PVjvzQvdmTA6ty4B1G47Xc4BR9kUwAMzoJe25m2IEWpnXfYbrVihs+4XUv+2jXaeNy
         e6lennBEFuRvFuBZLcICn9kufF5bnBFSxXW4/nhGqvmRug4rDsA3fRPI4cZBcAPCuDM2
         iwg7K0F1J4tbl8FgDhohpqvn22HOdKhIDujKSgxQ8LKL+bPjUz/4RPons4Ex8ClwpVIn
         rntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448835; x=1780053635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wzM3FKLrWhS9Bb2TjExjJmxAKhc1IFpSqwHPLv7ULGk=;
        b=hrFITuF0+ubcrV0KtvW+WZ5olhS2Tt9GOFCb2i1izqUDxjXITakMirVPsGPnqELAn5
         kNLR4nFooZiuLCu22ojHc0OGwI7ETQB0/k6wIZT/qmGSc7vaoL2qllimPx209vWJuKcC
         ozx7nAqprLs6LrQB21R/YROj+hsB+rZZGQkSgN+l7GTQiXlTy85OZUNCNwNWKLVxD6XX
         SuoyM8YZiJzkVXFTUM6oihqhBE7pXI9q4pRU21oXC2ZsNCmBv+ZSAirrhnZCVAxqsG9s
         wJISZLsYr+dqXVbi4RXVDos3uCAtZDNtZr0TMuaP9jM6B1iIKCAmRtPMWu0PCMaThXyi
         N8nA==
X-Forwarded-Encrypted: i=1; AFNElJ+HFPNdfclEJzCSVbtx59vw5OgKKTXgL/Us/K0UgWN7z6ayh498IX5b9FaBpZErTVO6zU4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHR0apGZFQFPpn+f9XZxguSd7zLsmX/NCHSwFbFxd2DhQAv/Kj
	hU9m+dD4mmWhICHhwoiQzqriB9Vk9MPdIKIDOFEPg37+8NteMnuItTqQ
X-Gm-Gg: Acq92OHfdgHXbdWs1D1CsHK6WdFu/CffbozLSHK1TVvqNrIZUXUcRtFUwk3abpq9Zdx
	k1XgQyQU9tBpTsBeYhD933w32y4lYyk1mtJ49eTHORGGUyzs+0XO8dzxxA5bCSxOgMT+I33cgtK
	wXsUJUqgmJhofwgLwY+qN6Rn1FVxuZ0WP5MY/zTRqkHKX+wFhQL2Ra7MTZaJWJeI/9gcjV5mWQI
	gxRd2witlkHn/le0mi4wNf8kpBFoXYgVyqbTlgtUUz7HKQZ3lbE9NbmGN+T8WmYrV6ndJBkQZRU
	dintzf4kkYazDMBt3SQMJSgL3tWBMZHqsFg0+z4cYZswuGm87P4L30Uocg/Bi6zjKzHcBLwV7eA
	1+6LNMBn5WAlvafaQgeVJavSsmLAnGKtYpAHTGw9P5lPR4UmqIuN4TZW7yUH/whCdKDtfonVUT/
	9kQhaDYbAdFkXuoD9bLTHLImgy2MEfUNmBXJlqtrySwnCiNraRuQ==
X-Received: by 2002:a05:600c:4510:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-490424a682emr41205515e9.10.1779448835090;
        Fri, 22 May 2026 04:20:35 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:34 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] remoteproc: imx_rpoc: fix carveout name parsing
Date: Fri, 22 May 2026 04:18:46 -0700
Message-ID: <20260522111849.783-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
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
 drivers/remoteproc/imx_rproc.c |  7 +++++--
 drivers/remoteproc/imx_rproc.h | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7f54322244ac..1ee1c658dcc1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -850,11 +850,14 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (!of_property_present(np, "memory-region-names"))
+		dev_warn(dev, "using node names for carveouts should be avoided\n");
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
index 0d7d48352a10..58e9daa41afe 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -45,4 +45,23 @@ struct imx_rproc_dcfg {
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

