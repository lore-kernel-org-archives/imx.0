Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581464;
	b=UPT8u935N1gT0yExLTxAjRU/yjbqBwBEIlLwmcC/9q+0VTAF/qt3q1FTsSirZLWLFYXl
	 0yJvG+BtKC3i5aPCSmQnCL7rm9vIncTx+CzXgm7bYJwxlwaXDqrOj70ObP4S1f3b27CmU
	 KsJzMBRmdWYOL5J/F8u90TPyt17EQRPEXqD5Kb/VVd1rmnP7Oo/rsc7LLXLzghJtU2+Gx
	 tUkYwfeg3zqWLB1AaNT422eRrVOawLL918yigem80L1l9U77dI5kPTt1iG+LPc+BhW5C+
	 zMlOi8xGrFrx4rtbU1RzkC54JB0N4F4M1STMalt6nDnjalHg2CikzhIv0CaM0GaWJtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Th0U5TzJmX7EaDDFA+PHgDoYo8RCe0k6TY8cW8gRTLA=;
	b=wZ6u1iLhoNVDCOEJ5SmXePja3UlDN3Sb+uIocDmSiA1Jt3f/mTYeiQgQx0ih81tirVoZ
	 yL7HtlJut7r2FV3KEjXWLGDW12JwAIrPUPkb9wDzTCRiFTrI8audpVi0QdHxU7ibpXoka
	 GVjM/lg2Ru3WWuApDelMJPC6c5x8RUW0qj9Uwsyna/1fbB6jzPXxoDvt+msBeGuXAtuYp
	 0akJt2eLpGRj0FGS1uc7K93zQgVBTHohil4Ecu7KXVUXWJga62Mgt35xOM2Rwg5VJOCW1
	 6Pxh07wMG6lgvJg7lOYVjzLdClm8ZfkJUg47IILJOxtBfJzEcw68nXrVfiWrs9GAd/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GyFtl3ZC;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BF2606A337
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 04:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BF2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GyFtl3ZC
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f046b0adc0so29223465ad.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 20:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581462; x=1796186262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Th0U5TzJmX7EaDDFA+PHgDoYo8RCe0k6TY8cW8gRTLA=;
        b=GyFtl3ZCBhvLQo9PyUVwsnQ5sOeVbzAw0I0I25wVSp728hNiVMJKjpxW66RUKBwZCz
         ELOM+BiC7VhRj8ca2Zs6gpgK2ayXSeBIAcs/lFY1hxwtK64bel1gk/ChYeQHj5hSPNYX
         d2Y2N1qqCQ1AulsTb71h9geivh01u4VhMsZFinWlsSk4+0GF2ZQA6YKmJt5YD2GNtEzB
         v5KIRhrc/OQtXridRtpMUeLxeyRXB2RMj011IhdaYQmUBhzDTlbW01zYonmFRHC0BVTo
         aYsxPB5G+xN7mGLQurTXORym7GD4dUwpmncxqyptH6wH/RmkvnH86qq86EzdKslE8Esy
         8CEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581462; x=1796186262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Th0U5TzJmX7EaDDFA+PHgDoYo8RCe0k6TY8cW8gRTLA=;
        b=bncloocMZsA22Wu2/BIVmWWVX9GeHjoL2nB2QVJFLa2jYAP2Dz8m8NfT/CNVaey4xh
         iWgm+RWjGgNQVPH0F6NY8bifXK0SA477sAuvi/+CZl25X7oCznEkbNqTE1O1V3EwuTQB
         v2yuaJ7hrcO8/88m7bm99KV6E4isHOYLjL8rx0rydT6ul3ECBZT/vvPLTaUU3CZbMirI
         r9Dk9lWoVc8JgCjwYvvzZFrg/kiewIiob98zDm96KZWReGFI/1p9ipHhnDu7It7WJVUF
         za2B6NiRFFbshywTNB8Do9lAQ/Rt+usiIeqhXYsDVTMxCAEBIa93i9kZF+SceL0Tikx1
         nwVQ==
