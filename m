Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC391B4127
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737445337; cv=fail; b=XvkJg6xruiHq6lmOqviBaHKDJ9BpzS0mQEzExwPx68dJRBZVFHhKaXi/ZBKIkjQQlfW/p0ZZO0qK+I5PTwBRRZ/6KeAMFzCqNmFHFeWnfuY+EnPIcfP/Kc5ebO21R+4XFKUpRxUyu3WFhmuL3qrf9b7FLMz1hlLZlqPE78iwwkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737445337; c=relaxed/simple;
	bh=VjFntD/z3fVSJmz2moEJxr+9ZNlEqMVPA7iMSK7J1p8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lRbSxZjGid//341F8EC4k8NlR7W9dVknNsADbqnxAT3M6AbgslVOuwrGav7qAZplBwSAkXiuiHXIh5VuR2fhSYAiSCriWe44g10y3UKPLDPNGnL06fc6vE5jdRMtmCgbTZE1nYHE1XJihb3vEkIjJk+57PTUSll/45L/CSyEatI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hsie+AhZ; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hsie+AhZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDUObVTlaMXGqSs4aBf1/qeiIiVASJ4rbOP50H9AikLOVoPcdpKNA1G4UDT9e4oMmE0tpoWtkTw4UWMYE9A76EPXMLo3E7+HsvL8BplvI1TzzW10XATBCEn0GgpEJestZHA4xGee2ZScPOKBgwSJxPqjaCbnOtslBXp7vvLJ/i3QqjL60GHbdWyXsXrSeEyuMpATd09omgPwJ2XeRLf1PBXDn8xwqchUxPAQEypDmVQkK4DV+NtpWrMw8LKDfvBYHX0gzMHEEoId4VIG4xDtSqlQ4634C8bzu6kKVuxy22oFzc5J3Pecs6qbk/fIlcKsUvcn7mEhJisi4c3Cv+/kBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfSJq0uuKgXy8+obolbuk9/59piFof55T8UQXJywEag=;
 b=wjTORGXlzfVcshwYhRa7bl6S+mYZ1EsZgVKZ8JEv5GIRf9I6Y3wx2H9b2B/i48bl9tgyU+oztClF02VDqyDZcL/mkj6KD1WUIdDzHYjoz3kwLpSJ1qA9Z2EpFcLyl778Lr6AnP0N2R7IBabdkRk/ZJ2p4kPl4gA5o6y0E9ivBaJHOSrx4dnVHxysj9ghwVwCwkmCoKOfghRYcDM2kxts0gsIDcJ+ytW4MCTezuzZX34o8O0XhZz30FaMzK4YTHvb191vZerUrOvI0u0S6HHomNBHrgvzBcYZ2BOwGvpQcX8NimaBpDFiy6B3gSNQVfy4pOsLbtiIZ76WVSadXVuJ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfSJq0uuKgXy8+obolbuk9/59piFof55T8UQXJywEag=;
 b=hsie+AhZIafLfLNQRFkJZbUP2ZW2jl00rQeZdWiZ2D+DW4b4HfmD9JYiXddjXEKPCsRlkOTwSSuBRKWMeRhoEw7SfiEOay3L9S28StFWMQgfyG6f+B2kdZwimpvh1iIgbsNfiDPzzUl9MH8fwPwzcDxylSx4QMxP8LCEsROjkXPfBdv7zd5g8ijv9Zp8sb4u50NzIxyPd9BQDFdjIJovIlkHdfHdgn8+V0cASFk5yP2Mwhpov6XBmKSZzcl3OnBv7RLc2Pj9Zh1NNVQS7zdRa0bgYJUiiAN3u6VCnbNxiOiIdSrvPRbzAsBOlJIxcV9RvW4yhmVGm2YNVXZ+49SPfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PA2PR04MB10410.eurprd04.prod.outlook.com (2603:10a6:102:418::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 07:42:13 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 07:42:13 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: joao.goncalves@toradex.com,
	marex@denx.de,
	hvilleneuve@dimonoff.com,
	hiago.franco@toradex.com,
	peng.fan@nxp.com,
	frieder.schrempf@kontron.de,
	alexander.stein@ew.tq-group.com,
	m.othacehe@gmail.com,
	mwalle@kernel.org,
	Max.Merchel@ew.tq-group.com,
	quic_bjorande@quicinc.com,
	geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org,
	arnd@arndb.de,
	nfraprado@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	ping.bai@nxp.com,
	ye.li@nxp.com,
	aisheng.dong@nxp.com,
	frank.li@nxp.com,
	carlos.song@nxp.com
Subject: [PATCH v4 5/5] arm64: dts: imx93: Add labels for the references easier
Date: Tue, 21 Jan 2025 15:40:17 +0800
Message-Id: <20250121074017.2819285-6-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250121074017.2819285-1-joy.zou@nxp.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|PA2PR04MB10410:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d99aea-cb63-4557-01aa-08dd39ef1e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tOV3+F5TGFAmel5mJpCtQifZgqSBrkyOzgMEistEgCahYk1+XR6opQaN2mnH?=
 =?us-ascii?Q?RM/nOtsGFd8CLbZevZrlaHIClVT0k00lEaR6glT4eAxS8/+e9c3JxYdUKHI6?=
 =?us-ascii?Q?XLd04lFASp/+vvYnCsFtt+BZbQ5m2psgPB5RY9i64TODVreKn2N9WtmCMAYv?=
 =?us-ascii?Q?17yWG2136+SVCy6JqRp2+ND7/VYZh1jOIN1PoY1SCzidS0Gg3vRbhoytUBKh?=
 =?us-ascii?Q?sTllmVNrWXCLEHtmKkFIbbkvtUICXSwNUTNUf6zSIdwp3odZH+kMxUi8p99s?=
 =?us-ascii?Q?LP9ROoRNKQiZn3dklTBwC8nllHZCPulMbJWrGPVA3z+mos6AMFTxvXT08f7U?=
 =?us-ascii?Q?0kxuhW6plJF+cVIaEyHHp+fNXc4uYct2W7vFjQM+PyymRQUFCbk+b1lpPsdr?=
 =?us-ascii?Q?sFbZIeCzLcH8hD/5AStMxIBGYimkB0tK2uWEqyYROw7GSGrGp8Umq+Up/5La?=
 =?us-ascii?Q?JEXONAehLY+wuNMTcmMzUcVPxfDY+bPiifjo5ULklFaW9/p1oG7EJAJyIFI6?=
 =?us-ascii?Q?sHjT5IizWX3sHQRZ6ulhjgNzrtQMBDwaY3NF3GxkiSVoQsLbwMUfRmyeb0vm?=
 =?us-ascii?Q?+Q245eiqRBjV5tTuVZzUHpcdwaMsLiCAQM02SiBCWUww1BdyRfy1I29CMcgu?=
 =?us-ascii?Q?ovrzuKrstOuP6mOQfJIs7+Tm4URH/vHjgQ8MDIQh3qAhMZV3S4AZX4sUsEXg?=
 =?us-ascii?Q?6YhBwP5iME213tJ/I1CASdWRKijY/U2B52PBOl6ptU7H4L5dfj2JTHupaIY9?=
 =?us-ascii?Q?VRprpClTyiTaDx58uxMbzIgGwkRPXiSl3WdoU3aaRcklf/ifBCQefBHlxmYP?=
 =?us-ascii?Q?rd2/02ZfzylN5v0aGZTNgbwA8Xgw7YY4PJcKQ3JpB+7q4dsW/pviukOGTf7U?=
 =?us-ascii?Q?BhmhaWlS8OVtDPLPihEApi4bdd3FbzT/XndkSu1KPjX1tafWKwdwQaxNVx0J?=
 =?us-ascii?Q?SNIhp1qPaq7SktXctkbiuu88YPcXS5vDGwnFFoROBo9uhrl6dtuT3rk5aCL6?=
 =?us-ascii?Q?c6CGqFSf1k0S4nBtkHNmSD1DvzkSd9sAwBvqDTwNsBgz3PKMv+jjwZ3uuxU4?=
 =?us-ascii?Q?nyfT1LIq54SgF5XhRYadKlIJCSr+O+LHfROHnl/iyVur7PCrbqVGO0cEIkqH?=
 =?us-ascii?Q?aI1ou22uOGzxNvTK1yzYlUR0DDGpf3IPavbZdZaDUqBvEovcsiaHmKmM6ztI?=
 =?us-ascii?Q?FmA4SCszuqzZgn1lyNpTKpfFU1PQcq+g76b5Lwx08jc4PyMkHoP+I8nttKSY?=
 =?us-ascii?Q?8ZCu1eegQOEG6pewQtNhP5t0MxtNVTgIBJN/oEpW5B7cX8WhLrWbmbQp5sgB?=
 =?us-ascii?Q?vavAwYwuWEatld12FGhn4THJ2zBVTfN5cLa5S+aQRoRKMwEDP6m4P2OomAKe?=
 =?us-ascii?Q?C2TVDB3s8md8Xu68ZhSK8jE9joKFbc1hWfzsxVNOrU3A67+GAElxq1JpzbNv?=
 =?us-ascii?Q?O+WHsT4obvAsexMp5S6od/DsCzpnVvU/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8a+YguB0Qfbv6B5eMNVfRKTCyRq2dfb++lBTh5LlMR/PPg7CFufOYpWB9Rm8?=
 =?us-ascii?Q?JWG0UT8Vnak9ogKmTXIJGMA03g+5oij5p4SZBlUw8nUzgn8OJDyhPOm6fwxk?=
 =?us-ascii?Q?TvS2TBbyUboGDgX4Ec8Mbt/ffiHNZOMej6m2bTPZ1t6+LFszCje2kh2aQqb8?=
 =?us-ascii?Q?d/j7qz6S+S0kscXtDJKPnEtkfX6ZX+cEcWYHLNrrXi5rhbNPy6UjxBCH84S4?=
 =?us-ascii?Q?CrbtcUh9mrBu2F9oDZbmECctKUuJXNlWo/eJ/0elLuXMXR7m7qpzMl+aGKTO?=
 =?us-ascii?Q?Hc3fnGOnEnXrPIEoB76IyV0/d31Do8gYL8jWDH8+CpJ5cJpNPeNgfXssTQlG?=
 =?us-ascii?Q?P6xLuttsUqCNZtEDULN8BUYFBXdfIQF8FWPYM96aBLRrSqwg/R5KdSGwhLM0?=
 =?us-ascii?Q?FR2iuJcSOqAFvGN8mHAlNxjBZ0OR6aJrr+utRzS8pQ40gny7VSJjKSnDjsE9?=
 =?us-ascii?Q?BC91vE0aUyyIKoHPAP6fNM89gTCf7KdooYdb60UKSoFuTDaIkSbkKlYQJ0se?=
 =?us-ascii?Q?iYiEjxrj83vxOGIDWVw/jCbmaRQ5JCM3HTdmSH3NH4BewSQU5OtivbijBF+o?=
 =?us-ascii?Q?zvaT2mDKNfGIj2g7wJhvjSHXGbO4v23aTtYrahSCIcuf7E1XvdtK67NjjqkP?=
 =?us-ascii?Q?D47pthyryGWF60G4IIJiqBePjzn77cmkD9xD5Rfi79srTo7UIUn4RDuiRHdE?=
 =?us-ascii?Q?mVqc1SIaDArDnPWphtoII/OWs45s95+dWCO0yb/MwsQrcnRIizjim7+jLwcH?=
 =?us-ascii?Q?3+rZ75sDp+lmE3m9L4yFM42ndPDo5i2tFiiTLGL2eAW6qQqyTlFGwjlXxAvQ?=
 =?us-ascii?Q?26YBqvuB3NhP2NBkKnJXm+vZR5sMUEfuo5uLcY8NBwLa5Uh0dLfCwzvndbg9?=
 =?us-ascii?Q?APpJMsqbBAFbHh/ukkJ4h8Aoqq4SoDiUrx8sRdzRMgAbyCYsX2KjgAEGdJsc?=
 =?us-ascii?Q?5w/UNAzqPJYfHVVGsWcmN9Z3DVTQM/Rv/pkg+IHTCIN2mauPu53sQIP930T+?=
 =?us-ascii?Q?1as69JAA4qiyGBCv5f8tN0HBJtLJNGxCknKiAKguSw5JEhle27rDNWQ2q5Nf?=
 =?us-ascii?Q?eMjr/dn+pyS8eAUvBQ4F77hhKsWiB/HsOTIrFpRfTjiXHLHczzyyrYTo8Npq?=
 =?us-ascii?Q?0OLXX0QCw36TJmO8AKp9Sr33iTbxsY7l1nqj3+erZSilRab3lwdS8oJ7BUIN?=
 =?us-ascii?Q?Ay5oxXt8hWfOaCrHlZnKXirOJEle8G+AXhx31aYVR4a39jTAXQiF4pP7Lw3R?=
 =?us-ascii?Q?5tbY2zaIiXUbWgba35tCPuAe8L/lWXqAAbPXPKN93g5vB8G2q/iDl4JH2HyJ?=
 =?us-ascii?Q?f45hIKvORpbNVRmwDauDk2r14Yu72XEI/syz5cftDJjIPYfugoTZEvQuItkr?=
 =?us-ascii?Q?6btK7wZi2Kt8oP1FBFfoG+SWWBoJRrq1SFJX+AO8lBnbOcEtB248C8ix4VQh?=
 =?us-ascii?Q?WpQvn592J/b81PpnBqIYkBIw4IZDP8Tp0dRUi5ueOPXMMoN/jQW+q/wf8gs7?=
 =?us-ascii?Q?w+vhq2sx3AOjggHzSoAFfEwUfysTRQ/dM2QEYpp4TbFWPJenHENA39j/HFLr?=
 =?us-ascii?Q?+3uuDlsn36tQAyhkHL/QCSnH/FkJjNn+EcVtB7SL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d99aea-cb63-4557-01aa-08dd39ef1e80
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 07:42:13.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/NoqI/r9JLPv/DOhL3bpzOGCHrFHd4IAMtV/GjzgfXN14t4wn4mWKzVhl67z6P4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10410

Making the references easier, so add labels.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 56766fdb0b1e..4739e7cb7e9b 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -206,7 +206,7 @@ cpu_crit: cpu-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				map0: map0 {
 					trip = <&cpu_alert>;
 					cooling-device =
 						<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -1334,7 +1334,7 @@ usbmisc2: usbmisc@4c200200 {
 			#index-cells = <1>;
 		};
 
-		ddr-pmu@4e300dc0 {
+		ddr_pmu: ddr-pmu@4e300dc0 {
 			compatible = "fsl,imx93-ddr-pmu";
 			reg = <0x4e300dc0 0x200>;
 			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.37.1

