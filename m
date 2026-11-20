Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795144624;
	b=5OcjParv1Pk5ec426MgPIFtxDL7912+JPTBh7KwXwhrtFfyxyijO37FRxY9jgYZBGq1/
	 PdxR/Kn3jMGjP6vZDZ7jENbcImIbQ+X8LJR5PG5WXwqg2s37T2ZJgpBeYv/3rxj2GOjuo
	 IYptwLTRpPDwpYbrbYe3W8M1j9uRmIMzFS8pTNpRbibRBuQQPCQMLzrzNNRnR37CzhLgR
	 Di88JOxXuqY0FozqL8gotPN/h9K8R6rJca9xOT4BObyaJmHRkpLZYNBWlJGK18LmcvUCe
	 yfqCGRBEuJEQrchmC9+OKLJef6wm8o0S3kUrBXCK/y2WzeDs+h9CUMTXjhIcefTtImw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144624;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=34h69ajRvt62kaqAy4DiKXpnUkPrpkHY8C2J/Zqt8yo=;
	b=ZPqJGWruuN50xes1xzRMEU20Ek9ar983h1C4lPFKtMxhLLlv6ueAcgPyifVNN5snAFd+
	 Vqa/68R6R+tD7/kFULuLophYu9Csi6DpcG9kAqfIXLksJZDqVlqfQoqjrP4oqsJ9mh5l2
	 OKn4ciQeUWKL6B38pp3WrrDElmMBPuO2Etz61LGWJHu0wQ9g76y5eix9B/okxnn4oewy8
	 EL1tIs1wlr9SGCthAlJKWxQwHJ/tU/uPdTZUeAfMsatcFtg/x+HGjPH115rxJySJWLXNI
	 jiVF7wlB2fzXFxPRyFs1JNzBz9TOWQXcCTmVT2HDbjKDUeiTeeSvW5a2gNceWE5FRnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SVBH6NEG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.69
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013069.outbound.protection.outlook.com [40.107.162.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B95B606A320
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 03:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B95B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SVBH6NEG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVwKGP+DFAK7kPgbNPm7Sy9KF66+lP67mF8nn9flf99jE28LM6/Qu7O5x/Nw1IkNvt2KkaaDWbnXdELJ8YbL9SO1Wx5b3D3KTEG8xWR05r0i/ZUfId9xLaTOe3HPRt981GvoE4mU023ANKhcsIK+KGjXZE948hc2fNtMFYuGAy61u/ppR7FvbgofnITL7HOKx1LYGtqyqlgXPi+V63t05i75B+7t9X8pyBSBVpfvlmg9J2pR8+nCor+6x3Q8yCeI4oy+0nGQ2O+ndp/6UaZ6CLnHH7KGOrS/IP+sGAmYvOLAFKMskwUd1qMrjbr6cf6Jlak6cYHyWBOE8wwv/bo/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34h69ajRvt62kaqAy4DiKXpnUkPrpkHY8C2J/Zqt8yo=;
 b=uaLfHjyHoHJQFD0En7nj43rTy27/WRS5cGq96DwvhHdcxW3AN3aKriIkRHU0hgMv0KMLAOJC0E8Rj4XN8ec5egp/MFXODxvGcKggB+bNrDTytpMJtI8XWsYi1IindJ6/K7GndJgJMai14cZ1aJjW+5AQ463R8AmRFqMOffGCqYPl/R0yv7pAwM6rSMMhquXgk1srvUFMxYk/aPbOtf5L9eNrg/l8bUXNJJxnc5Cbowhwdhw1sD0dUkmoKXLf96rSqJJNzJynHqhwNQi3VZzJFMAgLP+UoY0YcCrpwjbWZ2cb3uiIitWkGyjLNL59pP624UGMytncHIGVnhhcAZPX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34h69ajRvt62kaqAy4DiKXpnUkPrpkHY8C2J/Zqt8yo=;
 b=SVBH6NEGD277uvhWwLXBts+qieZoWbO2r650QLY2DfhT3Lz0UJO9OfoIv0rIKjB3BUokMFJAnkwhPY0/TkFfc651shUAnxMLSzGEN8eNX+zqwtkPdF4b26gY+gJRB4r4gE2lQtbqgMfQt6yxQXP/lzZKW9YtGMZ9Ar+ZLBqNIw3qwX1L67rddiGvb5vnZ0EyRg1dJSpYcIPKQVQPVlo6S7b0JYkfVP3+0HH4OSZUHVJqkLg+dmULgS1Yhhcn3MyAAySQfHeEPeGrtEanDiZDQfpAcUYckrwV60jOg5mDPVrujw4xQCWJvz5iojHaIYsTcZROIoCgk1+FwQ1YcfP3NA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 03:17:01 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 03:17:01 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	chancel.liu@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/7] arm64: dts: imx95-19x19-frdm-pro: Add DMIC codec to replace dummy codec for micfil