X-Forwarded-Encrypted: i=1; AL+hErHMhB4wCrrysepPrP4nkBbklTtABE242jRspswJU4pFCL0wPO/2Rq8LD9OXeKKts26rnrE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9KNf/pzcWjXbQrNhTmMQTdPBGt5YPDjipu1MJwyxvUzbJFgDJK
	FPFqH3q8JxU2iIwT55ms+ScPf8T/B1uNLrpA1/G9uWpYYkzl8MRyT4mo
X-Gm-Gg: AZFdTZd9xCL1JxfLmWObL193sKttUVQtoBxYQJTvnxM9kyfb6wkuPiIka1meS8AhP9Q
	qdqZQjPvX/TKWMkUAz9UBzdbpCqFYKXUfrX0Ekt1y0j+jjZk70e3yY+MATzC1ewlSngjzs/5hm1
	aihcnqjvbuGVJgishjLycQeo7cFoQaa3aJNVS7iFHxxdxIqPlkzv8V4gB1vNCpIlGqhACsiEIR2
	A3bTE5La8c4mg/XOGe5+8mdm6zyirlQ7oyJ5SBCtgnD62j8X7dUSzIr+jXm5In/MpQ0syhz5IQH
	Gafv2Q7EubEFy0tusIXzgsX1St443PiFFvVH+B7/Cv0wUiahHaUa9BeZbbpnH0hdw9J2kjINLr8
	cisLT+vVPnPJvJFQsAd6UaaNJ11sLesF9iO8j79yYZ55S07uAHGdnxQW/3aim2ayaSDqtIWZw09
	CMEFhm2RHwWa+odunhZF5rGYXh0xixkCBGznPWDYlMofJ6nHYA5d+bGfJI3wskJ9t2m0gnEW8PX
	/HzYzk+AjFq/WGoTCGGDf0pLZBbU0ZS/JvinwOIXmYPQ+u06jU2XvU2wChhmNYILAAMJYjnxDPx
	v2CuVaQOAZbPd3as6LSM3u6jlN/6AuVLPRN0jjqF1ZNoTe3t
X-Received: by 2002:a17:903:294f:b0:2ed:630:40ad with SMTP id d9443c01a7336-2f03f11826cmr93907705ad.19.1795581461579;
        Tue, 24 Nov 2026 20:37:41 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ad2sm78350235ad.16.2026.11.24.20.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:41 -0800 (PST)
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
Subject: [PATCH v5 8/8] ata: ahci_imx: Use bulk PHY APIs for calibration PHYs
Date: Wed, 25 Nov 2026 12:36:39 +0800
Message-ID: <20261125043639.249525-9-inochiama@gmail.com>
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

The i.MX8QM SATA PHY relies on the first two HSIO lanes for shared
impedance calibration. Store these calibration PHYs in a bulk array
and acquire them by name with devm_phy_bulk_get().

Initialize both calibration PHYs before powering them on in lane order,
then keep the SATA PHY initialization, mode selection and power-on
separate. Use the bulk helpers to release the calibration PHYs after
SATA startup and to unwind failures without repeating power-off after
a failed bulk power-on.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/ata/ahci_imx.c | 57 ++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index 6aaa18e29abc..18faa033e44f 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -25,6 +25,8 @@
 
 #define DRV_NAME "ahci-imx"
 
