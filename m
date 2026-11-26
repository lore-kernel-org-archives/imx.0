Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.142
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795705502;
	b=NqJylN//fgeA3A+Rzo7y7gOKXMqKZYqk20h/i6bxNAg4qs+6NrwjhHCmxZz6c/vK3djg
	 vS6s0RXxpOv/T09KM+yF3Dfi6RmzZuP5tbE/ayJ/0hm3Jn40S7g3hfIMKA1f5BnETJEWf
	 DUPRKmp/6okpc38L35ptO2rwmfKSjsWT7fZAYhYESUhgitmabHx2apAOxLBvfiqc1MLO4
	 nMEEtNeYwkP1sFeOSM+FtxecaxlgvCpkC43UhBnIW4SdIapEnckE6RndAyJjAn/iIEdaz
	 IL9Xp/U76gfZtsSc+yTxWMszGBGPP1qyFM/MMSVapyH/I7hh5JE99zg+QK8V7GwZ2+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705502;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=mXsVNrmD2QKyMjjKFiX5n1pH3sfGwC9Hwn6oPJ2yLiU=;
	b=5kIbA02VjB4m7XXTJLgO6UxeakPwQ3UhHdIhp8YHzIvbFiLCvkjCgz5FaLjmiYyG6/eM
	 bRSCwQekvcS40Em3hvUukn8zlVDajUsUnOi3h7bvSjGrmq2EOhYh45NHxcScIqHISQomS
	 8pRFmDQZX3BIGN3M0qI4+DfKdUJD/w06ZUC089BxZEXLQdhMleEq+iCB9YE1o5HbHU+hP
	 OUj4/akg/Tfst/Ao5uhG8AEL6U690iZJnZkVpJoh6CodSlbGCj3mSEWxIY4vKuzSz+cIR
	 t8SJ9B8l2Ok6yEourpQ9fA2wPBUZ4InpP2GxRO40fs1fScqTlKAsVZK/UHqMMq6ilgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=ZTfpfj+j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.142
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023142.outbound.protection.outlook.com [52.101.72.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3B2606A329
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 15:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B3B2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=ZTfpfj+j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyK+JLqhVT91whd+wicgW+62r9ZhBtmRXf/d8dukSzrIjGBUf5RwKrTs+wrPmsRWzG9NKmQOIbDIsuPr2Ch6Tv9judv5WP3+O5PvNf2//Ucwr1jw1AUxF55rIVEWCctNus8hsfel/id54lNtvRvqeGdV2BvgqgyyA/mW/+wfs5LEXkgYKr8WCFWnhCrxbY3y7ESClGyLXWbtPL43lFfYJr+54yltsbi6njo7bAWN78Yr9LkxUK01vYmV4W+W9QeAb9pjbOIsvxFYZzjR+K6XfzfDkE7rtaWGkYWBfttfjI4+KOee84EfuQGVQf6wwfc4zoOLcKmFaTd6IVRJnu3iog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXsVNrmD2QKyMjjKFiX5n1pH3sfGwC9Hwn6oPJ2yLiU=;
 b=m7Z+JNsq7WD0gY0nuW4KplHV+QzkUYwdL9/zLqgSS7XLSwyRcm35iyRv/QqfNOviQ1KSfPKfPqBAKb1IMyQv8Dq7GwF159CcnhWGj9O+qEPzRN24RSa3BkDG890Aw2aw9sP2z8JcxM68QT574gkxOZ5RL0T+Gl5qTxgi4uyFGRWH5IxfO+dW3trrdGdjQPlaqspB/mXNMqoDFgXhqI33nGqRDHS+TAuA8Je5xJ+d7WW5r6GVBZP2GgxavSAXoZyc2o4q2+H14YMPUi+T6TKksyK2LcEUk1aZ/fUW83N92uiYqNAonELyHLSwaQXifA3le1Nz5Ariv5aQobvhMNhzpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=nxp.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXsVNrmD2QKyMjjKFiX5n1pH3sfGwC9Hwn6oPJ2yLiU=;
 b=ZTfpfj+jLJHPvUCWHiMYRokKFf6NW9+Qyv8jjzEQFP5+1Ay0CYrv3+sXSmeWuIlOr9iRKcQHHGp9do50foE79qmxhcqBnCb2LXZbBIR9OeR8iDmUKSgzjNtDM28HifcvPZhNmo5+NR2H4FguFpt4UXWL6Xw4Tx0UyvAkGVm+BBhMEsTdmkoVxR7mAhuC0N70RRMR6oh8QkoLBeKpTKCjabmrcwW7uPsUOhNVNv8NSTZQEluBriuRm31v7quUf1vKKsA+SfoPJGwWrD/6Qq9c7nTP/9huzISUdn0hziG4GJ6lBdibpZN69G8NtL6vvnSJ34KZLsLUQKPMBlCEMsCeeg==
Received: from DU2P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::15)
 by AS8P195MB1224.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:04:56 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:231:cafe::7d) by DU2P250CA0010.outlook.office365.com
 (2603:10a6:10:231::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:04:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 15:04:55 +0000
Received: from [172.25.51.48] (172.25.51.48) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 16:04:55 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Subject: [PATCH v3 0/6] arm64: dts: update imx95 Libra for the newest
 hardware version
Date: Thu, 26 Nov 2026 16:04:51 +0100
Message-ID: <20261126-wip-bhahn-imx95_upstreaming-v3-0-a2bda009bac8@phytec.de>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NsQ6CMBSF4Vchna3ppRapk+9hjClwoXcAmhYRQ
 nh3C4txYfzP8J2FBfSEgd2ShXkcKVDfxZCnhJXWdA1yqmKzVKSZ0AD8Q44X1tiOUztp9Xq7MHg
 0LXUN11pfrkWhDBrBouA81jTt+uMZ21IYej/vZyNs6+6CkOLQHYELDiWUGPECtb47Ow9Ynitkm
 zumPwtAHltptCTWKje1wiz/s9Z1/QKXtIxnEgEAAA==
X-Change-ID: 20260911-wip-bhahn-imx95_upstreaming-99947bb5aea0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Yannic Moog <y.moog@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>, Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.16.1-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795705493; l=2629;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=U/Qx2R29/KEikADKc81jH5fL6iTynLd49iX4LK9J3Y0=;
 b=uAgubcpgZspvaDfV++Ng6Ysxy/lfbMV3AQ/RnIpWIFe+FrNrRSsbHyz5CVwtgiAz5rMLq0HET
 iMA55tvG0FxDqVlKub/YHXrICouKkjnZIP27fQN2+NvKhl68qrH2rpy
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|AS8P195MB1224:EE_
X-MS-Office365-Filtering-Correlation-Id: f0dcab89-d46b-491b-ec5c-08df4bcea1d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|23010399003|10067099003|56012099006|11063799006|261021121427099003|261026140227099003|261022105027099003|261021123027099003|261009223027099003|261028144727099003|261102123227099003|261026121527099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	4iBhM3AOktMlk5FzEklDxm50OZ+9vQmuySYPzIUKCyKhhIbm1XsNSD3YlyueJJJBcw2MeCiRwC1OME/3E1/g8bEDQyk3tMImcgNwhVfMIkbNsTqNCUusZVsgOd8CRDjIkrm1f+JEzd+kLts8FC9GAZsqgACakuKCDsilrWzsFZzWXS2S1fL96/6asrW5E42UnP1vOSzrLamcoXR4EJpEZOIwCR3vkL00ph12Eq7/23URmJzPUMtqlJ0ej+Zik+aBuCWxovB386CiFl3TMrdJ+sH7/F8rkRL0rrgWQ5PHuX9BBnLcLe0kQZ1H+cHXagppDh5MLld/zi4and/pZJ1E9s84MoGRQqT0PmTwMTKYalIn9S/eAp2Bz2XkB9+rk70XxhJ4r5Ka/F+l3uzbuB0jc91VZz98hfodxM2hLhJDfeiCoNfgtFo6JH+qUQM4pVgh3V6g6oCqZDk/TEGg7BlV/pyMzLm0loOJW4XqvhxuMEfW0ULYHP9yHJW9RV2ziw5x9zrJT6PGPZwH+mIxD+TtC6HPEpPi4PKb20nhDK1QT7IEICzBBVvRmH+HzqtQEzSuot5SFKL1z2ALWBeHM9bEd5ZCkPDxXQEd9r+kfDae+hRgh/XmF5Q0GNMUeOlt60csMUIv12UjNAtq0o7kX7P8Bg==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261021121427099003)(261026140227099003)(261022105027099003)(261021123027099003)(261009223027099003)(261028144727099003)(261102123227099003)(261026121527099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	03pO9rnyFGu4OQxNwhe1cdM8R7I7lq5kcZxSBF2631QyjEt0Qz2vP7bprHpjHDpLDNj6eTYWBPQJwBfjJnZUo96Q7K534+AQHLpuh6RZluSZO0nGKy72zXNvdXrq0CE6hBG/TYzNcnilUtDpNPxnnCq6PBFUqbv4hlqx2BzLdKqaYI91MR4lT54XtKVpmg5TetdhFZTri8giFePDuxht7oXOBX7pDy42+hawXKxMaOU91H8NvIhTsVhPpm99eNdOg9YbuuTsuNcYH7FwyJt4O1gLMO0v0+DpdJ8UEv85zN+YMD3gD3s4JS65tjHzKroDbK/ut8j38WtslKK0QGbrSVfOGVAWfcc4beMjdeJCSPTxKu3NF1C2JtlfzClp1N55Le3WIafTrBAHL3+kKK00BQpr/C6gfZC5phrNm+dKM4wIY09hkoTDLQnqV8/tTr+Z
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:04:55.9357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dcab89-d46b-491b-ec5c-08df4bcea1d5
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1224

The Libra RDK and i.MX95 FPSC SoM have been updated with new hardware
revisions 1618.2 and 1620.3. With these new hardware revisions they also
got renamed slightly, as they have been integrated in the phyFLEX
series. The baseboard is now named phyFLEX Libra RDK and the SoM is now
named phyFLEX-i.MX 95 FPSC Gamma. Add the new devicetrees and bindings
and remove the old versions. The old versions of the baseboard (1618.0)
and SoM (1620.1) were only ALPHA hardware and are not longer supported
or manufactured, as they were based on the i.MX95 silicon revision A1,
which is no longer available.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
Changes in v3:
- use gpio-mux for bt_rs_sel instead of gpio-hog
- fixes according to dts coding style doc
- usb2 add dr_mode and move vbus-supply from usbphynop to usb2
- fan vbus supply now works (usbphynop blocked the regulator)
- switch to 24c32d-wl compatible for SoM EEPROM ID-Page
- split overlay patch
- Link to v2: https://patch.msgid.link/20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de

Changes in v2:
- fix indentation for new dt binding
- updated commit description for removing old dt binding
- fix naming for pinctrl_usdhc3_200mhz node
- fix misplaced external-facing and wake-gpios on pcie0/pcie1
- fix gpio2 gpio-line-names
- updated prefixes in commit descriptions
- Link to v1: https://patch.msgid.link/20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de

---
Benjamin Hahn (6):
      dt-bindings: arm: fsl: Add phyFLEX-i.MX 95 Libra RDK
      arm64: dts: imx95-phyflex-libra-rdk: Add phyFLEX-i.MX 95 Libra RDK
      arm64: dts: imx95-phyflex-fpsc-g-som: Add temp sensor overlay
      arm64: dts: imx95-phyflex-libra-rdk: Add M.2 Key-E 88w8987-bt overlay
      arm64: dts: imx95-libra-rdk-fpsc: remove devicetree for old Libra
      dt-bindings: arm: fsl: remove outdated PHYTEC i.MX95 FPSC

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +-
 arch/arm64/boot/dts/freescale/Makefile             |  12 +-
 .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 318 ------------
 .../imx95-phyflex-fpsc-g-som-temperature.dtso      |  23 +
 ...ore-fpsc.dtsi => imx95-phyflex-fpsc-g-som.dtsi} | 220 +++++---
 .../imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso |  19 +
 .../boot/dts/freescale/imx95-phyflex-libra-rdk.dts | 576 +++++++++++++++++++++
 7 files changed, 787 insertions(+), 387 deletions(-)
---
base-commit: 7c590854a7fbdeb6049a1e8bb6eb958c79b4b45b
change-id: 20260911-wip-bhahn-imx95_upstreaming-99947bb5aea0

Best regards,
--  
Benjamin Hahn <B.Hahn@phytec.de>

