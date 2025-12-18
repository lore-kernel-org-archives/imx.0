Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D0C1E98E3
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 19:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766086885; cv=none; b=meCMYArIBtlQRzZgUG7a53n17q8Ti8uu84+PXFWuXVtx731XTNbQh2W7w9Hd1em7YJfBZ2KUS4bW+CeSkPEoP114QaipI2ZOSx5GDptPaoRVReHucMJIWYg8Sf2cB5nvhESHS9YVqllpvSnplaMcoRChIGRn5dVpOURC8MUUf7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766086885; c=relaxed/simple;
	bh=RDW64CupgaSddwFbfaf+AO/GxmMOa1s4D4VRDBTjiJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBwxm+kamfA0Fv3OTPVH1d80C8bHACPv+FOUl497/ln7q+WmF6N7N/gvAH0AOrvYt4vBWRLarybNJp9afXTHkta2hyK+S+sjrWIBC1Md/Jgnn33HQEwPf31COzluhI2TNJ4c/Q3K3xAOPWicJsoSGGauXMsfGoJkAM32r7S/luE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaqKt5Fc; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaqKt5Fc"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so807639f8f.2
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 11:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766086882; x=1766691682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLxs0lQBx4sta6z6nnKDj4vKVTRti3i1pI2/aCW6qDU=;
        b=EaqKt5FcPS56xiclKvSi4r7yziWXM49QHNnfZusDy3cYnp2kapRKk/VQUGvU97PNrP
         dAQTd03sDq3Aqi0i/VHSiJGe/KmF43HwOp8jM0Oe6xhiHoAi7OwOUW8Q+KoTXZn7zk1U
         NcOsG+rIJNwDsJzRt8lg3vSNwIq7wBH2ofGu9lAsnAHRwxLUuYpsPSuw6CUr6tuDY7OK
         4UTQlXAuIiG7ymv6v2GqWuPRNx9cXNd5huvh3Rjq5sZYe8gwgr5rITZnVDs5XQb0IYjC
         RebuCX74J8+lgYMTYPa6i2Ty2Odfr4MZ82I21L7KG2SO93G7hWK2S/A9J61Asj8ZQ4Yf
         K+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766086882; x=1766691682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLxs0lQBx4sta6z6nnKDj4vKVTRti3i1pI2/aCW6qDU=;
        b=GPHFnysefZ58bU6TohKz+CIqA+tiuPJsP284HWkPige1Y5IV+GTc2HQzUbtDBpGvQj
         IK2RjDZ1ofhkHuyddaYlI2GMnqhSSDtDW+JozTltCaU/EoOPit82isD7GceUXrvKTfa3
         rctTqTvcJkfI9Mg0hz5uQq2SddtZYPX/gV7iLR0IV/CqKPEH+dbbka0p6Wk+6kU0bHsj
         AmGUIbj5s3YQzfSgnmHnxkOnosb5eNPiQ3rMIZHE0fVqPSFnuuAqfTJ4xn/s6bpGrj+G
         9otBuG+P/pY7LYPjDFQqYvDx2xxxa+VIthID1Te14zi5Bua2z+F/TmUVJz50QN+jhxtw
         uz6g==
X-Forwarded-Encrypted: i=1; AJvYcCXiMOj64RD03slUymCYcW3q5KFN4qSMGf9WMmX3VfMRh3IsBr+HFvxrMoqzJhIFHILdPvE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtOZrYH705SDWF0LqAgY+Na2F/GvjufdFgZ3aCJuv7VubX/jbE
	wmbnn+eyBaTmXs1b/9B8gwmTRswXJ7G9UozLTpIXX9IQ6vngyldyoY5F
X-Gm-Gg: AY/fxX7+MdxKyhF+98tiRbvMkP8dw79YFrpcAHXpWLZnJ6acFq2075INSBiKViwo/G6
	o2fpchwda0RkJzDH6DQJopxBqIb6UBKBBTbmU3AEr83k95yFYNcf1T3Ai9vdzOuoS/yL58HjeZ9
	ibT/fPry5laiNGxLuIlx+NAqkmng2kZRhatBRF9fDSxp8g7Q5Cc/81eaCiZn4MhcAGw1H9q8EZE
	/eoB4VydavpsTi1IKW7u7Z+cyXaHzXs+DDILBXm6vIyZoIV/E/1Jl5U3NL78m2bZZHNRY1ntroJ
	Q/YfRwWJiGAtdS1S3S25V1jHPsdCaeDVNe8G3z/p5TtUEgxzSGfOCJ0KeSJfSKMSyJl0FZ8zC0N
	wmtBGM6L/xb65kHplWj2zW41wUmHp5HbOzH/t/FbFfr1iR7K0FbjA6rHF8DYbxyaw6JN2HucVu9
	lT2pQ1nbBL+VdkGSPhpgo6YT9qslKaqbbNL0hJXkgj0qeP0OFLg68ToVdXQDaq+zxw3LaXp9qjS
	UL98TkdO4qNnx4=
X-Google-Smtp-Source: AGHT+IGQAnLgRUsVVnoRwQFGOEHR79qz4dsFP+YsgAFKs+KUs0BWTkYbN/tIazS3ji6D/iA5kpDA1g==
X-Received: by 2002:a05:6000:186a:b0:430:f301:3e6c with SMTP id ffacd0b85a97d-4324e4fdcd8mr637543f8f.34.1766086882068;
        Thu, 18 Dec 2025 11:41:22 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82c5csm556586f8f.21.2025.12.18.11.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 11:41:21 -0800 (PST)
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
Subject: [PATCH v2] phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL field before using it
Date: Thu, 18 Dec 2025 20:41:00 +0100
Message-ID: <20251218194100.365269-1-stefano.r@variscite.com>
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
v2:
- Improved commit subject as suggested by Fabio Estevam

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

