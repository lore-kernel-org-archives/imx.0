Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C4834EEEA
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954647; cv=fail; b=euA/pRG1oic641U+827OFziABNWBpg3ltyTlhMBJersnc6MUUAqixvEeMbXA18wuCb3HQwYKThIp/AuS6sgxvCw6Ub7ZpZY/VBJOspnrSFxHJocVkpvSY7e/QLpo7AzPQgTNShwKJLDHIjwF7zejANov5eA3wXAiIO3UQ8CWtIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954647; c=relaxed/simple;
	bh=5Kivr9vVcOadnudyj6hfIkRB3jeRvdQcUxgMOkI9lFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mp6stIaqL1B4jqK75TGGQMYq0cC4RSBMkbaO+4G2AcV4TG4rIcQXWC4jPVW6uQWx9TvPRDYJyUuBp4xDkG4VQKD4ooSKDhAUkfSv25jMqdCepBUhM6Zq39HSniROgI60lP8zn0wodGdYkKMmL4q0tF26fXLIOM0IuW9NM0dtud8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k6jPTha+; arc=fail smtp.client-ip=40.107.130.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k6jPTha+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtJvXB3mgl1lQ4FTDIaqEoDvsI2xntiM2OqGtCdnHB5TWZKH4gCc53D8KY5otLCsSTZBHenhrGt+/V3M2sAaqMqiCvtc3WH8ibS4auTbSOoNwZxTfbC6aEdiGvaYRap5LbvicBcD9RDt1O74vHcnOlRDum72iKF4ZFpUgwYUTXwaW9Z/U1VbtTa6K3+QYtOYBz1vD3pHmX+7He9ENOkplPVvUmsPEMSZodxirpAJUsPIombLQIf1Lote9ezShAH/Wkjy3NWTTwD25x3XKrlto8SPDHWUJkgnT9jlQXnSRRXZE8plETqkUq4EzyOxjxW9bZ8zIgbjbKTcODBS4eHf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Srdyrpi/ahYqUFR6ZRrNxnglF7kkkiqiROmqz/mteLM=;
 b=kbU+2dPBbeYC7YFG5eWpPkXVTJqCB7Gd41XqotrnoQDOf3w1yNGpMn2I1l24YYzQw6KlTKT2oqoY8WelVW13u1tcIKuly9MrZmBiWvva+6G6P5Z4LRou15X0JxOBchbW1eY6LL9afbgV1Fln5KIoL+yxgOtGEZCYse06RLBFoREMtIOU+WepkGQUp3oNGdhWg6+JighW84k1I3Eckf6Ym5wiG7pl14HgSkXTG+H0pnYYWYtP7sWwG1EzdxiqCC54hjYrn7N6436tIpPO9IVpFjN+Hsr+99+9NVoUJ1LXNwakdGeRKPgHx6+wnzev0IzjfsIEyejQxZTNJ7nRVFEWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Srdyrpi/ahYqUFR6ZRrNxnglF7kkkiqiROmqz/mteLM=;
 b=k6jPTha+6rGWE6H1tPpUdOnuurfsozTtwL0xn2wGMWwREDfSoNrFD/A4yZGlESOPNLRCEq3TJYHLB/hsz91L4F8gAmAiCIKzOOsdHNP6k5VYuWV/A1Qk7PfaXm+aaYfT4R/9CLz/2Iv2aHckzf8Y99/eujCv+0ESW4okSh4mbiIhUVQOfknfVVnZfTGWW3F367A58VCAbO9NTvTgjss5W4juX6AdMVUpqwhp6jjGpRx3/D0PYXdeUauGgO3dpK/fUdh2cx1yLf6EbanrjBCZENUFuux3im0LYo52cbpdxqxjBUW3XanCKUk2vMWdT+c+nqbJYmCbBAG+uTbtBuoPjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 14:57:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 14:57:22 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6ul-tqma6ul: add nvmem-layout
