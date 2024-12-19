Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2002253EB
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734615233; cv=fail; b=HUQMKQcRzUlsgO8WbtUsZvVK5VK8OgQWD9O8pDF9vwhYyO+Ug20mYlbrexzPe4+KCkVhdyKcTUcuiXLRWO0DruC2+PSfmjAIkS1fvD8RtTE3NODmwZ+0KMPBye3rBifpdV3ev0HdiR5T5/fhy1cA7zVcSRsQv0M188f34xKKG0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734615233; c=relaxed/simple;
	bh=G35evSFW+rPtqODxz4pjLI2IX9pmRdlAfzoyAILTke8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t2Th1+xdvgmfxXg3FVPsaFnN9f1igt/d1kSAAW421GRd05oGhS0px+HTW/hBRTOZPFl0UW3m4HpMUCMNIvDSkCnW3aV7rBXBsRNWK1LL0Smm3aOkEZJiwmjPfiWivY5HPXtCSk0T0/cQJ0M/Pp7R9wxRWT5NmrTq3lV1yrr8tX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DVNp6COV; arc=fail smtp.client-ip=40.107.20.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DVNp6COV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKRY8e+6NItiAEqrqzIn32K8PNu2aPlY13O6BZ5+ghCSNsF+iT+5K+fx5BtUUNJXZaicyekMRDuiaEBjxKuJaAmSVPoBkDWQsxeqXCRzvJfJITgTC1wQpxK/u7x43+QCR/jWNpwYcfPib1/OaqKbIaS3eaDwGjI/KiuWgqbxSVSJhti89Mvf7AH0AkpJllJ/NclsPTvRUiybQ+KwOpmSHY/AVIAZQA+s22x75Kc/eRgQdPZed24fKC614D89DZQYQ24b3rBpHMgJzFFnNhMHq6s70xrF2efmgrq1MtKVb6vTq7ba2fjEuUfVCLzG0x41j35M/aUWNGAVmywmw+4K1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxXI30d9wpW5/u2bSBk64wjtQjM3kSqg51v8qMan0DA=;
 b=HKPLG0txhubs6IAwgV6YF/xA3OWqVQ0n9i2OweHEbaGKPwygAjPp1ou0B8DcrbPy3E28u9Z282HKRitkF+t7j4sWcDussRErwXp2TGVdwNH9xNcvhN2oONxxuMgdcHOMjgw0lPTlZp8vHB+IU6cEL201v9f0k+HP3fzhyC1DcMVS0l25VRJJFoQlC3n2xB3tRk6Qo05wrlEDaL1EVdJnCHonvMK5gWCShhzEjIsrutMiL8bBR8AVEDw/iUDtOkfalvYH64qwA56ucjmBgjl0DvVgycjJCHfgGlrBgQRyBTXt/J1qCHjjboG3GPGDgF1uVymKSX/DICXABwoFiO4tQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxXI30d9wpW5/u2bSBk64wjtQjM3kSqg51v8qMan0DA=;
 b=DVNp6COV+oE1rx/1IhKuTpVFIYwHkVk/Co5x0nHSi+bJ787Xf/bwbL5VCb4Tre43HV1O5RgX7IIEH+NkxfwKt5IUc6R1VpGjd+obMMuTBIuzzw/tMcz3udSMRVlPIv+paL4WFUmD1VJeCSQisc9aNklFutcDeyybRL3JIfQDGuNecO4kktJfE7AWobsObXXbEhIJc0A41yQpNAoe67TpUeQD7b4jN8Zngdu+lXo8c39wrQ3tME8gfXGtPK/YygpBwfhbSwSjBJ1K6NUn3R4/8RvvzBuDcAOHlYr0kHCpQ9gjphQfnIjPfk2aTLdF8tEOQceQMJsabYazMAnV1qw+dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 13:33:47 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 13:33:47 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 20 Dec 2024 00:27:26 +0530
