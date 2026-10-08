Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958514B1D16
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488428; cv=none; b=uckYUiEvcNaUv8ZC/qi05MYPtcJgzg9yzrli5jJbv0GrkOToalXhzFHOcS+xQt685Ug3/UcA+KvXNx1z9LzKsLbfvewgkFiHix84JG8HqmGxahk0oDd2LOskJQmd7/Pk2QSjzbN2nN0s1DJUW5DjbiO7tedzlCeKoNaAU96mIsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488428; c=relaxed/simple;
	bh=igs2tqHF/e5m1TR4ZJ1BI1cUnIOjq3NYwvi9hVUtQZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ry+vfqZ3ig5Z0hQitLYVb1/FDfT9EODVzb5nScxc1DAobR8imxgyThNRKOBfyTlrdg59MK03xvrqXhXDZlzEwa+Y6w8o+NKOyaFPAtldMlSZYVZelu0UO5SDpqS9y9vs9CbjvCD6WQ061fb4m6Qa7NUEul49mDbPwCS6u9S8Dkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIBvceOa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIBvceOa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a17baef589so25909205e9.0
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488422; x=1792093222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUKnHWhbwjMVr4mKYh743dRcYI9pzvORcI6HHWVVZSU=;
        b=UIBvceOaxPcewMXoLzgyk9MzLBYjyeAj3ZDMwv2GEDIv4P7eY8nuOCrlWWchMI5Xwr
         wrsg87cYvTXFMujKQ3WF4TMo5QsRibzpHLVlkIJqzg+OWHf6MZV9rYI9JW1wue1K7kci
         CBy42/4r+J/Re0jyd2RPJBM52bQ/5cppc0TgGyf3dzFx4rNSv4S+ZV5c/+60n3dYV/K9
         s0LtrM64XTiDpNrKVCCNngYweXP0UCjeXqDLs+CichHZd1td2zEPeSHCtz0NI9QSWqzI
         HfJs5yn571u6Fxrk0YP9+iUxSQDWjGTc2xeqG3FJb1jY/lt9FefrYbRZhxYrWSDUO7oo
         x68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488422; x=1792093222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUKnHWhbwjMVr4mKYh743dRcYI9pzvORcI6HHWVVZSU=;
        b=M9Tg/yp9rf8wIqO/+lper4/9ofHLq+36IKdRcWw/AktQleFi5xpq1LzXRszODK9BUw
         Akhg1rQipPKOR489qRn/Zc1O4s+lmqU7p0u+Vz5JtjNTRx0NWIQqoAvnVamKbprTx/5h
         xIxVixg30gQVfnudg1kDY5aY9bkgwlFoR8cryW+pYzk3OAK6O1QxEVT/l0dYhbAXcDyq
         /NkaQ7WC2FNI9+vXW7GUrx2QhwPPbjeObdVPMQrTSEp+YH9c/PHOHyBk6OOWYWx/oVhB
         lOoTlc84gYUnoPu6DXRZOrGuosbUKst1dS8fpL71NqrO2KPYAf+g612M/m63GEOVdpTg
         k/6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzSWJiaTWLpsXl3siQdviPZJ6AFDryJeZzHdGRTXx/tpLVnXjqz44n+QDuPkQKUQTeF08=@lists.linux.dev
X-Gm-Message-State: AFuF++m/F5deI8j783vKSob1V7IWKV3wun8ky6pbtiJQWZRNZAa2HKDY
	qX7orkGfylo26B5WQpJoq+rDAtc8uxrNvb3Wb+T+PQRrYuq/AvskXnCs
X-Gm-Gg: AYBFou2P7Xu2Vq4ap6zeppb9NTbDF1niSle7DIoaIVtkX1Eis6XtJ2HCyEnO4KhL+A1
	BD/rGvdMJkeVbTPlZyM58ggV33LaVvKqyLzianBKO94uHRbzcONNqWQr1kyExr4T791Hwa0zgZK
	wZ3NZo9+aG4qyHOGO3WNjxLLjLeu+YsXlWb81riUC77twu5ksxohW92ohKu1YCI+vPutxC4nRZ6
	usxu3dBk63M2WXOI24CIsHPVj/1XdGQrrUyDxp4+fc1pq0Qn3TuLmABnskOKj9DjpoE6OL7HZL8
	Y7+q3ekBqfEZgW6RmjNn/A+gYbp6nUMuhyBWEz9ikc7O5x+pNfTTTFLMJXhyfsjjx4uV+brylYw
	JZkkpJA6/d+WAnxqxDoL9n+QmGQs/ppYeD/veeh/la8zjN5LQDVmy31NOZUo4PH7ylU4xkWp4NB
	uRAmhI6pQSjP6Pb/KXE/jivrfJ41YcNYLqNrPnp/YwctYk9dV/ilU3D/g6L4aP6k/nHjdfaTi4W
	CGEKL8b6v1vP73Ay10M7EAI8IcF6whJEXMZRbE8br+xbLd05a4isQsfGx2fstyRCGSWKwCfrPVC
	GYOyjbYtVKenQHQAaNvAzQ==
X-Received: by 2002:a05:600c:5252:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a1806878c3mr107026915e9.33.1791488421519;
        Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 04/13] net: phy: micrel: Check RMII clock select property presence
Date: Thu,  8 Oct 2026 21:37:44 +0200
Message-ID: <6271eea14eb6ef93031921cedc12d87cf5e25595.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
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
v4->v5:
 - No changes.

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

