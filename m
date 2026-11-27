Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795773017;
	b=rQir3nCs77CwbT1aj3lu0TuQYOsx2g5n+IHOOrV0Qjm0Ol84BAjCSjvduBvm88CUn/5K
	 C8RvJxOzJdmqtivUwmsGtTtG6cy/Odu3tmG2XhMl7DVIEMgKN7aGcvlSCaG8wYQR66du9
	 3xmyOq0P/hOKWWT5cgGxJ/qF0U7LiK8bXsuKhI4qumZ3iye8HvB0DLeBf3gZAXRvjThLV
	 J5fsXTQ89WrfiR8EkaV8B63xPHgpH197nswhoh7oHOvA/NvoqbHYmO4L0Ce3st03COPTU
	 xMcjLvxkLEooFmR3+3hQHBq8WN1U6B9HJL502ohQvr7FNtDZ9jxI/aTmusCgKB39RTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773017;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OaTecTGfKvtIK0LYnkjK+UI5L/heyPaN2mx7ScAiEDg=;
	b=LG2W2VhfE4iE3yalBNCuUb4fY/yve0ZXAYbdtwAGeT4IMlH6hnL1DDH0tTl9njuaRd5S
	 YGB3sxYQdTDSIAMQunM/2zmjvfsh/Vn0D4FuO7yE63BuZgAL0S53nOetLSSmh5j9hRJlh
	 W2ycp3Dl28ntInPab/m51SDIf8d3dP3HgZBFHmqTGHPkaOaXQ0iCRZJrSlSJ1Mg2y555B
	 Fx2CWcX8HdTeTco6sit/nE83tczqP5cgRWXlYQZpT7pec4lay4HTf07G4j89cpxG9YyhU
	 EgqiskX/yYlPa9+jU/JZGnHXZNaNYHbuqAbYz/0R0nIZpi0mdSn373DtqRzqmXzGSLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hC71zD1b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.10
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EBB606A32F
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18EBB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hC71zD1b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nd+ltZAuAMpwrt5RRyxQQmP8PglRwdta9h5wYB0hmdLwESqknAWz69AYpZc8treW2g+KOcskd3Cwz6Rh79d06VAyX8gRGOsMoT8uAsha8L29M5VOyO9MrXEkC/0wHeiroIiVg3Jh+9+lz97P6u3Fk3x2bBHlpdskSPirwuBY1ZelCAQ+j5UiLOFLCuEqtOLL56Ce7iPk2cGs1Cm92/J55sQfRHc+3h7rO+SNYfapSbuYQAFWzgBFqcMr0GsIpE4Yp8tH39xzn4GKHMPEXSFIdO4khP2iTOAapBE9PVLbtxzTq/KwwheP8qhfxksBjK5+E0w5lhnij/YDg/b2AoM1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaTecTGfKvtIK0LYnkjK+UI5L/heyPaN2mx7ScAiEDg=;
 b=VZo3UIcp6Nj/917oYB5VwfkHSYihvuSnjCWY6uUqAV3stuYAigrWBSr1Bar7FyzZDnW6x0RRVuSHZmyUkIVoWLub381KbAXBwb0P5BH6XVWEnXILemzvsCHweyMMmptnl+YGsURF7nl6IzknAJUn3Zl8JCICcpodzdQVAqxnvU5dDlDEVQu2/Usu8xzs9mLzRk0KZUGp23JboL2jFn8m1Brnq3LVkKZUdvJfqmkj06ECIHT+JYyEouGyOwnaARzDo97pptZKjaVHiPsHDlfaphVGDcLLSqGpg2Qvl7pAOv3WR3Ja8H3VrhQ6mxbr/cLp/erLwbfWzZIgHLO1Wo7vIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaTecTGfKvtIK0LYnkjK+UI5L/heyPaN2mx7ScAiEDg=;
 b=hC71zD1b0oqZVN7kb4XXChpZ/fuivd7dBcBj60A/Vfu5JSC2RHgGyRg9GOmkqE0YCKo4sJaqsYJtOYBFQYHO2ZhC3bRGfCtZ+xQi9mueO0yHiT4NIDvHtyFAKA+tdkNOyS6MOQkFQw5YPVgujSl58p9kRFMfpGJE2SsKRgXPyXqKCzXJ1792lEc04IkGYsg8QuNJuVOlTbfE5gAlHLUlF8ja2p+yzJiESxJzE/p9qTWDsP/jYBQxOnjvyIKipQoi4P+vLTaY+jFrcYBqhxwphAdSfpS83O+cpLVK1k39a9bxVcZgy5W9SINJ8vIZvqPbKAyHOxb9DFQtUP6F0x4nOQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com (2603:10a6:2d0::cd)
 by GV2PR04MB586427.eurprd04.prod.outlook.com (2603:10a6:150:606::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:50:12 +0000
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd]) by BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd%7]) with mapi id 15.21.0639.012; Fri, 27 Nov 2026
 09:50:12 +0000
