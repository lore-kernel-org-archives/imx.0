Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A069338BF8E
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366287; cv=fail; b=jzPdzoiDMQfPjNNmqJPTz4cK0RywtSVSBsPGCtLwUdra6v+RbtXGTyg5epMktuVHphE1rKbxZ9dPdXP/NUax3llnlBmw1mpG/WsSxS9B7D1fq1kJOwbXFgXUbWw7JxFM0yWX1corFIUh0zseD4b4En8/G+Zz7AmkbQ22ZO4sfx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366287; c=relaxed/simple;
	bh=VoNZcpikut+KlH6j09t7sPOrxqqzLj7LP3eDXjRKJlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t4qkwFZjJOdmb6XJqGocSFVPci7+tjFEC3SKaZgUudy8Oo9Bu4AEiwwTwKUlbp4M+FmEARrOdR24KvjjRMOWPs9GyyZMa9ei3XFTEgnjTMXKeeHdb0UC2smaDcu3S7oP/nDRCj/RO5OrZFom3+J25TjNjgRW4uphHRPxLZcCtbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IfhQeMaE; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IfhQeMaE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgud5CUNq0gCmJOQ1aoTDJbm84GMT6StlEs9l0jcd84kboT77FIiVSji+aT89rWIu3XTqx2ylZWb/sMS1XZZdm/uARB39YFLgPXYoXTAVN9hzcrtrU50EVevtSL/yFOUusSFbUYsRV5SMinPC5JBQHCrFLK7YrUJFTGZviLi/ZXMeYsyNLW86j6tI3fU14BD5MB6sKrM3jXuq7yYVpvQMCtYj3zru/tSV+ejCphJfkLIiOFyXItS43fWXzt9SJTxcqr7DjwVo0oN0YmJrlcF6NQwkEiE9NE8Wdz6coGAHDQGFyNRJzjKjWxGFcCQGq2dCcck/1R30pjqMO/Et7FpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvA+iSE/WGnjUaFovsJ6JU6W6w/AyldkOLZwngOXMoM=;
 b=YBSfoeUgudLa0HbHeOuGrfM1YQhSASLe1zl0TRgZOXe27xHfVlGuHN9c/Cf0MsSqR1rE0uXyvUibL4MgiC9t6IVznru0vs2Eh3BmMBlO2SLe7Sc4ruYlQFDPZ3SDejRilSN54jc9Yx+9Y4x7SXDAUG/FOcLq5Jy86QVqGun4VNB/jW7wncdrBWS/CaTplI4Yb3hlflR7qGKO38iz00zyWl5re8KcTUsPttpChmvLdW/ff1xt/CATiyyGsyB6IlPubmrgSckt2t3BDFpxw/mr2i8/eowhSOt6WCn/bDNyS2JVuTGHavYYR8qsdWDkWIyhvSRGJcCYYqezHSB0K2G6mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvA+iSE/WGnjUaFovsJ6JU6W6w/AyldkOLZwngOXMoM=;
 b=IfhQeMaEoLJHEOSawj0uuMxiU+iXfNOtrrgNY5qugN0IrdwnCzGXsH5RNJsvIcAgIuQryMFsCZBcM/7JCAPuRAPyAUTcrxr42D/+kk4VERdFiviry+NHYjVuVsZwvq6JAfkPw5M3ThUzqiScQtv84brucVt+uEjKTUG9ZLMUwNtPZFpE4N/Vey6F1CQcPD/btqGHKWBJ30+0WqXLemHJ2CZM8tGn90BkTnwtIDhpY85ELfBx5lzgSN8I8sypfm3iAMBoWtJY70MHl3FOxcyyzhv7Htq906zscvgXAGK1V19rOZV1bSjut8hlc/CRucP5I0k5fgimzQbwsioPhmPrIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7836.eurprd04.prod.outlook.com (2603:10a6:10:1f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 15:31:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 15:31:15 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 00/11] arm64: dts: freescale: imx8mm-var-som: Align SOM and Symphony DTSs
