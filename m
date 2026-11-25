Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581456;
	b=ZVz7jR/p6b9dOSfyxCHNYlNA+sT/F2vKn9K9dTrceV+aUfB1m2QPd0LNT6lyHZjCtOOL
	 tBHAgtydH7K3/TU9CE88DDDqiCOidx8TATEIGcIoksPCpDPwpvPQL0F/K/psDMoTrgCXl
	 E51Ed/WwAwcQ9Wehbo8YWC6Y9CiI4Ic+74FMMD4VmFzyauAJvcWmerOFavSxiwPVdmr2v
	 Jvz+YXlFmiWuBIbEABmxy6C6jgh5R8XxAlcWhP0KgthaVKbuvYDtgoF9LifPmw3GQmjnp
	 trqiaxWKO7LPQxkUwi5jiv3rOVZBs38+EZ35ONK970wQuZfrUTIqKKVy0JQn8gq8URQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=;
	b=nxsDHfXQRvqYJCdoMEeKTl2yFTpD9kEruE91D4/X0JJ1qFZOXVBIJ2SxMtf8XZM+jGo9
	 ZouBJVytUbU9ZdhcE0nQsARAIvV5Cygeu3najpfGsPQ24PZVCH1wJoMy2Uu+48vEijvgg
	 ZLJrtIIKPI2MH2WaQksWP/uQX8nW+Ph9lRXxvF1nuVzgeP5XHHPB8/ZSVET0kxVmTP5RN
	 pEqTdxc9ksC6BbV1pdVV23FcRwnmoJxFwgjBDasRszS+JE+QhgrdKvktsijei8z5jPYCv
	 3/RwPvzGdU/Dmu5CAZuj7TBQFD9bRlo/JzQSiyltIwdzAxfWdTS49NjislCr1Sq9ycg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UL+4VLGq;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47795606A33C
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 04:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47795606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UL+4VLGq
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b600fae14dso1808451b3a.2
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 20:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581455; x=1796186255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=;
        b=UL+4VLGqNehSS9MjHEc9L+iE6F7aRdCymevjL2WRkXt9JxPJf4nMCUDd0IYy4Q3v+s
         LFMtUnPr5ctoy4BaQQYL7HGVa6txWbQxcLdr//9YI3A40hfA6Li3sq9QdOWhE0LAmfON
         lIXXH23siVG8GCJVzT+g4z9RqJl32HftsPD8s/m0dkP2k4JebgQYlWpb4d7BqbMfC7SH
         G3LWkuPvj6OtD29aei8KbQidvun9s/UNPwxDMQg8Y9nd1gyQAWusEdpJfwXHF418dEKe
         Bj2WKpYr+DrUsr+aG2W/r5atPGR+fjdADx5ZZFyDitoET5DdbxeD954mrMMCamch9LIL
         it7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581456; x=1796186256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ry895IeeCwvvoVrLKPY1qGl5vh7XehrgPQ0oBew1BlU=;
        b=a5bPdaCnh1lTiCUW7Vh5XxBrwpOlgBgq3IswM13fb9pdX1WVwm3xY0ep9V04jlcX1C
         1i0xpFi/GEgcnJISFiPiRwnGmESF0YWkmVOFRluTQ4Znm+hYz9puduRNsMr9vXHsLr2F
         FLCpUC0e6Arvj87FTYzyIfg4SgXxknWwDogTdMoRlhrVCVE2EjXkbOdmGfxHl2K5NCF+
         8l1QepssnIimI5lysXSFNSMrT8uveXCVuEYR+ZRVLT86AhWYkODznFlnRLm+inAqZEfg
         Gp/IvQoXLIbkJLeJo1XCiDW1HN2TYSVAV4yaqf+xmISW05itFQ9rQoSGQaA6RnhGLOK8
         534w==
X-Forwarded-Encrypted: i=1; AL+hErFpai3x6w1uCyY3dej3cia+T2XCnQ1VChidpXv/BbPs7hvMeCBgMJH9JVKagCGO2LSamR8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/O8DhR3kpmTq7TgA5xJ83ImXdyjW7exAY3dpBtzKfaRFdhflgp
	Wzxwvxl8hlqs3+xYUNPpCLU6N81d19cbhTj1BooHVToDvbKd4rpQqSyT
