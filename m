Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CB72580FB
	for <imx@lists.linux.dev>; Mon, 22 Dec 2025 01:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766367765; cv=fail; b=tC78YkYYELv9PRMwAaY7Ob9IvFaCXBcgPtbauJKtr741LQU8Kx+2NWNW1NkP3EhoqG1R0AC9RGI+gJevCfJ9riF+8e7dKWHnHTP2d2y4ZiCYpWdhYsE7xYH7Ry3bn9DGM3gf8hRKvJjMFeYZsTEBSKgmJ9vMwCHntLhCSM1zID4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766367765; c=relaxed/simple;
	bh=iLQR/txuVdUfv6rWZUrpNEbNYlOcjHnJBjwQFS93aAc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=IwUxFR/U/PlF21Lr3oxWpU0Usxf18oODa/XnqVhFVBugknoS041vjTcZBkjmbYeJuL6ANgJhxTJStvlov0xEX3J+xJCZxFXBQ27zdZTXjVcuDCyJI+Vwg4zv9e7iHBJvrkAR2YZYlrZKSkWuDPCj5TI++gGRXISO1eu2sSXLu4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tmBPAlj5; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tmBPAlj5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRxHpivS1bWI2XQhQXtMtwDeiZe9DPFhsb8AAMKLCVxL1QnyFCJ66wrNO6wcz9K+it87f+cbb1oqFv7DLHA5kzE54vrVAkhTyHZukZos3Et8C5/CzFqjxwrk7WE3DW3mmDykLT3V5v3CV0oxHlq2PFndkpy6IeIwcsjvvA/zQjbqumZM35fDY180oPpub03H0fKzQ+8M9AjdGM/mRbJgHDGz2EH5VFGTtcmqhS7+PnkG7owzGrz0ewtV3IKwNPVzFr8WizRJGYuji5TNTIOKo4t8skENQDreVxKCjrmLconp6Dm5kLoEs9i+Z053UKHrXS72DYevEJXt14vNdmnfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dztGL4SAe8DuIBlbZtQliSCDRpsLQbG0xr9jXj2UGNI=;
 b=EbHcfIZObdtRGTfELhezLokt02J9NDoUUVbPECsS9uYblRQWA4sIRkiZolaNIY1T7zww2G2RrWWU7hVDAFUPY9AXpNBA0MRoo+C4pEtvabcsOKbXzSUPhKUBb65kmL8b5OUcY5eoSdCuoNMflsjlOXhTJXIQ5dsOMUA9StK1Uf9U2JmexiPBbyea+4N7xwh6SVbztYiemqDJme8OPFw3YvqTFIJ1WgiK5nicI4a+nwmSjjqzB5gToDEf5HiMuNgdk/J9sBrDX2ZrxT7lnaPOEJqyLpFgNJT+XMxGQR0UUFf94DRHPfKOGsgpOeWWwqgIpgjiQnQp/lIuymRKQbS+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dztGL4SAe8DuIBlbZtQliSCDRpsLQbG0xr9jXj2UGNI=;
 b=tmBPAlj5wOtSeAIqRlc5MiJ0gq/trY/qiXT15f0d2djJ+PkBkcgdJHP/PDZcYfkRKcvVGABKXoT5I2pdYBfZbBezAfm0AsjIHpYxysHQWJqZAC3vchFnSsnLr7IfjyD7n/6aWzLi3j5kCa6sFfM6ErBcHcSOiFlF2XapgPXHv5huMC10xY1do8XueTrK2rYjDD9RfjPjcoLLV/CiOLNSXNLjcEwrxNNL4jcuMzbup9fdriS8VPQg2P0XiZEIRqJ1pG6FO0jwdckbBgT7CzdQ7H6Cctt1ZCwz+1e34QQGyrNWvOGnOKU0yVw0xlnMU9nuxdifgUXNZ31Z67VI2dvpsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB11457.eurprd04.prod.outlook.com (2603:10a6:10:5ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 01:42:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 01:42:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/3] arm64: dts: Initial support for i.MX952
