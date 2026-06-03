Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ADE1474CC
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 18:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780509807; cv=fail; b=kT3/GFzOqAmhYzPxShtWO95j/9tSROCdA+mQgx+x0j3hn/MyyajXgtxC5/CcGKiAcqYY4ZxbDfDIFVncXmQqyZda1/ry1lWttcOj1pvcMfe91BoPD7N8h8cxRZdapK46cvyNXs4OuMUtjqH3u/Ed8ZMR9Q11yNOexdNz1PPXDhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780509807; c=relaxed/simple;
	bh=cqb4q0S3uXKbP36ho3R5I6mFU7jXgewtTgF5On6CyVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AuSc4glA7RBSgur4FV7hYnjBHQVN46OLDtWRfiHx1NEl15YPUS6Ajv4Q/dAdV0PxKzQDdNnG80lTdtiMKimKVTrJSHofadpy+GGknmK8v88ISWZZ8XU7piyX4zv4UHeui5RaxEFVIic4q1v/HGh+TBGvWfoPEDX5En/Q+3uHD5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q88hB1FX; arc=fail smtp.client-ip=52.101.65.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q88hB1FX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwmR4XZW32bc4KU5qIeSEmBGcIYAGa24RqdWVojpWDfvHDfUh9j0U1XlBt2eRyNJdskDmjf0kD1PDeQW4sNUlXjo7EXar0Kos5qW/CPie8VgzoNRQqlpn4rCGGI8sMw5lRq+tV6SmuEZBgzjjsVLOWRNnt6Nsk/FWxSHpZnQvYaiVYqOp98CPjPBMNdKRPrktD4q641K9dFIbPffN93tU8fnjSGUv1XMjbJwWWT8cDaUDXnVoSsYeuxmmxgZG4USWgtgVhzlw6Beqw0GWyUT7k0aR5m2vh6aP7ydYExoXmkJvFT/VOoYUqfgYqfKG3F0L8E/xcnOgPaGYp37asfj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13P7YHxg/mku6Uo59uEDP4B8lcGCSGxzrmDjOgaw2Vo=;
 b=fdQRNU6ydBKYjo6Tn8xKXJ57CXvjYYwlTiSgKQ+QtuP9yJW6Na0zOus7GGTRYJWbeqd41QxlTsAk9HJtio/OXmtqkr2cyj5/Ni+rg4VTjmJC0cQdfRBi6W0RuJYBPEAWo3lQkRvTYa2UxbiRxIHqXCw3kXWAhPOCkMIMxrVK5z2qdcPubd2ZqDI0UAlZME74+JbC4vmLZiDAbcbfT2c62mObcxSo2G7fv4yCytAWMdmDZmRlx1l9xyy1Yut0JF6y4Zb2cF3GQHVhR518akw73kWgQqGslHzTs769pcJ+D2BJ9lAETUzChP6M+AVuQ/Dqth+qxW4JvfeSZvikZtt1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13P7YHxg/mku6Uo59uEDP4B8lcGCSGxzrmDjOgaw2Vo=;
 b=q88hB1FXoetg/PQJhSS/gArUJyNLIgcZM72SkMDAXjaVHVacT/hHYWhGrGfxcMF3F6t9PsSpJixo0msX+SypnDBA/ksJ/3gs4YVaZ6zAPA71J9Fl0zLGL2qCR/oH8Ew63bxFQ9ei20WHy+kpis6ACfrn/ZUpDdjBO1OEGpgSRfBx81BjEsOxiz1mx0L9T715xqgaZ0TMezgZCJNTuGqpYutJz+zrXdyxCId8QuvHWx85rgkf+Dk1uBqGsz/YibHywtlcwtLi7RVmbAzDNLShZPoFHIxPCmQvCu5krIUuZKlW4rx2zs4eUVUKL03FPxSPmyIBG+IFHQmqWzoLVajeZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9967.eurprd04.prod.outlook.com (2603:10a6:10:4dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:03:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:03:21 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-som-symphony: fix RGB_SEL handling
Date: Wed,  3 Jun 2026 14:03:13 -0400
Message-ID: <178050978998.2666928.308593257375905265.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529134850.22196-1-stefano.r@variscite.com>
References: <20260529134850.22196-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR15CA0010.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d2e420-de41-472b-52c7-08dec19a6617
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 fz6rW1LmsQkUEExuu3y63bBCL+wXqUZecIOKVHBsFA1HJxjn5+LVk2efNIPEF6D25FmsEIrqXTE3Y7wl3DttKPb42fN602h8k/PQErXpIATUbVDaL2HnXwUvMdF/mujniklkEP1uEkoPe4I53brg1MghqN/tnfGLy4jHPHQ/GETU7Piygg6LX8JtewBcsy4DgZj/srX6ayIRny4MntQJFpxLg3un6r7hoGI3HFY8dNb1rbersCo4mMZLwRVCEQuFYbfLFq7wQ5gFyBzoKNGKK/6Wu2PJlc0xaHfYbQF6NML/PE9htnZhqowaoIf2zVNQB9zADPUZmQY3xfCogyYk/hrWaXZRdG2L6gnJ47Lie0HfWGgxkmpe32ptVi0ow/lNM5qqQ6roXucm/Fbzg+0MGRl10usibdk9zd99F5MH+nDlr3wYoG2DlZmKCLdZim2y4TrIiapdxYFj11zk6rwEoWzQ25rWJfEce7Dmmc4Pt4BWgZj8oS5Dva+fyqglNImv31o+CD2T6F7xfT+6gsqN4uTE/x0sBWc7PsManIHDMxmSpDvmaS3qExPgOeXDJ2/zKeJSA41qb0eW/XRmWsx3KFm7Juux1Ppol4/sNCVYUgODCiGYdt1n9dqEqSa1a05zuAdMiTmk5dGassL6zrkXmOekM/JpFZCmssRXoarEfKoqBA32/kkPLMiFFAC/WAdm
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q0xQZDNzUHVWWXlVWkNYclhKa0JZOW14UC90OGQ0MXVhZTJQUHlvRHJmYkts?=
 =?utf-8?B?TjNHVEVHWVpmSnl2UXpoUjNyMVhWV3pNVnRCK0hvNW1zWFJpcnlONHZPT2FK?=
 =?utf-8?B?eWZIdXNRSWdBUGRocFNyK012dHFwTTExeEVJbmRhTFlEeDRDTThZTGcxVURh?=
 =?utf-8?B?dnp1SUQ4WmdYT1BkYjlsZEt5c29FOWU4a21qUGNrTEJJZW5HOUNvd2hzTEw4?=
 =?utf-8?B?SXpjZm82Q25jYW5wU3RJK3Q1dDNiY3FoUFMrMytsbWQvdlJKZVNMTTRVeUVv?=
 =?utf-8?B?OWp0YzhFQ0I2L1RSMkhka0d6ZlRYamtEcTV4RmZDNFYvaVBYbTMxWFJnb1Yv?=
 =?utf-8?B?TzFhOHBrOGs5TkJWTGZkWDNUeFFuQmtHQ0FUaGFwSVo5aVF2bEQ0ZHRuTDNq?=
 =?utf-8?B?MnVocVlLQmM5WEFuSFhETDFVSkxjYmZlbEVKUW9ZTFZ0aWdTZitoZkNGR2s1?=
 =?utf-8?B?T1BUZk9aMjdIQjNMWlZVV1FzVFpVSC84UGs4WGpXcXNTTDFTTmdISUxBbmU5?=
 =?utf-8?B?MWM1WmUzaDduR1pmbzVKVU1naXg2SGg3K0VxdVdWeUZ3c1BUcGw4MTUyZU5v?=
 =?utf-8?B?dDBnMk5NQXQrb04xU3kzci9Pei9kNGpxU2lQbHhYaXVIenhWeFp5ZXFNcHBn?=
 =?utf-8?B?QTBZTmdpbzNPRXE2NVRkU3BvREZpM3JMTzdSTVpLYUNNVExYZ0Y0aEJJTCtG?=
 =?utf-8?B?TkcwcXdidG5RVDlmMEhaMGU5YzdlS2pFMElnSGRURVVNU2tMajBUaFRMcElv?=
 =?utf-8?B?ZFhNZlRtOE9Ub1VVeWY2TmFxeHJxS3ByV3VwaW5hem9nRDR1VmViUUFnZkhF?=
 =?utf-8?B?QVVjRXFFYm4vL1czam1QdWp2V01MVWR3M0puRWZ0alQrRlVtTXU3K08rb1Iw?=
 =?utf-8?B?OHFBbVhKMHM4NXVHeW44L0grQzFHT2lxUlZlWWU1TWdrRUQwN2Zmb1lLUmNU?=
 =?utf-8?B?OWZydEtQS1NFZThDRkY4WmRXblZlVStJQXB3QTc2MmduZ2tGaEpnaDdnWW9U?=
 =?utf-8?B?TlA3N2lDZ0xCS21GU2ZHZFVvUnBvdTVqMGVuREp3cjV1dDNRTGJGRXZVWDdq?=
 =?utf-8?B?UlRQdERRR2FVQzh6R1lDUitzR0RVQjBPSEdISWkwb21HNGdpUGdJUDRSZm1S?=
 =?utf-8?B?M1ZWMVQxMkFQR1lSdmlRQ2R2YUR0NjdBZ0M5WkRld2J3NlJGUXhKT0JkZkEw?=
 =?utf-8?B?TGdYaVlrd1k5UWV2ZGVKcktUNldyUFo2a0MrbXhrY0gzMHppVGdJd2ZZYVZx?=
 =?utf-8?B?TjNtSWxzMTdrc1MyeXJuTlpxakFrbExRcnVXY2dCczBLUDFnWHo5RjRsaktl?=
 =?utf-8?B?bUtuSmZUSUhoZHVTKzVMUWZpaUU2YTk1Y3hSQ091Z2I5R3dOZkRVMExzZHFM?=
 =?utf-8?B?dzJlc1VkcG1tL200ViswdTZJMGtoRVhCT1Ewd0xZWmN2TlJPcDBzOGY5U2Vo?=
 =?utf-8?B?YnpSeGo2N1NzVlFadEFuUWVXTjVRb1FxZkFUN2J5b3luQ2drTUdGUFlldFFM?=
 =?utf-8?B?ZUlsZzNiRjdqYlg0Q3hRZmNaV3RFZGhVV1pOdlJmMENmVlFWSnRoS3pNclQv?=
 =?utf-8?B?UmhLMm05WkVpMml6VldHelJQZnVRVm55SjJnWUQrZFBja3ZVdVg2QXhQV016?=
 =?utf-8?B?ZEJ2MlJoV1Zhb1lDZjl2Nm5Yblh6NFlGbjVFSjdJUmlVQnpMTm80bHFSci93?=
 =?utf-8?B?UVY0b2xDa2ZNRVRzUkJjY3FhbkVQbWRKTVBPOVlyaFFmcm5oYThvY09pNCt6?=
 =?utf-8?B?Z1RnTDhuNFdiV2lIZ0JWb0duejRabUVwdFlRQjdKdTc3T25iTHMvaVZBNWZk?=
 =?utf-8?B?NnBmcjl4SVl1alpDdW1ZeDFkM2xYUzlyKzRLVkxhUFZBWWFFYWtWbTlTTmtV?=
 =?utf-8?B?Y3kxNVphL0FNNk5zdCtCR1hONDE3dXpHMHo1ekJtbVo3YVhrUXNLSnNGb1hr?=
 =?utf-8?B?ZHdaWUowaGZlbEZxYWJPeXFqTldzR1JyVzlOckQxYWZkbTdJWHdWTXI0QlRH?=
 =?utf-8?B?b0FYZXdkbWRtQ1VKeDIvby9IZmkxK1NpVVdUZ1VpS1VURjhKQXRIODcySUs2?=
 =?utf-8?B?U2NJWnZVYk4vbCtvbjVPVkhQeXd2TGFLZTdNL0lVaXdCTUxEaWRPRTFlN0Yy?=
 =?utf-8?B?T0VKTE1ZMmxvV0wrUGQ4WGZ5MEtIVXNBdEZEdHFJa29Ndmk1MWNIcGtMSVBB?=
 =?utf-8?B?MUY0T21HRkVXRks2Vm9GT2w2SktZWUZId0phN2ZYU3dWQyt6WHQrbFhwY1Y1?=
 =?utf-8?B?WDZGVi9hYkt6R05IaXZ3K3NtYnBtRk1YMWRmVkxIbzlyN0dhWGNzY29SVlpD?=
 =?utf-8?B?T2lwaWg1YVRkMmlJZm5TdGdhNWM0ZGVSaW41akltZlkreStVSXM2TzNXdzlN?=
 =?utf-8?Q?UHqopHCXtY8RTPCo=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d2e420-de41-472b-52c7-08dec19a6617
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:03:21.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UapdOsWfhjP4OO4eODUgKjf0jWKHELV4X7J8JMEWS058jMwRnisR3+3SoRER7FwVr66ZM8B7vJmUObH1sn1I2VhK8SjOSkHg/x0q6wXg9MXhGV8tSK2cUtfU5VCVLJwB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9967

From: Frank Li <Frank.Li@nxp.com>


On Fri, 29 May 2026 15:48:50 +0200, Stefano Radaelli wrote:
> RGB_SEL is a board-level signal driven by the PCAL6408 GPIO expander on
> the Symphony carrier board.
> 
> The signal needs to be driven high on the i.MX91 variant to keep the
> board in the expected display configuration. Move the handling of this
> line from a fixed regulator tied to the PCAL6408 supply to a GPIO hog on
> the correct GPIO expander.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx91-var-som-symphony: fix RGB_SEL handling
      commit: b3801c6dd15f9dfebeba25b2308dd5143016d52d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
