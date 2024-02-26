Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAA8135A58
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 23:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708991147; cv=none; b=Lc5UIkBkDWiVVi2TJW+hZSivphyMpmICtig2oyu6CaD8rm5WYT5/paizL80BLsKAkyGjW5P/6AViePszDpIjMEOUBBbreOe2o54NWkNdkymMnDl1xE95wjljiuSnVZ9PFJTxqzt20lzAm0XuUN9Kr3nUqZDigvU8J6QrL2h1Lx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708991147; c=relaxed/simple;
	bh=HgWFGA0H5+lhtt9QkEwzUEZwEz7aw5R8sfP0/hVrD4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwePbf9Pvj+KdbnfdUtHR5pLMxpmVBgtQMnuKegHK9yGbvMmc0wbKXtbcFY/134foZd7nb00Q+Sbia9QD5Hj7nw8m4oPYZhjpLiFIC+/P9v+6GNSfmPrMCiC7cZ429wYoO4ZCFfDfJ9NzzhIwPnfAtjb7htcLs8K4Huszg4rrbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJKxop2h; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJKxop2h"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7c48ef54d9bso80882239f.2
        for <imx@lists.linux.dev>; Mon, 26 Feb 2024 15:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708991143; x=1709595943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmbbJGMEJkVi0DIu9K/lMBZ7/vUErHSNsjKRRkfuNd4=;
        b=CJKxop2h4hrwuHVGUqOuHrWr+RV8IqrHwRaZBficjyWQHgYdUeTkwUYDntlIU7Twtk
         xlY+DNesWmqXH3Xmkqk4xyZd/xLWTtwi4rqcD4nnrRYsWLAlLxkLwSDuS3O+7Em2kk/z
         4DlLc1Qqass/6dgUqB1to+DwMRROz0zFxD8plRGpl5rziUyQjW7uxQwQHSNzT1V12gM7
         bEPcVID67JEiKkVvW3gixzU/SD1SfwDlpck8L4YrT385wpowd44Rm/nGS+CYN3BzOQPW
         8yhC5NwCr1MaPWzDvi5amTYyW/NvUauzK3y6t1RYI6uXnjEEUapk9hED9tjrAd+gsbYF
         C4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708991143; x=1709595943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmbbJGMEJkVi0DIu9K/lMBZ7/vUErHSNsjKRRkfuNd4=;
        b=KheZENhDiWUiQLhZGAiHcFabW5UBEiUFW5OJiNP1LNGTEkPbij0OGEhejFPR4Qe3xc
         I36LOHvK5hYHZ/dJNSZG/pu4xSwFK6ZAAO8r+PcQtR5wZWej2SODIu3gtpqglSnvevic
         qTItpICtTv8UEklVLNNINicdvSWBfVkjHS8Tiqq5WF5cMZFIAUZSSUHlqu2Q/ByW4abU
         hOZvPcPpG5Jz7uOQADm9js7w2s60dGviHq1a3vJpn5gsn0nbhLsZRGkwD8vGzOExzjmI
         R7pxVD7zaL6cCgnY8V4STzesRdNxcNUGsQXFgzgrwskmrcRv/LVOQrqMvzI9Yj8MebRj
         La9w==
X-Forwarded-Encrypted: i=1; AJvYcCU+PjozfoXBf0v5hJNXfACTAqdXXDTa7nv70NslXERC+TxtXVnZC2mjLI379v5LIvrqFaTSK3DIluCa1v8NCBpj7KJO
X-Gm-Message-State: AOJu0Yyvyl7cO9d9nAlWIwX5W/U0D4PLYUD924HYmEcPdzvRLCbEogk/
	WHjmRPIsuXLzwv9m96W4ayf7qQoUILicEhUtCs7K0R+cLmhOq3qn
