Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8E233DEE9
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 21:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780348113; cv=fail; b=NewMdDcFs1pOl60HoZ+p0JDPG62p9nOQK2ScOFbYWrR+bQY5apY/F8wsSyiP3BPJZRv2dOvGx4VJRg7Xz++ym8zz8RIR0ObcaasnC/zcggrzO2+91GgcSHeXKJ6l2BDfuit7z1tSGWUBApmnwkh+OZmMEE7se6nZ+/GqjLEjXkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780348113; c=relaxed/simple;
	bh=aNiUSnlrBSZe8C7eZnD5m02/4HGziv/2w49aUO3PnGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uZvI2AdTEgO/cphORn4SaZ4x9dm01zoC4n/xE96dvLQfT4LJoi1cYaeELIa9MxEgz1IgkRn0xIlpwdFpwXFg1+hAfbCdV3MnbCi5v8iz2Hcs7FE7EDHxfI7RYVb6729HdJwgkD2LnnGC2Gqz0PPAjUWm5zG9XzqgU5V7O1OWTNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VUqwy1E4; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VUqwy1E4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7LUlPzdxJsnu9zNl7qPVRRJ00v77wa/5bA1MOXt16nbaPMgWIkssQQxL3yzzguTefgg9d6ifqVKhAWvZ7vRExqucWD031y4Q2EXOfLMkbXQ7HMqLALT4cKJssPsZQodx/90mL/hZ7L4GxMchyKiLGtmYPn/q3A7WAIXpwsPPuD/m6EYwBAUXhEYNaiREMYtXpSosxTkPlOSTLZ3FNWZgxiemgRnKjhgj/tveakynYNDB56KLzAZtTIcucMELnDU3dQLsRgVPycJ2I8GRAJf1MkC9t824jaefvozUD161vGfMP3ltdGQFk8Qr2V2SVfUUtN1dI8PuhAVOudVd8jV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrTZjtiSB/zOfy1u935nBOxt42gBxGwtXutnDN/trRk=;
 b=P6QW/hMVQIGCRIEp955E4Ms/SPCtwbmoCjN2a6cKbwMFoZWQQadSbg9YxHqWcENGLInGLDEIUs0733SoBG2//jtEAhw/9gbGXTn6DG+TaehDxrH3ECPq3Ra6m0ZH6yaO2YWRQp8fy87Qcp1kPVzNGPkKwyFIOkGLBkX2UGOWUNOEN+oENX+gc02R8MX+0ZtDIMy28Ddg/fauBrGlmldqKeaewrAcaHd4V9ugWm6P5cYRBBeryDD53oESWqaMLDqll/1L3pQib4SIZU2IXfejizppd9RjhFNQU9QMWMGSiH9nCCyJTSWJ3axz/9DCVyijH8vtlqUONBJzcTekn1pc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrTZjtiSB/zOfy1u935nBOxt42gBxGwtXutnDN/trRk=;
 b=VUqwy1E43Imzu/jcAC5uzPp5573ybOHKdfuNK5TFZDAcIH46yacLAfRVR4xgGfx4LOQETYkqF/WaGYJO8YMlmLMyRVxDm6KCMTyfeFEMk99FINtNeCCwnbqjVXQidm37l/x7Nqi5wcFcwiMdl5syj96ctCIlOz+e3tkZBwXkeenFKDngxBNKqA+U4vkHKjxzWkmL0+MroxctKn6uWB/SelOFd0WtHdI6nyyaflFtrNr9zOUrluKLS2GQcYWHw3Hj3lu6nRtg5f5ws3jKzd7PacGYSWhtB+6hVZS0uhHY5JhxEasSIL02Mu1SHLRjYv50aVe5YpytUyYJ7rTiSWQv0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10078.eurprd04.prod.outlook.com (2603:10a6:150:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 21:08:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 21:08:28 +0000
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] ARM: dts: cleanup some CHECK_DTBS warning for imx5/6 (round 2)
Date: Mon,  1 Jun 2026 17:08:20 -0400
Message-ID: <178034809035.597027.9964192951270012298.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
References: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0085.namprd13.prod.outlook.com
 (2603:10b6:806:23::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10078:EE_
X-MS-Office365-Filtering-Correlation-Id: b117fb78-85ee-4b32-1c67-08dec021ed3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	T420k0mIZg1CSEpDM/P3YaAxaAeSejtA1Y4jtkqcbNSg/V1jEM7wZ50Bv2jE18iJwFYUoBQnoYq+YBz7JMg6QihtHdC2aD1HjO1R9KHCADVQ87lmC2W3SqMGM9vf8GaZn+HkWS7XQexFdXQOGrgcv3OLKP9k6KD8kWXhaZKLpAzr6bVB8BAh9nZrk9iIBQMnWu9y2DmgCsdjn4/SRxi56KqyfTjAGdxCklEftwQhHGwLITS6fqqSAi0QBUlcFao+cnveno8UBIVjlVv3RuT7+6/o4Qv7/QCUeKhsyGpZKGcq2FBmhmwje5I0GkLWm4BgD2gF4EIPCT12QwUpl4j+v7cvwRdKsmsBxc235TTV1XgvQXlhUGZkajuKTbIfMWuv8NVoZ0DGJnqF+IcuPoWEXIPuiOFkR6mXEwDAK4fyNacEghZm7muMA1F0kr2yohIUpUJunmnCo/G3nBYNYcwGORI5LfQhh7xN14UIBiNK9QuSIg2cR/3KTzVadOdfM+eI+fCNvaY8MDe3XttRYzsd9Oj7rkwYMcZ93Le80RYRro9XpyW7IJTH8ThutyUp7FGI9aokGa/90Ad3XoopDVmORbKK7RP6ayNhwFSKstTTMbT1hTZB1UPOJHSBfDNj+amQukO6SRgQ4MwU4iOdWQb4KCgvdy2TzO5SiVWRacxHGJZ3Tgz+jeCAD+RCoqNeKvF4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk16K29ycjlNTEVRemU1Vk5tTVJvc3RwNUpIcUxydzBWNzhhWWF2K2ZJOTdW?=
 =?utf-8?B?Q1pOc2Fkd0dLMHJCeVVRdUhKNGl2OHBkVWF2WE5zVjEydjM4dFQ4WkVsa2dG?=
 =?utf-8?B?NEw4V1NmWUczY2FEWHpyQmtoNDg1NEFqWkJLZTZzWFNQRWNOZVRYdzgwcTdQ?=
 =?utf-8?B?Q3ZvZ0ZKb3N3bW04cS9aWEo2WUFFbGdWL0ppOXpnR2owU0VJUUd0cUppWUhi?=
 =?utf-8?B?TWY1em9GbU9nbDNkaGhST3B6NGJTU1JNNTJ1YyswMEFVUXBqQlpnQk94RS9F?=
 =?utf-8?B?L0hVU2hOQTNLdlN2STlpRFpvcVk3NlJDemt5dnhFU3AvL3FHMVlEb25pYnZY?=
 =?utf-8?B?N0doWTI0ckhYVHdXUGNocS9MTTZhbGxaOGVsUy8wQnIvVEJNWUdFcm45TzQ3?=
 =?utf-8?B?dWxVSXgzcFpjMUN0NmRPWjlxcXk1ZTEvampSbkkxbnZndnJnV2hzR294ZUdm?=
 =?utf-8?B?Y2ZZUU1jcW10Z3YyalMrdy9sWlM3OW15cGhWSzJ6emFnbHBEMTAzdjJjWGdv?=
 =?utf-8?B?VGJjQzRRVnNCYjFldGJENzlLQnE1OEZKdzZ6NElSejFxS3JtUGtNai9wWVkw?=
 =?utf-8?B?eTBycHlVd1FRQ1ErNExISktDRE9oVHdqZHlabXRQek81U2oxQ01jeS92bGJt?=
 =?utf-8?B?SEhpOUdJNzVOdW40ZWlSRFRVMHYxaDlWN2VHTEo4VjZRYmRNckdTRnZraTNE?=
 =?utf-8?B?M21VUFBveVI5ZHlDcGVLSFBHWUl5TzF5aDMrZ3lkbXlyQjFvbndmeWYvT0JE?=
 =?utf-8?B?V0d4OStUVjUxSk9MaE1wMktoWnRHS3hvZURJUFNGZmZPVVFuY1gwNTlUYzRX?=
 =?utf-8?B?NFZGU3hVVmdlK3c3aE9sYmUxVkNWVWxQWWk5R0FJU3EvYisvVTlnbkd2V3NQ?=
 =?utf-8?B?ZnVNcGJlb1BwMk1uclkvUHJEUGNhS3huVG4xdDJURzZBekpuL05hM084ZDFz?=
 =?utf-8?B?azNwbXFoQWhrZ1Q0R0RzSVdkVGZxZEgxS21rR0ZVMHZXTi9aYTEreS9lQVM3?=
 =?utf-8?B?UEs0aUJVYmROdHhabWh4bFBhbzI2SXRlK3FNR1FzekhRYWcyYXFJMWtQcGZN?=
 =?utf-8?B?RlFwcXhCcTl1QzMxZDg5TWJwRTkvejl2TjNVVnE2aVBlV0N5OXBXRWg3ME1u?=
 =?utf-8?B?bEU5Z1haRnp0Y2RzYXFJcXpDYkhlSThYT2psMFBCSTZJZCtuWWQvUGFtVTdW?=
 =?utf-8?B?SXBLKy9jRlFjVFRqcFFhdXJjNzBGNFRRMENobmRpMkpZdEY2VExOMDJPemhR?=
 =?utf-8?B?NEVNSHJJN2JjZzk0blBsTUFZVFR2eXlNVlczQm1tK2dpTFJlRkZ6cGV1aVM0?=
 =?utf-8?B?ZEoxYTdpZHRHZ0FlYTZ1Y1cwSUJHcms2aVhTcytvMEQxQmsyd3RsUVZqOTJR?=
 =?utf-8?B?aVNZaUlOOVNGK0tleGpZdVBNUVFycURIcTlvNGlrUEwwQnFoOUhFR0ZkWWhK?=
 =?utf-8?B?WFdNOUxHdmNMSnJoUUJ2YXVyQnJzYXlVdG5sWTRRRmRpZVZEZ0djbjF2aXYx?=
 =?utf-8?B?VVNSK2JKWE5IZStGcHFQMklDd1doS2dPVVJ2cXFkYWgycU9KcTlKV3l6Umda?=
 =?utf-8?B?bDJkY2R4dlRSUFl5UTNIZUM4NWNvRHllRFI3RUgxVEhqdnM4MFYraGUwTTVJ?=
 =?utf-8?B?WFBZL0R0SkwvT0V6ekE4bEVZbmt3Y2E5QnpYcjVPN2YvMUVvWVpxNFZwWFEx?=
 =?utf-8?B?SERUWU5DcWE0RjVwaUowVFo5Vm5UenVoRkI2TktYc0V1NGxPL21TWW41WFly?=
 =?utf-8?B?TzcwSnpQY01LUWxxRElTZGxMNnZMbXFCdmNsL0tJamZiY1lqbTJpN0k4dDNo?=
 =?utf-8?B?Z1ZyTDMxYW1IQW8yUzZlTG95RUlOL2dMWm5PbllLMTh3LzRJUkFZbG1IRlBl?=
 =?utf-8?B?YnhWNnlBeTE5UGRuaW1KQVUrSDVIbHFEUElOSXN6N1RjWmRCbzBobVlmN25x?=
 =?utf-8?B?OFpNOFJiWFhOTWQ0K203OTJ2N1hmdGVJQ2ZBNXFmNS9lUkczNDlLMlliRHd5?=
 =?utf-8?B?MkhEWTJkVEpTZHkrOWJOVEpabnRCcVZ3R0VFRmNGMkthait3VWROTnNTSEtK?=
 =?utf-8?B?bHVoOG4rMDU3WUY1bWZtK2tRc1pFUXFEd2tkT0x3Q3EyTDNuak9laGFaOU80?=
 =?utf-8?B?bzEyOCtLQitKazRkVlBYeVhFSEwyZVl2WHkvZ0hib1A1Tld5V1V4Szh5Mi96?=
 =?utf-8?B?c3J1NlpacktCWUl0Y0ZsZHpaUDlYYnVuYURybnFIRFRCN1FlSVVwZFd4ekRk?=
 =?utf-8?B?N3RoVWFpSFBFdlRqZGxiejVXckJleERDMm8wcUN4M2szOVB5WUhNYWhpQXI0?=
 =?utf-8?B?cHBZZklPS0Iyek1PWnB1NXduT3prS3NhbXVuOUpWTnUxUzg0ZjBOUmQ1SjBn?=
 =?utf-8?Q?mEj7fd1GagCPB3ZE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b117fb78-85ee-4b32-1c67-08dec021ed3a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 21:08:28.1418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0HmOaTEBo2H3FKnBpUYsaB0t0ffW/7Vm7lEbofZ7wZbp/TXcRocadVNlIvuZnODg9FhGl0xpeQ+r8/pTL65KsUHPPywO8+/1QlUF6X8bLgpmD4nwPXTmqQ3ogFfGgLh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10078

From: Frank Li <Frank.Li@nxp.com>


On Thu, 21 May 2026 15:15:38 -0400, Frank.Li@oss.nxp.com wrote:
> Cleanup CHECK_DTBS warning for imx_v6_v7_defconfig. (below 500 line warning
> left) after apply pending binding doc patch.

Applied, thanks!

[1/6] ARM: dts: imx: add (power|vdd)-supply for related node
      commit: 85125c5e9a74054e8f3e3c8910a517e34ad53ae1
[2/6] ARM: dts: imx: remove redundant bus-width for video-mux
      commit: e1867c85f420271294ccf75d001e1992805b0116
[3/6] ARM: dts: imx: Add bus-type for ov5642/ov5640
      commit: 202f97ae137bc6e08d2ed685e361c413edc8452a
[4/6] ARM: dts: imx6qdl-tx6: remove undocumented karo,imx6qdl-tx6-sgtl5000 and keep only simple-audio-card
      commit: 92c200493e1b70faf810b683fc7046d3b1738b15
[5/6] ARM: dts: imx: replace undocumented compatible string edt,edt-ft5x06 with edt,edt-ft5206
      commit: 256807f42282e4d7d672784c4eacf6ca768920b4
[6/6] ARM: dts: imx6-display5: replace marvell,88E1510 with ethernet-phy-ieee802.3-c22
      commit: e6532261b1514d99cfa07db05c1fafaf32ffbfb2

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
