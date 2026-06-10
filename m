Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E023655D5
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781068010; cv=none; b=tOVbNxlNCExkADGhyZTRtVPXQkpnYT81E+tQ4/hCUj9Cn7vjNvz6I0Yj4fCfDgVkGUc65CDw4ILTATkJgihtwe8lTZXAF1doAO24u0WarnfU3OmmG0MTbgTzzGRD8GfFBjIKOTjs0fL6BcIZkOPrt1AM7LV+vYHEYHFE6IkptVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781068010; c=relaxed/simple;
	bh=A/HTXbbqkzZmaVzp0DgOiTcXejyaFLmWn1tf0ouzoSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1DC6h2md8ts5neK5QwAlc8epxq4kC4mxhF7q/MhZCLffCy1vYz6PJEbFWkioD5+vAptr2BHQ0avnvLUd/UAiLcKwoSwjZ+tWaTSOmeGzNBz81OfI4ZI7Eo8FYwtjWTVbWa+ebn0IlHo8Cmr6z1y4hySki7C9KuJeR3HYXDGI2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhG4eiJd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhG4eiJd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so53106495ad.2
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 22:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781068008; x=1781672808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvI5XrhZFZI6TMOTvbNxHG6jHvhhtOJVngky48pbbec=;
        b=IhG4eiJdauFisoHaVp4eo1BBDCXvexNYFT9I37qzPhITndDOO9tJHsqSASWhyvGH30
         ptAWR6Gs+SjCCpbEl4AqLpW2uPyyNJNiL2aW4J7TbuDfyK5yzr7abbIqfLcx9CFvXWy2
         m1e1a3y6+LhR90Yl7EJC6SOFvi3L0kp92XDzI+vNU3su2uNFlu4Vzuptbab2oT4U6Yo1
         PuxS4Ihc3C5fukSqGfl4jcGLxYyTDWNm7eaCD3FMb5tPQI4UNZYVJi4/q0SfWS8iaDTi
         2ov6sEz/vMfRNXezLaNCSWw+qFlszMT5Kn26QijhoQz2b8vjN0GYB0dhHCGUoSlSS6ox
         0kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781068008; x=1781672808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvI5XrhZFZI6TMOTvbNxHG6jHvhhtOJVngky48pbbec=;
        b=BzoP8w1muNTIAQHvJIVdJh4TYVMVbkncP88StjemZCjzpIGZh7+IopN+0b996VvX0D
         1JFeGJWJgnxLSrTE9Fs2CT/Z/XXi+kiyNTMbw/vvkuflFhiYcsS+po+xbFcTc59n18vX
         5w7X349ZYrakdZ7o25VDKPSI5G3YYWfmM1yN7ZlceAAsVb++LClrInq/CY+iXY+cr3+t
         7PcW3wjpjmLqnZAQpR4SFKsW9EHshtTe72Ie5ibNIcR/kk0n4G8jmVLDWYDJaAIo213V
         gZggh1laONOlublsLW/G9YOaaz4zF1gcNUrRWqIA5z/WaWXjUSU5f9tOZDgZN6K+65qK
         BRug==
X-Forwarded-Encrypted: i=1; AFNElJ/s8IYw/A+r03V8PBMoCkeWlB375EjAt4pneA/ZkZggxpbeTcFIfbnDFOMy6MNiJEJlCc4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGzjp1w8KqPR4m7bQ5/hRkbJ0IJw+yJSh6I4Xvw99Vd5/3pyEl
	zwnYMB2zw99mESnzpun4SRuwQXXr8bhbvnaALu9J4+W7qiNDQ5prRju8
X-Gm-Gg: Acq92OGibLBxAMAxKLBWPTHnvkNbxNwOmVcLUee3epvSwGdx0dLLC26ktlE1olD4DQs
	XOP+pCL/+Zt9JT0pmxHVC62jWlfMShaaV/aGK4PnvT+JVe0Z+vwXec//NYoo+u8af1+E6FcERC0
	sFMXc+4hTBATI2LfTQPoX03AmC44Aw9ltPmUt5gZAgVHaAMggk4NaLbudbLwn4XaIqNH+a1iyiU
	I6juGp6PIIYwXJqXpvRNkZ5T9ebKvuEN5m4j7LVGhHYJOakCU40wCBpNrKBRjNRX6pERkDWH8Nv
	zS/q35k2BYX4sLMoULtcBoasUtghQ32ZPvS0Ksib5eJcbAPsBghInV2vKjhlLrUMvZs9IhvBhPJ
	8hwLjzOm3gDss6WxekvZr/r2NGwDKl0elgViX2ahe/ogNJF0rxm9yVZeUYBDd3cQ+Ta3AOXQ9Yr
	bo8S+HTRMl9bKSc+KmhB99T/otcToI8MeOQQ+OnuoXiiFCRxUgAq0QvOQP/7qu1nU033O6zEBSR
	1qhZZ/Zf3v6g/8FqXmzua6JavjvPnU02DvYB+0BwGC2yzYmJPa3YQ==
X-Received: by 2002:a17:902:f543:b0:2c2:27be:39a3 with SMTP id d9443c01a7336-2c227be3b4fmr200649235ad.29.1781068007320;
        Tue, 09 Jun 2026 22:06:47 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e2adsm245342055ad.5.2026.06.09.22.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:06:46 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 1/2] ARM: imx: fix device_node refcount leak in imx_src_init()
Date: Wed, 10 Jun 2026 15:06:24 +1000
Message-ID: <20260610050625.2229221-2-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
References: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_src_init() obtains a device_node reference via
of_find_compatible_node() matching "fsl,imx51-src" and uses it only to
call of_iomap(). It never releases that reference: on the success path
the function returns at the end without of_node_put(np), leaking one
device_node refcount on every boot of an i.MX5/6 platform.

Release the reference right after of_iomap(). of_iomap() maps the
node's registers but does not retain a reference to the device_node, so
the node can be put once the mapping is done. The early return on a NULL
np needs no put.

Found by static analysis tool CodeQL.

Fixes: bd3d924d71a4 ("ARM i.MX5: Add System Reset Controller (SRC) support for i.MX51 and i.MX53")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 arch/arm/mach-imx/src.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/src.c b/arch/arm/mach-imx/src.c
index 59a8e8cc44693..f28bfb653a88f 100644
--- a/arch/arm/mach-imx/src.c
+++ b/arch/arm/mach-imx/src.c
@@ -171,6 +171,7 @@ void __init imx_src_init(void)
 	if (!np)
 		return;
 	src_base = of_iomap(np, 0);
+	of_node_put(np);
 	WARN_ON(!src_base);
 
 	/*
-- 
2.43.0

