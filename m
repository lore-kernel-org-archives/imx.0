Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581444;
	b=UpwNo6YoDz0kLe7i4/SgL3hmJG8J7G2T8uj3Iirp/a7RlO+fA9XEM7YrDFX8uW9+yrTc
	 8J/t2XU3Xh+ljcwtBl/l6P8W8GHZ75oN7CI76d7DHuGK69SMkenzn5w623i3WV5eMDfed
	 //7h3vEVq2pIpn2V81KpcEoaUtbrY5BkAo+19tgH760Jt+HMuAN65N+yJLHqIVIKySwOF
	 NpV+w2gmkb6376/BIFeoHOvlMwDduo8toSpXlkAeGER0gNlzo9UE9HWsvXDH+YIkMnLAw
	 nARE7aZ9WJAYehNudRQr1SRt7eZpUL9WrJsDLH58u0s1euGIBRyrs/eVzPdNSrE3lig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qTrL4/9jM8t7yAmF2IG8ye/8M/WX8AYVFJWYbaSsj7w=;
	b=RFEstClLol+wlU8rEUG4Kr+QkIVmy9QPMhLYoXWuanjg20K0J3vsr4+5wuhDUpKavK9w
	 zJzV2hZVrZHMiZK5fCApzUnnh5AcvSdZBlDncestLXZewoQYhTK1B5JSv4UVCNCEGh9cg
	 X6ZqqWW1TVC99XoiNFvgfWK3foFIGV1ADAKKg04tszv+NNXftvAUf+7E0B8Ubi3NH9x5k
	 DmzE0matURNCMguO9g3psVZZsHTrbBJhLG9pleL2wvt9+bwEoUsGmqzO2yEm2/AaJtv8K
	 /W1rNhPBLQA7b3PmVaIDvWY4VgJ3Gr7Avm6D0baOeXTBNz3MPbZjhMWYkAwG2wIEK8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvWUhksP;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AFC606A32E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 04:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5AFC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvWUhksP
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso3200203a91.0
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 20:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581443; x=1796186243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTrL4/9jM8t7yAmF2IG8ye/8M/WX8AYVFJWYbaSsj7w=;
        b=zvWUhksPIYvv3yfTQdaZVlDhNYe0UEXBdvVXYS4jvwD2TUHT46a0LuHB5W/JV2FLRj
         bPpOUY/YZsueGujd6H/9rcYSF7L7PxOdEjlEFHtgYa3IDziiVJHgtVh6FzAUIUqL4ObE
         coWdECZdWirYLdKu4szTohtWw1BNU9f/9VXYc+OBEZruMb3kvf/EcFQkRy3pCH7lxdSl
         6CO3peGwTdgCCbwqHSNeDOTwXC2saGYWXuWJWuJf7Hqr0ZO2tMapYFUipAqeKmJppc3v
         aEuW+qVgNC2dGkt8C3YzHmmJDXGEcBnkhPa6AfEyN+WSVJYJoyKWZ7B+DqoXDnxPoCsF
         FwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581443; x=1796186243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTrL4/9jM8t7yAmF2IG8ye/8M/WX8AYVFJWYbaSsj7w=;
        b=K69S9tBC+Qr5jzfBpHOY0ApUg1UWLX0CGUcXOp1tkvxeiZdtR0BDsFv0kU6F2ENigP
         Tqoh37coxPGygxok+xThFe+m7GGjhVgUgiuFY2/AJDDum+6blAnfhBOlRjenpbWD11ex
         cb5UR5ld7pXhFbBVJguVycJnHSh0cY2l1dNdqOVp5jK2psoSPCWnZNH5sXW1EyJztQdb
         DlxQL8F0gaX6miQ+DMGf97/V2f4muqNtuv9wry7Xd2TYXv99BzKcKazmgsijL6bD2TUr
         Dvoare6ZH2e+CK8VEHGEAg4oxuZEs8+Z3rrDu4uRIMpaNZZTElA0Ks8Oip+f6PRi5HmQ
         zN3w==
X-Forwarded-Encrypted: i=1; AL+hErGGoPBwy4IhlTDjY5mw40EVLsF3h+y9Ig5y1RjzpE+R0MWb5s0PSVF54tDtK+iNo1lzdL0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/zkWKOZ7CxW1TssHkVns8MdYeTY519H88BgYwWPfVA3TEyFNsq
	OSSzusywxTUjQOT3zM1iqH1CJAvpODGik1/TAvSjD29+KuJNzsLDokyS
