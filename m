Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5BE37C923
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 05:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288923; cv=none; b=SZ+vvZxWUKheeWB0vpjn7KpkT7t39nbq1PA8Y84UW7pcA5RnZyuoFV9quM5EHqlxWmkZZhm+zEjegqWw11pkSRn4QlNLm08Rk3RCevbVZakptcpAcVm207TicA/EjzZ0F9hJS7Ax8GEe8nVlf+AW3QFp/WLsGFUyUAULwoGyMHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288923; c=relaxed/simple;
	bh=Je2PC2ClOZ6ieh1+XV2YNDlQhlBw/r0Vx2k7n3eR9mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljb7BdsDQo7eiNQGN7USwYne4Kez3aiji48VP9Xnm4q1JzXfCk3WLm2cQNbUH8xSfwYDoNVc89BWYCIe/MNDusQpxEK16BDZAIjJK7Iz1ruODKrcauQ0yy6KM2QzWAuBKEMfxubDOsGQ1Tp2Dfosk9seMh7KAoXi0elYyuD3POU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaNXFqX1; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaNXFqX1"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cee9b74ee1so4849715ad.3
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 22:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787288921; x=1787893721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=li+qf0ogeiJJV/dt6j1H68lCeDSe/pGSxo0/wCxLe7o=;
        b=BaNXFqX1O+EkkV7m66dqWFV/1lkH285kxYACeNUK/Nx4Cj3U6rSxmqEZDo2RQPtnmf
         SwqXo1H5NWzh+CTDUFWCCZbExP3AdRL73nINjw63Fxq6nl9pEwI/pvqmFJwmYvVF3gNu
         EDRya22qfS2D66ekuUM2IX7JJBBxWiwwQz9KDK7FBGQ+PnhDYaj45fCKqwySNvZ8kTVa
         5F8qio8IzeFvwRjG/WEJIWxrgbV1ED7RMOY9NwPjID4Wi4jrvsr+8P37lSVegfSdgzrt
         8bQrmARjzqUCaTFPQrs3YvV4UEx76lvkfBksfUDjcgJLoZYJ9sMyLgwmTMMxRFUC0a1l
         5WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288921; x=1787893721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=li+qf0ogeiJJV/dt6j1H68lCeDSe/pGSxo0/wCxLe7o=;
        b=ruh/F6TBcfDyuYsLSCgDPswdhUok7FIhx5l+FSEC5VJ3RtvhzHhf0OCXXhcHqCbT2o
         VkTkIZK6do9P92UEnw8eUFP0UXrMEG6VQqBk9ZT2qjghfwiIfmp08bYzTVKMqZ1dQEea
         MKlJWNXP/w1mA4swvCCS/l6FE+NskpHor8j7deNpAELxc0ajqMNcnohwAM1TsXnKbG5A
         plZiOQ71pPPxHKUi0pl/fG6jWhaH8LEPfh3GPSjHgs/pvyqIMQXtU/qfz0EVapivIwD8
         m5qjscUjFZZcktcNSsx2bUGt28q0u1CR9+Pj5/YYMYHGSW3++dpTdMDzSB7V/P1VGH1D
         /Y3A==
X-Forwarded-Encrypted: i=1; AHgh+Rp/IX2Xj1SLKV0YxSRv36C0edsvSWX6KAmwbNkhfyhvaHyFjRK8SqyzLJOc/QQ06cwkJak=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLIstQmOnqMgerV3ni4O+4gjXeyjXVCMqmpiZbCT4VirupGv36
	E4vkf25vzX3qNiJ2NxiuKMXL5jD3eX+eHR57ZxcJVg48aL0r0Bnxc8XA
X-Gm-Gg: AR+sD10TW8TwkV6hT5xJGvK9RPu6xDoW9sElI4e/YaYjBzNGaYr2UV8N1s160Uj6f69
	0cJzOwzY+5E+RdOmoJNCN6JDaUmXrLciCWK3TGhAlD9utFcrcmVhW7AjZ8L3MXK2EfZF0yFgyji
	XOQGAXl5QTAsW8XUus+3Zl5trc+2MXR8pzVYVa7rA87wms+7f1LeBDtdDEt7AwTwIr5wdA3eA6b
	vSKr0Ufoe4ph+8SIOX1P6LZyQmb/d0lPQneGUGpz2KWXuttd70B3UIZyjs/uOjs1XeMxKTdIV9O
	DUQb2hHdN9S952sXlEgXUhidrRcsQXmkxMcAtFyxcqJEsExWqijAbXh+h2uawUU+b/6Z8ahko+b
	/aNNi8cU9ExVpX1CPFQKjVEB7ogehkaKnCPTAhl0SYhiJnUg41DRNv6EeAiyLYOzNeJdD+grBKL
	fJI8QBglc/ZL8fmIN1lTa7q4/KMa2h9faJ9q6CGk/j9cmJFXr/WPliwRq7dPsx5QmrFbau3PIjK
	Zuwg4L6FwQMyCzlZOKn5mVU/jqszA2ax92bYytn1rwkJp4=
X-Received: by 2002:a17:902:d4cc:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2d64b0c6a16mr64910855ad.14.1787288921196;
        Thu, 20 Aug 2026 22:08:41 -0700 (PDT)
Received: from DESKTOP-8BCFI4I ([202.12.123.126])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3993dsm20673822eec.5.2026.08.20.22.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:08:40 -0700 (PDT)
From: Md Rabbani <rabbanyhmm@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Md Rabbani <rabbanyhmm@gmail.com>
Subject: [PATCH] pinctrl: freescale: imx1: Fix device node leaks in imx1_pinctrl_dt_is_flat_functions()
Date: Fri, 21 Aug 2026 11:08:13 +0600
Message-ID: <20260821050813.739-1-rabbanyhmm@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx1_pinctrl_dt_is_flat_functions() uses for_each_child_of_node() to
iterate over child and grandchild nodes. When the function returns
early upon finding an "fsl,pins" property, it does not release the
acquired device_node references, leaking their reference counts.

Switch to for_each_child_of_node_scoped() to automatically drop the
node references on early return and loop exit, matching the pattern used
in pinctrl-imx.c and elsewhere in this driver.

Signed-off-by: Md Rabbani <rabbanyhmm@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0..4a6bdaefa4 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -547,14 +547,11 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
  */
 static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
+	for_each_child_of_node_scoped(np, function_np) {
 		if (of_property_present(function_np, "fsl,pins"))
 			return true;
 
-		for_each_child_of_node(function_np, pinctrl_np) {
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
 			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}
-- 
2.55.0.windows.3

