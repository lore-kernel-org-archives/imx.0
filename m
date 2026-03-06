Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1F637268E
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815923; cv=fail; b=p3JjNu17R4zMRnOKDVFkmIpGiUHwd3/lbETX6X2HOsF9BlPeL73mJLKbvfs3z1LONNdqduN0k6uz/mLMIR4/02UoXFHT5SYD9GY/r8t97pR0fnmX5i6OsRCgQigmc4x8BKRduJNb+2rGD69aORIjeXnEdIwTDa0PJQ4o79333Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815923; c=relaxed/simple;
	bh=BPbm74xN2+Y21qx3rocGpWyhxvRCDrZci9bzZw3coec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vmq079xCChFIb+Qgk6GsaXnssB1dY9OJ4LGkJnF1W5rXUQ3/zcxV6JMK5V7vdfgm/lux7zTGePbTuquzbcl4dv6t5mh9/ItcUmsU5K5/yo7SbUZMo/+mIfY1DJyc7O4NmvHHfDr0e+4c8awwM777U1AEHRhVYp+bt+ngZXw76Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H0R8bGrz; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H0R8bGrz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axboH9SjgeQaKY+933IN/+NFyhCKBjP+0Qj8J9iXc200VVP2CtjKVyzzkhSRp8xyD98+dPAOXWwxZYnumC2S1dbGSiKR/mT8DKodizBORadDueaY8D6fptWKqZlpNGhmW/oQ5ds1F1VOD2IMl35o976tOTjrcQMaLYbiD8kh4KOKQaSWKjL3aVO3ouW5CPeAm0fKlfnjRvj0ezUtkYG1SBYo+nblwprWYosOj1JP8AfcJBOQ2bCkhiP2Oodye0u7Esa530cdfTMpbUSsYZHbOxpFET/hfvEdV9vgIPshXf8ooctRqR77hiVqwEmG3InoaBWyT26tPHcNdw0Wuw5JNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPbm74xN2+Y21qx3rocGpWyhxvRCDrZci9bzZw3coec=;
 b=JIcpQP2h8APz4k7p7+CQxgbo5SUuBB0EyLKZqBmDGFyrSl0qbGliujk6TWhU8fKJy7LQYMbQM9Pj6mD6HB/dSGZLvmJ5tEU9FCxqYe1a13B/nR+rSDumsPQAb0hai+75c+hYVzV4t2BwzL9LS4fByOd3MFdAoEABo5gnQHKxuMowJ/1o/2Q3suhRu4pTCtrb6uYfikshvsokkAHJvAIz/pM8FReOdWJLmHys+vOBJE+Smu+N66sIbapf5Rq3FW+/bsmL7+AfzzgV5XcA/oS7ax6ic443891zNvL9nqgGBlcGLajCxv0r7UIeTfqvAjPEYS5M2w83b8iCALRO4W3YlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPbm74xN2+Y21qx3rocGpWyhxvRCDrZci9bzZw3coec=;
 b=H0R8bGrzZWuEVFxaDexzYJJnjso+v4Mqf48uPUtPmYNvQnl1/qRBB0AsUQtQ7MRJTPIHyWSrjvxYg8tsogQXTwemtukMrYhi3ruHI+a83bdTuGv07OJXadpGKDT3A/JEfQBeH/Mtxi7wVos6wbse8622d9euTQt90VQF+uv20Lin8ZxeOU4D53L59cj+/VtxnVr2bJrirRRBSYm3C16L5JaJHmaW1Xn1znT8Hk05vrwhKNz1bLypbuiw3l3VBrjTrPBysIZwrHrc8BOoTySSJsghUu9IpELVjlW9mZv9glqgjT5Hav77JbeSBCd8l2ZLw2o/U1uM7HHoMDW+dt6ztA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10608.eurprd04.prod.outlook.com (2603:10a6:150:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 16:51:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 16:51:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: Frank Li <frank.li@nxp.com>,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: Re: [PATCH v5 3/4] clocksource/drivers/timer-mediatek: Convert timer-mediatek to a loadable module
Date: Fri,  6 Mar 2026 11:51:39 -0500
Message-ID: <20260306165140.293012-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306085021.1231032-4-zhipeng.wang_1@nxp.com>
References: <20260306085021.1231032-4-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:510:174::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10608:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f20270-ef10-4ff7-be07-08de7ba0ad1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	AUka9AOKDnUv2O3jg+nFiIau0mtKjdlZgqwc1pfKJHfIbYZXDp8dgfpIzwvIWPVcVVZwVE2q5AURhPh0E/YzkkG/5JVZBbXoKqF6cvZS3OHt9dXRF2XmCVhD7+hsVkG9CCxqQmUyv0Ul5vqmsi425mkZ4OlFB5adD4+jQwh9f6eD85R5a2OUrbZXtRsVq4J8SmKgF2EjPUc7wCFISeFg6Tsz6pJEUSjwZG+bQ/KaW8PnHYsV7yCmVO/BxcZYyzp7exETBbo1UjGvDbjOL0LO6PrmV9G14c07bBQ22eqAcyC0v6Nrn1Iy2IjB//Yqm0IrQA5uskzAP/if5JzVh+5ktt9DsP1IsWW8M+3ZkU8jNlAFOwPi8HbFfSbR+fjyt1PVik6JRiqaFC7mygWOceORhndmvGWXcrKYqGuU5khYQq3U1XYbB1xttm3nKuMKJW9IoRVaA8EIzNi8AqJe2gyFlacdbKyTmKBfo2Hk3hYV2UVcuGfQ7wC+Kq5x6g0DvLqm1yaZiQXyUwTnnWKiUDSWbb39J7uphbuThhVNkpacQqewJSGDu8HgdI/hW+JG9Ks9cNB0MFD4LddEImZ8GBFIPbzsVvMfyRdhNpsc7aruDaIXK5YnCw0xslDkVzCwuUzERucIPzij4YMEYCAPBoWKU68YTv2+XcMaAb65Mu4vV045INTb7d2yN12koBFcL3yZs61UnoUbKWwubOTlqB0xkUvnC7f60oKIC8rR2sTAa2Vq94X2M8Y7+Pdf4LK0hAenG1eK6LTswZORygMoeWyB3lT6Nv6MgU2vyv+fjyGiHng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5eeKO+6+T0Y1tKaqJdvM8vDahoqRsqBGqmcAiw6A/zVHe6ax/lhuHV+VOHUB?=
 =?us-ascii?Q?x1aGc9UGPyjTmSWkeO4A7/b4q/KSQ9kWEqKM+qKtqF1CMgq9ec/hP/axKymc?=
 =?us-ascii?Q?avT8s7FUAZU7K81vpT2Tm5eFkQpK7EfRK4Ec2U3TfXuxgWFe1g/XlkMoC4HK?=
 =?us-ascii?Q?EVMKXK1g+drxXuZHOe809fQwovGH+1XItd1jiIK5up+ZCgPI4qmoCjo87ccm?=
 =?us-ascii?Q?5QJZyyMZU65fgctXCejiTX9+XFbS4caFbfcP2cTZk3tN8fK7OaCXQx1S8cn3?=
 =?us-ascii?Q?AmCKIpgtbK8v4pqlm++MWIHEPlnoZ+D0oqc2M9KdTkv/qfrlPwPkIIT7Eg0/?=
 =?us-ascii?Q?lh3Ozeuh0l4LqtAX1b4d20JGycd3uHHO7NMsE3I+Ujdv6piseJO86FK1vJG5?=
 =?us-ascii?Q?kBdyfg4SybSObLhnq3wwDQ7gBo2VDtIP1tpAnUIDTAVgJwtMvqTioyX+Zftd?=
 =?us-ascii?Q?hLdDqkdv3mk9CCa8e6auK5QwC1NqpJgQyHLaaK5EUAz/o8Nc59UbU8n62y+F?=
 =?us-ascii?Q?X4kIAS06ZqVE7aw9ZlLR9kAzsf0jS0fTFM9TDCOHGQvvuW1qH9nZeeWvUz/L?=
 =?us-ascii?Q?OUz3+kDRJquQxma3+dhf+A7jGHt4uUhcBRbLKWn5pIZze3BNZpLIL7yR3HXL?=
 =?us-ascii?Q?5Mf0I8VmVKmZURBOTuyI44BKE1CoDSAD+7b++Lb3qTUHPn48v3WNiakAkEpI?=
 =?us-ascii?Q?nSnYhH5xl2BzSglvATBGSJNb2qYM3p1/7ntFR8YpsaTJVAuLZGems8v6lRb7?=
 =?us-ascii?Q?nt9FgnzGfha2j8H/qtX9vKJ1j66fYyNrFXFzvJzdiR/BlXn3fq9hAS/VIrD+?=
 =?us-ascii?Q?e+cDw3bkLxkyWHwluaLCHdawpveKt6nJ+JV2mVJ1GY58DxK6Om8dqgpeC9fz?=
 =?us-ascii?Q?0aMRfmkN+85tMpVc3NvOKizckWhyN+5BNqKCNjolpDPD426OEzYLw74fdy4H?=
 =?us-ascii?Q?x8CTzG+DDxPZbodgCEjY+XUvqfK9UNVhe+T70mGB/N74u1joNhZZsa4PjgoV?=
 =?us-ascii?Q?egMaPoyDNxkhsO7ACI0f/A2CqQJTMVzOecgbXMNMXTwjN5NHjsoW22h9at8L?=
 =?us-ascii?Q?Aaoaz3i4cRXrYqyg2b8iFr8LfYd+0UfVNg+w9mWJnG8/JfRMtcGI7SHgZw/m?=
 =?us-ascii?Q?8yhH2Hkxhc++ZpBny/IxUg5fmFWrk8zGiKoamUukZqLZPhC8s8xcWYGtn77f?=
 =?us-ascii?Q?2FKQTjoLBjdbNa4dkG7B+mZGTQCCon/laRtLRtyeLpKelP9szJlInx3K+X/9?=
 =?us-ascii?Q?MmuqKuS0bhifYwldHoZRbLAQf+AZiAdORtEtppM6ixajQyIZ6pz5GX24Bkpt?=
 =?us-ascii?Q?JxYwnPshRj0e3brqYyGkdSjHS4xvNITvHM3Hy6uD/qxpDwybKYCrnKDHdowh?=
 =?us-ascii?Q?79uk3AFG+9lyPK8oWbb55jwtj7FzFx3dkCHFaDzbjf1b9CPPuW2mJjRpZj0X?=
 =?us-ascii?Q?KEnO9yJ/BpIL3vZ8/+TvZ3FbgyMlUEyIYg4veWz4i+L2rSgMVOQHTwWGZeod?=
 =?us-ascii?Q?BFUpu+HAnXY7VDHWaeZMOxmw9rNe47qI1ebRfLpDNmk9ZjcsMg0CQtjeEQKr?=
 =?us-ascii?Q?ZYCssy4ZDW8YZ4ckeY8Fau5bWiT5yvDceFHCUN+RmbEqAk2g5HEsjBtzSga1?=
 =?us-ascii?Q?fSp3DWStM85Rj58YEjNqlm9ldlY9PrNvUgfSX/XyBaoGaRMN9z3Xm9SjMWF5?=
 =?us-ascii?Q?6qy/HotwTFt8nnALjj29nDUL8UId5ZWIYmCWAzaReokG0LVj7CIF5OTv8SfI?=
 =?us-ascii?Q?l+l1Uosc7A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f20270-ef10-4ff7-be07-08de7ba0ad1e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:51:56.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2OLxT2lcfcj3EFE2Cx1vLF/yphjVuKbyTZ6np1QfhTV7o0sJpbPteAgvuHogSWTY3dPpQGK4kFtx8Ti8p6P/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10608

From: Frank Li (AI-BOT) <frank.li@nxp.com>

> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>

AI: Include headers should be sorted alphabetically. "of_device.h" should come
before "platform_device.h".

Frank