X-Gm-Gg: AZFdTZdyzpue4uzCOEmgfYZQ1CTmGsxC+4n3Rkfp98eI6wb6hYEl5CN08iBgLpeb20x
	Yu93iNu2DNBj097Bww8aFoC6tRVu5lOyVcMri2tyEsxJzOAVnhJ5mS8FE4uQWYaHnLLdKfM0q2A
	2CPc4C4vS7aJ+d+45Ip03Fmtr5BzwP41cZdEgY5NgkjdFUBX46DI45t5f2IDUMu6gbdxt7pCfmt
	ehzG9iLUgHUIZzJHF3YMeuC/TegNwOVUJOcYy6fC3TCSj/ZOHUUrXq0TbOc1CreAgjQ8F9ew0yV
	xdV3xzxbJjTxmZAkxt7Ro6+onE2/H8wAtlc/2noBFJRhIk+4E0tMHZfxJ7l+8h3kwun7/d1uPKX
	JAyU+fIGW8p2qET0uxU7yJdHjCRtKpYUeuXO07OQYbM2Kmdg2KuiTth2vwLptGcoATKo3tYibUK
	1yn1bj5bZwDdgceLeUaW6NSADIkm3Tn8CnzXcIigD98nAjrnnQOQ6f2zX83I73qtr0sQiYlWq5/
	0C0WwMSJxSM3e8o8UFTOReY6tRTkCY5kMvasxGvRcYjHg0496r0v8tbQlH9haEAau4V7joyPm8T
	LqI/9U4E+F0d960g1KZ/Z5dMjggDvc7fNk8GuHTrvLUINRVN
X-Received: by 2002:a17:90b:4c0b:b0:3b4:12a9:2e1 with SMTP id 98e67ed59e1d1-3b41c931d36mr16931812a91.33.1795581443120;
        Tue, 24 Nov 2026 20:37:23 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm26615594a91.1.2026.11.24.20.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:22 -0800 (PST)
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
Subject: [PATCH v5 2/8] phy: core: Add common helper for get phy phandle by index
Date: Wed, 25 Nov 2026 12:36:33 +0800
Message-ID: <20261125043639.249525-3-inochiama@gmail.com>
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

Two phy helpers use index to get phy phandle of a device node,
add a common function for the future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/phy/phy-core.c | 57 ++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index b7550ca37e66..efbd7e139dce 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -697,38 +697,55 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 	return phy;
 }
 
+/**
+ * _of_phy_get_by_index() - lookup and obtain a reference to a phy using a
+ * device_node by index.
+ * @np: device_node for which to get the phy
+ * @index: index of the phy from device's point of view
+ *
+ * Returns: the phy device, after getting a refcount to it; or
+ * -ENODEV if there is no such phy. The caller is responsible for
+ * calling of_phy_put() to release that count.
+ */
+static struct phy *_of_phy_get_by_index(struct device_node *np, int index)
+{
+	struct phy *phy;
+
+	phy = _of_phy_get(np, index);
+	if (IS_ERR(phy))
+		return phy;
+
+	if (!try_module_get(phy->ops->owner)) {
+		phy = ERR_PTR(-EPROBE_DEFER);
+		return phy;
+	}
+
+	get_device(&phy->dev);
+
+	return phy;
+}
+
 /**
  * of_phy_get() - lookup and obtain a reference to a phy using a device_node.
  * @np: device_node for which to get the phy
  * @con_id: name of the phy from device's point of view
  *
- * Returns: the phy driver, after getting a refcount to it; or
+ * Returns: the phy device, after getting a refcount to it; or
  * -ENODEV if there is no such phy. The caller is responsible for
  * calling of_phy_put() to release that count.
  */
 struct phy *of_phy_get(struct device_node *np, const char *con_id)
 {
-	struct phy *phy = NULL;
+	struct phy *phy;
 	int index = 0;
 
 	if (con_id)
 		index = of_property_match_string(np, "phy-names", con_id);
 
 	mutex_lock(&phy_provider_mutex);
-
-	phy = _of_phy_get(np, index);
-	if (IS_ERR(phy))
-		goto out_unlock;
-
-	if (!try_module_get(phy->ops->owner)) {
-		phy = ERR_PTR(-EPROBE_DEFER);
-		goto out_unlock;
-	}
-
-	get_device(&phy->dev);
-
-out_unlock:
+	phy = _of_phy_get_by_index(np, index);
 	mutex_unlock(&phy_provider_mutex);
+
 	return phy;
 }
 EXPORT_SYMBOL_GPL(of_phy_get);
@@ -1001,20 +1018,12 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 		return ERR_PTR(-ENOMEM);
 
 	mutex_lock(&phy_provider_mutex);
-	phy = _of_phy_get(np, index);
+	phy = _of_phy_get_by_index(np, index);
 	if (IS_ERR(phy)) {
 		devres_free(ptr);
 		goto out_unlock;
 	}
 
-	if (!try_module_get(phy->ops->owner)) {
-		devres_free(ptr);
-		phy = ERR_PTR(-EPROBE_DEFER);
-		goto out_unlock;
-	}
-
-	get_device(&phy->dev);
-
 	*ptr = phy;
 	devres_add(dev, ptr);
 
-- 
2.56.1

