Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259293DEAEE
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773427066; cv=fail; b=gpTjpD9RnvPWN9dbg8wJjVUn+PXuupjArzspGOciRYT/4xoh2eJeDW90Bz5ZYmK19WudxSlLG1UfOmdb/B4HWVuenmV6rnlW4W4hLAW84c4VmD6l+ABA3If3IxWHZ7yYJp3Sb4HfxBGAlrqams6/4ECYBCDJca0tpwfZedMyJpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773427066; c=relaxed/simple;
	bh=tIgqCYzmshlpIMyuALfPzi3e0Ts7mfOCThitjgUxGj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iCRINXq46lF4FeB5W24WmWBSFt9hNHmKkWQqb88PEWF89kDSzTEK8PMUpDI7ySVBLB5vM29qGt/eXVHJgeTRswTRkEHeN+u0+wSrg/pmBppkthhKVagpKrAocx4vkK9IAAiY5tmuPoZjWnaExoI1hSJEkeOtafOGY5CmV5Z8NK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QRNTUX/K; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QRNTUX/K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7HM5G3Fd5JIctBs5RNkIyntIyr9X+lGYTcbbczmrTVH0Zswdib80g7LOAO01m5uKkzWPi0jynZ8YNXzNgOVp5DZA8mkrNz/oM/rlo07wppestDF1XBsbiZTvkX+NxO4HcH0/YNEJFhSiybzWyIkfqb6/HIpyA0tcjIo8GjKrCXdeZiH841E9A13MjDfXgPjzoNHxjwTg3iekpxEvlOAA/Vi3NhsoLkqVX5RFB2wSoy6RLzyEqnV7Kd4JHmaN5u7leHg/nVMEMkgH9X8zPrOJbrhbVG4/vetIJ2nQQkQoRVpi4oehECvyaC0NohUKWopOQ07zcYnE2m07ay311iZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhGkXtrQN1K+aEqLd4J4qlis38y8NElxUycgorcr8CM=;
 b=WzsTlcac2Uz06ssrMbwCm68VUKrPvp0Ow7s4D4c1Gs4ERPP/5RIV7W7YZeL98Tu7WSvgQ9BWzDCDuYA5NhpziCs47eZGjKDBLAmzXlDbD+FzeWV7Ze9oEuVPREpJhpbKXdq4rW6LxtV+Wb1sOsjmaAxHBCmgYq/qYZNQUtKqoDOHhoRAKRrU4nAsJ8hkGFkjbLqpjDg/F0J1/vwM6wz/ZCGuujPy/pFYSva6NSmODtS/xgecWC0NEkX7ckPql6KFBCeK/GOepaVBpq4sEUTpYl2jFeSwt2tu87HNBF8RCNqAWMYxIeVirOgtO0hTwX1eGVYRAA8v/MQQLW6ry6esUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhGkXtrQN1K+aEqLd4J4qlis38y8NElxUycgorcr8CM=;
 b=QRNTUX/KA6brkdVxF9V3WoAxjfjTZ0tR6A8gb8x3gvpgqjgOY2DbYLERqT/arb7G7iojlf9UU45DEMQ8ulw/ht/uNxRmZNq2deSb6O9gkUHdLnSNIhuWTN6/GMnDycMEelGqxJMpsUQnkxQyq4YbDorJ57Q30f/OIJHrZOB+sN1Fl21Bwr9UQQIrD/nR+wMouptZD+kFZRXAS/56gq9Pl7KtlM1aj3Sv2gRfb22YXassk2DPTh0875l2211TLfITENMXEnt+wO9LLpK/6zBOD3hxdw3BP1+jP7e0qigKlJp4XEFCBz6k+K8rKN/eQBgYATbZVAw4FsxlBRDlFum7Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10458.eurprd04.prod.outlook.com (2603:10a6:10:565::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 18:37:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 18:37:28 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: freescale: imx95-toradex-smarc: Support Cortex M7
Date: Fri, 13 Mar 2026 14:37:12 -0400
Message-ID: <177342687227.211387.1252876243196615140.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303210125.1781197-1-ghidoliemanuele@gmail.com>
References: <20260303210125.1781197-1-ghidoliemanuele@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0082.namprd04.prod.outlook.com
 (2603:10b6:806:121::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10458:EE_
X-MS-Office365-Filtering-Correlation-Id: f996cf2b-4994-4404-4259-08de812f9451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|7416014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	71mMrTX0eRvP999CiE1VtPWNv4/pbxPVfqC45Ap6se9I15Y7VmJ2eI6pCnA2IkjmcBbfqu0PMzCQAhENVSXNZnvRUmgyd8rLZUyqXK6L5+J2nAmm5Jb/ENpBrhW6p1d0u0Z2NHPiiKgzWImahtCkhonxU16hH5k+CohP2PcBfsvtJE1KgPrP+AOjZ/eqQUuCYQsXC8/RVuAgRJUgI2s/evnXZdqRzrA6HhB2TD3afWahGRl5eko4ZLXJhIExxQ1W/NNKgfYr92D7OBxaSGMvFJ68QL7PiDXiOXhA7xrCGP6e6fI2SChJzIERVB3dCIrgHpFA0KsoAbLINEkR0BJCYtDvEFygAOlcSKt4LAAE7KovBqF6f5uHrj6ikcqXvSFm7KxjKHeq7b2QDE9KMV9X9q5vfX2a1NuDOfx5xmJeA5xMKydjObo/N8DvL6w4EH+sdSLnsW/QubeMSgYIxj4bqVT8rvoopkoFBes01ugiFtfMEO9ree+i0pAZtMUOGjFom8B6nRd4HUbUxyMU7+nblR1qwY4gNCRnDBqxQDArSCSEMMOHmallZRnI9R1E3Am3PpeR8lK+yWGheOdd1HARxRO6F/xe4CUlMjvDlL56rV5zjC5/rrUNf6NnUuoYcmBl4UREjk/L+HTnFliDvA0b4tLWnCkppEKxrbIbxVkV8KfsN/2sh9SVo/udW9vR3Rz6HoO0dt5aE2O1Y8Ebll/RPYwekxQX+357Y3sw8qWpnhflhuGuiYxqfiupkDG1uXk9aTlGKS1lvma44vDYhryss3EV0CEE6KPfrq0XDKQ/V7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blB2aGdydmpHbHF6QWFKdHAvc21zdFkvdEpYZW5aaWQ1NHRIL2M3R0h0Nkla?=
 =?utf-8?B?VTgyOGR2S0JJOU9xWDk2VitxRFRQdHJ4RmlmK091UktMcVNNL0JSNFZkRWJy?=
 =?utf-8?B?ZUY1QkF1cGROa2lvYUdsRVlPcWtzV3RReThCWjdMR0ZZeFJsamZ3NkpPVlN4?=
 =?utf-8?B?WEl6SUtreHRPM2o2MjFQcXozYzBqM0hlckovQVZSaGQzK0UyQzEwQSs5dWR1?=
 =?utf-8?B?VXMrWlJLeUMrVEIzVW0xeTFOaWhJL2ZYdGtLY2JSSTMzMkV5VWY3VThTSjdS?=
 =?utf-8?B?SFpRWURMK0xBYmViVVV4cFRvQ0dtUXY3bjFwZTYzR3EwVWdiRG93bW0wUHY1?=
 =?utf-8?B?cmNVZVdWdm5jazV2L2RDdUVvMTF4UTE3NGswVXlkbUg5K2Z2Zis5MExQK2Zp?=
 =?utf-8?B?dnRHQXR6MnNhRUQ0Yml5aGFQdmM3NXlleVVyUnRRQ0RmRG8valB5bTMyRnJl?=
 =?utf-8?B?ZUp3Rkl6a2pia1FFWE14ZFVRSjFRU29uK1M5OVlwSXFiNWZlenVVaEZXTWZ5?=
 =?utf-8?B?V1Y5RFQxVG9HeVdTalFVZWZOZS9VR2VpdUxaU2pyVEhSQmN5a1VhMGMzT3Zx?=
 =?utf-8?B?Si9wNUw4U290clVXdm5aWU1HNzNaRXdhVkVRd2pNY3lIUDFnQnJqRTgzRGZq?=
 =?utf-8?B?Mm5seGVDdDhoem9mSWtZMkZCbEwxVUlTUW1PUThKZERHQ1pubVNLMjE2aGg5?=
 =?utf-8?B?UEVBVS9FZVRROEwwVENnZ3p3TU5wdFY3ZEowNUJLUHZBODI4bVZ2b3dkTzlD?=
 =?utf-8?B?VGc0ZVBYNHVxaTZqVGtlMEJjWlVuRHdpRUV2MTh1NExJVVNFRFZJQm5zV05j?=
 =?utf-8?B?WU1DUFNFRnNzVmN5dDNVdTFWcjI5Wkh0emU3RVZyZExuSFJEVS9hRURnVmZW?=
 =?utf-8?B?aW41akxwN1hOcTJYRWx3cGdxMnVSUE50akdUYm9mcS9PTlo5ZFB4d1Y0R1Vx?=
 =?utf-8?B?a0pWeWlSTjVBSWFFS2lzekgzK0xWUWxoaXlxWTZHVDBFYmRyWlZ2eGN2M0Jp?=
 =?utf-8?B?Mzc4Q09WQVNnZ1VTZFJxWXU5VExFV05aT1JLb21NYjY1em8rTUh2L1M3YnJB?=
 =?utf-8?B?eStISWxvMVFyWUtvdWxFOWt1WkxkZ0pDaG5LZXFBMGFFMFlUSnY0S3JYb21H?=
 =?utf-8?B?NUhhQTE4SkhrQkFWaG9ueHlITStVa2VpendzUzBadkNFQUlZeXkzN0h3Vnpo?=
 =?utf-8?B?NTV5N3VaWWlFRmJEdUpMZEU3b2pPNlJZTkhQc1pzaGF1czl6YnBDYUsyOVFS?=
 =?utf-8?B?c0p3RUIzS2hCYmNiN0dlTE00M1JXV0JiU0lUelVZNnNGN29RMGZ1VG9zRVdr?=
 =?utf-8?B?NEM4VDE5RDFoYVIvNlAxNHQyRkNmOWZ4NDlNd01NUFJBekVTRUROVVYzbnB2?=
 =?utf-8?B?SjBPNHNKdUxhZ25xYUZidWt6cXZxYUZ0MDZVODVyYm8yLzdsTUIwNkZRY3BR?=
 =?utf-8?B?d2gxaVZJc3FPbFd5MjBlOHZ5d3NJeFR3UjlCaG5KbXJJOWZrckY1RjY0Tmp1?=
 =?utf-8?B?ZWFGUVFLWXk2NE1IREM4bjVmejZkMU9QaXJtbHcrTWkwcitwN2Zsa0Fubzg2?=
 =?utf-8?B?dDEwY3BSand4T0habjBIMVVOSktjdUdaUEpSK3A1cjArekFBU0NlZ2dPNERl?=
 =?utf-8?B?eGhWQ2xoSCt1bTYwMkszOHlPUndDci9qbjhkR1EwZUZiUVoySlh2WjV0cnQ5?=
 =?utf-8?B?S2t6WFIxakhIbnJpTzhlQ2tzOUxQZUd2TmhLdjhYTmc2UE9VYlpnYzBZQnJ2?=
 =?utf-8?B?Y1pFTnRERXJuSGRNbm5ObG1hWEZ6c0lyWUs1anZ1TkRGRkgyeVF2YnhvUWRz?=
 =?utf-8?B?VDZYS2FNeUhtNVNDNjJ4Y0dmUVhzUG1yaXpodzVkNiszR2dtaUJ6M0l4Q2p0?=
 =?utf-8?B?cVFNejBVN21mejRPYjltUkNwS1BwYlBMUS9qWkphU251TjA2b2orTFNyeDVH?=
 =?utf-8?B?Y2gzNlVVa1Ywd1gzanRQRzN6d3QvbFRlTVhCbUY5ejBCckQ0aUtiVjlBS1ZE?=
 =?utf-8?B?bGtBRnBKQXJYaWF6UFY4Vm1UUU5SQmFaeXpTcTRqcThaZnVJMXdTM2JNRzBy?=
 =?utf-8?B?dFZJWC9xdGNuZGMyZEl1U2hUWkJjdlRxOXpZR3l4L05wOUJ6OXcrTmZyMmti?=
 =?utf-8?B?K3FlRW1oUjVnMTA1TnZHTnN1WFFCeVBmb2Y1RlhoMytUUU91ZDB5M1BhaGJi?=
 =?utf-8?B?aFpzZHA5NEo5TUljUUYzRmg5WWpOTXlrVVBoUmY1dWc1YnBIS1BvTVR5MjMw?=
 =?utf-8?B?MG1xRjAxdHBiYVdzRHk2Ynpic016aWNwSGlRTGRWbXphcGZPTmRIWFptT0hR?=
 =?utf-8?Q?F6KTcry7mZOOQ3Vbpc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f996cf2b-4994-4404-4259-08de812f9451
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 18:37:28.8936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+tGhINaQT5mOIiFcEB/qEZCXnoEe81xx8DZdHmFjj5T1UGMuA/6+4+F6iSLEX4rMD2X++ij+y6srXqkLjA4OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10458


On Tue, 03 Mar 2026 22:01:07 +0100, Emanuele Ghidoli wrote:
> Enable Cortex M7, the vring nodes, a mailbox and reserve DDR memory for
> the M7. The remoteproc framework is so capable to load and run the M7
> firmware.
>
>

Applied, thanks!

[1/1] arm64: dts: freescale: imx95-toradex-smarc: Support Cortex M7
      commit: f0e54db969cd2af80d065ee45827ff24317d507a

Remove unused cm4 label. Put remoteproc-cm7 node just before node
reserved-memory to keep original order.

Move mbox-names after mboxes.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
