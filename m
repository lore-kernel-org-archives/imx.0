Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013060.outbound.protection.outlook.com [52.101.83.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EF5379C59
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325536; cv=fail; b=byMx/U+QhvxPo46XGgjb7vS1KFlzzsvGj0A4db8E/B2ix+xTBk3v0XD2ly3B+xLeS3ee34JAH9Tbdw7Rokrpajyt0TQxfst31o5U6LGtFUU+S3WyRhLnpAfW6hxHZbsfOPKhGc2+6EKZthN5R4tw1OIdO1pVG0mHpTgR/BA+iFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325536; c=relaxed/simple;
	bh=7UgeYyKsKt7suksZevYS/a5nDvcBkO1CKa18uWHtiC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qi2GpnEBwPcCNRelxHQ6HI+6p7LsvQ8xcVbIVh9Ebi37Bf0AOz1sbPT8I2Jxx+fNoHmB/O9k6P76dt9UkWsMfTb5WNq/y2DciW9x0xxoq9OAYTjG8lGzg24fOJOORLzsBNRRzfbd//t7MJayZHf2gWsifk3++2FHefpipHLoDgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QLOePfdV; arc=fail smtp.client-ip=52.101.83.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QLOePfdV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jik/RmzvS0pdpg3nY8EH1d1SLX3GFR5Blvo5gSLEVk10x5ZuWXly1xa8MdLKD2XYvV/qfRdcQnPcrpDQKTDW8oVd/VbZSvGuLgpb33skX5wrZg/DKEBcJtSWpb27oJBqO+anWbMmLwW93aYc/9ed1+JlV9N92F+Q97TxLRlka3CREO4+4xJ5DmwAhj8367GNa+55cViixgYrwgYDZLS1gOOi6DjbCJePGHbNVW+UvDZ4xhA89w4JK60CyKOmBF2iP0GOtaqUPLvwQrFlyT9uJMFs2xjY8whxzRe9AhR4xqHSGUeMQgp7aMDOmHZcwZufegLr3aHMHrEA8+b0HK4G0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4FbC88icyep+r7/dP5/Scb/Nd+NdsLND46gzlO9XhM=;
 b=SP788MAFK58GacNoBLXaKGa0X+EyUKv/rkwbEeWjaHfCEG9T59HYYQpPJHWRJ2erfD7asPzAMCBBpu3Dr4iZl1tJk0POgBu2xmD5xDU4xBfNk1P6h9h0LTRl0dxPsdxE43bNWbjp+7YcferAtb/sfA8y9UReWHCG7fM0ybjBkSX852AYEKw516bZKtdCYLX12OLp0dzDncMB6WUz7dyWt2HleKaYSr/PQRvk7bVdXeEeHpBZcvzbAa/zYw/rCT+YqDmsCZwp/6fp6CvuqZVYMHRWdoJIC7AUN2DArOrOKYeWW3flXeP/Lm/lO8XBk/vfd+G7aV+6XTUsPS0iZnelUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4FbC88icyep+r7/dP5/Scb/Nd+NdsLND46gzlO9XhM=;
 b=QLOePfdVUaWAj5u/OhW6nr9Nh0K0z3yFmVmr/Zr1xUIN3uU1rUdQyY66IaQfZ4mMKYvHTELAKZdfgM4C9FE+0xtQOVJ1oDK1gA++kdCoqW/cSxR1qdNzaVY4LQOoSZuJgM7PGwrGxrIDqTB1knr5ja3ngzekDMcsaINHW/RFtFERBulr0a+zs1b9zu+kGe0ovdEGd7RwZkK7L4Pe05JTwPd/Eq8q/zjHDgYEx1BkEiW2oNBAA6b7crfBccXcNC70CiB+NwSZFtVMvNVwO2m68wrdMRygW0SJsC3xiCRKq0zxqErYOPbICDB5C/UTEVncE0+PUdumXSh1NZzCvPANbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 14:52:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 14:52:09 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus DHCOM SoM and boards
Date: Mon,  1 Jun 2026 10:51:58 -0400
Message-ID: <178032549988.3914057.11721734182930821482.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324190544.74531-1-marex@nabladev.com>
References: <20260324190544.74531-1-marex@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:806:121::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: b49c1386-0fb0-4805-53fc-08debfed5b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hIYptQOQ7dWWV9503TuhHT07deiuYEt1QSHsS7Pm8QRdRnI9uT5rRk/TjTdAjgdUZi7/0uFECt6ti3K05Yu7hxHNPhbdxy7NQNuJKUI5Igr9/LrqgzBETRVjUCs1Re9OQYCNjPmYFUjwO8NaqLsYOtNekkdpBXNkLPaC8wVPdxEwdqCCuDh2qS6PruPHr2KvIRGb8hZybxn/8P6Yiir4n1fiOFBI7sqwD9QxPFJB+VPpw4wER+Z2HOLwP7NHZhxTJUlgN2hqBi+kgKG7cSAHrTvfDeHY1V5Ct5p7TSPW2FszbsH3P+CVXZTUhlopZfUVqiC1yJySvHxh7Y4VntJCyqOBr4KXhM6TpasepMNVeYDTj2AmRDuVmKbpEsxLWodRzoXuYuClBOaqhn9HHuxPU2kCB6ZB8MjZwwVFCPWyjfC/NkJdIySPtcApaDD8lDz0FSG+VQoNIxyFOoHfQyMqmKIWQMPP3g0BbNnKWikxxgIJeM9Q83NduMoszysZn7IYtbBTXYMkL9i2dDE+uekN7CkIVVbiPGjK5S1VfwwcKmjo1BM2iesmutk+jfsgC0S3y7ySCfrJcMAWPn43HaMu1ulwd2/I0KcxWw9aitx9C4jwuf+d0STkR5w31ZzCk9OOk4VgoogwXdCWqdlAPJiJV+5wYq+vWlaaikXQbJ0Kwf+9ZLjX46/TQIFUUwNAYTqI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2QyTWhVK3pJc0ZyVVNwa2NDNE81alo0OXdzRnZNOWg2TWdnTzdiSXhtd3c1?=
 =?utf-8?B?aHFINU0yZGU2T3dvR0tFajN6L0pHU3pYRjYzeVRlVXlORE5MaEhhVzBQM2FQ?=
 =?utf-8?B?T2Q5NWhUalNtSEtKcmVkVCs1dGk1NGhqNmxua3VBd1B5RHM5TG01TGpPbDVL?=
 =?utf-8?B?T016ZW1HOFFQeXZobDRrb0c0ZlltMUFzbXhDVzEvZUNIQWp4eFJFTjQzN1JZ?=
 =?utf-8?B?UDVqMjNiOUhhbDFsZWp4K1NkSFR2TWF0S1M0aHhDSytoWmNUdi9qL2xBWVpS?=
 =?utf-8?B?S3Y5eWZ1Z0h3a2xpS0hUR1hZdWs3UlYwS0E3UUZZZWRDaUJHeS9rYzEyUDRP?=
 =?utf-8?B?ZGJLd05WNXNCMkdVUzVzQU13WjJPdm5pNW9vUUVCRHRLSGdGTjY2ZDRreUZN?=
 =?utf-8?B?TUJQWUd0bUhlMGpKM0hzbHRrTHdObEV5V1pSNy80VVJUQm1RcDNXajVuSExu?=
 =?utf-8?B?NEZLNUY5Wng4K2RUcDlpU0hNZ3BtYjI4RXVtQzMzNmZnQVdhREo3RW5EOHNl?=
 =?utf-8?B?N0IwL3YvQ2hlVmtrVFhBTmVNQVZVTFgzcnRKbm5RcG5PV3pzbEQvcUd0cWZ5?=
 =?utf-8?B?YWxpZWlGQkhrOGZINW9iWjV5dDJKcWdXcHZSYnNERkdZbXlIclJyTlhQTEc5?=
 =?utf-8?B?QldzaXh5VkJBOWV0bkx1MXFQTFdsWXAzeXhRdzhiVFQyS2ZsYmNyOWFWQXhK?=
 =?utf-8?B?YXl0NmNIbVpHWDAzNHZtYTJXaVJpR2sva1lNT2ZobXNZSS9RLy9MSnM1bVE0?=
 =?utf-8?B?U2xKbS9obzlqQU5SUXNTb1FhRG80ZDczaVA2MWE0NFVtbFNlb0oyVWxzdG1a?=
 =?utf-8?B?RUM4U1R1N0piZnBJTnEzM1c0UVgwdWliVjBvOHVEY2hPTU5qbGRDQVBaenY4?=
 =?utf-8?B?dGZ1TlptV3B4VFRkc2JyODU2OGNBZ2dwTkdPay9CZEc2UjAxM0J0QjdQRmZF?=
 =?utf-8?B?ZjFkODFMUFN5RTJodHpWNWQwejJKbHcvY0pjdmZ3VkZHUVFZbFM2U2hLTGwv?=
 =?utf-8?B?d0E5c1F2bWhDZ3h5cXczTGFBbzRIUmRybnBFR29IUjRpQlJ6ZjlsY2dkeUh0?=
 =?utf-8?B?VG40OExJRDlxQjJUYXdHdDhETW1IZWtwcWQxREtaaStEcVVOQVYvNm5LTEFT?=
 =?utf-8?B?Z01aNXgyWlQralZQeVFNZU4ySDlYakNlRVllRnl2RDZndXdUL0lXSE14SUh1?=
 =?utf-8?B?TjBIR2c0aDJQdDB3RnhpckljZkFLVVFwUlhYU3ZyUGQ5TmI0eFpBaE1UcTBP?=
 =?utf-8?B?NzdVdkREZG5vUzZ3VEVWbEo4Y3Q0N0JXOGN5NnoxcGxneXRDM0ZFQ2l2YlAz?=
 =?utf-8?B?RG0zMEt4aUIyekVYZGVCWHNCa1ltVTUrZS9oaVFJeDV6L1VJbUUvS0M1OTUx?=
 =?utf-8?B?VGszVjFhVlUwOXNkUEhRMmFkRittUDVCQkcwaGc4cmxBZ3RZK0NpN0dOVFNU?=
 =?utf-8?B?S2VOZEp6ajJOWHVqWXFWVU1Ob1F0QWpkb002aWhjUk1aUHFFMDRsUDJXc2xM?=
 =?utf-8?B?NS9IaEV2cDluVE9oSkFXN1BGTHRlZ2t6V3J2Rnh2S0JISkc3bGJQeFNJTGJH?=
 =?utf-8?B?aldJMnFKUEVyT3J5d2EzQTIyQUI1WGRlVE14dXdNelhjUENRYnczbHRUaXJ1?=
 =?utf-8?B?TGM1T0pPL2JSM3FKbjZwekRFelY2NElrTkpsSGtYeGVmWTBENWQ3dXJ3alVK?=
 =?utf-8?B?TC9SSjFjV0JFY3NqUlhkTnJCb3NZQjE4Q29IVGwwb1dZU1NJNVltdXFjMlBZ?=
 =?utf-8?B?Vkp5WlJVc1dTa3JXT2F6eHIraHVWVnVSUUI5MnltSDNZaEp5Q3dzNUFtcGxj?=
 =?utf-8?B?dk44ZVBKWFJIZlpiTE1pVTRuN04rRWtIUHBVdlB2NzJlbWZHWjVZbEpicHFW?=
 =?utf-8?B?T2gvK09wbWY2cFhvRzZsblc5dU16RDdaRi8zV3p5MzIrdllGYnZXRzZLWVhs?=
 =?utf-8?B?MVhiMmo5My84SzVpMklyc3FOZEluYjJoYkRUVVlINzhvb2E5RVJMRGFqSlJU?=
 =?utf-8?B?SkMwaE1TNWJCR2xwS0QyMC9kaUUyaEJXVGNxMC9QWFc5S3RoamZKdzZzak4x?=
 =?utf-8?B?N1hCaHdJUmhJcnZZR3h2eWF4RkUrSHZlcUdTTGdOVGt4dlFkT2lwZmcwY2xt?=
 =?utf-8?B?M2cxSEVNbXY4Vm0xN1dPYXVqRjFzNWNSMUZDMDJTYkZpcm1Oa3RyZ0VucHJ6?=
 =?utf-8?B?TGQwbkkyZVlMMDRoN3dsc1p2dVdsSGpoSXlBRVhsRjNWL3ZoaVZvU1h0ZFRo?=
 =?utf-8?B?RjZObm9HS1hOeE03bk5pbGZIaVFzWlBtRGxGakVyTlJLT2MzVk44bTFoc2JJ?=
 =?utf-8?B?bUc4eTRiTzdiVHZuTEgrRUpFeENZK1J2K2o4bDNPNHB6TmdWQStldmR4YXoy?=
 =?utf-8?Q?0+4IvOvpRuHeEe5+Yip79+Y8okFPTv9W/Ouo7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49c1386-0fb0-4805-53fc-08debfed5b55
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:52:09.8171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Esqv17z9CdfIjn/snb1JvR77Nz7Ht/2hvrDELfolE3iozYF5ttQg8dxfQRPB649017hpjwB7SV72zvpIuA8Aq92+wBesM+aFG18XAu8Y7C8QxXE0XWTRenm0x0bE6cpe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

From: Frank Li <Frank.Li@nxp.com>


On Tue, 24 Mar 2026 20:04:19 +0100, Marek Vasut wrote:
> Add DT overlays to support DH i.MX8M Plus DHCOM SoM variants and carrier
> board expansion modules. The following DT overlays are implemented:
> - SoM:
>   - DH 660-x00 SoM with 1xRMII PHY
>   - DH 660-x00 SoM with 2xRMII PHY
> - PDK2:
>   - DH 505-200 Display board in edge connector X12 via direct LVDS
>   - DH 531-100 SPI/I2C board in header X21
>   - DH 531-200 SPI/I2C board in header X22
>   - DH 560-200 Display board in edge connector X12
> - PDK3:
>   - DH 505-200 Display board in edge connector X36 via direct LVDS
>   - DH 531-100 SPI/I2C board in header X40
>   - DH 531-200 SPI/I2C board in header X41
>   - DH 560-300 Display board in edge connector X36
>   - EA muRata 2AE M.2 A/E-Key card in connector X20
>   - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X31
>   - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X29
> - PicoITX:
>   - DH 626-100 Display board in edge connector X2
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus DHCOM SoM and boards
      commit: 244b25e43c15b6d9e5b5c0f5187743eb2fe7a5b8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
