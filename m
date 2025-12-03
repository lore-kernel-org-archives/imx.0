Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33198405C
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764744557; cv=fail; b=NvHiDh+6Bw5aPdBAYqp6DD/Vo4JbLwcChp4RbhwkbRTwIbPiqckHu+bigGavNUTu1iaXWqtksAwA/nVZCdekf20EdhohM5Mb84MvvnVZ75atTNeI1uJrrf+IKkOSTPAe+3jhOzCzP+M0UjRw4ApDDClJq84KQB2MpuToWNYJXjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764744557; c=relaxed/simple;
	bh=Q1VJZtoM6gswB5Vqcs1ZKYbmHNVwp6lovh3Kn7bl2Ng=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AjRm2p1j4paVs5IBucviSvW+vYbcI7XI3kqBfHKSITNMv8w03iFEmVrER+W5CBF4dUlzBAqIBkB3vpY8mpSjQJgzxqSdIu/Hwj6p91NDLmGFawhFJ8MZIBUaoJbX0o2DW+bOaJfmbi7x6aW90hnFPgx/Cc5KmMWg2D/5gS0qCQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cU01uBDz; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cU01uBDz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwnbTziM8xVhb3nF6pOoCYy9f8ddACdG3PaBPhggZjFTkY1R0X2Zqglky4DyPcEDJzTgrxSh7laF/pPMmDYw69V6ozSXeJBgCarFIcKGyfCEUTSe7OkV3K6pie6M6qb6onUT9J8gDKodOwo7KGmeuUoczlncFa+b8eay4BY9H47Gu8wCyK3iZCTB0MPH1DWZ2OZyDSm1fpc5bbOxyKj4IGMB9syZLp3+pUMzDrBFgASXb4KnSJ35ZV7hBeTPQvjFxpUinAueMMnst5YoIHyUBzWUK3agI9IOTnhDetbR1p6jQB4DkJxBEkvWqyAr1H4RQOfmyfz5LxzENZo+SHFiHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYMZZA78I0WVPIqhfF6Nqj8t/8T3kxfjIUB7j+zgWzc=;
 b=xGiaZtuwXsaE/QfdDnZFnsu0C/mTAiMlpjbc8K7QtK0SJgG/j/9vXyJlGAchSs4PpNjBg41PYHyuDGhaRf99VrWdUlZTrta5jl7C0TKbiEQ/hC20IM42PcEY9gObPwNIT1a+6O1Ow9STxNlDuzZXbUBh/jW6J5ETf597Mn4ATverAs3bPx7zVmCteacE+rOlkFzAQHmx/MkBf/XBf9HSFC0dwax6hD1MY9GlSp65La+E5Avq+zFRYinTkPaVgoQRgiwGdSSfUH/9XmK4iXvk/w54clOzD9VxalXiA+4yUt5ObFBaJprKgg42b3QYxXJ0fBa6a/NLC8ZwOVVTSQJbvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYMZZA78I0WVPIqhfF6Nqj8t/8T3kxfjIUB7j+zgWzc=;
 b=cU01uBDzNbyP3cdfkWTeEq9ecM6BjG0D6IaB/+cElAIf9FM/KcxnwO91L238+m+tO7dU1l4h1WIKl6HPctMmNQA//hP0spC8b7x/Iek8CK924xGA4HrJnJF0ENwg45qWZtTvdM0PbwEkwtZh2D9mnAyXRIts4jGwE96qHhheEAGnqyrySdZUaw+KY+M5MiP01ysiCIMpMlMhs34ephf12ZpNjsOJGcgYPDPFiurRiwvdHPKW1M3Wlz8Ev46HVd+FWv7BPnJQBkcpQkmI06fmYhL/n0R+rTNUV+J15XyFFYjoo3JZH1mrvxpfcORcOhdjWxvj6nu7pgG/WFw+BNjxpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 06:49:10 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:49:10 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 03 Dec 2025 12:18:06 +0530