Date: Mon, 22 Dec 2025 09:42:13 +0800
Message-Id: <20251222-imx952-v1-v2-0-8793ec8bad6e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPWhSGkC/03MQQrDIBCF4auEWdeiQ21oV71HycLo2MwiGjRIS
 vDutYFCYTb/8Ph2yJSYMty7HRIVzhxDCzx1YCcTXiTYtQaUqBWqq+B5u2kURQnSFh2NHqW9QNs
 viTxvh/UcWk+c15jeB13U9/tT+j+lnRRGa9N7Qufl+AjbcrZxhqHW+gHOgz8xoAAAAA==
X-Change-ID: 20251216-imx952-v1-e5c2debf20c4
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
X-MS-Office365-Filtering-Correlation-Id: 30d23ab8-4252-438d-a63f-08de40fb649a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2d2Z1YyT3M4UTFReUxiV0Z3ZHQxaHdMazY1SWZOd2F5bE1pWHc5NjcyVjlI?=
 =?utf-8?B?QWRtRHdhTThVSGZHcDNQRkRIclpxR2gwWVlhLzczaEZyR3NQSXpFeGZ0MEtz?=
 =?utf-8?B?NUtBaDFvMDloUDJkMU1jNlh1Sk0rT1A4dVpOMGRIcTdhY1NUTVRlQ0RTR011?=
 =?utf-8?B?TWR4ZDhUUGt1dERMT3ZIWnBwa0Z3dlkzME5KZFRDWGVuN1JDQUwvbDNaNExn?=
 =?utf-8?B?a1NRdmh4cDlFVW1OTFIwcW1ESk4zWC9xRVpyRmFUT0M5RXFXaDMwM2hqTEVn?=
 =?utf-8?B?cUNsaldFSmx5RFE4QzIxanJZZXg2NHVta09zdGdYM21oWEgxVFYxSGNlNzF0?=
 =?utf-8?B?djBUaTlHRktsVzFlS1NQWG5yK0FTYkkrRUt2NXpxMWVSd2ROSkF0Q2k0OEZS?=
 =?utf-8?B?L1E2K1JCNFJCejEzR2RESENNejdtL3RmRVVoWm5sRHc1WDZKVnUzTitQMy9B?=
 =?utf-8?B?eVNXOVJDVkxDdFVFRjVmYm8rTHpuVzJWU1J2VVh0aHhadVJVR3dUTmlZOGdK?=
 =?utf-8?B?TytmYjJnZEtSeWFxNW44RWU5R3E4OUV4UFQyYzJHcTA4b09hL08rYU40enor?=
 =?utf-8?B?d0tLaTFOUHpJSXZtWS9Ca0dyVVJFN3hIZkcrOVFNcjYvUkcrd2ZDaGx6eDVY?=
 =?utf-8?B?TlpyMWtNR3BibzVQSFloR3pRUzErUGxiU1pZMUEyKytTY0lESm5XTXk4Qzh0?=
 =?utf-8?B?L3UxMDJtS2tickExY2Z6YmNCZms5SzVuZGQ3ZEpWUE5KOW8wWElEc0NWaENU?=
 =?utf-8?B?NE43QU9iakhXZGJJbGo1NWZXd3I1ZVRxZHc3QWlVaGtXc0Z4VG4xZW5ySGlz?=
 =?utf-8?B?YUVaR3BRMlBpOHFvYTZHMEtVaFZzdTZQSjdweTFIbDJXeWIrTTAwYzhKZlBo?=
 =?utf-8?B?V1VEZ2VxaW1vcVd0KzZKQzJCTU5FaXZyazZZcWxVUlNTLzJpeGxtNjJ5a2Rv?=
 =?utf-8?B?MyttZlpkYndSYkNVRlR3bXFPRUNjbDNrb3ZDeGdQeWpRT0hyTzhmTURNWFJs?=
 =?utf-8?B?ajlyb0tJZ3UyQnlyeU90R2N6enVPZmlQcnU2K3lPT1oxSnMzNUV2RjhNZ25L?=
 =?utf-8?B?NEpYOTViYzlkSXd6dGtVVzVnRmM2Y0o1blBuNUNpaW5OU1hpaVQxTWdNYUdL?=
 =?utf-8?B?S0NpM0JOeTU0TWRYRURmQ2pqNDIzNzQrenEwOWduZ21QdHQ3d2VTZU5vNDhO?=
 =?utf-8?B?ZFovSzlqcENlN1UrTEgwMUVoekM4NmFyYjNUNjlVcGNJTHRsdG1mQzhGMG5q?=
 =?utf-8?B?c05yYVhWb2hwNjh3Rm9kZFRrSk5kTU5uN0J3OTU5TU9VWmxXRTFZN3hPcmFH?=
 =?utf-8?B?UytySXRzZllkajBFU0xoQ0dCMFNGSzMvaDNKNFVGVVo1R2k0OTJtNGhtNW0w?=
 =?utf-8?B?YzFEdTQ4eEdCcWZLQ0FpVDN6UGw1eXJzMEN1Q3VIUEpvZFZVK3c5S3Q1S3Bh?=
 =?utf-8?B?dzVFalptZTYvQlltNytOcUVZVm1tYWhkK2pXZS95d2pnZUVMREFZM2JEQmlj?=
 =?utf-8?B?VXRFNktRMFdSSlg4OW8xVWtURG1VM01OeitwSzFCZ2N5djVqL0x4ZGkyakxu?=
 =?utf-8?B?aTcrbWQvM2ZwTksrNXhyQjlHNytVZTFVUVhJN01pdWJSWW1wWmFPYkJ2VnFN?=
 =?utf-8?B?QzRzN2YzbGRIamdBbnNMWWhFNVM4dENUdHU5NEVIQnBpWjdiZU40UlFXUURN?=
 =?utf-8?B?THM2U1grT1JBNXNEeXBFQ0hPOHdkbnFpZHdsczE5OTVjdk9TY3BGK2lacTdx?=
 =?utf-8?B?cXl1L1plZjJUaUdOZGxySUVGcllYaW9ib0wrekptd0VJdHdKTkV0N1F5QndX?=
 =?utf-8?B?SmVUSTVyRHRvKzgrd2x5THRwYnVzWGdnNFk3V0M5RlpLeWE3MGJId0FBOW43?=
 =?utf-8?B?VC9JcldnZ3pON0lOTndLRGFVTmRsaWRaVHY4SG5SakdrUFpDNUx5Mk1valA1?=
 =?utf-8?B?T1lRMVYwVi9YbytjMEx3QWJIS0h6K3RWeGpmc2tEK0FHOXMreEpKQTVKSHM2?=
 =?utf-8?B?aVh1U1dFYlpma21HT2NZdTVuZXlZZUVkSWhBL1k4Y04vR2M2cVppdC9nN2ZF?=
 =?utf-8?B?UytaUVowYUpJdTZHampUNER5OVlUNkNnY1Zodz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFN2MFFxZWpnTjZOT1Irc3dubEFoeC9aRHNBaHl0akpmYUFna1lPVnVzNG4w?=
 =?utf-8?B?cWQ4MWN0NW5oemdDRHhKMjhURjhzdndrRmtMRE1RSTZJNlZraGFiNHl0aXI2?=
 =?utf-8?B?Vi83MmE4UHI4R2tzVUNRWGtVSWo3d09JOC9Bd0hqQVdnTHNydVJDWGR1U0lC?=
 =?utf-8?B?b3RYa3pRVlZJWTEvb0VyUGZvd0RiNkhEM0NSazg2VHlrdFRoV1NDOW9XZERo?=
 =?utf-8?B?VVpDZTVCZWtnZTBEZTlJNWpORzNpZ0twc1JYN0h4ZkxIUXdoNkFhQ2hFMlRL?=
 =?utf-8?B?ZHV1NVordlV1RHJES3ZXTGxBTTY4VE9zTmpZeHFML052aGxOQzVYcFh3TnJP?=
 =?utf-8?B?TXQ0U1pWMWsvNzMrT1NQemQ5dGZadnpqUG9jbUdwQjVIZnFJNnp0S0tKM3BE?=
 =?utf-8?B?QlVkOWVSakNkeHpjUlFodzhMV2gvZjZMd2tJdGdOMHBFelhySVBwMzllQ3RX?=
 =?utf-8?B?VWEvUzZRL2hLR1VDeFMxZFdwUm5DT0lSeXBEMFoyZ3V4V2pFOExEUTV2UnBp?=
 =?utf-8?B?dkVQN0pXeTV0ejdPVjJzYzJCclRyYWUyTFpFVFoxcWFZR0puOXlWMFRSY0ZK?=
 =?utf-8?B?TjkrMUljdDhkTFVSWmdVUWtNMXdSWTZTQmFhSkxuczY3dG1DbTEyaUdydDlV?=
 =?utf-8?B?R1ZFUi9Gd0hMTE40NGNpSlJ0ZlVvZVpRcG1nMDI0RUN5Nm9FZU85SjhuLzN4?=
 =?utf-8?B?WmZPRnBma0NvcCszdGRoUWFuOXlrUjdzWWtiR1Q3OUVUdFpNS1VOYTV6MTE0?=
 =?utf-8?B?NWdnUElKN0dzNmViOTU0eHplUVJuYWRNREpSTlN2b3BzRGovRWxyUmVjT3Z3?=
 =?utf-8?B?Uk16YmVDTHBXbGtUenVORW5WQmRPZzdPMVFLWlFXa2NhcWhTa1dmWVdUSVY3?=
 =?utf-8?B?TVFzNTdBNi9YaXhjdisvN0k1bks2bllYZklTbWFYOGRHdGhhQWh5ZGV0U0E5?=
 =?utf-8?B?SjNFYjZKOXA1T1k4MjRhdkp2SmZmRXdSQ0ZzaFYwS1ZabnFHU3R6NlptSTI4?=
 =?utf-8?B?OCs4b1VUd1BIU3hhZDZWbjJINlloaUdmcHFBeUJzanR4bWFFbHpKVWpxQXRK?=
 =?utf-8?B?UlV6ZjdpeEMvNnRlKzdLSTQ4cWVXYWZyQ0d6eC82bTFFSDJrZzRJdDJPMmRp?=
 =?utf-8?B?clY0TjBlMlA3V3BqS2l2QmNVb3lVZ005Z2xaQVVzRHVQNW5JbDlSaVlzcEor?=
 =?utf-8?B?TTZsTGVjdUVKbE04S0VyTnp5eTlqcnhjbEF0MXZSckovdjRIY09hRlJIdUZi?=
 =?utf-8?B?eVg0TmJDN2Z6Z0c2NDdQVjh5RkFzdThlb0dETG4veFpzVDRKRHg4M3pOWEtz?=
 =?utf-8?B?bTJKSzlSUkIxTmdlaEZEY3FiRDUzT1czUWtFTGliMzBUeUxOcFhWZ2ljMG5w?=
 =?utf-8?B?aWxWbmFXRTJub0EyaTROSjliRDFKSnNOeDYwdFdpb2FIRXloTHJxUWxOWFFU?=
 =?utf-8?B?RW11NGxkV0UrZ3NjWFJ3VmUvaml2TTNGNkNPT3VlM3F0eXAzcEVHRDcrRVlh?=
 =?utf-8?B?YTF0ODlGa0U3azlxc0JULzRSMXlLTUs4Yno3S3N1Zi9hL2FEMG1XWWljek5z?=
 =?utf-8?B?eG92UFF5dnRLNzFSSU0xcVpzT2VydlIvQWNqb0g0c0k5U2VSRE5rL3locXNi?=
 =?utf-8?B?OFJHT0NSaE9pZUtXbFY5Nzc4RW9wWHo0aWFPNzRxTWhNM0tqNVdqMnU0Y3l1?=
 =?utf-8?B?c3VrQ1ZiVHdOQjVTd0xGaENzaU5JNjJRVzB2UzdKNVNOd2tZUXpTekRHeEZn?=
 =?utf-8?B?Y21pOTlGdVNsMk9tSnpUUjdwbWdQamVueWkyK3RRN09WOEdyZlk3d1pOSXBX?=
 =?utf-8?B?WlZZS3RyaFdOL2QrQUJ5WS9mRkpycEV0Nmt2M3NkeEJ5dEpoaUxhb0xuYjZ0?=
 =?utf-8?B?emdDREYrd2g1ZkMzcG5uQm1xVmNMbmoxWCtOcmt2U1NLZ2ZXZ2JLVHFxZm5D?=
 =?utf-8?B?bit0aW42czRYbUZyM0haazBrZHJaa1pQejJndFBMY0wxdFlpMmVud1dDYUVZ?=
 =?utf-8?B?WXNKdU41aHpUbzBjQ3RUclFKZkFrMTZXK1o5L3JCTDZ0WS9tcHFLSlphckpM?=
 =?utf-8?B?dC93UU1wNSs0azVRdTZjMlRpTjVtMXZvSUUvZ0hjQ2RxVjhOZGErVWZRYU9n?=
 =?utf-8?B?d1JadS8vNWNLclJON1haNHVxcC85ZEl1VTRQWVgwbEtMb1JoTXNRY1Z5Umlh?=
 =?utf-8?B?cnVZRkJqcURnYUdkQzBqN1dGMmVWcisxWndxcWFOL1ZnSEVaL0IwcmxJM3dv?=
 =?utf-8?B?dEtCSHpTOHpaKy9uRTRrb2dYOW9XMm12TFJzK1plSXdxS2s5aTMrQm9pKzE3?=
 =?utf-8?B?Qy9tUVZPNDc2N1pmdzZPL3VlVEw3UnpzQnZuT28vbzRxMHBBMXdIUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d23ab8-4252-438d-a63f-08de40fb649a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 01:42:40.4450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvOxOCQdTejzYSNkkZlemOLh4gUQl5KibNfU4ps9sq5gBvhdmMigxotFDeAsMZEPk2JmWUaYFT0fJ8KDYjE5PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11457

