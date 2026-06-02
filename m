Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C403E008F
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406080; cv=none; b=XhzPBkZfE9F9+MlBVwerTFHcvBsA9Uz9zlW56oRIwnRiEBrtEyokdkcx0gOjva+kdZIDwSCX3VSmckNLs8FjOgIYSl41JsMf2/9s8ohENwuCqBs61neExGw/CJogZmKmwW0GQOFsJT0DrxziAFNuvYNfWz1vc2BG+bu+zaYkyJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406080; c=relaxed/simple;
	bh=2P56B+ZQr3CMN8Q55LeqttmN2FV6MnYrkE4+rKOUiPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VZe8k3pGTT04p8G+I3JBd7HVxXPWAaCRydGckoSIlIHjV6DTMw+hVLtxvqrYwQrcRWVeV9wPVOWrvJXzxx7itAmLtVuK0qj4yDYRwUcEJQylmaxYtWodkspDbfQ119d16cZaaGUj40GcxzlinPNieeFLWIInN0PlX/kjuy+7li4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DizIB/xk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DizIB/xk"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c132ac5ec2so3625355ad.1
        for <imx@lists.linux.dev>; Tue, 02 Jun 2026 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780406078; x=1781010878; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1KVnd1R5IOEaVntsRV6w5ohh6MM9xtfcSuVzw7+bPI=;
        b=DizIB/xknXePRvzl7DGhZMHMRHNyHX2Z9KvVhRQ762/mUG15czpTiZvNgIMS0yL8tP
         3KIE9zkZRzT7jqAUrgvrksjajhmfC/jj0t8KKtB9f8BBGxIICNGkqasjvGSOUDBurT9s
         nbQ6dny4YOvR2OqQ0avPNWSxejNFIEYrOBS7UH2S7Wt0ib8JE1XYAJajjafcN8fa1vsG
         PEOE79LC6rzw02yLB7n+jzpMJq5ff4w4fU7kGV1RjxJMxMcgRKYb0Op+TJZRf/zDLubA
         aKyQDLQYdR7OFy2J3RwdONpYmiFk8a0M+IloHBCJTGB5ez0HxzZTXA9r3oMMrLvpbNLO
         UVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780406078; x=1781010878;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1KVnd1R5IOEaVntsRV6w5ohh6MM9xtfcSuVzw7+bPI=;
        b=R3TFkYHHTzV7vLMkVGAacPojygOMwJv8KKk9awLwqf5e8yG0iDRXr/QpH6dnZEIqsS
         lYEH3hoPRsyf7ih0SOYLqTGGBX0DCfdJi+NYjprmq9+ZW8rgNJYg+tBjqNCQc9SG3yaS
         kk/5BI6rUkjL88FpHZ2D95sn5uZqOw0EYzCq2euMJpMDlI6dvXuT/oYL0vaNi+m8MnhG
         AjVgiVov7mlgW4ydLX/zDMYRGjYZs5OCSsaaLJVhBGgJ7b+dPV6GAZeVy/6CVYFLE8/H
         VchBgl8B28W3WFJFhiBNlSrjF2Q+o1bKaL/7cUxe8A4J5h/AEblPal3MfxF1zfaVKZc/
         Ujhg==
X-Forwarded-Encrypted: i=1; AFNElJ8hufpWtWGKLfjvqWeNu277Ed1+IDRE986k3UwL47ReliAGDSBN2KglnrqQ8lc2h07Q3KE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaujWwsfnH3KBobtCFh5mz0SBdyovsh38OVxZPq0jRFYueTCtE
	oQ+5NM+hvRecPVtZL3j5ivBgcrg67B3OhgbalWXaUvRJR4kZ5dhshbo2
