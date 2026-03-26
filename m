Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013023.outbound.protection.outlook.com [40.107.162.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F103B389A
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511494; cv=fail; b=Vs/HJH06ci/QSN+G2ENGYBX4Dw9mNiDaNRoreHT1YUc7tsyqrrBjM/+fry4An0nQBMLWdpnu/6Mh0gMgPCj3sK/c3uuk6sZLUcLYqWpP+vo6DWxqTA1x3ldnCvtGWe66HM/SvTwsSpjAnKtMNUfh7VAcrASMVobo94I32ZlXF+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511494; c=relaxed/simple;
	bh=x2Wt6B25XfaI1k1mpVyc3jaULwiP6nD3hrmxKR7AMpY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mwD0MqSmY1in7qLWU4rUotMOWS0u9Qyt2z4/5dK4WTMTqywdUinN86mvPlHkVP+M0MsFDGAIGDGVMrYDrgUGYcQkZwV4UBzwaCySObqYWVk/cC5WeeO/OaSw9oRgpBy62D37KbN/NF3jgbpq97fcTLt0SGY5UMtgP7XMblhIiws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VBLL8fP6; arc=fail smtp.client-ip=40.107.162.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VBLL8fP6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nynG/hbmBU8KZTn0vhHFui2FXBy9jR62ZFEZEoZd0Be/nmjAswJPnrtgVn9atkmY36erksSPlgIhzVrwzyMa2QDsA461rzH+CsKNpPAGcrJigk9aY3FPj9KVZJLWXQ7HDAAWpxpjtgTC5zIJiMIO+NVx+NoiqhJOEnC+OOTWS5A0WFOOqzk50uYb3HjRp5bNT6Qoa0p5ba9yyH0BaoaXl7PdEYJ15JMRhqY91gQL8a5iflVvHTOHZ9V88cI0vASZ7q7U2SoOx9LT57X7mW9ca9pmlYhOy/CN7m99y5R5HvZowqIvE65qgeMp3b84I8avWr/N4xOd7Um84RzeKYZLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rB/Iv7vqAFG74smPr/NEd8xCY0XdgIgiHPs7T1J2iNI=;
 b=iXc6kEmX6A9y7yY0lxx4gdooLHKTFz61wkzSBlFdx6dBoV7g2yY3BuTUbhQBCyPumTyI5myF1yoAwcwvQnh5SBzSqTIZuvPBAupA5opPZNLczKp2cPAzLlvNkaEqqNVdprIbGW54I2rDgTaOKWDhS++7zrXrSSHm4Gx+TRDFhncGcKKJ7g6Xg2I69UZ5U7WAf2WInRcniqjHaD82t3NbM513HIGAxkMOp2wPWZsZ7g5p+kJ2vh6jaCdVp+TnoDrWb8mdRTxYQdSUdwjFVNq4Z1xqmo85NMunRkTo3Ad5qfoShefiWnF56ISw17mJmknhCVIGt2/5NCbAqrqT8ge+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rB/Iv7vqAFG74smPr/NEd8xCY0XdgIgiHPs7T1J2iNI=;
 b=VBLL8fP6tGAtbFZFBei3hyTYnJ/wN/dwJRW69hz/wBJX/M6bBDlFKAZJNatJH5iCbBj74ycn97P+aFL1rST9YhHltiIOc3LpyOUlUMFcRsoM5PYtZSQfNY2P71JQwofykt9njPHsIvx7GLe4shkHqFhuU2k0ATiHjrXI0ao0gWdZEUSjkZ1n8k2koazMlWhqztCFLMfBY/71SJjZcM1YwYUCi3rQFnwlXZl34e0pVppYio/L7dZ8Gpkv1K9NeaEAHioW4gsBrc0LkDiHVwuAH4gHbSOcYFEN3uc0CiOWc4pvq7eS9aYB2KHYfjDHlDE9NcyWHf0cvks4VLla8c15/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by AM9PR04MB8413.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:51:29 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb%4]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 07:51:29 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Thu, 26 Mar 2026 15:51:38 +0800
