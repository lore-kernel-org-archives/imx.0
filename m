Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2603D4302F9
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330515; cv=none; b=EiZggj6/DZTRSrPMxDStx0u+N9/B2dVflc/eHxdeXNEhVrgdk7aJmAgaJ4N5hEOTePewaSpahyOCFih9OTmrAQuxMhq+pgOxudZx/9G7l1Os6I3ZUglpOmEig56erC+GaXek4vh69rT59i+r3WTv55g3W0tx9wifRE13LZWWKys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330515; c=relaxed/simple;
	bh=azFMDunEsAeZS7lsKgLMHZ5TSgtywquodFmaXPUTAGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0iUw1EOZB/6VaDmpznENaPKv61tH9l6KiFpcwDrysTZbDnsYfooZ17dJfcBocgejAQRTv1hBYyaKFQtCytKk7FfLBpxwklYH/8qRp863vQU9fcSmdFLbe6S47EUA6qdHybXHGI4CeUk5cLSVXPgp67fK4CWKyBD/RYUmNFW9QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcZT5t8p; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcZT5t8p"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so10828635e9.2
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330502; x=1783935302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4URuhOSsv1qbc8AjA0mUMbgajYr+DySa1kGTUK9qwU=;
        b=EcZT5t8p+0VGitSFO3d7w5sjLG7Ivt+BCkymEZ5JMMk4GYuLEnFeadNsuiVFCvKoVn
         fci0cwZIC2hfPLj7mA/VSB+vzEPU0CkhseHkM6kdkoLnboDHvnwqxPSQ6xcjiPLNNcKn
         vczDpdGyZKsRh7Nxwk/pZ3lsfoIhnrSZ4rmwPD9ADJEc8wjoh4s0kVHvSpTD0HFOuL+i
         SpTG2iHtYpXajC3FqMPC5S0U1n9KpxaujVRaLSTzAbOAEhxiuIYu8CB6kG3LaoLwQn58
         ioUEJxSDNm0J2G+sVLpHtRnKE71hRRoZNbWpGPdj13WsICikqbl3Ijnikjh4zWH4cRSk
         Ezyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330502; x=1783935302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4URuhOSsv1qbc8AjA0mUMbgajYr+DySa1kGTUK9qwU=;
        b=M+7pjXw9IYK2PRmiSAPBnbcGERfiZUXnKdL1v/3kA1Cw5+Ghrza0esLFpXEL+SSxFM
         R3GTmW15ab2afcPLVfgtZyxEgwkOHjhCthwslg++zYjIVRXPlfLgug1m9H4MLi3JPW1v
         hoNBEbLY7LvHvWJmfjhrUvhE005yJj2E3ATAX4oUPW74ukJF1gmR7EduElg1pYL8TQsi
         8ICvdB5kXtATc50QX5WpwcFpa89SU/+hQaYAtC42bgRVkWFYtkFRO0P0jPfVLQbbtXoj
         ceplMimsddkGI85E7whWmlB0H1wct0kkXPFFOu6x1faFch8WQyWyXHf+iGKOil7vG/+b
         p7NA==
X-Forwarded-Encrypted: i=1; AHgh+RpLMjcTgJxoYw3SKgVNvvGaBX9ZmJUoFbQl7i5SSvpCpsdgQDqpjjIqcLljVNxxbBSVx0g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvG2SuHMiKRuY/Q+laqyIljehibh23PmwHFifHU5fbBYmnSHGm
	02MO2SuWYI2diKCkhMNqOR2Z1uP8VAcvRji7PBqWtPcuxBuFKP0Ya1kV
X-Gm-Gg: AfdE7cmVvp2mHBuGTgrMJ1djVjLCyHQkxsmQ9/FHhlII5y7ZykoBqee90srwItXCcpG
	jWJBHPSrYmUZjNZhw2xyft9crhBQVE3Xc3r3jF8UDPq9KHQ2vlK7ouCqOV4wgfudoCmLnSIkmfK
	r+fpGXH9M1eNr8xWUx4gUYpVo/Dr+L5zl6HWMBesyFeiUiTnVjvL3PX4mNqvv4pXgUQ/XgP+OO6
	T1RiWmM1kYgid2vgZ9JQtLi1L67gWnLnCLDoOiVNoWfUO/X5ZPXIFTvfjc3JYeksaCShwvbG07g
	f8PIlMlGvdANI6ItFpCyngBNFu/5mPFBTDBp3TlMRyBc2TeKK9O4ptF5IY9xEcaQGrzFWWlGDuY
	rgO8eERw2TWpCZIusb0ZbujWFTqA9QgRETI3oVNZ7jWLJCx9631nDxDv5VPmNJeO1d3NGHUsm1V
	o/3jaaE/j29SgDbzQbjjWt4NgOFLfQQSot4auTOJzhC6GPnlmB9BY94zMJ2G1mCk3I/0G32oMml
	JrZanbzmwMZbvsWklSap8769Q==
X-Received: by 2002:a05:600c:8715:b0:493:de4b:de17 with SMTP id 5b1f17b1804b1-493de4bde72mr8048525e9.14.1783330502365;
        Mon, 06 Jul 2026 02:35:02 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:01 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 10/15] arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
Date: Mon,  6 Jul 2026 11:34:40 +0200
Message-ID: <7cd17d03fa70ee1f5fd5986fbb0e8a39ad7b4fbe.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM2 device on the VAR-SOM Symphony carrier board.

The ST33K TPM2 is connected over I2C, and A PCA6408 GPIO expander is
used to control the reset signal required to release the TPM from reset.

Add the PCA6408 GPIO expander and the ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 53130b521b5b..7d016ed5e911 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -160,6 +160,20 @@ typec1_dr_sw: endpoint {
 };
 
 &i2c3 {
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5406";
-- 
2.47.3

