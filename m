Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2259222575
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 13:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734615217; cv=fail; b=JWHmDbA8hLSYFx+fAhFI5az06gmlSLN0e8g7alRsDuHUFYHNUhKBoEnSTAWBNNZK+SMpUpyR99kiXeW18U00Mk2K/VJzYDbvXBVpMmNI+xalILoO7X0Nlblypn84izHb56KoWnzew1OfFGcPLLyKxw8Bflo1w8Yj11dWoBKf6Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734615217; c=relaxed/simple;
	bh=8bCTvi7AgU4MQ5HET0AOHmcMvn388Mh4NN86zRFZhtg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=a+T85ossPpx0JdqO7dWthcffQFjPzYiNQDMuWEg3zaOUW7qNOAXRKEFgtziX0B54a5UgArvClafVgTHUpz4d+WdyjE3qbrk+FTI+uC7SmRJy3x4Tvt+jRoixEqZ6HZaOI6I22cu3Nc8gbUPklGn7Mvr/EH//ioBFOFHFMCFAebA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SOQuAKs3; arc=fail smtp.client-ip=40.107.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SOQuAKs3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CD45as02TCU/t4b0rpJobTAk+1hzYJB7i/PKC6Ae/WiA0PFWsEZpvqYulTJCIUn4upZXy2RryhPSa5Lwi0wpu+HAwTb7mS7GL7T/gYMIoBfvNR0ug9CzTHaX7d0IxHlfIbruXzI+Ddq/5G2VdK1kGNcxh4KjYDGfZEEVOTkKGE9p+3PGUAJjFsCkvSLd+kjEAWU8/fI95XXiI1foP5iAkKVhOE6kMNMGW/Dn9nq4yCNrVKSQl87wbfchcZCNWsUXIQZrdGheKS/jMcp0PmJ0sx5cG/pzRGXsjlHyG+OHN3AhIU3Xxg1fJg4O4SQXAYVha1Wy4JgW068yAJQj/UCYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZoRgTn45yJn+Pnp3LFTUwhkGYSMYn5cLf7fH4YbYkY=;
 b=AFD7datj2AjtgaXUnEle2kwN3NfF9t8ZTh6Fvqf9/HulO229Bk/GxsrJaNy7Fd4+gQcJZhbJYpPO2Pum5DtSUn5zIDwU6UV07BDEVmgVk0NYHQZYULh/m5mxbUMWu+XWvpMfHBBV7iYiclwu0SQuOVLF/NN7H09ec7z3Y+7a5Y80kSv6n5cisV8TKsGabUOiTwsS2YeR+vyNpIee+zKMfNJEXbRpUORX9vwfg31aCDPHIhUhEB3KlkpBuys3VNjkGgDBV5Z5Ij1GuBsCUMLeHj2tx+aegYZDpgdmWcd9dNa5Efcb6EmccWeF0fVNoLEAfXklYIcuB3a8WcJGJqzoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZoRgTn45yJn+Pnp3LFTUwhkGYSMYn5cLf7fH4YbYkY=;
 b=SOQuAKs3rZzFRO1v8C6Bw0zbcf/v9XnbXP/sAFtosAcIt9UpHYYapyBTx61/jPRej9eslLA4yxeXu8pD6YZDvARmwQWty6uaFK4C3l7Zbfxfr9epKODlfbUiTH+2l6uwutl43xAop8hv1BkpsrKkzznbMFxfuKnIvBXtf/AJ9b0gwPpYDDh70L8qlwROkuW6BVCg4hRFTnbhlEbe19WKpKfXkgYvFq63I9GbsjlriEiJ/tmRdXPIAXUwPVevN/LS48F4BL9TaSaGYpyTw9u5KfewyZYq2KT3v9EYnUFF2FW/2YyAYO59a0xwYUb8Jbcz0Bgt1+KBoh12BIPZYGxEYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 13:33:32 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 13:33:32 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 20 Dec 2024 00:27:23 +0530
