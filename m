Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9705830C35F
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907523; cv=none; b=Jg0RSLncKX3twDDkbtl4EL1s5FRI3cnUsgr+zEeWM2U5zXRBjeXccVUKlROwsC7FGOgn4iFBdN+VxICa/NtkZscc4Tv739REkURhjDAjBx63txT5qBEMWilo6nmqCL9Xd+3dDXxeucRwEkjldOqMGLp/j52b6V4qsH+fpdDZVX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907523; c=relaxed/simple;
	bh=T/KSTrSwcf413M6648OAvY3x0y9kavIDZn2ShtBOwsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LjasHx301ScyBt9JzkKWydKlCwEUPslicQ39houftBN12ifcmKbmVbAqWj81AJoMZZMFd3DDGDJAE6ACKhezqehgt5U6nBP0Jm9jJkQG0hmGRjyGwLTifwLdLWzzlMDCm/c1xMQwD21pgwRwqNYF6rVc8Ojp5uWX0LEHAY1pLOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgVYFGXV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgVYFGXV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-248ff4403b9so50119725ad.0
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756907520; x=1757512320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31pvuPyzmxy7Nu/xNQn3+yYnNi6oTH3Hxdcf+kkmhtw=;
        b=PgVYFGXVbMvgQDB936/pNFNn0E6egqbRP4oeSEY7ohvH5RSg8uM7h8H74xWBhVhBrx
         yvJ9ZJOd5su0KJrMjWefdeSa103ocLK4f2jHBxNl3yum80RwE7E/uRtDjkGpnliLoSIa
         9/bnaTe08js9HdA0z0eAd7P4q0RRfPuoMTTjTiDUEDSxjaQ0h+FdP/3JZXB2h1Ej3OsF
         suiLMN4I/lx0LUDGTUU5lK3F21oqrup0SiRhgq+mQ0JXhj+gGlhXr7PwA4raQvVj1AvM
         HMfprxXu+8yhXBvAS15nsV0EajULQoIlbXHYog0GyJfYCmkh+CzUaS4jdFv9x7bT7uzx
         twJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907520; x=1757512320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31pvuPyzmxy7Nu/xNQn3+yYnNi6oTH3Hxdcf+kkmhtw=;
        b=Wxfa/MXL2gVNyMVu7nN1mPdg8M5FBV7PrGGv//cMEXpP0IZaAPTzbGPKB5y8sRGAxW
         GrTquEiYHw2frv9yuJWhZHnS3ZKMtCgA+kaJl4pglmQc0+YB8IfQTlTp3lKb+Wf1Akw/
         KWMJFRvUTbWCIzduhtlyC/p6J2xNMhY1MG8pJ+s+MH7PVHBykQdm6xrHAthG2B+EH6CB
         +NhIdt53GsuNSIgjvd0/dNI7yRRoOMn8S3pfabyK3n/GtMQGZAE4NtiIq+e4EHwoznom
         2zvhNsP1+b9RmqKPpjSRX4T6XIsps+vOcsp+qNnsZD7FUSS/Ez3kv/4z+NQRzwJZ5f7M
         dQFA==
X-Forwarded-Encrypted: i=1; AJvYcCWb5kBUdWaPWqiwLKTtIOz4l5DRdiVVswj71cm5XRSjkGhrTPiw4jvTPuKw4Zm1OHCf/Io=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzui6lM9S3z/HGbITAaKAx472REoK4z6Gp5oRvDlZaeRKdJTNIE
	+0SLknhwzWYhQrqXNikg7LA/6nsOVFn0ssbKJCvIrBsi2fNN63dMImJk
X-Gm-Gg: ASbGncsCNnlQNZGJUSQMlH/RaZ88QwpxeiqYMRoafbWtMyXDTZBDiIdV5Xy/o9jehGm
	gN9zjipMQP93IeF5Wi+e9r6+YxsMEc83w/NDQ+LliUH7bm8f6vTQGY8Ax2c8iCyXjRWwDCm0af6
	f8U+1FHXv2JXflexSoqlS+uenOETDCSbaS4e4zoLJ7HRVd+YJy0QpUF0XT7ZZr3cEyMvHGaKY9e
	6m8G63GUnFUr9abII5Xh/neOnrqRRpUJK6V9CR4rvd/2ra8FtK7o736Se+XcFdY9rWiTGReF1G9
	4Nd8hlerIPIdo6LpiThBLC2QigJCZOH7h3Qs5DOCbJsJwbjUBp8DkfJfn/bu6XLSHfqZEBXMcXk
	rDiAfnjkcnm5DZ7OucCvLKmcT0sVuxJcrE7XDEA0WkA/i7JFtYLPBudBJRpnK8YqZ/v1XkBi67T
	TapOfXmJn0Uu+tfOnfO0oBQKhvd0Q25Ky0x0fxePuv4WBlfK4kf8FjnLw=
X-Google-Smtp-Source: AGHT+IGPXxKq1vceqgwEfnjmmFK1BX/HaS7d7j+fXNMkyGVFiTc/r6Px77JsUZgpTvhRMqRYHCDxOg==
X-Received: by 2002:a17:903:350d:b0:24b:299a:a8c8 with SMTP id d9443c01a7336-24b299aab5fmr68322845ad.20.1756907519733;
        Wed, 03 Sep 2025 06:51:59 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.22.11.163])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24b2a5852a9sm40585005ad.150.2025.09.03.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:51:59 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Trent Piepho <tpiepho@impinj.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] PCI: imx: fix device node reference leak in imx_pcie_probe
Date: Wed,  3 Sep 2025 21:51:50 +0800
Message-Id: <20250903135150.2527259-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the doc of of_parse_phandle() states:
"The device_node pointer with refcount incremented.  Use
 * of_node_put() on it when done."
Add missing of_node_put() after of_parse_phandle() call to properly
release the device node reference.

Found via static analysis.

Fixes: 1df82ec46600 ("PCI: imx: Add workaround for e10728, IMX7d PCIe PLL failure")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 80e48746bbaf..618bc4b08a8b 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1636,6 +1636,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		struct resource res;
 
 		ret = of_address_to_resource(np, 0, &res);
+		of_node_put(np);
 		if (ret) {
 			dev_err(dev, "Unable to map PCIe PHY\n");
 			return ret;
-- 
2.35.1