+#define NUM_CALIPHY		2
+
 enum {
 	/* Timer 1-ms Register */
 	IMX_TIMER1MS				= 0x00e0,
@@ -66,8 +68,7 @@ struct imx_ahci_priv {
 	struct clk *ahb_clk;
 	struct regmap *gpr;
 	struct phy *sata_phy;
-	struct phy *cali_phy0;
-	struct phy *cali_phy1;
+	struct phy_bulk_data cali_phys[NUM_CALIPHY];
 	bool no_device;
 	bool first_time;
 	u32 phy_params;
@@ -428,30 +429,20 @@ static int imx8_sata_enable(struct ahci_host_priv *hpriv)
 	 * Initialize the first two lane PHYs here, although only the
 	 * third lane PHY is used by SATA.
 	 */
-	ret = phy_init(imxpriv->cali_phy0);
+	ret = phy_bulk_init(NUM_CALIPHY, imxpriv->cali_phys);
 	if (ret) {
 		dev_err(dev, "cali PHY init failed\n");
 		return ret;
 	}
-	ret = phy_power_on(imxpriv->cali_phy0);
+	ret = phy_bulk_power_on(NUM_CALIPHY, imxpriv->cali_phys);
 	if (ret) {
 		dev_err(dev, "cali PHY power on failed\n");
-		goto err_cali_phy0_exit;
-	}
-	ret = phy_init(imxpriv->cali_phy1);
-	if (ret) {
-		dev_err(dev, "cali PHY1 init failed\n");
-		goto err_cali_phy0_off;
-	}
-	ret = phy_power_on(imxpriv->cali_phy1);
-	if (ret) {
-		dev_err(dev, "cali PHY1 power on failed\n");
-		goto err_cali_phy1_exit;
+		goto err_cali_phy_exit;
 	}
 	ret = phy_init(imxpriv->sata_phy);
 	if (ret) {
 		dev_err(dev, "sata PHY init failed\n");
-		goto err_cali_phy1_off;
+		goto err_cali_phy_off;
 	}
 	ret = phy_set_mode(imxpriv->sata_phy, PHY_MODE_SATA);
 	if (ret) {
@@ -465,10 +456,8 @@ static int imx8_sata_enable(struct ahci_host_priv *hpriv)
 	}
 
 	/* The cali_phy# can be turned off after SATA PHY is initialized. */
-	phy_power_off(imxpriv->cali_phy1);
-	phy_exit(imxpriv->cali_phy1);
-	phy_power_off(imxpriv->cali_phy0);
-	phy_exit(imxpriv->cali_phy0);
+	phy_bulk_power_off(NUM_CALIPHY, imxpriv->cali_phys);
+	phy_bulk_exit(NUM_CALIPHY, imxpriv->cali_phys);
 
 	/* RxWaterMark setting */
 	val = readl(hpriv->mmio + IMX8QM_SATA_AHCI_PTC);
@@ -480,14 +469,10 @@ static int imx8_sata_enable(struct ahci_host_priv *hpriv)
 
 err_sata_phy_exit:
 	phy_exit(imxpriv->sata_phy);
-err_cali_phy1_off:
-	phy_power_off(imxpriv->cali_phy1);
-err_cali_phy1_exit:
-	phy_exit(imxpriv->cali_phy1);
-err_cali_phy0_off:
-	phy_power_off(imxpriv->cali_phy0);
-err_cali_phy0_exit:
-	phy_exit(imxpriv->cali_phy0);
+err_cali_phy_off:
+	phy_bulk_power_off(NUM_CALIPHY, imxpriv->cali_phys);
+err_cali_phy_exit:
+	phy_bulk_exit(NUM_CALIPHY, imxpriv->cali_phys);
 
 	return ret;
 }
@@ -839,19 +824,19 @@ static const struct scsi_host_template ahci_platform_sht = {
 
 static int imx8_sata_probe(struct device *dev, struct imx_ahci_priv *imxpriv)
 {
+	int ret;
+
 	imxpriv->sata_phy = devm_phy_get(dev, "sata-phy");
 	if (IS_ERR(imxpriv->sata_phy))
 		return dev_err_probe(dev, PTR_ERR(imxpriv->sata_phy),
 				     "Failed to get sata_phy\n");
 
-	imxpriv->cali_phy0 = devm_phy_get(dev, "cali-phy0");
-	if (IS_ERR(imxpriv->cali_phy0))
-		return dev_err_probe(dev, PTR_ERR(imxpriv->cali_phy0),
-				     "Failed to get cali_phy0\n");
-	imxpriv->cali_phy1 = devm_phy_get(dev, "cali-phy1");
-	if (IS_ERR(imxpriv->cali_phy1))
-		return dev_err_probe(dev, PTR_ERR(imxpriv->cali_phy1),
-				     "Failed to get cali_phy1\n");
+	imxpriv->cali_phys[0].id = "cali-phy0";
+	imxpriv->cali_phys[1].id = "cali-phy1";
+
+	ret = devm_phy_bulk_get(dev, NUM_CALIPHY, imxpriv->cali_phys);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get cali_phy\n");
 	return 0;
 }
 
-- 
2.56.1

