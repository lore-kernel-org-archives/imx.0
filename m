Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581459;
	b=zZRGVH3R1SMyhbH+Eo+zZXGgJ/la0s8lbbg/sJZo091GhmYcBxbmgfDJGanHCJXesPWZ
	 0LX+b+xMOsZrN7PBItgUXyH/0fY6Wp6swSkIBTXiD4EHw7HkPntdM8yl0V5fmYHHJp0CO
	 mK0n2lEKV/qfsitDZDE32ERgVE9ojyACVQckgFHLaWcmyKAqKYjg0YTj6QK4Vno338EL0
	 cq2VtqpZ8aI8ziRk4b9pYEdIKB4u97GOreGYXf+EkEivIUNxuLW6siIi2jGidEj8XxF15
	 tne7Ok3dBSwegMUTDnphZod/2etQ9GzV/6wYxYGoZwbCDTm3yriRyZlXqOZUlqk8X6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p0LC0sUIzj6iLFfqcqtwKGB2+VgW9jHKFGlHAfP+Aeo=;
	b=NQNayxA6z8faLJQPRkOsAQFoFZqOlaJ+AhVbJgiZP6xRz8epyg4qMCewsRPdx7BzseTx
	 OKr25TPsxRCvngUBjogEXrxzgbG4DI3P5gTvfgqD4fzLbVPNoRU4BlENVVd4TYzLSeNL8
	 RfH2dKGe2nujzg4aAofHLdBWIfpNqmpuAZSzJGnWFSulGh5AVnHymkP1mw/bWH00FsRE+
	 /CPXH4CDrceR1tw4PZtD4+Lmfgn8W8HPARAthiZt6kM50cXHutXyV7fWl5XSegdFGLAZO
	 YxMfnBWs/PxQ5yNsbN8TvJ3wJwW7gR5hJEmlf5TEXKzI++Z4xT8M9s6LQ7DQaoBNcXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmFtS7Sl;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E579606A327
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 04:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E579606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmFtS7Sl
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8cf79c02fb8so300814b3a.3
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 20:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581459; x=1796186259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0LC0sUIzj6iLFfqcqtwKGB2+VgW9jHKFGlHAfP+Aeo=;
        b=dmFtS7SlPrs6lOM9MiZj5hkNVsqcdHsghqFEpo7/Oo9gcB4VZ216IDgi5qugXR0vbb
         txH9lSzlTlpBQ4GBYYtMZjNiqcC90UXhBP2GTlYSUnr9y4tXqlaO6ticbVpfILD8EtQ/
         qZnnSf2uiOgH5z+fSTzu6X7BAnos5SfkM7a3kinrtC7RwWWOTIgjpe6QBfctHPl6aHdc
         B5j9RN0DrM4zMSSyIBpxIt4/pDDHx7cqljf8ytN5QyzhdRse5c/uebycv64ymPWPwmWN
         8b2r11dg7mAyUZppakdrlBBYHiJtuHR8GIsY0/81GYBGGeaAP6dPkNeuLmrE5VHkXofS
         zBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581459; x=1796186259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p0LC0sUIzj6iLFfqcqtwKGB2+VgW9jHKFGlHAfP+Aeo=;
        b=iF1ey1lXznhJ86rUQL1ejTM4cS6oSZnN29IJJMfD6/MXSHlo7zFdauxqMHtpJsn0Vb
         8XZ02tmzcnB6n8lq3pwYEILnov9CccCBx7LJebCv/n0t1JlRA19AtSbOwoN5zI+YtPah
         +zu0RejddtMM0Xdu6UdZWqNIL2pqqy8J8/GsVCHWd25l5Ju1Y3l3gJG0YmYXu3X+ovj5
         zlxls1qAZqvtww83Q7LimkfKbTj5V9OuUeAoKVrVk7BV2B+23zaCiaXkxKUQ8wpeHzEC
         bic4ec3X8FHBqv+AaeByXXWGLcrBj+hWFG3cQRj3G5DL0gn1eNyu0DJLKrr87gD4KSQx
         b8MA==
X-Forwarded-Encrypted: i=1; AL+hErEztbLPx1DxqhrDpvOj1q5TI1R2mYzrgIdKG7TL9wdvRG6Vezt2kTdofRgtKy/axw8pON4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8p+TL/dYBsdTYSFmHdm/7sPqcWZ3yNbuU0atvcms7ZIJNOP6Pw
	OIbFeWPRt0ZOteI1lmp+7yqzmKihTsaCVUZrxi49U3CVKI6+YSlQ2RtO