Subject: [PATCH v11 2/5] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-imx-se-if-v11-2-0c7e65d7ae7b@nxp.com>
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
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734634652; l=3191;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=8bCTvi7AgU4MQ5HET0AOHmcMvn388Mh4NN86zRFZhtg=;
 b=VAJYddXTAlOSyd4TLOYji985bpJz92SwYQb77PtfJVTetaNBhq40OQZF8vG5i2wKGtQdlUcNC
 z42rHmmlCZYDSEhy0knJ62WFnAODEsZLVWrhhNUEktorezdatYVHj4O
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
X-MS-Office365-Filtering-Correlation-Id: e7fa9c80-2c5f-4775-6f28-08dd2031bb3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RENoVEk1Y05VUFVwa2NIbmpNd3BGWFVUZUw3UEFFV1Vja3pxRUV0T1h6RFll?=
 =?utf-8?B?a3JzU1NDRGM3MW1rSXZ3VEZ0MjZyUXhCZGRLcm5TbWJHSTMvVTcxN3gvSU93?=
 =?utf-8?B?bnE4V0FDMHpsMEFORGNxT2hlcEVFQjZEdlVhQmc4QktNSzViWEtXbHpiMmQr?=
 =?utf-8?B?THlaOXNSdFA3dTMvVVR6RTN4amNmbVdpbzVWOG0vZ28vUXRubVh0a1dLM0FN?=
 =?utf-8?B?U0VTTEdkN1gyc1ZPdFpteDMwazViaEI2Q1dQM1ZOWWhtenh4eGNWeWZGZmZo?=
 =?utf-8?B?Q0c2Q25IVlRQMWVaaHFDbE9JNE1PMUJMdkFiL0tlQnJ3QXErSFp0RTlTTnJy?=
 =?utf-8?B?aG9TUVZCQkFMRkJveXdzQnlEWTdhVkNtbi9ENmx1VVFsVCtHMGVZR1ZzalVy?=
 =?utf-8?B?eUMybjE0TFhOQkZpNUVPZFFoRTlrSE5xd1pYbFdWTmxFZkhPS1JxQkJzd0hL?=
 =?utf-8?B?T0pHM0w2R2pKZm5MNTRVU1RBSlAzQzNkMitJcC8vTk9DMi8vY3hlMDlNU041?=
 =?utf-8?B?ekxLL21UNkJHY05YOUlpUHN5NmpUdEtSNUY5QkYwY0J6Y0t4bnJDOXB1UGww?=
 =?utf-8?B?Vmw3eVZoVmtUaDJQQytLWTRhaVhyMVlPSW9FZExEWjYwT3NTM3NsOUlGOVE0?=
 =?utf-8?B?UUUzbDBPL0dKT1BaVUVTNlJxenFmZVZsQkdRVFRhbXdDQW9OUDRDcCtGdXVE?=
 =?utf-8?B?ZllDaHdsT1NyYXVLWXdHUnlVM0NrUjZ2TGNHMUVtN3owVC9aZm1jemYxNEh5?=
 =?utf-8?B?TUE0NElEeGFzOGd1bUluaGpMbjZDbWE3akp3V2VHMk9UL0dxWkNGSUxvc0oy?=
 =?utf-8?B?b3c1QmtES29qd3czQTRKbHVacHhzaGdwd0pmcmwwY1lmdmdZOE9NL2F2QkRn?=
 =?utf-8?B?aWdadE1jU3dJN2M1TnpjVTNneStQWGxyOEhtZFU4ZEliRFd4eVUrRE1xSzRt?=
 =?utf-8?B?UHZkOW55SWtiaURiazA1cU5uL0FrQmp6K2JOVGs1RTRwSUdJdE5Ram5CYi84?=
 =?utf-8?B?bkNBUXV5ZjFjYnVoeC9oakh4MlRMelVNVjJxcGhPRU8zZ2VvLzFCMGFDUGNW?=
 =?utf-8?B?cmRHR1R4ZjNEQWdmSGE5dVh2c1hPaEhzU3ZlMXZYbWRPb096YzQ2NERSY2Jq?=
 =?utf-8?B?MXFjRHNsY1ZESGUzTVVJT1ZYM0p1TU9TQ3QwdllvRkE1bVNqWExTUUVlVmt0?=
 =?utf-8?B?MFV2dUkxRTZwOTEzSzdGWDl3N0sreUNHeURPK29uOVNxU2I3MldxNzRlMTJK?=
 =?utf-8?B?NC8wZ2JUeXp3SktUL0pZRWdEQ1NGV2p3Zzl4YmRyMWx3di9sL0dXc1lleWdF?=
 =?utf-8?B?MW1WeVRzbm9qSGI2aUtrczRHZ3EyM3dmSGJrZk1jRVJsVHM1Y29nMkVUQ3da?=
 =?utf-8?B?MGxyaVdhdzhnNk9LbWtCZStFU1NOTWcwMHI0ZEN1WnBHK0VSS2hZM0ExMEM0?=
 =?utf-8?B?YmtTTkxSamFlZi9LWGtpaXFpWkFsMS9QS2dZMC9TbVl3YXlWa2ZFRnRUQ2Ny?=
 =?utf-8?B?WTZ1TnBtZlQ0LzhoZmx6REtJVncrRzN4UFQ0eFNJeXZNSWIwb1IxNkYzRWMv?=
 =?utf-8?B?QU5NWDJERzBlZTladTRPdGoxZUpUd3hwRnhmU3BkZ2IwRUZkaHZUcWZISExR?=
 =?utf-8?B?czh1T3FWTEcxZ1RiZFVhRzA5TW50RENmNDZXY2xTc1lkM0kwaUcyUGx4b3pB?=
 =?utf-8?B?YWJKaTliUCtqQXdMaHdjMUdpandpMTBUMzVXSlNxT1dNRXZNYWZjZ2RWVytR?=
 =?utf-8?B?dVF6SHRaa2RYU2xvYm1nR2xLVEhyRTRpa2JxSytiTmVVMDRIbFFHVEdSVU1y?=
 =?utf-8?B?WlZ1UHpxbjBMMUk0c1ZodkpCaXpWeE95SVFMenVwSkljSlVwK3V3Rkt2OXVU?=
 =?utf-8?Q?pwzZXBdQ3m4X9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2hRSm9LdWlSRzVQOC81UUUrOTdmbEJKdTRKbHowQ2c3UjJJbHJTWjlJMmJu?=
 =?utf-8?B?RXZUOGQ1MFgxWUpBaEVkNVZVVmVyL1ZUQUtuS0FhdmRmS0Q0Q1FodFlYNU80?=
 =?utf-8?B?THJoaHdBeDIxTWxjR3N2UE5Gd3Y0NnJiZXYzczRIekRNTUpGY1o2ZVZZQ3k2?=
 =?utf-8?B?VUw0NllJYlNIWVNGVFlDRDZNMFdjVzdYcHU3cS9kRk9KM1UzdWdsRDBrQjM1?=
 =?utf-8?B?RXFwWTdjanNubTcrQ0htbGUvMXpQSlBhY0JtcEUxRTBLTkU2SXd5VTdNL09q?=
 =?utf-8?B?V3QzbFdhU2tBcXl4RWMzWnVaUExLK1JkWFJ0ejFIditQb0NjN3NSWlFKdjRI?=
 =?utf-8?B?VitCc3NPL3VJR2VSR0ZNWm55THgreXdlWWNYTEVNWS9GNmsvZFNBczJGK1VY?=
 =?utf-8?B?V1o0WTZhQkxMN2REdU5ZWUE1QnJpQkVLYzdyS0lVcW5BVUNpbVgzS3pVeW04?=
 =?utf-8?B?UmMrM0txNm9uUnJ4ZHZyQ0tvNEt2VXNxYnNhVDRnd1R6ZTN3WThwc3BBYk8v?=
 =?utf-8?B?QXRpTWttN3FiZDZza3A2bjZOQmVBNTFXaGdSZlZrcDRKS0UvcXRQb2Q0WEtB?=
 =?utf-8?B?MnVENk80aW1SL1pGY1cycEJnQmk0Q0s5MjBIRWlxVTV2YVJMV1MrbXhEdTVL?=
 =?utf-8?B?VXd6d0hyNkFNT3B0cWxwOVdTVDdvZ0ZRNjRTU1JqUUVjbzdhUGZSbHQwa2NJ?=
 =?utf-8?B?eTJIcEx3eWRMazQ0czcwT0VjRkFnMDFhWDFyN1hnUHg4NlVkUHdiTVl3NU1R?=
 =?utf-8?B?ZFNOVmJndmxzZmtFazFEcFA2K0taZVoxVzJTM1ZQZzZ3Rk1LeDhDeFl5VUU3?=
 =?utf-8?B?bFdxTm1pNWg4VC85bmhseE05c1pTOURYSzcvNzZjTGFlRk5OZ0cxRzJxM1d4?=
 =?utf-8?B?SXRHSkV5L0tmS01WQVBVNHZHelgvOGt5RzNzZlF2RGF1aER1SGQxeTVmc0pQ?=
 =?utf-8?B?S05Vb1NVOERRbU1JVVNFanVRUkpnei8yTkM1SExFT28xakUrMCt2cVNyTThB?=
 =?utf-8?B?VFIrRXJWSE9GUEdtOEYzenYreERVVDh3RCtQQ1NaejZYR3JPcGcrMHFlcmNh?=
 =?utf-8?B?OUVTOEdPcU9xbTJTUHZvYUg5WjBObXdyVTBGa3VkdCtPS0Zmbmoxc0lBVEtl?=
 =?utf-8?B?N3VlS0NKWHY4WEpqb0tSYnJ6eFZNUXdxbEVtdnJlb0VyUDRTaVd0QzgzSTJo?=
 =?utf-8?B?OTVMTEQvTmxhdnZuWmtkUWhyQjhXVHNRM0lrSG56cVVoUzhkK1BGYWZkR1hq?=
 =?utf-8?B?L3M4WC92VGdQUHUvUjB4ajJqaUl3NTlwYURCOWtvd1NINGV6UWFTaHNLLzN5?=
 =?utf-8?B?dEpFcElLL0xTQ3d3bFRaenhweXRrYng4U29FYXZ0WHcyUDlsVGNlOW5qWUxw?=
 =?utf-8?B?bkFJcFB5Z1JjU3RXQmZxbkdyOTVxaE5ZV0hXQ0MyMmIvSXhMOERCQ1lLMm1j?=
 =?utf-8?B?eUh0UWE5dGZzYS9HSHp4RjFYWU9MU0RJK2g1bFYxZWIraGFEVWlqUFVtNlRm?=
 =?utf-8?B?R25wc0VaZHB6b2ovRlFuTXI4RGxZSnZ2QWxaMUpWQzVLVGR0ODhpTnd2Sk5p?=
 =?utf-8?B?MlVBYURQRFRMRTdKeWVyWVdnVWJmR2hpYjBxZHl5MlU0TFE0M3pOVTFYV09O?=
 =?utf-8?B?Z3NPYVBSOTVuZWd4T0twTkN3eXlNS2ZsbXdqQnFObkwwdXFjcCt2Tmlodkpw?=
 =?utf-8?B?U1ZObmdJOG0vemtYNWl6NUw4T2ZFODNWaUI4SEUweUNhUVYySUZHOTlibWpF?=
 =?utf-8?B?bnkrbFpJWXFiWFRQZXExZXNQK3R6QlF1VXc2VDlpQTM5YnpKT3BiN2tIakUv?=
 =?utf-8?B?S1liLzk2RjhodDF0TXVVVDFKSnZYd3Fqb0E0Tnp3cWwyeUNlUXFMZ3h0WUtk?=
 =?utf-8?B?RnJWakhDN0NuMHNzRjE5N2NjQVU5eW9oUlFaRXVQUWp3aFhJKzhGSnF4Znph?=
 =?utf-8?B?andlMDZSa0VMejlFZGZoNzJ5c0NjdnFpZVJ3a0tzVzc4TVJ2RDVSRjhVVldE?=
 =?utf-8?B?MlNKVE4wRFUxNzUrY1NwQzQ4Vyt1b043Sll4UjRNaGRsMG5SWDVWeEczaFZY?=
 =?utf-8?B?K2pBa3B2cGVTYUg5UVNVQ3A5a1NYaGhOcGxSTERuWml3M2JYWWlMTU1aWVZr?=
 =?utf-8?Q?aqtQj/l1lsRtXi+3ilvUKwKEE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fa9c80-2c5f-4775-6f28-08dd2031bb3f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 13:33:32.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S62r3u3lL1CFFqtXCWpgRalJQNiqR85ol1C1fW0LMSWLwGyvSXsi1ohdYi79nJwwF/L1Hq8ufCS6VCNQGrC6Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Conor Dooley <conor@kernel.org>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..0b617f61640f
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se
+      - fsl,imx93-se
+      - fsl,imx95-se
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se
+              - fsl,imx93-se
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.34.1

