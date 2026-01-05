Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3975530E0F3
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767613752; cv=fail; b=We72cnOPB1yyG1N+9jUjFUHJPl8CnSquvvjlgUPHYBjTc5yKh6KOiOa/SUP1XzLSTZnoIMbcVNr/MTvvbIZfViPeufSdM0lSkEIQV7BHNsQKQlD1ATwcWJzzdIucE/Ohz4+XV5hgICvcWmnpXkTUnp5V4GfMrMkrr44tKpnZD84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767613752; c=relaxed/simple;
	bh=/OKqpDq/lH6jpz9/Cjq3qH4S0qa4rlvfOImNsC/qEg0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=lhu19PF/c95+ccXQlfth2Ey9Gcxh927LfHyuu7Ycva9t7SQhFNWFoJwkRjTUAIAJXPr7adbZfT9ksuzGxyyzjebJlp1T56iY1CqP57GkSvjhtHOmy8xz2xBhAUdjhRNoLpgu51Y+hJ3BOwQbZV2CZe63LjAxQDbGHmoak+4Kj2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mDVtk9br; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mDVtk9br"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8Qg0++jzeba252NpkIZ2exyDLjKGtNXTFzu/aIW/8gAloL9H7nq2XehcIOBRdrPaUMBcf6RZSkPvujn/6WV57sjZOe2wwGHmrSDqbNKCAD7vTDdqAX3qdDgYN3Q6h2Cdxhkb6ZJmbVvOqkx9W+wiadezciIXBZZHL3H9uWsKERAGFVmEiyV4oAIsZgAsQFSwG3fq7eKLD26XtwtVt5XAlOzKe+5NOcsHTY/lEazcsG8KTjOYa2nwmdcfSvaBEAHTaBXR0AhGDE4XY7gfvdZFOb0QBOr6LsJBdY6fIgX1r83QlRAn64mjkSCjPh/hflH5/cF7V0yzllfjoObfggV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4DBqVh+yGurjPfBrpxGPdtYh0oO+97BiQDetWkjvtU=;
 b=KHe+pZObrkC8Eu439GzxuBa1JCbzis7hlL1Ld326XJ+lmGO22Xxr8UjGLxqmPgfiX42bVzl1EDTf/9D8p8EbKKnvMXfnHn/xPfcbzww7lDhyJJd6eRcO4mllVC1M2ldK0KrJn19b/cP9N1D/hZhMxUeRnDoD4fdc5Nrj9X7V11gCKFRabMh89DxXRSaO+JvmHpOXvLt3LkdbpBjV7rjjatrzR8/4+v/AjM22xg93fa9KrnIA+kI8Z5+/AqBAkeIYgox9MFHwdoqjNBkxtfdAn6mAcQqzpZEx15/5x2hVkeLNd6OhxZxhH1dtu3LRI5siUWBNZ8Ecsktqk4EgsKSxOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4DBqVh+yGurjPfBrpxGPdtYh0oO+97BiQDetWkjvtU=;
 b=mDVtk9brEOeaA9/fQCJa+8Yz0l70Tfla9+OEA1dasoDGJu6D4piVg4oBb6dqeH/fX7/4xKqDj8ycbm+Ht7rT7cDonCJxWul7T1jzcH+gOrnmD8UV+2EotHfr7Sala7NH1I7EK9tZ2/rRhuNCLr+s8e+XVN54aQYqAVWTt7Wnm4H8RAzA7G60tNPx4TZu7oVQ4a4AqkgYdF7MEhaH6RrJLnhdZ68UcD3Ngt/evHcsI+m/LEOdFHyV1kouoDiEArFKlZsSlrPoMsT0Xw57H1GfPPyDVrKUn0moX5AvPTzi7whVG0t6q2hB66KCeqDEweNU/OsI0r65d8UAa+3YdZBdGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9878.eurprd04.prod.outlook.com (2603:10a6:150:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:49:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 11:49:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/7] arm64: dts: imx952: Enable various node for
 i.MX952-EVK
Date: Mon, 05 Jan 2026 19:48:39 +0800
Message-Id: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABelW2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwMT3czcCktTI92UkmJd82SDpERDC4ukFDMjJaCGgqLUtMwKsGHRsbW
 1AOUNowpcAAAA
