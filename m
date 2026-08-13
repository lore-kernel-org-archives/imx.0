Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EB8479861;
	Thu, 13 Aug 2026 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624970; cv=none; b=XuOb2hpdrtos5RHUNrGFm63pbZG5dGwilZH0O3mPbYI84b98y6u/0sRRXkB4J6yG25MxHbovYi/CH7KCMUrs+v75ke2LjynFpuwJGCPfMlLkGlia3XGWrcatu6Bsy0voQaw6UTAZn/xTzcvCw1XtFWStZU43uxpeykeLH2ZHe1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624970; c=relaxed/simple;
	bh=NCPUSCg7z2w103cT4RmqoD/XCiN6zYzTLiQvdqtAr5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kiTDkPYzYIIW0g4mIAUkI8dyzq9nmIscdmLCDi2V+Freo8AmncRa83OSrfjkLB1EB+WNg2xTb65bc2vAIEDYI27V2en2yae8MdBWWtQpcrgdzNVIQaTW9WycPLb2fwrfsGARuhq04xPS+Ia+gvD9rVqrCn5nYA1hmXG+nEUHF6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=hYHSTQ4X; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hYHSTQ4X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rddRhEyNm+cHGcl6W9b9fz+6Grp56+sqUxbZNOKqBrQ=; b=hYHSTQ4XzFy6oYDSSmGkdsiZFN
	XgdKIQD8+iV0XnVg1srGuWTLTnO3ZUXEajag1C/UpbeuM9w2EEqPRXqltRFlvqmabT0+v9wNFo/+j
	EqDuDRbG/Pzl9rkg0+8FOlMGmrbDBsb1qPtgyjouuNEyKVyNILvhoeeJiBCp1rl4TYKqf8G7wwdFi
	/tgPqZ+yBJWtGJR0otZ1BHJ75apOhyUZzJRYuI3Q1oGVC74gmFKTSNtRdHXkQ9ZMSm42tNZUe1rlM
	j2JDfiVnhp7VkxGnP+g7XQnotCLw9E3g4qvhIbJy9IUwZvhgjKPfIAPW2n2fHasRRkd3cyprHC4XD
	SqfxhY1Q==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIu-000BWz-1h;
	Thu, 13 Aug 2026 14:13:00 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIu-0005zb-36;
	Thu, 13 Aug 2026 14:13:00 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
Date: Thu, 13 Aug 2026 14:12:45 +0200
Message-ID: <20260813121250.3993187-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
References: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)

With commit 417b0f8d08f87 ("gpio: pca953x: Add support for level-triggered
interrupts") the GPIO expander gained support for level-low interrupts
required for Ethernet PHYs

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index f0f886f2b8cfd..dea473f660f91 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -230,6 +230,8 @@ ethphy0: ethernet-phy@0 {
 			clocks = <&clks IMX6UL_CLK_ENET_REF>;
 			reg = <0>;
 			max-speed = <100>;
+			interrupt-parent = <&expander_in0>;
+			interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 		};
 
 		ethphy1: ethernet-phy@1 {
@@ -237,6 +239,8 @@ ethphy1: ethernet-phy@1 {
 			clocks = <&clks IMX6UL_CLK_ENET2_REF_125M>;
 			reg = <1>;
 			max-speed = <100>;
+			interrupt-parent = <&expander_in0>;
+			interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.55.0

