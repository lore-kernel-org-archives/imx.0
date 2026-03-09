Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F783E714C
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773076152; cv=fail; b=Dmvtw2Y6lLulhSOUwvtcDq2zqwQP1YaNmCfLopTbwDfL29bnV+xQtDJfyb1oQWABA1r3cBAdbNw2nKtR3rWzW9U4cZallgTkqgn76ubivC/DNg5YXMuILZ7dk7LPC2MeCf2TjusD1Mpcx3DZcr/BSFeX1s3zpbIyDPkUGUKHc+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773076152; c=relaxed/simple;
	bh=rt5q7dpWXMK9HuGt6xEbeLnCiMkzrQA3K9dKfZ6ih58=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=c7RtCyYZWKV+fvguF1KLz/Iv7w2kqDe740TjQ0lGAhr2GDpTJAsRmaRH62P5H8Emq8uomclDVOwiSbkWn/7lB8rbmdRkqLAco79+3U8GEKcAttvgaiwjgYeHTQmoKDVocmpiYn/8VcMspw3vPnBQddhxClg34mf1A9lk//h3qhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WSlEbfL6; arc=fail smtp.client-ip=52.101.65.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WSlEbfL6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrSaCLLo3oDX4iaTNklFBW02L8VWSdugo5RUfeHEHZvA+fmdHrmFnQRM6RKQ80n9gD/Fe5nxBOlFPvWCE8Wuk+oa6Uz2eF1mMmSXoEuyZnMcgprd8o5VgdnHsbGWYYwA9Et0kD18SwMAt7cg/1hBkSkodKcEbqvoqQ4OR/qaU433d1DG3wBLQb1KzBsBrNNvPx+jCoKZhOh9AVM1YAu/IytIz1niM1ISie6PU66GX5PG4t9Ry0hCqWzrYbN2MggbVeVH6S81ZUUmr71CsJbFt3+I9r9lZHXGT6LB0XWbiR7W4cOTnvBz4N9f82JR2A3963zo94Zw5sDqOwheotIzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQ+0bpz/YDu4GaCL2jeZChX00G3ZPBlATmrSuQYZlX4=;
 b=Dw68iLveP75qGP6Kx4emdNa2e1HNUpiWBrS4rFoIY0tcgWfncfYi2SRC6l9dB7m+O9YH7p9AuL5hLbSTnsdNbLJRyYdsmVXoj3AhbNzN4UyNnYXPmPQJPwcR5VKVxgXhlw5yTvxP16uqm6EqraThh1Wn3GbSro094BdKw6LZJsq/OYQ6XQ9jKxxfbsuoXEfK3JT4cRFeTbcP/aOVjBZlla7XJD0qfSFfPwY6Xa90FjR9/AuDLRuJ0axRyJ8F539A7az7j2jbc2yhNR3RRA8RD74x2QGeBRkx6tunxowvT1SoMZRJax7zRQQEqKGlnqsQB6NLdHOWwRW7+9OG3r9nWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ+0bpz/YDu4GaCL2jeZChX00G3ZPBlATmrSuQYZlX4=;
 b=WSlEbfL6pk2xQUKPe7vT4Xf2X5e/xOW4MONpzTYldTWihlcnPZ8BegWs6kv52i0yM3S7tbstEA2TB6CxXBps/kK8TcHp6D+6JNG1VfX6SBgYMspzJDM06GXJCcsPtrJwWEqGflXo1/xqZJKxpHcmxB0Tv+qKm0rGzLFCViLdGeb12tl3Lc9x/1EY3WrCY6WyzyaTRaEc2pm7ykSGrtmU6Fv1vtrsOcrDH7bNveZ3Rgjamv/RqaodYwK/PWC0mnqKK+7vurpd3x36OYxQYS6VoqJoNYiJ4sFXOPAwlxVr+1pcpRHxxq6pOLsjpIoB9iI3pbONP/i4gHgmeW8ZMzLN2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB9009.eurprd04.prod.outlook.com (2603:10a6:20b:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 17:09:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 17:09:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Josua Mayer <josua@solid-run.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
References: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
Subject: Re: (subset) [PATCH v9 0/8] arm64: dts: add description for
 solidrun imx8mp hummingboard-iiot
Message-Id: <177307614287.1728171.4061310705822425254.b4-ty@nxp.com>
Date: Mon, 09 Mar 2026 13:09:02 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: BY1P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c8020b2-843d-4062-98a5-08de7dfe9284
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 PsWUcsOBMjmEYCRqyH1Ns3XtDTPRG1ggKWxFhmYhZKkXA1LwtvRWfbUWFA6BTL+VHd5sFKr6eI73BT3qHuQr+Yu8Jfl/a5MB3P9g3LBW2V+cPC0soq8ewllAvpdNEoIv6vjOboEZEawnzG+s5LR6mbp3zF0cV72OoFJIzmvQOOHEXwMpy6eyYO+/Hrj+recN07QnBPMB8G768eoYewgIE2XLZ4Ud0RzSGdNZqoSizVUS6gOr/rJ7RquaWzyODhNtqgkPUI8ZhkyHgyUYP42dFyE+f1MAmvPWhRK5KDSy1B/MMkGVv1ZbfOEGaFd1YYPsvrviBustFDjs96nw5R6SEC0IgkPNus47TDF0QFlhx/nB//rDI6kV5fn3H2YFqFUwO0IRKkWH1gCU1J9/7DNVI58kQR4LxaYYxC9J4DrMt9RHgxcVxWo1YIEw5+AXAetpG8ln/GgKlVol7Rjh/+rveSBFcpswG6IJMi8bxgdyBalEDx9N95vzYgFsBM4XHILfKpP7UcY07KnIKyUL3PMoDQXBw7W1mynVhw5kTc45CI7CeyrrosWH8n7h4hzR2bZ+fjgmONoTaADUt6mD0iHN7rmsDZykzy9CoQenZp7e48LrBPOLDkCdD+L/tpg+yslzLKpLzSrw/uuejUMKOLXUC+ybXhD6VhnvO9E0msrvDMEj8VCGLV20TeJ40rMdwjZ8tmL8NQKiQ2PIS0aYmGQHosXwJlVbfbdogfIkgZQlvQufey1qXUsS95o5vWM+1FsqvROmvMr6jU00TsgABc9znyyWSphj4ltmSh+THHC9oN4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eW1hd1VzUXFnV2tUc1lJREtyRzVyVjJOcVN5VXNvYjE3OXd6Q3ozUnRiL0Vm?=
 =?utf-8?B?c0p2bk9ta21QL0xKU3lxVDExL2FGcHlTNXpXVzI0bWFmMi9Jb1hLS1hSTTly?=
 =?utf-8?B?N3R4cjJDSi83QlliMXJUYU5SRG5lQWt1K2FNTGtjOGN1RDRJQ1FTOWl4RkZt?=
 =?utf-8?B?ZnI0eWhsNlNLUHZGclhTaVA3SU1lTktMOXhaYnlSRmt0TVp0OG9xQ0F5Q3VB?=
 =?utf-8?B?VEN0dFpNcCtpdjBCejJLZkx6YXBQaTN0R29aV1FtSUIvUEh5d0ErUWl4ak1R?=
 =?utf-8?B?dmFDVGJuZ25ydTA3UzVaUjQyY2tzYmxOT3BzeGgxQ0dHSk9WVERUSUdFMFpu?=
 =?utf-8?B?ZCtQanlOYk1Na3hCdEJLZnE0cU9BbDlpSHRtR3hJMTJneVQrNWNGNm5WM0tK?=
 =?utf-8?B?cXFWaURDZmRRMHczSWJ0QlZSK2hPMW1iSzJHeVU1K3ZzN2pmazI0bi85YTR1?=
 =?utf-8?B?SFV6dWhST2lTN3ZkbTFUdTI0Ulh5VHNRVE5sbk04Wk45ZTl6WWJHSkgyVTh1?=
 =?utf-8?B?bm94WStMUGF6YllXMERtVTM5K0g3anBMT2RWa05hUmpmRGlLZWF2K3ZLM0dn?=
 =?utf-8?B?Ny9TUjBiNTNyd1ZxTTF2ZjVzVDBCMlU3SFVtakxyL0JtYnlTcW1acFg4WEdZ?=
 =?utf-8?B?T3RnTG83RFVEUTFjc3FEY0IyQzB2NXQzclBQeWl5OGV6WEQ4RHhxdng2bTRt?=
 =?utf-8?B?Q3Q5Q2pMdU1DNkFJVHAxRlloQnFoMzZDV3lXMGNyblZIUDBSUlM4clBldzhq?=
 =?utf-8?B?d0FST1lFbG9xMUF2NXF6bGZUY3ZGLytraHA2d2w2VWxvY1kxblZKYURGcUMz?=
 =?utf-8?B?TjVxVFBpNzQvVGlXM3hiSFFpb3RlTWhPOVdsa2xOZ2FCL29TRlg2YlRrQm9m?=
 =?utf-8?B?SXZtdmpGR3ZGMmtVL0VkakpMK0VTdGdKMFR5cTJYZ2NIT0lXVWY5eGxlZkxD?=
 =?utf-8?B?L2d2aEdvYmVuclFmVGtkNWFHVWcrMXA1bXdzeDJyMmZISlJqc3hKdG5ocWhh?=
 =?utf-8?B?Q29wbjg4UGZYNTExb2RsQ1IvcU9xell1VnplcTNTdFc5NWd2WlNGcHh1Mld6?=
 =?utf-8?B?M3hTTjRnYUk3eGNjOWVlbGRwcWNoaGRidGRvWTk0MXgycXZBR2c2WmZOSHpH?=
 =?utf-8?B?MGIzeEhxcTRzMEdRdTBzTVI1UWx2eEM4dkMwN0JScTZKNjR6dW8vYyttNHE2?=
 =?utf-8?B?eFRzbEZRL0JVSjFJbmVyL0dtVVVjNTRka3NjcXlJdEJzUC9vRlZQQ1BIK3pz?=
 =?utf-8?B?SUIzQ0Z1UzNlbHpVYWJ4VU11Q2pHajJWSmFLSHVEaHBlOUZ3RTVwTFEzODl6?=
 =?utf-8?B?c2xRc0dLeVFGRTR1WVpLYkxncXNSY0xJNFYxRWxzYkNoeHNnL01vVjJNOHl3?=
 =?utf-8?B?b25rbStuZWs2NlpUczJ4UGh2Sjl6RW1peHJ2dlEzdUM2NlRUTmg0d0x1aHhL?=
 =?utf-8?B?N2Zab1NhRW50UzRWTWIwQ1FmZUtSTkR3eGFvc2c0MTl3ay9JK0dsL1VGUmhh?=
 =?utf-8?B?Ymx2bTE3RDJRa3prdmtXc2pqSzVKZzVnQWFHSzZzSmFFTG9jZWN3djhZdkl4?=
 =?utf-8?B?THRxZk5jeW1oTXlrOXR0UjlZVDBjZko1KzAzd1JwL0ZBRW55eWJyTnNLTnFm?=
 =?utf-8?B?NGtCNkVJOURnZnVEeTBRWGlnSWEyR3QvYUlabXRtL2R4RHRSOW9maXVyWTZC?=
 =?utf-8?B?YUpxME84M0NZY05zTkdyYXpFRFNxZ1pVdkhNdG1OQ0RMNFJnM3ZDZHBVVjBm?=
 =?utf-8?B?bE5TMVVxT2VVSjJwRGZBaWx0TFBjY2JEU2RDL0w5aVVMR1kvMGRIZ0wzbENO?=
 =?utf-8?B?ei9mY2hxVmovK2ZUZkp2K21sbFBDM0cyeW4vTkp5dGV2YzdhRHV3U3d0Y2xi?=
 =?utf-8?B?NVRHclBJL3l6eVRjaHg0Z3BBcEprUTNpaHdmZGgvaURNVlFWZlNIdVRBNGFT?=
 =?utf-8?B?Q3ppMUUwbzEyeE9qVXBJdTRZdHZGZ0ptK1A0YUlnS3ZBRXBnb0JaS2s4ZS9I?=
 =?utf-8?B?cm91SVVrRmJFZE8rRjdzUW9EWGF4NkhoN3haa3ZXUXBjV09qQUpmUFBld0Nk?=
 =?utf-8?B?cEdJeFViVGQxUE9qZnNDejdKTTdMUUFYVHBNRDhLYkpsYytWWm9Qb1RhQW9n?=
 =?utf-8?B?VnZCN1ZBWHJQanMrbEI0RVZVU1N2WVE1aGlLa2tSYTdkMlJMenRNaGpLQmk4?=
 =?utf-8?B?Q2ZPR2hnRldmOFVIdUQ0VlFQbWk0cnIxckZIVmlKbGZod3hFUUliVUtnNTIy?=
 =?utf-8?B?cGwrK0duZmd2K0xIK1VKL3g1Rys0eHNBVHVOUjI1Zjc1djlNMWtPZDBGb3Fm?=
 =?utf-8?Q?hddBgFWbp59zGso2/T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8020b2-843d-4062-98a5-08de7dfe9284
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:09:06.8881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMD7DvKzfuZmx7sRiYtPOvmievkxTjuecds7n/9GZPSlmwxbUhuwCtRPtvqUWvDZgcaRMtCarvqpmL44mKsCFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9009


On Thu, 26 Feb 2026 18:36:29 +0200, Josua Mayer wrote:
> This patchset mainly adds description for 3 SolidRun boards:
> - i.MX8MP Hummingboard IIoT
> - SolidSense N8 Compact
> - i.MX8MM Hummingboard Ripple
> 
> This includes dt bindings and a range of bug-fixes:
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
      commit: 5fbd0f7d7607fe1062db9f10dad18d321f76b1cc

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

