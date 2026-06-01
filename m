Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E3B2C032C
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330472; cv=fail; b=rhZNpdT4TN3tMBm6Gns0CKUadQuX37+bb7OqXyLzefJZ5IPdESeje5pF8IlI0r/fjH+Tqyx3GF/FouqtgBhpxXDHvRvZx+cLfsCwVImuRJABsfj4xPLhXuFJtJ64QkCXDE41rIAkvIXwiTArPOSCpbNKF0weI8Y3EmtVNgGBVCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330472; c=relaxed/simple;
	bh=/StkRVUOSeCD8SpEav2xxPnBtYLQTbzmkjfykUYobhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eoioNkrM9pAsCx7ezP2ehhxxrDitgors4zUY9t+FXkNPI1tEHbatbhg/rg8O3bl4M5BW+2npuiHZc107Ru+fhttfbQdsirjUhemiCY1lh46AlchAJymBgLWZCW4+iy3tfu0EVpivi6LHPK5vN3mE97cOPo+rfiZP+rnC+bqyOg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gHVqC2WI; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gHVqC2WI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/cgZCLY2H+/A675Em7X6OOIWTFHqjSbVilxTg8ekw5SMMWLl6VSYMUWcmzfkbBugCZs0SIILY8HP+QqhUFK5aTybXyiHku9WW52QrC6/vHv7blEcptyIwqFpwTPKVtNfZSc2fXXBuoLMmmlFP54hMWmZFH7kXPUFPs+W0p0sUvyfTU1sWEz2LTpWspEBKLQBdg9gKc/iKCkMvTo3uCyqEkX1xbM6L01YcDL2JjVn21P7tzKFaoLPAZEJ0RY06c/GnJ4Og0VDcDivT/CBVUX90zrv7GHSXHSJUl9iJaNcact4fufcv31oXrPN2NBp15amES2LlCPqmsRSjfXPXHoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6Vr694o+3gExkauFUDXr2az5ATeJvCXuPHa4osED4E=;
 b=cvfsxC9LycvXOGlz8rlJYe1yuQVgtiSPnRY6WC2RXfAyWSKA4o6LmAybuVkh8kmsE5x8rxr5EtbD/FK0IS1K2NHtP6Ji+UCLCuGDA6Z6Tvw0F+yNhSGQ3YBFbfeI0Ej3DM6S8lU1hDWuWYT0VpI6Ob/NGqySJjzpz2OosAMJU8FQOqf78yiDKirA8GFZN5tAVh/YsAZlRvP9EOpAsEPzkpEZqW9cu3hJVk8nGVdOu/7LIovH2NIjB+HiJl1oCAWru7wRhnFFXjFQMS1zMoKc+ODzMGW31mHpWNytyJS50iU56ZIrP27zX6cXhWSZJpgiIDBATsuquJl83feuhe9A+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6Vr694o+3gExkauFUDXr2az5ATeJvCXuPHa4osED4E=;
 b=gHVqC2WIHrK82/JzMbgqByQFSnQMouFN9kfAEaUU8HRGHkpkKPNs7PDxPrwPY0pIq+Gy3BL3qvOUOfz2/ulsFV7WGOTRS7dxBbcivGeAyBq1pUKB7rd53SqpmSX98ZbEYFNaMaJtdWLqIIybcm3bT+zl5vCmWG2iQzMgD12hj3iDVYoeI7APwwqOkLYDmHX7/jmwMH33xh8YS7StXxhdHhXi0HRFITqsWLWsDfSybnMavYb5HlBCZzOgmG8hQ7FEBIj75cNmDD/OYAkV/MjtHt8S+Se6o35BNVUmv5rwKqP/eRULGh3uTfHQE1KVdQbrxlhQz0jGvHmlc4g1shbMMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB11195.eurprd04.prod.outlook.com (2603:10a6:800:291::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 16:14:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 16:14:26 +0000
From: Frank.Li@oss.nxp.com
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder@fris.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mp-kontron: Reduce EERAM SPI clock frequency
Date: Mon,  1 Jun 2026 12:14:16 -0400
Message-ID: <178033044898.4105283.7224864649196000490.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513132533.589783-1-frieder@fris.de>
References: <20260513132533.589783-1-frieder@fris.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0185.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB11195:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1ab8e5-c9b2-4329-ebf8-08debff8d9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|921020|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	9x9GFS+wCxGJ3q9Xz0fu/z9Xkf+n0rvRu5YVnHPEWG7Vx7Ggae6rjXd7/CB2eJvqDV8xTETg2T9zRFTSEedl+UghWFwgFBYPnkM+V16NCLoJ1FeFx1+z+R76Qc8fFCsAlrQ/vfPkTP+SNHJLy1vLaNsn4K5eEn+dqTtrEYi+smu7KwIheWZKFnG1JoEbYuDtYRSruWru3mIz/O2evsiwX4us4aCn5lCdvALwX2BZFR3JVqrL/d1j9nXon5jigzttaExnJSkqI51ruvW9AGU7wyilLq0CErruMSAkPUuVtgAQAncgBw60wl0B7xVh/mSTzlmVMe/HyeV1lrgTQB7WkWMebpvE6RlFULiAUtP0X9XS7KWxs3otvvLSL7TBpt/AKvt1CpHIVLwTK9af+GkAXf9Bg/YCg1vd2nOLhw+kR+4c2Omm54JCEv3V4cBK/UahNd9FI9lsVsA9tecbdara+2AguMQNhflC+PR1PWDDpKn66fLAUmR7ClFL5IUMg5ehToUPJBqmB0VCJEKLbyLoTUhz3p8KwfPJJvMzv10slsDjA5zlnj462JDkpWV0RgpY+GcbU0WNya0YXkEYy4uMRWC6Bzjs7LOfHDA5nRfOobQzSTOLwplHufEyIR0TvvxdGlmpO4d4iTCAHfpXMC8sYSJTYbYQYeDPqt0NAnpHchMQp98sKHjOr4duUJHZa3Q3bhsezqVTREMQg/AR9BagTOTWta8RFrRFgSK0SyddRuA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(921020)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjBkRFlCekRhQU9QbkR0dVpWdFdFTVlwQ3E3SU1heGs1T1VjTi94dkZrb1I4?=
 =?utf-8?B?UlJ1bnNocG1uaGtHT0JDdVg3L3RCaDk5R1dSeXRBei9KOE9SV21YYS8zbk11?=
 =?utf-8?B?WTczMWFhOUROaG9VNUptbE9zamlYTnUxODdOTFNVNTQ4bXhnaXpIaS9jVlZL?=
 =?utf-8?B?L0VEU24zcVo1dlhGR3FscUdNUmhIQkVJVE9nZkRoazl4b1R4eFZpZmtiaUd5?=
 =?utf-8?B?TkRFN3Y4UzBHMmIzWlBjdWJyMG1CekJKZkMzZTlFbXVuUExqWUVWYVVpMHpn?=
 =?utf-8?B?WFF0L3RZakFGdjZuc0M0QjZoNTRrZ3ZFM2lJay85VUZNa2MxbUg2d3c4aTAz?=
 =?utf-8?B?cS9mTlBZK1g5S0RRQmtmMUJRUHcxangzMjNaTVBtdTRweFl0L2xSTllQWVN5?=
 =?utf-8?B?aDN5V2EzdUNuMHJOYXduRy94dDBSeitjeERva1Fzd1lnNjdHRS9BSFU0YmhW?=
 =?utf-8?B?aW94Uk90UnRSZzF2SzZwUW9nQ2tmR3FONkl3ODVtWmdiQVFSbGhXT0xsUEQx?=
 =?utf-8?B?NERBUXlsQXZEdFlGYlJwMm9WS25KRlRQYmp3clZBVEdjUEJLbytLQjJXdktj?=
 =?utf-8?B?Ni9NdFc5OGpQcjV5Tjk1MGFHdmc4aVRhOXpSYm9KUThHanlLMkVKMGFvNHN5?=
 =?utf-8?B?eEpWVTllWnEzTEc3c3RrbFRwUUxVZW5KRGJSdEpUcm5CWXBpY01Ha1BTbk8v?=
 =?utf-8?B?cnZnY3lTTXRLZ1pROVdKckxkVUJFNzQrUVo3eFMvcUVzUk9kTWI1QmtQNDUr?=
 =?utf-8?B?YUZwOEk1eUdsOThQV0R6dGN6VW1RMFI5VEVTN1dXak9IemRmc2tkcGZpVVFS?=
 =?utf-8?B?SjVVTmZXRzVzTk44dVE0MUNqbGZCd2JIVG1RcGJRejR3UktGcWlNSFUvRTBp?=
 =?utf-8?B?TCtyL0dydStMTGtvUnRIaDdxemF6SVROQTdlbHF3a2IrS3IvOHRETVRlWkVk?=
 =?utf-8?B?eFlBbkpMZXR3UGtRZjNuVS93dmtNT2tVNXhHWE9tako3cnN6YmI4aWh0S1lK?=
 =?utf-8?B?MVFqMUdqbWFISG5HUjVkV08wZ0VQcVI2N1JQNktEdThUSEd3WDJGYUY4YVZB?=
 =?utf-8?B?dUxNYlFydDZHWFYwRlcwS0FqMjByd1NoaEpXV0J2NUV2aXJ0MmV6L2UzZUpu?=
 =?utf-8?B?V1BjaWRBL2lZS1oxVHVRSFFjVUxGcmltTkxuaE92REVEVTI1S1dhWVFFQm05?=
 =?utf-8?B?M3JHbVBrTEVzaGE1bUh1VUdzYnNhbUJXd0lJd3BEUEVwNFFBM0dHV0NKUDk4?=
 =?utf-8?B?RjNMK1dFbmpIWjlUVzROQzJ1dDJoaWJydnU4cmh6NzdzRG5JZkFqaUpPQlE0?=
 =?utf-8?B?dGUwaUdFVjBIeGR4RkpTalhVS0lvdVJocEVMbWxqS3I1aWUvZXhtUjEvSTFL?=
 =?utf-8?B?dkVDSmhYbHQ3QXRvUlZRdXRHM05VZGorTTM2eXcrUm0yMGlEOFpQVC9pMmxx?=
 =?utf-8?B?RHI4L01MS0VQcW5kSExaNDZmbFpjbkNJMjhYbnBZdGpVNFU2RHRxc20zWXBK?=
 =?utf-8?B?NXJDRzBOQVNrMzErby80azg1S2FmR290enBvVW8zZXN5emtUaDdpaVM1dW1t?=
 =?utf-8?B?VlZid29hTkhPVnE3T1JVOU5zcVRaQkx3ejBHTzZMVkE3WTQwem84T2xheHNS?=
 =?utf-8?B?YjZwamo3eG1ybG9wZGovQTlZVFcyZTZEZmJReGZxMy9VZDIrUGlUU1d2cE4w?=
 =?utf-8?B?eFplUXdaZENyR3ZWdlgyWW04VEkyWFVpSkNXSFJmMis4cFBLV3ZqWTlZSEJt?=
 =?utf-8?B?R1hDTXFseUlNOWg2RHB4UDcrRVJodndKaGt4SzRQcjBpSUVWMUlkQTM1Z1lx?=
 =?utf-8?B?clFUUnViM3pEYlMzSnJ3d3lsWlN1UllpWVcvZWV5eDNMNWNkQkwrd2orTzdL?=
 =?utf-8?B?K0tqTW1GU2xvWkdHS0VmZmlhME9wcHBGdlhtbEtnSWZlMVBocnQ2b2JjeG9y?=
 =?utf-8?B?NUZjOG5yaDh6cUpsZTA1bmowQS9pdy9xSnVLZ1lFOGFFMk9ueDVwbDZVck95?=
 =?utf-8?B?b0ZTSEwwdFFXb2o0UUZ6Q2ZFaitNMEsxTEltUmJUakV3QXRJemJGb2h4K0ta?=
 =?utf-8?B?MENOWGx2UFVicDhrWXFZOHZQd0s2djdYYXRqNFJmZDFyY3BORlI3Zk5JRGlj?=
 =?utf-8?B?a3hVbjZrWVMxZVE1a2JCSDJJTDZBL2QwWjN4Tm5pYVc1ck1iTFRWYkFybjFy?=
 =?utf-8?B?M1pTYktXSjZlOVYrRUd4MHdyYkNiTXNhUXB5czZIRGFHSmtnRHp0UC83TFdT?=
 =?utf-8?B?dGo2ejVkc0wwVzNpSzZNNkFpQktJQmo5b3hJY0ZWZTFsenNTRlZhVHc4L3FU?=
 =?utf-8?B?c3NJd2MzcndOeU03VzlZR2dmelJGNFZUMFcvV1pGMk5LZHZIUWxGbTY2M2lT?=
 =?utf-8?Q?aiEHxAFVeXnjqOZk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1ab8e5-c9b2-4329-ebf8-08debff8d9e9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 16:14:26.3990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pk/hTA4dmPd4ibcB49WhvqUYcK9jQuIji52rw/DyR8sU01EvvP05PHW2Lbr0IWIGpEXrsCY8Fu5HMfAt0ztyRgJB7II6DZptKackRCTFlirHqJ2HYtjlYFeVG0JRyJx2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11195

From: Frank Li <Frank.Li@nxp.com>


On Wed, 13 May 2026 15:25:31 +0200, Frieder Schrempf wrote:
> There is an onboard level shifter for the SPI signals that causes
> additional propagation delay and renders the SPI transmission
> unreliable at 20 MHz. Reduce the clock frequency to a safe value.

Applied, thanks!

[1/1] arm64: dts: imx8mp-kontron: Reduce EERAM SPI clock frequency
      commit: 8c0910ba1adb5ee729b6331090ab1a45a6782205

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
