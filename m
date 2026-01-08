Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011006.outbound.protection.outlook.com [52.101.65.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC59F36C5B2
	for <imx@lists.linux.dev>; Thu,  8 Jan 2026 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861330; cv=fail; b=I4FsiKEuFVjhxtEvph7825DHXJ4g+k+P2H1McVYwPo+mDnML0OGECOIk4Ya1Jz5VNjbVi+QptxzUmaG8ulHDbwO77zr2w+yu5xnCTlES1oZOikmGz6z5RiV89apWiB7k7uCkmDJgRufoKSFuRk/+A6MxgshwX/IslOXoMJXLbN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861330; c=relaxed/simple;
	bh=kztzpyibFVBaBNTzTywInmk5FjIaRmxEdDxc6oII8fU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CfMpbzMHeMBnzo8pdIPlF4W1X5r5guKxBmEUdnZOUE946HqPf6a1tKfG1hMkKuzLR73WplXsnGBiHVH8a5ko8d3ymxpfBwnZCv/5nra0SgDuAGUE6BhnlFbdNjv8+vQyuWTMNolGnmb0b0HBEVtMvAK+c0is+GxdJAZvsFOdGTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E0M/S9he; arc=fail smtp.client-ip=52.101.65.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E0M/S9he"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N33rpiOQJRvRnPsjFC8aJuod9lsGmigdsHsnHwa1JaAVaZp25fsLnKZGu6POwcqn1O7Wf+j+I3Xk0EDW/dqcg6+EbuD/zeVvCNfCx8231BCMuvWjUzoVFxrc5gI1EDRKgSn36Kolk9gsRiX2UZF/G5PxO8y78PLMdW5FLHEjsnm44xLrGy4YaB5UQjPQUJbMhkNr7rU2DRM7Zfmh9soYA0eQt6ye10qn4t6zYETjht2z0osxFP3SorSCbFe2AJp/6dfOWecMAhxQDN5ZV/oo0prTHP802Fnssf2iOU3DIxERh5HTMz5AH+d8fKvEkBanPYGSU6EoevXHz+5SoG50NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8JdHnjJLLpgFM+NeVC0+Ch/anImCmHTYPo8Ow3P3wU=;
 b=o5cMpcMiQ6vQNOs/qEDZ8sh+BabRGvBToPTJiuRdWfoY67WujRf/8nXJBpz7Ga1tOJ3QfZTD2123yLrudRFtEylnv1DHCMZf3Fgyx6gluxowcfDAgouX85Kl3S2lw0ZMPG8ACkbw3ZYqEdSIx9rM3Gf/FCKPuPryaYuJzKT+7Gk9l+fXkpSApoLmNTkZhlXMhGMSEt6qD768nTOQjdJX/tp1OkFjj/Tw7TrPLMxAWCaUkxxduJDSuAxALODEbII+LmqD/da/XbkNMdl8bOWAC7Iz75cDa79HIaHZk9aPiRpF+Cwzep7LWBhi+rkuMWOmdZ8a8iXtQGkJTzJK7cXJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8JdHnjJLLpgFM+NeVC0+Ch/anImCmHTYPo8Ow3P3wU=;
 b=E0M/S9hexiHMI/lI0V6k8D+8ayLBh95DkDZLsnrRPDgsKrxzj1aB/C7zgLN2B8Ax+8DWWIk6/vQwxRYSHWqjXI3Mhm2aQAELBvGDMcCR6mR9PoF0LciKzINgWcbfSMPqw+eIvRwdpS0zFM9JKTmfp7se+qG6DvLcZvSwRdhtOHlI8f/GVrnVfB7t898fRo8fIyUtoZ6JKWRqdoXkKUmn0I/Va7peQC0BqAYrHZOPUOpZJGPgCHgzmFW71dXPioEukMY5ZavtIkc2oaGj7xuto6LbzqMZTYpLPkk+9JMIeTGd95euZvCb+o6zUoWmgG4es1snKXCySiPuYaMAjzhSoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB8464.eurprd04.prod.outlook.com (2603:10a6:10:2c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 08:35:17 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 08:35:17 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control register
Date: Thu,  8 Jan 2026 16:36:41 +0800
Message-Id: <20260108083641.2119616-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f09e4a4-04d7-44fa-da54-08de4e90da31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXNqYTEwbitUREJlNnpCQVBzTmFIaWVYZG5ib1M2SjdlYk82OStyMExZYWRL?=
 =?utf-8?B?U1dEWGJaMDYwWEdTT1BvNFpmSklKVVVHaGZtUTBuaTZDZ00xUGpkSmZwUC9H?=
 =?utf-8?B?T3lLbG9BdkdHbE9haEdxNVIxdEhFbnhhcDZjOFRmZXJQemdsNGt5Rk12MUJz?=
 =?utf-8?B?TUxyOGhuNUg0cEI5YkpHbElvUTgrb1FCSExIVHJOUW45bUI4Nm5PUlpkcW1P?=
 =?utf-8?B?YXZXNWpndkhCb2p1Q1NxTHk2am9xNm82MEtreHRaSFFIRGFBQkZsVjFZS084?=
 =?utf-8?B?U2QveHpwV1FKdkhYU1pMZEk5TmZvS0pqNHZZblh1dWk5SmE2c09vSy9sNXhh?=
 =?utf-8?B?ajk3bVdRc3FWOW95Mll4dy9uQ3ZycGNVTXpBNWRHcVdGMWx1ZFBmWkRndVpY?=
 =?utf-8?B?b1FBb3lJUlJtR0puN3hha3EwSmRpWnBFQnRIZWNrMlA5ejFPSjJQZXNIZlky?=
 =?utf-8?B?M21HK0o1T0VNUmZPeTJ6QXl4M1A0RDZaY2xDMlV5eEZaazRyUnBVNEhBK1Yw?=
 =?utf-8?B?ak81K1BnblpEZ2l0TGdwU2VTbEhTcWh1c3ZNc3N5b2dtdWRWTDRRaldiVjlQ?=
 =?utf-8?B?cnZVYWV3NWdrREltQ3huOFFXcXg1c3hoaURLeE5hRzN5MFdyL2J0a091OEdp?=
 =?utf-8?B?RSs1RURRNHJPNmpObEhwVTYrQW1ReXF6YjVMblhmNjFjRTdxTVBCUFVtOVZL?=
 =?utf-8?B?Q2ZLMWFKQzZqbDN5UUtnaHA2dlg1cUxtUHBYUFVJY0c4NUNkdkhPeWY2Tjhy?=
 =?utf-8?B?SXJka2NuTWpCK3E3ZUtJZ3hPc3BqelpvMmtuRzVGcklPUzR1UEEwOE8xYmFB?=
 =?utf-8?B?VE11NGdmZVFNMHBDUjdjNDBCanVrV2ZTY3VCYm9kamxpdUhka2gvSGZrSkEw?=
 =?utf-8?B?TE5kYTEybVZRb0dvSHFIcU83MSsyV2ZHUXU4N2djb1p2RENmRlZFVUhpRTM3?=
 =?utf-8?B?S0JkVzEzS3dOYk1uaG55NkVyNkpiSVJRSGdRbEhyajJleTZrWDY1c05Ja0Fu?=
 =?utf-8?B?WUFjVHY5RXhvWGd3Ukt5SWFOWVBSa0gyei9EMm5aQlE3eWs2cjJtTktHemp1?=
 =?utf-8?B?WXFHM1N5bmxDaWhqcGRRd3pmUTN3U1hXOG1wK1R3OE9PbVdISEhXdVdFNFlk?=
 =?utf-8?B?MXZUVTNHSjRDYmQxRnE5TjJsUU1LU2trLzB4Ym1LUG8yaUo1R0RieXY3d3VL?=
 =?utf-8?B?OE9YYVBHTFl6ZnM2Ukh5bmxJaEdMUVkyUjZ2ajU1bDhhVW9KUEZrRnk2S25V?=
 =?utf-8?B?TW1nb1FaUnNyU0FEVTRPeXg4UVV3MUphUTM0SllxYnFDOWVuVG8xM3c2ME8w?=
 =?utf-8?B?UnRrQmVVVGVhUm5DU2FKc091Yk02V1IvbzRlRWxoelNUeFpkVXh3VHRPRUo3?=
 =?utf-8?B?SE9EWEtHNGpTcER5NlVvUFhYdjZNa05kVllWQzhSYzFvS0lVaHN2Ym5OWXRL?=
 =?utf-8?B?bTdCZzhKZ2xieDBBdTlsVkVTUmRBRzA0b05veG9RSjY1ZFlJV093TkZrYkRX?=
 =?utf-8?B?SWYvN3c3QStJdDVOVlR4bmNZWU45WHJvY1o5NXBMNTJKR3NuaHBFYjFzNG8z?=
 =?utf-8?B?NFNoVGNtbzhsRE9tTHQ3SFBYRzUxTWE1TTZmcEZqRXdkY2gvZ1lUL0Q4VHVD?=
 =?utf-8?B?bDQyRVQ4ZGpyc3lsZGRMM09WRHc5TzhGZytIVkU2UG50bEVaYW8vN1oyWVpw?=
 =?utf-8?B?N3Y3YkVKRjJIZml6c3RENEYvK21GRHhVczZiUEFaamRBclBITElGdTlqSGds?=
 =?utf-8?B?NkVwTDZLRnlkRnRVbVZWNCtSRnBnVU51U01JbEI4T3lpTmM0MStuMGIyRy92?=
 =?utf-8?B?Z1JJZzZZQjVqRi82RXVnTDJtTEVjc1pDVXlFcjZYbnlOYzFyZmpLQnVVcUgx?=
 =?utf-8?B?YlBQakhTN3BVWU1jYXBBaHgzNkxQdDdsVEMzVDhWb2RaVHRlczFtdU55NmZo?=
 =?utf-8?B?ajFlSDBPS2RDWkdXWmpGaWt5UlVCRmVpRGVmS3g4S1VZdUhjWHJiMU85L0xJ?=
 =?utf-8?B?ZWVIWmFYdTRKcVRxNmZPK2hLdU1XVTVNdWJWSUEzMlFRV1I1cllpNGdVTU1t?=
 =?utf-8?Q?gz6olG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXA0M0JBQXc3R3FLZnNNTEl0c0h4c2E3NnNyOUptVVcvZXNCSkxxQ3A3NW9o?=
 =?utf-8?B?UWpUdWdhd2lYLzcwYjg1UmdzRHk5YUFId0tTSzNkWWdGWGpobVJzeW1FdUp0?=
 =?utf-8?B?MWhZYlhVdkZFWEZTNW00RUV5T1FHM204SkorT2xRdDUxUkpDRE54ZzFMTFVW?=
 =?utf-8?B?eTBUeUh6dEVYVHRRcVVYTUk4bCtnbWgremJjZWhtWDJFVmhidERERVJpcm5j?=
 =?utf-8?B?Yy91ZUlRN1RBcHZMN3lNc2ltdm9KZlpDbm50SXRzaUtRMzBNb0NBNUFqc2dG?=
 =?utf-8?B?VzVna2YwL3k5NHB0dFVKRW5YOWhFVzdOUTUwVWI4ZXBNRXhqbWtQNFZ0dGI2?=
 =?utf-8?B?SHZySkEwOWhCZmZxdzRDUVQ2c0dCcllPOHVFYWVKc1dtakVCb1pGSjBVWXdG?=
 =?utf-8?B?d09uSUE5US9uWDdEUk1ETGRlSGNPYnNtRGIweEFEdXdBK1pwMnJUVjZVbmlY?=
 =?utf-8?B?bUFnWFBxMTVtV2ZpZUplMTRzODdwL1JIejhCNnhGWVNQa0VxME1MT3VVelJR?=
 =?utf-8?B?eTV1c2M0d015bU0zS0Ixa1JkUzlLU3h0eGsxaWxDVUdCNHgyYTI2cm5OcC9u?=
 =?utf-8?B?b2lzdnZkV3Nwbkdabmp6RExFcXJtY0YwYStNRmVsWWtyVGJwZFp3Qk5nRVRn?=
 =?utf-8?B?ZWlWdkdrNlZwc1A4MGpzcW0ySGhESDhwQXordFNDVnlhOGtCRm1zNGgzOENy?=
 =?utf-8?B?ek1LM2l6Z2R2OGRSbUhkZWdpbkNSZVoxYW8wMEZTMlJvSXNXQS9DN2daeHdz?=
 =?utf-8?B?c1dyeEJycUZBc2k2a3A3SnBPbHk0bkhwZEF1cTlvZThOVERlVCtXOWJKa0NV?=
 =?utf-8?B?aDRaS2Q2SHh4TXREK1VlclRXWXBCKzE3cXM2aTBNNVorc083ZVlScVhRYkFm?=
 =?utf-8?B?MEZxN2tPWVpocS9pVU1zUHVQZi9IQ01HdEh1ZHR5QnlPSVpVdlJtWWlGTWZo?=
 =?utf-8?B?bnI2T1MwYW5mTndZdFZJNVo3c1h1Vm5TNERkLzZwakJLcUNhbGR6bGFxNFp4?=
 =?utf-8?B?T09YVTFjd1BrWk1Ed0JsK2l3cjNJek1paTZnTW9HN1BhWHFoUnhBN1RMNHFl?=
 =?utf-8?B?WW81c0RkUkk1T3VyVnVTUVNDN2M3RDVNb1Y5NzdmYU1lUVF1VVQ5WWdMQzNM?=
 =?utf-8?B?VUxLSUhURVg3U3dnczF4Vm00YytaaHlKVWFBK3ZrZjhxUkNKY2dyaU10ZFdv?=
 =?utf-8?B?ZWF5MTcya1Q3cldIS3B2UFFuSmUzbmhsa2E0SXZpVFZhRDRlOGgxbGlsM25Y?=
 =?utf-8?B?eUlzbTRLR2UrMmgxTG8xdjA4RUR0U3BoSGM2THZjYW55eXE5d2RjTm5ycG5C?=
 =?utf-8?B?WTdvOVpRY1BKNEkwcEhTem5jMytJVmdGWTJuSHZ5SllxWklDM2tVMjF6YTV0?=
 =?utf-8?B?b25EQXRRN2tKUkVwQnB2c1Z1aUNQZE9LNUhnMXlRVlhpOXlWUzJlaWxXYmd6?=
 =?utf-8?B?eFRxdm5zeUFHYUwza2VnNUZHM3BEZm9GU3lySlF1UWxTa0RMQXpjSDhqcmY4?=
 =?utf-8?B?NHJhcGpEa0gzaGhDRlFoVy81N0ZSZ0owZllLenI0cWNZekZLWElzZEErcEJJ?=
 =?utf-8?B?QU9DR3I1cjdnSDF2K3VUL1JvZ0hSZEkzbCtYOGRNSkpxcGJHazNKUUtLdFl5?=
 =?utf-8?B?aDlXYzlaejBlWmtnaFRONkdTZFdZVklYMUJPOHdxZGYxZzFWRGpaemlQR0Jv?=
 =?utf-8?B?VEM0N3VFMXFWUXZ6U2t6blliczJEVTEvUENhemdDZkpjNnJjbEFVdGNseGs5?=
 =?utf-8?B?cnl1R1dVQTFkanRtZ0RWQkd4SGhZSzlnY2VrSVExd21hNUhGMkRYdWg4VW9L?=
 =?utf-8?B?ZVhybWlQQTAxNHNoU21rdnFCWlE4RGZidk1tRHJtc0x0ZHJRWWlTbVNwSWRC?=
 =?utf-8?B?dzJiT3hyeW1xY1ZITzkzU0w2Kzc1Z1ppMVl5QjQ1djgvNW5VRmV3dklXY2Jm?=
 =?utf-8?B?em5sY0gvN294TTNUQlVyYmlTcFFIWjlIRVEzaWdHSmV1OFQ1b0hCZ1pTV1U3?=
 =?utf-8?B?ZVhkM21yazN5M2pxRU5rL1ZlT3BoTlR3OFF6YWo3a1psdllsSmZrb2VlT3FP?=
 =?utf-8?B?S09XRlRvRUJ4amZDa3drb3kyZkxEN3I0UEs4V3F4bWJPUXdydnY2ZCtlZDRZ?=
 =?utf-8?B?TTVOVVhJQS9mbSs4MDJMcTZtNnJRQ2NvUW0zYTI3bVR2Vk10T1EwdnRnVXMr?=
 =?utf-8?B?ZnJ4V1dtQ3FVb0tYV1dYblNJNHJMS0lmbTcwTFZuaS9GblJRaTNSTmllUVNa?=
 =?utf-8?B?a3MwYmd4QUJSM0xPTXZ6UndyakhFMVlUQlZ6N1daTlA1NHI4d3h4K0RnTWxk?=
 =?utf-8?B?WVpKR2J3b1poQmtPbm92bFF1REdoaTdNdC9USWdFZnhxOUlCbHhadz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f09e4a4-04d7-44fa-da54-08de4e90da31
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:35:17.8575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3qYqWCi4tdkKGlN3U+hL6ZTgQJ/HAxDBuHHl3wuvt871T09iMRh8TY5BZaEI+Gorevlw5xIfHabR3uLa0kMgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8464

The CR port is a simple 16-bit data/address parallel port that is
provided for on-chip access to the control registers inside the
USB 3.0 femtoPHY[1]. While access to these registers is not required
for normal PHY operation, this interface enables you to access
some of the PHY’s diagnostic features during normal operation or
to override some basic PHY control signals.

3 debugfs files are created to read and write control registers,
all use hexadecimal format:
ctrl_reg_base: the register offset to write, or the start offset
               to read.
ctrl_reg_count: how many continuous registers to be read.
ctrl_reg_value: read to show the continuous registers value from
                the offset in ctrl_reg_base, to ctrl_reg_base
                + ctrl_reg_count - 1, one line for one register.
                when write, override the register at ctrl_reg_base,
                one time can only change one 16bits register.

Link[1]: https://www.synopsys.com/dw/doc.php/phy/usb3.0/femto/phy/x652_usb3_ss14lpp_18_ns/4.07a/dwc_usb3.0_femtophy_ss14lpp_08V18V_x1_databook.pdf
Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - add documentation link of registers
Changes in v2:
 - correct copyright
 - add imx8mq_phy_wait_for_cr_ack() helper and use it
 - use DEFINE_SHOW_STORE_ATTRIBUTE()
 - directly create debugfs file under imx phy debugfs
 - remove debug_remove_files() since the phy core will handle it
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 180 ++++++++++++++++++++-
 1 file changed, 178 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 95f9264bd0f7..e11054f6673c 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0+
-/* Copyright (c) 2017 NXP. */
+/* Copyright 2017-2025 NXP. */
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
-#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
@@ -57,6 +58,20 @@
 
 #define PHY_TUNE_DEFAULT		0xffffffff
 
+/* PHY control register access */
+#define PHY_CTRL_REG_OFFSET_MAX		0x201f
+
+#define PHY_CRCTL			0x30
+#define PHY_CRCTL_DATA_IN_MASK		GENMASK(15, 0)
+#define PHY_CRCTL_CAP_ADDR		BIT(16)
+#define PHY_CRCTL_CAP_DATA		BIT(17)
+#define PHY_CRCTL_CR_WRITE		BIT(18)
+#define PHY_CRCTL_CR_READ		BIT(19)
+
+#define PHY_CRSR			0x34
+#define PHY_CRSR_DATA_OUT_MASK		GENMASK(15, 0)
+#define PHY_CRSR_CR_ACK			BIT(16)
+
 #define TCA_CLK_RST			0x00
 #define TCA_CLK_RST_SW			BIT(9)
 #define TCA_CLK_RST_REF_CLK_EN		BIT(1)
@@ -118,6 +133,9 @@ struct imx8mq_usb_phy {
 	void __iomem *base;
 	struct regulator *vbus;
 	struct tca_blk *tca;
+	struct dentry *debugfs;
+	u16 cr_access_base;
+	u16 cr_read_count;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
 	u32 tx_vref_tune;
@@ -411,6 +429,163 @@ static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
 	percent = min(percent, 100U);
 
 	return (percent * 127) / 100;
+};
+
+static int imx8mq_phy_wait_for_cr_ack(struct imx8mq_usb_phy *imx_phy,
+				      u32 stage, u32 *data)
+{
+	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
+	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
+	u32		val;
+	int		ret;
+
+	writel(readl(cr_ctrl) | stage, cr_ctrl);
+	/* Wait CRSR[16] == 1 */
+	ret = readl_poll_timeout(cr_sr, val,
+				 (val & PHY_CRSR_CR_ACK) == PHY_CRSR_CR_ACK,
+				 1, 100);
+	if (ret)
+		return ret;
+
+	if (stage == PHY_CRCTL_CR_READ)
+		*data = readl(cr_sr) & 0xffff;
+
+	writel(readl(cr_ctrl) & (~stage), cr_ctrl);
+	/* Wait CRSR[16] == 0 */
+	return readl_poll_timeout(cr_sr, val, (val & PHY_CRSR_CR_ACK) == 0, 1, 100);
+}
+
+static int imx8mq_phy_ctrl_reg_addr(struct imx8mq_usb_phy *imx_phy, u16 offset)
+{
+	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
+	struct device	*dev = &imx_phy->phy->dev;
+	int		ret;
+
+	writel(offset, cr_ctrl);
+	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CAP_ADDR, NULL);
+	if (ret < 0) {
+		dev_err(dev, "Failed to address reg 0x%04x\n", offset);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int imx8mq_phy_ctrl_reg_read(struct imx8mq_usb_phy *imx_phy,
+				    u16 offset, u32 *val)
+{
+	struct device *dev = &imx_phy->phy->dev;
+	int ret;
+
+	if (offset > PHY_CTRL_REG_OFFSET_MAX) {
+		dev_err(dev, "Invalid reg address 0x%04x\n", offset);
+		return -EINVAL;
+	}
+
+	/* Address stage */
+	ret = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
+	if (ret)
+		return ret;
+
+	/* Read data stage */
+	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CR_READ, val);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read reg 0x%04x\n", offset);
+		return -EIO;
+	}
+
+	return ret;
+}
+
+static int imx8mq_phy_ctrl_reg_write(struct imx8mq_usb_phy *imx_phy,
+				     u16 offset, u16 val)
+{
+	struct device	*dev = &imx_phy->phy->dev;
+	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
+	int		ret;
+
+	if (offset > PHY_CTRL_REG_OFFSET_MAX) {
+		dev_err(dev, "Invalid reg address 0x%04x\n", offset);
+		return -EINVAL;
+	}
+
+	/* Address stage */
+	ret = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
+	if (ret)
+		return ret;
+
+	/* Capture data stage */
+	writel(val, cr_ctrl);
+	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CAP_DATA, NULL);
+	if (ret < 0)
+		goto cr_write_err;
+
+	/* Write data stage */
+	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CR_WRITE, NULL);
+	if (ret < 0)
+		goto cr_write_err;
+
+	return 0;
+
+cr_write_err:
+	dev_err(dev, "Failed to write reg 0x%04x\n", offset);
+	return -EIO;
+}
+
+static int ctrl_reg_value_show(struct seq_file *s, void *unused)
+{
+	struct imx8mq_usb_phy *imx_phy = s->private;
+	u16 base = imx_phy->cr_access_base;
+	u32 val;
+	int i, ret;
+
+	for (i = 0; i < imx_phy->cr_read_count; i++) {
+		ret = imx8mq_phy_ctrl_reg_read(imx_phy, base + i, &val);
+		if (ret < 0)
+			return ret;
+
+		seq_printf(s, "Control Register 0x%04x value is 0x%04x\n",
+			   base + i, val);
+	}
+
+	return 0;
+}
+
+static ssize_t ctrl_reg_value_write(struct file *file, const char __user *ubuf,
+				    size_t count, loff_t *ppos)
+
+{
+	struct seq_file		*s = file->private_data;
+	struct imx8mq_usb_phy	*imx_phy = s->private;
+	u16			cr_value;
+	int			ret;
+
+	ret = kstrtou16_from_user(ubuf, count, 16, &cr_value);
+	if (ret)
+		return ret;
+
+	ret = imx8mq_phy_ctrl_reg_write(imx_phy, imx_phy->cr_access_base, cr_value);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+DEFINE_SHOW_STORE_ATTRIBUTE(ctrl_reg_value);
+
+static void imx8m_create_debug_files(struct imx8mq_usb_phy *imx_phy)
+{
+	struct dentry *debugfs = imx_phy->phy->debugfs;
+
+	debugfs_create_x16("ctrl_reg_base", 0600, debugfs,
+			   &imx_phy->cr_access_base);
+	debugfs_create_x16("ctrl_reg_count", 0600, debugfs,
+			   &imx_phy->cr_read_count);
+	debugfs_create_file("ctrl_reg_value", 0600, debugfs,
+			    imx_phy, &ctrl_reg_value_fops);
+
+	imx_phy->cr_access_base = 0;
+	imx_phy->cr_read_count = 1;
 }
 
 static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
@@ -731,6 +906,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 					"failed to get tca\n");
 
 	imx8m_get_phy_tuning_data(imx_phy);
+	imx8m_create_debug_files(imx_phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
-- 
2.34.1

