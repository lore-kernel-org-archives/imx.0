Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FA34AA402
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051923; cv=none; b=SFNKXXLHlUysZlnIG5/Ia8MpGCw7v1Qs20kv/LRm5H6QIok9CVdcQtlpBV3+LKyynPB8zqeWJpvc+PLhg1a+6zgGBVNmFK+2MPbdKz0XZy2J5bFrG+DncrXt9SCPxeyFTVC+fJ+uvQtQxNDjfDNeOleHy+Tgt/t4R914y6I3v98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051923; c=relaxed/simple;
	bh=HUysfWcwgaCnsXaXq97C5D3DJcHzVD/nOuWhNnFXHNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSdx4Z2KDGdE3jtxr8PoYydeD2Mapf7KUfi8NDs2+vyIqn36DIpt/eGU1RqGc/YaHnexLeBW2l/nDbI/ovkFkxEpLoNIuFhmDdIh/k+GwMfs5vzKg8Zrrhfkoeqd9TXNnvyeO4Ae5+BN4hHBDy3UpFjBq9/3gibRkdv6xn5djc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKKyqLX7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKKyqLX7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c6f764f82so569247f8f.0
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051921; x=1792656721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GHuAmdmkXZvDWTufmXOc4smtM5tKnn8omClhm1kd2uo=;
        b=mKKyqLX73qb8mltoWWgEoLcHXkRkz0x5+pjoW2+S8vcnOS+gYAa8qD+msKUTEIwuwA
         lKPvxQ8SR9g7ZHcHF6WgWZCejW+d+XVJc8b1CU+SFnu8i36Rkumh+XK7MHnx84xMEKO0
         9S/4Z4iL7WIccRri3RLUgtsKdKVxj3r1vk0yu/arAR6NCSHxtBEZFdNQWGcMoBQr1/Aq
         /zZLcEoBsHEdimaMyF9E8vo6v0CJN0oUGKvA+II9cAk7HlMnCgCmeNBNSYpXCdlSdosq
         m1XSzfAOWyiwAs1WGfWpVFt9wXYcu4jdvKdBwar4gYJGz0ey1Vn4pN4bVEOwr2/fZ6zU
         yPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051921; x=1792656721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHuAmdmkXZvDWTufmXOc4smtM5tKnn8omClhm1kd2uo=;
        b=DAdEoO0lwDTjKe/qn5meWGsDP4qWPPZo5kaM2J4RdiXf1mkP+wKno2Okw6QZER7iYk
         qdwg0vGH/r03bUFNanDux9I6OA7zQzVYl8LykcUTwYGloEYEKORZvcHF41FZ/8J4HrOo
         og/SazfaKg8HjaJtJhfDqHtzk6J103SUqoRUD7a0TI6bBrQDXCOQoN+KbIXt/sP+A/CD
         9ahkmgS/R5yLBYT4yy4x4JUT9cisRDnA2DbgXQveDh9MpfBpVoT8/0x93meVB8r8yI9d
         LfV4fzxHyUGpMLQWxmq1+u/oJ5sd5uKhHmLpvWZs4qVgYZ76Atja5MckBv1IJY22pOCL
         jigA==
X-Forwarded-Encrypted: i=1; AKwUvBxbSsr9pECFMpSEsDBDFZOlWI+bcikr4MseK2hgk8S9Q+xkzp7kg2seEY9lMFh2k1CB/vg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ0fISqinBgzXDvTchIESugfsssokjY4Kk+B0OTExZimEUxyz0U
	dBbWg/LN23Odb/Zf0gtcDybawjCHJIQEwqEOQsga+uJPxgpb9BEzLn+s
X-Gm-Gg: AYBFou2L+ORf2Y/3yk4ea9vSBtWq9//kqT3N3rGOU0g9DnTVbZGhqYZn9BmGlgFPu51
	NqgXI6zERQ/fs7JMu5BjSB+IcUmfOe6JveTVzmcu7RVs24KGvs+ZxgmfdRJnwjJ4oq8b4vup+oP
	ajlal8ToOf9i0S3UZaqXU6UCRN0+fs3xGSDhXk0T6J0EfDL8dERy41FZNwv1TTOu2oyWoN/Yszm
	oOvhpuX1P0QClWkYf83jjpxwHXOtvhLpnQRI73fYWfqJMhBrTaz7XId0Y64wa892RV3k/jmUcmg
	QBqfZ2mjKjoB/A6lqmU9vRopTFf7hB++w7tjDcHYnwDAebYMRGVHQxhX4tT68SkRPkcCjZmfP7u
	zdAgXZIYfSlM77buUBgsqR5jdvvR4mNgOS7n0tPVtMKch+Of3cxE13fRg4wygsVZlBUi00Ovvhe
	DylkWFd8Y8WcPWP5319rm/rmxlplLFHt+pJRNRT8QT7Hu7m+vPbf2ZhApzeQp8xAXXpsi+Y9rH1
	CdEgaBvS45yL7ee/ly6aMYMT98pdtC7LwkFAN7l+strPUU6uNmit4yB280k6ZgJJqaKBaVxDGxn
	wuhT9B3llUI+LQQwm1jXoDkd+6IeuotY
X-Received: by 2002:a05:6000:2993:20b0:48c:4442:54e with SMTP id ffacd0b85a97d-48dbaae710dmr26750262f8f.30.1792051920518;
        Thu, 15 Oct 2026 01:12:00 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm16237534f8f.35.2026.10.15.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:11:59 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag on i2c3 GPIOs
Date: Thu, 15 Oct 2026 10:11:49 +0200
Message-ID: <20261015081149.5919-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
following run-time warning is seen:

gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 3e590afa4fab..036afa0f6990 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -287,8 +287,8 @@ &i2c3 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
-	scl-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca6416: gpio@20 {
-- 
2.47.3

