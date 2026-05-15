Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0783EF64D;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881236; cv=none; b=Ywks+OHoBC5B4rfK+T0LKzGtUIQR4OLgEuW8dE32P/JAOUOQdhX0xxnbKW6x693aSykv+p+F3KoFdTQPjP0RV5uzoeAxvhaTqkSj7i/mrahlAmTBg7cwGLNDkwwfvWGVhvnpr2o+Y/f4Ke26bK243DKYG6kf2mePGfL/wv2kXZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881236; c=relaxed/simple;
	bh=rX6r/+0B06uXvQR5Rend/nvCLxZh6GVTshJGCcYbsLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFOG/2GQ6EbSl6ahX6jiD/q2SeKTnzl3QMjPhlRUoTRaPGoLBzS5ihLw3e/WOack8ukLoTuAlBBPPmbJibygIhwvxHkeVhrzQk7q68lgYRbW943IiQsiM7GgYVWJe6IQREzY5RyBpi08PpyMeXUtFl06Yc8tUN7Ilm/QVCFSRnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VccQFmxy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VccQFmxy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75D2BC2BCB0;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778881236;
	bh=rX6r/+0B06uXvQR5Rend/nvCLxZh6GVTshJGCcYbsLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VccQFmxyQ0Y7N4jXYWXR9uq3K3pLblpJQiNEWWRyzI0cuiAZopwzXsmnd7h/Lp6yj
	 wGYZu+y2C0I+lGDmqhGRx2IXSBVCb1JAWYNIvFhjRHNK/LBeR2KIw9+mBekA7VOXK2
	 y5MRXW9MFwDWGaHDwIOj/xXwABpQCWBwwmSEiuazyhHpECDuj33tEE0msku6rbFxjP
	 42gAUPeiN/Wmut6G7xNpq//oT8UVICUPosCwrLQbMdyLLLZby/0fLiQpgNfhAGk6Z8
	 PNm3ZcsYQGNcZBbtXq6xn27ejrjmkLJjlMNyAkSgaWf76VoNC1ZmhmWzdAnsUYWjUb
	 6EUoJAesXX6xA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE27CD4F46;
	Fri, 15 May 2026 21:40:36 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Fri, 15 May 2026 17:40:37 -0400
Subject: [PATCH 6/6] ARM: dts: imx6-display5: replace marvell,88E1510 with
 ethernet-phy-ieee802.3-c22
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-imx25_dts_simple_warning_2-v1-6-b06bff192a05@nxp.com>
References: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
In-Reply-To: <20260515-imx25_dts_simple_warning_2-v1-0-b06bff192a05@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778881235; l=1530;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=pOOTdBIy4O5VkcyQTkfiAAoOW2MNieyUh8U6TN+0VYE=;
 b=A2KlQ7H7PfGwYPV+Uj5xHeMPOwdRYv6ImnK7llmb68mG9ga9y0abIlg3GhkfwjAVWWnVuaufZ
 0IY7PFmRaaHCEtwGR86hp42oWznfdMNFRFjwbnv1Ilrts9EACVrZoEr
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Replace the vendor-specific PHY compatible string with the generic
ethernet-phy-ieee802.3-c22 compatible.

The marvell,88E1510 compatible is listed in whitelist_phys[] and is
never matched against a PHY driver. PHY devices are expected to use
the generic ethernet-phy-ieee802.3-c22 compatible unless a specific
MDIO driver match is required.

The 88E1510 is compatible with Clause 22 PHY devices, so use the
generic compatible string instead.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6q-display5-tianma-tm070-1280x768.dtb: /soc/bus@2100000/ethernet@2188000/mdio/ethernet-phy@0: failed to match any schema with compatible: ['marvell,88E1510']

Known other user (uboot) did not use marvell,88E1510.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
index 4e448b4810f27ba67332811519a199a7ff0ee004..21e8bbdab4e695c0da169f1a8714398c6964ca35 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
@@ -208,7 +208,7 @@ mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		ethernet_phy0: ethernet-phy@0 {
-			compatible = "marvell,88E1510";
+			compatible = "ethernet-phy-ieee802.3-c22";
 			device_type = "ethernet-phy";
 			/* Set LED0 control: */
 			/* On - Link, Blink - Activity, Off - No Link */

-- 
2.43.0


