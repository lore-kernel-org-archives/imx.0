Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA352931FF
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619404; cv=none; b=JmXBENUq19VIYAcLzkSmE6+b+os4NPjdCFV2D8J6brKAlW7NI2qMI28uXWZK/da98/UrXCS+DGlG2xJHBXDc3jgDkAHLymqa4YofiRAPGz0gfZrSYNwIAcImr3xYiLd5de4VQ9QZjfPlrZoN6YlMegTOcBbHEIXJw7h4TMez10k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619404; c=relaxed/simple;
	bh=z2RjyEse/bYu3CvJUVt/oLcwmuNzktTe9jlWYk3aDJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nTM1N0/s4XyXHT/qGiSoeYuk3Zf8mJk3lPgSWxW5YEnDpS/AQai68cngWthdSEyUoHXpOlJNd5pZeoXOC/ORIxyAYaghCquuLWCQmnmAWE403rT1CfD0j0UaKmzo8BjgMyAx8XHvWOrcM5KfgSUoIYtrFKV1dvq/gJpJZy+oqyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo/D5dOv; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo/D5dOv"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so742605a91.3
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 04:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786619397; x=1787224197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEhbAdeBtYd8Pzzm6iRICcp6vTdyVfBx3PFK2vEBGKU=;
        b=Lo/D5dOvQY6LIKuaNBhJi9Hbxb3iOFYCev/4aeAwdBRqOdnANR4jcC6fYLtwhwmXbU
         EAcIqrhyYE2rG8ScepwDDZAtCvwYU8E6DHg1DmqlAAzBSfRUo751tJBixp3denhG0qNI
         WQRPQgf7FH1+PNNH39XAQkFV9V9cemtdV4u/MewcEk/TV9HvUwP6qr6b1g9o2jvQ38ux
         Fe2qpi6Jsbam2pPEV3McP+nQGIwj4rL/GeuGFi5s6uHfPeFJWQZUFz+hiPexTJQqy8mk
         pd1dmGTJHsuO0OlRIiXIA0F/5/6F1775iV9C/NKYm+dR+wOGE8RTb8EuFjtuHJr4FsHl
         BkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786619397; x=1787224197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEhbAdeBtYd8Pzzm6iRICcp6vTdyVfBx3PFK2vEBGKU=;
        b=o66MR8Jl2OrVX5kFN/ch3BmqZjQFs0wlCUMFyy6tJeQx8VQ8rR1F4q+1uCExlTsB1f
         Q673xUSfUFmjPpQf2xT5RcLGZI1xmowDFFr3ujz2mbAoZEOpvXdRBgtpBpMVmG726rXG
         hSv2CyQYk3E7PvOfIOctL6DG8Bew5efDMzVHNwpJ1iOZUA8BPc3pF6ko7l/fzbywJWCQ
         LtaKJjbCKc3setJyKINHgX+85hDcaKsl2Td27K5L4CVrfdykN16tK4QGyEZYNUCSUWYR
         PGxFk0ieU9si4CR13G+UmPb6Pa6ePPzgyjQ7eup+EZtxCaSdy4ap9J7Iya6XbE6Ymszr
         6jgw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8aODJUDrq6oY53XJmLz1leiMvWr21RcZNcsxsebdW/sOz/w+z4PzkKRPQ8E+tIpduD0k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5qahj4Zw2ItjF1IbPuz+xl6KmM7fvAEOJxMHBJWiBH+d2mOUI
	anhZjZIR5XVDRJ6M9I4pzUqmiHBn4yXBu41L8M5ABmO+/oU+cGX5NTrJ
X-Gm-Gg: AR+sD10bww88TUZi9bu1th/KtYVSKU70SoyUw9AyT+JgE57gS4wrjKU2Jqh8CY2fLOv
	iZDGqoE9dLGPhKixbRuqt5jj6Qba+kOVnRlYPXfPGo6DCQPgmQ2NJbow47egTVQVY/kxYgeOybj
	S7Z3kIdywKU+rcwC91I4kLYBXiIDH0+334iz5UzvvomcW6W2aCIuEOQLO0FGEbM4cbACA/vvJjC
	o5SD1O68gnvscemz22yJ/Jssp5NUf0Lv3UiiXG5RjFJxSQpNFlN92/4tGyQjTRBOQHIT1Mf2b39
	/orPxr6vbhFW+psJWCXVEqN6mo2su14yl4WuLM8Ltnr1Zaz5H47dMp4nWlaCHgjBipTLEl6tFI6
	sjeyY89BfCDImfHpPoCzPFbp9AMuEzbTcxCsQdfPI+mbeJi/078qW08uHuzJBDjVrU9IE/QOb+r
	i3JkqEkXtH/rFVw0bD6+XiMk4cchgbNZpw6pROmsSNiEe0tpwhLa2JRX1EU//9/96IH//cqPbEd
	FCIvbePkg1eq/FC2Gy2ltGEw2NOKUd1XkuynkpAZlc1MQ7NYwyzOYsRDgFPbGkA/RNpERgjyp4+
	VtE=
X-Received: by 2002:a17:90b:53cb:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-3931e0241cemr6358795a91.3.1786619397312;
        Thu, 13 Aug 2026 04:09:57 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:94:ab62:887d:e555:df21:3318])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412da7d3cfsm10442224c88.15.2026.08.13.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:09:56 -0700 (PDT)
From: Manush Prajwal <manushprajwal555@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Manush Prajwal <manushprajwal555@gmail.com>
Subject: [PATCH] pinctrl: imx1-core: fix device_node refcount leak
Date: Thu, 13 Aug 2026 16:39:38 +0530
Message-ID: <20260813110938.1512-1-manushprajwal555@gmail.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx1_pinctrl_dt_is_flat_functions() iterates child and grandchild
device nodes with for_each_child_of_node() but returns early from
inside both loops without dropping the reference the iterator holds
on the current node. Since the function returns a bool rather than a
node, there is no legitimate reason to keep the reference: call
of_node_put() on both loop variables before the early returns.

Found by inspection; the sibling helper in pinctrl-imx.c avoids this
by using for_each_child_of_node_scoped() instead.

Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0..fa8f6a7e03 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -551,12 +551,17 @@ static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 	struct device_node *pinctrl_np;
 
 	for_each_child_of_node(np, function_np) {
-		if (of_property_present(function_np, "fsl,pins"))
+		if (of_property_present(function_np, "fsl,pins")) {
+			of_node_put(function_np);
 			return true;
+		}
 
 		for_each_child_of_node(function_np, pinctrl_np) {
-			if (of_property_present(pinctrl_np, "fsl,pins"))
+			if (of_property_present(pinctrl_np, "fsl,pins")) {
+				of_node_put(pinctrl_np);
+				of_node_put(function_np);
 				return false;
+			}
 		}
 	}
 
-- 
2.46.2.windows.1