Date: Tue, 24 Mar 2026 11:31:03 -0400
Message-ID: <177436596117.2105151.10893084166029663045.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR16CA0047.namprd16.prod.outlook.com
 (2603:10b6:805:ca::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 9860c2e2-f408-4190-3d93-08de89ba62dd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 t9i0DKjXkxIHXOYixjtwQCZp2I4eKmWtWsNh2LrfdGJibYAAuWPLypJG8gGADuTXLBmkPnr2I0go3EuLWK8EPuldNQVaMulm5TdBNlBfdOdfJWmzkOvPS+JFbLIQnWfZUVp5vK7mG4bdMd0xZmdcglH3TQQN4/nD65+mBZankMuoIJfipxJ9Kz19+sRcAR5ZsqvOvs9DzRZyohbMw3c2cMCkDSAkYHd0l38RwwiW4DheHBn4vWEyY06x0/nBW4NxLjxKk3zn98JozgdX1a8DwxINUQG338GbxcOb5/uIex+y47dig2ASqJ3qPPjmH0LGpwjokW7gjpbjazIQlqSCrwkUUXoOVc5icIrNc7zQLk90JBkaA46tbzhNQWzZiqg3kA0EVSH+Ik+HVpYN+j+1Hh/mSnP/3OrvR2rtlI/SmW5TZ++GEgDyVrwLwfbJR5JC8AeHMqhOEIySJE8gTLSxvee9DIBev0HMDvbA4n/cFyY5wRjdafxdCGCKHIv/LfVBHXOJMk0Yq4/EYwkjMZUuRpC7K49dCo/FzIaH0oWuFfH+ayejZ4hhV4OG6ei+ESNHvV6BXEtqpHVOZMzDkzzXOvMZd0x+UWFifiOyxFLSEaIwiUqOxyfU1OAIjgWStzIrc13vjcBK9gDo9kCGvm7NS/OvztgKUaTPmMwWHDE77Mqx+JFJCyNHKqdmo+3gs9HjNeMoqHSWjpyxbOXYicwys15w8s4O1D1SXP2BaHKFIqssntc6AuRbX2kCocvDp7XnruwlW2JwFGHPFhiSPx8iQOwJweeClYhZKzhgYhxI8B4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TWV6TEFMUUN5L1BuUXpQTzdiejNSWGVqZ2dWMm9GaDNjTHl6ZUVFbmU4dUl4?=
 =?utf-8?B?akxHUnVaOWhQNU1GblRwUVlKSHkwTDcrMWdwSmFzVU9oWGsyQ2Z4SEpuelJV?=
 =?utf-8?B?cFUxV1pXVE9JRUlzNWFRS01KM0kwQUxXVE1VOE1IUkpUTW1OL1dYUzNMSVdI?=
 =?utf-8?B?VWdKOGIxZUp6dTVFTWd6YTJsMWt0cjR6WU0yNUJOVXZGZ0pnZ29McEZqcFFv?=
 =?utf-8?B?aks3WUwvRXJXTXMzNkdhOHRGVlQ3M2FZZFlsKzdWODJBZ2IyQlZRYjBlZWM2?=
 =?utf-8?B?SVFsa0Y0dHR2MmxHdGtvR1RnRUx0RnhoMFJ5UUhoUm4xOHAxanM0akZCSE9j?=
 =?utf-8?B?TkQzMlZhM0t1R1hISFBDMnYwZS9ZcytXZmRHT3JRN3RSVHFFckgzWlVjY3Bs?=
 =?utf-8?B?L3NsbmliWXpWMzlsMHR4eHNJbnludjZWUzFFZ2s3Z3ZLWkZ0YUJxeTlVeG85?=
 =?utf-8?B?R0FLM0hpcnhWbHhwREI4eXovdkdHYmtaS1h0c2RMaW4yL2FOcERvZndUdE51?=
 =?utf-8?B?RmxWd3hRU3FqczhyTE5oOEdvSlpRU0NibGZKcmdxNEZMOS9IMk5JRm1vdXJV?=
 =?utf-8?B?UE9WZmUwSXRWbVowM05oa0ZMaW9ZcTE0dm5EQWJEQUhEeU4wOXA5dkFCa2J3?=
 =?utf-8?B?dElUdDU4WndQTVY3ZlF2VU5VRkV6VVBnVkF5eCt1cU5NYkdCYTA4K1hYVzlZ?=
 =?utf-8?B?c3VGZUxIOVdQcVc2OFh0a1RSVDl3ZUZlMkM1MjhobjFWVkJkc2lUSkVac3po?=
 =?utf-8?B?RFdBRUwyMENtWGVyMWltQnVBQ2trK2wrWVkwSk9udm9SU1FSZUpLckNQNmdY?=
 =?utf-8?B?c1pyU2M5a2tRRDNGaHFFalVYcnJaTDNoWjFvU1IwQk9oOHFjdXVmWVJVN0p3?=
 =?utf-8?B?WDdUWFVDbUFjS1NBS0R4VjhoM21yTjl1NUhGV2F1aUtNMWRxS1JjejdHRHA5?=
 =?utf-8?B?MVYxbUtrMU1zOEhtMlRndCt4TlBrYm9YZ2VYeUtscUFacTVWZjBjd0o0c04v?=
 =?utf-8?B?alpWMHpnNGZPUWVaM2k0K0FjaGRIa2g5K2tRNS9XTlJDSEhPZEx1dEkyWERH?=
 =?utf-8?B?REJPZS9rK01idHpheXZHRGpFc2VjZ3JIYU9Bcksyc2Fta1lSUFJtTWxGUXYy?=
 =?utf-8?B?ck5KL21OMUwyZW5ka0lKa05QaVZZek1pRjFvdWFLcHFSOXc0dlVVbG5BeEdj?=
 =?utf-8?B?bGhLVGtYSjJLOHBMUDk0anZPZ2lvdGx2NDBlR0hKOUlVYUVEZWRxRjgwYXpU?=
 =?utf-8?B?enBaVlZPMFBXdGZScmlXN1ViOGEvZVZnMDg2RHRsY3IzdGgxT1VleWlnOEVP?=
 =?utf-8?B?cHNGNTZZZXRwKzU0VmFFTDBFM2ZvUk9ZNU83bTJkZHVrOEIyZ1NHWWpUZ3dY?=
 =?utf-8?B?aHUzVUdzZGtJQi9TbFdSb0RhQ2pQeEhGL29QbW8reTNYZ2RMaUJGZDFOT1hy?=
 =?utf-8?B?RDlsaVIxVDA1R1ZuRkh1WFE4Z3ZZU3poMmRhUnZzcDRMWWxpbFJtdHlhcldZ?=
 =?utf-8?B?TXlnTSszaC8rdHpYSWxWMGpmTHpkT3ZoOWIzT0hDRmNGQUdiU1lMb081djJv?=
 =?utf-8?B?L25NQVFuRVNUVmN0dllRMENETkh4YUZLKzBpVjhmV0hLK2gwR1Y4S0kvNlhp?=
 =?utf-8?B?cGlnendncUQ4Q2xsZDJ5SmZlMDl2dUszYVdvNThaOUFvRi9WcE5TUEV1RWtS?=
 =?utf-8?B?NTN4Nm9Yc2FJdXZlYno3bXFndmpkR2xER1ZOSU5DYWhuS1k5YVUrY2c1WHJr?=
 =?utf-8?B?OVZTZG8reTRLak4za2tpSEx5cnQzS1JoV0dVL2RCNThISFdWTU9USXJzNHpQ?=
 =?utf-8?B?ODQwZ1hTWE5XWElzSXoyK0J4R1hxVVRJL1NvUTNqUFllMHFwSXVHWUpkbmUr?=
 =?utf-8?B?SlY0QTA3Q2lLSG9WY0VxY3R4S0lIRGI2dmszaHpIQURRTWkzM1kraU9leXBt?=
 =?utf-8?B?NDhPZjQwaGRsWSs1dVNkMURZQmkvSUFDcUVLSTcrMEFtOXBPamZRcitQVTk1?=
 =?utf-8?B?eEZIakNnbXlvUWZLdGpiSnF6V2ZobU1QWkNqdjdVeDlmbkRrbExkU3RZOWY3?=
 =?utf-8?B?S3RLZVJiVzloK3BCd0pIYjJyVGlkdTJLLzZLUktiTUZEa2hqTmdNL3dXeWJ2?=
 =?utf-8?B?dE9KSFpPMlkvS2dWbkVXQ25BK1FzczAxcG9HeEhsU2RLV3U4ZTZ5YUVmSmlU?=
 =?utf-8?B?WEI3SXB1VEFNN05DRXFXVWNJenY4a3ljdkRsY0dUbmgyTkJRTGdtZC9ic0l5?=
 =?utf-8?B?emVLSWlpN2ZGTlh6d3pmK2dPVkw3YnVWUEV5bGhDaStYRENOMTZocFNFOG9V?=
 =?utf-8?B?bms2eXdUeWU2dUo2RnJtK3I0VVJFUzNhT3Eydyt0N2JvTDJCd2EvQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9860c2e2-f408-4190-3d93-08de89ba62dd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 15:31:15.0449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGWnt65AMz4Tixv0ZilWE7p97UT9mDzY/f1Da6OpQ5zauEdEk7AHKb/PdoqVal8vJB9ZKnWElJLn9aER/JqFhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7836


On Thu, 19 Mar 2026 19:40:20 +0100, Stefano Radaelli wrote:
> This series aligns the i.MX8MM VAR-SOM and VAR-SOM Symphony device
> trees with the latest hardware revisions.
>
> The update consolidates the device tree descriptions to better reflect
> the actual hardware partitioning between the SOM and the carrier board.
> Nodes describing peripherals physically present on the SOM are kept in
> the SOM dtsi, while carrier-specific components are described in the
> corresponding carrier dts.
>
> [...]

Applied, thanks!

[01/11] arm64: dts: freescale: imx8mm-var-som: Move UART4 description to Symphony
        commit: f87a5bdec6fb40b913099d71cfcd5ab36db8c9ff
[02/11] arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
        commit: 07118b23d92eaaf2eba2c9c17f96a2d5bbe319ed
[03/11] arm64: dts: freescale: imx8mm-var-som: Update FEC support with MaxLinear PHY
        commit: d485f4c5d7c5e8a12fc3c64f1e42622f4195f48e
[04/11] arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio codec
        commit: 83bf7b1be4d2f7720541a174d21a7428fabf2946

Adjust commit message by "Add description about I2C recovery GPIO settings"

[05/11] arm64: dts: freescale: imx8mm-var-som: Add MCP251xFD CAN controller
        commit: 684e1a3ed73a85f56dd8eefd98afa842bae30720

Move vendor property microchip,rx-int-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
to last


[06/11] arm64: dts: freescale: imx8mm-var-som: Rework WiFi/BT and add legacy dts
        commit: afee7e5ccd61e07bc50cdd93d963fb5e4a6348f5
[07/11] arm64: dts: imx8mm-var-som-symphony: Move USB configuration from SOM
        commit: 0be9f14dbf5eeef7cb606785b0b3868336891c45
[08/11] arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
        commit: 32e31d0e98f0c8a769d3ab4a4b120e9daa134717
[09/11] arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
        commit: 1808013e644a4f4b4352c7e5fe24d4156922d427
[10/11] arm64: dts: imx8mm-var-som-symphony: Enable I2C4
        commit: f8ee13d589224021b85621a45f97b78405f355bd
[11/11] arm64: dts: imx8mm-var-som-symphony: Enable PCIe
        commit: 074ae0d55f603eb6d58d78a3ff49b1c69e1f9470

Best regards,
--
Frank Li <Frank.Li@nxp.com>
