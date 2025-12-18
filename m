Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F51238150
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080211; cv=none; b=ummG0w8TxEJP835FGqE7jr5+4QnlSEnvk3t9sQrL1WYQJQqz2kv3eVX50vGfEEb3lJeKlNhYtMeqzEOMsbha7d52DFyNXg7P5CWu+KbVVM4+L9FetvD7DnqHQQRXznnF95Gp7vrMmkUec+iF3xq6zNLiFwLQ3j7wIqLOly/eJr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080211; c=relaxed/simple;
	bh=rvJzjLErjW7vPxDrpXzXer4XNOLt+5Lu9/qPOviwYT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UwZejnolB2Rs7wjhrsDXYMqPvc2PIB3MdCV53xUglOTrkHroJvOCGH5UE2atiXR1TNeyuoWqoB7bYwWAuD1v6jVInvAfraqnym3Tt74W1P57TKiiiSpdKsGuy8bNpeItxk9jq8yl+Rdjwp1DbSrh//ZuDiZ3BaixatIWMXztAD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJEamhCR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJEamhCR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso449968f8f.2
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 09:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766080208; x=1766685008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AVw7T5bcH3lvfv3rJWK9YzPen8SSd5iHLxvK3gngGo0=;
        b=eJEamhCRA0lKfF18kzaa8Kvev0jxdsDIO+d7KTlrA5WJKLXvn6eHded94/FpoGN1EH
         zuWRHPBfmmdnQNshTfyk/QEcj2JuvgeAFh3To5jHPUB3doZHPyG2pCDMWPRst1hfWU/T
         qafzLf/tZLjRvyXFnA9pY0PbtEczYBR6Ssjch7p5bZbCWeZQaLjxcaJdQzNJ+FbRanf2
         cfd/zU0kZrxvRGHjLuvZYdIFyPvzDN7bsJY7P5KoZJzlJUQmRQlZ9ThgkmaHiqRsmNO3
         XeU3RFo5gKg1BwCy/+4bGVDf25sQjtOgYtjBRJqdymoXFTgzpfvdjLp9SLtXumGJ8nOg
         ue9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080208; x=1766685008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVw7T5bcH3lvfv3rJWK9YzPen8SSd5iHLxvK3gngGo0=;
        b=Ee7ZKIKNQ1tbOwnh3zMOYduNq1LqWNMQcLnoBkVd7GZHnk0ZO0tXkt4GePjTH0UVFV
         TAD1d3mas4y60MaWj/zIT2bFbI8dBbNiCmJVRjZWhTTOy6WxTCJ/AsErwjR7m+o2/cL+
         MDAiV9BuHuUgoKnxWiLVBSV3cgZm57DaKSpdQwlUpfYwouhLx50Sx+YdDBe5zP4SKl+G
         +izunIa0nmOvXMx9Xt6YcQt7hWJVYcC4C7kHytXJZz/SB4GjjvR6hurMt1yE/JeYuHae
         asi37wcLiDu336LX2bMhTbbng2dJvugivrQUZxjKmbylQhf2D0wRT97+/+7WG5rfq9qS
         w98w==
X-Forwarded-Encrypted: i=1; AJvYcCUm2+dnI4nZPs6BsqtOlkQBxuLpPSpCmpixy1eozjwltZayFcO9LyShsoUYZqhxBd/WMgI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh+3EyOpbBWxJ5cmrEAiJodBu+e47RYoO9BbSTBYH7iFNThsAr
	vxUBgT3bdKBpmH8yiTri4cQjdFyWWNfW14Zc8LbQ+ddrNiBYrN52wP7f
X-Gm-Gg: AY/fxX4QgM6Vgkp0EOy2l6riWXrPXd1pPODtnrs2s6CsgjhAXSLe70Zh5uKoroZMxlS
	kMP4oO99W4Kh+wJqQqXijxsyp0pIu9dJELDlowHBuj5IgSFVBcNBSK2qiS29KcyM+gBNx5jZQZX
	Zb28C7fTkWvLR910bycWe3WbcsVlorYN4nac7NjKacDsSFDTdIIPje8Y3wm+DEJfWnon/i5EqHe
	6v3hz5U78THyEmCLrQFwMUrjQ7rLiiRdN/dhXlQ1odhZ6o+cFs8DM1k0oiK7aEnM6CB+hhLZo0l
	2nuDlxjIrwOPAU5nEC9SVy735wZzlLf01m5kXQlXByyWNJrHwZwjNinrbdZreCdLHwCvPElpkDF
	47CvLP+k0BS6wo0YGR/zFykM15baTUOpRwIYVPJJqh73/wDTnK25S/sNumBmB9FUZe0M1h3iDgz
	wr8347Fx4QkgC3qM5ifTqDGzxUe3PxJOPW3APIpIzscd1gga2Zjvqz8+w7DV0QaVvP7xF6TEF6V
	z/gdClfclI4d87uE4SgC6ppQg==
X-Google-Smtp-Source: AGHT+IHkrVsVPpnhIf2cWnEa+19MOkN09a76xidWg9x92oZBtd32naBG20DJoni8nBJ/zdrSoqP2Dg==
X-Received: by 2002:a05:6000:2886:b0:42b:4247:b077 with SMTP id ffacd0b85a97d-4324e501629mr374640f8f.41.1766080207883;
        Thu, 18 Dec 2025 09:50:07 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82c5csm92552f8f.21.2025.12.18.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 09:50:07 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	j.zink@pengutronix.de,
	linux-kernel@vger.kernel.org
Cc: xu.yang_2@nxp.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com,
	haibo.chen@nxp.com,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	Stefano Radaelli <stefano.r@variscite.com>,
	Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: [PATCH v1] phy: fsl-imx8mq-usb: Fix PCS_TX_SWING_FULL register configuration
Date: Thu, 18 Dec 2025 18:49:20 +0100
Message-ID: <20251218174920.359282-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clear the PCS_TX_SWING_FULL field mask before setting the new value
in PHY_CTRL5 register. Without clearing the mask first, the OR operation
could leave previously set bits, resulting in incorrect
register configuration.

Fixes: 63c85ad0cd81 ("phy: fsl-imx8mp-usb: add support for phy tuning")
Suggested-by: Pierluigi Passaro <pierluigi.p@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index ad8a55012e42..9458b6e5fcf4 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -504,6 +504,7 @@ static void imx8m_phy_tune(struct imx8mq_usb_phy *imx_phy)
 
 	if (imx_phy->pcs_tx_swing_full != PHY_TUNE_DEFAULT) {
 		value = readl(imx_phy->base + PHY_CTRL5);
+		value &= ~PHY_CTRL5_PCS_TX_SWING_FULL_MASK;
 		value |= FIELD_PREP(PHY_CTRL5_PCS_TX_SWING_FULL_MASK,
 				   imx_phy->pcs_tx_swing_full);
 		writel(value, imx_phy->base + PHY_CTRL5);

base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
-- 
2.47.3

