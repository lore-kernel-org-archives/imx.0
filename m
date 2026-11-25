Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581453;
	b=QvQjnHIqB6jiGLv8zJ523cJ0A5PWWDltFd7aqElx9+d5eJN4WGthvN8k0ZQJR/YvADt1
	 rMak1sLXGfxxANiCeB46BKUJfLswoOcZrqO/T2NGM0qQjjlow4qv3JFqbUuGLko3ntFfV
	 xgPB/S+bsHZ9snBwlgwxN9XZbf/81vWzvxyCOY3UIu37reKp6zDmNiClNbIJFl5u9Ct4A
	 HZVOIX1xSGZktIxX8QMPIaXjl2+aq/ujEQxSWBOgQ2QFC0CQubQ/spsV8pmfF1wxF2nKK
	 kbkZFMv/kR5Hd4uv44Tj/18EtMl/Wc0jjxU1PSE55jGLxK66/JyBrA8rQospydQ+iyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rkE7p4aQLSp2kYV7vRBIkJ3P+8n0i8bdfYVP4ePHIkQ=;
	b=zeKs+Gx8Eaf92XB2YUlbQY5oOUxWJrqU9XBiCKuu3OE6xYr2cKVOSciaahxdMC/+EfD6
	 jdiRk06orMdZKVQQQuwcDKK7J3e+w8KI9I0OG5qKPraZGHMkjbnMq1brwAk2fJaUv7dCa
	 xShQkOzrkZYa8ICdUI7x4zbyDczg94fc2cQNb5MBhRBtqWaS0oF3sSV+hUoi3XYeyDo6+
	 OTgSW0Zc6u5JK0QLFzl3DKZmRHJFx76YXduWhm4znHxUymVWLTBTJ0DH4uW28ce6W1uX1
	 bKoh3+2px0xZg7gZVC/VGjQYtCdK4jWhNierkYwirUv+XAiTeCe/Vp3cvCkXzrnIthQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYJaxBKs;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274EF606A331
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 04:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 274EF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYJaxBKs
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so3183971b3a.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 20:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581452; x=1796186252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkE7p4aQLSp2kYV7vRBIkJ3P+8n0i8bdfYVP4ePHIkQ=;
        b=jYJaxBKsEQEqqUKHCxuQ6VWGSE5o4JpliDRw4Y/lPZXQij7OCL3GNrWvBytu4zjSOb
         VOWKBboRym7Uyr3MQVOg7jJuqIAjGeUniT7GKeXLc6vTwrRjQSoazviMRxUKk3FXGivG
         tFTh89uN98fT5WJDMghAwaedKfsPJb85sz4RXXZhOfjfGP2XZmtFxAyLAG2TnFtAPUTk
         lfWptSmunSVWFiGExUg27pQRbUH75R+u/nl1Hy7iSxSZSIl72eTBR538hlm5IdsxbgKe
         pdHlgZv4Z3ZlsYNuYu5Jh5sf3W698OKhly1piX1S5d0qddO5Q8pWqAKatrONq/EmWrKW
         QjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581452; x=1796186252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rkE7p4aQLSp2kYV7vRBIkJ3P+8n0i8bdfYVP4ePHIkQ=;
        b=N5/h4xSM5a016KNaIWIuvNTKEDPGgZO4kXurTb2J5fOrUMHBnn95gSAWTowTZ6Kvn1
         M0bwgUdjE+/Z6wufcBVFQ/O6emqTjw82pyjQ0bIK+Xp/WFEv8Qu1BYmqvudzNF6G4nT1
         gWPfrIO7l0S3p1+6pbp0r0NpyD6NkxiFqPGd2ISoNSWYaCq5/8YsuHbAZ2572ziiQaTD
         Qg46dFtmXTvCABTrhxAPr8fUtSeQrZpIb7Tw6szKFW9R5zgwfb8j0uCjqfjcU0Ugfa4A
         zfHsjgTZCQQPxJkYEyPJZByFB5t570wW2vmwN/h33u3xOIa6cbWBqg8+INIMaBmjIR8r
         lD5Q==
