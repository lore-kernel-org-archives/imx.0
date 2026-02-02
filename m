Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18C23033CF
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061416; cv=fail; b=ZGHt+zVE6pbTvLkdF1TIS9SBtXXZsSbJhbZOe5CIPCyw785ygOqFuD8vvDrWorkNAW0SU3c0rApVv26JsBcfzVco/rQwq1W8v43BQfVT7GvrQbzDpTE+YOn+zBjeeFMhiY9WYAfNaspSECsk/9D+ZCfNsLOcl8dTt+kOZ+ZzqrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061416; c=relaxed/simple;
	bh=ptAkx3aQHtTavQQYeFOFxsKL/yJLKTlHj+UlzLFnsu0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=A7zpQdu9u956K7P4Pnw6/+Qu02ubOen5RpsAq8t6+Br5rQuJ3Y8RBpZptmAbuNp4PCf+S93uK0s4tEQ5Vo2nIpYdrJ/3JQKtEYwm3G4FInjHZa4JAWwJHiFJT7CCUR5l1cSsbh3QRcjfbEr+kGBLoM0C+CEXyZCD5z9U2qqwxzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wv+pgbAG; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wv+pgbAG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbWOHxIhTWF5pfpd1aCPSP70NxtfURZy/rU/DcTmBO1o4fMNzFGKO2yXhAZLaASill6CBjM8NGBiaq4w3CXx9kM15JspIgGbLnqgiAa0quQadOoTK4CYScX7rQ2BGaBoPL4M4ubzmjCmCD6buSyVbHhyyZSEMN5hsXnJi27zmNmBm4rCsGM8XFEcs9++9sHFYjVnOd2u3N7ZkRjxn9jfuslIyqYJ25WzPkDIbah8sKRthsBFoIlmTBwPxXMBTdR6yWNUdz7XpqfclXRe9aJmeXoRUBGWLD5Xnj8LhFYa2nZFd/HKHWWB4TeJREENGeMQz/PcjCTC6UCsFicDPFlpjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwUJqyA1AymmJBr4y8HO1RlX+p16bcdaKNd2CemtsV8=;
 b=huB/dsAHlDHOhS3l0GjrzUBLsSCvvVUKHU3q7Nw7BJFN5xd0tFMhbJ5j/ANN843F/FKCaK37AQPm9K+WHwaXTlzzB282cYXOXWS7O7R/k/yxI0MjxH26k24SO6aWPd6RghReG/qQpTDneyicUOX8P0jNOMh49Zj/xti/uXFzJQvLnIK/6oryN71Y2ReFJrV1KB8H8FY0Ayly+4TeQrViiuMadbOPUED/rEhB4Ezi3FahrmT3AEcofibq6Lww5DZ5zPeZB8FtopiqWa34ligzPB32A9WMwK1X3ungvH4oPDAFmQWJSE92NpDK2PfssKnQlh9NCHH25QgJ4yb05BRHdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwUJqyA1AymmJBr4y8HO1RlX+p16bcdaKNd2CemtsV8=;
 b=Wv+pgbAGQYjeSsy0P5R8aPk88DKty6vvO6Pw/MGBQBRvYgzkCPDRYUjaIidJCEKWzRZ1x46jYjCPYZrOMhbIunRjLlDjicZV43iZ3UlqBhmeTSmVJ2LcZJsbXgO4hSQWBkiZica6fbAfMTJIJDoQ1DlIkFrryvWUdJBMg8dEI1v4BVEj6n1OudlJkSw6e/SgIwNcsZNh1qqCFUZPXnbctKf99kbLgH+zaADZPuACfy77qEtBJgTl+6huHvYcabgx/2304BdnlaceHUmdSbgfRXjDOHNbdHf55KOJtfq9j00ROWSdWMHUQqfn7hQGBrE1ikk+BNIJV8VGU5lwFu/UKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6800.eurprd04.prod.outlook.com (2603:10a6:803:133::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:43:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:43:30 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 00/10] ARM: dts: cleanup some CHECK_DTB warings
