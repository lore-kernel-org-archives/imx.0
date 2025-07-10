Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6920281341
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169731; cv=none; b=SbXHRHlh7swzag1UNEYSVJ1wx8G6EoWEjVEbNgvOCojz/QW2409PnSI/DMP1WqD0zzWKgok8F6xd1zM0ab5/dNaDNdBiJnBM190FpUfOJ6EUccYBZfXcNUWJyI/jZ+bZFZpIvVb7x4KkoKiBUftdG0Fvc49J9BYfH67/A7NIs8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169731; c=relaxed/simple;
	bh=AdTSV5ozpv8o4/9bxI6p1gy4ekYAcxlG51qRbTSXMs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBG71rGwpC7GspiXSbWWyeFp0Dw3eQehq1TOSZO+iQZM07SOSMpWhqtpJNvUZ+oz4pY9RHxj+bEHzDbmqt5JT5eRzgrPnNrqJMFAulM26PW4vsw1vdzDggJiwncnvwI1tDS2hVhKsN/vESGYSNoRL3TiSKA5DMmi6+IOSjZVQJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mWgoqNmI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mWgoqNmI"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 76F4CC0B;
	Thu, 10 Jul 2025 19:48:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169699;
	bh=AdTSV5ozpv8o4/9bxI6p1gy4ekYAcxlG51qRbTSXMs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mWgoqNmI0uJYgJ1ThI7K3SBODLXEBApWlXxTY2OWqg0AcSRSnZIpAiGkyCo5rJEGH
	 83JBzeaGcx3ow+Td+YFbfTXTbcbqrjp/byTCFjWj/P+Ljy7aBNj8sVWNtLBp5cnSI9
	 /nleBVvo8bG/z/b6PZPKnqVjQOYhC4/GnZg2kUOU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/72] ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera sensor node
Date: Thu, 10 Jul 2025 20:47:02 +0300
Message-ID: <20250710174808.5361-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
index 26489eccd5fb..e5ac78ffb31c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
@@ -136,8 +136,11 @@ camera@3c {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ov5645>;
 		reg = <0x3c>;
+
 		clocks = <&clks IMX6QDL_CLK_CKO2>;
-		clock-frequency = <24000000>;
+		assigned-clocks = <&clks IMX6QDL_CLK_CKO2>;
+		assigned-clock-rates = <24000000>;
+
 		vdddo-supply = <&reg_1p8v>;
 		vdda-supply = <&reg_2p8v>;
 		vddd-supply = <&reg_1p5v>;
-- 
Regards,

Laurent Pinchart

