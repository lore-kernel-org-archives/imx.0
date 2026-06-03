Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA4647A0DF
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488012; cv=none; b=Bxrxrv1R8mUM6B3zpk+gYzeYTWBuQrzNRGDLd8WLIvTd/EY5k79JQAUKG2IXOW5HvVzVeaHeyWVIPzAPlQC/mtHESKROdeUsihAwpqFZNKxDzg4pc72WRGHLiWLZSHTQ5BU21oQrHl9Y4QlGky5EKksB0/ZnIxxrFjxGaNxrvLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488012; c=relaxed/simple;
	bh=wimjAcDb8Tyk/BPEjvoL69eS+sd1AkHx5mZi/bDYjg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkqUOCjTd0zHDrDOT0VKWfX2e3KU9brjNLEN/5uDoI/I5sXyCVxpbIjNeEz5mbAGwAINNiWHOlfDQZFewkcH0OqTsSWHT+3XZvSfOD8VY2trLpPci7uT1Cp72CAvCpb2J1BCBSpTC62yuQvSJOlmfQN1FLtAyEEl0fPGDLLaMqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjxDp5w/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjxDp5w/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2766345f8f.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488010; x=1781092810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CHFXJWllu4uJF68Bw9JG2hgsYU4/gKpRVjeTCbVOFs=;
        b=fjxDp5w/WsYmwKAwuHjyaC9c4mSGYNkOuTC49XXVdTcWGmI0YE3JN8ZPnAdZfKHN3F
         g0Fx+pE09iHy3wRSlmk07zzSozEDlxyliMaw8SQWQDLWa0UUFsqNP0FKwe/j15BuO1OU
         M5Zr2pSVN7Eu/wN4bFGJ3EeJNFiFupFN8G1iXBTvATXBAA6FVJJsX7rScvdPfhSvRAhi
         0il+g/cJjkjTWVoxvpswkBuot6CPDb9GDBtSFU5zpNPryRQPNfc6IImoQ0ZVexKCcpYm
         c7BRI4raWCxEWKJOug/hcVAM78AyxQKTSQdrAlkJ63lAO68uARb6ke2214b/cMOKe+WX
         g8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488010; x=1781092810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5CHFXJWllu4uJF68Bw9JG2hgsYU4/gKpRVjeTCbVOFs=;
        b=h1jFLY+QEOUN0SwoDdbOHyjQyTBl36zkN+4zTFfPFAgiw7odthH8Py3jxL4LRXiwXT
         oNA7ch9VQszBisp3YefRvdOZu+3K2HXaHZZ9FErwSGFQtYcru5cxCzCqolmpwfWtj7as
         pbd9XDYYglxT6xolgAkfeFv7CKIJ8K8fWIeYhn0OnitGbogpa8yn27AaocFy3pi4BUxU
         cT4nJZizDOIGTJPCUEYr67hs9xvGQ3FtW3ymgHOqUui6E7HwxcOihYmhHcWCgeCUG9+Y
         HvrbhtPXEbyTBhtllqNujaEBe5CN6lIlmLbs3FCWRgohOh5ONQ7fytlWi2xadibbFdek
         fXOw==
X-Forwarded-Encrypted: i=1; AFNElJ/NT5wVFtSQ31NxU58NjHabPPVTMXZ7C6pnlgaueGb+vlNjv8McDb7ybPRWoxy0fouV/rc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhCoBkH7zphS5EU1aipU0anLW3B3qkA7f3cZHPlnCDTM0Bhrb2
	sq1CDE5D6yGK+eX2qa30UJktG+0gQVdxMNi2b5u6dq7Tgch118/UkB4N
X-Gm-Gg: Acq92OG2yk3eK0HtkXrRn2CAZtcp7A9B6KZyWNnVgUMs6o2FipJAtB2dLJzNNrPmGpr
	CffUQuU4erSMmtWcO0SXz1EqQfPBsvtQL70mk+x8Ua6noDMRuH2CDUio3Rw13FYgJ2Kkzxyhuoc
	iQpOlZbX0zlSEGW7M5fNNnfoCRjzkwb56krfvJEm5nqHMIiFU5NwEAJRqQgSDz/LP9X3FW9VpZL
	BeRdJSP492ykrVLZIDsV7zx66AVRsHkZ3TjqSzdELkIt8gRlku0/vdQi+v+fPhJFiFP2VwiSZ18
	2aU0OxeZTLUJi4ZFZGBa4okn0pEx/8DdO/yo4k8fv067zuoLxOBF7SK50nSPR53tjrqFs/0LOOf
	dnGZKQsjogNctMKuJ9Q1EpKOmziykX5liRDbtDyei5QmIkflcDsOOOpGuT1KsUtJEtOyGrdQkCs
	IG/bYyu+VfCkMYaOpMWpbVyLcasusCVjNXqJrgPToUYtfLQto9ALXM02y78Eb8ZF9UsgX6KfVXt
	WkadfhIrQ0fJ74i4ru0nwLoYuGOb60v2RXAe9PpBIbsMJGu5GRloNvd5c0=
X-Received: by 2002:a05:6000:707:b0:45e:945b:276 with SMTP id ffacd0b85a97d-4602181e987mr4347469f8f.20.1780488009730;
        Wed, 03 Jun 2026 05:00:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 09/12] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Wed,  3 Jun 2026 13:55:47 +0200
Message-ID: <3801266c8e0fe7a7913dd2e376d1d58001548f84.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 9622f77f8f13..df4409af26a2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -321,6 +328,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3

