Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECC31C1741
	for <imx@lists.linux.dev>; Mon,  7 Oct 2024 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309049; cv=none; b=SJo/UDS228T5D18Ie1SrfCuPpCK4+xKgBWovdlMWsWcVM7jaYK5mg7/vq80fsco6ZRY8mS/wKy6dqydhZuTFDqRmhd7oVC9xjePBxEH+1qf3i1pbuU4DrgV7hanxnWeVpuf4kWot2tkQlOCHGJ+NxtKW+RAQM2iZbdeNyyCeku4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309049; c=relaxed/simple;
	bh=vME7vVOM3SV7oKqQNPDmicSSIKn1nnrrTXbwGSL2/rU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sw6adGYF1BOKAVBjQIUcJeYGuEsPmRSIDEsqhXO+K+g37CFUk8VLcEA7RZK9Sj2Wnq0QhY12gU7YZOhzigtktmuZiQinKnjfij2Fp/omui78y3uCxl2wwx4RQPQeVOWQMlcyick/AzWljXE1toa4cM7N6NeEJyggt2C/65+xkQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=EH8VCsYN; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="EH8VCsYN"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3C3E6884D2;
	Mon,  7 Oct 2024 15:50:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1728309042;
	bh=oIN6oCoCXM3at+wiCs/ulIOeHqZPKmiQhze+gilwUDI=;
	h=From:To:Cc:Subject:Date:From;
	b=EH8VCsYN5YFTyIa5CMGuEIuFwpxiReYlDBG/ZtHYOXaRD28MGCMVI2xPFO7FEEuSM
	 5qDUyEFr+elXvK0tF9FlQ28+EYPcHiCkbMnCIDW6M0vnG91We3THKftyBw1JI0nZFL
	 heMoCwJCZtFeR9z9GWOfRmITkRQrAjwckSDsK02nw1V4IfQZp4SghCumyhP918Qiem
	 TlGZzEO8Ah6C5iwlz8H0d7pjcsRcij6hsCIp90PhaLcyFKRmBFNDeXk05WZZsMsWTt
	 LfEozCa+5z3ULmip1Tih40d6vXAytnvtSqcm8oWZL9Z/oXy+JVEPgra080UDqyewXq
	 +2ETOcLfduS8g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com
Subject: [PATCH] ARM: dts: imx6qdl-dhcom: Fix model typo for i.MX6 DHSOM
Date: Mon,  7 Oct 2024 15:49:58 +0200
Message-ID: <20241007135030.30559-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Each DHSOM uses three digits in the Cnnn part, drop the trailing zero.
This is a change in comment, no functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dts     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dts    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dts
index 038bb00255567..775caf8208c5b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dts
@@ -3,7 +3,7 @@
  * Copyright (C) 2021 DH electronics GmbH
  *
  * DHCOM iMX6 variant:
- * DHCM-iMX6DL-C0800-R102-F0819-E-SD-RTC-T-HS-I-01D2
+ * DHCM-iMX6DL-C080-R102-F0819-E-SD-RTC-T-HS-I-01D2
  * DHCOM PCB number: 493-300 or newer
  * PicoITX PCB number: 487-600 or newer
  */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dts
index d4d57370615d8..6efd7e9fc1b18 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dts
@@ -4,7 +4,7 @@
  * Copyright (C) 2018 Marek Vasut <marex@denx.de>
  *
  * DHCOM iMX6 variant:
- * DHCM-iMX6Q-C0800-R102-F0819-E-SD-RTC-T-HS-I-01D2
+ * DHCM-iMX6Q-C080-R102-F0819-E-SD-RTC-T-HS-I-01D2
  * DHCOM PCB number: 493-300 or newer
  * PDK2 PCB number: 516-400 or newer
  */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dts b/arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dts
index 4077b607c29ea..e42c274a9014e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dts
@@ -3,7 +3,7 @@
  * Copyright (C) 2021 DH electronics GmbH
  *
  * DHCOM iMX6 variant:
- * DHCM-iMX6S-C0800-R102-F0409-E-CAN2-RTC-I-01D2
+ * DHCM-iMX6S-C080-R102-F0409-E-CAN2-RTC-I-01D2
  * DHCOM PCB number: 493-400 or newer
  * DRC02 PCB number: 568-100 or newer
  */
-- 
2.45.2

