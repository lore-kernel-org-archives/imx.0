Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD9A3BA229;
	Tue, 24 Mar 2026 07:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339150; cv=none; b=dTwlULUWYJWTzLQXGnpZZR4Gx04BDXCCf9NtArof8KzQ1Twds2vG1hvMCdHvcAYHe+AawdW8nIIMYaEsStDF+W9SR8dmcDTORGd8XDJO1yNTQRkQk+y7V1wkEjDEz1j2jelJr46Ktdtbo+QRjIHDG+y6o0wlWHZeJtmHcVYbHc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339150; c=relaxed/simple;
	bh=/exYHT4xvwtRNFT7aSwLX7YZqQtwhyWqfh9k71LtQYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CL9d4w7a2Ln5LnIBtpEyxcsvYouAVR1uS843JPnpLXk6SdPW2/fJ70ooMWiHub6wGQR3G26nhTJxd6tncNlZBcW/T2Nua9qEeWKqW/u000m9b7e+ttMDt7N4U/6yzacgXthD3SkCBqX7lzHNw2AjXMMsR6Tf21BZqPUjQJRgrEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Hjps5GQW; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Hjps5GQW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=si/eobm2/301x/lhWsQuk+KprwyUBTmSi1/KkCexfss=; b=Hjps5GQWep3LPWQCUHnbszejTe
	7xA1D8hzaYKunS5zJ8hp1Bdm0OsuK9dS6vo4H8006fpJ0X73ywNERmf/M5Nkjsb4HEMTDU9u8TSTG
	Sxn2zX8CorzXOMqC+g9A7hwtCajYVkSlea4DcHNpj7C8t3MrfUiShnPqUuFnYT5H7m+XP9l6SX12M
	/Jkiz+7saLmqwNO5Y8VhSiAjycT0aN3ikcjT1qvNc7RcwdESdZ/gzKA2CfHaMsoKl6jlwFIcVeS6Q
	pZLNOM1YWms97B+xAnoLNrcKu5DPb2sP59eHD2NMlguzAygpSg6yiH5d56hwEDZXMw41E5pSWPFco
	Q5b+ltHA==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4wf5-000Hjo-0Z;
	Tue, 24 Mar 2026 08:58:51 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4wf3-000Oz1-2t;
	Tue, 24 Mar 2026 08:58:50 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: imx8mp-tqma8mpql: Add DT overlays to explicit list
Date: Tue, 24 Mar 2026 08:58:41 +0100
Message-ID: <20260324075842.815005-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27950/Tue Mar 24 07:24:19 2026)

Armbian installs DT overlays using dtbs_install. For it to work all
the overlays have to be added to dtb-y explicitly.
Add the overlays for platforms supported by Armbian.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 9a55a86ad385b..fb5073196fdf5 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -347,8 +347,11 @@ imx8mp-tqma8mpql-mba8mp-ras314-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
 imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb
 
-- 
2.43.0