From: xiaoning.wang@oss.nxp.com
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	daniel.baluta@oss.nxp.com,
	frieder.schrempf@kontron.de
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: [PATCH net-next V2 6/7] net: enetc: add i.MX952 ENETC support
Date: Fri, 27 Nov 2026 17:47:28 +0800
Message-ID: <20261127094729.1061755-7-xiaoning.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
References: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 (2603:10a6:2d0::cd)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BR2PPF9D47B45B4:EE_|GV2PR04MB586427:EE_
X-MS-Office365-Filtering-Correlation-Id: e99337b8-9790-41fb-9f0a-08df4c6bd4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|376014|23010399003|1800799024|11063799006|261009223027099003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	Fz+3FX987DlRIYRexqH+sKTmS2d524uIyX8ZUuWNLeZ+5ePUok9gwCxKhSI8AwzerYXCdEJByd41kDtpSDCOuAq1i4UQprCFF2FSZ6SHejvFXWKab6abNJsSISUpA5v33TLpeGzp52+zHjhfUvVJZrcfY1jET0W3ZebHIQAJRnLY9IIERF6PHN7RopYCGaEn8KvHUjmvV46IZo21d33DvSzLTf58IpV3Z2F25eiB5BLFQJFewEHZ1LLBgM+Ove9e93n7zDd8f7epbPu10cyzYYMVFbGqLzGrfphvJMp1btNmYTYwDaQi7/cJVOkTLcb10gCkQauzCRY5tqmYicYAag8/EcbTMCPGpJ48fLAn3W8SqmxIZCforFBfMjXPLAHne7z9ku08L0wSA9e/bCTfjUSRVT9+Bylk/alTpcKr28C4JbAPOF4z/vFR3lXZz1llup7rdlkY40qq0GR1bwzyz6MfPcMEMCwAdkb30ICRUoY039nhPA0NWTF8+KtOUnypVeeOmy+1P+S8qxUWIR3htezDZQBt5dQWyAtr4jS7AJTzys/Fbw/3ZumVuTxc4/OIWJqGMet1LXunvqxcCmNURvKSZ9c6VJk1eW/HFQH9NA6NkNOjgdFq7hjZudqN8QQMy41rmyn38/nMFtNPYK+1tnkGIo+14+WW0vfu+398DCo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BR2PPF9D47B45B4.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(23010399003)(1800799024)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sQW8phTC4WIrsnXSSlbcY8/RuXBDI/g1NlWUzbmURd6piuyq01fHzTll5C/p?=
 =?us-ascii?Q?J0ptbOLUmY6QxfO1lb1Laigzgbl6MMiiJix6Tv5PRx+I0a9nn6M4xXzTP2cF?=
 =?us-ascii?Q?cvjN8/ypnm+sp7Sxx3ATak6QvRJEBnBxOG3ZQ8yqQE9SrECBSN0jSo+QVkVX?=
 =?us-ascii?Q?8pOYyRbl1FOvon+zTxiBjyUEJonqaw6RDT7SH69efZX2rA9dWv8FlD49fEJU?=
 =?us-ascii?Q?V3Gd2a5ElVATZ4jDWFM1ZHDVG4n8vCHiP/DlTTN7N9TUHuwn5mcEOaWgLVBr?=
 =?us-ascii?Q?dVgVGzcpuofPsX2wpwpsBbRCEry9pmjvYVvANsafBuSrSqBEtSgh3oAXhK1w?=
 =?us-ascii?Q?po24l6/ddaOnzo2MN8szB7dxwF30PKv8VSC6FQhc8K5cQJKomEMtcpp4GeUD?=
 =?us-ascii?Q?PoBLEF/Cpn9cNehtMVRBPOPLJenfId5devkYoQIfxbJyZXie9i71+fD3+jCw?=
 =?us-ascii?Q?dsnwrQI5btXmV7T1IDGaMWdD7g/J4/ZlwSIl19XcWZ/QpELunNUuwu+44g3R?=
 =?us-ascii?Q?QCYEnMQ4NBxenFtGcPeNQHq8UkjdIJOqOFPgiSTBQdkCGe4oyoHFXqjQcpJU?=
 =?us-ascii?Q?MOUs8KJmU22MPgc0xkWsQwhdWw0HPGhNWq/etyqPF37IhuotDnMEqt9OqEoq?=
 =?us-ascii?Q?Sah0akhh/5ZjauuE29sY4Ec1LJ6olqQsXT5QbCvIXy+JmW/JUySs6CuM5el5?=
 =?us-ascii?Q?Ksz0/V12ob2xzXXvDxdABo99mJma6SDQ9pfxnrPcRhMPHuu42GD9E1aOSFH/?=
 =?us-ascii?Q?C4cLbNLmAkgu5cQ5gObpl0IUCWoJPXjOnjSrLaholrN1N3j5os5Uow3Xdyoh?=
 =?us-ascii?Q?XBjcSX7uCJCsZQ4pqcr25DLBNzQeobD9TvTXOEmUn/2xyPDyNURuIiLXK1Y8?=
 =?us-ascii?Q?FAUr0U6yLlbKYDy8ZWJyBECJvzRscOFxA6fqtT298bpGfIDKvGWL5BcF6rpt?=
 =?us-ascii?Q?afRF74lGEC/Rx4Gxivr5cw0YmRyuN0qv1UOe7vc/ubiw+u8tAexacl5rkRFv?=
 =?us-ascii?Q?ufnf8EsSwpn15lRAFr8KasUuhlrAfU1w69Zf9qcebttQhrE/6vUtR+pJtBKM?=
 =?us-ascii?Q?R/XiZW/vVi0V2ist88Zvph5IDj6Idm8JBTJFHPKCqCtjHM084GHdQUWQ0TwQ?=
 =?us-ascii?Q?x/RJU1OIwI5vmm+wEVUefO6nBu0lG0FVFninDhPYjef7NBBy2ldeN2WvsNWP?=
 =?us-ascii?Q?8jpnAH0Rje/SE2HE/nPPKARAEPZ4fLYM4/1pZdmCnNXvh14TCtWbFXlZVGd7?=
 =?us-ascii?Q?EwHh5m708W05UoA0qiDE8WQKmmZMrzpkD0cfxmhJld3OGWaBAnactp3J64iJ?=
 =?us-ascii?Q?Cj2iagnkpp/4iGaZLOxHl54GPvgqY7oY3L5EOVOtLRkDWier5SBKH2ITHpBA?=
 =?us-ascii?Q?1UsnSa68f1qE3RQ9l2FwFG9aZWjK3uLwXIn4JnT9fNQffARiTmwSoroThTvZ?=
 =?us-ascii?Q?zXlLie7Q4WDLJ7KhweWu+MBbTOlnI4ztnfWdUTJ09Lgyi7Cv8c6qYBEAFWiE?=
 =?us-ascii?Q?ul38zF13b77k98sNewSn/M9wKfxui1nxRxRjpJiOjpe52IUaIg9pnYSynyjm?=
 =?us-ascii?Q?Q4Ixi7J2iWApA30Tomj8m+O3V96NlS/OajlFvJzs2RpFx39Fwa6hvbdBoC9E?=
 =?us-ascii?Q?RS6RZFf8MXOCOirRtF8YE9igZq4WdJY+Xlz7fnplk3+FCRT/QsCMYWJcsd6t?=
 =?us-ascii?Q?8ZIJ90qphHq5LiEXn6boZoEPIo59LTczL024uKzer4JM6xwXQ8eJ+vZsbGZG?=
 =?us-ascii?Q?L16gyEHzpZRbjx+wRu1AT8X1i/VWWBVzh2A5ueXFJRIBKBoLxIN1ZjdMEcLG?=