Subject: [PATCH v20 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-imx-se-if-v20-1-a04a25c4255f@nxp.com>
References: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
In-Reply-To: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764744504; l=7358;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=Q1VJZtoM6gswB5Vqcs1ZKYbmHNVwp6lovh3Kn7bl2Ng=;
 b=N4qK3vXT8sK9TJEkMevNLBXFpjxgQ2fSh4cXc/xT5PsR/BPN09E0Xbjw8C+XDQ/NzpP+WwMps
 9P27OsB+AQrAN06qcnscTviIMHgdImvh/Aj3LrNWlxPpW37rbbloAIY
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: 8597b462-efa8-4b1f-4e65-08de32380fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QStHR2FQbWMydVVaMkhlNzdMQW1qUUZRMy9aOTY3eU9ISVFzV0lLNldMN0sy?=
 =?utf-8?B?MVplZ05hczYxVFYvTHpYSGxkVG84QThrZVlINjVDUWQyVnRRZnVNVXNsa1Va?=
 =?utf-8?B?bE82MTZUNG1lanhPNzVoRUpkaFlzeTZaRmlBVFA5UDU2T29iUmxKMS9wVWM0?=
 =?utf-8?B?Rng4aUhLdnRqaGRzSHlod2htd3VZZiswdSthVEVDak8yYkJ1SWxOUHdqTlJC?=
 =?utf-8?B?N2RBd0g3YXg4ekUrRFVaamJvcVp0bUtZVDFnT0F4dTg5YkVGck8yM0NodUcw?=
 =?utf-8?B?TE1nWTF3aGVtNmxHYnpHMVNGc1NSUEpYdlIrYWdSYjZGZ0N0emw3TDZ5Tjdr?=
 =?utf-8?B?enJ4NzM2ZmtrRGhnaEFob2F4Zm9hRnJBOUpoMytXd016TmlITmxLbVBhZlhu?=
 =?utf-8?B?dnZJSkJVNzRGYUwrQmxISkF1S0FNM2pDb2pIelU3SnYveFNhL1RnT1Z1aGJa?=
 =?utf-8?B?R3FmNk5UalR2TXc0VlNPaGNlOGFLb3orbW1pUWNjK2oxTGVRZjBIMHBaY3hZ?=
 =?utf-8?B?VjYrT2Vtc05NODFVMkhsUWlid3diMHI0VjFGRVc5ZzVlWUdhWnY5QkEyanhL?=
 =?utf-8?B?YVJuanRRZUU4N2MyVjZQUVF0MU43NzdoNzY2M1dBWFdXT0h3eDgxeTZWaFlj?=
 =?utf-8?B?Q2wvbld3OU1DSGhGQm02OFdVRnpSVXlPbmEwRG5qcFhCMXBlT3FDVSt4NHRX?=
 =?utf-8?B?SmZMVnA0aG1nZGhnYS9RVk5PWjhaK3Zvbm1keE03YStlcXJXS3hKQXRrVFAr?=
 =?utf-8?B?cjdvdWpMS3JhdmI5NDBlTjhwMUtiT3RWYmQ4OUN2WCtudnQxTWRIZ3RCa0R2?=
 =?utf-8?B?N0twRk95VlNMN3FWTnV5eWlueDMxcTBDRHlDcnh4bkFCUzgvVXZnSndFdllN?=
 =?utf-8?B?S0l4ZkRHbXQ0WmFaWmc5VWZiZ054K1FIcGxTekVoM1JVeUllNi9wSFNVdWlM?=
 =?utf-8?B?eFNGMHcvTEhEcUhKNW5XZnRad2NmVDJId3h3VFlqZnNCQzd3TU5BeGNYNjc4?=
 =?utf-8?B?MDhFTlhLZEM1eDhKRjliWjRoKzJvMzRwYjlTMytPUHlZeGVSb2kvS1dXZzRu?=
 =?utf-8?B?MUZaMzJ4UldCUWIzOFpPclZZdjBiRTJxNFdKZkkvcmg3T3dJY1A1aUNJZHNr?=
 =?utf-8?B?NVI4YUpVcy93aFFFNTJhRzN5V1lsOUIyTkNDeUZCd0tsNjlmZjl1amhrZEs5?=
 =?utf-8?B?ajhDcERBSXdpbUhPTzEvOWI0R3JyZUtnRnptbHNER01Qa1piQmFuc3NCU1VH?=
 =?utf-8?B?eUdnazRkdy9vbTRJaXVySU5nTStLeFc2YjVtdnBPN1JpZzNJQzUxeGp3YjhI?=
 =?utf-8?B?Z1RnMEZ1T1FjZW0vQWpOdFhqa3I1c2MyYlFDbWNRU1A2RjFLb1JnWEVURE45?=
 =?utf-8?B?ckJXU1hrN1JwbmFFYWxRQU1rTXRaWlF0SjZLalFHTndrK0xmQU1xMlVPdldF?=
 =?utf-8?B?TDhRYWVwWUkwbWNXbkZwQW9JNExHZWk3ODFkUFdPUVJDRm9KMVVFbTFSdnIy?=
 =?utf-8?B?Q1pjT1g3UDJaNURoa3BiaG9MYjBDL2RkSWFxNHl6TDJnZGdIZ2R5UHVuWWxV?=
 =?utf-8?B?Qld3eXBTRzg0RUZ5THQyZHFuSVhtajc1RXd5WkhsT1p0bTc5SUROZnA3Smxk?=
 =?utf-8?B?VUxBUFJnUmg0SkNOOEc2L21IRlFDWm11OTdOeS90bmFtRUtrNUI4RWh5R3cz?=
 =?utf-8?B?ZWlIOTdjeGx2ZXMzTzlQc1J1OGhJTm9oV2labGE5eEM4ZmgzUzNMZGdudGZ5?=
 =?utf-8?B?eFk2RE1SdzBjY051QmFLbktNY3JOTU1UR05VVFpYbnYvWHo1dE9PRE1LNTli?=
 =?utf-8?B?b0hQdURsTVlkd0ViNU1wcGdIZThUbGliMFhWYkJ1WSsyaTh0V0hoRVFKUFU5?=
 =?utf-8?B?MU1LU1MyZWJSNDFXeHhJZUZLMEVUT1RvTkpXOU0vNGV2ZGYzVUxSTjVWUXcv?=
 =?utf-8?B?eGpXdTR2UjRPNTZGZytxK0E2bW4zTlFGeldQNk8vWEVTeGpXUGJrSHJTSlkv?=
 =?utf-8?B?M2U1ZUoyRXo1dHo3a1N2ZkV4NThqN2ZaTlZDYzJzT3hSUWtvZ0s4azEvZzRy?=
 =?utf-8?Q?FsLwXE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVlGL1dOSC90REpHTlBJMmE5NjF6bU52RC9EdUhTa1RUb1pFZTBvZDYwOTRh?=
 =?utf-8?B?SFJDbE0rWUZyOUtBYTVkM3M4dWJnVkdVRjlQNUsvVDlrdmRXQ0pYR0FQS05y?=
 =?utf-8?B?a1JoK1c0MCsrOGlJZUZRR28wKzJxWDBSc01vMUd3UkR6eFZqQklUWW1vVTRy?=
 =?utf-8?B?QXg4ajFZQUY5bXRpYlVuMTVzc2hsU3NxUUpsclRJZ0xWWkl6ZEw0eFVsazIy?=
 =?utf-8?B?WDlZWHlBNlFOZ2llS0ZZRnkvdEl1MkUwZnN5Q0JJZ1NCM2JXelk5V2ZTcGFu?=
 =?utf-8?B?U05GU1gxSHhESUFtcm1iZWF2bjZmNU9uZnYzdjkrQnM2TCtnWEw0V2hUVHd6?=
 =?utf-8?B?TllvMzZLS1k4TnVmbmFEaEJadXQ1Ti9WR05vQ0lpYVNDVGptTE9WdENuam9s?=
 =?utf-8?B?aWczYkMwNG9SVFg1eDErbE9kVUhMeDlUbGh0ZXpVbjB4bGJPUkJZQ0hkNXJu?=
 =?utf-8?B?aEc5ckw1VzJqNWRCOTRiVkhVb0VyWXFCVmc4VnhJaFM1R1c0NHVTQzV0M0tu?=
 =?utf-8?B?MXBGN2Q5a05SalQ0Y1grako2QU1xZ3h3UnQxK3pTSEU2SmVkQnpDL21rVWEr?=
 =?utf-8?B?eWFBVVM0b3V6YU1QKzdHWXNGRWFlZDZabUp0Q0RSZGxCMHNqVGRXRjNyNDRn?=
 =?utf-8?B?VGRkekxNSEJ4SGdxbnBjd0Fhc0RHa1lKeW1PdnhvQlY1KzBoMy91RDAzQW9Y?=
 =?utf-8?B?MEdoZDZhWDdvNkgreTliS3UzL1JyaUNkQzMwNUVPcHBkNkpOeEFQbERLb05U?=
 =?utf-8?B?NTRlUzBqakx2YjY1M051RGZFb0ljeVNXSXRzWmIzUThMOG9ad2RTSFV5RWdK?=
 =?utf-8?B?NklhajlTUUJHNFJ6Q2V2MmtMYURydnZOZ1lROVUrY1YwcW0rZUp5Z0k5U2xN?=
 =?utf-8?B?VXRMaUFIWkltWFdTeDh3czdOZUhocURuTkVXeTUxME5UUGZVeE8zY1BYQnll?=
 =?utf-8?B?ZDZnd3JlQVp1czBURjZwM2Y5ajU0U0c3OThIcVNWK3VseXI2SVpjVC90M29w?=
 =?utf-8?B?Tjd3OFdtaGlOT3RXNHJmT2k2VW56SjVWSC84eTJFTTYvNkxNRGl5MURadXUr?=
 =?utf-8?B?YUxsaDgrM1pUdmsrUHEwVXdkYU1KNFZTVmQyT0VNNjR2NEZHRU9GUHBsR2hU?=
 =?utf-8?B?K1ZXMEx2N1A4Wk9QeG9OOWtRMjVTZ3MxT0RkWFNhTVpuV1JQVFZJZnJ4ZkI2?=
 =?utf-8?B?QnBmTktSWTFaQlBSSWRXckRldHVjS2w5aDNQMUxtRFhhNjFSWmRjUzFaTGhw?=
 =?utf-8?B?WUJVV21vWXZPM0dJVlJLbzhtY0NPU0xzcE5lVFhPNlRkUHdNRXlDTWt3WUcy?=
 =?utf-8?B?VkxYVDRnQU9aV2lURHdWS3ZSbFh6NlhkNjdPWjNsZkwvYmJyUVVPdzBFZERx?=
 =?utf-8?B?djlCVXU2UXR6dkE0enBNVVQ1emdhODQyZXpCbjNzeWJyT3NtVkQyb1daMlhL?=
 =?utf-8?B?NnJwUzB6eHNIR0VrL2syTWhuVmVUK0tYblRlMW5nNWlUekt1SnpCWUxkVnpw?=
 =?utf-8?B?VStQenM5S05JdG1kdUhiSFU1VGxYZ3M4MjNUMXgrenc2c1lIeTdIZk5HaFpS?=
 =?utf-8?B?SXVGWlA5Z25CYTVqci8wTTBScE1zUDdhUDI4cWRORHJkOHhvQnhTVWJ1bSti?=
 =?utf-8?B?aXJkcXpXVUtqblVJZUI4VXNIYXgvU0dudmZpeS9lRE9YM1hsbjZmRThJSXRS?=
 =?utf-8?B?VXRrYkQwalh5dHFMRWdSWm9xZks2b0I3ak84ME5HZVJlZERpNitLYk5LQ1Vl?=
 =?utf-8?B?bkphQkJrRGVYSjdnOWRiVlZLclh5cUNJSjNnbnF0YURQenBZOXByK1VGSXIy?=
 =?utf-8?B?T2xaM0J6Y1RCMUwxdC95RkZXR21MQkYvNktqem8xTDU3cVgrQjdZbExZVCtM?=
 =?utf-8?B?R2FHL3IrU1F2cHU5aDluUUREWVZ1WUpadEIwdzFWcm9mRmQ4RWxrRENFNWdu?=
 =?utf-8?B?Tkx6dm52YmVUNm5YQ2dGS0dhVC90VGJQWmFsS0k3eGU0Q0ZHVWFRVnJrcXRN?=
 =?utf-8?B?U2hLTjVkMDdzNkRzZFJFdmpjUkV2SUoyK1prMitNdXlBZmhUN1J3TDQ4VUg2?=
 =?utf-8?B?M240NlZqUmo3dTJlN1dDbEJaYjlDSUxJa015eHZWeVVkYXBqWEZrOUtabzJT?=
 =?utf-8?Q?b149YUMWFw8malBHKCBSzozJW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8597b462-efa8-4b1f-4e65-08de32380fe2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:49:10.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F764bsZJpxDs5T5eFnUiAdUEYvZAhM32/fS7wJHseNvcr+l7yScLkRJBI8oFaehqLEOp/os8P9pma5eLhlffnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..2a7d7100fdd4 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,134 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like
+ - Hardware Security Module (HSM)
+ - Security Hardware Extension (SHE)
+ - Vehicular to Anything (V2X)
+
+Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in form of
+command/response mechanism. Each client could expose specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprise of twp layers:
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+  - Serializing the messages to be sent over an MU.
+
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
+::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                  +---------+      +-------------+       |
+                  | se_fw.c +<---->+imx-mailbox.c|       |
+                  |         |      |  mailbox.c  +<-->+------+    +------+
+                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+ kernel space   +------+      +------+     +------+      |
+                                                         |
+ +------------------------------------------------------ |
+                    |             |           |          |
+ userspace     /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management, over Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_fw.c
+   :export:

-- 
2.43.0

