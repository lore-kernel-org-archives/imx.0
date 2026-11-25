Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581440;
	b=GYwK/mmOGQ3AfKMY2FwXtPdbmZmxE5haNENCF7kt0dD4UwFIMG/FL4eo7MRD2XxXgttZ
	 R9GSNVHvh/kpZ79PFPKhZCULBKep6QHHqfMruoMlgqHMsyW+SPbU+7vK+42e8Ve1R/Fcs
	 SZjqIao8cSv+CK4hrVMKgB8FvuJs76gjnZ/o3H5TKAHykccYOSywDLibCcILScQzy1Y9a
	 26r+tk+U9Jhv5iF2BJJoyyERKmfJoOgczWR9ELuwYpp2M2ZYn/GH4gEuTA+520TE7Cj57
	 wPjUoxvh351n6KZnxUB90h2X/kZeW+n+yoSlt+axBe2X/8B5Gz6ucsPKMi/S1qTfXFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=;
	b=xWtsCmgzzVnOIX99GDHcvP3xa/Nbj87zZHdsWeQj7gDMHtNZbC9J3YCHNeK+WxGNdWY2
	 9Y/4uBtwpKQh88QsBVFkq5iMvrbnKyVCGXwwcdlFpjMru3S3ni41ZOwwp8QZkS3wPjqFe
	 /At2QuQSiD3Rw9ppYpr6gUHVYNCqpj95BpE0aFgb+N9zJYA/TyDNyFCaqYex7YCotBlAb
	 YLSJa9f2EWIA3hx1qCYswcRn3WuhwxbZE5+Ui3vuyU2+SjcN/CwJjCSUs46WmJOatG5Pj
	 QhhYeJ9g7h3OgHaGHvgsengwqqAX9bhgsAQkejNc3b3sOrM3LfHq5T5jqsvkafSRJOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cwGdV+ID;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25242606A32D
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 04:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25242606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cwGdV+ID
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f02ee04378so42050115ad.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 20:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581439; x=1796186239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=;
        b=cwGdV+IDDlV5febtMUO4Pu4TLBkV+udJe5qU0cX9Oy9fmd77vBMk1wSz3nl+cK4P+r
         5ntEfSaVp1aRVdTj5XTF0p9QFIgm1HwRDtBp4kcj8phZaMVN3LAu3zQ7xyHndvgK95q9
         FEPXdme7hzj+2EKzEwpsTOWPjcWBtZOeFRQ1yxIKsAmH38Wfo3IA1dMK3nZi11/B3mNC
         lJ/GnYKRsPKQY619UbSbynbfCIOT1TwmRAtf8VKULCUB8qUaGBft0UKdubfNAtUzBjcM
         OwTBcFzlBV4eCMYCcVU7Urqw8lUvSnaRXHgIu8JkkqYqpEBPtMPpewLRFjLNE2YspuL+
         F36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581439; x=1796186239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=;
        b=Jx+oM5F8MZwPCaE4XOGXVNh8Y/mJWnjV3u5YchR5yzSc5N8TSi8xsFM880p3Ish+5s
         uhXmqJw7TASs8j5iyP47SIA0SKjUej/4bg1lUVyeAOz2wtScGaUGzBQLp14V2s7F1Dw8
         pAcpfJta8I2Buqwe6fbOk3yAn3Zao6kvQSwz5BDHlaZ9GoYd4qd4ou91wBm3neIcdflO
         /yk+CnnGu9ouNdMz/k7F2IO2SQHGVm/hBtxpg20SUeB+sn39AALZmKDU97KUnvVEVsGU
         mho2uwFTg7Y7uG9DcOeLfBnKW+H1zGu6DZV2sYaP88kdf0qoV0m1Vtc4k1hHX22TNy9P
         cyJg==
X-Forwarded-Encrypted: i=1; AL+hErExFfdADmAH7w0N46v+wtrcTRsUSi1R3KDHZhzSYGV3WrK+XSwXgm9jy4NySUsHoFVpDTI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/gNXNxwGhAq4iC1i+Th7VuDA4RAaiWvwX3nE0cqcJqIN7Yjq4m
	H30EmVeAXiM4HTHcgp8wl7z5EPfo6eMm446TbcGUOIFaZHs1fUHVCXqF