X-MS-Exchange-AntiSpam-MessageData-1: AjrkJYcyb0O8pg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99337b8-9790-41fb-9f0a-08df4c6bd4df
X-MS-Exchange-CrossTenant-AuthSource: BR2PPF9D47B45B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:50:12.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvm3C8zEYPSPuZTDmNWyhyO9w5JC3PrZndFs+kl5uEoH7JebpM/WHAn04kuWX6myW1JGjePDlK6UDvftHlyqVBL5R34yUgq91kFrOAOfToujtl5KvLmJnISEjfaHBgb2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB586427

From: Clark Wang <xiaoning.wang@nxp.com>

The driver gets the driver data of ENETC based on the IP revision, so
the ENETC PF and VF fail to probe on i.MX952 because its revision(v4.6)
is not present in enetc_info.
Add the v4.6 entries to enetc_info.

Unlike i.MX95 and i.MX94, the NETC system clock of i.MX952 is 133MHz
rather than 333MHz. So add the new PF and VF driver data with
ENETC_CLK_133M for ENETC v4.6.

In addition, similar to i.MX94, the PTP timer is function 1 of device
0 on the PCIe bus of ENETC 0, so update enetc_get_phc_index_by_pdev()
to support getting the PHC index for ENETC v4.6. ENETC 1 resides on a
separate PCIe bus and uses the 'ptp-timer' DT property to reference
the shared timer (which its VF also inherits via pci_physfn()).

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 23 +++++++++++++++++++
 .../ethernet/freescale/enetc/enetc_ethtool.c  |  1 +
 .../net/ethernet/freescale/enetc/enetc_hw.h   |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index e3aa117d323d..d0cfe30005e2 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -3820,6 +3820,14 @@ static const struct enetc_drvdata enetc4_pf_data = {
 	.eth_ops = &enetc4_pf_ethtool_ops,
 };
 