Subject: [PATCH v11 5/5] firmware: imx: adds miscdev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-imx-se-if-v11-5-0c7e65d7ae7b@nxp.com>
References: <20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com>
In-Reply-To: <20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734634652; l=39237;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=G35evSFW+rPtqODxz4pjLI2IX9pmRdlAfzoyAILTke8=;
 b=0kIfRr29rFSgonf/KsSLxBOlmHhBfYwrfwtSmcNd6l3qbV6BPHx2AsZaFjtcIMhfYKR0ZVDov
 4cNsfwF+09wBgmX8WMfcWxkp5zEPdp2ZJxBRY4LSMSbM8isD7BNg6Di
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: b8029a6a-5336-4a71-7ff1-08dd2031c43c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TThwa3dnL0xHaEYvVTE3ZUZDa1RtejF5UGZIUkRXd2IxdHBDOWFhQXJpb2lx?=
 =?utf-8?B?VDc5UzJ3b3A2QnJLeFFPSTR4anN3QmRkbDE4RU9YeXArOW1rNzlLRUkzcGFE?=
 =?utf-8?B?Ty9oZ2dUbFBzdlg3ZHJXaE40aElQWGs0NEtXUm1sb1B4Sm8wdDNoM25jMmxj?=
 =?utf-8?B?MDhVMHZnaFg0SjZoZDk3ODZpaUZ5V1hkS1pwQzdxcmhTVERCdE9keDZxbGkr?=
 =?utf-8?B?Q3BZekYzeUZ1ZGI0V01JQjBseEQrcXJLeTdPeFpuL0E1VGw0UEs2UllPZFcr?=
 =?utf-8?B?UzQ2WDJYRk1qSmoxMXE0UmZkWkZwNTZFelRCbkd4QkpHWGh5cHo0bDNoMXNC?=
 =?utf-8?B?c3pRejBPMUNNdU84ekJ1eThiSmNkTFpqV1E2dkVxZEhGSUJZMHFwc0RjQ1hr?=
 =?utf-8?B?SW9LRHcyM1U2WVFJS1krT1N1bW5IS1lSaGUxOUUzRGdpMWFsSTU3TGNJamFC?=
 =?utf-8?B?bnQ0aGJoVU51eDdDOHU2WTNlU2FXRW9jRlI2aXo0amh0VUt5NDhpL3ZQazNs?=
 =?utf-8?B?UjkwaXVZNkNlUEppSkU4RDhHWlJ3L2dvenE4eHJjdlQ1UnJENCtUZXd1WWV0?=
 =?utf-8?B?Mkx6S3VpcitMMTNiNjJqZzdIeXd1TldSdHZBdDR1akJIYmkvTzVsYm5ZTHgx?=
 =?utf-8?B?a1BGKzJPemRxYUpKa0N4SEpka0pPU0pvT1ZNYU14U0lJNkNVejNOWGFZdDNC?=
 =?utf-8?B?MWJCL29TN3pmQ3NGcmprRnVaMXNSZkpSYlNqZTlCb205OFJTWjNxYldpMHpt?=
 =?utf-8?B?RWdhTWtLQ1ZQbmI3bU8rSW9BdDQwby9rbWpnQTgyQVJ0alhHczY1dEs4eHlv?=
 =?utf-8?B?VU44anZvTEp4QmU0Wi94RC9QZ09Vc292a3dkbnY3TThqOGJidXkwWGZPclVK?=
 =?utf-8?B?WEx4V2FydHF0ODloNTVHTWg4Q3NJU3FhS2taMWdtUGdScUxIdmR4c1BLTUp5?=
 =?utf-8?B?SWY3RVF5dE43ckNxMUdBZDgrWWFTUzMzemVPcVRqVS94ZTh6OXNGTnJURFA4?=
 =?utf-8?B?bFRVNjRuTXBYRUZNa1ZFVTR0UWF2SklHYjZRcFdmZlNPUmVHVEZoeTd5cU13?=
 =?utf-8?B?dks1b1ZUTmhibE41OFdyL3RJQ2VJbW4vQVVrRTRqb2FVL1kweWxHdzh4TnhM?=
 =?utf-8?B?ODROaHZ5OTJxUHNMb2MwZDhxNzdjY0MwRFlXSUQ5ZEFoN0tzRk1mV1J2cFp0?=
 =?utf-8?B?aDVGcEczdmdOUlY1cGhqOE9BcXZTalJ5VmRoT2MvK3NWM0ErSGZ4OEVkMXZk?=
 =?utf-8?B?RXFCMW9pVDJwSVZoTVlDdVJaaExXNkVFQWxZMUJaL0s3TGtPZy9Xb0ZJa3Uz?=
 =?utf-8?B?Uk1ZYjdwS0FmaVJDT2xWYVd1bmNjVlhYQnZKRmxXSCtBWXZQZXFRR1A2SDdO?=
 =?utf-8?B?YndyYVFHb3VWak1qUUFydXFJTkxKeEwzdUhxRDFvZDE0SFl4VnJJUHRyeVl3?=
 =?utf-8?B?MmI3NmwwN05RWkplMFR2UVMxcm1vTDBBQUppTjlJSDJRVC93ZHc4UkFFMS9o?=
 =?utf-8?B?Yzc1L3JFYlBTdkdOb1V3RmY3VjRMSmpLRHYrdXJxakMvVXpxSWVMTTcwR0pJ?=
 =?utf-8?B?Y0R2U0hDTTBvSXBlVTI1dStsYmxHaXZwbHowK3FWRlR4VURVZjNwU2hCNlpN?=
 =?utf-8?B?Q0t6UktVMFZhVFN4VUdvV3JKQWc3NE9DVHVJbXBMaENJMERzVTlSa1RTR3VQ?=
 =?utf-8?B?bE5KNFB4KzJOdDRqNEx4NG1XZWZxVUZBc0JwWGU0S053eEpaalA4SUJ5cFRo?=
 =?utf-8?B?anhLVHB2RVR4ekhWYTc0dU5KYWtHMW1uMUxUcjdJdzExdjBjckpFdXlSM2NC?=
 =?utf-8?B?bndFWkJSbHpIUk9ldTVNeEQwMVlmQXZKUXE5dzVBQS9TL1VZaVhrbzBUSjhP?=
 =?utf-8?B?MG4xcDBreVFUejZXbm5sUHEyQ2JqdjIyWVRkTUFkaGdpSHBYc0VCblBmTUZz?=
 =?utf-8?Q?+Z5fCUkK7G5iCCf6PCRJV2JsvZ2esLfF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2FKL1ZBL1VJbjFIWCtocTg4VzU0ejRFalZkcGdKL3VqOVRmU0p1YlNMVDVi?=
 =?utf-8?B?TzVlOEZHeEFSVlM1aFhSb25EZFJFOHNaTnJzZWhzUjVPZzF2WDFYeXNZRElF?=
 =?utf-8?B?RDBaQzlHNzA1bnp3VCt0V0FmOVROcGtXcmhrTnVEZXlvUkxRN1A4c2xIMHJF?=
 =?utf-8?B?SHprSmN5RzB3WWJvOFpEVC8wVURNNjErL0g0cUxkSitCVnA4dmhaZU5uNCtZ?=
 =?utf-8?B?L1A3R20zc25VS2F6bFdscmNndk1FT0NYY2UzbGlid0lwQWlNSVlMeWNqdzFt?=
 =?utf-8?B?Ly84cnV3OGREeXR5RDgvS1FiSFFVWUN3YXJZL29uc20rOERRQTB3cGRnUW5B?=
 =?utf-8?B?K0daUlVNaGd4N1Q1WFI4V2FKejNaV2hIMURBaWFETjFaZ0JtMzZYc0dYbklr?=
 =?utf-8?B?MmkwNnFORnhIOVRWdFV5dWl3aTJwOFppRzNmaFBkZ2dwSUtGL3pmQVFyTmY5?=
 =?utf-8?B?UnlDelNmSnhrYjZLR3Fta0xaRVdqbUJORUZza3pSSmJqODdZNzZwYkhIeTZ2?=
 =?utf-8?B?OGRIQnZzQnVIUGczQ1NrTjB4V1ArTlIwRUg0enpYejBrK3Npc25Gb0Y4cUt6?=
 =?utf-8?B?UFNHb1QxSWNSR0h1RkdVNWwxTmVOR0o4WEdyQlhxTndBZ3dzNTFMUzJlTmZB?=
 =?utf-8?B?Q3lYUHlzMno5UGdXck10Z1hOYjJaVEUyazBDbWJaNFQrNGl3ZEVzbUhFd2RH?=
 =?utf-8?B?TTNEbVVlNzFwRzVydnZhTzgyY1Vud05vQm9pOHFVV3l0Q2ZPN2o4cnRCUmxh?=
 =?utf-8?B?a0IrM0QzOXdpLzFENzdrK2NOS0l1YVFvWFZzRGQwRUFteUxFb2s1OC9LdnpD?=
 =?utf-8?B?RmpOWGdMdG5yR0RkQUExbDd1K0lJclg1dlY3V2lTQ1lObytxUEdlWCs2K3lo?=
 =?utf-8?B?ZzRYZEJFVmR2QW8vNVpseEF2SHIydC9wR0dBcVB3R2NlTGxaZnRneDJLczZk?=
 =?utf-8?B?ZThvRStRMlp0OFY1T21sd2x1LzBjcTJUYlRXWVhzWml5amNCMkFWNHp3MzdP?=
 =?utf-8?B?UHMvQThmU1FjSnN2WndHa2cxQWdZRlNmQU1ReXZGNzNUK052TjZyVmdZS0g0?=
 =?utf-8?B?OU5QZ1l1NkZEWXB5R1cwcHpMaTk0VG5hd0xZODZTY0RpdXFobFJCRnRlY3J5?=
 =?utf-8?B?WFowRUt6bUpXYWRRZ0lkVUZNU0xUWkNSRTB0ZWlQSmQyTmVUK2ZtdkFzWGov?=
 =?utf-8?B?eFg2bEZlcXhpbTh2N2ZXSngrUXVTa0I2MURKOGpVNW5NYXg0dDZIRWcvM0tB?=
 =?utf-8?B?YlIzSHQyYU1Qd1Qzc2xPdHBoWlhYTEhQajFEQm9WMFNuRzJPakF5OExyd041?=
 =?utf-8?B?NG90SVZ6R2h3eStVQWtueXJFNGN5WlJzR1c0T2tObGsxSGNCb1B6cWhaM0di?=
 =?utf-8?B?dWFPS25JRGwrTXdtTkVaa1A3L1FLYmhSTkx5cjE1Z2FKdDI5NlRGTGVNRWVU?=
 =?utf-8?B?ZWtyelRtdldyYzBNTmdBa0FCeU1veVYxcHlFR1JSMDZqWmNhUDh3bmZ3U3hq?=
 =?utf-8?B?c2NsdWF4a3QzZTN1eERoUGErRFBaYjVXY3FWR1h2MlhiVlBZbDRmOUJjeGkr?=
 =?utf-8?B?ME9TWEJvU3drdTlMZGRqb29BWnRIZzFMQmJWNVlCSzhkalUzU2FtRkFuakIr?=
 =?utf-8?B?cEtkNlJyYjBaU1N4NDd0L3UveXlkRnBhL2FoTTFHUmhkQzVNME9QTjFNalF4?=
 =?utf-8?B?d3paTlZaL000WmpjcUFrQTFpWk5tdWVjcnE0UXo4WnJpemljUmRoRWlUSkR0?=
 =?utf-8?B?SytVeENLZnQyQlczYldKbnVDVGxEaEYxdGdrOVRwbHRTM0NuVlR5S1k0eDEx?=
 =?utf-8?B?UjhSNGRDSlFOYnZSMUZrSmdIL2NBNGRnbjEwNnVIRmIrVFB4QUJ1bEVNNXNv?=
 =?utf-8?B?MVByQ3pSSkJacnRvVkJWTXk1N1ZzYjdseXRhV2hqT29ldzBGVURNRmJvdldo?=
 =?utf-8?B?d0l3Qy9uTkNvMzh2SlZOVzBBcFJsK2hkYjcvbVlsSnVldk12ODAwUHc3T0sv?=
 =?utf-8?B?RnFYR2tEekpTS21WbVhPRWdXOFd4QjFyNnR6clZjRVBYSy9YM3dGdVQ4c0l2?=
 =?utf-8?B?SUNDMVUvb3dzdktCdy9Cd1AwdnZyeWRQc2cxRVVZcURGb01vYlFBTENkTXNV?=
 =?utf-8?Q?0fmfVl7xelD3+7oVxUnPfTIRU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8029a6a-5336-4a71-7ff1-08dd2031c43c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 13:33:47.6186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/zukncH5odH0rlEpd4m1iyLhEfpERlzRyfIlkuBnKojrQXY20Y0c4eANEWSqJtsFkbEwnTINWMZdtV15N/QIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919