X-Gm-Gg: AZFdTZeRsnvs2yGr05JJRHeAV63yU21aZajEzpA2lV3qLC62FEO9IbHG4/KDLogbz/6
	02yq1GEzFgcLFlK5y0z68yy8nw6I+dJMXFcbWfquQAzyMmvDKC6EustUIuYme/uhSd+aXD//CtM
	+ecVg/Fak3tBGGmF/7+cJFEmHTIhIxXpokWbZ5RO0KjVvtHxmJgtlcdJxGlHcydIOrXcfI+iWlO
	suXOwqTRm2mzy9+w28rbH66qZw39wv8egmGR30iQkMspWcT/L8+9lJdFnvNA8xFr64ebGsZEkxr
	eX3gRxz/SWbS2j3QWXkBHCHminZZgatAeTOrPi38NXKlg6lWWEoKsOCIsmmDoTAwHOqHN1WZAeY
	UutnSKwZgW4UCjRinr6m4MZPNkJ1ajW8FZOqLEPVtEKXJMvg+eg7ZWuUIEwAjxYB1UMm4vioEI5
	STsETpRGIGc88lDs92Gsd7B+sEXZTTzQ6LhF/8sF2ZO62gbcCQmFRYKLaf92K7Padn8c1GD2iNQ
	Shb0D4iAN9Mv2PsHuBIYarFKNCsoXuDyegOsGE+NIIPJ9q2fcsSCCRqhK2LTQBRXA287XtxqzHZ
	ZXyWDXMcGuMnC/uJESdE0LH0uBg=
X-Received: by 2002:a05:6a00:c311:20b0:8c8:e7ae:5ab2 with SMTP id d2e1a72fcca58-8c8e7ae5b89mr11374449b3a.53.1795581458605;
        Tue, 24 Nov 2026 20:37:38 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c86d821637sm8324761b3a.0.2026.11.24.20.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:38 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 7/8] PCI: cadence: Use phy bulk data api to simplifiy the logic
Date: Wed, 25 Nov 2026 12:36:38 +0800
Message-ID: <20261125043639.249525-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According the document of cadence PCI controller, it use multiple
phys for multi-lane setup, so replace the loop of phy operation
with phy bulk apis.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/cadence/pcie-cadence.c | 62 +++++--------------
 drivers/pci/controller/cadence/pcie-cadence.h |  2 +-
 2 files changed, 16 insertions(+), 48 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
index 0ac980249941..8ed2a679625d 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.c
+++ b/drivers/pci/controller/cadence/pcie-cadence.c
@@ -179,39 +179,22 @@ EXPORT_SYMBOL_GPL(cdns_pcie_reset_outbound_region);
 
 void cdns_pcie_disable_phy(struct cdns_pcie *pcie)
 {
-	int i = pcie->phy_count;
-
-	while (i--) {
-		phy_power_off(pcie->phy[i]);
-		phy_exit(pcie->phy[i]);
-	}
+	phy_bulk_power_off(pcie->phy_count, pcie->phy);
+	phy_bulk_exit(pcie->phy_count, pcie->phy);
 }
 EXPORT_SYMBOL_GPL(cdns_pcie_disable_phy);
 
 int cdns_pcie_enable_phy(struct cdns_pcie *pcie)
 {
 	int ret;
-	int i;
 
-	for (i = 0; i < pcie->phy_count; i++) {
-		ret = phy_init(pcie->phy[i]);
-		if (ret < 0)
-			goto err_phy;
+	ret = phy_bulk_init(pcie->phy_count, pcie->phy);
+	if (ret)
+		return ret;
 
-		ret = phy_power_on(pcie->phy[i]);
-		if (ret < 0) {
-			phy_exit(pcie->phy[i]);
-			goto err_phy;
-		}
-	}
-
-	return 0;
-
-err_phy:
-	while (--i >= 0) {
-		phy_power_off(pcie->phy[i]);
-		phy_exit(pcie->phy[i]);
-	}
+	ret = phy_bulk_power_on(pcie->phy_count, pcie->phy);
+	if (ret)
+		phy_bulk_exit(pcie->phy_count, pcie->phy);
 
 	return ret;
 }
@@ -221,10 +204,8 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
 {
 	struct device_node *np = dev->of_node;
 	int phy_count;
-	struct phy **phy;
-	int i;
+	struct phy_bulk_data *phy;
 	int ret;
-	const char *name;
 
 	phy_count = of_property_count_strings(np, "phy-names");
 	if (phy_count < 1) {
@@ -233,31 +214,18 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
 		return 0;
 	}
 
-	phy = devm_kcalloc(dev, phy_count, sizeof(*phy), GFP_KERNEL);
-	if (!phy)
-		return -ENOMEM;
-
-	for (i = 0; i < phy_count; i++) {
-		of_property_read_string_index(np, "phy-names", i, &name);
-		phy[i] = devm_phy_get(dev, name);
-		if (IS_ERR(phy[i])) {
-			ret = PTR_ERR(phy[i]);
-			goto err_phy;
-		}
-	}
+	phy_count = devm_phy_bulk_get_all(dev, &phy);
+	if (phy_count < 0)
+		return phy_count;
+	else if (phy_count == 0)
+		return -ENODEV;
 
 	pcie->phy_count = phy_count;
 	pcie->phy = phy;
 
 	ret =  cdns_pcie_enable_phy(pcie);
 	if (ret)
-		goto err_phy;
-
-	return 0;
-
-err_phy:
-	while (--i >= 0)
-		devm_phy_put(dev, phy[i]);
+		devm_phy_bulk_put_all(dev, phy);
 
 	return ret;
 }
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 4a96e1869e53..3cde29592331 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -274,7 +274,7 @@ struct cdns_pcie {
 	bool			             is_rc;
 	bool				     is_hpa;
 	int			             phy_count;
-	struct phy		             **phy;
+	struct phy_bulk_data		     *phy;
 	const  struct cdns_pcie_ops          *ops;
 	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
 	int				     max_link_speed;
-- 
2.56.1

