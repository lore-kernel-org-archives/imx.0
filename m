Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A3F494806
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 19:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786045285; cv=fail; b=WWVAC0HKbg+Luw68KOlMVGBrnfCKzlUb9h8+r8v4A9GRWl+OxLQzqI4B4nRl81SmyJOfuB+cRFIDLdi4yIs6xwfcsHDomBE5D+otAXxiEfTmlxNLdasCteOvehebCyW/L/nUEa5BPgVtu1NPrgqfE1nS6jOii127TiNoUj5ucUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786045285; c=relaxed/simple;
	bh=evawNXbFNiZTQallDTIAwxuK7r3E7Xkb5KNJlMU9LvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EmRKWpLrWnKrZKaSunNCTALZ8RohALakaNSsoEIuyk5FH1BiTEfTRNOB9OYw1bV0U8Dg1CjWgwcDGQssZ2+ivqmIoDhcZW0fmKKVrVNBQcs0rvGfsAxQwAMScqVxGHiY4uHs7ZhrLASIkNkieGqUI1JgmrqfOKXVmpO2eMzcGYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tw3gG0r4; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tw3gG0r4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eK3D+Dl8aWdDkCimIP5HYCOajANePux7TmiP9XbQGPaShDTl60L5OUO3XIzS44cWcB7Qu0cJR40E1TiqOmp8ok/+NsYvWutjOGfHC5mbHc9gqo6VEerk2EuV5w0UZVwPwL/pZQSl4gWNG909iuUf3SsAltsIEgCVeld1uHxF74gTm5WAcXTgjC7sTb5Ef+4tTV16kTYQGXJUeoo36jW7yGlybV0h3SsBLgDQrrbdL3/gFsDnh/r1HAFZmCsGhhcSLSMFFJ+DT27UPFp4sY5J5rs+q/K4xsp32w55nH/LWTsZLO+2OSv95tbsWzgv4D6LSHvBmdcCjDjrn4FozxXpqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouoXfkrGcnJ36julu2lleZ+xEbFRuDF/Cs3+Y8rxPO4=;
 b=XR1YewXmfDOA8xzqD9kRpa9+Ii53zRWNAjTNF+RFtHWrrQdi1D9N4HEM5GNEV7bnTLxyr9u8qKt3UtPd3WuRy8krt5PkB1ahfwUn5b/6hTGJGylcJzOJc7EKLj2PVj1UU/esUW5yjXM7sWLoMVlUbeav67LH+a4e/ZcXd5v61h9bfQy3Zt14BcGXe2iNjSHkY/8UYIGmTcUZ3RYC+TCrS+97atoDyvkbl43Fgujv83ECs7gCFyAKh9OLjT6kQFqlCnLrEo2xd9DSctwj8WCKUc2oiX+RFl0vqwWrGbV3Tjv1Vzvp1QZG0LFzmlJnfMda5RygxaB4vz3j7fh/QFJLAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouoXfkrGcnJ36julu2lleZ+xEbFRuDF/Cs3+Y8rxPO4=;
 b=Tw3gG0r4pLaFl0gGbj0Rd+05mynTBEpdcVFQF/6WEJPbpRPaPS4H3vq6yXG+FDiM00jgTdoPo1l2mlHnCfoNxjtLaCNE4xfc/tJ/edSS9HtVuRIGBfECMCEgnGIZJI+UcQVJRFiTgUmN5B2yiQDH8SPE7GL2VXal+CtDTvU6tvqAjKfm5VSmLrfbVklJQ57M+uUSlQXicRne6TqLKsucp3A/wYOWPCndprcQczzRKaamm3pu+WPgWQ977wBoAP8Czlm2itnzwyg9xaGdGuIbIUcMXRIQiXqnvIbNjuwaG7jG0pAweRqLi/UM3167cMp4L7YsPnbRPGMQNIZH1krZDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11191.eurprd04.prod.outlook.com (2603:10a6:150:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 19:41:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 19:41:19 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH 0/2] arm64: dts: imx8qm: add smmu information for usb and add hsic usb port
