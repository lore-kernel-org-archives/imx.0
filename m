Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6683F1BBBC6
	for <imx@lists.linux.dev>; Sat,  4 Jan 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735992863; cv=fail; b=dUHVNEvgsZ1e7jM4pmAY2hC30XRs+Nq8Yi1b/OTz3kIthY4wW5XtnF8Y+Ih371Q9r37Y6AcNVuq2nQaudQpYbsst3W3su6tOiTMa64Ha6FiOoAtuFwctiQyDgQRSOQpMUvMcW6YfkVQXP0BH2ZXoRAuurXlWvzhHG4WAvpjYQ4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735992863; c=relaxed/simple;
	bh=gp9MbVQtEKIF2B3eRjctlXaHhBPKbWthOpmSTG0zrwc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BZrZsfZ/zPDbVccwiKekRT+z3qwlv264REHC9gf/Qja2KiLXrZ4INY9XKuQPZgvYSPTs2Klqe+QFMsUZiMa+oAMwAysXq8z0DHEweyLlytnT5Xm7mrqPBKPkkLQCkIvQ8/unrdb4FsMe/rFqvAk/dTsXJBHzqUS3GKe/XJ2gdQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aMBj6ymc; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aMBj6ymc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvG+Z/FmuU7gim3JU4ZJ8PU4gkkrVTAHbNV9OkOK/EOVcn8dilD6nweEcqL9Kc05DHcdF7PD+etqRuv1msihPzamszTm9CAKJpjL8mlTsvwlb485HVaUoti+i6mb/mfiTVJXZwoqMtumcYo0yaLjtV9IK1/q3ansgOPjfBIsxf0V7yihlXwpPmu1PdJe5KWKdXBco6KFyILN6wMaq+Z8/OS0XOO2mbUa/BSzlByG6cSUjJQsg5M+LwF87KCGvG1HH9PMsQV7zpDGJBZcLndVC4kKn0QwbA15pfvxyBc9qyBXZXYME79x+EF+sY1W9DH379gspfPUQ17aGG/9zcioUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0z1zwIuEGgieG+cdU6axjw42j4qd/e9TvpRYlugSvQ=;
 b=RJgqiaVg0mF/I4rzfshP01s5FSPlmKef7n0h+x/XX/ndQP4mmevlEbpNactyyDDQDHbseCK3zk9fnvxuLchdunEhHdse3TrykAZ0kr7w5CfDT5zDVYxLB/LAQoBYxv7JVvYW2q7htqlH3+M16NLhVP8R5UvNMn4gA73lH4Dz5BGu2Z1jWi2nHt7HukULVe8fgGgTDGtIxP+2Qh0s94HhPvPTXODJcQ4wvff88sjlxJPmsletK+VcDWIIuoJFdkzr/QCz6v3Ww7LxnIXLB2Yu9MvRJ+q1AkLcapFoCDPjqRxrlsy/fun5BSCm9zBlf6d+vIPNkRMC3gPIXyO/g+BGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0z1zwIuEGgieG+cdU6axjw42j4qd/e9TvpRYlugSvQ=;
 b=aMBj6ymcmm4pUL5clIDXqvnMUA3Uk4+yPg9v1mlz2bbNFq+KzfgmudnC4Hq/1rmrtmFvTsIInmpR2HZUjmohw9kvLRm7A7VNEsoykAZUoNAUJloB4U2q+Kd49G1wfgNZXFKgwZOwVcd8ARnl27ZQ35cUKn2PKm+GK+uGITSRl5Nr6VMdqrDWZpeH8/XfsLtQu8BxhiK4bZ0QVR+Eb0V9TzdQtoWjcJhB/hJxaD0nFv4QDS+ZRFWIzCLLhdH4+g4zCeDtwg5/G4R6NQ+7siqwtLkxITMXBvXiQwwSKLHGxXD6K3W9DYaCK1GvE1lpzLk9wbsYcl94/a/cVVdncaBQcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Sat, 4 Jan
 2025 12:14:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Sat, 4 Jan 2025
 12:14:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 04 Jan 2025 20:13:29 +0800
