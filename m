Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95425517BCD
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657758; cv=none; b=LOf8msBYCj3OcxKsf9WYU5wHmXhRJ0bIQtegns41KL3O4G6tmIKadnd11jTT0qhRgMaIZRlekieeCNW3eOsbecIW/5DH612omzVVspjqH3rTxGMUeGMZy4Dhq/mgVADWWyDYXVQcQ2YT0oG4RSucSdc4RRTDodw7SUfjBaPMBhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657758; c=relaxed/simple;
	bh=JSGj5xAcSCNQ30zQL91dR8x6nFv1RRyex1oTM12XUUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCt77nVOdO8kzXY421iDZEyz9icmNPpwyKT7MEEYaydFX1VtQrEJSkn/WDqnIkjqkpWN8WHgIiZGD5tzlZ5XNlCjRcE/4lggn/Z7hB3O5exNK1D3m6RfYHkvPieYB0d06UJYpSrkdTBeubSvo4HApn/LyIpy/LluDZcvO+uPaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQiZqu2M; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQiZqu2M"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso9336735e9.3
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657741; x=1790262541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kT758iWLtr3Wtamxp4dNWdKJ2omPK36POe0fhekDF38=;
        b=OQiZqu2MiyjjEIABRlX1ZUzN/k3sZXSHlVHXhOXDiVKkmfBRepTiVvun4pkzw16hlR
         5k5PEUk/RtN/GNrBezWbxi1Jy7mZgcdI7XryZy6dzOU/MseV8gfCsSvmtvYaRaPGfzK3
         5hwD8IAidTME9VzHaVQBNNJhok8UmeCasijgkxoKwmq61lFDxDYRVkT8H/4hFRg2itye
         wwgdRqd2fruQblnGe7y+YdN8I/tHsjB2czYPHuRsY3gqByZUqTBtyqDacaAiXey703Rh
         n10O9xXcc3N6ifivaE0ainglRYd/vQT35MX01F8gZhJlxeDl80lr7h6VkPPbARTdJX4r
         RbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657741; x=1790262541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kT758iWLtr3Wtamxp4dNWdKJ2omPK36POe0fhekDF38=;
        b=JmgTWGeJk0Q9TtBkOzjc2I1n62rHEpR2ofUnV++lgNWQqaTois7RBnpUOvwRKoPeV6
         IbquGwvk5NAsG9GGpV/MIMo90ZQcCZkbsTuEiqhTzsvV9g4tmxXCLENOf2eWAdhz0j9n
         MzcKWQMLY4iPiaTmcFMkU97EPZ5a7vRbyLFbl2s70NdIAZouELgMtU4FU2ENYqAb73Qn
         tqL+4n6IfD/VmWqFLw5F/1ueoU5qocckCoN22bh/ao6IPs+PJdzj7C6HPviTp5eINjLO
         +PHRysCzwnOeHoAVNnC/iYZYYn1hnOiL/O93s6YgFv3V6tofz8tda/43x39E5LAUVcV0
         3sMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdwrOOxchIC7JIjf8si9P4f0GvBUqjyKyxBnfteALVX/pyl6fyIpbmMt3SUdjdPnuw4hM=@lists.linux.dev
X-Gm-Message-State: AFuF++lmRuhJxuidq+iyR+Ax+JU9vNP+285bqET6EqPXLe16m1s7+ySb
	2kytGGFc5cn8jO3AfEHrlSvKl0jk5KwbFMVdz+kPl1ESFPIpi5Qnf33z
X-Gm-Gg: AYBFou1KYJpspQjZyRnWzugPn6iCJPGrWxYDPrNbWHlBFmIkHMJVQsVRkxRDAbcJw6G
	rOcaXh8JdGYOe5+JSbTYkTKicdk4WIOwNI1+ojtkEF3tJUXa+29OYNwR4mFYYq3iZO1yMEfJDyA
	rLSt6H9afsk1zql1QyZUEZZmUHjJpaZAMns0Tp3L+93l/pxH3/xeXzM9agtcIs5tjPAJWYTEpYe
	ORyC2e4K52SvcfkZkzPrRUS2TpKzGfztpW5gI9vEOlfLirwFbFrYc5i9zQw3CXavxlbcoWpBDVf
	3goYBB+1OUQLo1AvJDHw7v7lvO50jtCtZte7L0CeA6FuJk54osvs7GfsfaJIS7UJSGIO+NSBcfD
	tNIbMyzcolxLlj/CmlP4okACVLIZjVzHeUvs44iCyDU6NJra7+xmMPgHFE21CUA5f1qdfQCPCmb
	0vpui/Eb2zR0wbY1amxXQNZAqf9BcUTU1NRySr2yjMoGxVRe8RSl58btjOmLVc594/s4S0vwAjA
	0T3HuBTiRdu4vtffF+aVCvmtUVpSBNJfvIiYqIn30beQ16VuH0JlrFo3jUmQC8Xgf+uf6QpAxAl
	c8Lh/rzaRvRCWqSG7LYaHA==
X-Received: by 2002:a05:600c:1906:b0:49e:8418:3858 with SMTP id 5b1f17b1804b1-49eb51902b2mr88747985e9.9.1789657740710;
        Thu, 17 Sep 2026 08:09:00 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:09:00 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v1 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Date: Thu, 17 Sep 2026 17:08:44 +0200
Message-ID: <73937e762f723d9246778f548c4c9d4b087e4532.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM available on the Variscite DART-MX8M-MINI SOM.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c7a9eb23e5e8..9fc0f7e551ca 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -138,6 +138,13 @@ &i2c1 {
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
+	st33ktpm2xi2c_som: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+	};
+
 	pmic@4b {
 		compatible = "rohm,bd71847";
 		reg = <0x4b>;
-- 
2.47.3