+static const struct enetc_drvdata enetc4_6_pf_data = {
+	.sysclk_freq = ENETC_CLK_133M,
+	.tx_csum = true,
+	.max_frags = ENETC4_MAX_SKB_FRAGS,
+	.pmac_offset = ENETC4_PMAC_OFFSET,
+	.eth_ops = &enetc4_pf_ethtool_ops,
+};
+
 static const struct enetc_drvdata enetc4_ppm_data = {
 	.sysclk_freq = ENETC_CLK_333M,
 	.tx_csum = true,
@@ -3854,6 +3862,13 @@ static const struct enetc_drvdata enetc4_s32n79_vf_data = {
 	.eth_ops = &enetc_vf_ethtool_ops,
 };
 
+static const struct enetc_drvdata enetc4_6_vf_data = {
+	.sysclk_freq = ENETC_CLK_133M,
+	.tx_csum = true,
+	.max_frags = ENETC4_MAX_SKB_FRAGS,
+	.eth_ops = &enetc_vf_ethtool_ops,
+};
+
 static const struct enetc_platform_info enetc_info[] = {
 	{ .revision = ENETC_REV_1_0,
 	  .dev_id = ENETC_DEV_ID_PF,
@@ -3896,6 +3911,14 @@ static const struct enetc_platform_info enetc_info[] = {
 	  .dev_id = NXP_ENETC_VF_DEV_ID,
 	  .data = &enetc4_s32n79_vf_data,
 	},
+	{ .revision = ENETC_REV_4_6,
+	  .dev_id = NXP_ENETC_PF_DEV_ID,
+	  .data = &enetc4_6_pf_data,
+	},
+	{ .revision = ENETC_REV_4_6,
+	  .dev_id = NXP_ENETC_VF_DEV_ID,
+	  .data = &enetc4_6_vf_data,
+	},
 };
 
 int enetc_get_driver_data(struct enetc_si *si)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index dd0654683b09..e9d385fd0929 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -1149,6 +1149,7 @@ static int enetc_get_phc_index_by_pdev(struct enetc_si *si)
 		devfn = PCI_DEVFN(24, 0);
 		break;
 	case ENETC_REV_4_3:
+	case ENETC_REV_4_6:
 		devfn = PCI_DEVFN(0, 1);
 		break;
 	default:
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
index 8e6a9d366d40..e0648f5a0ee3 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
@@ -415,6 +415,7 @@ enum enetc_bdr_type {TX, RX};
 #define ENETC_REV_4_1		0X0401
 #define ENETC_REV_4_3		0x0403
 #define ENETC_REV_4_4		0x0404
+#define ENETC_REV_4_6		0x0406
 
 #define ENETC_G_EIPBRR1		0x0bfc
 #define ENETC_G_EPFBLPR(n)	(0xd00 + 4 * (n))
@@ -1049,6 +1050,7 @@ struct enetc_cbd {
 	u8 status_flags;
 };
 
+#define ENETC_CLK_133M		133000000ULL
 #define ENETC_CLK_333M		333000000ULL
 #define ENETC_CLK_400M		400000000ULL
 #define ENETC_CLK_500M		500000000ULL
-- 
2.43.0