Subject: [PATCH 2/2] arm64: dts: imx95-19x19-evk: Update machine compatible
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-imx9-machine-v1-2-18a78e41456b@nxp.com>
References: <20250104-imx9-machine-v1-0-18a78e41456b@nxp.com>
In-Reply-To: <20250104-imx9-machine-v1-0-18a78e41456b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735992821; l=789;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=hhNecmvk3+w3dn91uJRf1zVTEOaOrGrUUz/sWilEWs4=;
 b=xkyqDg5bkuw3/+Ndv39vC+d1ZA85F7m70xta43nDD2CmZXPq6h4W35Qi2I8ma3+1rRjO1BhxY
 XDpnWIV6JlpC16zdsMFaegUS3pMsVRNjqHBaX3P2u1DWzDVP40a5X7w
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 1385f7e1-612e-4e47-967a-08dd2cb94da0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTZOMUl1eDdQTmoxQTJuaEtObk1ZeTNrZktjTm5pY1U1Y2ZScnBzZlFTUWJU?=
 =?utf-8?B?YzBTTXZkTXovTC9NNGhFeVJvcW1ucXZDbHBQTDc5dGU3ZmFqc1pCTUxqUDhC?=
 =?utf-8?B?NW9XQVFCeHNZODE0eTFtTndhdmxNR21DZG5Ob012SnBCY1lyT254dVVkWEcv?=
 =?utf-8?B?dlAvSDc5NjF4NDFDK1hGMlR5dDFNZllUSkpJVm9GZzI3NHRWQVg4SWRmNjRt?=
 =?utf-8?B?eXhkU0pBcnVQVjZpZmcxSnZTU1ZwUlFDVWFWVEpvNXdJL1h5c1pOKzJXWmc5?=
 =?utf-8?B?R1NsVHdma0hsaWJGS3B0cnJsZUh4T29EbXNSVWhidDNOUU1VWWlPMzFSc0NX?=
 =?utf-8?B?UFJQYnIrelpFSWNmV1FJdk5adVNVeDdabDRWNk5KSEt6Y25rUjNHYW9WenFm?=
 =?utf-8?B?UnpmT2U0b1BaQ25OS2xOOGsyVzVPNkRLcGpOZk9FY3R5STNJb2dqWm5VVXNa?=
 =?utf-8?B?cXFMRmlUVXE0eWxTNmJwelhZdExleW03UU9RZmV2aGNuTHdKSi9iU093VWx2?=
 =?utf-8?B?Vm9rYld6TUsyK21KWXFFMHRGWWs5ckw5d1BQY2lReDZiL0ZrUUcyWnJTaDBj?=
 =?utf-8?B?OTMrdWxyTFRzb0FiNTlaQ3BKZkJudnZXMFVWRDZtM0EvZVMrKytqOFRhZm9k?=
 =?utf-8?B?SUxIL2lUZ09jTUJFUGF1OVFmVTcrN3pCTXE2eGJNYmZ6b2NVenFtb0hXK3RR?=
 =?utf-8?B?L2RiS0FEMHBYQm1Yc3dQSkZSNWZGVnRuTno2elJaVmt1RHVLcjMvb3JYei9Q?=
 =?utf-8?B?dldkSUVBM0ZWN0doZWpHQTl2Rno3KzVTNEEybGZTdHhFVHNnSHFXZjN5ekdz?=
 =?utf-8?B?RXExQmc0d1NreU0vRjViNU5QNTh4Zi90dXVFNU9zaWV2TWovZ3hDeng5SkRC?=
 =?utf-8?B?bHVJY1hsNldHWE44eUhteTNOY1BwVURWSWtIMjkrNVRweWxBd1ptcm1QZmtD?=
 =?utf-8?B?ekRNb1lpSVNKbnlpNXZubUp3TEFLMUM2WDJ3cmNqbkNSOFNsR0xTdEhGcHZ3?=
 =?utf-8?B?RlFvS3liNmNwY2lWN0Y5eUJxckRCcVlDRWhxU1M5c1RWOGdnNmJvUU9nVjl0?=
 =?utf-8?B?czY3RXp0UUNJNHJkL1Z1ZHJFOGtObENuc3JWeVZqWisvTkVXSy8zanAyQW1C?=
 =?utf-8?B?MEtYYzFGc0FQUkRBOEhzcERxZWVXTU03aXdha3JYSTJUMldJSlROVVZKcXYv?=
 =?utf-8?B?bGVIZ3R6czdFTUc1Z3JvZWIyVXc3c3FqczNoakdLYzZvK0xKeG84bkx5KzdR?=
 =?utf-8?B?UXE3UUxjZGs2U2k3bFkvdnlOeHdldTZjMTFZNkcya0RHR0VRT1BNMTdmTVRJ?=
 =?utf-8?B?a2tUcW5nMnRxdHl3eEN6Zm5tSHgrVTN2Ly9NRkI3Qm55YjI4d0VBa2s3RWRy?=
 =?utf-8?B?WjZSdEhhd3piWnBLdDM1alNnZ1dIMFNVNUIrUUxRaG5JdnZ4bkx5OWZScmk4?=
 =?utf-8?B?S0JMdjJoaU9PZE82aGR1U1dhQS85bXZ4Z1BrZExoa3ZNbEpmTFJsTlp1TkI3?=
 =?utf-8?B?aS9MZ1FMbzBEYmVBMzNFdStZUmFORVJHVVdxcVJvc3JVMVM0eGJHck1uUzdE?=
 =?utf-8?B?bU95aVNYQ2dXa3VIOWZ1T2JFdDBqZUNabDRsWjJQNHIrTmtwMzBpbmRjZ1gw?=
 =?utf-8?B?cVZyM2QyOGZRT24rRldLZEF4MUJhUnVqenJ0NFphNUFHcVZPRXF3ZXdXM2pU?=
 =?utf-8?B?OHhUQWtYSWZjNGtsMk9jTUZaeFRiZVExeUNjM2gzVktRZkFKTlJIRzZ4OHND?=
 =?utf-8?B?VUYveldmNDBud0JscVlmei9FR2htbXJzc2JUQWl5OWt3NGJ6ei83aGxCeVFY?=
 =?utf-8?B?Y1pObjB5ajhkZnNUMTFSb2hCVUtqYXY4Qm51Qmd6d2xlalFtbWppZUpuYUVC?=
 =?utf-8?B?T21tZkVjeEFXRkhpRXhoNHo5N3U4c0tiVVQ5emtPcTRTczRUejg3RmZIM0tP?=
 =?utf-8?Q?M5dXs9rPxfYVCTx10weHZzoXr0t5z8jA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVU3cE5WN2psd28yZVVadnNGZU4zdE05NVdtWkpGTlRUZkxTZm9pYkVFMm1S?=
 =?utf-8?B?RDRmbTVlUXVCeE1JMWR5U2hkWXhaY01aYmVhb1VQT3dPa3dmNUhiZUFnVytT?=
 =?utf-8?B?ejNPZzBRbHhQajRTM2U3Z1V5Qm50RnpQVVUvVzgrNzdsTmhtbWZKWW5qeW0y?=
 =?utf-8?B?U1h0NWtwNVhHOVV1WmVXYVozbDlnK2UzYjBYanhnYWM2UFZ5UjZBNlg1K2tH?=
 =?utf-8?B?cUxvOVBGeStwc3QySzFnWXVoWUlhQjMyNzNUczJZdzAwcnZ1KzNHS2RDdUlH?=
 =?utf-8?B?NS8vQ3pDZXppa09xWTRhYlpKamYxSWg2MVZqOUU5U0tYMHJ3L0lRMEYrOENr?=
 =?utf-8?B?RlB3N0tvUjJnNnlwS29QNXRRVDl4R2Z3WkQ4bnVNZ1hTaUl6R3JNbmYvcXlt?=
 =?utf-8?B?Tm9yZDVPTldtdEJpUElVaVN4U1VTYVJ4eUNhM1dEa1F0Y0xxREovbmdIODM3?=
 =?utf-8?B?SG1Oei9qVmZWOVo4SVFOOTlqaTZuUkJ0Q0pWd09lSTZCMXppSEwwempwd05B?=
 =?utf-8?B?U1Myb0dFeEZCYndFMngybzNwZVNqMFBTMmMxbnFmdUh2bWJaMkRsd0F2TUhW?=
 =?utf-8?B?bG1NUTZOdlhaOEVFTysycFVGMHFjVTE1U1JkcHdSdEU4NzJkVmU1M05hWDhF?=
 =?utf-8?B?M2dkN0RZVjQrOTd0K0NLYzhVN2srNDRpYjNORmJDVTQyVks0dHlsNmtkSlNx?=
 =?utf-8?B?OWc1QzZxT1lwTlRid3FnTzhJNDJJMDhtTDBPUVM5N3Bwd3lZMVl1RWtiNEp1?=
 =?utf-8?B?VHpzNnhFbzRZaEpPNTZEbThBTmFBeTJrZ1hZa0NXckpMKzlQdG5YVHNhelI5?=
 =?utf-8?B?cm45Y3hZeEg5ajlER0VTZDgrVkFSQVhkYmlxbEdLRUs1ZDZuU3dqdEdYbHk3?=
 =?utf-8?B?djY0T1hRUEp3Y0YvdmUveXBzdmtZSWUwOS9sYklHNFFwKzM5czdBUUh5R0sz?=
 =?utf-8?B?ZmJwRUZIblhDQ1MzcGNtRWdLWnJ5dVVqdzFlc0hSVHNOakFtMEMxY3JaYU10?=
 =?utf-8?B?Mm12QTNXZXB1L0RGYU5oMk5FMmkzT3oyY2pCemtQOUFXRUV5RjFCNndoNStK?=
 =?utf-8?B?T0paU2dOME1iYjc2RjAwRHlGY0s0QkJXc0t2T0h4Y2dBbzhTa0JrNGJxaWEv?=
 =?utf-8?B?V05rSUx1amVMZWtJWmhZSmErS3dyQ0FjdE56dFFJMkdZaUhReDNBZ2o1Q0Na?=
 =?utf-8?B?QWlDL3pPZTB3TTFHK3YrRy9ZYm1iMndROGd0VTdaSTdoM1Z1OHhRN2RHOERW?=
 =?utf-8?B?YnJKd2JRNnQ4aXQ4NHpJblgwSW9VQWIwRzZKY1dkQmUzNmtCQVdRV05uOG9D?=
 =?utf-8?B?K2J5MFJ1cmpSSmtTcUZYV3B6cDZPQ2ZjYnlLbkFIWHBnWEVFNk16SDlVTHBt?=
 =?utf-8?B?Z0tTMlA2eCthZDFjR3Zqb0VEVXZGZWdJZU5JWEVOZjFSSXh0b1loTHl5dW9O?=
 =?utf-8?B?TW9leWtvL2V3UXEzblJsTy9SS2NiUXhJWkd1UUJQTmFFMk12L2ptOCsweHJm?=
 =?utf-8?B?NWx2ZDJZdGlTTUIvdC9CakVXOC8xN0lpYnFsUjlScFltS01VS05NNDJSNDY1?=
 =?utf-8?B?dUxlYWpkMHpISTJIU0ZpeHEyL1FLOWZ1bHJ1VVM4VmU5Yk82cS9YV2x5UU41?=
 =?utf-8?B?R1FpWVdqZFFCQVo2L0toc2YrdzN4ZS83Y1dIMlNGdURnM3NWVnFyYUNqWXR1?=
 =?utf-8?B?eENhcDc0aWh3eHA4NDhLbjc2NjBNclRDL2tzUlJIUTR0YkdhQkFpNjYrVkpw?=
 =?utf-8?B?cUgrNVBQYXJ6NlNiY05vbGxJSnphekZwTXdaVFdVdzZqYmNwRGtlZld3NmRl?=
 =?utf-8?B?Y24xcGF1UHh1ZUlEenRXeEJHQXEvQmpybEp6cHlDUW9oVVdBdWJyZEZ6Q3dP?=
 =?utf-8?B?ajg1V1BHdmNCWW1jWHM3TFF5eHNpQTVrQ1RBQzcvM0s2a0VFWUlFMDFCd1Zi?=
 =?utf-8?B?a2lWc2hmVTBoVjQzb2hydjBNbS9aTWZLOG5lQWdEL3oxcndsYzUzN2oxOE40?=
 =?utf-8?B?VzMyM2FmSzYweTZpN0dTWFV2cFdzUXFVYWlEclgyb202bHZUekZXQUhkMVBt?=
 =?utf-8?B?Uy9UL2NMKzhPVmVLYm5UeVBoQ1MrM1F6NHJyTmZUR0ZKOEpTMG5YbUhoeVNP?=
 =?utf-8?Q?7NoXJ0nanjk7FtbioeZ9nhxvL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1385f7e1-612e-4e47-967a-08dd2cb94da0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2025 12:14:14.0367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FD0jgp1t+07mqGJ2avks62ToeHhrjozs+TzS+irtbqQdVyb/mBXeYyJ0cICGw5nnqN2Vd/DSa/5UEZ9bH6R8tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

From: Peng Fan <peng.fan@nxp.com>

Add "fsl,imx-sm" fallback compatible string per dt binding update.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 6086cb7fa5a0e14882be3a8c609725e15c179392..646b255cfc694dad2038674ce449708deb15b485 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -19,7 +19,7 @@
 
 / {
 	model = "NXP i.MX95 19X19 board";
-	compatible = "fsl,imx95-19x19-evk", "fsl,imx95";
+	compatible = "fsl,imx95-19x19-evk", "fsl,imx95", "fsl,imx-sm";
 
 	aliases {
 		gpio0 = &gpio1;

-- 
2.37.1

