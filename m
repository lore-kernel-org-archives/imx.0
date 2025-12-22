Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA8B2580FB
	for <imx@lists.linux.dev>; Mon, 22 Dec 2025 01:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766367768; cv=fail; b=l2jBLOQnE+E0VckUncAtau/T+Ns3ySyrAmYYA7uBT/mSG7K1lYILffvcwD2WdYcNYfdFr4X/An+z5wANt+DCj5ulNcbhIflqDyXM/wUy7UHwKxZliqWxCog7nF7FKJa7jVRz5zYzlygMw/kKKqN4klPA9p6yBEwUkfzol0tEeI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766367768; c=relaxed/simple;
	bh=0TnNfsNHEweVlmuUXQqd4WMIJRy0zUbMyZdwbmoOlyw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=svJmqlDjtk+un8y8E5lY0EPgEkPx2D9N752J1atiR94HcWFF2IniXLmJuYXZJ8qfI0l0VnGuWJaSmeBLI5wxO/UUI4so7KbyaEphuPDyp4pan3PFE8bZHPxUyXJGm5UvxI1GqOk3OMdmvuKXZxfuLqYbdhfmvn8HL/XXK3vrBW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xMYdCL1L; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xMYdCL1L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMLzpNR+hDsMoNy5evOjUYfr2zoXO/WXkNh2vn06AojTDsvKfjcJduEC0lk9j3jcpcqOsTuhB+I8qAMTZRmBYqlcCRjQlWUou7r5SoCBo2ye8CQ7vJE0hqKco4NO9uaLbVSNeHgXmlmXH+HLbHhEjONEc5bJfwl/5i6L/Y/TSkvykbyUAlBr5Q60w5wAOM1+5pi/GJ9JHDEh1w3YYC23oCELA76TCUylZlIQvAlQonomSOudMI6v213KauhlgsaxgGaGf7tiqyljI8asaEwxtFI4uMQteO7O3Y3gisoEW8zOlXCB+1fSNZS6/PS3MfCmSUgDGLec1XR3rlc9PvOtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fFiNU/QWmOPngA2GcW6VGEm0X+v65exzyR9ry0qWyQ=;
 b=sv14TTs6ZvbEKceFMIgrf1V8TakJxkk24t6BMky1bW67E3lAlu4YVgxh3vqx1zhxtPPtj9ZP4ycNNjpirSBvJWnVH5waMXeVTkk1RI9BFSCP/bh5DpJKc4vvl6frjLKk+50hOiF+GdCGSMhxg9RcTvf0muzixdM/jAYRw6bCJNaUCjxv/F4GksVryUh9Ds7tVfPzdCT3WfLA9EX5rXsNuWBJHAY6ow7UfplcU/ZIXJ3P0Pn144jf+tuAemDZh0nFINcJc8RbcqMZcCoJkUQ6JzlefbCdARKfbeQx/eSszpxlXQovAuJq/tA9G6E5Eq0v8wtNE9Jsp67FiSc+islN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fFiNU/QWmOPngA2GcW6VGEm0X+v65exzyR9ry0qWyQ=;
 b=xMYdCL1LO/VnDw//2D3hHZKLxjCOi3xPwmTKx8XiVT9a00QzuPnHTFj1xsXAzT30kaUr0PkJryNFKezT5geYNWjbuE7g82hXruwRY76aSYHA2+cZCppG/Bf+F5vLbDd+NAmHPq5N0Fq2tZKfnwDCXTV2nmxdC+QthKAelOJeLgjt3s5SfcdGJtKkJLWFRXePPREWvjc+nitYbxB1oJvI6Qjx04iU7o3Cy8mgNhocJMhZdM/O/il74eMfAoZi7+Dg7Cjwb2KOb0rZ7MstAO1Jm/Hq6CqAwN+gqZCkz5une3sokgNoG6Y879lRqGUpcSrJn/C9HeS0fq05ZiKaT4n2aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB11457.eurprd04.prod.outlook.com (2603:10a6:10:5ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 01:42:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 01:42:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 22 Dec 2025 09:42:14 +0800
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add i.MX952 EVK board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-imx952-v1-v2-1-8793ec8bad6e@nxp.com>
References: <20251222-imx952-v1-v2-0-8793ec8bad6e@nxp.com>
In-Reply-To: <20251222-imx952-v1-v2-0-8793ec8bad6e@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB11457:EE_
X-MS-Office365-Filtering-Correlation-Id: c52a5244-3945-4130-17e9-08de40fb671d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDNOeitiL1lBTDhCMXo5dll3OWU0YkxLZ0VjTEI3TGFUVmZERWZRZHNPQlg1?=
 =?utf-8?B?SC9PV1dvbmpwcm9HZWVMT3pTbVE2US84S1oyUTZQbmY5Wm52QWJVS3FKaEhE?=
 =?utf-8?B?ODZmbmpEMitESmEyRU1IdStLL3dhQUdjVk9ZNW1KSmF0UTNrSmYvMlZrZWY1?=
 =?utf-8?B?RC9DUTlONnkvSlVqYVp1MFp4ZU90dWhHbWVXWkxENXdqNm5pRjZWR0Y0NC9Q?=
 =?utf-8?B?UysxdVBuOHVsZkxXRHNkQjRGTm5kYVVYaFFMdDRtaGRwWC9xTURPSko3bUVX?=
 =?utf-8?B?SlMvMElYU1NPdzhVUmVsczFlVm5WN21MNDlHQjVrRDZvSWF5Ylg3N21tNVRR?=
 =?utf-8?B?K3FPcUdDZjNmTnFKVFZ1OVNUeXNPdWxTOUltVUtLblVYRlgwS2ljSWZuNDZn?=
 =?utf-8?B?SXRXaWM2K01DaEZTcVRDUnlYSTNwanRwVkZiVFpwYVdxWmQ3a2prYjVKRmtZ?=
 =?utf-8?B?czM2TklOL1pyNU5JSWZ1TGdiNzR5MlNUR1pOUlpsSE0yL3B3RUlPZmh1TjVR?=
 =?utf-8?B?d2xobzdzR0E0eldlc25WQTdhYk9CVlpRRTRWUnV0Yk5wNElHd0hTem43K09D?=
 =?utf-8?B?OWMvd0VqcHVuc1Q1ekFkR0dyU3RwVHVDZnpkbHBpUEx6S3lWZG56K1Z4OE9v?=
 =?utf-8?B?bVVIeUpVZHZacVFuRFRKV2ErVmR4elcwUVp1WUIvSXpnYWxZalIrMElLRGZ5?=
 =?utf-8?B?S1BFWkN5eEdrYzBObGFEd3JEY2w3RCsvY0JuZmdRdFlwWGVRMVM0THlqaXcr?=
 =?utf-8?B?MDE3Q0x4NmtTZjFHdWZ1elhjejFqV0lEQWE0cTYyUjk0Tzd1d0pGanVmbTZW?=
 =?utf-8?B?WkxzaDB6STlQbjExclBJUmRxNlE1OGw3MDhIR0RvN0NDVVNLTjBqUk1wUmpO?=
 =?utf-8?B?V0JmMU85Zy8xQmZkWDMxZHIvbThoT1RSVXIrV2tpSkw2aWlUdDdiT1BHWGNT?=
 =?utf-8?B?SWkwYnBvMENRaFNCT1dpTEdxalFwRkZZWWY0WXdqbkwxOG00SlhwWlBmTEJa?=
 =?utf-8?B?VFRIT0FTNW1oWnF4aGtHVUlrTGwvNFhsQ2R4b3RUYU1XZlBhaHR4SG9DU2tS?=
 =?utf-8?B?VHhUSHEyWUhDZVROZlBGekVZNDcvekNoYStPQXExWE9DYVhoYXlkWGJSZkRK?=
 =?utf-8?B?eVlmRGVUL0ZaTlBqUS9IMmNBNDNCbmdkcFQ3VStMaGdzN1docG5CaU1NSmpG?=
 =?utf-8?B?djJkNGNVVXRXTlNqYUZIZjZ4NlAySE5MaXlNOG4rMjVIZjAvYTYvb1ZIenFr?=
 =?utf-8?B?blVmNEo2NlpZZnc5RE5JUmFDMjRNSk9rbGdHSnhhZ1I4TGR1RzZaK2hrWjR5?=
 =?utf-8?B?RzZMS29tdE9NcUVnTWVIQ1Q5ck8ra2NlQkNSR01pa0V0ajRoQXEwT1hkUEY4?=
 =?utf-8?B?MXhCWERqNXZEOUVDZURHRXZyZ05xL0pFbzB5ZnNndnpPOEJhbzY5Umw0UktJ?=
 =?utf-8?B?V1ZyNE80TXpTblYwVVNiVjgzaUpIN3htRFRBZE9qLytIU3dPYW9KNVo5SjFm?=
 =?utf-8?B?WDR0ZzlsSmNSSnVyYkZZY2JTaDZ4aFcrU29XbzdLRUNhWWxYbWxVeStVV2Rt?=
 =?utf-8?B?Rk00TzE0RXU4TnBCaGJJWFdacGlROU1rNC9zSElCVytWbzdzb0xGYWE5UjVx?=
 =?utf-8?B?MGlRTTIrUzFlTEJGM2pQUnFyYUVWM1RvaStEZjd4azZXY3phTnlHT1VocmJt?=
 =?utf-8?B?K2R6RWJYd2hJR0lVaTc0RFZHdE1rSGt4SjNiRXE2clZSQWd0Y0h5OEtuVVBS?=
 =?utf-8?B?aUhYZzJLeDFPclFaZjZObVZFbkxZT3hKV0tEV0h6S1Y0ZTVZNjlUMjhiKzlS?=
 =?utf-8?B?MFJiWmJDSmRyNzc0L2ZHaGJLRXl1TXJBay9aeWNUaW5oaFN5cGNkY2gzREQ3?=
 =?utf-8?B?ejYwa01TdVZtTkVEN2tKaWswU3IvV1ZrZTJqZUxlc0tEOVpOdXpCaWpDWC9r?=
 =?utf-8?B?T1FnT2NyS2pUYlM0a2ZTOXA5YmtNa1NIWUw1Tmx2VGJZQjNpbzlKSXFydDF2?=
 =?utf-8?B?N09nVTM2QWNlMDZlMXhaRjI2Z05YR3djMmt1QVN4RWo4MmR1ZHF4MjB5Z3FR?=
 =?utf-8?Q?FO3iEH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2xIOU9LWk9IR1NjUVk3Nk9xMHNZMXg5ak1VM0RHY1lvQVkyR2lLT3hIQUxi?=
 =?utf-8?B?Z2djcUJnS08zTWxjY0k5S1ExdkxvM1BCMWNydnBKa3Q4VytkNHp6SE43R1N0?=
 =?utf-8?B?ZzJQQWloSE93YU9scmdMajROM1dTVUloWm1sVzVHY1R5Z0kyVVZ1V0FCWXd1?=
 =?utf-8?B?cmVwQU1ENmdSTms3SVN6MndrbWthQjBCVHFodERzbkpuNVZhZTJpOE96MUpw?=
 =?utf-8?B?aGprTElpUWZVMlFBOUxSWkFWWUp6b2k1TXA1UVBwK0RkVG5wV0VWV3hJb1lG?=
 =?utf-8?B?Y1dwS2x6WFU5M0R4OHBXcVhUa0ltWVhWOVkvNHE2akY2UENEUFBIOXRjUXB3?=
 =?utf-8?B?L3pvaUhEK2MvRnJ0N1pCdWlEZ095QnpCbVJXWWxCQlZ3dkZkNFdrT0QrVU5j?=
 =?utf-8?B?b2hMaStVN1dNMTFkKzBSdExUZkh3eEcrM3ZmRFJIQkFTaXM1dlg1WjJ2NEJU?=
 =?utf-8?B?ZDBkUkt6c1Jwc2hIa2FGWlhVRlBvOEV6aG1wTWQ1SkVReGR0STJ0UGZsdkx4?=
 =?utf-8?B?MEJMenkxNDI2UWo5WlR4TVdyekhxanhDNkY1Z3pjRjhtbU1ZWFQvYTFveFpN?=
 =?utf-8?B?RXJiT2NYd3dBUGlkRmYyZWJMMjc2dHVMZEVXRHZEcGczNTFINHJSelZmalBa?=
 =?utf-8?B?TXJweEtHMHlZdDRIYll2QXpsR3NOVm8rR25uMS9GdFRoejg1bHRXVSszbDZC?=
 =?utf-8?B?SzkveGREQjNxZEh3WERnaVV1VkR1MXFLc3hndEloYzk1Q0Z5VzlaR3RFbmtL?=
 =?utf-8?B?N3NTMmlKaVlGWXFpVE9Yc3djUFcrQzJRZklaeVgvaWFyb1FDbXZiaDcvNnpK?=
 =?utf-8?B?SGp1OTN0eWhzYlhUd1NZY0ZvZ09aM0RJSHl3QzBDVkNnM0RtR3pkd25tNHNw?=
 =?utf-8?B?d1U1bE5LTVoxdkIwMkNnNEZJZFZnUTUzNmUzcW9hSGYzcVRMaWZqbk53c3p3?=
 =?utf-8?B?MzdpWStzcEJQYWZQdEFhS2djc25HR2VXN1V4b2pjK2NWSDBBNTdqR1FTTkRy?=
 =?utf-8?B?a1BxVUJtWWFVcVdqTFVEdkJDUzZDZHh2RXJ0NHRsTDFpbHJxNmRZSnQ2a3FD?=
 =?utf-8?B?RkM2VUVMNzZBL09JTkEzYXA3YUNCeXpwdHI0SWhEVzlCblRscHRCRExvWXRR?=
 =?utf-8?B?UFVac2VFcGkwdjhqaDdrc0xGUkRBeUpDajExdGg1S0lEZEc1YTQyWEhydzZn?=
 =?utf-8?B?azNZMTJuZEJVTFc4eHhVbEMvYWt6ZVRiNzlCeWI3ZWJhSGJzNlZ5YVhwK2RI?=
 =?utf-8?B?ekQxR29SdytncHFEVlZ2eFVwZ09vTXJUaWVCUEsveGtCVjU3eEswU0d6aDdG?=
 =?utf-8?B?ajZYbGl2YUw4b1NJanhXMzJhM2RscnA1bHNoRG1PK1FvODFjd09CNDEvRC9o?=
 =?utf-8?B?VG9HMW9MSXRuZ1BuRU5VK0RnYTZMRXhOaWROVGFHaWhhNnRqeUdCK2VpSDE4?=
 =?utf-8?B?UDRyRDRBV0p1UVNGNi9MTUtQdzF1YVBGc1BOQ2tqNVhiMUNiSTQvMk1Ld1Uz?=
 =?utf-8?B?OXFIejBzTElCclBDQjlzRmVWUHVqU242K0xhQ29xK081VmlLdlUxRnQxRDJz?=
 =?utf-8?B?V0FMOFJRaTU5Tlpualp6dVNXZzZvb0thMVhrYStUOWx1QkV2OTJXazl4TEtF?=
 =?utf-8?B?dE54QmJqaTd6ZEJxWkpPa3Y1THZrRG5FaWpUY3dVNXVlZC9QbzlsYzFWRHNm?=
 =?utf-8?B?c2MxN2dNRGxESU9VOXNJbXJqRnlXQ1FlT1RqS3NsZ1IyMWhxMXE2R3FidERD?=
 =?utf-8?B?K1A2WG9UNnZTeklhVlhYQkxZZzlOSWdvSnBVbFpLLzk5OWNFeFYrRmhTTFQ4?=
 =?utf-8?B?eE5mUEEwSGx5UU40L2QvbUt0SlM4R0ViL0kxMnByYy84eHdhQXRnaWZXUDRO?=
 =?utf-8?B?b1BldW1lNUd2VzJPNkNMWEsvdldWT1NTUHV1ait3aEVoekM3bDJ2QnNUakpJ?=
 =?utf-8?B?L25jUThleCs4TE5lamhjdFIxSXVDNFphVkNIVFBqenRTWURJSzlwcGYxb3cr?=
 =?utf-8?B?VkZVYTFIcEJTT0FBSjAyekk4cWZIWnJ2SmRzbWg3OVZtS3p5bSsyM2kxa09U?=
 =?utf-8?B?Q1JaaU8ySnZVS1YydGswN0lFdGtwQk0vWHZic1Erd0FWcThtN3dFVlk1NkZX?=
 =?utf-8?B?d3l4UUxaWVhRWkxmbHhFVGMxQ2tUY2N1N002b0NyODhURXBGZXhJaVVmdWx3?=
 =?utf-8?B?NG9MdEhUZFlkK1Fyb0E2NUhiTjBLRVc3N1hySUNiTDdxaHNTSTBzTExhbkdk?=
 =?utf-8?B?czAwWENlNGVycU1saW13UEJvM2xUSkxYNjJXay9DSnRIU3oyTVhsTGFncHY4?=
 =?utf-8?B?TVJwRjFkYlY5NEVIa3dZczErRm51c05uVjlSUFYyNG1QcS9wU2M0QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52a5244-3945-4130-17e9-08de40fb671d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 01:42:44.5295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +M+cPjXqrsbikQMrRNYaGEJYtpgOGiIQG+9VX7a645qdKYIGI2l+lFcKfTIZoywaODM+XeVBr7YY88s7G0kljQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11457

From: Peng Fan <peng.fan@nxp.com>

Add DT compatible string for NXP i.MX952 EVK board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43b06711e2efce61ac1fc2794b79bc..b3a6f72341fcddd05ec21912e975878c9d0fed73 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1436,6 +1436,12 @@ properties:
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
+      - description: i.MX952 based Boards
+        items:
+          - enum:
+              - fsl,imx952-evk            # i.MX952 EVK Board
+          - const: fsl,imx952
+
       - description: PHYTEC i.MX 95 FPSC based Boards
         items:
           - enum:

-- 
2.37.1