X-Gm-Gg: Acq92OH3D2s0+RHGvF8iBYtVqSJ2fuzZrWTuK+cKx/gKFdbRJNgmR9qJSA0wzLo5wlj
	mtgDLAyuezK9ZbV+wtpdUhWOFO9hnVwYwaHqvqqnTk5QfTS4ZsEgGJRw6EovdjDh9l36jJvf+H1
	8f44FaMz05U799XVj1OHCi5027Up8Sl03kgD2G1dp5X5HctiKmH5v8R9DpbO5nggkkg3ohsWFw0
	Oeoc0At097vLlg87AgjYSzPRlY+v4G81iJwdipzk3maNzj9Kwaa/nMDsV0D9LvcBYNvTxyCB+JY
	c32X4CmSgvvxIcUyhFcoXzGkHZH1Cq7x45CGPTlmIUV023BZ53hkgfK381kgMMB+2yDHOJJ/ZSQ
	pXef7v+/XHpp2ZPnz6vIWP2wvEX/WvI/xXpiI+YMuAgFeEUYgXQUkPjIPRxdwFahWu+zOu8qnhp
	69dW+xw45I6BrBqNe1NK/5WIaE9v9Xn/xrzne6mRf8rdzhFZmnmjrH3iK0Gp6S4aEZV20HdOQJl
	IUB0ycVqc0d6h5gDggyq4vsH2YxEbGfcUzbosw=
X-Received: by 2002:a17:903:1a0c:b0:2c0:f807:56b6 with SMTP id d9443c01a7336-2c0f80758b4mr76638985ad.4.1780406078215;
        Tue, 02 Jun 2026 06:14:38 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e7024sm136568705ad.6.2026.06.02.06.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:14:37 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 02 Jun 2026 21:14:33 +0800
Subject: [PATCH] phy: fsl-imx8mq-usb: fix vbus regulator leak on error
 paths
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-imx9mq-v1-1-e58b912923d2@gmail.com>
X-B4-Tracking: v=1; b=H4sIADjXHmoC/yXM0QpAMBTG8VfRubY6m6zmVeSCOTjKsCEl7264/
 NX/+y4I5JkCFMkFng4OPLsImSZgh9r1JLiNBoVKo0YleDrNtIoMpTYqM01uEGK8eOr4/I7K6nf
 Ym5Hs9q7hvh+Sh+HCagAAAA==
X-Change-ID: 20260602-imx9mq-30169239b590
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406073; l=1702;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=2P56B+ZQr3CMN8Q55LeqttmN2FV6MnYrkE4+rKOUiPI=;
 b=g2pyz/lE7GuPW7EbYIxceMDMUv9+CWTXEQIMXX8ydyaRLCAB+gzEIohDQmvjmmkIS1HKFwuY2
 a5WVBm2mQgXA0UAuruhmAeMLBxclchAkYoPqxRyWet4Ts00kbW5mkVa
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

In imx8mq_phy_power_on(), if clk_prepare_enable() fails after
regulator_enable() has succeeded, the vbus regulator is left
enabled. The same issue exists for the alt_clk error path.

Fix both by converting to the standard goto-based cleanup
pattern, ensuring the regulator is disabled when any
subsequent step fails.

Fixes: 3b64ea4768e7 ("phy: fsl-imx8mq-usb: support alternate reference clock")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b05d80e849a1..e45e4f16057e 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -627,13 +627,11 @@ static int imx8mq_phy_power_on(struct phy *phy)
 
 	ret = clk_prepare_enable(imx_phy->clk);
 	if (ret)
-		return ret;
+		goto disable_vbus;
 
 	ret = clk_prepare_enable(imx_phy->alt_clk);
-	if (ret) {
-		clk_disable_unprepare(imx_phy->clk);
-		return ret;
-	}
+	if (ret)
+		goto disable_clk;
 
 	/* Disable rx term override */
 	value = readl(imx_phy->base + PHY_CTRL6);
@@ -641,6 +639,13 @@ static int imx8mq_phy_power_on(struct phy *phy)
 	writel(value, imx_phy->base + PHY_CTRL6);
 
 	return 0;
+
+disable_clk:
+	clk_disable_unprepare(imx_phy->clk);
+disable_vbus:
+	regulator_disable(imx_phy->vbus);
+
+	return ret;
 }
 
 static int imx8mq_phy_power_off(struct phy *phy)

---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-imx9mq-30169239b590

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

