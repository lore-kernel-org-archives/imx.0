Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1471E3DE7
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736243416; cv=none; b=KJQFFfmng3rridJnrMLjHp2xTbqs6ipq98R/WUZd4Ab66Zj/EJ/iKOYAt3Y4Uf8+i5QGoQ5LPf6FZ7JOl+suEz5YMpgHkS3xvbsMc2tqrbFMj2Xg0FVl3LJsp0CwHNylKhvv/LpGL7rT/UHJAw/9rcAgR0GcsYbwmxBoPTziXnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736243416; c=relaxed/simple;
	bh=CyTo8cE97O/dT7balp0WJ3hLWJur45QTLweHtNPLjc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e3s2cK19bKgcC8kyEdihZghEElEQuciVeBz3JIxdYSimmlONT5YgmDHJpirtdjIJ1jkoFKSCxvhYRvRLRy6ZXnjonrtgDZkb0mutHXd7dYLv1fxYGtPw5A+CNN4fHlcp8ogeuQBYwUqbuIR4xPk5Ewsw9vGvD+EKnacR0LDLn0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=hJXGoe1g; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Wi47E+Rc reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="hJXGoe1g";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Wi47E+Rc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736243412; x=1767779412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KpOa8HoprryX6l0PB2oieZlmFjQEb/tFrwNnpfDxsbo=;
  b=hJXGoe1gwJHk/SFA5Ug4V+IuQLB/0esdZx67x6AQCz4g3SO8H0vQhdSm
   TO/k1tSmFyee/AemGPHrH36Ed2f1MYBUE8WQ2PsEnB43z9+OAWN7EvjOq
   Luzz7jVSqlYnzU3Ri8eHoUZOJd4cPpJzRXdEZ1nl1LDlvpUK7wQBEaBug
   4z8WkQwALcChEXjl/1dWrW+HMwuiVIisgziKXW1NedDOpyL/GwGPo8Dnx
   rfE/eto+fSOb7I6qaZR4ID3SIa/dWhu7OC3L5ppcRg68G0IMg/EG4VbPS
   HNBkJDsgZQ5XL6SDhtyU82TYKKq0GOZWZQwcCeb2hzOkoKRHk1Pd0VxGG
   A==;
X-CSE-ConnectionGUID: W/xrAnC8RkSNziKHLuX1cA==
X-CSE-MsgGUID: vaqF99PvRTWyofVWk/MsKQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40889019"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 10:50:10 +0100
X-CheckPoint: {677CF8D2-34-301A2255-F8907925}
X-MAIL-CPID: 4EBEBB08F58DDC3AE9E882BAB25DBD24_3
X-Control-Analysis: str=0001.0A682F26.677CF8D3.0031,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47717163CCE;
	Tue,  7 Jan 2025 10:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736243406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KpOa8HoprryX6l0PB2oieZlmFjQEb/tFrwNnpfDxsbo=;
	b=Wi47E+Rc9PTZCxjwj/rCLJqFXyDN5NtYNeDYY5biKfe0oJzJCkQeIQa7PD4JKriBAh/oP9
	z35fR7ZDJkeVj7MhODE4YN1FoPGspbM48OA8EsHQ0tcLtW7gF3g0h5kyimAgF8Men8lL8+
	grBB67wugEMwPY/lJFTW/2pLVtxOEESmkeLH41piBuGAYFClZureKEWxAmtwrS+0MlmikD
	lVF/OJvQd7tgehTzAW1UBZYTMQ2tgZIIt/De6zJgyYAZP6hZW0/bM68PkikLuCoq4ypNWh
	vgQzeJ/qH8pxDux3+kYPEczkhyIfgWGRO0K6o2ho2EoQN8M6GRYV1nSPfr51Tg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ARM: dts: imx7s: Move csi-mux to below root
Date: Tue,  7 Jan 2025 10:49:41 +0100
Message-Id: <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

fsl,imx-iomuxc-gpr.yaml only contains the mux-controller but the actual
video-mux is not part of it. So move it below root node.
Fixes the dtbs_check warning:
arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: iomuxc-gpr@30340000: 'csi-mux' does not match any of the regexes: 'pinctrl-[0-9]+'
  from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi | 56 ++++++++++++++--------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
index 22dd72499ef27..2629968001a74 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
@@ -176,6 +176,34 @@ timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	video_mux: csi-mux {
+		compatible = "video-mux";
+		mux-controls = <&mux 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csi_mux_from_mipi_vc0: endpoint {
+				remote-endpoint = <&mipi_vc0_to_csi_mux>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csi_mux_to_csi: endpoint {
+				remote-endpoint = <&csi_from_csi_mux>;
+			};
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -529,34 +557,6 @@ mux: mux-controller {
 					#mux-control-cells = <1>;
 					mux-reg-masks = <0x14 0x00000010>;
 				};
-
-				video_mux: csi-mux {
-					compatible = "video-mux";
-					mux-controls = <&mux 0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-					status = "disabled";
-
-					port@0 {
-						reg = <0>;
-					};
-
-					port@1 {
-						reg = <1>;
-
-						csi_mux_from_mipi_vc0: endpoint {
-							remote-endpoint = <&mipi_vc0_to_csi_mux>;
-						};
-					};
-
-					port@2 {
-						reg = <2>;
-
-						csi_mux_to_csi: endpoint {
-							remote-endpoint = <&csi_from_csi_mux>;
-						};
-					};
-				};
 			};
 
 			ocotp: efuse@30350000 {
-- 
2.34.1