Adds the driver for communication interface to secure-enclave,
for exchanging messages with NXP secure enclave HW IP(s) like
EdgeLock Enclave from:
- User-Space Applications via character driver.

ABI documentation for the NXP secure-enclave driver.

User-space library using this driver:
- i.MX Secure Enclave library:
  -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
- i.MX Secure Middle-Ware:
  -- URL: https://github.com/nxp-imx/imx-smw.git

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 Documentation/ABI/testing/se-cdev   |  43 ++
 drivers/firmware/imx/ele_base_msg.c |   8 +-
 drivers/firmware/imx/ele_common.c   |  85 ++--
 drivers/firmware/imx/ele_common.h   |   6 +-
 drivers/firmware/imx/se_ctrl.c      | 791 +++++++++++++++++++++++++++++++++++-
 drivers/firmware/imx/se_ctrl.h      |  42 ++
 include/uapi/linux/se_ioctl.h       | 101 +++++
 7 files changed, 1041 insertions(+), 35 deletions(-)

diff --git a/Documentation/ABI/testing/se-cdev b/Documentation/ABI/testing/se-cdev
new file mode 100644
index 000000000000..3451c909ccc4
--- /dev/null
+++ b/Documentation/ABI/testing/se-cdev
@@ -0,0 +1,43 @@
+What:		/dev/<se>_mu[0-9]+_ch[0-9]+
+Date:		May 2024
+KernelVersion:	6.8
+Contact:	linux-imx@nxp.com, pankaj.gupta@nxp.com
+Description:
+		NXP offers multiple hardware IP(s) for secure enclaves like EdgeLock-
+		Enclave(ELE), SECO. The character device file descriptors
+		/dev/<se>_mu*_ch* are the interface between userspace NXP's secure-
+		enclave shared library and the kernel driver.
+
+		The ioctl(2)-based ABI is defined and documented in
+		[include]<linux/firmware/imx/ele_mu_ioctl.h>.
+		ioctl(s) are used primarily for:
+			- shared memory management
+			- allocation of I/O buffers
+			- getting mu info
+			- setting a dev-ctx as receiver to receive all the commands from FW
+			- getting SoC info
+			- send command and receive command response
+
+		The following file operations are supported:
+
+		open(2)
+		  Currently the only useful flags are O_RDWR.
+
+		read(2)
+		  Every read() from the opened character device context is waiting on
+		  wait_event_interruptible, that gets set by the registered mailbox callback
+		  function, indicating a message received from the firmware on message-
+		  unit.
+
+		write(2)
+		  Every write() to the opened character device context needs to acquire
+		  mailbox_lock before sending message on to the message unit.
+
+		close(2)
+		  Stops and frees up the I/O contexts that were associated
+		  with the file descriptor.
+
+Users:		https://github.com/nxp-imx/imx-secure-enclave.git,
+		https://github.com/nxp-imx/imx-smw.git
+		crypto/skcipher,
+		drivers/nvmem/imx-ocotp-ele.c
diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index aa00e95d6aee..ff9a39530fa9 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -67,7 +67,7 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_GET_INFO_REQ_MSG_SZ,
 			       rx_msg,
@@ -139,7 +139,7 @@ int ele_ping(struct se_if_priv *priv)
 		goto exit;
 	}
 
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_PING_REQ_SZ,
 			       rx_msg,
