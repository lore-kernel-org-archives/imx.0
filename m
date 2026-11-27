Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795773025;
	b=dDGrsVO3pu3oOvkQ8I6yGVGdIyi29BU7edwB76C2vSzAMbj2cgGUpWi/gmkUHVH/QEnJ
	 ZEFUeh0hMkVHFyQBz9B7eykAZLHY0ztU4NSNw/n9DbHKF80oBZSO2TglwYVUtAPQV5/JW
	 2YGf2Lg2tTrxdwncwcMGkxNDFFuO7BoCFibUNixgMh5Box9SG8qRlomqhqLGlYQKMuoO3
	 wRdr2nytq5FNQZn3FZfVwMk8n3uOXx/QlGp0qRaF6GcOOG3a/8djcWyLMtJicK3IjpHRv
	 1eb58TYoQibzJH6LPdHVEB4ZXBykjdgsQcaHxqMWhJHSyorM3EajlKCEI5jEO/PCiCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773025;
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
	bh=vbFLkaDdcSZBAqv1lkbbH+PFA8bM3sHrPfQlrMrZrUs=;
	b=3O8A5BRyuu1Jaqu4CXMzQQFJPztkqAuMD05iLA3r/KTjlHTfnGfVZBfqKK8umNYUW8U3
	 tId75p4Jl8cDXjskbNaZ/9v/YvfjaSTqenWzoZdUWn+Fd7Y0UFGYvJVk6H2l1YxpYU/UF
	 u6cGaZJccaJUjRhbnvO7HVcAikh9ZcnlSZc7H3FJdJVeNKYDUhfPNLgMeFEBC8/HdF+Bf
	 sCY3ic5BXfjaNCNoWrSsNPzqBtTBVLWNJNK7P4Nk+XOIVlDEkB6cOFjItvbdJ+OKjZ74V
	 bRTnXoz6kkYiDpYHBbGwXqa6AlaCb38x8uwlgCvH/x35vl/YRVRHc/iwZIDwEPejbKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NkA9kvox;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.58
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013058.outbound.protection.outlook.com [40.107.162.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0385B606A68C
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0385B606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NkA9kvox
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8JKWB0xW56utyjdMabj7+lwucfqXI5snP97OZf4NYdy0iGbXC7JLhOn/QdTRYOCFBQ20C25PwJlHj/fXGRztvZJMNvC/djKBpV9mvAYL8tD4Ruc85wRqRNCrB2mZLF9zfqnIM8lUpw5dK8LPCzi4Y3FCm5D4yFbSQB4JmOdrCi5x9Z3h2BULarN7Asm1xuUvNzQ0dRSBOJstoaYahF6BDtihARVdH3g4o1oJui9hffMe/R68b5QBupSuVq5dzjHOg7/07SZ96R9T/YeD1k+BOiD9Y29rs96D+Aq/o1nxzvv6VqBVtqSPqFjC37bKMhN2msyjKICrZo+kSHbLtzpew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbFLkaDdcSZBAqv1lkbbH+PFA8bM3sHrPfQlrMrZrUs=;
 b=E2eijmpz653Wjb8HJ6iZqMREsGoqPIVj2klWVZoGc6nTUZW5ubeoz0iu1kkdxAW9wPE0Jw9dBEBs/8L+m7DMHvnBdx91SrxP+V8osn6i8/sfJnOpaDQIM/uS5FbbezHOOYzWasXC5YTuuKDmrs/ImFkhSW5UJapnL4+SwgY5tzV2OuHpJ4Eu/XmU6cGmGvrQnfvN51d+w9Yb5AoejcFTQZxTJbTcsrEDT5SuC/HgSSaOdiJ01cepmNys54Fuiww/GAMEfGVB5qDrzxuqgQxn+seePnkGgTYl+1rs+yuqFnd1NtUoqO7Iudd5/ADenKsZwsJHYkysY6KboqgGBnTrIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbFLkaDdcSZBAqv1lkbbH+PFA8bM3sHrPfQlrMrZrUs=;
 b=NkA9kvoxp1X+Zz+D5htBZhZBRXtXzcv+lmuO5xlOsmrkMkYA1TDXZMFW7CzPpSZjDyu6lH+e0ptUqQkjn544ydB2Ji4AKKZZsd7iXK/m4GOdsqu46vOIvsnV9we7xKGvuySYGkziQZ8I3R0Rz9OsXbhJgGXlKbnvA2F1F1If9YeuLL+o1qNZzswgy3TSO0LgcBbnpvMgIdP+Ve1X6xUAnBH5y1Yc9h8fGhMDdvfFPbSmf2iRTqs32HUYFjrZx97U233Q/K7yeHSP+HzoF78pEhJTKwZCjj3974fZIqGkVaAhzshbtab/ka127aP6HPQD/1rqcobojuQrLGKylLmW+Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com (2603:10a6:2d0::cd)
 by GV2PR04MB586427.eurprd04.prod.outlook.com (2603:10a6:150:606::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:50:21 +0000
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd]) by BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd%7]) with mapi id 15.21.0639.012; Fri, 27 Nov 2026
 09:50:20 +0000
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
Subject: [PATCH net-next V2 7/7] ptp: netc: use 133MHz as the default reference clock rate for i.MX952
Date: Fri, 27 Nov 2026 17:47:29 +0800
Message-ID: <20261127094729.1061755-8-xiaoning.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
References: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::23) To BR2PPF9D47B45B4.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 9d231e1e-9c17-474f-932f-08df4c6bd9c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|376014|23010399003|1800799024|11063799006|261009223027099003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	o+/O2VP4blaAm/i/+f9f402VHkUpigH22VZESQWl1tUXIXAn25NFoYY0FE4WWbnlfQALo0f69uJ7O7957JQ32l8+fXJ9DJabmTDmmLs2gYZFSVMPnrpGEFbiGdeOWtp+RUAbN0DrzAgISeTa3fBOimsBEl201riCkiA6lWXJQoVeSA4lQT8+N/SU1aJQVtNAK+93snGitrK53Gcr/4++OomC9h+dRd3fT8jNiRoS2tSaIzStnqMrBHxKmOftiT+T8QMo6YVy720J94e8D0/Gs7rn37E/wZnxfdvHWqqDJLKXaqlQXOxV1CH5zWsuneVjZWSA7Gg9HLwx5dX6g9Ds0v6T4LHaQjJuUD+EkYgt6y2DDUDDCFsH28UEpqHJAMXwXbTuTGm1r5bujnY2UkThhKB8osyuHHB3EvH87mtSqiH14zsBtoRVGloO3X/0+ZNpuOzBrchqYujGLIXWMWB/60icafyntZaXDoqxLyXBgI+BH/uJ6b9wKv2DBc7f7IEZ4DtW+ADLgo5esEHWMJK4W+AKCKubkGNa2z+4f88KU2gbM9FmjkrtNea9l7G2h2Ti88c/ZxWs52MwdJSsrW7LPnaNHkHflFOach5TmanyMo07Wfte7z+UGASYP27cYTnKzQXRXQFr0n2wKLXqE9Qiae4wpvSaDFNBC+LpXfQauss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BR2PPF9D47B45B4.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(23010399003)(1800799024)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DfG7Di+I/QEp+4KSpo7CUSWBeEXTF8f7W6Rms6ifwonagJ/+4Pmr5oJYLBxZ?=
 =?us-ascii?Q?cZLipJT5knbsdO4gjPkhbUPcgoJMW/lAPGnvbxpFq6e65Bsu+17RAi1+pjGv?=
 =?us-ascii?Q?9EvB+THRNvOaemfyqJv4sC7Nu/LPLbvl7o4TevERDIIE9m/zdMIr+/206EJq?=
 =?us-ascii?Q?ZkLZXUt44T19PoRQ7fLSXbuFOQRjyl8dUHPotBAcx1jIdfy1PHK4Bl+XfMrr?=
 =?us-ascii?Q?or/CJ8FNWQ6lgf9jBqAX7ALMaSxuDr5zDLPYg5DuWcUzKeg/hNHVQqMS8Psz?=
 =?us-ascii?Q?xiqnvsHKLZ3wVhH7Z8dMEGD2Bn5ARn1OL0qqfZMFcQ3I9dcACjOvZuZbehrf?=
 =?us-ascii?Q?aEn+PnBdU9h76B/ICzOcWz7GSCgyPyphtUka7wAX4tpzhQE0N9EvYbUpehez?=
 =?us-ascii?Q?RjO28GJ8d7kSOVIom6Obuw8twLINw2eCt/MQS5MgrcOig8QBFsfd83wtuOk3?=
 =?us-ascii?Q?ep3v7WNFCQFYoY5CiBRGzx3c+mX6tNzvY1GFyQnMufboPCuWv0EmFit6HRFj?=
 =?us-ascii?Q?lEOX9UdzMzQY57lwOqN57VPWQY++joVu1sqiML/zst/MAGzbVdhuDLD3hZXY?=
 =?us-ascii?Q?qNCwHGpVW8hiEBWXxuk4dg7DeXA3qSacFGJbTIdJzL/efz08v5tv269azba4?=
 =?us-ascii?Q?edVsqkJqQlXH4PIuxZkOuyD6+nCdBHXTw1VlTROdDemNK2eCjN2giV09Z61e?=
 =?us-ascii?Q?8IMfq4EPuX7snrms+TB5zhmkNGo38NwfEpViIgOVMTQVpCPHrT0M4UCjFkJU?=
 =?us-ascii?Q?hJ9JbjXxebC4+cIN3bggd9Ey8uGUqNt0ylpMLeWVaYp5EbHf81tSm1DSOeHF?=
 =?us-ascii?Q?FyLS0cI7bLfC7XLU2XtoHwwE8L/UIWOTA7NvNIJ2HWB4I837Nc0M6Nh6Ogvv?=
 =?us-ascii?Q?M2lVPg3iLj1yUKQq8DA/vQh/GkG+b71I3VU2qblIpsuj0+OEsDBtd8ErUGRK?=
 =?us-ascii?Q?hlrahMVc57FWq0/0oEZMwqSxh6QJvr2xymX4CZaguQzBGBqOfTcCg6pPDRhS?=
 =?us-ascii?Q?zc/QvlzDIXt4MGjxbnfgxSv17gMZvUBcD1Aeq8+EEMMB44OAKpV9JeDvUlxy?=
 =?us-ascii?Q?5RoKVRjo8dQR5t+ww33BKr5Rg+smGoGvKGInbgxiekFBsiN3T5hbiu/mBAz2?=
 =?us-ascii?Q?I1XjyNgAyEOOzBjDNMp/4YAogLd9BW9PjzwbMLPE0+vcFgdPsTQI8j+JAJ/K?=
 =?us-ascii?Q?4XfbFX49w0qY9bJdcj73/h9Fy50wpRIuY2tqWrZhqHpjacmNU4YBgtX1+L7d?=
 =?us-ascii?Q?4nRn8LEVF2yw69XTN0CDC7LpIwd/Ea+nYbeeMRUg9MEOlfM8EvDTN0Jj8+IL?=
 =?us-ascii?Q?dwQ3QYQ17yErfQ4Y+00xCBSyWGBhcgUqhL/0qjtGE0IHgMglH6ST9IMUaVdU?=
 =?us-ascii?Q?Gxn5cD/x/Mhf1jQUJDVO8DbJ0xyJVzboEQdzbiBo1k+u6hWvt9ezOlfSK4bR?=
 =?us-ascii?Q?ozCa82GCI6xGoiyZeS+zl2kyt1uYAJXWCoz8iC//aupRgzrZbVBQQ3xXu8SU?=
 =?us-ascii?Q?GxFTV1xDtHZWU4qMNpUwTO4pKNjyhaQEMA4wJwIt9TjipHqmRR01y2k7eWfD?=
 =?us-ascii?Q?oIzp2A0kZ7ghUuL0Is9G2ZwW2iTWPwr0P12P9/37ytNznw4gG3iRb1NtkCUE?=
 =?us-ascii?Q?00PZO3qYDSBVsEcXb0bq6xJRpzZ9/5vpqYvpJW8YdjaeHhEqhQj4FRuSUt2c?=
 =?us-ascii?Q?RWlGQCckRi21S0HpySqDwr6WZytL9c17LfabqvjKk7y9kRo3Rjaj5rrtleah?=
 =?us-ascii?Q?+g4SqLprjkpli/xtzeoxzzpZ9hHBsr3IGmFMDuawh9k2S5kxMrOsHHcpEdOt?=