X-Forwarded-Encrypted: i=1; AL+hErGAueUrURKCxy2xIPfjCGrD5Egcok+bFGhmmhAdk6Rz8bMQl7Xtrk5BP9zKeVKC2yPhVjI=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Dn1K4skogknIqCg36BmlZqaxCsCNNIlhk2bf3hFgwXK9foJyv
	Uct3A5lmsgYiA7n2PgsX0B37+RwYPt1ycanayZ3XubRElrOf+QaEn4d3
X-Gm-Gg: AZFdTZcCAfIoehmBnx31zzBTGiFubK3GYhgYYa0DTKBcglikYmF2A8uP08f3J65E3dw
	uxz63NrXIGIAy45b2rpTgPFFGfGssAUmyYrmcvMKxdb8pQetRc6ShPdUeDbz5uUUqoWe/410bND
	g06ilOAzUdjxKKtRdtc9ftXY88buHbk4k/kqgbN+lqHeyBRP8/ihlRC9e+0b0AWB07mOa1Vmbzu
	xTln3laa53AZwGh5P7SDTpyfgJggUdXgSXd2hHPRtyxGCOvj2JZ4FNbdJWwYIjnOQ1m4uoyH8m5
	bayXyLuvxlHjv8sTzC6eeYCNJEYIwc/fiJcNzZzWIGPySR7ByU7swTX35jl7vYxiWwgSGHQy3ql
	illneTTtAvd7ds8TRFkwgUxNOa3eZnOXcgP4yRZM+0xCvqcz+GCAM0dXg34d428DMwOYK8SS+hj
	TgA3DF1j0QhSa6du6dAVyNEk5umYrI1gYBN86dNNWW9pvQAlxnU6ouocs0F1nm7p68dktFoSVMG
	B8WlabkB2+1z2+vjIYJ3A/smU3HS4N7Mas0nmjlyewUoVdKLbyxPMTlMsBC8L5pH0thp1NNYp8p
	y5Y1ctG/14XoHVraoMlaK2GJdwuWy4vaw0CrFl9tgyaQeM8T
X-Received: by 2002:a05:6a00:4107:b0:89f:ed19:f0ba with SMTP id d2e1a72fcca58-8c7dd9d67bbmr11654419b3a.23.1795581452525;
        Tue, 24 Nov 2026 20:37:32 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1e2f3sm7882825b3a.54.2026.11.24.20.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:32 -0800 (PST)
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
Subject: [PATCH v5 5/8] phy: core: Add managed phy bulk data helper functions
Date: Wed, 25 Nov 2026 12:36:36 +0800
Message-ID: <20261125043639.249525-6-inochiama@gmail.com>
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

Add device managed variants of the phy bulk helper functions. So
the driver can benefit from automatically managed phy handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c  | 139 ++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  31 +++++++++
 2 files changed, 170 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 87a317a144b4..eeba1b899c20 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1281,6 +1281,145 @@ static void phy_bulk_put_all(struct device *dev, int num_phys,
 	kfree(phys);
 }
 
