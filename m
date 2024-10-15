Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210A71B0F3D
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 22:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729032319; cv=none; b=Pg7Rp+bfyckXzeBCp0WJXmVYCT4cD2xeXMOcFxHBo3iMX0TuWlvF0ntkeORYdt8ouv5ItJwv4f7GEC86kxaexK4topboUlqJgVje26N1n0vRlYbE+lAdugXkUDok5EwdZRERupo3+SKrtnfXgSD4okVQnEAzQZ3zZ8X/UEHSujA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729032319; c=relaxed/simple;
	bh=LrKAr/EB55J3iH2QEKLMy/GfXb8FL/LzKpLIH0xUgp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VlbzduC/09Frt0sZAArVINhKgIzRePNG6SPoaeAD5XbAJLTtE0nwJJaBOSsF/uZwoaRukQKYqIpuYbTO3mStMk5hDzo/V1PJviPlnxr8B/3egsiSuUv1Al/RzXV8iCALuLUAsPfJofahkg6Y8wGGBZno+KVTu0G9BAzeVN2nlD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=XnPcRyqL; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="XnPcRyqL"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2B28187F19;
	Wed, 16 Oct 2024 00:45:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729032316;
	bh=zlGIuq5CB/mEW8f4HaxR2NBQBs9E5vMufUVvQanNugI=;
	h=From:To:Cc:Subject:Date:From;
	b=XnPcRyqLF9AvOIY+j7QiZAKafNLVle5muoA1/tL8/Vrb7k9+cYEtBjIXfILtsYT7W
	 81Sk6YnLbTMKO5xzRrkub0vTuUfG6spj9SLkBIB/rM5YBWh8ctA3c2pHM4dyPVGCPo
	 TrBlRh671jDtS0aUvNLbmRf+zVCkCxtASkJYsditEhyVG/zvTu+c6kGVU1ElMAbegV
	 z4qugn+WX+DlQGyBSLZSAavBgmq7xYuBfVhtRbS3TFoDbIqwCPsf6ByTeE/HvVd8I1
	 xfhJ+nBPeUfrIqeBp0gNcsSoMLFIBDRcgehXs9MCAnOUU7/DbfoGaSAyjhRntgB8wG
	 MhQ9x5PKldrow==
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
Subject: [PATCH] ARM: dts: imx6qdl-dhcom-pdk2: Drop incorrect size-cells in GPIO keys
Date: Wed, 16 Oct 2024 00:44:52 +0200
Message-ID: <20241015224505.94359-1-marex@denx.de>
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

Bindings do not allow address/size-cells in GPIO keys and the GPIO keys
is not a bus, see dtbs_check warning:

"
arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: gpio-keys: '#address-cells', '#size-cells' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
"

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
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
index 6248b126b5578..773fdcfcd0015 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
@@ -56,7 +56,6 @@ lcd_display_out: endpoint {
 	};
 
 	gpio-keys {
-		#size-cells = <0>;
 		compatible = "gpio-keys";
 
 		button-0 {
-- 
2.45.2

