Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020125.outbound.protection.outlook.com [52.101.84.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300BA2765C0
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 06:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759214892; cv=fail; b=MreuB74XvsOblVh4ob+D/wBRigOszzEfC5fbqIw8KBrscTIr3mHtCgN6TCarhQhD/uI8As3H4A1xv0tsXmGQBRSvRBcrOxXTFBF5bN94Bw3vrIHT+DxJsSb7st+dkIHzs7BNvMubMgIdxg9vRDiETLsz5977JAPCarTyafZwir0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759214892; c=relaxed/simple;
	bh=Q5Hd30MlhxZi6RByCTwx1264A6BqwWyad9LOWKsoS30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=C+VaWgM8jucopG8uM6dCtlGLXcL+naFVokZId2spy54v+5OUZ4/IBG4DcySnJNlbmg06vKFXEnKkF5SmLUDrmwFZFzFompBHerDHFi3zfKzj9ccWsQw6aAGAqe1dhXDUj6UjY0aByrVp7LA3sGhQ2u3ppMnVjCAPF1hpGVsRBfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=euDUuJbT; arc=fail smtp.client-ip=52.101.84.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="euDUuJbT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+rSkEgXTTWrh+Yk3f/huy4TEgZ2NVn1E2XDLtrbJYFovo7qBjiEL5KIZVPkX8YdiLcz9FsMH8hYOnpRErl/pJFaG29BAsSZ5B3KvHzadxbEXZs96Xi8saTztBOJ3pR0CRKssAOiR19jcaEU6/71nKlG4txbFlAz4KEHp0Isx0/RGATPZBS22KGw+k6YTMjrpaxVXOB3gJh1y6/Bnu6G6y3L7PHcI+Vi6MSGRZdm7tNXZp/3Wi+K66iw8ONgecYL+C9SCEiz85Z+URrpXe8PTm6YIvi9GZuP2YMqQS16vlBL2aePsIZTg0QT2Wc4lZg6cjAoaL+YupDBRMgoYfYLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ6DbPd25eR0TptkEb9UxmJQ+RdN/5UFbZ6tYvrdxCM=;
 b=tnh/1qm7A65NWf4jKQ3LVxIvCeI57tYGn6eb2q/dcIT9g9+R7uiO+XRmio+ZbL4e+bTNmCGvwJgBrvBwOMvGO/B3eXmaMAT92yyu4yLnxMTDXDIyV7+N8d7jw56TozIThqb5YykYSlGNOpkAID3t1uZOQHjeprpz6LBrWXuOwqoNpyFrnKo8KeBA4V7t/+j/HN0qCMWpNhWyanor3urDooE89SAMfMbqmhfv2n6s+sSRX1LPfmDji0HCoolf6OUMBWS7cVAZTeqo9csML7kw13tydsEwqNFsnUxvxTB8umsJ6iRVSiKq6ONoSOp230aBezS8kKCd1yVnBRC/l2fcTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ6DbPd25eR0TptkEb9UxmJQ+RdN/5UFbZ6tYvrdxCM=;
 b=euDUuJbT1rgBBlAld7L/uW1l7CBA1ADRthh33cX8NWFBCt46N+alR3FnutdFpEcBIxOKPG6jcZfj2RYqYj/3RodxrdmSLopWWTKfOnmUXlwT8bTw/a7u54XbSC6TzduOxolnWV49y+SavSHgNd8blLwka3Wti22WrQpiyUAjp0kFMjbQsA/aBbaX/r5N55gA4mcbYmSJTD/pUI0KvpPXxrRmX+g4vY/Jw6jThJBB7p7wOyucEQXei9QoVFWJpNIFci4Tp+ie6wuL/0mYKNhqGJDa02uEby1ntxISSRK4q4b0l3EB6h6oer/vrosFiC8tzZsFxUFYyhgDpVhWXPDJxQ==
Received: from AM8P189CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::6)
 by AM4P195MB2967.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:6e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:48:06 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::2c) by AM8P189CA0001.outlook.office365.com
 (2603:10a6:20b:218::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 06:48:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 06:48:06 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 08:48:05 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 30 Sep 2025 08:47:49 +0200
Subject: [PATCH 6/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Fix audio
 codec reset pin ctl
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-6-d5d03ccbfca1@phytec.de>
References: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de>
In-Reply-To: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de>
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Jan Remmet <j.remmet@phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|AM4P195MB2967:EE_
X-MS-Office365-Filtering-Correlation-Id: fca4d8d9-676b-4364-be44-08ddffed4fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkgweUdGMTRJRWJLbEFPWjNQeXg3aSsvSU5Hd2VXdExFa2JlZzdRMnpTVmxS?=
 =?utf-8?B?cVdTMmNOL3dFakJUL2QwNmc4T0dwM1c1b0FCbkYxSmsrRW91aEo1bUJxMTBl?=
 =?utf-8?B?RTdWSG9CeEdSSU53UmIwcW5Gc2dqVGpCNi9LeThlOFBpZVVlcjgrd2Zlcnpp?=
 =?utf-8?B?emtIT2pXUFVLNkZSb3pFa0JrZ3hCd1lNMkdqNXVwN0FyOVdkVkpwWFlsV1cv?=
 =?utf-8?B?dExUVXdidXE0Z0x6NE5TWEtUTVYxWDVNWW4vUWM3azZuVVdvM2NIWStQTWR2?=
 =?utf-8?B?YjdlTjhKTFZEQzN4bnBYRldtRmFuSVZPbUhCSTBCUnV3elNZUStRN2ZRUWs2?=
 =?utf-8?B?VEdPL2kxbU9Vb1pzOUFqZ0txbnVSSnBUK1ZqOTErb00rR2MxRi9JbWlsN3U4?=
 =?utf-8?B?RUZscEJMMGtBUE1CVHNTYytlcEwvc2tWV0kxK1A4YWczT0NEMkg4NFJHSHFw?=
 =?utf-8?B?MFZDOTl5aWxvWVNSUDNIdndMQWFQRDBGSDBqRUtQTUxWVGhNUUdKK0F2aURO?=
 =?utf-8?B?a2ZmaTlkaUtiYXhYVExVWDlYbGtjaGlJRW5TNEJYdW1oQjBlak1WOGo0Wjdp?=
 =?utf-8?B?MGIxeG1iT3IzYUE2UDZiMm52QVA2eGIxNDhtVERlSXlvYTk0RXFTQ0JaVGp2?=
 =?utf-8?B?akdnaThjaUc1YXcvRk8xeDV5SngzVmw3R3I5MVhZWEZ3QVEzV0hQL2U2eWdl?=
 =?utf-8?B?RnpHcjYxT2UrUWp0RHo2dmRVVWdqSnBzOEZBYlhFem1ETVNZbzM4a2FGRWQ2?=
 =?utf-8?B?L0RPSEtTU2kwd0RJVlQzMlJreitFVHBPazlpTmZoN2NBRDYwWFFtRmFkYXhr?=
 =?utf-8?B?RWJHWUI1S1dab25aQmY4NUdRbHlyWWdQM1F4NCsxUVh4eHhJVEZEekM3djBS?=
 =?utf-8?B?d0JkRWhEd1B1SWhDT2NrRkRkSVR4NnlveDJHM1FSd0EweVhMZUZpMEtBcFd1?=
 =?utf-8?B?TDVtNEkrUG53SWdDa2VPZUNxMis2V2tYdGJ5VytmNWN0UzYyTWtsYW0vNEVH?=
 =?utf-8?B?R244S3UzQmZOUGs5ZE1ZT09EUld3aXh4QzJsbnBBU1RWcTFwRzFTKys5TTRD?=
 =?utf-8?B?Sno0T2lNUElvYTA5UWtaRnRPMWxjQmcvbUNKUDFNNk40YmF4alBVUVFRSmZY?=
 =?utf-8?B?ODJDbS96YTM0aURIQ25TOGR1VmMvN2VzZGVjRXdwcGltU0ZETUIrRGFVWjZa?=
 =?utf-8?B?RFhLemhMeVd6SXRlZmdvbVZXZ1p2M1R1M2FSMm16RW5rRnZJMHYzUEc5TmtY?=
 =?utf-8?B?Nm1yRllUdjlsUHlHMVNmbmpNQ3d4dngwcGRlVGMxWGRCb3g4elNFVkVKcU1H?=
 =?utf-8?B?TWxOT1FCK3RLUm9CVCtSRVo2RVJNVzVUOW1JdlF5aVZrSHFXcTBPSFBPdmdG?=
 =?utf-8?B?S2FCdlJyWmMwSlM5OVZJZFhpYmM3Nk9SdklLMkQxUmhNOC9aUEFveTNLZ2tU?=
 =?utf-8?B?cWlabVY0WjlvNUt4SmdnL2R0V0tyTzZHcEVicGgwanZEdTU5T3NhY09qTkF5?=
 =?utf-8?B?UCtYSnpnVXFld0Vkb3VmclhyRjFXMmpGVm5TMXNZRm5GUEo2ejdFcmN2Z0NR?=
 =?utf-8?B?aVBBeDVac2pYODl6cGxDRGlsMVRuNWNQZ1k2RTZqcE92bDRzbjBFY0VPZ3hK?=
 =?utf-8?B?OEpQcjlhMnBjVnZUaFFUYkc3RStleDA3V2VZZnd5RHFVM2hJS0NMenZtY0Nw?=
 =?utf-8?B?YXBITDdNeEc3NjQ0NEw2ZDFmcXhsUlNNc3VMVW92eEg0V3ZtZUhqd2FhSzR1?=
 =?utf-8?B?aHAyWWtLSmtYTS8wSnV6SGVpancyTCtkT2FmRkNnTU1TdG8vVndwaGpIcXc3?=
 =?utf-8?B?SUZtMTlCU1o2KzdUcUlmcThoNU9INDhOeDJXbUk2Tk9mUWFxMm42MElnRCtC?=
 =?utf-8?B?cXdoeVF5KzRDVGhMZTZ5aEk3OWVVQ3N1U0NWVDVkZjVNVXF5ZFhMYnNqYjJW?=
 =?utf-8?B?WkxxbVNjTE9SeFFNV0RVRkFkOEpqK05Xd1R4dUFVSzFmaXU1c3dmUCtqZVJ3?=
 =?utf-8?B?cDJnSEMrRUNBMjZjTHNlMTVNdDhUaDNJMVQzNFNmV3pDUytZcXI1d2VmM2RD?=
 =?utf-8?B?bFRsdEdMYzVLMmUvbHIyR2lDNGpaK3RjMSt6MEJQU0tVVFJzRm1JZkRISFpU?=
 =?utf-8?Q?nmnA=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:48:06.7748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fca4d8d9-676b-4364-be44-08ddffed4fd4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P195MB2967

From: Teresa Remmet <t.remmet@phytec.de>

Enable internal pull up of the active low audio codec reset pin.
Otherwise the audio codec does not reset properly and is not working.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi
index 3d4ffeecb8dd8e6f7a68eeafba761534fae9deb4..bd1f255e15ea95b6f59e2c7bd762d6a6a2b4ab76 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi
@@ -182,7 +182,7 @@ MX8MM_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0    0xd6
 
 	pinctrl_tlv320: tlv320grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28       0x16
+			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28       0x116
 			MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20        0x16
 		>;
 	};

-- 
2.43.0

