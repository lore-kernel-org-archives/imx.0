Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBA249A3C8
	for <imx@lists.linux.dev>; Sun, 18 Oct 2026 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326772; cv=none; b=ZygBAnPrFN/YDKJ4JG89TlgU+rvKWy7YgVlXN+j+APAnYEDNd2RX+RGxjq2iV1krM+Cjb4ealu5GcNtBovKIZH3gVGrop1abqx/UTIKDMB989m6/fyVGYW/ZynorqFLHUYAZ4pOww6kGd9zffTQQUF6c4dlVzyZSWZyt2EAezfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326772; c=relaxed/simple;
	bh=Nukw122yROk9xDRYamq2giXRAL8IsIdNMGYZGAIWjvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psHeoduxsv/rrXU74TL2Susjra3jnIGJWrZYZIxkhe1XKLodKcU15JtXXdBKX1fM7W0a5xReD6axCsDJAXbgeXiBccHEM9VkJ9+EnbVBSAd0RzI63/WVPdokrZdlxn1bK8/vQPjTM/5NcYtbho6eaAamGINC9BYZ9w9hpTDFhM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DperoFki; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DperoFki"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so8131865e9.2
        for <imx@lists.linux.dev>; Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326768; x=1792931568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ea1NkzfJDwnTqydzvzwnSUsTKx9gypchzjscNQluAM=;
        b=DperoFki0z1UBBKM2uAIAHYdSR8U4v7mMJfiOFohRmpuZK/wwDORZ6nlOeiDWQleSa
         JiRcyN7op9ErjBJIODhGadsADeyYy1piiQ3D4RKKFHlOJrloWguoZy8hGFFAKf/FK+pT
         YgRYxlq3eJ8gdOv/pU6RdXblCwBDPN+4a/xMEMR6mBOS7FldpUiaxwjx1rzD+ZDEpqTr
         LMvqvENp0SF+4AeNQ2A5uekRCKtvwHVtNxLiw2gXiH5AppQwcYtUId7XQiNroc+fWv7N
         UFBuRNz5KXw1dasUI2Yek6VNyVowu8IS9ljjoJudx/DtbJRpayXITIJaCylQ8Y5ojhsi
         zAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326768; x=1792931568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ea1NkzfJDwnTqydzvzwnSUsTKx9gypchzjscNQluAM=;
        b=YZCRuCyj876Wfsasv5igwYEO0cdbe7ur7ZvWc5U8gJMeFvbXcA93w6PEItCYwDVJ52
         GuwwBhsLWHeZYA6k7+jG/EUMCSCD+vS4ZlnVkzsuqszQk5W7LusLvlZXGeXz/wehDep/
         IfTiZxmanmDCXJv4R7tfnvUD/pNg62WGGKhHNt8PxP9XON7240CRvLjJoJjA1c2HgKQl
         WFstMxiVLwM453XJiuBFzZfMCC0Rp/t3DmSrTfOMQUD3zms5wTI5b9bByQxRdBcxm++l
         88S7ZUAlLLLkHWwoPU4o6bM7Cm3Pj0OZN5gxmrkWc62Qd9XLeXPYojgZ3FnAIbN9r4/W
         EAEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbdErimL6y+vaCqyrn2U7lmRq5DDRgvXYrmpHVtJ0CD6oFAeA5xx2NFVFuIXZEcEgu5lM=@lists.linux.dev
X-Gm-Message-State: AFq9FYLd+km6hDyP9xvKyhHqb+zUKH96NYuQS1SqgYeMuiC4tDaM0eUi
	Ow6GSLKQYvUvn3KC0PguFp6eZDtClDLeOq7ob9zIv7XyO6jJ0gnVzY5N
X-Gm-Gg: AYBFou3PnF5mKo5h3TSo3FO8o9XjWoqcPFPJmj0PJWTmAL7ySrFmj5A9pMfs003nkeq
	jLyyuIOGXWkcQ0swWOqC+iY8hBie/VJXDCiGkRKdcRJcURHGWfdW/et6eJkXWHXmtb/M8mZEh7H
	99NAKCFQKxwOGt7qkiedTf2wczImSIcl2PFSzrCuVQVpF8Xs01Q72dylSEaiY9pyb4B308TzBM0
	8ZfoJzTay4BIwHYMcqy8CsmRxr7+eN/ZP972TGc7ubmgFUN9Vtj5mWLRICiL89UNCNuX8xT1cRX
	TmTVx77zhIRQUwpGSjkBpbKoLT3I3jQZKR7xJK4k7Gb8MJiD8Yg5EtYUQSH0m2rsta9JKTx7h1N
	GcqwQhZ2YMbTqqUWzgmY2J5TqZVrcoaYYciz3r2EHgCtuJQsYkNVNQpcOxfZSd4tadd2oO1WY7G
	gXxQJCe/josWPQP3Pr3YO+pMwpkVEyRg0TWhKEjrSDxsS19BBqGOW5ZdOrjUGEv0joJ1tC4MjgL
	TIFpEEab1TVWeVQRpEC8MehuoC5B2IzrCPXWFtFJ7pmZaFBznLrEPEnojRv5QkcAc8Jcqu0cc2V
	5Rx+cxu+fOiQWTi4YhVVOw==
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1d75ab363mr108377035e9.4.1792326767681;
        Sun, 18 Oct 2026 05:32:47 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:47 -0700 (PDT)
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
Subject: [PATCH v1 2/4] arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:25 +0200
Message-ID: <35386d3fe663aa5e42dfbe904b554968ab8d5f7a.1792326585.git.stefano.r@variscite.com>
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

Mark the SCL and SDA GPIOs used for LPI2C1 bus recovery as open drain to
match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
index c1e6c9978275..437a23840898 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
@@ -224,8 +224,8 @@ &lpi2c1 {
 	pinctrl-0 = <&pinctrl_lpi2c1>;
 	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
-	scl-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca9534: gpio@20 {
-- 
2.47.3

