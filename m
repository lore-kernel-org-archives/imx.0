Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DBD539A
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 00:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734914812; cv=fail; b=uNpUFtHgj3RX7hEws6aDfVnZgMsrfx+AxMxA/2ejM6dAzI7m41pB7BZU7WJvwJCmsJ8xq4yZS9YFY50P9rESYtHABxHFtebE5zZoEaWV5gZYiKhQj75ZOUieokEYAjWvfQAaTJuVaWU9LyKbMZ5p/629AZD8rmHWzBM1fAGeKiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734914812; c=relaxed/simple;
	bh=M135gGqHkVhoSlOrBmr5Bo3AjgJo1bmJm2/1nIOc0mE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ny9rQKjyiztoe7Oqubj9dBEQfG9dRCAi4rMyCgKDbCT9eca7ilpVDPE9WESo3NIxzJGPBfhHpUzhf8Z2Rp5qCY5jkad3rRINjb3uvVmYBpxtIGGJ7n+M2MSwMm7+pWYEfz3ScagQGc627odsSdtugk6B2U3EWV66fBWKuC9mjmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vvAw0ljf; arc=fail smtp.client-ip=40.107.22.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vvAw0ljf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZStlbLwsjy0OP/bGcqtHfNk6QKlwGIuveQ4Ts2QiegjvLlJWNgh+4tWJr7PPW6+sOPvXIe6ugoa9rrZ5PNqwgJ9tAlG/Lu7XI/9xYuALUwsvaKaVv4/BMnA2rTO9fU93JzYg3FkFLoWTP5Z0jH6Hry2+s+YVo2OVidtzolFB3XttcmiOHUcPEPoGTYP9x3bHJLQdvDlUDYJ/Un9p7TfT4fCxijkdgt+lQ3ISeMN2NZgSNXq5Weo0JUu/I+mJA5uSiuHSxkGR8JBagODQTgMnpd0JuS27QXQs4jhTbHZjPZW7P5t/1K6il1aXCAop3QdLiLi+UeEdC9O8yhkQ/FHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fhrf9Bu0AlmngK1cMVMeCSZrhIJPB54Sv2hXwfH6HUE=;
 b=LsBgoC/Qq4Odzf1VLeCxQ6HQzBtJ84V47PvbEzwEkOLRsjUc35fuxCel5IpbcBOKyPVh7utusCZQtxoNB2LJrWhxfCyAw4Y/0HY1pAlWsioy5v5vO9QVsb9D3plcj6jPXVxOpFl5k67dHdrLl5waZFa9yLWIF50PCVKATDhNtKptl3nuQ6djQzDjtbWVIrPUsbsrgfCbX12RHWQ7++QmzlvHclq3WzuR6sfStPhGUg5f4Xj2ZSrCzjSO4LWjbnbT8KnKEX+7BGbmjj8eV6eyqqKPAesH+KbSqeCnaBXrGIDa9QPB0QCRX1Hz6LvGlHFq/N8P/fkjUiGtA2lnnX1JEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fhrf9Bu0AlmngK1cMVMeCSZrhIJPB54Sv2hXwfH6HUE=;
 b=vvAw0ljfdXpio1DssYf5MFTbgd+jmzWdiVTCnQHdG3N9VQ4n61dg6l8hsqDz3EbsRyQCvoEotKYzzDeEsWlsyglH16/qjkkKWC0e/4OMr1wjkxqn9zL+HRw4771Oh8I4YasflAH4KxsTUERn8Mhs0o49xfeUvj00xgeDA78NbmmCu0dTF2sLIsnNvbRfLDyJc8Vq2LEANYnBDDecLR6rqN60ZF1cL+kfFiLgIYJzUdpguMu1AInnJDomgG0T0nayHU8X/SB7DOCfClPMPAyZ018E9F+1y2MN4sRbyoY5haHc5rpCmDvv2mVi2SrqvSl5VL1aOgoAcYzfN9hee+gYkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8995.eurprd04.prod.outlook.com (2603:10a6:20b:42e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 00:46:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 00:46:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v4 0/2] Make i.MX9 OCOTP work as accessing controller