X-Gm-Gg: AZFdTZdGWaYI2V0PG3VPD8VB4NpiPSuyC4rBO8x71QTr3R2Uv3dDCcX6wRrwIk6fiwg
	1F2sjLVnXSYYy3CT+rx/ksvDm1e2TNsCuCpCdpC6TI9t5FMTMUap2Tn4gswSHSeGvNGcyrRg3Ou
	aSB6univWtHoM3eCV/FyluZcCnO+ic3ROmT006rnJyMg0TxCANG8R+b88Eezsoh5QU1VbGveRAS
	A6z/+D4Jo9CDU5LDfi4L/OV7sIAM+q8zcqbvAPSq4RlU8vq2HsM4HfblVVuwsF6+GRyxQ7t0Hfo
	gU47aSJhNMq/jXPnMgFSoJKb8UY/mJlWMfMZOcpqWEyAEyrLtx9ddBnR3F7DT4AfXELrX3VLa3W
	DHQ8mTb4svSVA1CeAgtD4oeD5qmRufRb1z1UtCwutcLahAANZ53ALXqnXYC/x7OcZsj5xF4uvcc
	Ka30+Cmvo9fkdEHoDGs5JgHLIY/fGqMStgvJv/gJUWSEQuiWKCwlAtbfydV9E2GpKQzHRq09S0G
	nU9Ohyb1JjNs9/P1B6XGysxs7qWsslDvD4CSdjAIbj+GRS894BHwNoQwt8BLabxgP8TUBGECmdO
	/n6Ysx3RNU5Wd0Axuv3juW6y2/Q=
X-Received: by 2002:a17:902:dacc:b0:2ed:472:b9d6 with SMTP id d9443c01a7336-2f03efb1397mr182475285ad.2.1795581439561;
        Tue, 24 Nov 2026 20:37:19 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c72sm78614345ad.54.2026.11.24.20.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:19 -0800 (PST)
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
Subject: [PATCH v5 1/8] phy: core: Add common helper to add phy phandle device link
Date: Wed, 25 Nov 2026 12:36:32 +0800
Message-ID: <20261125043639.249525-2-inochiama@gmail.com>
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

It is very common for adding a device link for phy phandle
for device managed phy helper functions. So add a common
helper for future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/phy/phy-core.c | 46 ++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 597e6b234f5e..b7550ca37e66 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,6 +606,27 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * phy_add_device_link() - Associate the phy with the device
+ * @dev: the device consuming the PHY
+ * @phy: the PHY supplied to @dev
+ *
+ * Add a device link with @dev as the consumer and @phy as the
+ * PHY supplier.
+ */
+static void phy_add_device_link(struct device *dev, struct phy *phy)
+{
+	struct device_link *link;
+
+	if (!phy)
+		return;
+
+	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
+	if (!link)
+		dev_dbg(dev, "failed to create device link to %s\n",
+			dev_name(phy->dev.parent));
+}
+
 /**
  * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
  * @args: of_phandle_args to the phy
@@ -805,7 +826,6 @@ struct phy *phy_get(struct device *dev, const char *string)
 {
 	int index = 0;
 	struct phy *phy;
-	struct device_link *link;
 
 	mutex_lock(&phy_provider_mutex);
 	if (dev->of_node) {
@@ -833,10 +853,7 @@ struct phy *phy_get(struct device *dev, const char *string)
 
 	get_device(&phy->dev);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 out_unlock:
 	mutex_unlock(&phy_provider_mutex);
@@ -912,7 +929,6 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 			    const char *con_id)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -927,10 +943,7 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 		return phy;
 	}
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
@@ -982,7 +995,6 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -1006,10 +1018,7 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 	*ptr = phy;
 	devres_add(dev, ptr);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 out_unlock:
 	mutex_unlock(&phy_provider_mutex);
@@ -1059,7 +1068,6 @@ EXPORT_SYMBOL_GPL(phy_get_by_of_node);
 struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -1073,10 +1081,8 @@ struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
 
 	*ptr = phy;
 	devres_add(dev, ptr);
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
-- 
2.56.1

