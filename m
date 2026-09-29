Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C111A3D4126
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695082; cv=none; b=FVsw2FExHyG1jBtWsHNH1+YJ9qw3LEVDMzUNjCzy303rf2j3MsegigX6J5ePYpCo+Pd8gDJ4S6fjnDlvMiXuLK3ZRArruvxEdsllyn406GPK5EtM1FY7vGwVIlqYqu09OMC5uJd9w5t3tpQzRyKw4ydEPUUGb8bs1K+n+N6COpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695082; c=relaxed/simple;
	bh=xG8fQs+Nv8hzYaB47vBOWqr+MR+BJEmuFuZwRxqnET0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xl/lCV4elwsr6CgLml9+Nn8jKY/7hO/K6/vgweUrplGc0X2hYkfwM8hQ4xBymXL6oKrxX+a7qH3znIY2xuu3+EsUaUioEukmqA9JXdeCktyQaN98919xBvptEtsTOQV4Ar9ijs6RFJSSfFJ5IeQsufV/g+cwyXRfvnSLccETjPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k52LkvcN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k52LkvcN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso32287465e9.2
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695072; x=1791299872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=;
        b=k52LkvcNow7p0woFQ6EZTa5rFDFjGD+jGDX14OVhL5rCv8l9qBkwR1RlC3/jTBz1d6
         VGykH5hJAHr8dRvDqa7x4/opnFQ2UoDMfU0JPzkyPWeH9LoFMo7A48IOo/Zz1GFopSMR
         r/+cncqQfmi8ORb3FOupq0kXrnkjqBi0OrhS8BX4cRzKx28YU1HDOTCNuZvFE0VuOjWQ
         WTMOWEjtQGyJz7Y+2XyTpExeMxdHOjk3h+xXBYVQAHngFQvWMAq1jxdYtbRcUEgT+B9b
         fGRGdqHyuFzCl+jAi3fqwuOOSA0CxN4jUjDjSyjWOIZgUe/agykOPluoANHdPqpGsJ4y
         5kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695072; x=1791299872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=;
        b=ylZgSgpVY2e1eDR0eh5yTnjUOU0V4A/sjQW8lOUY89ApXktZErWLZeJhaqvH/eE7qQ
         ROSABVFFQFZgtB3q2jFJa2aEgZQRYpZlvL/D720isiD51HluSW55bZgF7VxRW0FUquNe
         mMOM1al8xHe6/jWB8DdW5chgRDKJ7LYZIa3o4g+mkE60qh+zK29KcBJGfbUaV+1+CP6t
         kLufanM0mvIYBZgiT0LEgFcyXB0JAMSK6NQezwRHKkz4P+eoByWuQw8V581TnkGOJyGa
         gGU59f3ebb6GrcSdDlPdrrDMjuw1Oa9Mu0/AZOi+5MmNRJnrnOtPhcB1lhTM2HjScI5O
         8Qcw==
X-Forwarded-Encrypted: i=1; AKwUvBwFKt6EnFQrtAWlmpBvXvVXNd8w1AmxVU6glNIohS7/PNK8daLHUvJKSPGiUv1adipTBIo=@lists.linux.dev
X-Gm-Message-State: AFuF++m3/+CbE4aQAbAS67T9Qua4oRAVxAbiqSD9g+2uZIDajBO/EWm6
	xt+YG5RpFarLfu5W11axxx64m5O7YnIG0pLuSiC3JGUeG5X9/kFnnLDA
X-Gm-Gg: AYBFou0JYpc9n1t98fJwqipSZZksBnOa14uVLkcc8ChubNcJsvJ97i0u8D7GBvZ+CO6
	4Yj9l/dtemf9ZLPxPK13Brmtc9vBWjCP3JjS2AK6d3GMEU7PjBuDWxL+4q5hmnYiUqmdvJgPn7U
	JFQ2pY9z6ZNsJkDvcweyVnIBMbWYeyvKblmEoP8K/1LItVGKmYxfoPwFXydvnferlTBezy0Z7+7
	D+Ji7WP0Nifu08KU4B0MU+KkVqkn+pa00rfXlnvxofmmeFAbCa7a3lsJ1SGrmFpCztW7MciTJIo
	vydWKsBDQR6WtRWBxQ6Vnl8b8azx3VIMYkdUEZxPTQ2Eaawz3a//+2RVPWuaa3A+nkR7nfT+nDS
	B7uylD5OOKYqoKKSKRd+QADWEXhjFf+NXtCilWfctV3XQerfUM6rf1uHQZmwY6M5YPD0QmhSCdk
	rXNLQAJ9V/Vm/WdF+n2nkv1XpqgGcXNhaZkSAmDS8UmQgtUhP7X2iHVqXyT1uC2jc6s4Rnf21zN
	BI2PL4GoLkrKVnzPCSmfXOZ3RDp8xp0/j/jvvkfWJaHCsNoaYbdzmo5Wvhov4ZOMyEE7kEaPE2P
	6+PUMzEunlVMkAol02t9uyw=
X-Received: by 2002:a05:600c:19c9:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49fe7ae84a9mr291312065e9.0.1790695071599;
        Tue, 29 Sep 2026 08:17:51 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:51 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 04/13] net: phy: micrel: Check RMII clock select property presence
Date: Tue, 29 Sep 2026 17:17:31 +0200
Message-ID: <249f29ecae7cf9dbbeb9691df2c67e4f0cfe326f.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The micrel,rmii-reference-clock-select-25-mhz property is tested
for presence, but of_property_read_bool() warns when the property
has a value. Encoding it as <1> to satisfy the DT schema unit check
would therefore produce a warning at PHY probe.

Use of_property_present() for the presence test. It accepts both
existing empty properties and the new numeric form without changing
the RMII clock selection.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - New patch: use of_property_present() for the RMII clock select
   property so its numeric form does not warn during PHY probe.

 drivers/net/phy/micrel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index ae830781824b..acb481a29c25 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2791,7 +2791,7 @@ static int kszphy_probe(struct phy_device *phydev)
 
 		if (type)
 			priv->rmii_ref_clk_sel = type->has_rmii_ref_clk_sel;
-		rmii_ref_clk_sel_25_mhz = of_property_read_bool(np,
+		rmii_ref_clk_sel_25_mhz = of_property_present(np,
 				"micrel,rmii-reference-clock-select-25-mhz");
 
 		if (rate > 24500000 && rate < 25500000) {
-- 
2.47.3