Date: Fri, 20 Nov 2026 11:18:53 +0800
Message-Id: <20261120031853.1175454-8-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:295::14) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f7fa33-eb6c-403f-da3f-08df46b4be49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|261009223027099003|921020|11063799006|56012099006|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	lsm+WjeCwRc6S4RMK7digbAMJXtQELzkE7ge09DbvWJVoUnWJlRUsjDUIm44+Jia3iHl5z5YGCo8xXTAhBVuuX14McYp7gFqQRrzkv8ny0b2hPbczuHvJ4vrwl6w+CREOTSc6ysWZTjVbPmFvuiEBe9Eu6ZZzzNdZahxU4hgUjNxk2I8c0C6AfBlD9BnTYmL2avpP6Y9f7zM7GMLsVJhtEBRDR6WwOcqOOnfU1+AyXT5PPquzQpkwozg/nGaUEjzHOXBp4y+5qLGaYOLZYjYnQRFR6ox9RuHYZD/YI/bkoP88/eAcmdAnagmAlxUuhWd7AFBnzBPZVEx7KXQDMfVC6WrpcfPkyFSttUeTeLKJkFFTZgHYUX+SGC4e4VDObIwZBPHmKTSXK4f+X/qjYxWMLQPTfAEppqL9LTZaBCzwc5FTUb5D5logtxDHrZTtl+BZwu0BZ2J5f2zi9aVJ+XgnklnHvbRnTkYIyuxHuzz5ed0zrYXKC6r1hA3OcYJE+ropngDChJsn+0OsEwJOwSgcq/2HwT3V4ykS0OPmYXwO1AJTj66zhACsIbzsWJHBBI1BUWfbRC+tBPjOTPiWpfi7ndbFOgdmg6Khm5TZA1B7yXA++KLq3/EVo1V7KWNv2j3hbHfcaLW7sYhsHhv24SP9ugx3wXbwex2GOxgSVXKWD2FjRLfetzeJkVVKPQgU+wmwmdoIjujo+mDzn9kgr81sw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(921020)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vmaNGugemSr13+K1MSrB8G4a7qilFT1SIpBCRztHgdWpteUZWYCNntZipgOp?=
 =?us-ascii?Q?GgHj/lfQzjb3lq8JID/IwmvsTjbLRyWvDch4QiLW8l4FjSYi3JL0gfN5kqr7?=
 =?us-ascii?Q?9EKk9bH2Kh1R0BAbPw+XoqYVuTwyK126XDWx8KCvhJsvs/H94hhadMVjjV/O?=
 =?us-ascii?Q?jN1kEX1VOIRKs6h6phH07ZgaLDNrQsyYyW7K3ziDfxv7M+PQ3B7V2afWwfwT?=
 =?us-ascii?Q?Z/N2uv5dO+iZkRYa5W1CG6wjJIQ+kS9ZtNMS5BiFA4zaZuY40w2NAgpYj+0f?=
 =?us-ascii?Q?DWEzpLjuj8suTSFQFHTJRl8WT3SYPdxwwJDGeZa6ioWtzRXXj4fLPmOVEFML?=
 =?us-ascii?Q?qKEGdUDBdgkylsazoVyO0n231tBwlyPudKXXef6sBpRFbMJnAyPGjIV/Vi1q?=
 =?us-ascii?Q?x7MB0J6ZyrS5QY460a/nCQAL1lEvtTmNQcpXwzScPNc7rAwapDLlmEdQ++y/?=
 =?us-ascii?Q?D7dlPscdzTZGkNipZWCnubxldBhSs7NPzTmQaqxO4YJhHj8loaCi+yCo4ETP?=
 =?us-ascii?Q?dY6iaUb7rj3SAOTVauIgI41+Rlt2+8l8dDcE+J4LEfEasOcvSi4aFCOvOFwy?=
 =?us-ascii?Q?npsMBv3+IsiJKe3lpUUdMIh1F23fPibyeHc9iV1h4DvsIoma8dAraSfAmqxr?=
 =?us-ascii?Q?xfj07kZbKJWgteoQ3682Hq0wbp1Q4xWSvr5nQaPJ3sHHsclWR/auGGM7aACp?=
 =?us-ascii?Q?YB5EFWczAoVI5hKlwRVutivZCv932LS9RY22p4tcjjWcXyI600wsubvFoItQ?=
 =?us-ascii?Q?bGWSHML2bipK2KQUD9HSbDN07JoaMq3YG1yx+dobvOLa9RhQvucDB7pEyK2V?=
 =?us-ascii?Q?klTsTFwHwR84LAPkp7e0ST9MkwKKPUX+2B2JBNdFsH1TI5QUFp2gIZUhBCHL?=
 =?us-ascii?Q?rD6jWzSj8dZv7EA9cJpfyYDRj++1neZa3xbInHxvi9o/ESF7mhYRAfLBhe1s?=
 =?us-ascii?Q?7LzYDPdlCZ7/HlEDMOOOYlyHrXNHHjcYFeF99smrfFDQpeFnqKIXPi691/0h?=
 =?us-ascii?Q?7RwVhxG6Qp9Na58oLUhw7JvMswnHxR/csC+mlJM9K6nEHhb8/h7XEblO4vdE?=
 =?us-ascii?Q?lZ08fG+0hyfO5PRXSMfTJNbD2/tDH+i1g3sGFXlkEMW8HjSZLyEbOpcwi0Vz?=
 =?us-ascii?Q?BcEptYyGFQk4Ax064TlquKiJx1daO5USwX59U/o6tM97DLk83kjM0LMwVIEp?=
 =?us-ascii?Q?d7oppH6DVqZR7Z6qhpgwumZsmldI0/14crhQo/pxleOgngqkj58bsPLfY4H4?=
 =?us-ascii?Q?qpVxHRCafIhZTf+m24Sd1Utn/XMStXNBUZA0+dFLZ937WC/3DXk+/jG0yFyo?=
 =?us-ascii?Q?YoN2PBU39YrElPk1LR0kSgJcRYLPDansFIUGkt5CutNQ8JPOSKyx0k0Gjccj?=
 =?us-ascii?Q?3JxHzer5jN8kKz3lUO1+YR2UKZzMaOBEWHIXkrmufIlrl6QPxGqf4qBUHLEs?=
 =?us-ascii?Q?bKJfwgaKrPYXevDq/sIG756C893G31N/QSTc5z5micactsNYfXWdpgCUCZcQ?=
 =?us-ascii?Q?wvIPFxDE6Cn8kXN4cTz6K+jm4OmSA03HMYqIxSaAr06XsebM31jWh+/aw3vP?=
 =?us-ascii?Q?CRA5AvPRPj0HxDlM7pgp5sVLl3VOqVuxmkAwLv+qtfAB6tQgTV1aSLjE3BHg?=
 =?us-ascii?Q?o1F9MbngpwK/Y3UFgITf48LdunnhgjrwrQIAexbD3fs++4U5eL8HnUza62KV?=
 =?us-ascii?Q?389WJJ5Hs5EmeOErtScPio2xWjxgJ7AL8UAh7rkRmaz/52COM4Ibqis4lEXa?=
 =?us-ascii?Q?eBUhWsxqzuJmxi6bKJQjVNnJDYnIlCQ0u37zPlR8CZbC2ujiztnO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f7fa33-eb6c-403f-da3f-08df46b4be49
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:17:01.1752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLh/Fw9OLGE6BFqR/3VQaftH7Jcw7AJZ6tJsMM4F3KbFLcc55IY+Jbeg4zlR2Omm8qzTv6TG0dMEuROHfqU1fsQ7xIDwKvxBtm8tLuD5O+W53GULhGq9pWRYShMlNKni
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The "fsl,imx-audio-card" machine driver uses a dummy codec by default
which does not allow configuring the channel number according to the
board design. Replace it with a proper "dmic-codec" node configured
for 2 channels to match the DMIC hardware layout on the board.

Fixes: 815fe2e0e65b ("arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
index 5861d46b7e00..dc7ac1f027b6 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
@@ -65,6 +65,12 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <2>;
+	};
+
 	reg_vref_1v8: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "+V1.8_SW";
@@ -250,6 +256,10 @@ pri-dai-link {
 			format = "i2s";
 			link-name = "micfil hifi";
 
+			codec {
+				sound-dai = <&dmic>;
+			};
+
 			cpu {
 				sound-dai = <&micfil>;
 			};
-- 
2.34.1

