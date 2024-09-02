Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFC01D4603
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725277636; cv=none; b=qRmezKQfji9midvlfPY+aRmhbdxqbhiOF/msOtMVe2WhtG4NG4s18DSkj5E2T13PuX+9ymJyULrOb7CZHI/19bhoXtcXWlBy+WS37eQtzc+wYcPagdKm/Txo1Xr/R/CsD4wO3SV8uXXydTf3NAs/qxkjIyBuKJlCPYqB4aQitB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725277636; c=relaxed/simple;
	bh=o74jyQkYgHGz+wE0fizxVIw+o+orn4Ck0OdTUp5RnLk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ReAh+qr9jTa2s8Bg0FE4r9+ohqvwzXnLAb2R5a5GMwnoTrpgVw5Wh6luUPZx8FUarELLcEfRGG85LTI8taWbYMVDp4SSf1crv8nbkb5UDxl9j5oryS/XSNNQt+vxkG/KytVs/4qIeTmFAKDb4fGvxOtzgrhPGFADlrZ5lx3C2YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=jwrSW1MW; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="jwrSW1MW"
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B8541889AE;
	Mon,  2 Sep 2024 13:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1725277627;
	bh=KrkwA9IVTYMSXqFC8s7yAeoY9Nwrqpd0bO5czAQyqLU=;
	h=From:To:Cc:Subject:Date:From;
	b=jwrSW1MWMezP2NBj7HYR2AlanK3b3h6J44MAzL97Q5ZpbGqgrhzAIv+HD1J/aRtE0
	 Xx+wJ5boEGqglzXFQlO50nWR8OOku30kAshPzVXuWTmgaRYoav108hRCoIDOt71NAa
	 PBLaMroJNHphx8cwYpQGNb9vMzSKpSQpnrXlMXDzNDDbX6ffSxaz7YDascNMgsVG5z
	 A8pqwdJtmwl7Rjgiv76C2t6t8e3lbngjhzYl0rW8R3YLR6vgppefnslUVCl9SxxKD8
	 kdfA0UCf+yzn1z6g8hlbk2JDWIPPxKmRJBdxmBjdO/JFy/wVwuV4cQS3ekoF/V67BP
	 aHiF+NVVoqZuw==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v3] ARM: dts: imx28-lwe: Fix partitions definitions
Date: Mon,  2 Sep 2024 13:46:50 +0200
Message-Id: <20240902114652.893272-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The SPI-NOR memory layout has evolved during time lifetime of the
device - for example special partitions to keep track of booted devices
for A/B booting scheme were added.

Signed-off-by: Lukasz Majewski <lukma@denx.de>

---
Changes for v3:
- Split patches
- Modify the subject prefix

Changes for v2:
- Add more descriptive commit message
- Replace e.g. partition@4 with partition@fe0000
- Use lower case letters for HEX offsets descriptions
---
 arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
index 69fcb0dde940..a954fef8bd8e 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi
@@ -133,14 +133,21 @@ partition@90000 {
 				reg = <0x90000 0x10000>;
 			};
 
-			partition@100000 {
-				label = "kernel";
-				reg = <0x100000 0x400000>;
+			partition@a0000 {
+				label = "rescue";
+				reg = <0xa0000 0xf40000>;
 			};
 
-			partition@500000 {
-				label = "swupdate";
-				reg = <0x500000 0x800000>;
+			partition@fe0000 {
+				/* 1st sector for SPL boot img source data */
+				label = "spl-boot-data1";
+				reg = <0xfe0000 0x10000>;
+			};
+
+			partition@ff0000 {
+				/* 2nd sector for SPL boot img source data */
+				label = "spl-boot-data2";
+				reg = <0xff0000 0x10000>;
 			};
 		};
 	};
-- 
2.39.2

