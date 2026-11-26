Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795705658;
	b=Kq1G6bCV2vmD/sTx8gml7OfOE/59A+PDxEdLYG0X9UBd8LNopaTf590FerGd5UVT49Gy
	 rOzF3eRu+srDQMQ8vI638kEhavuyZvf6xz8CeZEWiApby4UJjEkBo4e8jVgRwA11YzRY7
	 qJaNDT5CTDD58bEatfQcuBhJUUBWoUn2sUWAVtTXzXXB/z8TVdE9muQp6xYwmaMbQdBs5
	 Ej9GguwTAFyszMrEcQpw6qk5NifDVzNjxYWIjSZNOCgIZJQmhFwupkEh623NqEeihjxF3
	 NoXdSe5SeEXuPJ07YpFhGtltoDQ0+0HeyRYE4Oh+dEooniJYq+x3mRmmeuJUWB7QV9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705658;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
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
	bh=M7sJGjF9vcMBC1KsVpmVBFZ+kgdeMX9OuHPNL1YNvf0=;
	b=Phs9LDlg71AEPIOQub2zB0ctzKgqCVJRgr8YEr5hVpMXJEhrycffxdTNoW836l0ECLTQ
	 CGUYmW2xEQQpoSx0QG1MbusJX/Cn5H8WgUcjSSgWnR6smD6wc+sRQfp/ahcS4CZt8ibKt
	 C7pmQeHTyeIx9dcYkuaJpNNnDPCPuBL5DCs5Zaeqj/baQSsoy3bcKEipCK7ZjQHf+uWgz
	 8T17/I435MLsV/cquYjcnqDPNqNu2J35uPMnTCc4uIW/kBsLdAI7UN3lFb44LOO7+tRen
	 dbIPOG6GlFU6tlgvBzJmAzwViSWtMxgBGJ1OCiEhejo8Q42OcAffbHRhMEKZVA6vrBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dcsfGFnp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.13
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37307606A32E
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 15:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37307606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dcsfGFnp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZRLbShybXSrj7aV+eNxPZV8tb1Yr9HHDLsL47wCVNh03GnmBI21yix0ZurMEcJ9C/+H81p+jxDt8cNwPvo3i6lLiAKibWKResX37DBAGcVSlZyMNqDSP6AWpXQmDPlixM96sQVb03pMn6dKVEZxoc5arqCbFE/YrF5U5eHhkCuD7UiovdfdeavQf4RPMMjNMQEEOb+B6s9bDx/zxt+YzXWfBpc3YYT54W3mLQbxp7hf0XKfeQPdx9Kh0Zn+/+pAGJ6XJSoAHqmPeKET5ROdJRkLxmFSv22nLR2YzUdHJiR7+h/bQeOwPTCrQ2sOVlJtZ8t9VawYWUo4084KeHbKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7sJGjF9vcMBC1KsVpmVBFZ+kgdeMX9OuHPNL1YNvf0=;
 b=tQgZ9tmdxbHb33qdzffaVf3gIO5otiv+JdR2XXef6FaCuPRmTOC6ipCWwvlM5j+VSlprmQOnnQTInDl9MkYmj25/ys3i7365JVKHQKi+lf4TtY/23S+EFy4NVR4XO/4tllLo8jeqjVLNCr2NETEgIqe3Mj5aF3oFAkUyswRXOkZNOv7Q81MXfK9P/oA+7ugcFQePaGVr1Rvtvv15Z0gxENoiWqQ3VF3oSSWByJoEl32Yth5txNZTQ4ZukewyUbMipWR+xo1C2rXJjQQAnsm/P/y4/+ZaBFoSzYxn7oDsdA46ffzsFBjd1e2LlBStj0rm2lPYDTESdc/64zqBxguhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7sJGjF9vcMBC1KsVpmVBFZ+kgdeMX9OuHPNL1YNvf0=;
 b=dcsfGFnpm9vnmBhvCe76uwNNoZE04axUR2WKnX8iFxbUObDcm3UKGkzdSjjHiEVwfdFtZvehDh3fv2UHxtYocA9Pypkgi6YuQlSiKMBqC+1jWIWnPTfDOah03jGLEvU84v0/uD/yHzBSp7IdAwFHN5bSFU2L5g6GAkejiBQpMl9zogiNQov/9y+/+OHYXnpPpRE2b5Ky8TeN/msFyA/mACaCzaKLAbOsZu5TGdm8eGf2nlfg7icYt8qPSXaWpDw6vVTYzL25miQSi0kGXTfZ9pxxdpXer+6be0PNrDWVjZ5M6wHSgrNbr2BuZPM3MYuWuGhDEBxyB3cx23O4VhIu8g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by MRWPR04MB11286.eurprd04.prod.outlook.com
 (2603:10a6:501:79::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 15:07:36 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:07:36 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH 5/5] ARM: dts: ls1021a: describe the DCFG_DCSR space in the guts DT node
