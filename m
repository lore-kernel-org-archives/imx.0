Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022099.outbound.protection.outlook.com [52.101.66.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967772DCF74
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642047; cv=fail; b=cwv4munWQDKPx74Fy/i2D7oEP3B15nGhBrT6Z/yE8FqVpzXJZveI2vqbzUNBCydCOuXDjxG22pVDPg3XDnRs0R79zgsuTbfSSqHtyIkL9Dxdndj13xGGjIXIduykm5TNnksK6Ul0S+w8Yol+UWykuo38c1623u8gWlao9p1HfUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642047; c=relaxed/simple;
	bh=Gcp8+HQWGbn+qCG4+hxKfvVQzSCD6cRE4++u2YDkBEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CrWR9/746/N37DEZVTVJICyL7pl89zK4ie3D8/EEmYetissTMbh+bZg1ThbEAZ60iK/18NFsbq+Uipj2iW1C0OcP+Nq6xe3ypR6/opal2RI681CAM0Q8qYGAfLhIe8RN3Rocf5fhvRRDVII4mOpuV1vhr7fiw/HIqDmP2tZCJQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=HS6cC/dR; arc=fail smtp.client-ip=52.101.66.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="HS6cC/dR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9aaJ67uDqM6c83OM3+uSWLZw/YisOchIFH7uJNb1Ldl0j/STygtKxjdOx/otMeF8PxbTs22bYobKSheOXkGlGwhjuKUJGCclPNpDrVXbpM/XaAGjcce5H/VcP+kTJnoLQm4igIdy9eEtfhItNz+IC0j6xLlMjSUmNYqGreE/DvRjE/urjXaP3gW8B/AyfntauULzoxN0xBI6kFklv4FRQWrNWLanlinnMzYzTJYZQ+2FBeiHPP+nk8BmwVW8AeEewnsdriUwLoH3PSLH1/SoVYUqmreeaR2vv8bb2hnbLb8QybcCQe67iQm6lnWBDXS0xtC/pPXrtMnsFZyEYHalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gO0U6MzhuRChdzQf7y1bYxEqbwv1eEZdyzPgmDuzFrk=;
 b=VGYFxoA6ZxxmFIHvFq9pnM0q5MR6hv2Kc7MRuOAZ3eg8YuPTauRqiGGsuIGujYtIAqv4FvGXiR1ihC+JOJnEfGa/GtudUSBpRMZwzu4izad7fMUK+p76Zsf3q3Jp8aS539BOpzD+b3s4A20jSrezxLFnssx3s/K7BzmIDtiAQgr6omnuG2vqY+ojDBj5gB1sDl1YsOngg3NK1i3C4cdRTL9qqSs6JDrU/VZdxsPNJFhc/tJKaDCA9wqDH0M0d6gYQ9wauKYfQBqNgfVsYTNU8q+W43HbaWeuykb2+lyqiMcGQCIuPIPkI6inyVNgVqP+eod/RrzmrrUaRUZB245UpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO0U6MzhuRChdzQf7y1bYxEqbwv1eEZdyzPgmDuzFrk=;
 b=HS6cC/dRylqvaOT7mPGoof+4+M3pt7zxI/yC75Pp3Ep6mIr8POANZ89E1ptZQF6seLyzY8AqTM3nSaU576R4fRYBKHcwaJmiioBKnc1xtdX3iJcNAjgb2BliPlFAAxiz9JVPG99aKwDG1r29toh0Rz+awSVo2HFJ7X4Bb67RaJUZnGccXB4LLd7ICosRBcpPqMPgJZS3LKp5zw6P49xn5cdwsbBabw/VqVIYMCc5vUMusKiNfZByjqjxrcbNBufK7TUNaXogDRY2xYOtA+ob6Aqh8Zh00Wfibh2CouQ0FpQiWfhyuqW2oN6L5aGX+Hyfl7tFG2FWv+LSBursDzHrdA==
Received: from DB8P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::15)
 by GVXP195MB1614.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:3e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 09:00:42 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::4e) by DB8P191CA0005.outlook.office365.com
 (2603:10a6:10:130::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Tue,
 28 Oct 2025 09:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 28 Oct 2025 09:00:42 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Oct
 2025 10:00:39 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 28 Oct 2025 09:58:13 +0100
Subject: [PATCH v3 6/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Fix
 audio codec reset pin ctl
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-6-9b98f29a6bb9@phytec.de>
References: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
In-Reply-To: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|GVXP195MB1614:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1a2827-8579-44c7-fe40-08de16007936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEIwT3ltNTZRaXFHLzhidEhYMGZqQzdqUDFreWFJUFExeFNzUHlzSWlVRVo4?=
 =?utf-8?B?YlRwQlR6L0p3TTBMdC8wQ2IvVkE5K1NwbkdUcW9JOW1yK2xoNVRGUnlXSlcv?=
 =?utf-8?B?QkQ3eGF0YWQxQVRxTEJCcm50SHFvZG1wSWZvMFBkeGx1akExc0xhTjJSaW53?=
 =?utf-8?B?M3k4dzNBb2oxV2VHakpQbSthSmluRk81ak5XcnYzcW1rRFNLTFZZL3EwMjh6?=
 =?utf-8?B?cnFqcS9rMGRQakVlM0RCbXlZZE00bnlnd3VFa0cwZEl4RXJTKzllcW4xbnNL?=
 =?utf-8?B?bG5qc1ZVOEdROGhnU21vRVlBb25XdG81UUpnMXo4Uk1IdjdXeWFuUUVuRnN4?=
 =?utf-8?B?SWZVS0JQa0ZJeHo3NFJHVEtSSmliMTFTUFBsSnRPb0I1dWRHQ2ZjeEw2M3F0?=
 =?utf-8?B?VlNVdFBQeXlsRzB5cTAzU2tDdGNMQjJOSVFJRUIwaE9PMmUybVJVR2FaTHB6?=
 =?utf-8?B?K2FRNVdVZld5WjE0b1JraFU0VHBlUkdKbTdKS0NNZTlsMUY2ckU5ei9xOG5O?=
 =?utf-8?B?dzJ1U2kyMzZUdUJnUE1WU2wyUjJ0bjRTZnNCWFBRS3pIYnZtWVorY044Uk55?=
 =?utf-8?B?QUtQbUZUQ3JXZlM3bUxIdEpNY3czY043ZGkrSXZkdzJ6QjhjdjNwN1dEU0U1?=
 =?utf-8?B?KzJjam5lNWFRSVgxMXUzK0ZJcXhmek9wei9ZajFpRGwzaFVZOVgyRjlKc2p6?=
 =?utf-8?B?WVlUOXgwd0RMWmtTODV5TW9iYkJSL0VyOWtqMVNrVkFINVdydGk1cjdrV09u?=
 =?utf-8?B?ckNFMTUvMWRvM3ZFeDFGc3RpSlRXMXlHSW5ZQkdEcnFqd1kwMC96WW1FNUFi?=
 =?utf-8?B?WGVYc25NY2NiUTF4cHVhVVA3czNuek9mRkd1eFlzbDRwSkdBbUhYNEZjM2tv?=
 =?utf-8?B?dVFqQ3Q3eGViSWo4M3hXeHVZYjAxZFoyeUpwQTJ6RG8yMks5NG9KQWM4b0Vj?=
 =?utf-8?B?ZFdlYXpKRlFoOWxDR0hTQnE4MzduTkpIVkpSNXZVMm00WVcxN1hiY2pkZEli?=
 =?utf-8?B?YzZuWlZjaTZjNGtLd2FSWXRsK2c0Q3YzSUlCcVFGUDByd2pIbG9GdXl1Zlht?=
 =?utf-8?B?S3pNN0VuZ0FyOUczK2ZybWNONVF2N01VQ3FSL0NxcnAzdG9NOWFXeHdUUUxO?=
 =?utf-8?B?OUd3R0RKejMwa25FY0RrZEQrcHIzd3dmTlhtcmVQMzNlOE5zbzhsQ0Jnc0FN?=
 =?utf-8?B?eTlZalRINHBuLzBFUlh4N3MzYTVaQ1l5UHFCb3NnR3hWeGZGckt4bkhVcWds?=
 =?utf-8?B?eUlldEhTeHFwSUNvQWZmQkljYTRzWVl3aVpSbXY0UHFSNGtKbEZNenExZTc0?=
 =?utf-8?B?cWNnZFc5RU5HVHMxNngzVXEyL1lncmFSRmM5NUw2WXJpQ2RsK0EzRjcwRFRM?=
 =?utf-8?B?RnhBbEFWNlFnQnpZbE5GN1RLN2p1UWgzZWdrdlNXQXd6SFlOS3UyNW1jTGNP?=
 =?utf-8?B?OGhaNGRPUkVicDJCcE9rNzRpM2NKem9laW0vYU9qTFN0ek1GZWR0YnFubHdV?=
 =?utf-8?B?S29iVVZaSjFEcTdESnpubG9JZDljVWphVk1BZXNxcFFld3B4SDJ3Y1l0L2xi?=
 =?utf-8?B?eHdlUDZKNGp2U2YyOHBjRTcrS0hPWU95WE80U1hNd1hIZysyUU1pVEtPTjNn?=
 =?utf-8?B?NS92NEhOWmJVbCtpSEUwUjY5OFdHdU9yTjZ4cUFCUE1SS2Y3WEltUTRNNU9m?=
 =?utf-8?B?a3hwUERKTmVPdnlYbVJXR09VZ1JPemJtQ3ozVUIrZjdRVktqdnVJcis2YXlT?=
 =?utf-8?B?dGdKSjdvRDl1V0RFemRES1RCQU94M0lERXo3V25yRHBBOG81SVcxaWpteU0r?=
 =?utf-8?B?NVRHcVYxbXZmWUdLWmswT2ludUhyYUZiYVMvcjJtR29CajRBdW4rZERiblpv?=
 =?utf-8?B?MGgrOTVuTTkvb1I2Z0FkK3Fac2lDUUkza2t5d3ZqVXdjNUNFaXBzR0JUN0FN?=
 =?utf-8?B?aVhyTnRmcGt6Ymdick9wOUtYcUpXOGNkQWRKaTFleTlNRlR5ZmpXSUJXNktB?=
 =?utf-8?B?ZlRod1o2NjZmSUpubDJLeHBYaHNmQmU1dVlhdEd1akVuK2pXcGx6amcyZ1Ix?=
 =?utf-8?B?U2doL2tnZmJEbUMyZ3pyS1RXUTZuYmg2VHJLdkF6OUcxVkZRdUJTZ1ovMDVS?=
 =?utf-8?Q?AdOM=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:00:42.1906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1a2827-8579-44c7-fe40-08de16007936
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB1614

From: Teresa Remmet <t.remmet@phytec.de>

Enable internal pull up of the active low audio codec reset pin.
Otherwise the audio codec does not reset properly and is not working.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
Signed-off-by: Jan Remmet <j.remmet@phytec.de>
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