Date: Thu,  6 Aug 2026 15:41:11 -0400
Message-ID: <178604519571.419724.9506069993534290890.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0051.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11191:EE_
X-MS-Office365-Filtering-Correlation-Id: 4007f4cb-7ecc-43af-c5d8-08def3f2afef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|19092799006|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	avvEJZoGJTOpQUbQCsreFh4Q/FZlZHYt7xH63rHx+YHUYqNyYKqvogryDNGBYKlshiTczqFc3o7O/2XtEa+ewof60yupWksmc7yI2WfTwpOLkFk+pNiA1llovTMnexQqdlu/lQAREC3wzQX+ZmFxDoqhHlClewWEC3EqqOZLqp3F7DCmVvkEpu8Yr7aDcfnXv17gKShbxsQPUomMRVVc1Kf2Qb8kjC6I9FlVrrPoKFaZ8ofj1kaBDF/ylrN1qUQs0O/UTXWKirSfQAom4Jzgq867yF4xfr+o0waIj2JBeXYhs1Vj5D+f9spCP6InnoEwBRHdLTPdSMI13fVZZ46Ge90q/le4vPGzGI1OtOwap4Rq4H8+C25S8i5UcHtZR6eXgdx7BuK2WTpiVkJKhLwqbQuOwE+NBwK4DyJ+OzDPkPUkLenn7sdFevHUYl38JW9lR0YETKwPL1bUd5hVsthWFqZ34Snofz0Qdtyp1edLSdtZDyyHmqrBWHXvUaXuAPTp5psXb1Mg8l0SwS0dEhu2xguCRInhFtsd7H4vkzHZP9V545TCi0YQwZqSChpDGzo9hZm2s0bfIflamS5AMjcf47iDWmHXu6o7eey1iQqpCxe3nHeFLY4HzFTReBNKe9UH8Sg9FxnOdXTeSNapFtTWTx/qjDv/ueYjqGM3ppqboks=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjdtNVA4Z2g4S05Ga29zZ0xjK1pVYWkxcytMcFZ3SFhLVHVzajg5YlM2bHNl?=
 =?utf-8?B?TUVTYnVTVHhuQ2hFMnM3UThOSUlFeElrbHpaNG1USjFxVWNPL0JDR2s5SndX?=
 =?utf-8?B?NkFWdFdUQW5tbFRYc0VxUTR4OGU2SE9JTmtQYmpkcFJNQjRYL2FTUmRlV3Zh?=
 =?utf-8?B?ZHNxTDJWOE5GQTZwM2FaeVl6ZmxQUFIwWXN3bDc1aWJoeUJzUTc2NW9Ednla?=
 =?utf-8?B?bjV5SVpyTnJJWDlrN1I5ZEhYMUlzenhWbnc0SFBEWGVlQjdjK2VJaElQUEdt?=
 =?utf-8?B?bk1nbzEzZE5SUkU5cVMrUVQ3MC9yYnlFMnBNVjFEWEd3dG9pTDJOZnJXUDA3?=
 =?utf-8?B?TG10UzBYalprZG94RDFCdDAwS1dNMldIQVpId3BEcWhPcVlDbDczM2pYVjEz?=
 =?utf-8?B?ajI4NWJFaWNUNlZLRlV3QmdOVUJ2ai96NXNTUzk0ZFVHaGsxN0lSajR2eDU1?=
 =?utf-8?B?aEZVblNZYmVtUERiVFliWkZVSFRIU2ZiR3JDb0VXTW9yVEhsOS95bVlrcEpn?=
 =?utf-8?B?OFZ5UG1ISVBoMXFZNTArNkFHSytxUWhkNnJkV1o5MXptNk1ydmhoWEhranFt?=
 =?utf-8?B?YkZQdkgzY09VRFJid1ZTbXVDd3JXV29LQkE5bEFocW9ZU3R4akhCYUdGQXAz?=
 =?utf-8?B?WkY5amIyLzJPM3RQQXd2VFZ3ZmRpQldGYmc3eUxqaTk0b3RmZ0txNWY3ZW5N?=
 =?utf-8?B?bjh4KzVGak1Gb3I2M2wrR1ZsRnZDa1gzKzJyYWkzRmRNU0cvekpLTEVER1BM?=
 =?utf-8?B?TXlyZGNhWHNaZmxrSTNLYkkvZ1RGbkRaWkZhVWcvZnVCampVVGZRU0FsdUNG?=
 =?utf-8?B?WWFBN3czMGVPMExCUnV0YnZIcHhHNk5zb0FHVkpEVEtETGYvSS9mSDdUZlB1?=
 =?utf-8?B?amVXalNzekdkYWxLOVVOMjNmZ09kcTl2eHJDN2cvQmxCSnBJZUZoN1cxeGZF?=
 =?utf-8?B?QmxrQURVWjJXKzNKSUlEV1hFd3c1Tzl2a3lSTlVkU1BRWGdUNXNLOGd5dXAx?=
 =?utf-8?B?SkcwNWFWT2NySHdCVzAzdUFweXdUSzFGazBOeHV4TlBJWmhmVWNhSTk1NUph?=
 =?utf-8?B?SDZLTzI3Q2tUUDB0QWljdUd6ME9KdGo1bEU2VWUvRmFUTUVaeG00RjMvZklS?=
 =?utf-8?B?c3R1TSt4YkNhR0hLVGNUMjJsSUZDcHdOZjNBT2IrbUNnZ0Y1eTVvTWFPZWs1?=
 =?utf-8?B?TFNyMGVxRjJya21XSmUxRVh3bjhrRzJXa0ZOWldiem5EeFV0amp0OGNWbHBj?=
 =?utf-8?B?RGgxTkVMZjBjYjc2K0ozT1M2eHJlRE01NXhXbFVYR3hBV1VoSDBFOS9DQ2xi?=
 =?utf-8?B?OFAxa2JXdllLZno0SGFXaW5KTk9TYnNqSGxjeUFEL1oxalVtVTJ1YlRZR2xr?=
 =?utf-8?B?bFNqNXptYmc4ZkdPTHkyVzdKZUNDMUd4MXVBZnRHVDFneHJUZlBnVTBkVkJG?=
 =?utf-8?B?ejdpYTYxcDZORXNvenVlc0UrWVJZZXZjOGttb3ZUYmtJcFZLK0Jkbk9qZ1py?=
 =?utf-8?B?S21xK0xqR1BsYkZaQzhic3lSVWtFUTd0Sk5VajJzZE5RT3RhOW1oY2x0UWh0?=
 =?utf-8?B?bnZIOWI1bHVFTjF2NHZDMC93YWd0Tk5GcDZvK3VmZlBBdzMvb2hWVStWUVlM?=
 =?utf-8?B?OTU4WWl6ZWpGdEl3Ynd3eFU2ZmhtQWROQ2hrOENpOXVsbUhoMHNyLzk0cTRW?=
 =?utf-8?B?emNzbEZ6MWtpR1lVb2I0K0V2Rjd0bFI1ZUttUkdCelFLVkwyNXZDckZOS1Ja?=
 =?utf-8?B?c2xBMVJtQ2w1U2Vmc0UrYlZkcXF3NFQ2WklLcmNDa0tGbENwME4rcTY2Sk1O?=
 =?utf-8?B?WEpzaEgxTWN5L2wrcWtLdzBMVTd2OFZRK2N1bFBzdXRGQ0tIT0pWbDZwaGQ3?=
 =?utf-8?B?UnhxRFQvZFExWlp5Ujhlb0MzSVFkOGVCTmVkZWpvQ2JmVDV6ZTRzOU5HSEg2?=
 =?utf-8?B?YWJWaU1YdUhKNDNjVnM5WmlVSzNNbGowbkhZNXBhZGRUYUo2WXhwMjFSbXZW?=
 =?utf-8?B?Z1lmVzN0YWFJdzdhbDJZbGVrUnpob3I2ZnhNL0VZTVdKeWpGakJNRUJVcjFG?=
 =?utf-8?B?N1k2QVVSNmlZSUg3UkpZdSsxbDJzdWJVL29VbFUva0YydHZTV2dwS2dGMzhE?=
 =?utf-8?B?RUZUeWNjSTNKT0FObXJ5b1R5TnR1a3l0czN5Zk4yb2NwbG5SOERlZm15Y09R?=
 =?utf-8?B?ajR3NmtWaGJkUkgxNkV4OUp1YXh5anQ5aXdyTytWQU02ZlJSeEJ6cjhwTTdJ?=
 =?utf-8?B?TmRzQU9TaHFWS2NMZlAxWjVKR29ydFRhcm13V00vSXg1b25SK2hZbjhsdFBJ?=
 =?utf-8?B?eWo2bDhNKzJVaU1CRHo1bVRxQis3TUgvTmNiYTYranNKM1VHWDBhSlNDcy96?=
 =?utf-8?Q?8pkM6RDfoRjHQtguyEafGO6MdFZD7OieT8OzI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4007f4cb-7ecc-43af-c5d8-08def3f2afef
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:41:19.4908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goSwfC3MjYLTVOMH0q4zRnD0fgUzig2GnytNGdXJSWXgRLjLerVzzfyTbDtHdqBa5uD3KzuLzayPXVVBIuLlhin5mkRXLdusrXgJ91cHsV52C+PAPvPBZMiixyH7ngJY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11191

From: Frank Li <Frank.Li@nxp.com>


On Mon, 20 Jul 2026 17:10:32 -0400, Frank.Li@oss.nxp.com wrote:
> Add smmu information for usb and add hsic usb port.

Applied to imx/dt64-intend, thanks!

[1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information
      commit: 239bf457d81dda8a71d7cae04bcb745e4efba1ee
[2/2] arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000 node
      commit: 372a7e2aa11037d02a39323f2c3273c9557f148a

Best regards,
--
Frank Li <Frank.Li@nxp.com>