Date: Mon, 13 Jul 2026 10:57:14 -0400
Message-ID: <178395462843.385474.5855359746444238711.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701090946.1479190-1-Max.Merchel@ew.tq-group.com>
References: <20260701090946.1479190-1-Max.Merchel@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ba4d020-2a5d-4e93-0909-08dee0ef0af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|19092799006|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	f8eGQv/txIzTC21PI+1DfEBq00N8Tg1ju/au20jPwVzbZjBQ9Vjrca225UQ1pjsgnHO5n2PmrCELXnCppRMYKkoeQeIZev1m2wQD6dq307TonTO3kTnThjxWeAg64KdXvxW13Lb3UP0O5OkFBS32+cqHFFeG0iG09r7atYm0it3SUJmtJXzNtxzRVFC5TFIzzyuiuIHe7Jzrkj/k1O3bf1YU1KXcbXaC+1mmdrg6zWHMvS/dl3wRkC8rFtiTYRDqq97hjpDKGhHKtQu0h28KVAKhAERg+DPUqTF+XMEcHJPxGKxax3l7Ro0YpPCel6NT3IYXIFuWRtwfshOlh6lW7f0aP92akbER/XfEyeMBn9znd6hvFqpv1me11BAAJFtPNPZV72JdhQhjmXaMAowwf8LaRAvsmXC7aULkI4q3a3ZDTTgj3p0dI0uCmsIr6JQI4pRjGSHwp8YRf5HkcRCSCE7yz8Y8nTorFda89A3hGzCSQ8Xk/yLc2hNwKyE83zeauKOljTUHGXqaeElCFbtYrhqKGbHCUNdxcR74A0vVy01Z/fqfA+rXCVrSUJjiJttE4mUWWPyqjHv45T45ruHWAKGcW17BkVFwYrnzzWAcE82vfWSIUI2kGUQw3svxCU+ffrD8Ke9vhJd8sDJ0MSgVnDWodijRpX5tI//fw4li1uM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(19092799006)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVlKWDdxYkxpL09ObVNPSnJnc2h3cncvWEwwSlk5c0xkdXgrcUN0eXdmY0NE?=
 =?utf-8?B?bGJ0U1lZTHAyRGxkTVBkblpncmp2clFjMTVnK2RLbTZJdGh5TUdGcmJXTjRy?=
 =?utf-8?B?aHNOVytRMjhNb2g1MHY1OWJvNnVlU3Z0cVpOd0YrajVKaHJ3ODN3Tys3OEdz?=
 =?utf-8?B?OXo3UWZOU2h1YTUxZWxzbWhvTURVVWNIT1hDWUtxWU9Tc2pnL3U1VENHcWdz?=
 =?utf-8?B?SkZnbTUwT01ldGJ4UDZicnM0YU15TkZQZTN6eGpJOC81d256MmdRTW9QNVBJ?=
 =?utf-8?B?TEIzQjUrL0FRTzJyNk95S243NXBMK0FIN3dFU1VKR2tNRDZWZWxmVmRqTUsx?=
 =?utf-8?B?bFZlQXVKVFlWZ3J0bysxbFZ0Nk5USzQvTjJQVW8vRUtlU054WnBqYzFSNnBX?=
 =?utf-8?B?NnZ4QitCYjc0RWhLS0tKVkNSOHU5WlpSSms4bi8rampTaStKdW5rUkZpTDNn?=
 =?utf-8?B?dGI3R3I4cTVONjR2eVpBS0dwUmdBTzVsa01zQkppVy9YTVY1aEYranJodTQv?=
 =?utf-8?B?NmFyOCsrNGhEZFJpUkZoL2d2dU1QcFIwSkk4NGRqNTJjM0pLc0pka0NncHU4?=
 =?utf-8?B?d2tISEZobXpJeEtxOTdXUkFQd3hpWWE1NFpVem04S1V0b3U4Vlh0VjIwSDZh?=
 =?utf-8?B?R0toSHBDTng3aU9wLzRSTWw2ZHFHcWFWRUVNN24wdzg5YkZFMnRQNFV2VUZF?=
 =?utf-8?B?V0J1YnJUK1A1R2FIWnJuaDNqVFhHTzEyYnFZdXQxcFNORytkMTNkUFFKVXI5?=
 =?utf-8?B?aTJrWXJPRTlzS1JEc1daMVcvd014dk9oSTl2VWRNcnBPS2s4cnd6TWhJbXBB?=
 =?utf-8?B?Y0d1YU1zTWU3bVFqSVkzL3k4Um1oQkhkVnpiODgzV2QxQVcwZjVIVTdYcU1q?=
 =?utf-8?B?Zzg4VEs1MmhlNmtIZXlaZFNTRnJ3RmhNZEZTWkJnOElodnE1UVA5aDkvZXZ0?=
 =?utf-8?B?ZkREMlo3TTNZZmJZeUFFYWRTUVFOSlI5RTJqcktTWlc3TlJYRXdzMy9Wc1hx?=
 =?utf-8?B?RXpkSzhwOWRlU082QTNpbGF6OVhYVGtqSGw2QTBRQUpqMkZLdURxdEdBV3U1?=
 =?utf-8?B?TDAyZmtwMC9Kby9kVW5zSzNnNE9ZaG91ZW9lQURLUXJ3OVlkK0I4S0ovT1ph?=
 =?utf-8?B?Q0x3U2tsamdXN2dOaWtpVjhaT1dXU3NoZTNUUDVPb0VYN29tTUlWSkVJVFhN?=
 =?utf-8?B?OVZmYkpjQms2Y1o3YWowanAyejZ1ay8wNGdZcm1tNmM3MVFteGFLeWxNekhZ?=
 =?utf-8?B?ZVlSSldaWVdHNHBtYk05SERzVnl1czV0NWxuaEZ2OWxvTDBwL1pFWHRzZHcy?=
 =?utf-8?B?MlJsNEJLTGpoeFRJMHZJdElxUXJhTzVZcUVqY0ZaMFowZnlsQXV2SzB4OWxh?=
 =?utf-8?B?UWIvamtSYUoxU2pXYS9TeDBkbHA3SkdoREdJUXYwTlRwZW9hbmV2elV0OGh0?=
 =?utf-8?B?cGIxenY3Zi9FL3hoU01QWThnZEwzZkM0L0hwakYraUVtamFGRCsxaFllbWlC?=
 =?utf-8?B?cmZsbkpCRHowZnhYQzFuSVY2NFJtT0Y4bkRWSW4zWTk5M2E4bXlQcmc2VnRO?=
 =?utf-8?B?ZDFOajJ4dWV3MEt0UFVtcHoxcHlCaWhob3ArbjdOVEIvbm95TkpUemNWUXFV?=
 =?utf-8?B?MHpWMFo1V0w3blhSQmdnZEkzRE4xSGJBRzlmRGJDQlBxcExzWkd0eGQwOW5L?=
 =?utf-8?B?WEZCWGpHSDFYR2NPS3gzczB5V1ZkYVFkTTFNWEtIb0tUeE54ejZJU2Q1dXY4?=
 =?utf-8?B?dmVlYndscHg1RGMwMlJhN1RWMEhmbCtWRmVnU3QvekZsL1lhWmNIekdFZ2xU?=
 =?utf-8?B?bi85alpZYU5qWDYxeUhVMUxhV214b0lxRnVwYzM3MzZxNklacUtqZG1kcitF?=
 =?utf-8?B?MzFwalIzNHduSWRTOC9qYUo1empKbFVDYjMyTVF1YUNJRURBL3RKcXVYc2xy?=
 =?utf-8?B?anRNeG5GRndnbzh4WEhNV1RGbFZTMzZCSk1GYmM1cXkxTVMvbFBNRkV6bERH?=
 =?utf-8?B?R2c1bEtRall5aFl5Z2wzQi8zOWpIS2NrelZacEh5MzF3d3ZRZ0ptejI5Qmo3?=
 =?utf-8?B?K0d3M2pLZ080azFDVVhsWUhoV2k2Q01QUVhUT2FNREJvU1lhMFlaeFBpcUE1?=
 =?utf-8?B?aU02VGpMK2JGamlOQnowb3I0OHB3anAyd1dDSWtiekZ3cHhKUHJteFZ5M1Q5?=
 =?utf-8?B?dkdjbWVnL2JuNkRUYkIrSjVhYW5CNEk5Mkp3MzhTaXhRSk5uK2l2WGxsRHg0?=
 =?utf-8?B?MGNIUlZlUE8rREdkczNEZzV3d2E5VHE3QS81QlFYWmM2Z3p1KzdNSnlBek5C?=
 =?utf-8?B?UDcwY0psRHNGb3JaQWFiNnpXaGZhd2VhUjFTNzNZSzgyZVFrelVGYk1ES3VI?=
 =?utf-8?Q?Wb9Ka+W6R6ascq2M=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba4d020-2a5d-4e93-0909-08dee0ef0af1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 14:57:22.1041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKK/fHeDd8M+e7psbEceV172jRiGPavE89Nhe4NiYIEW6fRcbFDSSgmZd8pogugpTu5kDiuaimtL5XVaTVILy566mFRa8NRdzHUNbE79oVTpDRFP1vWDSo+x4CGeADoF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853

From: Frank Li <Frank.Li@nxp.com>


On Wed, 01 Jul 2026 11:09:44 +0200, Max Merchel wrote:
> TQMa6UL has board-information located in EEPROM at offset 0x20.
> Add necessary nodes and properties for nvmem cell.

Applied, thanks!

[1/1] ARM: dts: imx6ul-tqma6ul: add nvmem-layout
      commit: d7a395b7df55d1029e01879ea9e7da1d6e7fdb72

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