Date: Mon, 23 Dec 2024 08:46:12 +0800
Message-Id: <20241223-imx-ocotp-v4-0-f504c1420640@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANSyaGcC/23MTQ7CIBCG4as0rMUwA/bHlfcwLgDBsmhpoCE1T
 e8u7UZMXH6Ted6VRBOcieRarSSY5KLzYx7iVBHdy/FlqHvmTZChAASkblio136eqFbGciZAMHs
 h+X8KxrrlaN0fefcuzj68j3SC/fqvkoAyCl2rFJO2rSW7jct01n4geyNh6ZrSYXbcSllrZa0A9
 et46brS8ewUIm+AdS1r4Ou2bfsAQM7dxRABAAA=
X-Change-ID: 20241212-imx-ocotp-cbef304140f5
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734914780; l=2461;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=M135gGqHkVhoSlOrBmr5Bo3AjgJo1bmJm2/1nIOc0mE=;
 b=UegpPg/2TrKumb4Ga56cr2gsFtCjeiNtGyPtnJrccyPBJXVjMXFAt94llrDWPpJWDvuQ1S86r
 EAqjSduoJgGD3LYnxUxgvH4tpOvKj6w07d19kN7UuCuPy0QzXwZkURa
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8995:EE_
X-MS-Office365-Filtering-Correlation-Id: 8618d8cc-b28a-4179-79db-08dd22eb4440
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cG96b1hVUThNREpIYksyK0laVXFmdG5WcUJjM1p2WDF2Y09uWWo5cHk5UjVu?=
 =?utf-8?B?ZG5mVUVZbGlWVXFjZE5PL0pjbzEwRkdlVUZhV09HRTFRYTlmazVEdVA1a2Ju?=
 =?utf-8?B?NXViSXIvVTBWS05RWCtMK0N3R0wxcHk4c2xFa0ZzbU9BUTlQSUJKQ3VoeHZ4?=
 =?utf-8?B?MlZjZDJjUEFSOTdKci9MSStwRlVmS0RBVlM2ZjRYN25IV3p5OTlVaW1aWE1t?=
 =?utf-8?B?ajVyekJnN0o5aUFYV2cvWGpqUDM3aEVNay9pVmdkUmNFSmswRXZMeTJpSG96?=
 =?utf-8?B?ZlFkdUExdUFFUFZCZGhsOUFqQVo0Znoxd0RHRXlSekgzenp3MTM4QnhOSDhY?=
 =?utf-8?B?WEZDZEVIUlNNYjNROUN1cjN1N1NZaTBrZk1IM1JkSFVOVGEvanVyYitFQ3ZC?=
 =?utf-8?B?bHpUeVdoK2kwMnRobW1UK2d0dTExVC9acFZjajNXNjFrQ0FpZ1lROFp1Tmll?=
 =?utf-8?B?Z0IrOXFGbVUvY3JBaVpYQnNBVkVSRTBpZHBpdmFTenA4a3M5azlWWWxKOEFV?=
 =?utf-8?B?eFBsYk5vQ0FpQlM3T3huN0JsNmtzUGFGQk5LY3g0dnY4SjNDMUJ1TzR6NUQx?=
 =?utf-8?B?bkYxdVRxV1RPM3VaNmovcG9Fb1VQTkVnQWtETWNpMVhlcFFkR2gydW5CcGNK?=
 =?utf-8?B?QkNkSSt1Tk5WZFNtb3lqKzFGYTJtSFIyN0dsQnRpa24zRjFsY01DVUI2aGVF?=
 =?utf-8?B?SDBiVjBua0ozM25WeFcyZmp2U2hJUVVtemhWbGF0MFZaYzJ6M1BMZmhRNEVV?=
 =?utf-8?B?czJseWNxMGZGeEd2ZXBBbXdhYnJPcm1XNEFpcEhmczlzTHlSUFRKYUFtdjh0?=
 =?utf-8?B?NGF0ampPZHZoa2c1UDVvaDVraW9mdDQzT1c5TWt4bXJlZmdhSEV2VmZnZ245?=
 =?utf-8?B?RXgwbE1JaG4wK1ZGQmxiOVZqNXBsam1tbUR1MnBuNW5JSHA2U0dDSFltdHg1?=
 =?utf-8?B?YStuU21vMXlHdDBkb3c1RWU1Z0VtTmk4b3haQm5HL0V2Y0JteHVnRk1hM3hj?=
 =?utf-8?B?Yys0UG5jNEFGM1YvYzRuMVhEaFRqSGJOZGVsNXY4SS9FbThNd3U5WC80bk5p?=
 =?utf-8?B?RlY3UjlhbWgvUTNPVUU2Q1AreFByMk1iTWt6MCtjQnVKSE5kcVRXZ3hGRkJi?=
 =?utf-8?B?bWdmWllFcld4eGl4bjFwMDgydEQ2OTdqckNVUFVzZXQ5bTc0bURnc3E4Yjg0?=
 =?utf-8?B?cEdMcXB5T2dHSDJaUUVrVmtxRU9WYVU5ejZ1bHNwaUNsTlNpa2NQdWpkM2M1?=
 =?utf-8?B?MlhCWHlYNkYyVFlLdml0RTdvRU5qdGhCUW5MQTJNUUxFdmZNS01aN0ZKYjB2?=
 =?utf-8?B?ZGlFWU4zK0RLbG5lSzN1RzdQWDBORjRoQk12dEJENDd3TVljUHkvUUJxUVRy?=
 =?utf-8?B?UlJUMGROUmhpZXBZU00rSGg1V1p2M05uaEFvQ2hqL1gxUGtGN1RncXM5SlRz?=
 =?utf-8?B?V285cUI3b2hmK1o0MmlCYXFSbHZib0ozWFRmZnVYeGJ6Vm5hT01SSDFZeXNN?=
 =?utf-8?B?L1VSTTRqaDJ3OWxrWVBRbFpiNkJ2cFdiam9iWVdiaTJUY2dlQTNkMis0VTVE?=
 =?utf-8?B?YUxzdmRJb1dLckw4Tjh6RDkveGFtTDRGVFlFdngzQjhEbDRZbDF4VW9UK1ht?=
 =?utf-8?B?Mkt5cE5HSDNHcEVzT0pnaTZaRE9iRHAvRitCd0ovZ0tmQzR6T2pidmtRMnhE?=
 =?utf-8?B?TkIwOW1wYm95bXdBMlBITnB5NDNQSFFWNklvQnFQK0RKRU9jd1NidDZ6SlVZ?=
 =?utf-8?B?WkxpaW40Y2c0UXBldGJQRlF3M2dTUUlrV1VIU0dwYjJzdERwdU1FblZmTEVv?=
 =?utf-8?B?NjdYbGJvZmpwaHMvZXp4TGVzWmV0YTlmVEFJVDJJS1hDOTlPbXU3OEZxYmFl?=
 =?utf-8?B?ckJxODdFekt2c09oSEcraEliUUVIY0pTL1hBbkJ3aTJMMVR0SDhBdlB4b2NY?=
 =?utf-8?B?WkwyZ0VpbmR3UW55bzZWZDdMOGxoUEFKU0M0ZkpnWWZqMXRSZ0Fmb2dua1dL?=
 =?utf-8?B?OFpHWnNDMXp3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEt3aDIwZzFBNVU4RmtSQ2taV2VoamR1TVFxZy9zb09xM2hVOXJCVXNocGpu?=
 =?utf-8?B?aDBmQVFUYW81YklxcXg0VzRFckpWV0dvMFcxcGRYSWV1QmFkSXJpY2VHZlFJ?=
 =?utf-8?B?TzF6TUVkMHZubnFzT3ZmdTBlZDgySTlkclVwQ0U5clMxN2JQU21uM2theGdQ?=
 =?utf-8?B?N0lpWUFzRHMwOUoxNUc0VnNYdjZ3b3BJYVRGcmhZUzJPTGNNQmh0Qi9TekJu?=
 =?utf-8?B?K3lSZHpuQmh2Ukl2NENIQWRTRVRycEdCUUFQaXJ0OVdENVl2aEw0VTQvMDJM?=
 =?utf-8?B?QldoV05EY3BadngrOVRyRW5WZTV3eTljdzBLaTFZK1VSM1RNUWcycU5WeGYw?=
 =?utf-8?B?MUU4MnlrM0Q5SkVaUGJuT0NOclZUQzFlNk11b0RPaXVMV2NPM2h2YW1uWjF5?=
 =?utf-8?B?MytjdWNvSkhaWUx0UUQ4MjE4bTZtQUNxRnhuZEVWc1pMNjk2V3lCLzdyVGhF?=
 =?utf-8?B?c1M4S1RlRm9RcUR2cExqd0txc0FRK08wK2JzSzF2bVRIbGJCV3NKN2J3Z1ZQ?=
 =?utf-8?B?UGVKZjJWSzRqSmQxYkRkZmNSWWE0LzI4UE0xejdDMnpGNWxWdjdTR25NdUZZ?=
 =?utf-8?B?YW45RVpEL3NPQmY2dy9qZ084YXdsRXFSc1V3RWova0tteW4yY1N6blRwN3Zp?=
 =?utf-8?B?T0c2NnBmSXA2MEhNOTJTZWhjRmJaSXpaYmZhci8wSkhaZ0V0WmE5UE9GL2h2?=
 =?utf-8?B?dFBGQXpRblN2cktxdm02dnBxN1dOK0lneHZYaDY1OTIzZnM0L0hFMTAzTzIx?=
 =?utf-8?B?R3hiWk1JQjFpTjFPdWNZOWlwZXZEMm1ScUxyZlJuLzNKSURhemRJQmtnWVpB?=
 =?utf-8?B?YXpwckpFcFFEZTZiTHRoMnNGWXRZamdocXZPVlFhdWxRTFlIb2dxNEhhMFZv?=
 =?utf-8?B?UHBiN2w0RVdHNDVOeERiUkpWY1dkQmthdVh4RURpTHlWWi9QdUFlQkRpQWlT?=
 =?utf-8?B?TzlNbW43SXZWSXZlNnhWTjc4Ri9mZHd3TDJsaEM2eEtQQTFFc0lWN3IxcDVR?=
 =?utf-8?B?UmVNQWZyWXJqOFdsS3hKV1BrWU5SUEJvVExVcWpzcFBBd0ZkVW11YjZEMUtE?=
 =?utf-8?B?T2syOU0zTzRXZUFITG9KRFhpVU9KZ1pKdnBuS1BOdnV5d2JpamFzaWEyeEc3?=
 =?utf-8?B?UVhsaXdrVk5hVHcwbnBoVGRPM3BESzFmQ2ZTZUlSL0NkRS8yakt0TWxib3R3?=
 =?utf-8?B?VGJQQ3JWOThyejZJcVZSSEpBdzN2R29ZakhpTnphMHRadm1JZVRiMGg0NHRo?=
 =?utf-8?B?S0pkUXRmSHhnN2QyVitXcUI4WUkwa1NyazZReHhrRVdKd3RzWkFWZlRoL0ln?=
 =?utf-8?B?UUl1TVQrSmZuQ0tyVlRZclhMUVI1c05HM3RXZTdnOC9JaG9XM2R1OVpiTmhM?=
 =?utf-8?B?WUV0OHhhTTZLZGY0R3N4NTBpazVzSy9UMmFZdDQ1OHB6T0oxYmg5ZnNhTHpS?=
 =?utf-8?B?UlpYVnhBcjQ0K0F3ZGx1VU95Snp2QkdNRHJwWGcxYnAzdWE2WGN0K0FDd3Fr?=
 =?utf-8?B?TzB5SDJlekJ6MTBCMDlEV3JxbUIxYmVMZm0xeDZjeE1FRCsxTkphV2tFQUZB?=
 =?utf-8?B?OVluSU1kUlRFaUc3aVF6Umg4cW1Cbld5QlZTSm5xREM3dEdxZHNUUzljNm54?=
 =?utf-8?B?dU9ZOFNHL1VzeC9JcEREQ0poZHJLb25sYUg5cElhaVArNjZIa3hlazYwbG5l?=
 =?utf-8?B?YmQzTzhST1htZm9CZE01M1ZiTzIrcG5lMFdnZERucnZObERRcTJwdXQ1VXNi?=
 =?utf-8?B?SDlUUUVocVhWOUwzVWJFU0tvUTFuejUyWGZKZUlZc3Eyd3BPRWpqMFNrTGM1?=
 =?utf-8?B?QTB0VkR6NVdOQi9qSU1xSlRXQUJTdC9ReFY0SEJTcGk1Sk5CYUxvMmQ5S3Nz?=
 =?utf-8?B?eXNIME4xdTBybGFBek5PNXk5b1N0SWt1NUsyeTIrajdXcThUcVVzYmdiUDk1?=
 =?utf-8?B?YmVoZVlRbHVBUlB4SUZwazNqMTMyckNUU2pQdno5cFNLbE01M0Jxbzc4L1ZD?=
 =?utf-8?B?OThUeHdDNXFqMUxMMk8vUnV4ZlhialhEWGxwK2hxZnhDUXpCUGo4dE45amF1?=
 =?utf-8?B?c0RnVjF0TDV1ZElPaTVCcE56UzVQYkRzbDd6bWxLaG8xQTV6ZjNqM1JhbmpW?=
 =?utf-8?Q?/5pWNvazvwxCWB3KcTjFGZhwo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8618d8cc-b28a-4179-79db-08dd22eb4440
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 00:46:41.6194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/CYcpqRLPCKTJFU9hQdEvZyEuVApq3n0bDdbgRoPxGeTEFZPiyx0/kge5+q/VOsTzP+c4sCTlZNh+Ja1lQvQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8995

