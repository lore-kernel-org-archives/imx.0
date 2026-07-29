Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2223D8918
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356206; cv=none; b=RyLhTjnnnE2xJXCQj9gTKoPgFX5RhSX56njl/3jMG3Xnkp1P7JnD8IRxEuYqR5k2AgDK6WlFLPyzvS8L9wiCXQe9Z4/fACtpDn1Tahe2E1m02Oo6mv1GgkdSPHC+Wn6kRJERFX5ibtl/Wzz2oofpvkTKfhTiCMkNY1MiC483+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356206; c=relaxed/simple;
	bh=9ZSEy/hXahxkNL80qqVl14j3eqshdlyv57jFJSYFCdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aesWesO2mDXgRJPOA1rc6i7PzC9/MsmC7ZEqeSMF1+axollbjviaqJnjEoVZ9spFAv3S97pjKrQOElH4RLdxiMZ1Z9pAFOkWZQAQ/0Z4eS5VdPspQHWToLsuGkMH86KmE1tamWuqpZgr3H+QqCTUV95PJJ6yLvzEtwtPfl1pJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYeUXJMe; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYeUXJMe"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84a2c90e383so81393b3a.0
        for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785356199; x=1785960999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2MYePhYaic04LK/IFxupvhQuV/aMa/oQq96pCyH2OyI=;
        b=KYeUXJMexoasvqjV8F0RuYujrt9zb5MjRWoUsb+op1nNXODXEktCkrFrMsEbyolQtf
         qgWX4fZDBuEFM5XpWsPGX4JU5Q90jlyVqunwSrb2R3X4X40+GMKxbGj8AfSVtGJbmDab
         t7wAQJbTC2xGloiE50KM58Odpnlwlw0iw4033HhEyzimS4DG8TJEdwvBfF2cna9/XIFY
         rPFDl4eQFfMR5nPmodoPhgxDflnkWTHvVifvPjGdd/3BZv8B+PGuRk/NApJMayEuDT2q
         j10KbnMR75+VrYchBnFwFj5Tq5mBrNFo/xTWdf5bSSSLfc7mj7vdurOXhHglQ1FpZues
         i13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785356199; x=1785960999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MYePhYaic04LK/IFxupvhQuV/aMa/oQq96pCyH2OyI=;
        b=chPpM5OHNi3mgQKDS4jFF4MQVTB1dz0PVWYxalzZysVOTUhN5MiG5aSt3aWQz5exzM
         7JMXQOl1XtkTf2ICxYll+TIQZRwA7P07N1fKgQtcLqvI1kIUQ4lIFfKQeeGYuCZYj7rs
         93gWWbWoCl/4ERTVwHWSP5Q1M+sRkcQf9eSWNvkNQMpDp0zN6k3onwY4spdgfPHLWfct
         P2OQPcaqr68Ik8vWs0PhpsN2ZeXvhKwwSMRyI8MzVF/FI6AzXOinNiqz1n+QT+wcxx58
         zrEhRs80tQsh1ARGjYf/b4CxyIhS2liF47SUWrcE8tn/sfiGjbWtT526uhrUCygsKSEv
         sSWA==
X-Forwarded-Encrypted: i=1; AHgh+RqQH42RoJL7TZleJJ+nu8WnFoRabNmROs90wz7QN27qF2CB/vocucIIO8OS/WCBrzIn6I8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyK+vltXMKbqIsDqUND2SgULyKuLYW10IpsteCAF/XaE3Y2xPoc
	Sfy1r7AMtEFYDLUZ6RUnqMBkFb+nH3m8d9zHdd0S84Eu30tnTagwYLZyOFSzGw==
X-Gm-Gg: AR+sD10ha3XpXYufv2E1YZVmkrSqth70dLc+vAOxlC/DlvFcD1pnlTE2a2/T6qQn8ov
	S0W9NxCd95FbNQk7043PTl0Lq1PLEoQjfJrEKgAYAFcG/jC2LBIZGUa/KILwkzGE06AU+prFT35
	IHB857jQyBT5+gk+96NT7GgQ/fy/l0DdeTJsdY61pSsctdC6MtnXwg/wm3XjFhggpKF+zt7czZw
	oVVg04nFtF1FazsjS2XYZ921w5iuiPvj6Re1wKGdHP4u2p2niNNjan750wE2Ux1i0dWjhvIo93r
	smifJLwqPuY2j5BEDdU/WshPBuMS1g+C04V0HycAhsP2/+6j8//zgtMVJ9JaRwDIM2+FcGBB0yZ
	SWUkqY11OXlHV151zcQmARalFiTtsna+0o+7OnZsIxtqNAFF8mkM5tMb/N3KwTvTbppY6XZr/pG
	kDNwowYBHeTARidBg7G7IA46QQ1YzyxiUddYAUxSeflxFBa6uJqzjKqaszAs2poCxn+vwQxVbsn
	YdUstDA+M445UwWt0X8z7zc9PhpdP5XX1/q0OaEd1fT0cSd
X-Received: by 2002:a05:6a20:cf8e:b0:3c0:b598:4983 with SMTP id adf61e73a8af0-3c8e488dcaemr4000831637.30.1785356199066;
        Wed, 29 Jul 2026 13:16:39 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:a913:91a7:b883:6046])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b12cdasm14493903eec.1.2026.07.29.13.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 13:16:38 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] irqchip: imx-irqsteer: Call pm_runtime_disable() on remove
Date: Wed, 29 Jul 2026 17:16:34 -0300
Message-ID: <20260729201634.490317-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove()
does not disable it.

Consequently, runtime PM remains enabled after unbinding the device,
and rebinding it triggers:

Unbalanced pm_runtime_enable!

Disable runtime PM when removing the device.

Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..a695ba31db9a 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -276,6 +276,8 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
 	int i;
 
+	pm_runtime_disable(&pdev->dev);
+
 	for (i = 0; i < irqsteer_data->irq_count; i++) {
 		if (!irqsteer_data->irq[i])
 			break;
-- 
2.43.0