Date: Thu, 26 Nov 2026 17:06:32 +0200
Message-Id: <20261126150632.1560355-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
References: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::13) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|MRWPR04MB11286:EE_
X-MS-Office365-Filtering-Correlation-Id: c4bef21c-e6cf-400e-3de4-08df4bcf012f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|19092799006|11063799006|10067099003|261021121427099003|261102123227099003|56012099006|261021123027099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	zNYjciTNN7usx9T2OqiKzr/xnuEgRQ/ZcFa1kCJCLXRiibJjyAPEM7P83JInUjZNhqzSBLZlBHPK+ybugmhY59ZV4mV3T3Wk/f8C6AbAfMN7/v4Nj2qSr3y+ZtwR3l12xOGuD6DUaUzsjr4fH6t9ZjELWJPZAlxUNG6DmG4xp4DrrvB4Epv4/Q5oJVRJGoNaw5dA1/bE5yPfNMZYktuCu/mT4EqGoeqgBmj04ykelsxwaOwIlgLumV6h7nVTPJS0T5leO0N445YS5QYk9P7Mgth4SZcHoxz6r6HjZCWNVDKL0iiV0LPxSs/UGAU6HjO1mq9bOxE2bABGRx6wSMMvwlTCR3FYiSqBsQYq98XyJupu+vuiynzzVJ29tGr4+xf/9y3dmCF2imVqszFS4SMKK6mDbbK0yBeHiE13hSOsimKaVOY7/o4dDAsEEYvGcZr1ZsMl0S8zzLAkKkigsaMIYRkPEV+9zQnoLxlzkYJO7s40HwnRdJQZ5194+ScXiGPia9uAsTnSm/xskh4RgO7tq+VNrtoo/0EJEn5zBPb4kFwHxstvfdyH6S3HzKVEZtAaqoP936WspiMRVAE8NwlQp6qEzDdnD4GWyaBTDmQtMDEzcbOzVfw//Btck2Kx6OFfQvVUXXTxKGv1uziMI3JDLMLlJFrBFh8E4ug4Sqs6ezU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(19092799006)(11063799006)(10067099003)(261021121427099003)(261102123227099003)(56012099006)(261021123027099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JpaAx0cJOm2eFubfS0mjNcjOmJa3/dGi1kCs5Cgs+M+gBSFG3tJtL/wnpILC?=
 =?us-ascii?Q?adfzQvbN+Vv8P6KImQiPQ8+eGB6PJAq74YxEt0jtebPguyG6TUrlHSDMaVso?=
 =?us-ascii?Q?6/Qy61yUly4bUsM5qvHeqTJCHwCZ9/2dw58jWNREWIIALnK6cojwei5wgP56?=
 =?us-ascii?Q?m8A7qq7TTigzqyDYn9HFQ1PlT19Rk1jdNgL2Iu1njdAmZiW8dEl0VT277s4c?=
 =?us-ascii?Q?iVHhRFldk5LfunWomN7NLrCKghNhkaZIkBd3I+gJOGn3ytiEr9+ztHia2V6V?=
 =?us-ascii?Q?BNHfkuEKOu5yJnam/oX+pDNMFViJ7/9j1r+YB+uT8TUGOovMZaGGQ45FaNYU?=
 =?us-ascii?Q?prrKFJcepYboHmIhZX79f7NVj7ny24k7q6muprmslL61i7gMEiWyLk2Zl9hO?=
 =?us-ascii?Q?6fNcYuaZzlWZpxmdObJH5ffW28Z8x5pTiGobgHqNIVW6dVsvWagyy5cihvbg?=
 =?us-ascii?Q?zmftiNY62ALryFZI/6WKh2/YILYja54/qYdO3+MIWB8bBSIdkzTLJN4OalgI?=
 =?us-ascii?Q?YBPtSM2UthQSJkfJKcslaDKVL7lOOcENooQj3m/zACjTjlKFPdC+wCu5siKI?=
 =?us-ascii?Q?HE4xYT7ukAqwMoM2yFkzzA14oXTEKeqFtTxjf2MF1QiPpwRW4QwTT8xrecaC?=
 =?us-ascii?Q?NARXAzmZIV6lsbn3JTwm52eUPL7fqjVirDLZmQlonBQ4zUoQRAICwTip6JZj?=
 =?us-ascii?Q?1kUpnVKu5tZB9uaSEDg0VmgNtgMZlOTFD9LdYefyOF9tgdOyU0Aqh8p/HUuO?=
 =?us-ascii?Q?dOWUOo1xaSBcja2xlCxQYMk/vWVjMGtnAX9rvaYcCM4SauORF3C0nbEHwY+y?=
 =?us-ascii?Q?3zemt41ZUwDGCUG4L0ol6M3v1AGpBinxqFjUcaa6dEOnO+jR9uQeXMx8XK3q?=
 =?us-ascii?Q?VwxbkocH/K0GoXAGiyr2X7jmIi0YCTGxhaYB3V+mgjUqUHqkB1F0AX0gbXB0?=
 =?us-ascii?Q?kiueRncDXUq8O6M4/yxKnzVE4a5eP2Rv56ORXYr23DWCETYrndE0eXfg/ved?=
 =?us-ascii?Q?gN/dko9Kf60ri/fc0O/5+zL837OpGt8RNbnKAfBb96ya1v64FdxQr9E3a7sR?=
 =?us-ascii?Q?w35tgTObQ9tpkXBXbVvJ/0oNq231jrHTCJMsG7Q/08I9rBZcveBgRwaHTJXe?=
 =?us-ascii?Q?GMfeF7mWUPm3yh7KyTAiCbpfWkUgJQsVpYIEsvmGVVx5KV6EbclFDodUmXva?=
 =?us-ascii?Q?vCmP2Y4mD8YwvcSv8ujcoZtgrY2yW9Hvr/Q/idbv1YoQzbc2YQWf7hVLJtTL?=
 =?us-ascii?Q?tHiE96f6o1dussOFDdiN1lV8NFSYtZsfsOLslklP3LI/bEhvClwsl5usi7kM?=
 =?us-ascii?Q?8aWECoEwLSoxNYEPvEUiQ4ciJcq+JHvvX4wHQV2seJ//Z7wqrrW/9MVM+xq1?=
 =?us-ascii?Q?IcG6X0KMEhw7FDky2JfemeHjRgpZV4LLe4N5RipV6xvItfpjqlDAe8liuc41?=
 =?us-ascii?Q?g8ZNdoF+LecibzoACNBOIfJ5IqoEl4NRfm4WgKNpPccfhOU0r7jAlAd1Engc?=
 =?us-ascii?Q?MTw966Cele+psM+ObRMM51cCOv8meZ75eaiz59BZHDlWUeKrvUG5xRWlM8q9?=
 =?us-ascii?Q?SGtq3WHOKf7EPmfj718u3BHPXgvyM0+L0HXXF47xLEcBWGVpS9BAj/GB3VJS?=
 =?us-ascii?Q?1K3RS9NlR9KGsla07c9UbdCA5BAB/0rmxtzulT+HBKWwMWEpcRgOn+xBnNdA?=
 =?us-ascii?Q?VptjQrkcSvJ/pTTjOwcWRz8khD4LQW2j3lQkUYgMVrYtmSqj8YxWgnwvZLLO?=
 =?us-ascii?Q?3jrnKglYiQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bef21c-e6cf-400e-3de4-08df4bcf012f
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:07:36.0685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d37yl3P78aQOCm3z4lHic1FI3P50S274NU7xzy7Hif3apRa0VVByyysJjhHl/9f/5D0LSgYgTlOw7fIbz6xPug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11286

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the DCFG_DCSR region in the DCFG node of the LS1021A SoC as
well, so that the guts driver can make use of it once RCW override
support is added for this SoC.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index af518fc08809..d393e9c801da 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -137,7 +137,9 @@ sfp: efuse@1e80000 {
 
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1021a-dcfg", "syscon";
-			reg = <0x0 0x1ee0000 0x0 0x1000>;
+			reg = <0x0 0x1ee0000 0x0 0x1000>,
+			      <0x0 0x20220000 0x0 0x1000>;
+			reg-names = "dcfg_ccsr", "dcfg_dcsr";
 			big-endian;
 		};
 
-- 
2.25.1