Previously there was discussion on using "feature-controller" or
adding a specific node to group the fuse information for U-Boot to
parse and update node. But rejected by DT maintainer(Rob).

Since the STM32 engineers added access controller concept and landed
the support in Linux Kernel, reuse the concept for i.MX.

i.MX OCOTP eFuse has some bits to indicate a specific periphral or
function is avaiable for current chip, for example i.MX93 has variants
that not have NPU. So introduce '#access-controller-cells' for OCOTP,
and add "#access-controllers = <&ocotp [gate_index]>" for periphrals
that needs accessing control checking.

In OCOTP driver, the nodes under "/" will be iterated, and checked
if property "#access-controllers" exsits. If not allow access, detach
the node.

In the end, cpu nodes should still be handled by bootloader.
And I may also update i.MX8M to use same method to support variants
if this patchset is good.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v4:
- Add missing of_node_put(provider)
- Typo fix in commit log
- Link to v3: https://lore.kernel.org/r/20241219-imx-ocotp-v3-0-b22371098071@nxp.com

Changes in v3:
- Add A-b for patch 1
- Use scoped API when iterate nodes and address build warning in patch 2
- I am also thinking that to drop patch 2 to let
 bootloader to iterate the nodes that have access-controllers property and
 update the nodes before booting the kernel. Then just need patch 1 for
 the binding updates. Anyway, comments are welcomed.
- Link to v2: https://lore.kernel.org/r/20241217-imx-ocotp-v2-0-3faa6cbff41b@nxp.com

Changes in v2:
- Add R-b for patch 1
- Use '/' root node instead of '/soc' or '/soc@0' for patch 2
- Link to v1: https://lore.kernel.org/r/20241212-imx-ocotp-v1-0-198bb0af86a0@nxp.com

---
Peng Fan (2):
      dt-bindings: nvmem: imx-ocotp: Introduce #access-controller-cells
      nvmem: imx-ocotp-ele: Support accessing controller for i.MX9

 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |   5 +
 drivers/nvmem/imx-ocotp-ele.c                      | 184 ++++++++++++++++++++-
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        |  24 +++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        |  43 +++++
 4 files changed, 255 insertions(+), 1 deletion(-)
---
base-commit: 6d13015b67d58ddba56631c56e0a6f376ade0867
change-id: 20241212-imx-ocotp-cbef304140f5

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