@@ -194,7 +194,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	tx_msg->data[3] = lower_32_bits(addr);
 	tx_msg->data[4] = se_add_msg_crc((uint32_t *)&tx_msg[0],
 						 ELE_SERVICE_SWAP_REQ_MSG_SZ);
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg,
@@ -255,7 +255,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t addr)
 	tx_msg->data[0] = lower_32_bits(addr);
 	tx_msg->data[2] = addr;
 
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_FW_AUTH_REQ_SZ,
 			       rx_msg,
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 923eaa90cdd4..acabbccf3e36 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -18,38 +18,62 @@ u32 se_add_msg_crc(u32 *msg, u32 msg_len)
 	return crc;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv,
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx,
 		struct se_clbk_handle *se_clbk_hdl)
 {
-	int err = 0;
+	struct se_if_priv *priv = dev_ctx->priv;
+	bool wait_timeout_enabled = true;
+	unsigned int wait;
+	int err;
 
 	do {
-		/* If callback is executed before entrying to wait state,
-		 * it will immediately come out after entering the wait state,
-		 * but completion_done(&se_clbk_hdl->done), will return false
-		 * after exiting the wait state, with err = 0.
-		 */
-		err = wait_for_completion_interruptible(&se_clbk_hdl->done);
+		if (priv->cmd_receiver_clbk_hdl.dev_ctx == dev_ctx) {
+			/* For NVM-D that are slaves of SE-FW, are waiting indefinitly
+			 * to receive the command from SE-FW.
+			 */
+			wait_timeout_enabled = false;
+
+			/* If callback is executed before entrying to wait state,
+			 * it will immediately come out after entering the wait state,
+			 * but completion_done(&se_clbk_hdl->done), will return false
+			 * after exiting the wait state, with err = 0.
+			 */
+			err = wait_for_completion_interruptible(&se_clbk_hdl->done);
+		} else {
+			/* FW must send the message response to application in a finite
+			 * time.
+			 */
+			wait = msecs_to_jiffies(10000);
+			err = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, wait);
+		}
 		if (err == -ERESTARTSYS) {
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
+			if (priv->waiting_rsp_clbk_hdl.dev_ctx) {
 				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
 				continue;
 			}
-			dev_err(priv->dev,
-				"Err[0x%x]:Interrupted by signal.\n",
-				err);
 			err = -EINTR;
 			break;
 		}
-	} while (err != 0);
+		if (err == 0) {
+			if (wait_timeout_enabled) {
+				err = -ETIMEDOUT;
+				dev_err(priv->dev,
+					"Fatal Error: SE interface: %s%d, hangs indefinitely.\n",
+					get_se_if_name(priv->if_defs->se_if_type),
+					priv->if_defs->se_instance_id);
+			}
+			break;
+		}
+	} while (err < 0);
 
-	return err ? err : se_clbk_hdl->rx_msg_sz;
+	return (err >= 0) ? se_clbk_hdl->rx_msg_sz : err;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	struct se_msg_hdr *header;
 	int err;
 
@@ -62,7 +86,8 @@ int ele_msg_send(struct se_if_priv *priv,
 	if (header->size << 2 != tx_msg_sz) {
 		err = -EINVAL;
 		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			dev_ctx->devname,
 			*(u32 *)header,
 			header->size << 2, tx_msg_sz);
 		goto exit;
@@ -70,7 +95,9 @@ int ele_msg_send(struct se_if_priv *priv,
 
 	err = mbox_send_message(priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(priv->dev,
+			"%s: Error: mbox_send_message failure.",
+			dev_ctx->devname);
 		return err;
 	}
 	err = tx_msg_sz;
@@ -80,32 +107,36 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv,
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx,
 		     void *tx_msg,
 		     int tx_msg_sz,
 		     void *rx_msg,
 		     int exp_rx_msg_sz)
 {
 	int err;
+	struct se_if_priv *priv = dev_ctx->priv;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0)
 		goto exit;
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		err = -EINTR;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
 		dev_err(priv->dev,
-			"Err[0x%x]:Interrupted by signal.\n",
+			"%s: Err[0x%x]:Interrupted by signal.\n",
+			dev_ctx->devname,
 			err);
 	}
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 
 exit:
 	return err;
@@ -152,7 +183,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		dev_dbg(dev,
-			"Selecting cmd receiver for mesg header:0x%x.",
+			"Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,
 			*(u32 *) header);
 
 		/* Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -161,7 +193,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 */
 		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname,
 				*(u32 *) header,
 				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