X-Google-Smtp-Source: AGHT+IF/D27yCsFHmcnDOIj2v/3qnuFfvdwald7NsSXdAw9JoGcg8pGnM7Hg/+MU8soiTVaTtq1Tig==
X-Received: by 2002:a5e:8f4d:0:b0:7c7:cd56:f17 with SMTP id x13-20020a5e8f4d000000b007c7cd560f17mr4399717iop.19.1708991143316;
        Mon, 26 Feb 2024 15:45:43 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:9c95:d061:819a:2ab2])
        by smtp.gmail.com with ESMTPSA id c25-20020a023319000000b004741cf1e95esm1545317jae.11.2024.02.26.15.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 15:45:42 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: aford@beaconembedded.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 3/6] arm64: dts: imx8mp: add HDMI power-domains
Date: Mon, 26 Feb 2024 17:45:14 -0600
Message-ID: <20240226234532.80114-4-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226234532.80114-1-aford173@gmail.com>
References: <20240226234532.80114-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lucas Stach <l.stach@pengutronix.de>

This adds the PGC and HDMI blk-ctrl nodes providing power control for
HDMI subsystem peripherals.

Signed-off-by: Adam Ford <aford173@gmail.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Marek Vasut <marex@denx.de>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V6:  No Change

V5:  No Change

V4:  No Change

V3:  The hdmi_blk_ctrl was in the wrong place, so move it to AIPS4.
     power-domains@ fixed to read power-domain@

V2:  Add missing power-domains hdcp and hrv
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index bfc5c81a5bd4..c9bcb6641de7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -836,6 +836,23 @@ pgc_mediamix: power-domain@10 {
 							 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
 					};
 
+					pgc_hdmimix: power-domain@14 {
+						#power-domain-cells = <0>;
+						reg = <IMX8MP_POWER_DOMAIN_HDMIMIX>;
+						clocks = <&clk IMX8MP_CLK_HDMI_ROOT>,
+							 <&clk IMX8MP_CLK_HDMI_APB>;
+						assigned-clocks = <&clk IMX8MP_CLK_HDMI_AXI>,
+								  <&clk IMX8MP_CLK_HDMI_APB>;
+						assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>,
+									 <&clk IMX8MP_SYS_PLL1_133M>;
+						assigned-clock-rates = <500000000>, <133000000>;
+					};
+
+					pgc_hdmi_phy: power-domain@15 {
+						#power-domain-cells = <0>;
+						reg = <IMX8MP_POWER_DOMAIN_HDMI_PHY>;
+					};
+
 					pgc_mipi_phy2: power-domain@16 {
 						#power-domain-cells = <0>;
 						reg = <IMX8MP_POWER_DOMAIN_MIPI_PHY2>;
@@ -1889,6 +1906,27 @@ hsio_blk_ctrl: blk-ctrl@32f10000 {
 				#power-domain-cells = <1>;
 				#clock-cells = <0>;
 			};
+
+			hdmi_blk_ctrl: blk-ctrl@32fc0000 {
+				compatible = "fsl,imx8mp-hdmi-blk-ctrl", "syscon";
+				reg = <0x32fc0000 0x1000>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>,
+					 <&clk IMX8MP_CLK_HDMI_ROOT>,
+					 <&clk IMX8MP_CLK_HDMI_REF_266M>,
+					 <&clk IMX8MP_CLK_HDMI_24M>,
+					 <&clk IMX8MP_CLK_HDMI_FDCC_TST>;
+				clock-names = "apb", "axi", "ref_266m", "ref_24m", "fdcc";
+				power-domains = <&pgc_hdmimix>, <&pgc_hdmimix>,
+						<&pgc_hdmimix>, <&pgc_hdmimix>,
+						<&pgc_hdmimix>, <&pgc_hdmimix>,
+						<&pgc_hdmimix>, <&pgc_hdmi_phy>,
+						<&pgc_hdmimix>, <&pgc_hdmimix>;
+				power-domain-names = "bus", "irqsteer", "lcdif",
+						     "pai", "pvi", "trng",
+						     "hdmi-tx", "hdmi-tx-phy",
+						     "hdcp", "hrv";
+				#power-domain-cells = <1>;
+			};
 		};
 
 		pcie: pcie@33800000 {
-- 
2.43.0