Date: Mon, 02 Feb 2026 14:43:17 -0500
Message-Id: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFX+gGkC/x2MQQqAIBAAvyJ7TlgNgvpKhFiutocsNCqQ/p50G
 ZjDTIFMiSnDIAokujjzHquoRsCy2hhIsqsOGnWHFZK3p1XGndncNkWOQaJHi76fLekZanck8vz
 8z3F63w/vzTUzYwAAAA==
X-Change-ID: 20260202-imx31_dts_warning-0f0a0f9bae2b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770061408; l=1619;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ptAkx3aQHtTavQQYeFOFxsKL/yJLKTlHj+UlzLFnsu0=;
 b=yGKLYh283yV2QP2wjF9UEbnK9xDayQTtkYNKmmQZPCZ3pZwS9bwrjcPB8cI7vwoxJbhq5FtE1
 CIwAqGl8fNiDwDf2tgHIju0IQXpOWq22TbqOr1m+4+4EoSZxSl8n6Id
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: c735d9f9-373b-45a4-6e69-08de629357db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1ROWFB4ZHJQRTNsNDlZL2YxNm14cUU2UXJQMEFOK2NpRlJFUzBCSVN2bThB?=
 =?utf-8?B?VnNmUnFmaFFTNi8zSmxlZ0l6VVU3cFZjV0pUYzcwZ3pxZGFTMmV1Nldwd3NC?=
 =?utf-8?B?TmQ3Mzg4a0hhT1VGdTJ3Rk5zbFZpTkZlR3dCRytyRU5DQ3hSeXF6RXJuV0dX?=
 =?utf-8?B?eld3ci81RkhXR2V1UnZNanRtRzJWOGZYMVBZNE5xUXp3R1ZYYllGM1VPQ2Fk?=
 =?utf-8?B?aGNLSVVzNHZrMlV3ejVXeXhtT0s0RExOQVBGTlNjZUlQSmtBZjZZM2RXWUk2?=
 =?utf-8?B?U0tNbjc3NkFQdklHbzBMbmphQzhxRm1ZU2pXL1pxbDdYMG5UdVNBcFdkc2NR?=
 =?utf-8?B?WkRac3M3VFlUYlRaYkp4bUNMM0ZRYjFQNk5WL2JGK1dNcXUzcDdDMUgwK0hY?=
 =?utf-8?B?OHd4UFlJd1JaQWRZOEFJUmRtQ2JablhXQUVlUkszZFIrUzBkbWU0OTQ2QTNF?=
 =?utf-8?B?bmJ4QVZIekhhZmJGbTl4ejRXTktFVm5DTElSZGxPQkRFclhHVEhDV1BmKzhv?=
 =?utf-8?B?T1NzdjRPcUFhZzNISGszZVMrVXB3OHJDaHhVZFU1SXdlT3JyeENsQVVpWmxP?=
 =?utf-8?B?TmdSQXZ3bkpEVXhLNjV0Y1FGTG1NK3pGZ3dldXhWbUV1RUM3cHJKSjVDMnpQ?=
 =?utf-8?B?YmowemU2cjdGMGtNWlVXNnhZaWo0QmtMQWdsZEh4UlIzaU91OW4zVU9wRENi?=
 =?utf-8?B?eHEzZW5CYlpTUTV1WjNNWWRpczBMb2QwMTkxUVBOS1lENFdtU1pYZDM4bWhx?=
 =?utf-8?B?Z0ZZZGdtWUdhVy9NdjZWVXorQ0NVZnpURzd3NlFFSGVKa2hodys5QmNoUkpn?=
 =?utf-8?B?UHVQWnJDRTd6bExHem9VemhwVngyVjFmdXFkRWkvTkFQSzkwSkZ6T3VUN01C?=
 =?utf-8?B?bDE0Q0xRakU2WTZZSjFNeXB1TmJNdUM4WFYydkFKVzlHWnZEdW50ekdvNTJD?=
 =?utf-8?B?ZThCK3J4dHJnR0dKV01OZlFGbFE2bGQyUHliVHFDUDZSdlNNU3Q4L2I1QjBD?=
 =?utf-8?B?eW0vZG12dnNHSHU3VHBpS1hzenl3cmJjZ3pUNUZndnRvU0pkanlNZlZ4TnVS?=
 =?utf-8?B?NHliNTl1ZUlXbXBoQnNXWVdsYmpvUjdKemJ5a1VPSndOTmgrQlpDazEyNXA5?=
 =?utf-8?B?Z0d0bHhaZkNJUlhsb3lKS0FCV2tXbXdjOWNYNDY0TnNjeWpESUE0YTZvVUtm?=
 =?utf-8?B?TUxRTVBvLytMK3hrQkxtQkVQVHNLUWJDanE5emdESzB6NVB0a1dTb01oR1Fw?=
 =?utf-8?B?S2xKN1orS0cyekpUbDd0UWwrVWROZmhlTUVKNlV0MHlkVjZWZWNzSWpFVG4y?=
 =?utf-8?B?Ynk3d1JNYzRGZWpmYmVMdlltNm52aHVDeFJjMmh0TUJKUVdqWUR2ZVIrQkw2?=
 =?utf-8?B?ZUxURVpvMXFXbDU2ZWdmQ2RQb2hzeW0yeDhrTmg2N0g2MnlnSHNSWUNCYTRh?=
 =?utf-8?B?azF0TGp0UWxOWWg1YURnQTJLTFNoZ3dWQ1l3amFIZU9zNnNPYmhKQUVWeS9x?=
 =?utf-8?B?TERlaEVjT09aekN0Z0VURGFnQVNrbThWMFJWNUI5V09ZbkZUV254WE1nS00w?=
 =?utf-8?B?czRlOUF4YjFRRDgvMjhCaDUxNGU4RU5EbVh1WU5JcEJrTHlycjFzMWlWdTE1?=
 =?utf-8?B?N3VROVFmVC8zUDBRZVlmbkRpMXZxbHMwLzZxTXI1UGlEZitlaDF1WE5Pd3lp?=
 =?utf-8?B?cThRRXZoMGQ3UGF1dUozd3BFVmVmaUZQTFEvNXVrYjd1WkFYUWE3emRqSll3?=
 =?utf-8?B?aWpBZ2VoRTdZRVJVZ0lORm1sZG1KNEl3bUF4N0hZczhqdjA0dk1tTnJXTWxG?=
 =?utf-8?B?OWR4L1RXc0U3c2p4aEZGRStDSnlJOXYwMG4xa1pHTmVjc0Qwem5xVkg4K2RR?=
 =?utf-8?B?clF5VXQyWno3ZUIwUDRqb083MkxWVlFTY21FUURBNW5iTXdYWTNBNHo0TlpO?=
 =?utf-8?B?K2p2bFBqNW14cnZmVGRvWUFQSFNmc09FMUhjbnlTRkFkUlpQb05RZ1JWTXlG?=
 =?utf-8?B?RXY4VHB4ck1US3NtS3hseTg2a3NyQUtFYlNYSTBkRWJkVS90VDVudmNmeEQx?=
 =?utf-8?B?bktoaTNLRG56RVRmZVhwU3RocTQ3SnpxN2RqTGV0R0N4MndSNjduWWg5K05u?=
 =?utf-8?B?WFRkMzNFSGwwazAxNWxhdGFJbVNWakw2aThsOHlSdXVSSE5DTUpKc09NT1JG?=
 =?utf-8?Q?JSJjvngOirWgHZOaG8sdcls=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlNyK05BTm5TT2hYNHpLTjVid1FhWmZFZVRiRTh3ZnJZT1Q3Q2RZZENaNmlz?=
 =?utf-8?B?RG14bmFmS0k2bGJEa0tNNUFlQzJMdEoyMS9ZSDJtdEFWWFBieWkvYlRMNytR?=
 =?utf-8?B?R1JaYlRyVUkyeUNOYWVIRmRoamJFa2tLTlZ3L0JGYmlJOFdZS0NBVG5HVi9i?=
 =?utf-8?B?Q1A4VlJLTWlnVThEOVdyU0VUS2E0amYvNVlqV0NNbXVwTWF2c1R2dk9zUldj?=
 =?utf-8?B?ME1uZW9rRStSeTdkTGk1MWNrdUZxSmZiWVE2a1crM2tFVEJ1ZlRsSzFlR2FD?=
 =?utf-8?B?cFVUNjAxWFExczVUOTQ0dmlhOE5sSnUwSEIyK0xsOXI3ZG9DMHliTGxac1F4?=
 =?utf-8?B?VE1sN2E4SUZuRkhIU1BsVEFqS0M1UFl1QmMyS1hsdXNRRFhSdXJNWVUxM1ov?=
 =?utf-8?B?ejdKSk45dXM5MmdDRksyb0sveTVkcXF5MjN5UDgyeEc5ZFZNNnpuUkM2WlZq?=
 =?utf-8?B?L0pyc1oyc0RZRjdJS3FiZDJpUlBkQVF4M2lsRi9jbGdsL2F0anY4N2RBNStB?=
 =?utf-8?B?ZHYyMUs4K3JwTlEyMEMwcGNhQ29qYmJ6LyswYkdleEt5UzczQ1E5KzdDYVB3?=
 =?utf-8?B?cEtsaFA5YUNFbHFtSlhaVVpQeXdmMVZCbjBOQXVKK1hBNFFVSzZjQ1AvVTNn?=
 =?utf-8?B?MTdXcFdLbWZIN2VjVkxMVnMwSmI0YWoxTE96VUlUMEVmYzI3dVd4ZUZWaFFr?=
 =?utf-8?B?bWpwOHBrMnIxclord1RBVW1tQ2hSRUNXaGlScG1YaitCU2srV2F3WHBNTU9v?=
 =?utf-8?B?NEo2TjYzcjRCaGhUc2Z1cTEvb1ExZ2hLK0tPTmdvalI3c0tZRWtYdTh3TnhL?=
 =?utf-8?B?YlpDVUpINCtvSFdReFVlclBuQlRXZjBDYy9VNVdCME5pY1JPbVBWR3NSN1d2?=
 =?utf-8?B?WXlwK2lnN3dsaXpnU3BGd2JNWnl2SDFWREFqdmhTV2FVVGNrYmRIbHpRbDg5?=
 =?utf-8?B?UW5EWFU5NDNDckxDbitrSEJzQmpENG8vOGRNTWJyeHFDTXU5TmRqdG1SVGpR?=
 =?utf-8?B?SmdvcDVMakNtMHpKQWJMVVlDMXhQTnh1ZytpclUvNEZzWWxud2hSYytQK1hC?=
 =?utf-8?B?R1dJa1dxVmxJOVdSNDBjM01ucUhxTjFTV1BKeWZCZ3FCcFVtc05tNThGRk11?=
 =?utf-8?B?Z05FRGN4NFFJK1dHUmRTeVpZT1lsdzRjcUR4cThscTJCUTgweGlRd280RHdU?=
 =?utf-8?B?TnpQTFlOSVMyOEIwWGJSZ2E0TENhYlRueUxWa3d2ODhXVXdSYXNkZnlKWDZx?=
 =?utf-8?B?ZkplNlFpUzY2b2hUVmxZZ2tXeUhMaU9uS3NNVU1acFFVR1FwQ1VmQlR6NTll?=
 =?utf-8?B?ajJIOEtqQlRmZ2JDUHRkajVDQVBoaGNFTGRuT3BDL2hFUU9NNXRITmZWRGQr?=
 =?utf-8?B?bGgydVp5NmpiMjJVMmZSWjd3R3lOd1pQbUw1SGhkMmZSUm5mczU0NzRBSWdt?=
 =?utf-8?B?bVdYbU83K0M3VmFxUEtiRUdLaExydTVYSWZpU0VxWVA4dmhLeE1XekR3Z2tx?=
 =?utf-8?B?eU00Sm8vMVIxQWtUbmVlaVdqeXp2N2pMamk2eTFtVHBCS002dHZrQ1prS0l4?=
 =?utf-8?B?ZXJIcFZreWVHNkVGL1dqbXVkQmF4VlFod1FuMmpzdTJmTjlqRzdscE5EbzIv?=
 =?utf-8?B?ZGJIZlZJT0NjMmFZdUw1a3BPTTNSQjIxL3A5T1JSMWREUkhWZkVrUnhjTXY2?=
 =?utf-8?B?dEMvY0VLMWYySS91QXdLTFNhTHZ5TjduWUMzaDI0b0ZpMS9pRVVicno4MnBE?=
 =?utf-8?B?U3BubDR6QWJiSUdJMnYyNkp4ME5VMytYODdld04xY0VYS2FLY0sycTcrUTEw?=
 =?utf-8?B?VzM3RE0vdmZZVStITFlkYm51KzIzcW8zeGV0bklWWU5zSm1ueFgyYkIvTWJi?=
 =?utf-8?B?dENodDFES0pQdmRWUUI0ZDlNNXN3NHMwNloxZlNFb1JYdFJWRmlveVpVWDh3?=
 =?utf-8?B?bnJSVnFuaXZlU0oxR1BvWGM4amlzYmIreTlzT2VPcGczMk96S0pUNVNXQTd1?=
 =?utf-8?B?UytqR2xPakgrbWtGbmx2SU9JaE9tckVxLy9PcXlwMGJkWE1xSkdKUXZiR3E5?=
 =?utf-8?B?cjJVRUQ5eTRKREJESTlVbTEzQjdJV1l5SkNBOFhGdlRxZXFqcGZzWlFLQ0Vo?=
 =?utf-8?B?cE1jNThVSDBpNUVGWG1lMnBMZXNWeURaTTV2VzhQekZJSWxyTnFmbkNQSXhl?=
 =?utf-8?B?UHJQY1B1TDJQVzg0VjNIdTFxSEJneDhhelcvSzJpSmdHdklYK0dnbDk5UmtE?=
 =?utf-8?B?L3RmcE1hdlBrakE1bWduVGtMQzR0aGZKUEF1aGhac1hIV3ZOYnBBbmlHckdh?=
 =?utf-8?Q?v1qjdVY93cIZu/EYH1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c735d9f9-373b-45a4-6e69-08de629357db
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:43:30.8226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDM5FobErBz6mToed46uq8zWii8C8fLKUzTEmMfUgvoi3FLC2qOdYBBfPcUKaVALk8HQGkwezXzbhwmdvVjIzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6800

