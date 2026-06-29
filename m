Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF8E466B44
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751122; cv=fail; b=s72MD77ijGvg7NmKL94F8zlq5j4l/M92AtLDZxMRJxbOivG2yPEK6gCGzfkWr4o8ju+U2m2E4H3mKyJ36057IaBV47Ulzo2p3zva2Tn8GHbIwnVfT8xizLsiCGCS+E8B1u3t0zDsw5LcaOgt0CQE7eAsyrIgra8pVg9pfh2Z7cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751122; c=relaxed/simple;
	bh=Ys17kQxePGHzF0R7rgnIO9rpkmIQ7fgiJIMU+15+fls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XIuWB2CvbfWlDeR/+Zcc+pa6OZ+rb4g1rgw1EQFyjxzmk/+Z9iYDjSWQ9QJQrp394ctC8s49HZL0MTjVePL/0YzribpqmCPxKDRnY6EqFcqwjQlwB3J0ftlNzRWxpyMYqb4XBXiTMNmnQrBb6M10DmsC2uupV1uKMIoWpbiFRB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Kl0yDxU7; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Kl0yDxU7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuvClKaLeOcXp+2iyJV2VFg3ckDz/d7LEstiqWoqxUHTYY0Tw1VrlD3ZW8E2gYJpL/NFBWVJr9RJTk1ck5ZJAEoXDgpNsr0wrEELBFEWrnv7bRhQPJRL3EBe+hhgVSJl7f/g0eP+cukxS5SKEjkzwn8lAFGrbeuNHh2aWM9esBkH/ns66vl5KiD4CCPuKZ4FBx1a8tY5xZzOK+sjOSSVTXLdOpHfj9y4JgdJiAysbKz+sNEBbjbmPkpAA2yRL9ebGO2q7Pj0O+bdhXr4cbtDNu1pbS7skB17LAXoNh92mK2wEjMwxlK5qCSOhgoLkAEy8I6loYY12IMaDdtuf9tdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsM8vxwIbJv5EoMjtyU2ECLrQ3y0suYkxEbw6GgF4Dg=;
 b=vCFq6uUROVS3rdXNAIyChB43Yeo256Vl88qWeL9Qu/zCK9O0iok572f5/vxEtfLEUv1ywjSK4NviZ0tuatF7VJPJpFIwkHD5jXvcABy9kP/cof6RN8YgSg/CmGmejTe2CLkrEnoRMW7xl2labqUl7H5rAfr0qAVB2BMVapOm0q+eGXZDDpBjx9tt++wtFMQkg0FesjvN/XiKvRqTI60FmGNWD9BSHvL/RcUeMG2yTo7wA4TU9d+0QX93R/eXaV3Cg64FUnJHzN+izU04UNqk5Atd7g18i5txO69VHxm4BrEa+rr0GotAd9EPz8XyOVIJ33m5mfuw/rCmQvmuWQVFQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsM8vxwIbJv5EoMjtyU2ECLrQ3y0suYkxEbw6GgF4Dg=;
 b=Kl0yDxU7eyXYtcu+nFJ/XU8OJrHOQgTNiVtXzll9PtMPtr2hBih+2u8aQSZpLeoi2Terf5/AAJJijNw7sJPQWGc18VrHwx34gAkfUK+R7LPIpDRKyqzd+25TsKHeX3iDWq0k59kOT4BlgRReT6xxP5fT5E92OsQqPs04UBJwbJ8c2xx96C1k6zYu1hBgSqZWzDuIL82hgVQefXelyj8ratNn9Y/hmpOQJK1B2Du6tn8xyLyNAyLftY70MFrlwTa3kRpjmjIt276U36OI4Y2R9ENTLklJgv0NuQs6trucS+f/dOWQfbBvuJVhd+tEZhDHvZtDNdDDgcbRF/z1ATwIjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7376.eurprd04.prod.outlook.com (2603:10a6:800:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:38:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 16:38:34 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Liu Ying <victor.liu@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v3 0/3] arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS panel
