Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E045649B5A9
	for <imx@lists.linux.dev>; Sun, 18 Oct 2026 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326773; cv=none; b=ZvIZ7/ANd2cMPGk+TAfUzDoqFBwX1IIOxZ4EkEMkGO7A4LREJPtF2CFUJDObJb549cqhiIstB+Y65kV/UHqdAqLNI95WHUCbBEABcWsAEvxpkWj1vLRaHJKOFNUAefx2n07OdgHU8mS7epWmMPK6HAs5GBcF6So4n8k9xJEV3oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326773; c=relaxed/simple;
	bh=zLxW7Bv3Ru3U7jHr0/eoztXfDcqq0fHfPDwR5r/Ud/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pv8DjF9lUFYqU/1dl6Sd0/u30oW6eyIOEvdpvVL+bPdxU6MelnZMG/2FQjjYnFDEYDVdVc4UPFB1QIcmcmfwwNwlwdu3ZRL/m9jtpI7Y5i8ozrkTOGiDrFjOD13lScAAu6lyxU2YbLtVdk15b/A+D/Jv5HcnlPUKTezBjAPEB8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDX7Ooj6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDX7Ooj6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so5140705e9.0
        for <imx@lists.linux.dev>; Sun, 18 Oct 2026 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326770; x=1792931570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoTkqetwDXx7EPpERx3l0yijxyF3Cc+zIbtbMzAnzsQ=;
        b=nDX7Ooj6XlQceZrydbtY1RclVIdvSjNNPs8nq98OTGychlEiVLDsfmGtCWiRgszPwD
         DCQe9h95kWmZ2fy/rt2TEpfCLixyujtrcy3RO+JFYyElUvoToJ7S7Y6U8dN42BU1aUrh
         H9WM5xVFCQKws039FxmiKs8TG9E4m7njl30IjBgPCKOy4IBLqQT+u4qzuwaivJnY1jT5
         3cFYq0BeiDKWVXsMKG3P0tjl+z3cuQhdDC/D1v+FbCjvnji3Z00BGNtPFVTxznA6fpJ+
         IGfYx45cnUCsAbhRKjZVpnsNPUPUGVhXfy23iuoq8900teLeJaAkCZBm6n9VH3SA9KTi
         SyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326770; x=1792931570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YoTkqetwDXx7EPpERx3l0yijxyF3Cc+zIbtbMzAnzsQ=;
        b=U2PoWZpeG9ckdI3Q+LFtHdup7Lt0kx+h2Dpn73G6t/gTkyOqfmjaUs4I3lbUO7Hv/m
         3cvy5qZy2FqRFISEdd0eJUC0MMQ0d7OjFsLDMt9q2/koeStbSGtxMD/o1xskEUgLWLd5
         tlQ/a621Ah+JHXriFtSVMmu8vem050t+Nj5e28BHK2Ym93K2mEXv7r3MUtA6+T6YDe6i
         EtW8L9IsYKihXIGv/tVUzcMJM3Sa7Rk1GaQf93h0wDp7S0OkjbMyqEu3DC/MKJlhWfw/
         m97qduy+dzINhNjoH5jrKhf5RN3YjjxffWDnqtiuS1lbjtw/tcdF0KW2LzWXtPNL1vKN
         UZpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9N+Hth4+skDTPAWeIPIsev3ygZ30oPqooqGfPv5cIL/rb0EqQeJS79IdHwoQegwfD3Yo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJZcBT0+ja8usRqNLxC2fmYjRe6s78h6GfReYOgs7TAn1Yi1J/L
	jYIbABYSqaHE44Ey1XPZvz0OftKjPjxnqrvGhcgULxf4bPFi7XeJmlyq
X-Gm-Gg: AYBFou38OLAqRalunVdcBRT9EQdcgCQ6ctvOhJvRjHptG4FynVodZvD5XChDjS5r7tX
	l4wFGGiiLf12LjywrbLOd38eND8uodv9z0AUFF5utV5AldaQICPb4TtQpZsZkRB4FRNicvDrCAj
	nzapvs5xbukFMZn6+UgAlhAaTHo5qGmsMB1WSpGih+aRQw3VPYTKZQ8TNRU8JztFSm1/ZWJw6Q9
	+Lq+pppmuk3k7eWFTxlSAzQUa+ZOjFxUSm6SY9tYcUAkM9OoP1bJxCSoYAIGWmB2EIheK1Ojedn
	dbqq0EDReTa0kja+m/IbI5jqdzhbLbEzcGiGt1T6u4mCgXwONGVNzUFXvJsVqeBw1zwaoY46DCF
	IfqnpLMenEdxzyiAkQG2f2eesuFuYUk4kxnx4ppw/FfCFMkGluKSGe3wIlfhC3Hqy8c8un9PkbC
	ER1E9i/qERTJ/hGIoOjfqP/0tOd8yR+IsN7tux5vVP+yNVksusT05QvHtbW0Dk4HNZGuxWcJpM0
	8qKAv2QDLYzHTSXLT30GVkzx46Ddy+lLcgGlqTaU0co5KdVTU39qxacFRJzjJfXE67JngiHMXWU
	it1qfIpoSEsCSm0p3NXQflo=
X-Received: by 2002:a05:600c:c117:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a1d75af362mr75981735e9.4.1792326769990;
        Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
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
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 3/4] arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:26 +0200
Message-ID: <775959bbb03ff0b5dd5c45b5c8793ab8945adca3.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C3 bus recovery as open drain to
match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 24063bf8183d..b0ffcb534cb6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -104,8 +104,8 @@ &lpi2c3 {
 	pinctrl-0 = <&pinctrl_lpi2c3>;
 	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
-	scl-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
-- 
2.47.3