+struct phy_bulk_devres {
+	struct phy_bulk_data *phys;
+	int num_phys;
+};
+
+static void devm_phy_bulk_release(struct device *dev, void *res)
+{
+	struct phy_bulk_devres *devres = res;
+
+	phy_bulk_put(dev, devres->num_phys, devres->phys);
+}
+
+/**
+ * devm_phy_bulk_get() - managed lookup of multiple PHYs
+ * @dev: device that requests the PHYs
+ * @num_phys: number of entries in the phys array
+ * @phys: array of struct phy_bulk_data with PHY names set
+ *
+ * Gets the PHYs using phy_bulk_get() and associates the references with
+ * @dev. The references are automatically released on driver detach.
+ *
+ * Return: %0 if successful, a negative error code otherwise
+ */
+int devm_phy_bulk_get(struct device *dev, int num_phys,
+		      struct phy_bulk_data *phys)
+{
+	struct phy_bulk_devres *devres;
+	int ret;
+
+	devres = devres_alloc(devm_phy_bulk_release, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = phy_bulk_get(dev, num_phys, phys);
+	if (ret) {
+		devres_free(devres);
+		return ret;
+	}
+
+	devres->phys = phys;
+	devres->num_phys = num_phys;
+	devres_add(dev, devres);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_get);
+
+static int devm_phy_bulk_match(struct device *dev, void *res, void *match_data)
+{
+	struct phy_bulk_devres *devres = res;
+
+	return devres->phys == match_data;
+}
+
+static void devm_phy_bulk_release_all(struct device *dev, void *res)
+{
+	struct phy_bulk_devres *devres = res;
+
+	phy_bulk_put_all(dev, devres->num_phys, devres->phys);
+}
+
+/**
+ * devm_phy_bulk_get_all() - managed lookup of all PHYs requested by a device
+ * @dev: device that requests the PHYs
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * The function calls devm_of_phy_bulk_get_all() directly, but sets the
+ * @np parameter to dev_of_node(dev).
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys)
+{
+	return devm_of_phy_bulk_get_all(dev, dev_of_node(dev), phys);
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_get_all);
+
+/**
+ * devm_of_phy_bulk_get_all() - managed lookup of all PHYs from a device node
+ * @dev: device that requests the PHYs
+ * @np: device node containing the PHY references
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * Gets all PHYs from the specified device node, associates the allocated array
+ * and PHY references with @dev, and creates a device link for each PHY. They
+ * are automatically released on driver detach.
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys)
+{
+	struct phy_bulk_devres *devres;
+	int ret;
+
+	devres = devres_alloc(devm_phy_bulk_release_all, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = of_phy_bulk_get_all(np, &devres->phys);
+	if (ret > 0) {
+		for (int i = 0; i < ret; i++)
+			phy_add_device_link(dev, devres->phys[i].phy);
+		*phys = devres->phys;
+		devres->num_phys = ret;
+		devres_add(dev, devres);
+	} else {
+		devres_free(devres);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_of_phy_bulk_get_all);
+
+/**
+ * devm_phy_bulk_put_all() - release the multiple PHY
+ * @dev: device that wants to release this phy
+ * @phy: the phy bulk data returned by devm_phy_bulk_get_all()
+ *
+ * destroys the devres associated with this phy bulk data and invokes
+ * phy_bulk_put to release the phy.
+ */
+void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy)
+{
+	int r;
+
+	if (!phy)
+		return;
+
+	r = devres_release(dev, devm_phy_bulk_release_all,
+			   devm_phy_bulk_match, phy);
+	dev_WARN_ONCE(dev, r, "couldn't find PHY resource\n");
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_put_all);
+
 /**
  * phy_bulk_init() - initialize multiple PHYs
  * @num_phys: number of entries in the phys array
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index c170d9aeeeb4..a51b3c283efd 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -326,6 +326,13 @@ void devm_of_phy_provider_unregister(struct device *dev,
 int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 
+int devm_phy_bulk_get(struct device *dev, int num_phys,
+		      struct phy_bulk_data *phys);
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys);
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys);
+void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy);
+
 int phy_bulk_init(int num_phys, struct phy_bulk_data *phys);
 int phy_bulk_exit(int num_phys, struct phy_bulk_data *phys);
 int phy_bulk_power_on(int num_phys, struct phy_bulk_data *phys);
@@ -603,6 +610,30 @@ phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id)
 static inline void phy_remove_lookup(struct phy *phy, const char *con_id,
 				     const char *dev_id) { }
 
+static inline int devm_phy_bulk_get(struct device *dev, int num_phys,
+				    struct phy_bulk_data *phys)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int devm_of_phy_bulk_get_all(struct device *dev,
+					   struct device_node *np,
+					   struct phy_bulk_data **phys)
+{
+	return 0;
+}
+
+static inline int devm_phy_bulk_get_all(struct device *dev,
+					struct phy_bulk_data **phys)
+{
+	return 0;
+}
+
+static inline void devm_phy_bulk_put_all(struct device *dev,
+					 struct phy_bulk_data *phy)
+{
+}
+
 static inline int phy_bulk_init(int num_phys, struct phy_bulk_data *phys)
 {
 	return 0;
-- 
2.56.1