X-Change-ID: 20260104-imx952-dts-7c0ba188bd62
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9878:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ae6c91-68b0-4e2b-cdd7-08de4c506c49
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjBEVEZIeHQ5SFlFOUgva0VWNk8yYWFZNjhpaVdjT3VEdEpKTGZjTnJSQTZu?=
 =?utf-8?B?emZ3VjVYZFgwRzlPNGgwL3FhemF6ZXorTnZvRXliYXBkZ3dUMWZxd21pc2l1?=
 =?utf-8?B?MHBtN3A2eUV1Y0doQUxyMG1IY1RvMURQdGRkTXB1MDRONnpMUzlTaktJRjgv?=
 =?utf-8?B?WmRqNDNJUHBweWxyWUlyc3VNbXBiMXFhWnVHaVRUMDVvWUZlbjhpZHpkR25h?=
 =?utf-8?B?c3p1c2JPNHhLRUtVaFNFWHRLWHFNWFpMZWRXSzcvNkkyeGczV1JUOXo1UlAr?=
 =?utf-8?B?TDBObkdwVVJsY01oSGFBNUtsTTRHdG1rVjM0bHhCelh1aFgzU08zN2JBUk84?=
 =?utf-8?B?RFY0cUQycGM1SWpUU1EwcEE0VGtaZlZqaUdia1BiY0R6TVhWd09VWUk5eTJQ?=
 =?utf-8?B?OW96K296QUVuNVIwQ3AzeWRhSU5SR3RteldXYmk4YndHeVZUTFJwazErSUho?=
 =?utf-8?B?OExocjFObjZ6MGphS2tBZ0VhTzZRaDZwSmx3bWg4S0FzeHBrL0NaVFp3MFh1?=
 =?utf-8?B?dHFmOVFiY1lhTGg2RitjVXZOa2czN2t4NXVrZVdKeStUNFNsbGk0YWY2bWIy?=
 =?utf-8?B?bTE5UzV0cnRGWTdGZVhjZEwyaEFoa1BzSHdUdVJIVHhNM2VDOE1VK0hneUt2?=
 =?utf-8?B?Z3I3TmtxZmNkRjdRRCtYbDdNdXRlbzdheXNCT3FtK09CV0VEN3pKKytUS0xs?=
 =?utf-8?B?NHN5V3B5TzhDdGNNdm1xTVFKTHpoZ1RNc2I4U3o4RHRYSXp1eldabFRZbGtG?=
 =?utf-8?B?ZlNLazcycjY4OVQ0MmpxWm82d01SSHd0aGt6SlNJOTJVdWFBMHdIN2tvTEhV?=
 =?utf-8?B?SVN1cXFjOXFvRjlVSnVKNkdvbG1yeXB3TFFrMEdjZHVjbUh0czRveUM5MWo2?=
 =?utf-8?B?TFRXSmtWOStVOXJzOFh3UlVyb1F6QlUreWpZWVg1WGFoK3lxcDEzS0g0ZDFL?=
 =?utf-8?B?V25IQ1NpcEtLMkNsZ0xSV1NDcE5OWllMci8xNFBwMEVmVGQ1YkN6WkhkT3I5?=
 =?utf-8?B?TENRWHh0SUlDZGl0T3ljS2dtZjlPZXNrMGVGdmthODhSMjRxYnhLcFlGdXVo?=
 =?utf-8?B?TDRITXppMEhYVE4wSjcxcnp6K3h2b3RMWFdDKzNJOU1QNzhwVjNLQmRmMkly?=
 =?utf-8?B?L2dHRVZDNjhTU0lEV3dsa0syVnhDa1k0N1hacUY2TkVVVkV1c0p4U3hrNzB3?=
 =?utf-8?B?T3ZwM205VWhoTlcrY1QzVTVyZnJaanJvYU9xM2ZuVUdPMm1YcHpkWngyWEs4?=
 =?utf-8?B?NVdNTlB6a3ZJdFhhWWRZZVpOaFlBVjgwNS8ycXFaSUxXdGZQWDZyeWNUQ0gr?=
 =?utf-8?B?cncxR014QS9VMWhlb2lFa0xRaXU4VG1za0NYeERKaDZyaHFEUG5lc1ZFVzVx?=
 =?utf-8?B?aFE0N2xob3RwZzRYYkdjUDljSXlUM2loUU1XNXBoVE1IK3VVU2p4UzhBUmh5?=
 =?utf-8?B?c3NHc1R5WGdjcTRldUlLUVo1YmQ5NUNyb1NnaU91WDBsNmFpa2pqVnBBTGsz?=
 =?utf-8?B?TlZKcFFsb2ZXWGxnOUlrYWJHT1VlbTVTdDN0TnE3VlY0T2YrMUJLL3o3ejY1?=
 =?utf-8?B?S2ZCbjNFVms4T3hqQ1RLdnlQRSs3b1R1UGxsdWZnTUQyeCtHd0o3MFgrSnZK?=
 =?utf-8?B?dzJLRUdIbjRiV25ET1J2NHpmblRXSDFDWVlHaGV3cUZ5VUhlQmp2ekFyRlZC?=
 =?utf-8?B?WGw2Yy9Wek5tTkpHMGhzeGhpRU5IVFFVeEgzcEdIdGZ3UGtGUzJHOW5sZUNv?=
 =?utf-8?B?clBOYnlURWUxT3dtVTFzanVEMTVMTGZEcGcwTUZWT2R3OHdKNmtNQWhvQSs3?=
 =?utf-8?B?aUdTVHowR3UrWktMWmFYZU1JK3ZxVkgvYXlZNWVWMm9qb1hRVmVRTGNDYUQz?=
 =?utf-8?B?UXJsL1pQL1ZKc3VFUk9aNVRsQTA1S3lPS084Y2JsNUloOW43cGJ0Y2c5QUZ4?=
 =?utf-8?B?RHJJMG1XK05CQ2ZzSTVuN0dDMDN3MlYybkV3WnBXRExqdFFDb200bFprU3VE?=
 =?utf-8?B?TmExazlHQlhyT0RIWUlKd3kyVjZ3Zzg0TXpiUkNFUy9jeDh6dWxyRExxZ201?=
 =?utf-8?Q?7hIH78?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0NkaUNsYXdscFdQVldKVnpOSytxclFaUEJXa3pMcFdTdkVzV0N1QVNJQU9q?=
 =?utf-8?B?amZWSE94UWVQSk9LRlUxRlAzUmtCNzgvaXRqTnNsTUhZdDQvMm41d0pRTnBH?=
 =?utf-8?B?d1J5RXNyQldvd0RUQWI0RTd0bE5wdHVNdVBVdVVybXE1ZW5zV09iekE2UEpj?=
 =?utf-8?B?OWlvWUNxV09OQzVXUm5GQmRXWXA3T2RFeXh5WTZzbEY0QWl4dHFZT1FkbGxP?=
 =?utf-8?B?K1RCK0szU2c2UVE2Vmd4YkdZN3RDa1ZvdkRzc2Z5dHZJQnM5RXJnYURjYlhJ?=
 =?utf-8?B?bGpCVVFtaUJpdFV2YmoyK0tmYnphZ0k2RjVyU0NReHNSLzAxM1BLWWlGdVZ1?=
 =?utf-8?B?WEZhZURvWTVYdWhTdzZmcy81WEQyRmNIWDloczlDK1VxSGd4R3NSZlIwK0wx?=
 =?utf-8?B?NXUzbmxmSFhxQ2lacURWcVBoL1luYjZLZEtKMEZNV3ZsMUxzaFB1UGI0REE3?=
 =?utf-8?B?WHRHWFhLbGlpT3BQWCt0QzhkK0wyV1RsbVpDaCt5VHZVYkRWY3IwQ3JZOUpQ?=
 =?utf-8?B?amIxKy9aZ2tJZVdnOTl2d3ovK2piWVBUaGJmZ0RWdDVYdFN6Q1Z3V096WUVL?=
 =?utf-8?B?TzZ5bCtkRGlQSFFtNVozUi9hVVJzVDhCTGMyOVVOZVQ4b1JLWE91V2MwUi9B?=
 =?utf-8?B?L016aEp2TVVWUWM2SjE5OEtGVWdZU0FQTnE4NE5EbHhZRlhsbC91Qmo0Z280?=
 =?utf-8?B?Skw0YW9IMHd1akUvVGhJbmttY25FaVVDNnEzeHkvYWFCc2txeE9HRmZMM2Zm?=
 =?utf-8?B?cXc0Q3NCelVnL2c1SlA5QXppalJ5QTBEanZVOHF4WmJpUU13MzNSQUt0WjU3?=
 =?utf-8?B?cU5xeitEa2pzODVzblVMa2U4alpJd3NYVG4yL0dyVk12SHFQWld1MWZYMDRT?=
 =?utf-8?B?SDFHSTkwYW5rTS9JRUVKZC9CNmRCNmJtVVc3dE15MHdhZjM0eStHdC9LUDVE?=
 =?utf-8?B?NEowV01KN0J3S0k4YVZ4ZmtLUjkyVTF5Z05VTVBrazdWanU3WVRzVGgxelZY?=
 =?utf-8?B?dlhHUEw1WVUxVmpkZjZ6dE5saHJoeXR6QXRJdWFIdDFzNDh4QUJpaVZiSEs4?=
 =?utf-8?B?elBnV2V2VlJvKy9uTUlnanQ1TC8rTGJGNmlkNGFvMzN2WnNYSXIrSEtKa2Np?=
 =?utf-8?B?bFZtMjZsUWFaajZkcG10VC9WUjRWcmZadlpKM1I1RGp1UTkzVENFcm53RGZr?=
 =?utf-8?B?aEQ5bXVHYXUrNXh2NktpaEJ1L1hqTVk4dWFkTldOWmY1WFN6dGhvdEREOEpa?=
 =?utf-8?B?WldycDVPY08ydE53K2RlTVpvTFE0aFIrcHRlNGdGUFhZMEkzWmN6Q1Zmei8z?=
 =?utf-8?B?UyswVU4zYUF2YXE3K0NHQUdyL2pLUSs1T1RQVjFzMGw2RXhha2l2Vm5SaVhQ?=
 =?utf-8?B?TE9TNzlDaXpINlR1TFdDS1Urbk1rTzVtQXJTSVY2QkEwb3VUU0RHcnI4WFZu?=
 =?utf-8?B?clVsTE5pVktvQmpmUytQbGYyWWQ2eW1Xa0ttaFdJa25XODljRnZ4OGd2ZXlm?=
 =?utf-8?B?N1dUSUIzSGFrNDFOV3Fpa1RwaXZnZm03UlRKMStMQTQzRjNwSUllVjdqMDFk?=
 =?utf-8?B?T3BxMTJCNXIvckRaRThQSkJyNlZ6NkJjbmVFNldCcnFFRTJmT3dmaFozWjc0?=
 =?utf-8?B?bnJEeG1yZGtYeHdWL2M4UWdRL29USFdrZFVqdXczeWFDa0NNSHVPYVVMV0Vm?=
 =?utf-8?B?emZHckk5dituY3h1TEhJVnAwQzRsRGVPYjdDTVVXYzVUcmxqQVVWV09tcUU0?=
 =?utf-8?B?WHN3cnIzU3JNZjVaSnlUMXlWTG8vWVNwcXNaWm1Zd09ZZHZvZlUvcFNVNnc2?=
 =?utf-8?B?d0E3dWJtRk5nTW5pRk1FRHVZQTRiYVBjcnFpTno0VzFzMW5kcWE0Y0RPaGxy?=
 =?utf-8?B?NHJWdWE5dTdSaVQram1OS0lxNjF2c2RmeDJwYTN5WFNTaXRFOWFsM1c0TFVS?=
 =?utf-8?B?bHczMW9rdlNEYmFQcXdEd3o1eEtSNXFUYlJ5SjF2bElqS2pnczQ5YVA3azVj?=
 =?utf-8?B?bjMzZWs1WVZhaEl6ZThjbjdyOWVwT1ZOdUJsdXNFZ25XaElLQVA2WEF6eFFF?=
 =?utf-8?B?OXNWM1pLYmdkV0ZDZmRGZVNoMHplbG55ZDgzeVlmS2dsQlY0WTY4cFBJUlM5?=
 =?utf-8?B?dzRCd2IzaWtqcWNkUUhEd2laSk0yNWRyeVFhU2EwQk9QekpWS1I3TUdVZGxR?=
 =?utf-8?B?ZnU0SUdCTWk1OEpZTzh5RkdVR1NKT1MvSHpzS05SMFBGN0hweXR4dGFtWmtk?=
 =?utf-8?B?elBqTDFiNWg3eCtKdDBoUDZMTlpwNEhObm41ZVFYQUdjeXRzcGROenVrSW5K?=
 =?utf-8?B?ZnpRRDY2eXluRVRIMXo2andGWm1wbG5Fa0MxeDMrdVNaZmhJMloxZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ae6c91-68b0-4e2b-cdd7-08de4c506c49
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:49:03.2330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zx3gWeWaavGnBGWA/fP+V8+qoYN3jP53OjO2tQImETmOiXAUreLj5Hmq+w3qOVdt4yiZrK9kXpkWIFJHc6d+9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9878

Patch 1: Enable cpuidle for A55
Patch [2-7]: Enable wdog/usb/spi/uart/i2c for i.MX952-EVK

Patchset is based on Shawn's for-next tree, because Linux Next tree
is not updated.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (7):
      arm64: dts: imx952: Add idle-states node
      arm64: dts: imx952-evk: Enable I2C[2,3,4,6,7] bus
      arm64: dts: imx952-evk: Enable UART5
      arm64: dts: imx952-evk: Enable SPI7
      arm64: dts: imx952-evk: Enable USB[1,2]
      arm64: dts: imx952-evk: Enable wdog3
      arm64: dts: imx952-evk: Add nxp,ctrl-ids for scmi misc

 arch/arm64/boot/dts/freescale/imx952-evk.dts | 302 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx952.dtsi    |  18 ++
 2 files changed, 320 insertions(+)
---
base-commit: 01c3d32bd17362df2c94efded93a1866205c3fc3
change-id: 20260104-imx952-dts-7c0ba188bd62

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

