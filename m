Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEF73C9897
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913390; cv=none; b=lqjod8OppwffiL0jQRMcmsZGv14lUpgbB6/qV7d6KK4pYRdqjDjup2nd15xxy4mFZazE2tyILd/AVSB66qrG4YakvJcWjvdOXXr/GCSv2QPkOKC8/3BrG44zFn4lAnQPuEiB7Lk+YjjIqBbuS0M1qfz98DW4ts/5djp1fDpfi8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913390; c=relaxed/simple;
	bh=dsGSNHPPVfK6uc5Otj6tvjUjFbJ6078d2I1D7Vl3PZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThVUp/oHWrLJg4P3h9i10rfmc/EC3sw5dR060TV/Y2Gew9k1GEPsOUiCha7PQfg583OOUh3s+mDiqdMEf/4T1pXBjmobUKVlGhDvbk8WwtVglAEeN8z3cCaqps293x4+kev8m4BzIdMu0MnI0PLewSKjaCcjrBTBmslJbB4+ziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EN85h890; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EN85h890"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso1851836f8f.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913387; x=1781518187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwOWIM8NwelCmbDJNk3NQU3DHsRthmcQGbQekObLd90=;
        b=EN85h8909eVZkmXrub+SoNfyHahkm3KoHH7qjPhd4Hl8pfqY0UoBOwfmw+eqtmP9ak
         NhbWWEnOI+xdIzeDdh589tIHwxmQWuqT7W6z4KlIb9XQRglVLfHQefD0CtANCX7cx8BS
         SVH/xUuq1AgA/wDRrecm0NSLo0rzTbZYsoLXNOiXpkjeGtM24U0GkbSKH6s+BXpgbMdO
         zy2uNrv0OFhYXjkokfp2QW8Fb7To7XlSoBgfgqbckqzw1DKBDMXDA6LnjAmuzNX6bmwA
         edbnedhPNMzaYlTlKmKWpVhtNEOZPmv0Vr3C2SSwwmRN/5k1rH/Knmq9QGFxh4UMqp1k
         CL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913387; x=1781518187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gwOWIM8NwelCmbDJNk3NQU3DHsRthmcQGbQekObLd90=;
        b=RiEs9sDpF3R45PjJfEWJ5Sg3BnWnI2fBLwGMS/IcbWMzqBFO9FTBL/2RvzoVkX300r
         mVeYKMRA/NPjohnseDRQTtMGWu6QnfKYmcMBJESS9orpYClij/HhcVJLyFnzoXqij7nt
         Z1icNPWRl7y/o8ruMQd/ECr10svWDPMHWQUDZDl5o3O3x4Sg6o8gmNSiK14oJ/YSOf+T
         2WWLfU7htZRDqGt1XoOqimJ+i+dcPP0Zq4AHZkutB7DYIV/V8JUnUuYOI95RBFII38Qy
         8tN/zZQZDTLwdBP9+saNq5lww0jSlnGGwxMK2N391qc+bSqrvZ1nw918hdhzTi3LLywX
         R8Zw==
X-Forwarded-Encrypted: i=1; AFNElJ+vV6mklpGFY8yPMJ1zzh6vfh5/gx3Y1aQW0VhCpcFyexoz9jH8nbZmD7r4RbBeBsaKUpg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyM3F/jO8Z3RfQcKI8aDOdmnKs0BmCwCd/0/YwAWpTCS8kWDUtY
	EU3DqKEpQH0+NyHzd3UH560xdzcfZaVoYTZ8KyY4T3pe+eO3oarF+6Il
X-Gm-Gg: Acq92OEOny/40yMoCUGw6JIj4Ne+MBrQ0EwoKDoU08DxoEnoWRNuuCSNmPQQDXptDn8
	VFu04B7lCLNBLBdUOtuziXwaPPl+w3WuonO2V9z4KJ3NUf+UrKjOJwVmjCIBqZ/9g4u38xSH25Q
	nNNmbHN9SJmX1KCuoFLBpmzrljYocNkLC/XXBOMyvLkHMlP6Z2eTB0AURXj0I8LnkaIwbpfSQr0
	8chiwcM7sGFUtP6lOKPFnQOHv06o24OLfmmycO1X0BWuX0A2dziY5BOIOLpaqT0q3iuFl/Ivbm5
	QPPYdd+eakmTt5Mwi+CDGY99j9Wax+PXe2VL9afaD9mQB0PxyEM8rTeqpdM7hb/jzoPNt7gKxy4
	pgvaSE5SFecBGOjfSwWK2rUMarjZ3DnMHyOPO8nqYtQPSIXHWgx3bp2yB/UL7FOWEP8hspVQCQ2
	ggdgdzzPqTQ8ijlcZQarhS5Qdagwe8tx78ZeOuH/S7Uzr2NdDb2AqVM9FjNglYdBZQKYd0yEOZ3
	AIuNBjmvki6pjSkYJ1kSo6XhElssvh6BhqcDRYN88dxzqL8IxmlarIBuUY=
X-Received: by 2002:a5d:49cb:0:b0:45e:fa7b:a7d2 with SMTP id ffacd0b85a97d-460304eb5dfmr16501423f8f.7.1780913387160;
        Mon, 08 Jun 2026 03:09:47 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:46 -0700 (PDT)
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
Subject: [PATCH v4 09/14] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Mon,  8 Jun 2026 12:09:27 +0200
Message-ID: <3875138d135b3aba6e39b585426cd4f641a92013.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
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
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index bac3de6e1530..c7073fcb679e 100644
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
@@ -327,6 +334,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
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
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

