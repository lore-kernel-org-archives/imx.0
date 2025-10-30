Received: from mx-relay112-hz1.antispameurope.com (mx-relay112-hz1.antispameurope.com [94.100.132.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9868341645
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828668; cv=pass; b=f/zCbjVb5ck4hFCmHaKNF4eVrvtm7Kuc6HyzogktadtnISD6YLwBrHKKSCK1wYDJe60G+CmNsrkY2OwTrSBGZ1BwEhn85uSH/LBaUFVL7u8pBYygbajRyYxbrhu9Qoch5i+/1ly3EtbYDhCBAHCngZTpCdEVY8/Rt0Xrkz3gkT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828668; c=relaxed/simple;
	bh=teC6RCLwcJ4ofs3BMnvnxEBibhOhTeiU3GjJARNrkN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VO9E5H9ZyecCzctBaVUhDAL7WCgTWpMqzhN+TdPwKIKLDKpEKTpcDC26LbYxk0066MsSPVK9jmQJnmK6Ry+VWfWA0hLkIQC0vufBDtO1khM+qY2bldg/QdmW6WecOzMBFU0nWyryXw1/LlLeIXlNvLNDMemLmroyupeS5z+rA30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=UG2xrwOY; arc=pass smtp.client-ip=94.100.132.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UG2xrwOY"
ARC-Authentication-Results: i=1; mx-gate112-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=vSkO+SAblxo65xQY7HUYugCLYQ6GKYpvPpD8mR1I6BI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828606;
 b=QG8ltr4v4K1jIOT8ySwFhq/uLzHotqIh+2Ky4bUNedhWBiyQvvJKKLkx68mVrMzZgH8zAJNr
 9LvVrO2PdlzXlHgStP1yMvKQQWVhKJ2htgq3X9hPExGuT5u598NgOfuEBRPIQUb9cCsJwngBwWe
 DHVv69WOIYkowMzlQ5En0MUdVAJzt6mKrzu9z4Bl4bwlSNTf7WGXkg24oQth5ephXOktJ9a/dLZ
 m87RfJgVlZAyOdxp/uhW6z0JbQDyENApEk3Lr0fVZEEHuym/ePJq/tC7ZntkLUShjmFxT3HUpd0
 /5Tvq1jws3K1Ibl5CPPUEbsMiYW3fjGv/RSLz0gCq+TiA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828606;
 b=JWhbMxTc8d2OOpAr85y789EtkJHPGxSr7POYtiKAkGIZ+WnGup+adU4SnYzsrLc6EX0VKjAm
 ICIGDxUrJS239YqzqDnPQqa38U2q2Fk3bMtzjgQktP4nyw77iSmO+NWepZCj5kvh2UNx1ssfIQg
 wN09u7jK8+/b978Iefg18QyyTsJggH2AUTXQP7+pnImDCNG7uuljmLXPj015BBkGP6k3tfoUNY0
 CVPAJ2fwp44GNaUypE8zRl6zq/H5C9AAOQblM6VbBwd/BXmdiX4fMWD+fIrap9mF5NzcNs3AViX
 MLCTfhzMRVjZswqseUgLEwRUwSTQ2YMDGeWTm5p8irFyA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay112-hz1.antispameurope.com;
 Thu, 30 Oct 2025 13:50:05 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AEA39220D31;
	Thu, 30 Oct 2025 13:49:53 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/19] arm64: dts: imx95-tqma9596sa: increase flexspi slew rate
Date: Thu, 30 Oct 2025 13:49:10 +0100
Message-ID: <20251030124936.1408152-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay112-hz1.antispameurope.com with 4cy3q62w4KzwRkZ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:17f1ace8efd12130408b4857dfad62cb
X-cloud-security:scantime:2.238
DKIM-Signature: a=rsa-sha256;
 bh=vSkO+SAblxo65xQY7HUYugCLYQ6GKYpvPpD8mR1I6BI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828605; v=1;
 b=UG2xrwOYz4d+Tc+Tr4jbxc3XLINuzkerChN4njjPdN6h7bb2LoA39bS3C6qF66AKoA9HTqLG
 SBmflDpDDQJK71BOc4Ehe76BKagcORKLKXIUZq4dwu24j6NSfD0lB+t0PHhaBj1UZ1vuEXCGAQd
 3kywcSbV0lcnWACjb046SeqmAHY5Ff2Qh5dyCgHRj5Iq/DpH3a3+RxwYzXaORQhSN3tJ0TVSVo4
 gyrBt/fRQxt+OW3Q0ylF9PL28zeAszc2mtf3w3FNhN+tC0wKd/MgrEpgPCIh5KJ762npsZEHsNC
 ataRi8RHq6+MMEwJ5rzX5fxwNzNFCZqzgEJwqCdGqJ4PA==

Switch to fast slew rate.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 16c40d11d3b5d..52355a65a62da 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -497,12 +497,12 @@ pinctrl_flexcan3: flexcan3grp {
 	};
 
 	pinctrl_flexspi1: flexspi1grp {
-		fsl,pins = <IMX95_PAD_SD3_CLK__FLEXSPI1_A_SCLK		0x11e>,
-			   <IMX95_PAD_SD3_CMD__FLEXSPI1_A_SS0_B		0x11e>,
-			   <IMX95_PAD_SD3_DATA0__FLEXSPI1_A_DATA_BIT0	0x11e>,
-			   <IMX95_PAD_SD3_DATA1__FLEXSPI1_A_DATA_BIT1	0x11e>,
-			   <IMX95_PAD_SD3_DATA2__FLEXSPI1_A_DATA_BIT2	0x11e>,
-			   <IMX95_PAD_SD3_DATA3__FLEXSPI1_A_DATA_BIT3	0x11e>;
+		fsl,pins = <IMX95_PAD_SD3_CLK__FLEXSPI1_A_SCLK		0x19e>,
+			   <IMX95_PAD_SD3_CMD__FLEXSPI1_A_SS0_B		0x19e>,
+			   <IMX95_PAD_SD3_DATA0__FLEXSPI1_A_DATA_BIT0	0x19e>,
+			   <IMX95_PAD_SD3_DATA1__FLEXSPI1_A_DATA_BIT1	0x19e>,
+			   <IMX95_PAD_SD3_DATA2__FLEXSPI1_A_DATA_BIT2	0x19e>,
+			   <IMX95_PAD_SD3_DATA3__FLEXSPI1_A_DATA_BIT3	0x19e>;
 	};
 
 	pinctrl_gpio1: gpio1grp {
-- 
2.43.0