Cleanup some CHECK_DTB warings.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (10):
      ARM: dts: imx35: rename emi to emi-bus to fix CHECK_DTBS warning
      ARM: dts: imx35: rename i2c clock-names to ipg
      ARM: dts: imx35: remove simple-bus 'usbphy'
      ARM: dts: imx51-ts4800: rename fpga@0 to fpga@0,0
      ARM: dts: imx51-babbage: rename at45db321d@1 to flash@1
      ARM: dts: imx53: drop fallback compatible "dlg,da9052"
      ARM: dts: imx6qdl-sr-som-ti: use fixed-clock instead of clock-frequency
      ARM: dts: imx7ulp: remove #clock-cells from clock-controller@40410000
      ARM: dts: imx53-smd:  Add power supply node for fsl,sgtl5000
      ARM: dts: imx7s-warp: Remove data-lanes and clock-lanes for ov2680

 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |  2 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi               | 30 ++++++++--------------
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts         |  2 +-
 arch/arm/boot/dts/nxp/imx/imx53-qsb.dts            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            | 18 +++++++++++++
 .../arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi   |  8 +++++-
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |  2 --
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             |  1 -
 10 files changed, 41 insertions(+), 28 deletions(-)
---
base-commit: d56315c1bfc31d25586028cc46cf6bcbb6e21e56
change-id: 20260202-imx31_dts_warning-0f0a0f9bae2b

Best regards,
--
Frank Li <Frank.Li@nxp.com>