Date: Mon, 29 Jun 2026 12:38:26 -0400
Message-ID: <178275109509.2289789.250735934340980914.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610-imx93-ldb-v3-0-c9b65d742753@nxp.com>
References: <20260610-imx93-ldb-v3-0-c9b65d742753@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: a0888584-f76c-414d-8723-08ded5fcdc57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	JGt55d5hRIOESjsMDXkB97J9r4h0Uli00YdMObkV99rUdtw+aqrGF92xcAAFh51Ys562Tr+AammzsZLFsvv6w/7Vfv1ACaaHScsZgtHuH1UcjxoPmopylVwsk+EWANhKVO7776EEqXWlK8Ux+PfUmYH923+c74HnJU695YjPfvlNRanw3TyUPHA1qQQoK+fNnqABPgebI3/ZSVUp3VfKLfhTltQNW36ik0sIzwUJVuwlk3NZ3RP+IrSWiVlwLbkpYnu0SXd1uF5tXCav/z03qKU3uNXbDffly1vLUWet2x1pQvUm6SZAEIa/6nV+SUlmOcVkRb3wEfk55t0h5zYo7CF8Wv97wj6ckko0tTQes5OIXtvyRxhIMzOKmLTD3Av7sMGphZRUJa84V4UaJ4tZidwmLpKXur6no7SWn3pNEBtAC4lXeXEAOTWVCDyeF8sOFVSXTi6LKUonFHk9qjkXqcYHlPbzBHq/WPk8UG2RTZN4YAtP3VkMoE4RfxukG7sgP6tkUsjbxA7W5Dtu7LWfvYOIeXuwrlJOreiRMNpUzxlZY2IctayBRvMSHRkXySXDBlkxBV6swLr6tmRLCSxx3by06C5oLmqcKXcAT+CCP6igqLXzg99VwusyW4IoAkPKXmwO56Bzbm+g0HOq+PyP5r8PT8ZOrPIS7miOBhw3Bp8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak9sUG55UXcwSkxrajZmTlNzTjNGSVdPb2VoL3Y4QTRTUHFQTFdnMnNGcFN4?=
 =?utf-8?B?Z1JPaEo4UUtrS3QzWGlxSlNKcnhpcFNZMVFJYjFxM1pTRlM1a2wyVXF6TEVK?=
 =?utf-8?B?YkU1WnhQdzV6YjdheWxrMUJ3N2tjc0F4MGpPSHhERU1ITG1YMUZBSnBqZE5y?=
 =?utf-8?B?S2g2MjkwK1dKUmZUdnZJWFovQTAzUXBmWmRidTFldHpueUp2WWhaczAyeHly?=
 =?utf-8?B?ZC96Z0MvbWluMUd6am9xNm5GUEF5TFh3ejMyaUhlZ2cvQ0pGckROcUpOa0dR?=
 =?utf-8?B?WFVCL2UzMmVnTnhJaTYyZ1BxQVRqcUJXeUZZaDNVMXBPNWZYazI1dXE2QjZP?=
 =?utf-8?B?REJwREdtSzV1bUtWcHhzVVBWZW82bitPY2pZbG5MbDFnd1BVRk1taU1lRGZM?=
 =?utf-8?B?aS9DZlVISW40dzI3N01ucXpTa2ZSME12c01VeWM4U2hlTjJaQ1dQWHhqb1VR?=
 =?utf-8?B?cFRWV3h2YjVrWGZiNUhrVDF4cE5OWEJWMCtXaXZSRmx4TldDQldhN2pTaEFK?=
 =?utf-8?B?dmpFVVk4ZlZRNUVJRnk5ZTJMeEo0akRROHNFandUWUYzMElmYUhBZyt2V253?=
 =?utf-8?B?NGJBb1kyQ1EvUjlzckRiN2t3eEFHbnVFWkNjK2pSRlQvT2NLbWZGSW9weUN5?=
 =?utf-8?B?bDNkeXlDbWM2dGhTWWl0MzF1Z2xudzA4NVpLbXo3UzVEeXQra0tNdUxvTTY4?=
 =?utf-8?B?NXZQTi9nRWVLbEtabEdwcTBobnFjUlVyTHlya1VFUGp0aUNWQVhTUkZMVndC?=
 =?utf-8?B?QTZIVS81UlhKWk9Jek1BMm5tZVk5TVE0SW1QMk92TWhPbkdXd0EyN3FkbG41?=
 =?utf-8?B?NDJmU0sycTNUem02c21hVXZ2WWhHVFk5RmgvZDViN0dRQXBJR1ByVXZ0T2gy?=
 =?utf-8?B?TlVGdFh0Wmk3a25DK0RuZ24yZEJ5cjVZcXhheFkzZ2RDdkVJOC90d25OVFgx?=
 =?utf-8?B?YkVOUHpKSktlclIwYjViNm9lb0x6TEZRQndWU1VqZEQyQkJYcmRNUEN5R0Zu?=
 =?utf-8?B?WitEclpNQU5pN1oyc2xidkxqQllHc1VVM0FXMTkwY3NYWUsxb0xXdDlUMmlk?=
 =?utf-8?B?VEVmVlR5cmtZWmtlVERJVlNaekE2MFFGR1BPODF6N3BRNmUyWXUxOW1PYmdM?=
 =?utf-8?B?SUV2SkFnL0l3aVE3anVsL2lSRUpOaklKRDdFL09uWDZxY2UzeXJmQ1FMTnFC?=
 =?utf-8?B?Qzd1a0tHVFV6bU9VSVRjY01XMVhmQTlISFNvUGltN09NZlJmYjZFZ2gzdWlC?=
 =?utf-8?B?TFl5T05DdENXKzVkWTVnMitGM2IxTHd0RkUra21Oa3EwWGQzRGt4SmhxMEFw?=
 =?utf-8?B?Y0lZRmc4L3lKV1NURjU1ZGZKVmJEMExrYWIwSFdFRzR1b3lvVU5RNzh1Tm5q?=
 =?utf-8?B?WUc3a2RQK05hbXM2ZjJFY1pJWmVrdDkxU0FmRi91UjNTYVJ3ZXFJMUhHdFlU?=
 =?utf-8?B?RFI3eExJeEJlRkxoZUZzSWprc0ZmWGplWnRldnUyUTI5M2pJN2o0OUNjaWpv?=
 =?utf-8?B?UzVSdkhYektkcTJxWUR2emFhQ0JjOVJLWmFkQnA0ZjArUGFKcDBoL1BOSkY2?=
 =?utf-8?B?c3FKSXJ6VDNLdjZ0N05yeU9BdGpJdHROYkhHVjBpU2t1cEFKRkNjVUlKUUpJ?=
 =?utf-8?B?OWtOeW9UUlJzSkVkUW9ZeXNkaHlENythWVI0ZFIraU9Zb3BMaHl2dHdHVmx6?=
 =?utf-8?B?RERCRHBSVzB1Y3lZcjg4YWFkMTlkVFhvSVloVUhaTDNUQlNGR1pzTGViMkM0?=
 =?utf-8?B?Y256dVZKaHFVaUdnME8xaEorMTFaUlMwUjdKajM1T21scXU0YUR5UnY1UTZz?=
 =?utf-8?B?bEluNmJKYUhwWXBVSm1xbHBWblJCOTlhYTBtYUlHTXBjODhSUS80UzMrWC95?=
 =?utf-8?B?dTVOQ1NqWEl2a2RNNVpDNG1zaWtabHBkKzdUUmM5dXIxa3F6QklIQjgvSnhy?=
 =?utf-8?B?TUJXUFpZazEyNHN2OHdReFhIMmVDcDkwTXplb3FRMHRoMjRtYlduMTFXTU8x?=
 =?utf-8?B?Vm9BUmF1VUZBaXFzbE5BM05ZWE1HeG40RHByaEdXOStQVUQ4NUkzbzlwdHo0?=
 =?utf-8?B?SWVrc0VkaHkzRTZIK1Nib3haOGo1dXJRbmZHY1JTMlNiZ2pXWWtjdUZTYnlK?=
 =?utf-8?B?L29LV3lKc3doRlB2Rzg3cE44QTVPcFFTUks4T1BTdzVMcklMeGY4Ykx3Y0xH?=
 =?utf-8?B?MW1mamZHOFQyOXNtVFdueVhKMWpFYmpDVFQ1cWZKNGJOMk9rTk5hTWphaGFo?=
 =?utf-8?B?VE1KS0lnNFNzNFNDSEZwaHpmc0cwK3VSM2RuL2pmZVZHY25hQXpXcFBoTkZL?=
 =?utf-8?B?MDlxeFJ1V2c0WWpUWmNlM1F4VFp3WUNyV05tZ2NtcmxENm1KSEM4U2F6T2Iy?=
 =?utf-8?Q?cs253ukpknIErmf9A0Ed+PniacW+wqkcrCJCZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0888584-f76c-414d-8723-08ded5fcdc57
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:38:34.2397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwyZ2CvD3mIG7XpmzOlWCuH5pb0P8Asr+ajHRzi0edK5PoIBSHTm7g/qY9hYWfFCfygdwU4hjBayerFPAO4xzeaCZ6L/i/PlxP9MLkZ8HcXU4KMS9ZrNvEdMfDYarpKd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7376

From: Frank Li <Frank.Li@nxp.com>


On Wed, 10 Jun 2026 17:26:20 +0800, Liu Ying wrote:
> This patch series aims to add DY1212W-4856 [1] LVDS panel to i.MX93 11x11
> EVK board.
> 
> Patch 1 allows LVDS Display Bridge (LDB) child node in i.MX93 mediamix
> blk-ctrl DT binding.
> Patch 2 adds LDB child node to mediamix blk-ctrl node in imx93.dtsi.
> Patch 3 adds a DT overlay to support the DY1212W-4856 LVDS panel on
> i.MX93 11x11 EVK board.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl: Allow LVDS Display Bridge child node
      commit: 5436de7dc33aacfaa25befabb6eed9e81d146a7b
[2/3] arm64: dts: imx93: Add LVDS Display Bridge support
      commit: 42feaaac68f46e7aeb41d065b555d36c486a7afa
[3/3] arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS panel
      commit: d7c5180b7e235a4021bc32722dd7542857eceb0b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
