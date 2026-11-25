Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795627121;
	b=famjXpfCl33qlOOgO+5wJNdCDXyr/KGNx0XJ6ynEXf+Uy0raGaWMB5RfKvBu3N8tPg4v
	 PV8lXrY5DeX0LOYahho8XUqISm+jM0ywY0JqF7J+II5/JT2M9VFnxNDQ9Hf0iyDTB5WFn
	 JV9EOO1VqCm9Kf9l2PNXdVEVOefhmBEeAnvEmq3HtjIebTKbYcW9mBi6liW5oXWq2xEuQ
	 XTPPLquJiIVW/a5JT8Cj8RcYykKGhQO1qwMTSN4N4CL1XT4UQDetFGd6BqmGYg5tTdrSa
	 xh0vCO3nXX+CxityRcE+5FQwmoau+V3kCXy+r4wBDXitZeM6RTAode3rFGhyICtePOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627121;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hly93lmNZfexjbteZG9TDJP/ARRVObOpQMxdBeZg85U=;
	b=rQTZ5XsIk6wbVRa4YxyZ+ssCpQRZWo4POGn1QihhhKrLcJC8oLoy799hUYcFibTZxmD6
	 lNOu5k6ta0S9EewcYilyJNYexHhTB3ictY/sB90ult7jNEtGVwkdhyQruz9kQpwVNjuyu
	 DWPUn7S+vB2o4ctcP4rWsQCSkUAurvDiVD3ArtRX5Jv5cXLWBhvT8jWeEa17xJflM1kHX
	 rzdG9n+0yewO3/u4Jv/N1OrcmA0hUriJ/8D1GxJU7zSGPK3VBTTZaaGA9AEbNDDNhRpeQ
	 dpB1LAwlWWFrkXm3fAWtLjXAzs49jR8ACrOdvNM/Bdewq46c+iB7bWBYv+CeYG1DOwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hHic7WOD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.8
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AAE606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AAE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hHic7WOD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2KI59qMdtG2hSrwfpGj06/C/FDs2G57DXe+lx8sDvue7C9FrXAAYHvhtaozH91rPUMQ5xYwW42gQwWCSdSCqmF+s8TNUlmcVddz8JW+xbYH/lBsU6XiSJ1sLdCGXpgl2Pnh2dF4p0W3aQaS1qHjthan+dZcc33gs6MLWvZ719Ngu5oAuxRk2gCLyihwMMFdCWsrs7Em+r2WAbUwmOyOwkYoKRYxZwFIyRhe1Kicc2nFkGGUs46qjnSSJj8p/yytm/tph3EUjYj14T71Gad5IQaV7fwE/R1PxloqmJo8iUZT2cE4tqKWThi5mWoJ8vNmEUqNASxr7lgpa2LXtzPv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hly93lmNZfexjbteZG9TDJP/ARRVObOpQMxdBeZg85U=;
 b=RRRO9D5x8SXKB/yC10jorw+XJ/RDMb0k7WeCkPU+I3r1QIuOhVOsBCC/N4z1S5ThXe3td5kRVJgdi70TOkKQSh83lsFxQWa5B+5GTqJInnYVi2OeDjwgn0KudDCZzb9Z1b/VZu3l6KmvEHyhyVfkfy8pWEGrsREj3cxcrI8YSPADKAcZzkMttzFi85lqoSxakLoSFzKCWojzeoMoPZeLIiJpydfM5eiG3cRCZoyq3YnFyYONMUb27XJosa1oI8mc+L8R5VVjlbfQk2GGwWhGvMCp9lI9WjLRy68KakXuEJyVQJMzP7uMjWg+x8gb6r3F1gEkP/P2ZGZtFZ38v8yhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hly93lmNZfexjbteZG9TDJP/ARRVObOpQMxdBeZg85U=;
 b=hHic7WODswUVh0QI+GJ2snCc8LM3Ld0cXnuH7aA5V3F+pEnMpdDSM2VHpHAMstSUHJLZSSNIOWDo38vuXV0iIInreflKLF28RaXJlbG9NMeNlLSdiSadjPdjMSRcDe9QqGYGCt5W3y5NT38Rploy5T+oiERoXr3clBeXfr91rDQrQKOcwbvf2+HJ6oittexE2BGvhfmn4xZM1pGCxrhiQF4LkIDDyusFLx1Z3w0zhaGJv/EBSZz1hq2zCXQRuDLQBf5k29MfDgn96cBiNN1e8gaTX29GkFU61RU8gw60Usorw3SgtCNR9qhbFG4id9IVTlHXKOKyvAbM90VobZ3xLg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA9PR04MB186684.eurprd04.prod.outlook.com (2603:10a6:250:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 17:18:37 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:18:37 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	jaidevshastri@vt.edu,
	ustc.gu@gmail.com,
	vulab@iscas.ac.cn
Subject: [GIT PULL] drivers: imx: updates for v7.5
Date: Wed, 25 Nov 2026 12:18:29 -0500
Message-ID: <20261125171832.3067690-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CPAP307CA0011.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::8)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA9PR04MB186684:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ae4465-e4a3-404a-c61e-08df4b18245b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|18002099003|3023799007|56012099006|11063799006|261028144727099003|261022105027099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	eBzarFRSuok+bJ79lx2n4Cjj6RaplQouvReKp4qdCVrfb8cwOreLSCr4dfIhkK+TAZY0oPtKluW4oxnALgUeUhgiluDnKfm4BTpZcAMuQR/Jy7Mc+Kh4yWstgjoxsvN1m9Wk3po5EWvnqqRggKxfwUfhtwzATh9gjmyn2WFcK+NyaFFGrPHFJyC+VydgcKoyodzvOHa2JsPLQ93XdzGAoL/FvkJYf+/q7CSAsn2VYapxHlRF4bK/gTsHGqJBG1upd69/6oEPo7Dm3kkXcJAN04WaRS/L3AAI0nqnA7hMPyIKT3Id6jBvQXiqOrktUuoFacdEcS3Au2g90zxgY0icuEGLvKDSC9YRGUBfJO3wTerSM2gRIRc03ZYhhN/9v7gGA9IIbrPCRbNmu1U3KI0+amCIgQ7D78zgwqs5wApE6ZWIEvWVcGIQxnF4p1DOFlvJfswhUAI/l9yOkpGVoiSjjes7gNdGm73dGWNfFtL+Mtxw1fjNRrJzNHbDq6d0USTlLmsCGTvoppQ73QH7zbNRFSjDJZf59Cd40mZjkjwcTgSKhq7XXspHlZpZuj8mkI9NsQdXo3afpQ4TuAgxhdci/l+odj6c29Ye+yHYKxwCfj0xn5PwC4/TCuoyqFXGuytl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(18002099003)(3023799007)(56012099006)(11063799006)(261028144727099003)(261022105027099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nMNHzRUXODMf+ENhDzbfvPOxgXOlbGOiwPQnCEKFcf0021DdxcD7bxKuQXPq?=
 =?us-ascii?Q?/E64+tLPUkzuPno3PYlvordfch84tEyIhYrTY4qd/P2IOhjGx/xut/Y731zV?=
 =?us-ascii?Q?OH7WKfzMoTIjHArO2XOgoXd0ttwiIEWRguH1SB/pOtIZkcSMEGY9bfYHZLvf?=
 =?us-ascii?Q?CTfQuOOmujZidyp53MUxScZ7+wDcvQKlYBSmvudBk2yOVK5zok9CPdBoFQjE?=
 =?us-ascii?Q?kuH7j5GN1XEbHLD63dP0rbvNZtgkHo2hb7l4uitcN0vzhfDbxyrMX84MAouS?=
 =?us-ascii?Q?skavd0nXc4Rco9yUuo56jHtg60AblN0iQtOUgQZYGcFrsF3yfbCHLiVqViAD?=
 =?us-ascii?Q?CE8QYPgOvYEnNoy/BGklWU13gsqgZU4BLgutRxewAhKtL5xKgU4UimCtY765?=
 =?us-ascii?Q?9mbwbb/a+FXU1pTDInFTxBhe77yaOQCFisVd8A16rP9JbnCoNaLSUzHUlX85?=
 =?us-ascii?Q?icnO3tQYirOGzxSz1nVnY0sKlsDgHIqH9K8v0onzA09z8NlKysF5OxW4ISGJ?=
 =?us-ascii?Q?mie4pey3/Oahg7LOXjxuqrNtIhXHABEdHON1Q8GDuWW21I+qhtE5t/zAVORa?=
 =?us-ascii?Q?3eRYkhhbdwpCf1VB9c0BUJKR2NQEnY6z4xEZ6EsqIz9irHPNMdGSQGHrFXlf?=
 =?us-ascii?Q?EhlCCAndGQ+QktsIhR+0C/XvCbvX7v6DxLkKlzRwcNIgpQGT8C+eIlszm2eP?=
 =?us-ascii?Q?/30HHumggtSWMWtB6NPjs6RS2G2WIPBEuaHVPjuOGAaXpwHSmbPkFy1u9nBA?=
 =?us-ascii?Q?C6+9hPZQIn9BsXi9Ev1lDEdJ8j6tp2cyTie1BV27yjwL8m5v/xHgxSV1Y1xy?=
 =?us-ascii?Q?B18OwZRdOlN9P8u6JLbMxpsEp4t0MJGESVCxjGMHz761RsjAbEMFd+n/aM9m?=
 =?us-ascii?Q?AqUvy4UPC/mLbdDl1fbZRsBa896al4/OqYAuFOZYz9PzS9CmaeK8SLMQsMqq?=
 =?us-ascii?Q?V6fXd5t3RH59PTleYCahU/KJu38g4/q+u2pZ2ynPoXV1IIpLR7d8hajgHI2b?=
 =?us-ascii?Q?jJySwcE73W8GGjo6A42EjK5ugAlZ1xS+InwuJt14paiSjpCo/iTFyQxwRX8t?=
 =?us-ascii?Q?QhynH1srJdridBfw2qTpaQvArpeNapigo1aeBSVG5BLs+pyhTALsJWDJ7XCA?=
 =?us-ascii?Q?W1SBk9Jq6OGOJhOPHR60i36RToAk/tD9KQfddfL0lQNjgn7091DFREu9fNs0?=
 =?us-ascii?Q?wOCgxY9tEaY2rm6SxprL67XwZXUvTBIf9JpIkWmJESL+GhWHWQzbPcSdlb/S?=
 =?us-ascii?Q?zNYkBNZAMhnraMMXvapXagkhhkhIsM8ni5jcusi0+WnApSNHXVo9AGmZIMTL?=
 =?us-ascii?Q?1HHEf6sZ6hGDeudHLj1n9XPUqqP6/5QSHRKN9EBrU30wRB8KEMDCb9kKjfaA?=
 =?us-ascii?Q?GmYp2yEodETK7iBj0wr0cCRcGR4i2w5x6keZMyfWMKN1KYXn0a6SnDilFRXQ?=
 =?us-ascii?Q?rgFwei/ol0cZB5IwUF/FbsW2yUKTBYjMi+zzvYmqa3zCVUVi0o0IDivAbvix?=
 =?us-ascii?Q?sADgA9/vKr5Oc67ALgQbLLgWUMCaqmNMokNjM1XEoIrypuJqM7HU5qAwf/sn?=
 =?us-ascii?Q?EYkCI7/LCM7FhRzoabjPgWswyf/PYRN0txHstR+PGLXDI7lvAmod6tWGmMpT?=
 =?us-ascii?Q?WbsKupzRhVBy02yd4qD6ikSuywuyugODFAppHwMUJrkHb7xWawSjT26aIMEf?=
 =?us-ascii?Q?gMA+tqorOhREX89UWHkGfyKcFX1dNcHXOgIZBmD7L6ofIqD9zlOUVak9H7PL?=
 =?us-ascii?Q?QtQ11OyStZ0YasirkgzDeYP5M3ZCwuSebyouZPkzlwpHEL0n0kJJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ae4465-e4a3-404a-c61e-08df4b18245b
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:18:37.2146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfZuCfolzTzyojGebGvkNZAJBLdUvp+V05dXptXeWBQDHUxrVyakuxK72tADb9CqEziuQkOPqKu/OeS5Z7F3keZ6csBigbqDz7hbM4jKupFSMl5F99l+q5F98D56QqvS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB186684

From: Frank.Li@nxp.com

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-drivers-7.5

for you to fetch changes up to 398d92968e2c35be7788df3885ab6bd885b0b6ab:

  soc: imx8m: unregister the soc and cpufreq devices if action setup fails (2026-11-19 16:19:04 -0500)

----------------------------------------------------------------
drivers: imx: updates for v7.5

Fixes:
- soc: imx8m: unregister the soc and cpufreq devices if action setup fails
- soc: imx8m: fix clock reference leak in imx8m_soc_prepare()
- firmware: imx: sm: publish the protocol handle after the ops pointer
- firmware: imx: scu: publish the SCU IPC handles with release semantics

----------------------------------------------------------------
Felix Gu (1):
      soc: imx8m: fix clock reference leak in imx8m_soc_prepare()

Jaidev Shastri (2):
      firmware: imx: scu: publish the SCU IPC handles with release semantics
      firmware: imx: sm: publish the protocol handle after the ops pointer

Wentao Liang (1):
      soc: imx8m: unregister the soc and cpufreq devices if action setup fails

 drivers/firmware/imx/imx-scu-irq.c | 18 +++++++++++++++---
 drivers/firmware/imx/imx-scu.c     | 14 +++++++++++---
 drivers/firmware/imx/sm-cpu.c      | 24 ++++++++++++++++++------
 drivers/firmware/imx/sm-lmm.c      | 24 ++++++++++++++++++------
 drivers/firmware/imx/sm-misc.c     | 24 ++++++++++++++++++------
 drivers/soc/imx/soc-imx8m.c        |  8 +++++---
 6 files changed, 85 insertions(+), 27 deletions(-)