Initial device tree for i.MX952 and i.MX952-EVK.
i.MX952 is designed for AI-powered sensor fusion and vision sensing
applications, it features 4 Corte-A55, 1 Cortex-M33, 1 Cortex-M7 and
NXP eIQ NPU and advanced graphics, video and advanced security with
edgelock.

Product info could be found at[1].

Note:
There is checkpatch error for the pin headers:
ERROR: Macros with complex values should be enclosed in parentheses
checkpatch.pl maintainer said "Just ignore the message instead", see[2]

[1]https://www.nxp.com/products/i.MX-952
[2]https://lore.kernel.org/all/fce65a7761fb0e880beb469e2521598f@perches.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Patch 1: Add A-b from Krzysztof
- Patch 2: Per Daniel, update commit msg to include product info. 
- Link to v1: https://lore.kernel.org/r/20251217-imx952-v1-v1-0-a55a7fe2df0b@nxp.com

---
Peng Fan (3):
      dt-bindings: arm: fsl: add i.MX952 EVK board
      arm64: dts: freescale: Add initial device tree for i.MX952
      arm64: dts: freescale: Add i.MX952 EVK basic device tree

 Documentation/devicetree/bindings/arm/fsl.yaml |    6 +
 arch/arm64/boot/dts/freescale/Makefile         |    2 +
 arch/arm64/boot/dts/freescale/imx952-clock.h   |  215 ++++
 arch/arm64/boot/dts/freescale/imx952-evk.dts   |  217 ++++
 arch/arm64/boot/dts/freescale/imx952-pinfunc.h |  867 ++++++++++++++++
 arch/arm64/boot/dts/freescale/imx952-power.h   |   44 +
 arch/arm64/boot/dts/freescale/imx952.dtsi      | 1248 ++++++++++++++++++++++++
 7 files changed, 2599 insertions(+)
---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20251216-imx952-v1-e5c2debf20c4

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