X-MS-Exchange-AntiSpam-MessageData-1: sTVK8mHG2wCs6A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d231e1e-9c17-474f-932f-08df4c6bd9c2
X-MS-Exchange-CrossTenant-AuthSource: BR2PPF9D47B45B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:50:20.9432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ww3/v4hMfk8cOGenUCvc4Ox45nrW6SIVtj0oyb9JjkLaBxtQ433ZIsAJOwqfxH0Qbml4mTHSbCNw7ZjShTDNaN3FHFZM/3FcwG5YEtfRkYLEn61gSlZxrMmakX3+WjiH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB586427

From: Clark Wang <xiaoning.wang@nxp.com>

If the 'clocks' property is not present in the DT node, the NETC system
clock is selected as the reference clock of the NETC Timer, and the
driver assumes that its rate is 333MHz. However, the NETC system clock
of i.MX952 (NETC v4.6) is 133MHz. Therefore, use 133MHz as the default
reference clock rate for i.MX952.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/ptp/ptp_netc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
index 1a327a7561e3..1c542cab4a7d 100644
--- a/drivers/ptp/ptp_netc.c
+++ b/drivers/ptp/ptp_netc.c
@@ -72,6 +72,7 @@
 #define NETC_GLOBAL_IPBRR0		0xbf8
 #define  IPBRR0_IP_REV			GENMASK(15, 0)
 #define NETC_REV_4_1			0x0401
+#define NETC_REV_4_6			0x0406
 
 #define NETC_TMR_FIPER_NUM		3
 #define NETC_TMR_INVALID_CHANNEL	NETC_TMR_FIPER_NUM
@@ -87,6 +88,7 @@
 #define NETC_TMR_SYSTEM_CLK		1 /* enet_clk_root/2, from CCM */
 #define NETC_TMR_EXT_OSC		2 /* tmr_1588_clk, from IO pins */
 
+#define NETC_TMR_SYSCLK_133M		133333333U
 #define NETC_TMR_SYSCLK_333M		333333333U
 
 enum netc_pp_type {
@@ -858,7 +860,10 @@ static int netc_timer_get_reference_clk_source(struct netc_timer *priv)
 
 	/* Select NETC system clock as the reference clock by default */
 	priv->clk_select = NETC_TMR_SYSTEM_CLK;
-	priv->clk_freq = NETC_TMR_SYSCLK_333M;
+	if (priv->revision == NETC_REV_4_6)
+		priv->clk_freq = NETC_TMR_SYSCLK_133M;
+	else
+		priv->clk_freq = NETC_TMR_SYSCLK_333M;
 
 	/* Update the clock source of the reference clock if the clock
 	 * is specified in DT node.
-- 
2.43.0