@@ -172,13 +205,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
 		dev_dbg(dev,
-			"Selecting resp waiter for mesg header:0x%x.",
+			"Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,
 			*(u32 *) header);
 
 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz
 				&& !exception_for_size(priv, header)) {
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname,
 				*(u32 *) header,
 				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 3d8b6f83fb9d..9bded800c103 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -14,12 +14,12 @@
 #define IMX_ELE_FW_DIR                 "imx/ele/"
 
 uint32_t se_add_msg_crc(uint32_t *msg, uint32_t msg_len);
-int ele_msg_rcv(struct se_if_priv *priv,
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx,
 		struct se_clbk_handle *se_clbk_hdl);
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz);
-int ele_msg_send_rcv(struct se_if_priv *priv,
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx,
 		     void *tx_msg,
 		     int tx_msg_sz,
 		     void *rx_msg,
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 7260a9f93e06..ae90538af390 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
+#include <uapi/linux/se_ioctl.h>
 
 #include "ele_base_msg.h"
 #include "ele_common.h"
@@ -31,8 +32,6 @@
 #define MAX_SOC_INFO_DATA_SZ		256
 #define MBOX_TX_NAME			"tx"
 #define MBOX_RX_NAME			"rx"
-#define SE_TYPE_STR_HSM			"hsm"
-#define SE_TYPE_ID_HSM			0x2
 
 struct se_fw_img_name {
 	const u8 *prim_fw_nm_in_rfs;
@@ -140,6 +139,25 @@ static const struct of_device_id se_match[] = {
 	{},
 };
 
+char *get_se_if_name(u8 se_if_id)
+{
+	switch (se_if_id) {
+	case SE_TYPE_ID_DBG: return SE_TYPE_STR_DBG;
+	case SE_TYPE_ID_HSM: return SE_TYPE_STR_HSM;
+	}
+
+	return NULL;
+}
+
+static uint32_t get_se_soc_id(struct se_if_priv *priv)
+{
+        const struct se_if_node_info_list *info_list
+                        = device_get_match_data(priv->dev);
+
+        return info_list->soc_id;
+
+}
+
 static int se_soc_info(struct se_if_priv *priv)
 {
 	const struct se_if_node_info_list *info_list
@@ -300,6 +318,756 @@ static int se_load_firmware(struct se_if_priv *priv)
 	return ret;
 }
 
+static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
+
+	/*
+	 * Allocate some memory for data exchanges with S40x.
+	 * This will be used for data not requiring secure memory.
+	 */
+	se_shared_mem_mgmt->non_secure_mem.ptr
+			= dma_alloc_coherent(priv->dev,
+					     MAX_DATA_SIZE_PER_USER,
+					     &se_shared_mem_mgmt->non_secure_mem.dma_addr,
+					     GFP_KERNEL);
+	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
+		return -ENOMEM;
+
+	se_shared_mem_mgmt->non_secure_mem.size = MAX_DATA_SIZE_PER_USER;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+
+	return 0;
+}
+
+static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	/* Unmap secure memory shared buffer. */
+	if (se_shared_mem_mgmt->secure_mem.ptr)
+		devm_iounmap(priv->dev,
+				(void __iomem *)se_shared_mem_mgmt->secure_mem.ptr);
+
+	se_shared_mem_mgmt->secure_mem.ptr = NULL;
+	se_shared_mem_mgmt->secure_mem.dma_addr = 0;
+	se_shared_mem_mgmt->secure_mem.size = 0;
+	se_shared_mem_mgmt->secure_mem.pos = 0;
+
+	/* Free non-secure shared buffer. */
+	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+			  se_shared_mem_mgmt->non_secure_mem.ptr,
+			  se_shared_mem_mgmt->non_secure_mem.dma_addr);
+
+	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
+	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
+	se_shared_mem_mgmt->non_secure_mem.size = 0;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+/* Need to copy the output data to user-device context.
+ */
+static int se_dev_ctx_cpy_out_data(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc, *temp;
+	bool do_cpy = true;
+
+	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->pending_out, link) {
+		if (b_desc->usr_buf_ptr && b_desc->shared_buf_ptr && do_cpy) {
+
+			dev_dbg(priv->dev,
+				"Copying output data to user.");
+			if (do_cpy && copy_to_user(b_desc->usr_buf_ptr,
+					 b_desc->shared_buf_ptr,
+					 b_desc->size)) {
+				dev_err(priv->dev,
+					"Failure copying output data to user.");
+				do_cpy = false;
+			}
+		}
+
+		if (b_desc->shared_buf_ptr)
+			memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+
+	return do_cpy ? 0 : -EFAULT;
+}
+
+/*
+ * Clean the used Shared Memory space,
+ * whether its Input Data copied from user buffers, or
+ * Data received from FW.
+ */
+static void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct list_head *pending_lists[] = {&se_shared_mem_mgmt->pending_in,
+						&se_shared_mem_mgmt->pending_out};
+	struct se_buf_desc *b_desc, *temp;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		list_for_each_entry_safe(b_desc, temp,
+					 pending_lists[i], link) {
+
+			if (b_desc->shared_buf_ptr)
+				memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+			list_del(&b_desc->link);
+			kfree(b_desc);
+		}
+	}
+	se_shared_mem_mgmt->secure_mem.pos = 0;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+static int add_b_desc_to_pending_list(void *shared_ptr_with_pos,
+			       struct se_ioctl_setup_iobuf *io,
+			       struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_buf_desc *b_desc = NULL;
+
+	b_desc = kzalloc(sizeof(*b_desc), GFP_KERNEL);
+	if (!b_desc)
+		return -ENOMEM;
+
+	b_desc->shared_buf_ptr = shared_ptr_with_pos;
+	b_desc->usr_buf_ptr = io->user_buf;
+	b_desc->size = io->length;
+
+	if (io->flags & SE_IO_BUF_FLAGS_IS_INPUT) {
+		/*
+		 * buffer is input:
+		 * add an entry in the "pending input buffers" list so
+		 * that copied data can be cleaned from shared memory
+		 * later.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_in);
+	} else {
+		/*
+		 * buffer is output:
+		 * add an entry in the "pending out buffers" list so data
+		 * can be copied to user space when receiving Secure-Enclave
+		 * response.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_out);
+	}
+
+	return 0;
+}
+
+/* interface for managed res to unregister a character device */
+static void if_misc_deregister(void *miscdevice)
+{
+	misc_deregister(miscdevice);
+}
+
+static int init_device_context(struct se_if_priv *priv, int ch_id,
+			struct se_if_device_ctx **new_dev_ctx,
+			const struct file_operations *se_if_fops)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	if (ch_id)
+		dev_ctx = kzalloc(sizeof(*dev_ctx), GFP_KERNEL);
+	else
+		dev_ctx = devm_kzalloc(priv->dev, sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx) {
+		ret = -ENOMEM;
+		return ret;
+	}
+
+	dev_ctx->priv = priv;
+
+	if (ch_id)
+		dev_ctx->devname = kasprintf(GFP_KERNEL, "%s%d_ch%d",
+					     get_se_if_name(priv->if_defs->se_if_type),
+					     priv->if_defs->se_instance_id,
+					     ch_id);
+	else
+		dev_ctx->devname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s%d_ch%d",
+					     get_se_if_name(priv->if_defs->se_if_type),
+					     priv->if_defs->se_instance_id,
+					     ch_id);
+	if (!dev_ctx->devname) {
+		ret = -ENOMEM;
+		if (ch_id)
+			kfree(dev_ctx);
+
+		return ret;
+	}
+
+	mutex_init(&dev_ctx->fops_lock);
+
+	*new_dev_ctx = dev_ctx;
+
+	if (ch_id) {
+		list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
+		priv->active_devctx_count++;
+
+		ret = init_se_shared_mem(dev_ctx);
+		if (ret < 0) {
+			kfree(dev_ctx->devname);
+			kfree(dev_ctx);
+			*new_dev_ctx = NULL;
+			return ret;
+		}
+
+		return ret;
+	}
+
+	/* Only for ch_id = 0:
+	 * - register the misc device.
+	 * - add action
+	 */
+	dev_ctx->miscdev = devm_kzalloc(priv->dev, sizeof(*dev_ctx->miscdev), GFP_KERNEL);
+	if (!dev_ctx->miscdev) {
+		ret = -ENOMEM;
+		*new_dev_ctx = NULL;
+		return ret;
+	}
+
+	dev_ctx->miscdev->name = dev_ctx->devname;
+	dev_ctx->miscdev->minor = MISC_DYNAMIC_MINOR;
+	dev_ctx->miscdev->fops = se_if_fops;
+	dev_ctx->miscdev->parent = priv->dev;
+	ret = misc_register(dev_ctx->miscdev);
+	if (ret) {
+		dev_err(priv->dev, "failed to register misc device %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = devm_add_action(priv->dev, if_misc_deregister,
+			      dev_ctx->miscdev);
+	if (ret) {
+		dev_err(priv->dev,
+			"failed[%d] to add action to the misc-dev\n",
+			ret);
+		misc_deregister(dev_ctx->miscdev);
+	}
+
+	return ret;
+}
+
+static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
+					    u64 arg)
+{
+	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_api_msg *rx_msg __free(kfree) = NULL;
+	int err = 0;
+
+	if (copy_from_user(&cmd_snd_rcv_rsp_info, (u8 __user *)arg,
+			   sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy cmd_snd_rcv_rsp_info from user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+
+	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
+		dev_err(priv->dev,
+			"%s: User buffer too small(%d < %d)\n",
+			dev_ctx->devname,
+			cmd_snd_rcv_rsp_info.tx_buf_sz,
+			SE_MU_HDR_SZ);
+		err = -ENOSPC;
+		goto exit;
+	}
+
+	rx_msg = kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
+	if (!rx_msg) {
+		err = -ENOMEM;
+		goto exit;
+	}
+
+	tx_msg = memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
+			     cmd_snd_rcv_rsp_info.tx_buf_sz);
+	if (IS_ERR(tx_msg)) {
+		err = PTR_ERR(tx_msg);
+		goto exit;
+	}
+
+	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
+		err = -EINVAL;
+		goto exit;
+	}
+
+	if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
+		!get_load_fw_instance(priv)->is_fw_loaded) {
+		err = se_load_firmware(priv);
+		if (err) {
+			dev_err(priv->dev, "Could not send the message as FW is not loaded.");
+			err = -EPERM;
+			goto exit;
+		}
+	}
+	err = ele_msg_send_rcv(dev_ctx,
+			       tx_msg,
+			       cmd_snd_rcv_rsp_info.tx_buf_sz,
+			       rx_msg,
+			       cmd_snd_rcv_rsp_info.rx_buf_sz);
+	if (err < 0)
+		goto exit;
+
+	dev_dbg(priv->dev,
+		"%s: %s %s\n",
+		dev_ctx->devname,
+		__func__,
+		"message received, start transmit to user");
+
+	/* We may need to copy the output data to user before
+	 * delivering the completion message.
+	 */
+	err = se_dev_ctx_cpy_out_data(dev_ctx);
+	if (err < 0)
+		goto exit;
+
+	/* Copy data from the buffer */
+	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
+			     rx_msg,
+			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
+
+	if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
+			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
+		dev_err(priv->dev,
+			"%s: Failed to copy to user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+exit:
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	if (copy_to_user((void __user *)arg, &cmd_snd_rcv_rsp_info,
+			 sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy cmd_snd_rcv_rsp_info from user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
+				u64 arg)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_if_node_info *info;
+	struct se_ioctl_get_if_info if_info;
+	int err = 0;
+
+	info = container_of(priv->if_defs, typeof(*info), if_defs);
+
+	if_info.se_if_id = 0;
+	if_info.interrupt_idx = 0;
+	if_info.tz = 0;
+	if_info.did = info->se_if_did;
+	if_info.cmd_tag = priv->if_defs->cmd_tag;
+	if_info.rsp_tag = priv->if_defs->rsp_tag;
+	if_info.success_tag = priv->if_defs->success_tag;
+	if_info.base_api_ver = priv->if_defs->base_api_ver;
+	if_info.fw_api_ver = priv->if_defs->fw_api_ver;
+
+	dev_dbg(priv->dev,
+		"%s: info [se_if_id: %d, irq_idx: %d, tz: 0x%x, did: 0x%x]\n",
+			dev_ctx->devname,
+			if_info.se_if_id, if_info.interrupt_idx,
+			if_info.tz, if_info.did);
+
+	if (copy_to_user((u8 __user *)arg, &if_info, sizeof(if_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy mu info to user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+
+exit:
+	return err;
+}
+
+/*
+ * Copy a buffer of data to/from the user and return the address to use in
+ * messages
+ */
+static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
+					u64 arg)
+{
+	struct se_shared_mem *shared_mem = NULL;
+	struct se_ioctl_setup_iobuf io = {0};
+	int err = 0;
+	u32 pos;
+
+	if (copy_from_user(&io, (u8 __user *)arg, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev,
+			"%s: Failed copy iobuf config from user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+
+	dev_dbg(dev_ctx->priv->dev,
+		"%s: io [buf: %p(%d) flag: %x]\n",
+		dev_ctx->devname,
+		io.user_buf, io.length, io.flags);
+
+	if (io.length == 0 || !io.user_buf) {
+		/*
+		 * Accept NULL pointers since some buffers are optional
+		 * in FW commands. In this case we should return 0 as
+		 * pointer to be embedded into the message.
+		 * Skip all data copy part of code below.
+		 */
+		io.ele_addr = 0;
+		goto copy;
+	}
+
+	/* No specific requirement for this buffer. */
+	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
+
+	/* Check there is enough space in the shared memory. */
+	dev_dbg(dev_ctx->priv->dev,
+		"%s: req_size = %d, max_size= %d, curr_pos = %d",
+		dev_ctx->devname,
+		round_up(io.length, 8u),
+		shared_mem->size, shared_mem->pos);
+
+	if (shared_mem->size < shared_mem->pos ||
+		round_up(io.length, 8u) > (shared_mem->size - shared_mem->pos)) {
+		dev_err(dev_ctx->priv->dev,
+			"%s: Not enough space in shared memory\n",
+			dev_ctx->devname);
+		err = -ENOMEM;
+		goto exit;
+	}
+
+	/* Allocate space in shared memory. 8 bytes aligned. */
+	pos = shared_mem->pos;
+	shared_mem->pos += round_up(io.length, 8u);
+	io.ele_addr = (u64)shared_mem->dma_addr + pos;
+
+	memset(shared_mem->ptr + pos, 0, io.length);
+	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
+	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
+		/*
+		 * buffer is input:
+		 * copy data from user space to this allocated buffer.
+		 */
+		if (copy_from_user(shared_mem->ptr + pos, io.user_buf,
+				   io.length)) {
+			dev_err(dev_ctx->priv->dev,
+				"%s: Failed copy data to shared memory\n",
+				dev_ctx->devname);
+			err = -EFAULT;
+			goto exit;
+		}
+	}
+
+	err = add_b_desc_to_pending_list(shared_mem->ptr + pos,
+					 &io,
+					 dev_ctx);
+	if (err < 0)
+		dev_err(dev_ctx->priv->dev,
+			"%s: Failed to allocate/link b_desc.",
+			dev_ctx->devname);
+
+copy:
+	/* Provide the EdgeLock Enclave address to user space only if success.*/
+	if (copy_to_user((u8 __user *)arg, &io, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev,
+			"%s: Failed to copy iobuff setup to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+exit:
+	return err;
+}
+
+/* IOCTL to provide SoC information */
+static int se_ioctl_get_se_soc_info_handler(struct se_if_device_ctx *dev_ctx,
+					     u64 arg)
+{
+	struct se_ioctl_get_soc_info soc_info;
+	int err = -EINVAL;
+
+	soc_info.soc_id = get_se_soc_id(dev_ctx->priv);
+	soc_info.soc_rev = var_se_info.soc_rev;
+
+	err = (int)copy_to_user((u8 __user *)arg, (u8 *)(&soc_info), sizeof(soc_info));
+	if (err) {
+		dev_err(dev_ctx->priv->dev,
+			"%s: Failed to copy soc info to user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+
+exit:
+	return err;
+}
+
+/*
+ * File operations for user-space
+ */
+
+/* Write a message to the MU. */
+static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
+				size_t size, loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_api_msg *tx_msg __free(kfree) = NULL;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	dev_dbg(priv->dev,
+		"%s: write from buf (%p)%zu, ppos=%lld\n",
+		dev_ctx->devname,
+		buf, size, ((ppos) ? *ppos : 0));
+
+	if (mutex_lock_interruptible(&dev_ctx->fops_lock))
+		return -EBUSY;
+
+	if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+		err = -EINVAL;
+		goto exit;
+	}
+
+	if (size < SE_MU_HDR_SZ) {
+		dev_err(priv->dev,
+			"%s: User buffer too small(%zu < %d)\n",
+			dev_ctx->devname,
+			size, SE_MU_HDR_SZ);
+		err = -ENOSPC;
+		goto exit;
+	}
+
+	tx_msg = memdup_user(buf, size);
+	if (IS_ERR(tx_msg)) {
+		err = PTR_ERR(tx_msg);
+		goto exit;
+	}
+
+	print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
+			     tx_msg, size, false);
+
+	err = ele_msg_send(dev_ctx, tx_msg, size);
+	if (err < 0)
+		goto exit;
+exit:
+	mutex_unlock(&dev_ctx->fops_lock);
+	return err;
+}
+
+/*
+ * Read a message from the MU.
+ * Blocking until a message is available.
+ */
+static ssize_t se_if_fops_read(struct file *fp, char __user *buf,
+			       size_t size, loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	dev_dbg(priv->dev,
+		"%s: read to buf %p(%zu), ppos=%lld\n",
+		dev_ctx->devname,
+		buf, size, ((ppos) ? *ppos : 0));
+
+	if (mutex_lock_interruptible(&dev_ctx->fops_lock))
+		return -EBUSY;
+
+	if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+		err = -EINVAL;
+		goto exit;
+	}
+
+	err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
+	if (err < 0) {
+		dev_err(priv->dev,
+			"%s: Err[0x%x]:Interrupted by signal.\n",
+			dev_ctx->devname, err);
+		dev_dbg(priv->dev,
+			"Current active dev-ctx count = %d.\n",
+			dev_ctx->priv->active_devctx_count);
+		goto exit;
+	}
+
+	/* We may need to copy the output data to user before
+	 * delivering the completion message.
+	 */
+	err = se_dev_ctx_cpy_out_data(dev_ctx);
+	if (err < 0)
+		goto exit;
+
+	/* Copy data from the buffer */
+	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
+			     priv->cmd_receiver_clbk_hdl.rx_msg,
+			     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
+			     false);
+
+	if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg,
+			 priv->cmd_receiver_clbk_hdl.rx_msg_sz)) {
+		dev_err(priv->dev,
+			"%s: Failed to copy to user\n",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+	err = priv->cmd_receiver_clbk_hdl.rx_msg_sz;
+exit:
+	priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
+
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	mutex_unlock(&dev_ctx->fops_lock);
+	return err;
+}
+
+/* Open a character device. */
+static int se_if_fops_open(struct inode *nd, struct file *fp)
+{
+	struct miscdevice *miscdev = fp->private_data;
+	struct se_if_priv *priv = dev_get_drvdata(miscdev->parent);
+	struct se_if_device_ctx *misc_dev_ctx = priv->priv_dev_ctx;
+	struct se_if_device_ctx *dev_ctx;
+	int err = 0;
+
+	if (mutex_lock_interruptible(&misc_dev_ctx->fops_lock))
+		return -EBUSY;
+
+	priv->dev_ctx_mono_count++;
+	err = init_device_context(priv,
+				  priv->dev_ctx_mono_count ?
+					priv->dev_ctx_mono_count
+					: priv->dev_ctx_mono_count++,
+				  &dev_ctx, NULL);
+	if (err) {
+		dev_err(priv->dev,
+			"Failed[0x%x] to create device contexts.\n",
+			err);
+		goto exit;
+	}
+
+	fp->private_data = dev_ctx;
+
+exit:
+	mutex_unlock(&misc_dev_ctx->fops_lock);
+	return err;
+}
+
+/* Close a character device. */
+static int se_if_fops_close(struct inode *nd, struct file *fp)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	if (mutex_lock_interruptible(&dev_ctx->fops_lock))
+		return -EBUSY;
+
+	/* check if this device was registered as command receiver. */
+	if (priv->cmd_receiver_clbk_hdl.dev_ctx == dev_ctx) {
+		priv->cmd_receiver_clbk_hdl.dev_ctx = NULL;
+		kfree(priv->cmd_receiver_clbk_hdl.rx_msg);
+		priv->cmd_receiver_clbk_hdl.rx_msg = NULL;
+	}
+
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+	cleanup_se_shared_mem(dev_ctx);
+
+	priv->active_devctx_count--;
+	list_del(&dev_ctx->link);
+
+	mutex_unlock(&dev_ctx->fops_lock);
+	kfree(dev_ctx->devname);
+	kfree(dev_ctx);
+
+	return 0;
+}
+
+/* IOCTL entry point of a character device */
+static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	/* Prevent race during change of device context */
+	if (mutex_lock_interruptible(&dev_ctx->fops_lock))
+		return -EBUSY;
+
+	switch (cmd) {
+	case SE_IOCTL_ENABLE_CMD_RCV:
+		if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
+				priv->cmd_receiver_clbk_hdl.rx_msg
+					= kzalloc(MAX_NVM_MSG_LEN,
+						  GFP_KERNEL);
+				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
+					err = -ENOMEM;
+					break;
+				}
+			}
+			priv->cmd_receiver_clbk_hdl.rx_msg_sz = MAX_NVM_MSG_LEN;
+			priv->cmd_receiver_clbk_hdl.dev_ctx = dev_ctx;
+			err = 0;
+		} else {
+			err = -EBUSY;
+		}
+		break;
+	case SE_IOCTL_GET_MU_INFO:
+		err = se_ioctl_get_mu_info(dev_ctx, arg);
+		break;
+	case SE_IOCTL_SETUP_IOBUF:
+		err = se_ioctl_setup_iobuf_handler(dev_ctx, arg);
+		break;
+	case SE_IOCTL_GET_SOC_INFO:
+		err = se_ioctl_get_se_soc_info_handler(dev_ctx, arg);
+		break;
+	case SE_IOCTL_CMD_SEND_RCV_RSP:
+		err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, arg);
+		break;
+	default:
+		err = -EINVAL;
+		dev_dbg(priv->dev,
+			"%s: IOCTL %.8x not supported\n",
+			dev_ctx->devname,
+			cmd);
+	}
+
+	mutex_unlock(&dev_ctx->fops_lock);
+
+	return (long)err;
+}
+
+/* Char driver setup */
+static const struct file_operations se_if_fops = {
+	.open		= se_if_fops_open,
+	.owner		= THIS_MODULE,
+	.release	= se_if_fops_close,
+	.unlocked_ioctl = se_ioctl,
+	.read		= se_if_fops_read,
+	.write		= se_if_fops_write,
+};
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -335,6 +1103,7 @@ static int se_if_request_channel(struct device *dev,
 
 static void se_if_probe_cleanup(void *plat_dev)
 {
+	struct se_if_device_ctx *dev_ctx, *t_dev_ctx;
 	struct platform_device *pdev = plat_dev;
 	struct device *dev = &pdev->dev;
 	struct se_fw_load_info *load_fw;
@@ -359,6 +1128,13 @@ static void se_if_probe_cleanup(void *plat_dev)
 		load_fw->imem.buf = NULL;
 	}
 
+	if (priv->dev_ctx_mono_count) {
+		list_for_each_entry_safe(dev_ctx, t_dev_ctx, &priv->dev_ctx_list, link) {
+			list_del(&dev_ctx->link);
+			priv->active_devctx_count--;
+		}
+	}
+
 	/* No need to check, if reserved memory is allocated
 	 * before calling for its release. Or clearing the
 	 * un-set bit.
@@ -442,6 +1218,7 @@ static int se_if_probe(struct platform_device *pdev)
 			goto exit;
 		}
 	}
+	INIT_LIST_HEAD(&priv->dev_ctx_list);
 
 	if (info->reserved_dma_ranges) {
 		ret = of_reserved_mem_device_init(dev);
@@ -453,6 +1230,14 @@ static int se_if_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = init_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
+	if (ret) {
+		dev_err(dev,
+			"Failed[0x%x] to create device contexts.\n",
+			ret);
+		goto exit;
+	}
+
 	if (info->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = se_soc_info(priv);
 		if (ret) {
@@ -471,7 +1256,7 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->is_fw_loaded = false;
 	}
 	dev_info(dev, "i.MX secure-enclave: %s%d interface to firmware, configured.\n",
-			SE_TYPE_STR_HSM,
+			get_se_if_name(priv->if_defs->se_if_type),
 			priv->if_defs->se_instance_id);
 	return ret;
 
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 12c201b503b1..91a2f084b1f4 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -13,6 +13,7 @@
 #define MAX_FW_LOAD_RETRIES		50
 
 #define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_DATA_SIZE_PER_USER		(65 * 1024)
 #define MAX_NVM_MSG_LEN			(256)
 #define MESSAGING_VERSION_6		0x6
 #define MESSAGING_VERSION_7		0x7
@@ -31,6 +32,7 @@
 struct se_clbk_handle {
 	struct completion done;
 	bool signal_rcvd;
+	struct se_if_device_ctx *dev_ctx;
 	u32 rx_msg_sz;
 	/* Assignment of the rx_msg buffer to held till the
 	 * received content as part callback function, is copied.
@@ -45,6 +47,40 @@ struct se_imem_buf {
 	u32 state;
 };
 
+struct se_buf_desc {
+	u8 *shared_buf_ptr;
+	void __user *usr_buf_ptr;
+	u32 size;
+	struct list_head link;
+};
+
+struct se_shared_mem {
+	dma_addr_t dma_addr;
+	u32 size;
+	u32 pos;
+	u8 *ptr;
+};
+
+struct se_shared_mem_mgmt_info {
+	struct list_head pending_in;
+	struct list_head pending_out;
+
+	struct se_shared_mem secure_mem;
+	struct se_shared_mem non_secure_mem;
+};
+
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	struct miscdevice *miscdev;
+	const char *devname;
+
+	struct mutex fops_lock;
+
+	struct se_shared_mem_mgmt_info se_shared_mem_mgmt;
+	struct list_head link;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -89,6 +125,12 @@ struct se_if_priv {
 
 	struct gen_pool *mem_pool;
 	const struct se_if_defines *if_defs;
+
+	struct se_if_device_ctx *priv_dev_ctx;
+	struct list_head dev_ctx_list;
+	u32 active_devctx_count;
+	u32 dev_ctx_mono_count;
 };
 
+char *get_se_if_name(u8 se_if_id);
 #endif
diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
new file mode 100644
index 000000000000..5cf3d56734f4
--- /dev/null
+++ b/include/uapi/linux/se_ioctl.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause*/
+/*
+ * Copyright 2024 NXP
+ */
+
+#ifndef SE_IOCTL_H
+#define SE_IOCTL_H
+
+#include <linux/types.h>
+
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+#define SE_TYPE_ID_UNKWN		0x0
+#define SE_TYPE_ID_DBG			0x1
+#define SE_TYPE_ID_HSM			0x2
+/* IOCTL definitions. */
+
+struct se_ioctl_setup_iobuf {
+	void __user *user_buf;
+	__u32 length;
+	__u32 flags;
+	__u64 ele_addr;
+};
+
+struct se_ioctl_shared_mem_cfg {
+	__u32 base_offset;
+	__u32 size;
+};
+
+struct se_ioctl_get_if_info {
+	__u8 se_if_id;
+	__u8 interrupt_idx;
+	__u8 tz;
+	__u8 did;
+	__u8 cmd_tag;
+	__u8 rsp_tag;
+	__u8 success_tag;
+	__u8 base_api_ver;
+	__u8 fw_api_ver;
+};
+
+struct se_ioctl_cmd_snd_rcv_rsp_info {
+	__u32 __user *tx_buf;
+	int tx_buf_sz;
+	__u32 __user *rx_buf;
+	int rx_buf_sz;
+};
+
+struct se_ioctl_get_soc_info {
+	__u16 soc_id;
+	__u16 soc_rev;
+};
+
+/* IO Buffer Flags */
+#define SE_IO_BUF_FLAGS_IS_OUTPUT	(0x00u)
+#define SE_IO_BUF_FLAGS_IS_INPUT	(0x01u)
+#define SE_IO_BUF_FLAGS_USE_SEC_MEM	(0x02u)
+#define SE_IO_BUF_FLAGS_USE_SHORT_ADDR	(0x04u)
+#define SE_IO_BUF_FLAGS_IS_IN_OUT	(0x10u)
+
+/* IOCTLS */
+#define SE_IOCTL			0x0A /* like MISC_MAJOR. */
+
+/*
+ * ioctl to designated the current fd as logical-reciever.
+ * This is ioctl is send when the nvm-daemon, a slave to the
+ * firmware is started by the user.
+ */
+#define SE_IOCTL_ENABLE_CMD_RCV	_IO(SE_IOCTL, 0x01)
+
+/*
+ * ioctl to get the buffer allocated from the memory, which is shared
+ * between kernel and FW.
+ * Post allocation, the kernel tagged the allocated memory with:
+ *  Output
+ *  Input
+ *  Input-Output
+ *  Short address
+ *  Secure-memory
+ */
+#define SE_IOCTL_SETUP_IOBUF	_IOWR(SE_IOCTL, 0x03, \
+					struct se_ioctl_setup_iobuf)
+
+/*
+ * ioctl to get the mu information, that is used to exchange message
+ * with FW, from user-spaced.
+ */
+#define SE_IOCTL_GET_MU_INFO	_IOR(SE_IOCTL, 0x04, \
+					struct se_ioctl_get_if_info)
+/*
+ * ioctl to get SoC Info from user-space.
+ */
+#define SE_IOCTL_GET_SOC_INFO      _IOR(SE_IOCTL, 0x06, \
+					struct se_ioctl_get_soc_info)
+
+/*
+ * ioctl to send command and receive response from user-space.
+ */
+#define SE_IOCTL_CMD_SEND_RCV_RSP _IOWR(SE_IOCTL, 0x07, \
+					struct se_ioctl_cmd_snd_rcv_rsp_info)
+#endif

-- 
2.34.1