X-Gm-Gg: AZFdTZdAfKug//dcCUDmmRJk94lKmMGwN2RfhVTTKKAI352SKgRpWmKSjRH2TsiF0dy
	FYh+vjeTPOhefSjrx1+JMQW1f78tscxkFu1iX69b7W8XKh08XrQEuppuRPhNY3QZ55Su/ceL0N6
	Tpu7jxgXEeDgDyb79yrkqZ3ZRdWJ8+hZDBzdNqOCrHm17g7W7BOUA9dLsatF5IlIIUd/DBQkuVR
	RyfhEkip8MCVHqs3chR3QiA7ky+rGEy2zfMS2Zh2dIGoy10ZrIMGavDz8ocd3S0Esr03RPWrDYO
	FEdoW8RaB7Zs8jWk9IaLa/XeCUxd7PutteoEHxDZE+HrRSBB0G2Xe4mNTTDLqQ11FDhTKh6B7lY
	EOk/Tng+4PZiSa2AFni3vombHq+JuD90Pk/CPXZqpsUYIMtH233LIjMEr5wLrUH8pNTzr3QHgKr
	6V9yc3DIQiQSjUQgEDN/zaS2CDERXQuDqY2YbZEi0HMv3AY8bUUcLoYKAL4dSnzViClUZkqhgEH
	4Pt38hxmqfr/x/CHwFGYEsqrNMbNRm82EhSlY8IFrQOqqGK5G3Xx1p9y3jp2lpzS7a5s6sSCZPx
	dWXFU3QfHxN5hOdhc58HzHUxGqo=
X-Received: by 2002:a05:6a00:b92:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-8c87bcbcee9mr14392696b3a.9.1795581455547;
        Tue, 24 Nov 2026 20:37:35 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm8215994b3a.31.2026.11.24.20.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:35 -0800 (PST)
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
Subject: [PATCH v5 6/8] doc: phy: Document some bulk helper functions
Date: Wed, 25 Nov 2026 12:36:37 +0800
Message-ID: <20261125043639.249525-7-inochiama@gmail.com>
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

Document all newly added bulk helper function, it can be used to manage
a set of PHYs automatically. This is useful when the driver want to
simplify the management of multiple PHYs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/driver-api/phy/phy.rst | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 0865c2e94eec..cae3d4700814 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -114,6 +114,12 @@ it. This framework provides the following APIs to get a reference to the PHY.
 	struct phy *devm_of_phy_get_by_index(struct device *dev,
 					     struct device_node *np,
 					     int index);
+	int devm_phy_bulk_get(struct device *dev, int num_phys,
+			      struct phy_bulk_data *phys);
+	int devm_phy_bulk_get_all(struct device *dev,
+				  struct phy_bulk_data **phys);
+	int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+				     struct phy_bulk_data **phys);
 
 phy_get, devm_phy_get and devm_phy_optional_get can be used to get the PHY.
 In the case of dt boot, the string arguments
@@ -129,6 +135,21 @@ Some generic drivers, such as ehci, may use multiple phys. In this case,
 devm_of_phy_get or devm_of_phy_get_by_index can be used to get a phy
 reference based on name or index.
 
+The bulk helpers are useful when a controller operates several PHYs together,
+for example the lanes of a single PCIe port. To get a set of PHYs by name,
+the driver supplies an array of ``struct phy_bulk_data`` with the ``id`` of
+each entry set to the corresponding PHY name. devm_phy_bulk_get() returns
+zero if it obtains all the requested PHYs or a negative error code on failure.
+The driver owns the array and keeps it valid until driver detach, when the
+PHY references are released.
+
+When a controller needs every PHY listed in a device node's ``phys`` property,
+devm_phy_bulk_get_all() obtains them from the controller's device node.
+devm_of_phy_bulk_get_all() does the same for an explicitly supplied device
+node. These functions return the number of PHYs listed in the node, which may
+be zero, or a negative error code on failure. They store the allocated array
+in ``*phys`` only when the return value is positive.
+
 It should be noted that NULL is a valid phy reference. All phy
 consumer calls on the NULL phy become NOPs. That is the release calls,
 the phy_init() and phy_exit() calls, and phy_power_on() and
@@ -149,6 +170,14 @@ The general order of calls should be::
     phy_exit()
     [[of_]phy_put()]
 
+After acquiring a set of PHYs with a bulk helper, the order is::
+
+    phy_bulk_init()
+    phy_bulk_power_on()
+    ...
+    phy_bulk_power_off()
+    phy_bulk_exit()
+
 Some PHY drivers may not implement :c:func:`phy_init` or :c:func:`phy_power_on`,
 but controllers should always call these functions to be compatible with other
 PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
@@ -172,6 +201,12 @@ PHY framework provides 2 APIs to release a reference to the PHY.
 Both these APIs are used to release a reference to the PHY and devm_phy_put
 destroys the devres associated with this PHY.
 
+For devm_phy_bulk_get_all() and devm_of_phy_bulk_get_all(), driver detach
+releases both the PHY references and the allocated array. To release them
+earlier, use::
+
+	void devm_phy_bulk_put_all(struct device *dev, struct phy_bulk_data *phy);
+
 Destroying the PHY
 ==================
 
@@ -221,3 +256,8 @@ DeviceTree Binding
 
 The documentation for PHY dt binding can be found @
 Documentation/devicetree/bindings/phy/phy-bindings.txt
+
+Missing Bulk Helpers
+====================
+Currently, only a few bulk helper functions are added as they have users.
+Function not upstreamed can be found at https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/
-- 
2.56.1

