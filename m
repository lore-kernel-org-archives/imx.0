Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DF82E3FE
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 05:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103468; cv=none; b=nRwFGXqTfbZP9lJwcIFc/pf5ztIsJ2UF8/pudZYmzmaTJm56+WVYs9fHAQsQNj3cmLnFzqvnXqMy8+mZG/32dX7RbntalJYh/SsR3BqtL/GJdZcaHWsKdM5+J3QdaXQbclKfoYF1ufA95mCx9aCAN0fY4PQE2hqk6478iiHGCDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103468; c=relaxed/simple;
	bh=op8zp3xtqZK1y+5EYbArVhH3q3yVDjwvN7ve9EQ2nqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hRUhywM0mkfQctSt0KDFD/7CO8JytmGESiQTtHlply8w54fj/VDMDSMbKshSdK6thCLggWYwgmfA/1b1xh85GI05tBwnVahKzHsU3MXNQ56WHyoUOBPHXynzeWDrhp6IrRcrM/1K3In+S4eujrCKxCGRsG8LHRQxZXXjoZMQG7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZneD4KGf; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZneD4KGf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398e9698a70so561055a91.0
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 22:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103465; x=1789708265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMlwh42zfWxw3I8aSGFHE6JsCvmUNQVYKp3fX73TBuY=;
        b=ZneD4KGfiAb3xD63OjCEM8VlIbddvp1JsXsHPvZ2PcylDi+CG2pIhTu9gG6eeUKeQF
         aF+4pTRSa9wjqFdlNnyCakAUKT+z741LstuQlbT/lgvSgbi+qBxaO69mwAyqOMblnys+
         QEkw34ECdr6Lii7MtBtFlnO1O8JoN+R/eF2KP+rTFiTzZqmZgDdgwIqZeuSQBoBjhAMF
         kK4UV3/KHIy+H69QLnxlOYoA1LsHOeRBVxwiRTaZMoskdESPchQPf15dAVbOxcVc91Cn
         FkFdDNPnIlxz9ZtFqfD/hpBs+/1zJz3fr1ug+TsdzB3cFpSzS0PcJuSsm8HuG7LSWBXG
         26Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103465; x=1789708265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMlwh42zfWxw3I8aSGFHE6JsCvmUNQVYKp3fX73TBuY=;
        b=Ht0I4Twty5zjLcqOyufSsaryBNMTopU1SsfjpWhwpPd7yA19ubTDQmq4H1qLn06PR5
         Z0Ulak2FyrU86Xqe6kla/WNL1nj24gDnWBHpDwg2+7a8n6P/QpkAvOXVMgt2PDKjiFMc
         I453FSk2L+861AocLHcw46q1c3nQkZ2A6WTTrX/hXrDQw/K+W2wFGH7Z72+S5roeQBZP
         t1JGgwIENDLbhy9FFUHZ7pmwA7Xrwb5DW9Rys2+ceuThPEtZlrjiCTor33PVqZjpOOKI
         XgUzfil4r94s+1mfU1Rdw7d5mMcXzlLSaELpb3M3224EUxrWWNnyBxHi8mj/DdOWOVY4
         jYPw==
X-Forwarded-Encrypted: i=1; AKwUvByBTGHSM1zHBEVtVmiQiJSyB8kk4hpFTI2RKIDycKV6+LiW42+5XqvGCxXqx11ScNNLBKg=@lists.linux.dev
X-Gm-Message-State: AFuF++k4OtgZmwybgBO5WArWCxwCXMSatJORJ7pO+AOWaoW/QnszoGgf
	jnulo/9iA5GZwshVyxbIMUu9e9Ab+nrgG+4UwoaSqQhct+oCWpSgHXAE
X-Gm-Gg: AYBFou1umt6D+EshPyMtZWLhXnzuY8eQFoLl53zU7R7XQch/KdVxWP/gu0Ki1KezAP4
	9mrQMcoBE9YR7wevx5z/1qWafzlMOqUVyBqWS8FF/uf0UMIpIZHLT8lO2fJ3wLcIIIMeYYsOy+S
	d0oKrV8VeAu0JsH4RELSixOFYModkMGcPKOK7f0wlrAh+AbsLN5G4sKdAqZSP5c/hDPO2oO55ZG
	u9gV04CVkX4YpzN5WhLnTNgbVlkfc2ffstBhD8b6XZqf/Tq7joYhrN7Vk7bAV0RR0r8s3cUliHl
	KaKiqdbEuVjZLBJBUM4OumX5J4MV4vaOL8N2DBe+BTuyJEG9Jpb3613luUxp8MAyLt46nIhbiYp
	83rbTylnUIjgqA+c79QBD7EojGd34T+yUbphJBozOxNWWL/3UL6vczeDrHLpQP6R3hOqF/c87r8
	nuVegScTcRrbUOxFRs8tcVmWfClcs1NN1z/z44+HzYn1s0DxyXkeTvwvdZmgEiWWPyaCoXQPwOt
	hGa7I/PeqxC+lfoh3uGbBCoOcuCEQHcQpvOS3baEYahr6N4irh7SO5uetZyxpnx9JNwB+gYapsA
	M12AHIYTjZB7+Bs=
X-Received: by 2002:a17:90b:2641:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39d9c352a63mr4011103a91.22.1789103465343;
        Thu, 10 Sep 2026 22:11:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d995a42a5sm2512810a91.17.2026.09.10.22.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:11:04 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: [PATCH v4] usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name
Date: Fri, 11 Sep 2026 12:10:43 +0700
Message-ID: <20260911051043.15962-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_kasprintf() can fail when allocating the wakeup IRQ name. In this
case, the probe error path should shut down the PHY before returning.

Use the phy_shutdown error path instead of err_clk so that the PHY is
properly shut down when creating the IRQ name or requesting the wakeup
IRQ fails.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v2:
https://lore.kernel.org/all/20260807065619.30604-2-phucduc.bui@gmail.com/
Link v3:
https://lore.kernel.org/all/20260810093112.47807-2-phucduc.bui@gmail.com/

Changes in v3:
 - Use the phy_shutdown label instead of err_clk as suggested by
   Sashiko's review.
 - Add Peter Chen's Acked-by tag.
 - Add Frank Li's Reviewed-by tag.
Changes in v4:
 - Rebased on top of gregkh/usb-testing.
 - The ret assignment for dev_err_probe() is already handled by
   1db5c6b0b983 ("usb: chipidea: imx: fix missing ret assignment for
   dev_err_probe").
 - Keep this patch focused on the phy_shutdown error path.

 drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 6a17b22047b3..edbf9df9b8f2 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -533,7 +533,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
 			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
-			goto err_clk;
+			goto phy_shutdown;
 		}
 
 		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
@@ -541,7 +541,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 						IRQF_ONESHOT | IRQF_NO_AUTOEN,
 						irq_name, data);
 		if (ret)
-			goto err_clk;
+			goto phy_shutdown;
 	}
 
 	ret = imx_usbmisc_init(data->usbmisc_data);
-- 
2.43.0

