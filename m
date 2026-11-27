Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795793676;
	b=lrkKEEMW6CES6JPG8R4qnhH5uPqZf3oQmLqW6YWBys+nrxXVKpOpGM763UxSk/YioN+k
	 C2u/LSo1ooQzcACKJb9D7Eztj6Y3Zl1k9v7GVJQOH9m2OBVhpwGSD4wYxqqlg1Q9q67Mf
	 LXK6HfR8SdApRaHjIcICXJIHBKhyH2cYiMgjdslzt7ZASx9JJYeOMTgs/4BPWRNQJP9ei
	 /i3MEV0CPG/FB/W9j/tC+IMzLyBt9vRT8eYUIM2oWkq/xmt+yuGzMrc8xVpyio/T/h4uj
	 ZGmW3h+/wJL9SbeScPcVaCjXQHYSw8oHpcimcYpbDxqlZVQVsA9toRbgXlEWhOuzZmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793676;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tOB1ruD8pA9QvJnzNH1YsTjJksdwDyO83vOm2vMKKhk=;
	b=pSt6mljmUDrx1z9/g6aowIqeUIJA05xkCst+9jHYUResBoaJ11BCB18znodGIkRPevRg
	 JJKrQOxF3pmafYerGDWtPCCkaP6HoueDmUpjjQs7RC09ZsuQ/+ENkWu4gN9mlIG+X5yuS
	 XKnzQ4MgQRe4M1ScS9X9LS/VTBPS4P5iMh2ACfgyYSxcj6nckC1mluDn7qbTJxIEHEshy
	 RZreRlJbp7mY/B1QSMyNxREfnFh8CiAgLy63I9096HqGWi7usPFabaIF8ILeb0tH0zo+m
	 LpWAxXDg+ca6raKESXMrnZ5w64cDuU73ssD4wfxJ8i/yDecsHng7dMJUtY6e33xhviw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tg4DF7hh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.14
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105C4606A31F
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 15:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 105C4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tg4DF7hh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbSCFSAdusbrxRDdPPHmrNxbZn4bPzegPogruSv/7gAoZuuyyi51fHTx8ruly5/ThsTDaspshm+pIBLFskYerjQKJFgyb9DNZEAD9VOQxgf+6gbCobBPf0b5HQAOGYWnDuWU7tibheiGO5Mt01nZfjEyRtGS7wUrmf6Sv7kvU/thesPt8t8YzlGgu9rPfuVPjkEerHyMLd5JTj7vcA4x8/m92Xb7AgYVn8vwGUyG/5iDhtUJg3PsROBwdCAn7kw8crnvwIos77qf0G0Bqo6QmVH4s9cO9gDaMJEoORzALCyCVYdbL78UClu4VRjMyI8LBoYKbxfO9a1pCdnz2ZwctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOB1ruD8pA9QvJnzNH1YsTjJksdwDyO83vOm2vMKKhk=;
 b=bQaghm21kq5bdOFEI3baYKcair7Gj5Vwd3qWsgxXYBhCfUC//w+P6Wdx9bGEGf2El2zhBJEsZ4ByoW5qIofDHWuyAZZZOZrQpF/JJMEUyP1oqUPzZ45GK3t9Ud2sdkwjiwwgI3luhlPTFJarJpPSVI8q4w5cHMgC/BbBRM+uG6Anwdo0jMfOmSUN5C4ubQxXqYJQw7TJXEWTeJrm+YaBH5CkRNVA7PCGTQme+rxwGC26LMR+oMeO1nLS+00axJw+xpd5RN4NJHCgvtD9SLOM98gkG3Er4CJ002keYQRkkmOGZhlQZ7K6cohV5/EiV8vF1g0/g78ZZKFdLoQH8jLlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOB1ruD8pA9QvJnzNH1YsTjJksdwDyO83vOm2vMKKhk=;
 b=tg4DF7hhLQTuBlVlNdBtzhSurSUOOR2sH7yT457Hh/0bv3+l1JlJt2vZ+z8fJmrLbIvI9Qz6fMdVsipmGx17RC3Gt7SeK+8JRUP2gPmv8LAKKCBNdGeSd3e2U3Q0+TiOftWAqJ9s1rbHkrSLu56mVHCSNTZ54W8819pXr6PG0rcPgk8cYV5ALe7apreQvd+gld1Pa1X+BVagg2QS1b6t6l/NMh1bzhMFYMZRMIfdo2SUQa1LMrz7y+zRswqpXtXBHM5BeV7bjEg4UCEI6kBuKiB92dPJBmsSpNaxyuDiTqebL+c6ba74dQEXHIkVlR56UmP5lNPvL0N8DmzBKIouhw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB651443.eurprd04.prod.outlook.com (2603:10a6:800:367::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 15:34:31 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 15:34:31 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	alice.guo@nxp.com,
	B.Hahn@phytec.de,
	dario.binacchi@amarulasolutions.com,
	ddrake@baylibre.com,
	eberhard.stoll@kontron.de,
	ernest.vanhoecke@toradex.com,
	francesco.dolcini@toradex.com,
	frieder.schrempf@kontron.de,
	jjc@jclark.com,
	kaiwen.zhang@cn.bosch.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	laurentiu.mihalcea@nxp.com,
	leonardo.costa@toradex.com,
	marex@nabladev.com,
	Markus.Niebel@ew.tq-group.com,
	maz@kernel.org,
	peng.fan@nxp.com,
	qijian.guo@nxp.com,
	rhi@pengutronix.de,
	shengjiu.wang@nxp.com,
	sherry.sun@nxp.com,
	stefano.r@variscite.com,
	vjardin@free.fr,
	wahrenst@gmx.net,
	wei.fang@nxp.com,
	y.moog@phytec.de
Subject: [GIT PULL] arm64: dts: freescale: updates for v7.5 part1
Date: Fri, 27 Nov 2026 10:34:15 -0500
Message-ID: <20261127153423.3367187-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CPAP307CA0007.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB651443:EE_
X-MS-Office365-Filtering-Correlation-Id: b7055da1-4040-4107-7de1-08df4c9beea5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|23010399003|366016|11063799006|6133799003|261009223027099003|261009221227099003|18002099003|10067099003|56012099006|261102123227099003|261021135927099003|261021121427099003|261026140227099003|261026121527099003|261021123027099003|261028144727099003|261022105027099003|261022075727099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	cZBvadhRE/RAQoEWeLCYCOFOdlx6Rl5SYjHa24vj29VVBgt3EJhURP5oJ8GOza1vLROAg8qBh4kxlse6HW5k4YiUrfDBEJAuSDFVYbdqamhO9+Ln5PdvWSerXiqOqR2pU5Ss7D8oPyg8IywZ8CqfMrdSaY5ac9tERjHBwErxkENaa01M8T/EsltXY/hbEamCk7XmRR5x/JJG7IxxLl6fdwtfkGW5M/jWKQjGD8aj2XyJc+IofeA4gpvhE41juG0puPoLx7s3N7G0OTdTNWY5I7mPfw+WCNhGpKuf0kDhrZwU/4rw4DLORGodvpL9yFUV+zBZfZSgk2M5pXrdZqwPrf7qfAxrEwnrUAQSfvl+QaMJ7g/6p0HlawHPYjq6k+Sg0fX8bu2pnStfVP7CZ46iQ9/D4Zo3wA5NEz7o8VLGVFCx+1v6N8gkt/mqSYXI9AwSwqUEQpDsDOhPUJFbMoDUMb6n0U0eGwrs1Y+grlnegdLPVQlXvhHg6HAiCwzrL/HB3ykWC+fMFqKiFZbELtcAFh6BFMnCQVjAxfjsYMmFapE1w4VQZVmJ3vq5j23raJUFff0TSSDvLdozXzyjM5NUToZA6q8F8UaBrji7li2E0hSZA4z7jZTpc87ridoAeiGyBWMKxRyHqKPnvv9z34xxPGNXBB8KLgrMpRGVmlSWFQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(23010399003)(366016)(11063799006)(6133799003)(261009223027099003)(261009221227099003)(18002099003)(10067099003)(56012099006)(261102123227099003)(261021135927099003)(261021121427099003)(261026140227099003)(261026121527099003)(261021123027099003)(261028144727099003)(261022105027099003)(261022075727099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pYq4YWPxd89zgy6M2L05l/w3O+OHK4HiHVAsBngm5mAcgRe9U1xqfVocnAXi?=
 =?us-ascii?Q?mUkldfcNv54qb94G1W+3gJ7OjPtM9yeUhV/TZ9gr27BQEAPJgPHafZdiWjJS?=
 =?us-ascii?Q?vQmdQaXVJfD9c+sS4SCQe9nuXlAAwOoa7XeeD9tSMzeMQobuQVp0OdRxDWR6?=
 =?us-ascii?Q?7Rq2nLCrAbwVUFQ43jM1F1ikiShb9lZUYbdi1tKayQS4eGOsOUnU9Wm2pVao?=
 =?us-ascii?Q?oRVmxqREErAIBROzDm2dy4bs9gQvmC7MuM4mRPYxgX6rfNA3g/kg90jUX+yw?=
 =?us-ascii?Q?gngccfaFpQ0JVZazqWSXySz5WRHezDZzAFQzkgWDNkg21oxeUjmgTmr6XrRU?=
 =?us-ascii?Q?AUAXxmi8WOGX0Z0M5Hd7a7jkzDoPJq60TW73/EiSeL4qp2t2kN7wy3+ZGfrD?=
 =?us-ascii?Q?oZkKmQI8O1H1x+OVTHzMhBB9v31PkgVO0IaqKogWORRHeJIwXOouM7ul81zN?=
 =?us-ascii?Q?i5QRvNDDOUo7et7LcRq8DfzUqARvBZani5jNdoF/4FhCkwJoS0U8TuEdqiDI?=
 =?us-ascii?Q?XJBF7tUJOUABEJmspCyEdnE3jZ7S72NXx3hHEJKUeo4rSpNxkRacUwqYY/1E?=
 =?us-ascii?Q?PXUy+7oDldcZWkrPRV3IdlTl1FCqin2+eIx8kbsGLmMUpVo6D9Snq+67XWHT?=
 =?us-ascii?Q?HjND/Qi+JSo/odX4PB24CS1hsnpHhYCJpk0liMRLICgriIJTHGhODnqhwWsh?=
 =?us-ascii?Q?DITdxP7La+qXtfp7Lf6GLKsZ6hCx17/T7hGrm+7hAf9YBC+FHxmauT/qw6Q+?=
 =?us-ascii?Q?TP0WDPwrUIx4/tH+cyomBCGqWDU4hxKyXwwW6b9r2FNgiT4yHSERryaU/w/u?=
 =?us-ascii?Q?SLU+SHaMNtDfwcDaErLq9d9W67fEAQkAYSGoG4oA3vNxDkVVWfTIdYviebWR?=
 =?us-ascii?Q?GIzGvN3mLs5hcHXTt1PYW6Fp+i2nRWU+5R3S/kMPssQc4uXLX+M0oU4Ul5Qa?=
 =?us-ascii?Q?DCE1kjZyHiU/xxJEtTqIfsvWvFrrzfJCZLT7OzyBscBu4s7Tb9JsRPXvLOyc?=
 =?us-ascii?Q?h54r1DPhl1y3l9fP0XxtGly20TVItet/Xu1E87Ey/li2esfvAhgmsLb/4jTM?=
 =?us-ascii?Q?wwLmYge1p2Qat+QeX0W/6XqsUdV3QSptQ6Y7f8tPEr6tqqSz6gAQeyueRk5C?=
 =?us-ascii?Q?mYYuLpTy0ZhIo3vaBgW6hGlq6IOv4GidY42kLiVHDZrGBAUYZXyXs1PfxkWs?=
 =?us-ascii?Q?Tn8iILA3R3b/U1AQXTebc2u/fS7sqm7iIG8g9EMA4auAMvdpPCBf6ttXdmzn?=
 =?us-ascii?Q?9e/FB6wrWMYsDdwX0hZESSf2jAiQcKptqZMPLtN1+lLj1RS0Xr+H7tvPnQLC?=
 =?us-ascii?Q?VNzEF+a5Cu0Q2schDhRlpSMZSjl3fmj9mT1tLe4e0ZvimLNjpXgTfQIubDqZ?=
 =?us-ascii?Q?8rlxNfhAY2liu+GZq7WN2yJCYJnrn7CKnVb2sGajVvPT4KtwNCrIgXI3d4If?=
 =?us-ascii?Q?mqgQLtXQ/SpJdQHTzrlLmSpZZ1Y/VZnjA2Che1YLMUK0YBqLZIV0Pk+vb2Kw?=
 =?us-ascii?Q?Zy6Gf2KUcCkMJ4GiAiaF7tQ52B5BUeQKf1PEV/Qb7L/hkyVh5wiJGhgOy/uF?=
 =?us-ascii?Q?DuVDAWeS+Lw1ZljDf0rexTF4UI+0+bROS4uEzPqIwE0K+t0wKRv+KYIp/IJR?=
 =?us-ascii?Q?Mm3/+gmvhZAR7rPWs9Whz0gc61Z8Mtc6uJU6SiHyotswMNEpl2e6qujClpPP?=
 =?us-ascii?Q?fZSaBDUeXAXXJvINMmPkliPuqw8wyd1UkG6OrIqrxdAPZRHN24LK3TJx4VVh?=
 =?us-ascii?Q?pLrBzCvgD1FZn/4jThLdJHKQ6Z2+j5m/9KvGaaiX6irK8phA81r6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7055da1-4040-4107-7de1-08df4c9beea5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:34:31.8567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpxHKyOOQyPGew6BtaOuRuk+ItoDuhd3CK8kb7W37j2phcRjT04tlmvZlmOunNluLm1VuIhebPNvkBf2wUbzck7isNho2YDOqSskB2pkmKnGJhzyjhNQMwXKjdFquSSp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB651443

From: Frank.Li@nxp.com

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt64-7.5-part1

for you to fetch changes up to 703836f46e57f515e81fd6da4dfa1f1cb0563d76:

  arm64: dts: imx8mp-icore: add Engicam C.TOUCH 2.0 LVDS display overlay (2026-11-25 10:23:01 -0500)

----------------------------------------------------------------
arm64: dts: freescale: updates for v7.5 part1

New board support:
- Add Engicam i.Core MX8M Plus FE SoM and C.TOUCH 2.0 board with LVDS
  overlay, Variscite VAR-SMARC-MX8M-PLUS and Echo carrier board, Data
  Module i.MX95 eDM SBC, chargebyte Charge Control Y and Aquila iMX95 with
  Lotus Carrier Board

i.MX8QM:
- Re-enable A72 cluster on i.MX8QM MEK after ERR050104 workaround

SPI aliases:
- Add SPI aliases on i.MX95 (Aquila, Verdin, Toradex SMARC/OSM),
  i.MX93/i.MX91 (Toradex OSM/Lino), i.MX8M Plus (Verdin, Toradex SMARC),
  i.MX8M Mini (Verdin), i.MX8 (Apalis), i.MX8X (Colibri)

Audio updates:
- Add DMIC codec to replace dummy codec for micfil on i.MX95-19x19-FRDM-Pro,
  i.MX95-19x19-EVK, i.MX95-15x15-EVK, i.MX943-EVK, i.MX93-9x9-QSB,
  i.MX93-11x11-EVK, i.MX91-11x11-EVK
- Add NAU8822 Bridge Tied Load overlay on i.MX9{1,3} Lino, i.MX95 Verdin,
  i.MX8 Apalis, i.MX8M Plus/Mini Verdin
- Add AONMIX MQS support on i.MX952 FRDM
- Enable WM8904 DMIC input on i.MX8M Mini VAR-SOM and VAR-DART

Cortex-M7 remoteproc overlays:
- Add Cortex-M7 remoteproc on i.MX8M Plus Verdin
- Add Cortex-M7 UART_4 overlay on i.MX95 (Aquila, Verdin), i.MX8M Plus/Mini
  Verdin
- Add Cortex-M7 SER0 overlay on i.MX95 Toradex SMARC

Networking:
- Add NETC switch node on i.MX94 and enable it on i.MX943-EVK
- Move Variscite Ethernet LEDs to carrier boards

PCIe updates:
- Move PCIe PERST# and vpcie supply to Root Port nodes on
  i.MX95-19x19-FRDM-Pro
- Move board Root Port children under &pcie0_port0 on i.MX8M Plus and i.MX8M
  Mini Venice
- Fix PCIe PHY init and TPM reset polarity on i.MX8M Mini VAR-DART Sonata

Display:
- Add HDMI support on i.MX93-11x11-FRDM
- Add Toradex Capacitive Touch Display 7" DSI, 10.1" DSI/LVDS/LVDS-V2 and
  DSI-to-HDMI adapter overlays on i.MX8M Plus Toradex SMARC
- Add Toradex DSI-to-LVDS adapter with 10.1" V2 display on i.MX8M Mini
  Verdin
- Rename and share Toradex display overlays on i.MX8M Mini Verdin
- Keep DP_PWR always enabled on i.MX95 Aquila Clover and Dev boards

DT cleanup:
- Cleanup some W1 warning: Remove unnecessary #address-cells and #size-cells
  across multiple platforms Rename soc to soc@0 on i.MX952. Rename
  bus@4c100000 to hsio-bus on i.MX95. Add @addr for *-bus node on S32N79
- Correct white-space style

Boot phase / U-Boot:
- Add U-Boot bootph properties on i.MX91, i.MX95-19x19-FRDM-Pro

Fixes:
- Fix gpio clocks on i.MX952, i.MX95, i.MX93, i.MX8ULP
- Add clocks for gpio controller on i.MX94
- Fix GPIO labels on i.MX93/i.MX8M Mini/i.MX8M Plus Kontron boards
- Fix I2C recovery GPIOs as open drain on i.MX91/i.MX93 Variscite
  SOM/Symphony
- Fix USB_A source PDO to 900 mA on Toradex OSM Dev boards
- Fix touchscreen IRQ trigger and product names on i.MX8M Mini VAR-SOM
- Fix vdev buffer reserved memory and i3c2 pinctrl node names on i.MX95
  Aquila/Verdin
- Fix input supply properties on i.MX8M Plus SKOV
- Fix TCA9539 and 1588 line names on LX2160A NBXv3
- Fix gpio-line-names on i.MX8M Plus phyBOARD-Pollux
- Fix i2c3 gpios on i.MX8M Plus phyBOARD-Pollux
- Adjust CPU thermal trip points and backlight PWM on i.MX8M Nano BSH
  SMM-S2/Pro
- Remove pullup from CAN pins on i.MX9{1,3} TQMa boards
- Remove ETH_A PHY interrupt on Toradex OSM Dev boards
- Correct lpuart9 clock on i.MX94
- Add EL2 virtual timer interrupt
- Add GPIO5 lines 18-20 on i.MX952
- Add USB1/USB2 nodes on i.MX95 NAVQ
- Add on-carrier 3.3V regulator on i.MX8M Plus Toradex SMARC
- Pass GPIO_OPEN_DRAIN flag on i2c3 GPIOs on i.MX8M Nano EVK
- Enable I2C bus on Colibri i.MX8X Aster

----------------------------------------------------------------
Alice Guo (1):
      arm64: dts: imx91: add U-Boot bootph properties

Benjamin Hahn (1):
      arm64: dts: imx8mp-phyboard-pollux: update gpio-line-names

Daniel Drake (1):
      arm64: dts: imx93-11x11-frdm: add HDMI support

Dario Binacchi (5):
      arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
      dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
      arm64: dts: imx8mp-icore: support Engicam i.Core MX8M Plus FE SoM
      arm64: dts: imx8mp-icore: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
      arm64: dts: imx8mp-icore: add Engicam C.TOUCH 2.0 LVDS display overlay

Eberhard Stoll (5):
      arm64: dts: imx8mp-kontron: Fix GPIO label assignments
      arm64: dts: imx8mp-kontron: Fix GPIO labels according to OSM spec
      arm64: dts: imx8mp-kontron: Remove obsolete VDD_CARRIER regulator
      arm64: dts: imx8mm-kontron: Fix wrong label for SPI_A_SDI_(IO0) pad
      arm64: dts: imx8mm-kontron: Fix GPIO label for PCIe_SM_ALERT#

Ernest Van Hoecke (16):
      arm64: dts: imx8mm-verdin: Share the UART_4 MCU overlay
      arm64: dts: imx8mp-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: imx95-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: imx95-aquila: Add Cortex-M7 UART_4 overlay
      arm64: dts: imx95-toradex-smarc: Add Cortex-M7 SER0 overlay
      arm64: dts: imx8mm-verdin: Share the NAU8822 BTL overlay
      arm64: dts: imx8mp-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: imx8-apalis: Add NAU8822 Bridge Tied Load
      arm64: dts: imx95-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: imx9{1,3}-lino: Add NAU8822 Bridge Tied Load
      arm64: dts: imx8mp-verdin: Add Cortex-M7 remoteproc
      arm64: dts: imx8mp-toradex-smarc: Add DSI to HDMI adapter overlay
      arm64: dts: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 7" DSI

Francesco Dolcini (26):
      arm64: dts: imx95-verdin: fix i3c2 pinctrl group node name
      arm64: dts: imx95-aquila: fix i3c2 pinctrl group node name
      arm64: dts: imx95-verdin: fix vdev buffer reserved memory node name
      arm64: dts: imx95-toradex-smarc: fix vdev buffer reserved memory node name
      arm64: dts: imx95-aquila: fix vdev buffer reserved memory node name
      arm64: dts: imx95-toradex-osm-dev: Fix USB_A source PDO to 900 mA
      arm64: dts: imx93-imx91-toradex-osm-dev: Fix USB_A source PDO to 900 mA
      arm64: dts: imx95-toradex-osm-dev: Remove ETH_A PHY interrupt
      arm64: dts: imx93-imx91-toradex-osm-dev: Remove ETH_A PHY interrupt
      arm64: dts: colibri-imx8x-aster: Enable I2C bus
      arm64: dts: imx95-aquila: mark +V1.2_DP as boot-on
      arm64: dts: imx952: Add GPIO5 lines 18 to 20
      arm64: dts: imx95-aquila-dev: Keep DP_PWR always enabled
      arm64: dts: imx95-aquila-clover: Keep DP_PWR always enabled
      arm64: dts: imx8mm-verdin: Fix I2C pinctrl group comments
      arm64: dts: imx8mm-verdin: Add SPI alias
      arm64: dts: imx8mp-verdin: Add SPI alias
      arm64: dts: imx95-verdin: Add SPI alias
      arm64: dts: imx8x-colibri: Add SPI alias
      arm64: dts: imx8mp-toradex-smarc: Add SPI aliases
      arm64: dts: imx95-toradex-smarc: Add SPI aliases
      arm64: dts: imx95-aquila: Add SPI aliases
      arm64: dts: imx8-apalis: Add SPI aliases
      arm64: dts: imx93-imx91-lino-common: Add SPI aliases
      arm64: dts: imx93-imx91-toradex-osm-common: Add SPI aliases
      arm64: dts: imx95-toradex-osm: Add SPI aliases

Frank Li (8):
      dt-bindings: display: remove #address-cells and #size-cells off requires
      dt-bindings: embedded-controller: remove #address-cells and #size-cells from required
      arm64: dts: s32n79: add @addr for *-bus node
      arm64: dts: imx8mq: remove #address-cells and #size-cells in dsi@30a00000
      arm64: dts: fsl-lx216x: remove #address-cells and #size-cells from pinctrl node
      arm64: dts: imx: remove unnecessary #address-cells and #size-cells
      arm64: dts: imx95: rename bus@4c100000 to hsio-bus
      arm64: dts: imx952: rename soc to soc@0

Frieder Schrempf (4):
      arm64: dts: imx8mp-kontron: Fix GPIO for DL panel standby signal
      arm64: dts: imx93-kontron: Fix ETH_B_TXD GPIO labels
      arm64: dts: imx93-kontron: Fix UART RTS/CTS pad names
      arm64: dts: imx93-kontron: Fix GPIO labels according to OSM spec

James Clark (1):
      arm64: dts: imx8mp-frdm: Add overlay for EQOS PTP event pins

Joseph Guo (1):
      arm64: dts: imx95-19x19-frdm-pro: add boot phase properties

Kaiwen Zhang (2):
      arm64: dts: imx8mn-bsh-smm-s2/pro: Adjust CPU thermal trip points
      arm64: dts: imx8mn-bsh-smm-s2/pro: Increase backlight PWM frequency

Krzysztof Kozlowski (1):
      arm64: dts: Correct white-space style

Laurentiu Mihalcea (1):
      arm64: dts: imx95-navq: add USB1/USB2 nodes

Leonardo Costa (6):
      dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus board
      arm64: dts: imx95-aquila: Add GPIO pingroups for the Lotus Carrier Board
      arm64: dts: imx95-aquila: Add Lotus Carrier Board
      arm64: dts: imx8mm-verdin: Rename Toradex display overlays
      arm64: dts: imx8mm-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
      arm64: dts: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS V2

Marc Zyngier (1):
      arm64: dts: Add EL2 virtual timer interrupt

Marek Vasut (2):
      dt-bindings: arm: fsl: Document Data Module i.MX95 eDM SBC
      arm64: dts: imx95: Add support for Data Module i.MX95 eDM SBC

Markus Niebel (1):
      arm64: dts: imx9(1|3)-tqma*-mba9(1|3)xxca: remove pullup from CAN pins

Peng Fan (7):
      arm64: dts: imx8qm-mek: Re-enable A72 cluster after ERR050104 workaround
      Revert "arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster"
      arm64: dts: imx8ulp: fix gpio clocks
      arm64: dts: imx93: fix gpio clocks
      arm64: dts: imx95: fix gpio clocks
      arm64: dts: imx952: fix gpio clocks
      arm64: dts: imx94: add clocks for gpio controller

Roland Hieber (1):
      arm64: dts: imx8mp-skov: fix input supply properties

Shengjiu Wang (8):
      arm64: dts: imx952-frdm: support AONMIX MQS
      arm64: dts: imx91-11x11-evk: Add DMIC codec to replace dummy codec for micfil
      arm64: dts: imx93-11x11-evk: Add DMIC codec to replace dummy codec for micfil
      arm64: dts: imx93-9x9-qsb: Add DMIC codec to replace dummy codec for micfil
      arm64: dts: imx943-evk: Add num-channels to DMIC codec node
      arm64: dts: imx95-15x15-evk: Add DMIC codec to replace dummy codec for micfil
      arm64: dts: imx95-19x19-evk: Add DMIC codec to replace dummy codec for micfil
      arm64: dts: imx95-19x19-frdm-pro: Add DMIC codec to replace dummy codec for micfil

Sherry Sun (4):
      arm64: dts: imx8mm-venice: Move board Root Port children under &pcie0_port0
      arm64: dts: imx8mp: Move board Root Port children under &pcie0_port0
      arm64: dts: imx95-19x19-frdm-pro: Move PCIe PERST# and vpcie supply to Root Port nodes
      arm64: dts: imx94: Correct the lpuart9 clock

Stefan Wahren (2):
      dt-bindings: arm: fsl: Add chargebyte Charge Control Y
      arm64: dts: Add chargebyte Charge Control Y

Stefano Radaelli (15):
      arm64: dts: imx8mm-var-som: Use the official product names in model strings
      arm64: dts: imx8mm-var-som: fix touchscreen IRQ trigger
      arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC input
      arm64: dts: imx8mm-var-som: Enable WM8904 DMIC input
      arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag on i2c3 GPIOs
      arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
      arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open drain
      arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
      arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open drain
      arm64: dts: imx8mm-var-dart-sonata: Fix TPM reset polarity
      arm64: dts: imx8mm-var-dart-sonata: Fix PCIe PHY init
      arm64: dts: Move Variscite Ethernet LEDs to carrier boards
      dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
      arm64: dts: Add support for Variscite VAR-SMARC-MX8M-PLUS
      arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board

Vincent Jardin (1):
      arm64: dts: lx2160a-nbxv3: fix the TCA9539 and 1588 line names

Wei Fang (2):
      arm64: dts: imx94: add NETC switch node
      arm64: dts: imx943-evk: enable NETC switch

Yannic Moog (1):
      arm64: dts: imx8mp-phyboard-pollux: fix i2c3 gpios

 Documentation/devicetree/bindings/arm/fsl.yaml     |   16 +
 .../bindings/display/bridge/nwl-dsi.yaml           |    2 -
 .../bindings/embedded-controller/gw,gsc.yaml       |    2 -
 arch/arm64/boot/dts/freescale/Makefile             |  101 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |    4 -
 .../boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi      |   20 +-
 .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |    4 -
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi      |    2 -
 ...v-nau8822-btl.dtso => imx-tdx-nau8822-btl.dtso} |    5 +-
 .../arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso |   14 +
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |    3 +
 .../boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts |    2 +-
 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   |    6 +-
 .../boot/dts/freescale/imx8mm-var-dart-sonata.dts  |    3 +-
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi |    2 +
 .../boot/dts/freescale/imx8mm-var-som-symphony.dts |    4 +-
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |    4 +-
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |   22 +-
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   |   22 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |    2 -
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   18 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |    2 -
 .../boot/dts/freescale/imx8mm-venice-gw7904.dts    |    2 -
 ...dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |    0
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso |  134 +++
 ...8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso} |    0
 ...x8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso} |    0
 .../dts/freescale/imx8mm-verdin-uart4-mcu.dtso     |   14 -
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |    8 +-
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    |    9 +
 .../dts/freescale/imx8mn-bsh-smm-s2-display.dtsi   |    2 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |    4 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |    2 -
 .../boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso   |   26 +
 .../dts/freescale/imx8mp-hummingboard-pulse.dts    |   17 +-
 ...x8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso |   53 +
 .../dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi  |  166 +++
 .../freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts    |   17 +
 .../boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  |   62 ++
 .../boot/dts/freescale/imx8mp-icore-mx8mp.dtsi     |   13 +
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts |   43 +-
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      |   25 +-
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   |   84 +-
 .../boot/dts/freescale/imx8mp-kontron-smarc.dtsi   |   75 +-
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |   13 +-
 .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi |   12 +-
 ...arc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso |  123 +++
 ...marc-adapter-tdx-panel-cap-touch-7inch-dsi.dtso |  124 +++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |    7 +
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          |  103 ++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso |   80 ++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso |   98 ++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   |    2 +
 .../boot/dts/freescale/imx8mp-var-smarc-echo.dts   |  648 ++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi |  640 ++++++++++++
 .../boot/dts/freescale/imx8mp-var-som-symphony.dts |   22 +
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi  |   20 -
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi   |   22 +-
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi   |   22 +-
 .../boot/dts/freescale/imx8mp-venice-gw82xx.dtsi   |   22 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |   36 +-
 arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts  |    2 -
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |    2 -
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |   14 +-
 .../boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts    |   39 +
 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi  |   13 +-
 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi  |    2 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   15 +-
 .../boot/dts/freescale/imx8x-colibri-aster.dtsi    |    5 +
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   |    5 +
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |   10 +
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts      |    2 -
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    |   21 +
 .../boot/dts/freescale/imx91-toradex-osm.dtsi      |    4 +-
 .../dts/freescale/imx91-tqma9131-mba91xxca.dts     |    8 +-
 .../dts/freescale/imx91-tqma9131-mba93xxca.dts     |   16 +-
 .../boot/dts/freescale/imx91-var-dart-sonata.dts   |   22 +
 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi  |   20 -
 .../boot/dts/freescale/imx91-var-som-symphony.dts  |    4 +-
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi   |    4 +-
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |   45 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |   10 +
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |   81 ++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |   10 +
 .../boot/dts/freescale/imx93-charge-control-y.dts  |  437 ++++++++
 .../dts/freescale/imx93-imx91-lino-common.dtsi     |    2 +
 .../freescale/imx93-imx91-toradex-osm-common.dtsi  |    2 +
 .../imx93-imx91-toradex-osm-dev-common.dtsi        |    8 +-
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |   41 +-
 .../boot/dts/freescale/imx93-phycore-som.dtsi      |    4 +-
 .../boot/dts/freescale/imx93-toradex-osm.dtsi      |    4 +-
 .../dts/freescale/imx93-tqma9352-mba91xxca.dts     |    8 +-
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |   16 +-
 .../freescale/imx93-tqma9352-mba93xxla-mini.dts    |   16 +-
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |   16 +-
 .../boot/dts/freescale/imx93-var-som-symphony.dts  |   29 +-
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi   |   23 +-
 arch/arm64/boot/dts/freescale/imx94.dtsi           |   58 +-
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  102 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |   10 +
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   11 +
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    |   37 +-
 .../boot/dts/freescale/imx95-aquila-clover.dts     |    2 +
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |    2 +
 .../boot/dts/freescale/imx95-aquila-lotus.dts      |  365 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    |   72 +-
 .../dts/freescale/imx95-data-modul-edm-sbc.dts     | 1079 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-navq.dts       |  121 +++
 .../boot/dts/freescale/imx95-toradex-osm-dev.dts   |   11 +-
 .../boot/dts/freescale/imx95-toradex-osm.dtsi      |    2 +
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |    8 +-
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |   22 +
 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi  |   20 -
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi    |    9 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   30 +-
 arch/arm64/boot/dts/freescale/imx952-evk.dts       |    4 +-
 arch/arm64/boot/dts/freescale/imx952-frdm.dtsi     |   74 ++
 arch/arm64/boot/dts/freescale/imx952-pinfunc.h     |    6 +
 arch/arm64/boot/dts/freescale/imx952.dtsi          |   38 +-
 arch/arm64/boot/dts/freescale/s32n79.dtsi          |    9 +-
 120 files changed, 5470 insertions(+), 592 deletions(-)
 rename arch/arm64/boot/dts/freescale/{imx8mm-verdin-dev-nau8822-btl.dtso => imx-tdx-nau8822-btl.dtso} (63%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso
 rename arch/arm64/boot/dts/freescale/{imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso => imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} (100%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
 rename arch/arm64/boot/dts/freescale/{imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso => imx8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso} (100%)
 rename arch/arm64/boot/dts/freescale/{imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso => imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso} (100%)
 delete mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-charge-control-y.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dts
