Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E964921AC
	for <imx@lists.linux.dev>; Tue,  5 May 2026 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998861; cv=fail; b=UOZLxqpAaJd5s5dXmS+T0TnEZHFfVT8K/wB0glvDA1v0Tp6LbJbaLxzQlMPzQfoNuy0NzzRY22G3u2KGM1Fmw3qarBZlG37uFaYNMVgOqB9JQYps7r4f8Mtz9+LHBSSY6wzm4oO/QKKDvpt2W5+ram6qVdSy2Y9k7J4cN4eiTcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998861; c=relaxed/simple;
	bh=LcFzgfI0pCCCbstLsn+aznZFAHCf6pjMmm6KYHXAjXM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=Fa4s+TBtXu3QU9+mv+za0GnOeWaoDyJM9xJ8r/F16QLZ5zi0AD5G4tGocIL9EfGae/GOEHq6v31aYDEHPQAsNSX6tqrvIrr24z/n5Cg9zGPXTP9XcCc5Y+Ds3pcY7oXNQUI/VaEFV0Bl3jNHBnASgRaFONCkRNl55gM76VM4/6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hUogllVR; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hUogllVR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0Jj0Mt9EH4D75+Lb1KtUBdDYExpnMn4wu6GPAkHpvmSDo+ZDP+RlRyztvXjubqwKqaFG4QMCTNoAyiLdHUxfuOM8/hqzHAkTFGpw2+lVWjCgtoihugL7j7s3E86KLlgTHtekOWavj3xsDCQSqo3HRpLY3HKXsmI+LuVdA3cx9FMsfCRHUFmCwNU0CGo6Z2SJfH2zqU6avbMeu3Caf0TZMVUoixdqC5W8l0/PdRlXCINnyjQ87BcNKzq4uwpfyvU3zNgWJ5pocgu3kr+AjDnj9xLDGfX3cZVsWywPFcsRfunMM9HecBYB89neMpDILU1qETC8O0HaY7OSoxR8NOMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iH4E7MEPpUdMJ8Aiv2MXye+vz8F2dscN+ZGe9dsr0UA=;
 b=URhK9z138cZKKpREmI1b0qZyz3YGj5t2oLE76zj3L/0iChDMNfZ5GZlL9/pO3+PFEwxm70Eiwkr5bBU6g4rajNt7vWBmc4oO9iPDhIllw6af4CmsKPwQF+hQPseM2u6SSd7FZfjYhVLwUc29cEsBtNP/grc73j/F74bDo+PHt3354eT/LAppuPCj6P2Uw5WYCd+vaxP+vtR/F9sbwblvil9iQVTRULSOrgp+ohQ4LyWW1Lt2bqNrp9yQNxJDyE3wK6w0dOxzAGkQw+NsaRPwz8Tb3CBV4Waij0Y0DDUryKKmyrmEB3zIKJpIFLIzPdWVoC97mhShN2cyzgzz4DjUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH4E7MEPpUdMJ8Aiv2MXye+vz8F2dscN+ZGe9dsr0UA=;
 b=hUogllVRs2EurXoaSNX+v1XRDiDX1MVrcd07aFSKOK6hkSmCWKJMFTyWCmRuJXLw4RzxpRBgmnCKf4O9rZzRWkkpFASrEeCgVtmguZzP3PhWCs+t5hRfqBsE2HOT43/wb/AV+Z+ZR3bmDfHtXK2A6yttQ+/4Um7MTsiUCVS11n/hODS1L8YROCl6huXgc2ZdSRwgGM+PJQq4KAO429FQE60Fv2RDxLkQM5cmqPN2ugybwwItnM74TYP6WQrH+7/26QmHq0VaA72rFBJtGlzv/ioEUCSDvS/G876CLXATqgUhrZC4AQ00vsKCN3ktPV62DF1p11S9kbwOCLe5L7WjfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10925.eurprd04.prod.outlook.com (2603:10a6:800:25b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:34:12 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 16:34:12 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
Subject: Re: [PATCH v2 0/5] Add i.MX91 9x9 QSB basic support
Message-Id: <177799884954.1491484.2064655187344600827.b4-ty@nxp.com>
Date: Tue, 05 May 2026 12:34:09 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SN7P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10925:EE_
X-MS-Office365-Filtering-Correlation-Id: bccda237-8e60-48d6-c465-08deaac4239b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|1800799024|366016|376014|52116014|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xsFza6ztyTfX76PIuwANS+qEBM9Gp++X1XHWlJ7R6rPAaCZRTiuBWQtKnnNwC47kIKGVvuGeXPBBGYwwgTGLckBUs5Ve/w5aMa2Qsqi3rWA+kkdI4Isl588U0LJsAP040tnHSRPs4jlU+tO5XmUXhUooNTGvptFF//xJdCsD9+ObCSvJKxg31p9XLEeonmy91DByrGDdYa4PamJiCgmX2if56Ax/ED4R2q9r7vbTCkzenuEb/uvv52w540MPDb/Cns9zefT7u2/81n7R8D3/auzWQR5qq1WUzlDUFBln31UYTlCT/Kp66TjZAQa1s7bUf50ySEvwfHZc0tkwQda6zHOzxbj0bJUH+KTF71ZoR3vBc93hqegCqFGGp4SjN/EnQOVrzP5fZiI8LOU3AGhe43kAD68e+h/vnMv7Y3UYHtI8CjAHUegQEUtctuFSUZcVYUblS7662Cprc0t3+wtprWNEOUGgKwGXj2pIXlE+bild9NLhZhhhGXo+2CGqSLkaXwWwrOC8j8nLpfwyCVtKb9buB/io/3lob4J4G8E757Y4QufrWeXar55Zmmzd4R5lsVPR/AKjg2+OvUFDZyZBZ/zvlHkUDTE8nxaWFN/0aC6N3UN6nAHZqrmeodlzeQYC3bxxjLESO/BimeYlotUqqIIlIGzSlnUG9WbuGATXydbkejGUmCYxpPy6Bv8N+RvxV9jYd3xuJK017upmLW+E5d+EMp6YXqqqjD5cUnjx8fxT6ThWq67D5Il6TrnbcLRYw1Ydn9NCufiRXOIuOy6Pqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(1800799024)(366016)(376014)(52116014)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1lNRFpxUHdOWTAydUN5Z201OExMUmtqK1BDTTFmUnpVam5rL0NZYkFmMEhB?=
 =?utf-8?B?d29pQTFyWlRWekRSbFVqSVVvU3d2YTF0V3FobFQrVWd5M2Nvc2RNSXZtOXcw?=
 =?utf-8?B?eW42ZmFIZTlqVVNIaXR6ZStNa2d2ZHM0VTE1SUhuSklERFB1TFRYU3VwUWk3?=
 =?utf-8?B?T3IxSVM2c2dkaEFWeG5JVTBiWWRJQUJkWFFQVFFaZXRQeHFFMWYyTnNyVXJL?=
 =?utf-8?B?MUJlY1hIY1BtTFJzMW5FYXhYazlxcFJpU2tWRTVxTEpkMjQ2N210ekU3L3lR?=
 =?utf-8?B?Mi9RN2ZFQkJBa0lTekpYWmhvMTllcHBHK2xRZklPWGJZL2xNc0sxSGpzR2U2?=
 =?utf-8?B?eW1aMEp5bmVLN3I0ZGhoV2M0QTRzcU1jZ2lXUXNSSzN5SFNTbmZKcW9JQlpR?=
 =?utf-8?B?L0JDWjVacnVXSVdNK0RvTXEzZVpXZUFJdjBIQ2habjhiM3dLZkZTanNjTTNO?=
 =?utf-8?B?SkVwaS84ZHI0ZlBSRklwcHRjd3FEYUsxdUdhYStYMGMzdXMwWk1rcU1VbFBo?=
 =?utf-8?B?UEgrYldGeEtnYXp6R3JrYWtOS3IyMWo3Z3Zoc2lVRGt2eEo5a2JCY2hsRWc0?=
 =?utf-8?B?TXhmQlF3SytFTHZybkdzRXZmOWorYUE0dnBjQ0I4Zk9vYmV0bDN3WTdENWs3?=
 =?utf-8?B?UEw3M3gycEZQNTJ1Ym5pRUlxUSswQ2pZdGp3MC9GOWZQYVVSb3llRGdFbmtw?=
 =?utf-8?B?ekZyNk5NYU1CcGtjSXZvaElXcVRwY1JHTlh1WWV2andrMWN5aXQ5Z3NwQ2xR?=
 =?utf-8?B?Y0hnSHJrbmd3d0pkM09UQzNLNzdpLzZVSWJNRHJ0cml1T2ttQ0lieWlOL2lm?=
 =?utf-8?B?RzBVQXNTVlR4ME5mdjE4QXpTUDNEeWdLT3FWQlIraitqNTRaMW5SQnlUR3R5?=
 =?utf-8?B?V05uVFFMc0NVY2lDeGNUYTBIc2VlUXNSUVluV055dEhEa0pjZmlmRzY4SWtI?=
 =?utf-8?B?bC9raDJZdUQyVUtlbmJvMlE1ZkdhbnBSZWExd0xMVFN0Si9TOHFOb3JwbC9S?=
 =?utf-8?B?SWZkMjMwVDhJa2RBclJwQmpPdDR0OTZqY1UyNkEzd2RFYkZPdjQ1N0RjNk9y?=
 =?utf-8?B?UDFKR0NJWG1OZms5TC95ZDFCVmlFRGlJWUtlN0RjbHNPQmVYNStHTWdPZFA4?=
 =?utf-8?B?dzFUeVlYS3JDTkYrRWMyTnRwcmZ3b3ZWQlhTc0lWWUZCQ1JTWjI1RVEzRG80?=
 =?utf-8?B?ZkRzY01uZjUyTXZ2V3hnanl5Ym4rbkZPTnAySitPTWp6dG9sUExuUzJ6VVpk?=
 =?utf-8?B?SDJ4UUVyaE5LWVRWSk5teUthSHNkUllXc2svNTlBYm5EYUFkL25jVXFIWmVq?=
 =?utf-8?B?bW9zdVdvK3hzTGxZMTdRMGJ4K2R5VmUzdzlqVnU2VE9nSS9WeGJ6Vmd0bDFM?=
 =?utf-8?B?ODJMTFFXK2FETDgxbHIrcWZJMVR4TjNmMGMxbjRURHBBTHV6NGVScS91UlBm?=
 =?utf-8?B?UWhzbndOYU9LY2ducnpHcVZaVUp1R05OL2FXRnY5b3h3WDFJZDlWVC9YNitI?=
 =?utf-8?B?NityaVV2MUFMSzVuVW54ZmdGdER3ejd4b2JtVWZ5Mngvb1A0MHlUeUh3NTFp?=
 =?utf-8?B?VThTd2pFbTg5VzVsZWNaYm5LWGJ3RFVWZGhpc0ZvZndHT0QzeWtFcHRyVlRC?=
 =?utf-8?B?VVdvUDAzbWdpL3ZUWndYY0F5QWtpNlNXSVhlckRhbHl3VllaQmFEZGZVajU5?=
 =?utf-8?B?bU1OMFkydWlaQk1JSFQ0d1RYOHd6RG8vbkk1S3JRR0hFUWx3bnhMajlqTFY1?=
 =?utf-8?B?bXJ2SzRXeXFXMU1NTm13bHhmTHlVdmZ1ZmIyM0VwcHhuSkoxVTVMcmFtNHoz?=
 =?utf-8?B?Y0l4Y2JWMDA3NjJyVzQySHROZ05GL01JSVBLSUduRlVnNjVOTHMzcUlBTHZ5?=
 =?utf-8?B?NDhuWjhhZGNzVFlxd09oQnFmS0RMMW9IYlJMZjBBNVo4aGMvUTJtL0VYRlJE?=
 =?utf-8?B?ZmpraEgzSkY2R0lSMGt4aHR0LzZ1bGxsdG9kM011aXBSTnBDc0IwVUVabW5X?=
 =?utf-8?B?cDRQODhNUy9sQjN1bU9QYmNYS3REVEFJOW9NMko3YzU0SkdnZEt4VkdERHhO?=
 =?utf-8?B?T3pXelJBTC9iYmZQemRmSGF0SWQwZXBvbE5PRFJCQi9BSGxVbFl0K05wZWhw?=
 =?utf-8?B?N0NMQ3d0OVlLYnFiSzFnRy9jbWxxaXFra2RMYkU4TXpKSGJOZUhNMVRrd1Z2?=
 =?utf-8?B?WjAvRWJiNXlCZU1ham85aHRlZ2JRL3c4RTNPTWNWR2NHUERKSzBVaHp4RFBL?=
 =?utf-8?B?Uml5SFdTbTlPQUdsZi9HRk1Jb2QwbVN4T0k4U3NEdnEzZ082Q2Q0SVFHL2I1?=
 =?utf-8?B?YWZCMjM3TjNrcmlhSlIxZlJpR0FzMWwzSlhiLzVEOXZRZ1RXa0xHQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccda237-8e60-48d6-c465-08deaac4239b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:34:12.4589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otkIZTh0oIQho7nNO/smr/T6dN5UbgSQTOn9440RHAUKsuwrZQxIo9yCRX2M+H86Iw39p3BgnbwIpI5tn2h6FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10925


On Thu, 26 Mar 2026 15:51:36 +0800, Joy Zou wrote:
> Add i.MX91 9x9 QSB basic support.
> 
> 

Applied, thanks!

[1/5] dt-bindings: arm: fsl: add i.MX91 9x9 QSB board
      commit: 78efc82d617fe7164e142c399cc20f7270ceeb82
[2/5] arm64: dts: imx91-11x11-evk: remove unused property clock-frequency from mdio node
      commit: 644f6a8f1fb368dbf017688c47b2f913c8d2d35b
[3/5] arm64: dts: imx93-11x11-evk: remove unused property clock-frequency from mdio node
      commit: dd4d83f8a6dfce2b21a4b81c837ad3fe941c9996
[4/5] arm64: dts: imx93-9x9-qsb: remove unused property clock-frequency from mdio node
      commit: 88b82b5d2c066271a0e8ecb4ab7e38d56b19f059
[5/5] arm64: dts: freescale: add i.MX91 9x9 QSB basic support
      commit: c64e79096d225454a56830ec1fb5e5a464939073

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