Subject: [PATCH v2 2/5] arm64: dts: imx91-11x11-evk: remove unused property
 clock-frequency from mdio node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-imx91-qsb-dts-v2-2-b991b81639e6@nxp.com>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|AM9PR04MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d409c5-ef6e-450c-db5d-08de8b0c7d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	AbmaSqb22XmsakaoRBuyjmGNw0JD0YfT9AA4Fz+yhsauB/6+nQM6/6TJ0FvHJcdIT+15wKcWNdHSJL2GwhVkcXS1XQrDyGx3GtsVd4CfAntog6JDH99Zp6Pu8OLwEctjpTC3/7s+6C6S9sWLKIdYeLX7UHlkMVTEcbTEcDdcJhAX61nimrrRy8Z+Po4+FV/r42agyUUemd8sI1EoYpSHdsniPDcccRODwKj4H0eab5pl5Y3/iyIubxaX9F9fyCr9S6i7A/aers9beJSvtoJNSG25W7Auc1n75cWeFXfGDySaKO/JrrY3whJeMQWoGMNFfucTXvohrJ9qa0pMt6j/rfSayMl2URgZBeqKJMLsG2DOnmoKnk1RGd+f7A0Eqw3+ak5fN5zD5P/jLIrnLn+j7EHeyRLIXKy5pERDDs0400V5NIOQLyDc3inKJ11yZZ7VKVg732qn/4pDNdNSHwVlG30Jb1BiiRgPZ2fKkGReotgCc38xz3mAo4YOHFfLa78HnJY5U48A27cyg2c1NmJs3faM5FzZKw9oQ8OKKo2kD+BuARzFqxYmdvUNVz7qQwbunsKNpL+HI1oJIxRPlrY96jgw/KqyFVSKOcYgCM6eULlo7Day8NKINklgy+OcXAxzN9l/5sbJOB1B8tqY7IO3fiP9LHH4Jpn5X6lsHnRr0Eg38ikt0FSYRkpAtSor+SAO90P9f7tw6NnQjinBGCHVbwiVcHZyXGHY3uhgkpzIFtifmooSokaW/zrQo0eoH0hB207LvDQHde/x5qOh8qO3hWWL+lHn8PMJ61T1UoNP8jEyCRZaDFP3e+/Zjn5Eak/q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qmh2OFkvVlM5blVtSTZXSEVTTGRWcU1WSzJvNzV5VXZob0l1c0xxeFUvUDgz?=
 =?utf-8?B?N0RzdzdJYzRCZGxEQm5CeHZDSjltZEYrOVNLR2p3eFhKZnF6bER2QmF1cmpS?=
 =?utf-8?B?NnhOWnlrRnJPYTlNcFM0bUM5bUIvRFZqNlp5LzlENFBncERVRWhFaWtjRjlL?=
 =?utf-8?B?Y29IZzFCRExjUzRVcytLWFlGZzNhVmFSV0xjQmJkNWRSMHUzNkMwRG5xZW1x?=
 =?utf-8?B?dUgrWU9YSE5rQkw1K3lEd0N3VFVGQ0VPcUhOQzBQOWZTWC9Rcm1ibENqVW90?=
 =?utf-8?B?VXBHSzlVR3NFNC9Xb0lYYmRNeFV2QlJUZ0hFd1FBWjVyVEU0d3VkdlM4WTRs?=
 =?utf-8?B?bVUwTW0xUFVRSUt6QmhyaXYwTDRVQVQ1dFVKOWRZcUFzSVd6ODNxYjhIZFZ2?=
 =?utf-8?B?UmlSUXdNbFBGRVpKWkNpRldSdVNRQTNHZDJCV1VTcVFpZ3BGdmQ4M1pxZWdF?=
 =?utf-8?B?NXBrRnF4UFl6M1NFOXhVZTkrRjNzNFZOYXQxZkJFRFMrWnp6cjVUaXEvRG1s?=
 =?utf-8?B?SzdBZmE0TkdXczBIRmdoVFpQUGtFaS9DbkJtWkt1SW45eHhFMnRQZjVPaUg2?=
 =?utf-8?B?M3FGNnh1UHlEbkxXZWZ6TGZiZ1JUbVM1eW15QmlRNmM0ZnFRcXVDR1doRy8x?=
 =?utf-8?B?blUxU2RFTGFqazF0Sngvak1MZExKVEJRNysxUHdUMHB4RFVIek9vbE8waDRq?=
 =?utf-8?B?WkFEYjY0dm1Xbkl5cldUdCs4M2ttcTlLejErUVl0dDVOcllsS1E4bndadVVK?=
 =?utf-8?B?MnNuem5STnJ0eDg4ay8vdzA1RGZ1NmZ5VkZEbEx1VStBUloxaVVwcUdlRGFT?=
 =?utf-8?B?TFJtZy8wbXh4aU1waFNjeTlKeGptczkvVmVmQmFDVk1TTytmcUpKa3hVcnNo?=
 =?utf-8?B?dlV1Ui9JcGtKMHpHSTh2T1RRRU9iV0d6VGVnblZLM3poZUltMHZ5cWIxOXpx?=
 =?utf-8?B?S1F4aGpwMkg2OE5mWUhuci91MnFVSHhxRGxKaEhMNmxZTWpaODdWY3NRR215?=
 =?utf-8?B?c2RFajhVVkVtdWE4OXF1Vit3cWtGT2xmRDB5dDQ3alNaREE3ekg4aHRIcmxS?=
 =?utf-8?B?K25QS2lrbkpJdDg3djFUU2VESmdmclBnb1p3RDQ2SXdQTzhTWkZxUnBqeDVB?=
 =?utf-8?B?TFEvWmxPZDFJRHB0bmMvVll5Q3FLaVlLdU9KcmMxdWdXaGpxY0ZyazlETVY1?=
 =?utf-8?B?c3g0ck5SVzloZ1dmb28xVlBmYTZXN2c1SmxqUUltcGk3bktZZWdyUEtGbm5E?=
 =?utf-8?B?dlBnRU1lK3B2TzhGS3ExeVhtSHEvZW9VOVlQYmVIVkc3b1J1YlhEaExwQjNt?=
 =?utf-8?B?cldLQzZWVVp6c1lDMWZ4RUNtUkczSHBiTFVieHlpakJoUTQzTlo0Ky9FMmx4?=
 =?utf-8?B?VkJINjhMTmFNWTVPUGJPbHVILy80MmppRWprTzhrR0xLNWdkYndpSVArUWlO?=
 =?utf-8?B?U3hNWG5oMFN2UXgza2tBVFl1eW9CZ0tVeGI2VWdNNVRYcXdrSlNxVDNranZ2?=
 =?utf-8?B?QmpISWZzOXBzQ1o1NExFZm5XQ3dhN3l2ckpCaG1WSTE1Q251N3RSQXRuMk9F?=
 =?utf-8?B?S2lZbFVKaktoL3F4SEpiTE5wb1ZJZHJhdlExVEtzZ0NaeGdhQk92ekNsYStk?=
 =?utf-8?B?L2dUY2wxeVJ3czIweHR0R2JkRkhNV1prdkYvcTVpWEtveGtJR2l2Mm9xbmhT?=
 =?utf-8?B?MHZNTUZkRmRYMHN1S0pTa3U3UjFGV0M1UTlNdTZoUk9DUEJ6WjFTaHV6amk2?=
 =?utf-8?B?QjRrcnpvR1VHMzNsTXV6YTJ3OFdtNzFBeTF3SkR3eC94by9wc2ltSWlFMEdi?=
 =?utf-8?B?UStiS0hTUkV2OExZd2lYQnpGVS92QVFvRVB4WjlLMVNnQVN0MGNXY3JNc2lv?=
 =?utf-8?B?L0VDRXNsZm44SVVVSjBxbDdhUEZNYXhCL2Y1Ym56NzFvL04rQnZSR0xZYXRk?=
 =?utf-8?B?ME9DdnR0dTBOalExbHBHZnhYMmMwVEpaWEY2YlhXRTYxZUY5ekxPemdpSC9C?=
 =?utf-8?B?ZUwvYncwODNxdlV1RExiKytBVnVYUURueXIwL1dLdElzVjloZzZXdE5nQnh0?=
 =?utf-8?B?Y01SWFhhc29udE5jdElQU3pLS2dRczhSVlBrWk5DbHRUZ0plTGFzb0Jsb1lT?=
 =?utf-8?B?cHJJKzYvYmNvbktWVjlFdXRWajc4V3pBRStTcHFmbFBtdXc4bWovS1dUUzJF?=
 =?utf-8?B?ZUZIRExVY0JRbnhWR25HVTlPaW91OUd5YTYyY2ZvRUQ0azRFRFVZS0hYSHBj?=
 =?utf-8?B?M3NsY1J2U21LOC9IVm1vSXBqSW92b0xILzVQbnptdG1PeG5pOUNxUXI2RC9q?=
 =?utf-8?B?djhzRU1ybENlUFFBVE1PdUh1MnFHM0M1RVdncThJWG5rZEFWM0tLZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d409c5-ef6e-450c-db5d-08de8b0c7d4e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:51:29.2482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjUnTsJH4LWH6fqHXJNVIlPEIO9WUjwJBxN2dfM1PCb8sLV9aRFdpC4DH6/qleUm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8413

The clock-frequency property is not implemented. Remove it to clean up the
device tree.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index c083b97476a5155b45ead382da22f8bcfd5a4c79..de524f1921de808ee29895852fcbea37565a7e07 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -195,7 +195,6 @@ mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clock-frequency = <5000000>;
 
 		ethphy1: ethernet-phy@1 {
 			reg = <1>;

-- 
2.37.1

