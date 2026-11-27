Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776537;
	b=ymHot8ftv60+RxJxamhT488bDCtut3qtS3aKyuDXN4d8kBOASt0IrMFowXrz4L997zD/
	 AGhnyyQYvJfA+MyJ6iLE2FHxLFIywLA7m5OiuxCqyeA5xtgRN1g5uCh+5/aDRvwqr/3b/
	 cdpTyAsCXeo/60NNGEE9UINhp50rhBWCtKYI9ckCX44YjkEKVCLR/He17V7EDMTsuPiur
	 BWE12YKDLJP4YEOOQrpt3Me3Vq7eJjAB9pgpSbF4rr6+3zThsRPaMPFY/h0cI15JtIoA2
	 N9lhx3CYBqAu1jrH9uTDVk/jyKbR/YBwba/VgzrnhHymcsl9LZKh9/pC/77Dd1mTXxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776537;
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
	bh=6Qn6Zl0/iP3d2HrVA35/GBHL05SHJr9GM/8hOAZtNhg=;
	b=0FDrpbqp5ZZL7HQhEcxlMawbsUwCJWh50MTpIYA0p9uLd4muVVZH1xNOR7SWwCiLZP2C
	 qlqB6sE9cNeZTU4X8RhKbDtj4Jo9rHTChSRpDXncliK7ukNNykoGROXTg14PPu+alrcD+
	 7IH8q/15U7sUpeagmJfx8MLQ1DGPGFaYlFr5/n2/KSp0f2dr6j33oJaUnEQo2JiixtZpw
	 TIApkFMzi6GZJvNsZ5c4jf3GNk87IvgkdmrIQZftp3/XGww8nevTRWPSM/xcyABiP2QAG
	 wQXm631tTvbuJ+su3t7a+awnd8UzQ99XZbLEK1YYyB+Pgpfo37b4p66a3GkAs7zFQXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nSOsc7Ah;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6B6606A321
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 10:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nSOsc7Ah
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMSUJH9XnENLTzJkrctf5xdtpQRv7fKDallEJOyUGvzMHmZVLlb5a5LGNQE+mw/siYYS8mN/X094Cb4IHBMzcdGSjFfh0cP3ZCfatP23bB8SBvNR99SAJRzfOu5p6xE7KZSG9N+Ni3R0u45NMM0Us8gju8YytBRm0OGRj4AX+QIpgqeljevdtTd3XJ0bSRVukOCNe8xlp4OBQQOexnj9ib/oX+Q0P5cYBWxzPNXBMhZ5KPxHWnPq6uiufgWY8kJm4vsmGYMmyeHeIIh4WGwzGLwezj9tO/runrNog/WiP6mgDIoCTrLIvmXQPgi5w2S0LCgbQEjY/KH8lNdWQeo8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Qn6Zl0/iP3d2HrVA35/GBHL05SHJr9GM/8hOAZtNhg=;
 b=pLpc/dRGCZf9pdcCQFuETv59dVmuKnuNoTPpxKKQOMgOG0vtRtI3wkyFr2My42oVsduyTEFEcQCgHQ4/eJ9I3hmVzbnvYVXNFt/bYHfn/Ndulc9hqmmkYKaabxOsZkM58dc9yrjeURU2o+OBatcgqKkq5a0L5LZ5Pq5GcakS012nQQ94zXDGqdO1ayTJzFRFuV45Blgb/7WCX15SJB3reBoNhT+bJAjqPDEDzQeDd1oHMyzl/obKVdBZnsr49KIGPsd9c2gsCRDbl1QR1XLWh6IVebd1u8/t6VSfPuuShIHuLtdoOOl00gLOF/Cp55n2ooQ34fcRSPXz22/dE7NiRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Qn6Zl0/iP3d2HrVA35/GBHL05SHJr9GM/8hOAZtNhg=;
 b=nSOsc7AhyXZtkYe0Eb0lVWBQ+AwJBmpXw7Xh7mppimK0Wu8dQH9my5+7W7xjGofZjxYXKanZ3FQowylP4SctuJDGl3nehP1bDnSpgS5eXIg1EUEmUGRCWYUVWjbPLWtnGEotsxrcu92uCcK6bnkm6fSbOYoCZo+WcQIAme9wvOiyfkpg2hTHvIECfmn8PsD6oUtMkwG/S3k2LQvIPHrc7zKrL6/7Oftom4QSPXn03DwuwzL8ktbX5QYJvfBSrOjWCxCp0WrBm8vpZrM9etR0Y6z/W95uxIPtXz0NqlKhuz0oe1Xc/+5TtTFdLbKQoZ9WAc/jPwBuRPDLoKSn8QbXBA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by PA4PR04MB7999.eurprd04.prod.outlook.com
 (2603:10a6:102:c0::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 10:48:53 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 10:48:53 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: kernel@pengutronix.dd,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: ls208xa-qds: add overlay for on-board SFP+ cages
Date: Fri, 27 Nov 2026 12:48:20 +0200
Message-Id: <20261127104820.1990733-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
References: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To MI9PR04MB019273.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|PA4PR04MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: 6304c69f-e4db-4385-580e-08df4c74075b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|261009223027099003|18002099003|22082099003|3023799007|56012099006|11063799006|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XD/GrLOQjM6RG39aF4SL8SpX3ydbLOggRvMQPTjqhF7nDsTpWnKqYi9Cmy1fYHHUPRtCCm/jI3qnDwpLLPANh4TvqGJqTlGsNczD4Fztut0dXabmo0KwBp+f+8isTxEmuF14JvnmgZZGrWk63Ean5175NIEhSRIXwpQd/g8SVtdRvFOTckVOFLoxnPEmRT0pZojMxSChLmd+4zrwBSjCf9keLXi8aRglRBC6QWig+5eFtzOT2UGxGcqSH4XKl/bZCQtnLe+R+3WUXlpHYZvmUIhaKPwka4sSvGnIaZj8WSr7iKA6Oe4rw8im67BV+RrpqC4B1Q8m3ykgEiB60X6JTfkgT4Z+kU1fqKb210XX931kLCdc/tKvKM4pFDeeFOLADwpyBC1sEKIYfxuchM53AzOEZBJ1cc6pDtfNTLub/2FUrmpHvBLzWr0iNdGN19kLY65oawxdV5dPerOpiSh3ACD2O2BhcoDse+mZbgJDUoOoZXwI3mk8KdRJOo5KyzxH5WvJIgcUsEYQtBn9HTDEgVIh65j5cDutVMzCliZjS2Qwhks6b50icjXAisMOZ7zYKond1D7C8UzxB10SwkRM+vxAJFzDX58bL2KtR597xp/jUZDUSJ5tLtbIEfHF++PPO81SvV4sR7QYpVPm255+0WiwTTiQShYNNxdRCOntrtU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(261009223027099003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ihsZ+I+sFVTZjr8p5e0fSpSbJ2vFrBjOp3so/M2BduzQdt20h0h7NdpyP11U?=
 =?us-ascii?Q?5Oz+5/etUynkXPtY5nS3mEQzlp1eG7bdrx/OHiGMAaFy/ggb/wM6nL6CqDiC?=
 =?us-ascii?Q?61RQepTifSycsRyc3LFFKk8uFYyI+1LtVVwGRQj8HCjs9i9D/7Kl8/0thfqK?=
 =?us-ascii?Q?APwQry4zafOIik/zb7vwvdTEOr3ganued5RUr/C2qT3Ju7a0/cBTTX/GFicp?=
 =?us-ascii?Q?opo4IlbuegzE/iLNsI9+zy/IU97NDd96RUMedTRvE5P3HKCfYRd5ouVdsG2W?=
 =?us-ascii?Q?RO2y4TpMyDrCWmLJK5EBQfi7s/hVuEQUDTjhSycg3JicIuwO8KWuAu10obMX?=
 =?us-ascii?Q?GmhyoxZplCrEk84QEWFwARYZSmhwy9WAZHIlcWD27zFzJjOwGlg/fCq4T5xa?=
 =?us-ascii?Q?9f54KRO2cdRDaUaBG5C0F/tmYTsDWT53nuLDyjN5ASjNbH2DHOriXzTOB9sV?=
 =?us-ascii?Q?6IQDw83MjJgpjpVUz6VTifA78uRyZxw4SslKzSyj+7Tl7cOaN8Rpg+oENAA/?=
 =?us-ascii?Q?yj6ORRB00K9SBB6GA6j0Zrw/UUxOhoJsTCVPZxIVXHu1wG6+7aYT1hrxjQ1x?=
 =?us-ascii?Q?3lYuQhtJokOIEDBslfLDg0CvSL0fqUa60WGFj7MILMIhEGacUKVwQ7pI4NG/?=
 =?us-ascii?Q?3dXYUH+mjjP9mhgs1v6fJfKo/e/e75Bx0ZqBj+4W7GJK4uqOPJ7EBYIbSFVa?=
 =?us-ascii?Q?j2NzRToLW/dLPT3jByA9d24cq1OB2yPlGJHFqXOQTS0SDYKFD8qAgB21Pmg0?=
 =?us-ascii?Q?BxskcEBHe8pjU1lUlzaao8PQ17lH5AjYACZSBedjLR3T+6R2MRaA1GOy6aTS?=
 =?us-ascii?Q?jMdI2bVYeWp34iHVq28niFD5qeDCjk8vWRwDuAPGWOGg5Gv/P9WSar1VddY3?=
 =?us-ascii?Q?Tupu1Vi2yCH13gL5OtPFO0I9C6FuDifZirxahIbpGWLz4VyNkgta8HJDvd+L?=
 =?us-ascii?Q?Aqf097o87v6PSespFl3vxbr2Rjj+arTKerkLHsuLynaV5KcgqMGrNXyY16rM?=
 =?us-ascii?Q?659ZtFLLAhcYVqH70Zw4j3BvTADR/MIPN83BYhTQIaya0O9vpzqkCkVY+aSn?=
 =?us-ascii?Q?NpTsZgpLZBNFpq5xwwMEXbSUqxOthDDHJ15UYbrNTqvNmtXF2+1GNmjJtY7V?=
 =?us-ascii?Q?+up3C7Cwv7Tj5VasGwleItG0BSX4pBgcPio1QclF6IqCc4JZhuI5dCco+pRT?=
 =?us-ascii?Q?WFf7n5It/2NjQR48m1Koplplsja2K7lXA0O/+rP9HCK4tfNX4FKnhweDcjUF?=
 =?us-ascii?Q?Rj6A4KhYjgecjO5FyG/eCGjVu5slIGn/tb5BwQ8ha16gNKlXh9GPJRSIUUE1?=
 =?us-ascii?Q?f0sifN19osTi+qHFoP09HX+YE/LPP5U1MAtNWjoAVG7GSLb8ObFxN+CHz3V9?=
 =?us-ascii?Q?SatQ3wp2gGrbUv1Hql5ALgxIZpt5bSYtQ91B40RlKF+cbe8BrV0jpFjw6bTH?=
 =?us-ascii?Q?zSgf6A7kwt4tvpVS4X90W1ZKQIpvIQN8LOMaNPcJ+6nHaeEVznbY4dUwhart?=
 =?us-ascii?Q?osQkmkOQ2ghYavPObcSpNM3v6rbAlSbyF74WxyRjqxlqFmHoAal7cTCkyNpr?=
 =?us-ascii?Q?E4j5QJmtFqWnVObdMdv/XgSW+GOULTJ/MflIg+uhm12qc4O6t5JnX1SiTc1u?=
 =?us-ascii?Q?gf2BOw+R/os+LWY+SoVUkdkDqifz/MmELxsO8n2+1Kk/EBwAl2WsWNEIxrV6?=
 =?us-ascii?Q?kdYgv+eQcT4MoLkDqZdDm8qbkpJmhjOKa4KAdEQExGZwg1m510E5dNQm68Tc?=
 =?us-ascii?Q?5ykjO/Ik4g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6304c69f-e4db-4385-580e-08df4c74075b
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:48:53.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrxMVCgx59EEXKI0663XsLolv2ygfag03dv+oOcn6VrqKw2CbAvdW7SVTkT7UFwdntD16QB/NbNMmEoUJKBQ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7999

When the RCW protocol for SerDes 1 is 0x2A, all eight lanes of the
SerDes block run XFI. With the board DIP switches configured to route
them to the on-board SFP+ cages, DPMAC1-8 are each connected to one of
the cages.

Add an overlay which updates the DPMAC1-8 nodes for this use case: link
each DPMAC to its SFP+ cage and SerDes 1 lane, use in-band status and
enable the internal MDIO buses holding their PCS.

The LS2088AQDS board can also have retimers between the SerDes lanes and
the SFP+ cages. The fsl-ls2088a-qds-sfp-retimer-bypass.dtb targets the
setup in which these retimers are bypassed, so they are not described.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 +
 .../fsl-ls208xa-qds-sd1-2a-sfp+.dtso          | 91 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds-sd1-2a-sfp+.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 5f6aa5e78548..087e163ce61e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -43,6 +43,10 @@ DTC_FLAGS_fsl-ls2080a-simu := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
 DTC_FLAGS_fsl-ls2088a-qds := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-qds.dtb
+fsl-ls2088a-qds-sfp-retimer-bypass-dtbs := \
+	fsl-ls2088a-qds.dtb \
+	fsl-ls208xa-qds-sd1-2a-sfp+.dtbo
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-qds-sfp-retimer-bypass.dtb
 DTC_FLAGS_fsl-ls2088a-rdb := -Wno-interrupt_map
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-rdb.dtb
 DTC_FLAGS_fsl-lx2160a-bluebox3 := -Wno-interrupt_map
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds-sd1-2a-sfp+.dtso b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds-sd1-2a-sfp+.dtso
new file mode 100644
index 000000000000..af38190a0bc1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds-sd1-2a-sfp+.dtso
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&dpmac1 {
+	managed = "in-band-status";
+	phys = <&serdes1_lane_h>;
+	sfp = <&sfp1>;
+};
+
+&pcs_mdio1 {
+	status = "okay";
+};
+
+&dpmac2 {
+	managed = "in-band-status";
+	phys = <&serdes1_lane_g>;
+	sfp = <&sfp2>;
+};
+
+&pcs_mdio2 {
+	status = "okay";
+};
+
+&dpmac3 {
+	managed = "in-band-status";
+	phys = <&serdes1_lane_f>;
+	sfp = <&sfp3>;
+};
+
+&pcs_mdio3 {
+	status = "okay";
+};
+
+&dpmac4 {
+	managed = "in-band-status";
+	phys = <&serdes1_lane_e>;
+	sfp = <&sfp4>;
+};
+
+&pcs_mdio4 {
+	status = "okay";
+};
+
+&dpmac5 {
+	managed = "in-band-status";
+	phys = <&serdes1_lane_d>;
+	sfp = <&sfp5>;
+};
+
+&pcs_mdio5 {
+	status = "okay";
+};
+
+&dpmac6 {
+	managed = "in-band-status";
+	phys = <&serdes1_lane_c>;
+	sfp = <&sfp6>;
+};
+
+&pcs_mdio6 {
+	status = "okay";
+};
+
+&dpmac7 {
+	managed = "in-band-status";
+	phys = <&serdes1_lane_b>;
+	sfp = <&sfp7>;
+};
+
+&pcs_mdio7 {
+	status = "okay";
+};
+
+&dpmac8 {
+	managed = "in-band-status";
+	phys = <&serdes1_lane_a>;
+	sfp = <&sfp8>;
+};
+
+&pcs_mdio8 {
+	status = "okay";
+};
+
+&serdes1 {
+	status = "okay";
+};
-- 
2.25.1

