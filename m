Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A493655F5
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863395; cv=fail; b=VELQGmUIZNMoGWWWZR6b8khacRR0q88Urux7Ia8XHAC40NGAvptvXW4sN7HEjNuV8enI1s8AuaTPT7wa2EqTEaDCjE35qJCLWeqj6T8RjqGR5EChJpGhp0qez7Tk636dUWree11KjbajuG2EFMItEghbbmVssP4PVoMiD7Mdjx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863395; c=relaxed/simple;
	bh=LxmJGqHFsiBrZY4CJk8+nWq/9aUgx9LqldPA51CS4QA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZP/fCX5EmfVOH0szxUSgD3jhGH1aBmiH1oFuO4VuVYSQhH7f2x09uCOpJDOnOsb73exXIlg/x1LtOzCyoFDIUG4kEeRUn+b/H6zj0uHxVx+YOCwYRWmz2IiXOgd+oMhNN/wwyDqYgGlz5ZTAoRBsA7eZOSbs7ZBUwiUbB+bh62I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=byMfTutO; arc=fail smtp.client-ip=52.101.84.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="byMfTutO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCUiyBEwOUPhqfV/xbaMFZjv6SrifjVSYzHTfdw5HELLNLtuQdSnPK4DqjrwS98U9W1fwasQouZE0JFYhUUwukfhzkxmHuIhrt0PMa2lF8FYn8qxE4xOq7o/88zfMSqBIVRz1meLS0fqvREh1/mTrLvyj4z8t/nfSVqFBFmZ7xSfgQFy41PaLfY0vvehg8SXIZvTQo7S7kctI8NKvibTgOwQM98Wz6nnV25Lly59uswJfU3mZrQvvrkT60VuNAa1Rt+gewmuM9nnKEDS4/Y+4h5HcdIQR4o+gO+ol2p+vnKtF7vg/ufIHGBAWDK/cKsFeP4grIcjYBQPIikhUmKfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSw6rKGniFy9wPos/HV/11m/TzrMg7gR8rK/gPG4SP0=;
 b=PuSXVZH1AqTPDgSt4Ve5xDKDhICv2z3SKawnTaQ71FvDi9jm1yJ5EbCtNiwebCebMhRFbZ+stdWyU49DErJhSOV+X+Mt+jmW8hKUtFNL0PiMAFPpBgQ7gZdN+Os5kIngZT/0p0LcqLzXHxgaM7Au8JknP9F7riDs8nxx8NzLG+pUJYg6myMUIgwXq0ePAWsuHIciKFd/+aZVUqj1EjemDCB5dBijYJ9bNX2UNORw8h+ttaPR+aejRn9qUgponOZouY6Db/WkwEIjqoPD/T8BQhx2sShjPN6YBInRMHvq9qtYW45CSFnAcIEZmkw6JAru3VeoYTRfanAEBzY1iSwVjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSw6rKGniFy9wPos/HV/11m/TzrMg7gR8rK/gPG4SP0=;
 b=byMfTutOq0+8M/CI5rYk744pMpAq2F3mTID4hatPB18M1bTFv1HYD202JQERdt1XPfBzKcWvBEYgZd7wOxTUdCT9rIFYwjJ4CojqQMCFNipG1kMRZlehMtcvf+kbJvrGTF544+oWWgOPzdY02JpNsTzXdtq0NN7JLivHuztIyC6IBliKO+VQNLDtXeoPc68UUQvBdL6A2aOC8WS2e83TfsFxSySh5Eaw1n+6vJ7CyGUPAd480dOsTHaUdLbFPauRdEDqE2IVWilg5IcXI3RIDB1WLxOlTSraA2Q1HkQdqsAy5U7WZMbY1WIcEBtlsGP2GeXJ7ny/jlWRkPIFUvEy5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 by GV4PR04MB11425.eurprd04.prod.outlook.com (2603:10a6:150:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 10:03:05 +0000
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c]) by VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 10:03:05 +0000
From: robby.cai@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm,
	slongerbeam@gmail.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	kieran.bingham@ideasonboard.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] imx8mq-evk and ov5640: Add overlay-based camera support with shared reset handling
Date: Fri, 19 Jun 2026 18:05:30 +0800
Message-Id: <20260619100532.3779934-1-robby.cai@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::11) To VI1PR04MB9738.eurprd04.prod.outlook.com
 (2603:10a6:800:1dc::10)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9738:EE_|GV4PR04MB11425:EE_
X-MS-Office365-Filtering-Correlation-Id: 39224acb-2b0d-4aea-b16d-08decde9f48b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|366016|23010399003|1800799024|921020|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	bLDwp4/7/zhk3BTO3jSmdnXA20TF1abIRugHeq1Xxyx3zxT33JhWXxcp82j1D0h4FkH0OVHP0ZRvwzSCkfd8I0Wdqfnt3pSc94cUKzg6Cx172NilDYdr12+11cAVS8l8mHs0sJSFI0FSDedY82XsfrjrZV0geGoj1Jq+7psaXwpOkbbxjKwk61hKvQKkaW9Lln3isL9oUH4No2aWSya4aeD6k8FogVrwP/pzZGzg2BnyO9l65dUKdyoCJv3gSAPWdwBXEE6DLoO+brwnHeuZzsxsGvCtJyTkyxhN3Q5uxbbXEGJeE2x0NEvohjU9o5pnUFJq//aDGiY12JX0a3pzvSrf5bcGdXVsDTGpz7/njOR9gcyL8lWMoVtk6ezdfDpTiNk5cqaor8J/1EsmamjpZGik5qO877a96NkkTf5sgldl+0wWeOuqiJY7tm6E52vlo/MDfR1AF9Fssydcg0LpxNRyxwmPbZeODMeFqgonIiTrCAxf2SBrk0frmXg7kxSrpxKUP4mrlZ1EoPY4p1KybaSvblCk668l7uCiuyrHLmRqqD3ASA+nk5ZdDBXE8ThU0A/ety/N+T8Cj3/1jIu237F/FH+enJ9jSVDcS0vTYSMO/HlPP5IJH6A8Xzt22QyphC3Ncpnwzfgh5FiVtGewzM2hyTdvzCxcvOedM9c3C/h/O7vnY1FVJjAEJoGOpWRwcLo5DDJCQfST2qiS9uDJ6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9738.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(23010399003)(1800799024)(921020)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?66SSvpoHcGhLio1XMcqzyzhtmWgbB9ASZuOh5n21Iw01xI4z1S9OjGmM67Gk?=
 =?us-ascii?Q?D/FfF75aNUC6kKIhlgZ+k5e8j04ptBxlsE83zflLKLs1zqZ6RSnYG1oW1oyd?=
 =?us-ascii?Q?6oFopv9yayMBysB+njhFw26okRoJOml35+ZmkLzA9cOUAScRV2PP49iB2L4g?=
 =?us-ascii?Q?Zd3IzHwVmrfLm2ylM6EWyxqGFFFcNRxZlZzM1zY1ZoeBzeI74/1yLtEtPcBI?=
 =?us-ascii?Q?oSCx8P1wAKpITUKS0b2syMHaKy8Oh6aRrGhRPheNwNv0aBkfvVSkNgHFiWY8?=
 =?us-ascii?Q?hBaBJaV88M7bpRgnrG/LlrkXb5ZgO/8DTm5agWoy5PqF5Kml+f2SVFlQRrzm?=
 =?us-ascii?Q?XRzK5uDtrtGF6hG/coXpuG7xVv0qrPKDMOm0amhvb7HrNePLjhB4uS+MznlP?=
 =?us-ascii?Q?vIhur9sLcI1UuGp6DUSXQqf2Feqa4KyPTWCo6vBhtoAXB+ho23gHoECDsx5H?=
 =?us-ascii?Q?J9wSgx77N0adeJ1CHBxkdSpcsgxoqDIkcg6D8Ezzxh7ZsCKdW3kOL7ecQueN?=
 =?us-ascii?Q?i7etRhqdmgEOJrW/ew5Tx6JWdiFbAyC9hGImgIUAHNwy35Iu6WLsiEe8IfQb?=
 =?us-ascii?Q?YoSXieHam7otBQVuq6BdrWww2ArLHWgchkfVcrE6e7cGglnPFH39hmJj/eSs?=
 =?us-ascii?Q?4zLfthaHAh2T+zx3uOInvyYV9FCPveS5Bs57EO1th0C/Tw73l04UwoFAmQpC?=
 =?us-ascii?Q?x5RwIWnNW34QpsrgwOl4vuI18kPTnQm90fhHkP7GceFNQmveJ8+331/nW5/1?=
 =?us-ascii?Q?6w+IUUtvPSziu1JBK7/f7yBif0yqsO5moSG0QfJTJ0zS3A4vsA4Lxw7zd8eo?=
 =?us-ascii?Q?U0MGpqRj0KeEV641LYr7EhjjguIyE2KjlfN3Y2lWYfAi+0e8AmxZR418F7cb?=
 =?us-ascii?Q?b3z9ewMaT7gGD0Vxwl8SIxKFdhHp5H53nbt06tcxIwjsut6CUZGnBOT3pM1r?=
 =?us-ascii?Q?Lda2qLSiPjsl00pOPC+Jo9ffwAByFisXhzF+ypOr4vEk1ro6lfiaglULLpWY?=
 =?us-ascii?Q?/xGRwXQ2ZBGITvOUIO9CeCkoCGRf9+YmBuvnpA7fpWv5z2e/2D4ze2aJDKsa?=
 =?us-ascii?Q?y/NAzRVEDoLoqJvfmyClJT8KxMpKc/YgO/WKTKZQeDhQ+NFVfQjS1iWjwfMP?=
 =?us-ascii?Q?3riZFFrN2+YWzWXRvCCYq7jajFXtNYbzFFZyOgeschx+dOC4o1vf8DJtVgAi?=
 =?us-ascii?Q?Nm4AB5UH50KYRO79cCLtjOtEwhyFdDAAhVPPXpmIIc6vRLfLobn0OOdlzsyp?=
 =?us-ascii?Q?Oo3u2+bAXIaxDWl+o1X8BS95HPc8A8yAj8TU4aPYRzeJiSgfotrCGR+sRVqs?=
 =?us-ascii?Q?XZzL1Rgg536qbSA52zdUlaIBnVkLxKJvwTZ4ZCPS68OUFOiB2GfmRmQSqf0H?=
 =?us-ascii?Q?Ujk/c5+sWTcd0g7DJpk//cUtUr/qgvnmwdeaj8SpUvo4quyVA9NRuLZczQ4D?=
 =?us-ascii?Q?2pptL4rZe9Fv9f9Ilg+IVzKm5RgxRa22pYI3fyIaqOhX4W8tL50jlRLCx8qg?=
 =?us-ascii?Q?+KBNiXMMAf+SsyQX7i5HOK0hRUTDm3ccj71eETKGMe8QqXkmYIB0rCH11E4h?=
 =?us-ascii?Q?LMYC7cbmumf+zPOGCWu7ZUpsFG10ENiw/zQ8buu3dJFHr8Xw4JntjDBi3w7/?=
 =?us-ascii?Q?92BG4ZqLY+D0SaCgMIddemdejfyJoMJ5bX+zZnGf5BliMY5ZuipS+ErD1QAI?=
 =?us-ascii?Q?301Y8QcBpoaX4OiZsITqBvxoGlAjlZHeFLH+MzfDRDX7jca9qb0CtimlKPGE?=
 =?us-ascii?Q?aqXDfn9KGr9F9Alj+lKgoVvkS9ZAWsgVPGLrL+igfqF5fyHiFTds?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39224acb-2b0d-4aea-b16d-08decde9f48b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9738.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:03:04.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/rGiYp97GBA8gGCpR7u4ZwsMaTe6owls1J4LDyLOQ37jEi5ooFeWOkAymOen+LCatVZNvtsnS81opXStNjTmQGJVkGyRRZg/TjehhWHrqWZYqFEp4aMN6feCPQR54TH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11425

From: Robby Cai <robby.cai@nxp.com>

This series enables OV5640 camera support on the i.MX8MQ EVK using
device tree overlays, including single- and dual-camera configurations.

The DT overlays describe two OV5640 sensors connected to different
MIPI CSI-2 interfaces:

  - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
  - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge

On this platform, both sensors share a common reset GPIO line, while
each has an independent powerdown (PWDN) GPIO. Due to this hardware
constraint, proper handling of the shared reset line is required when
both cameras are present.

To address this, the OV5640 driver is updated to use the reset controller
framework, allowing it to correctly support shared reset lines. Legacy
reset-gpios support is retained as a fallback when no reset controller
is defined, ensuring compatibility with existing device tree
descriptions without requiring changes.

Note:
1) With commit 8f040b5c5e3a ("leds: class: Use firmware nodes for device lookup"),
the OV5640 driver reports the following errors:

  [   11.373844] ov5640 0-003c: error -EINVAL: getting privacy LED
  [   11.376442] ov5640 0-003c: probe with driver ov5640 failed with error -22
  [   11.906977] ov5640 1-003c: error -EINVAL: getting privacy LED
  [   11.909793] ov5640 1-003c: probe with driver ov5640 failed with error -22

This issue has been reported and discussed in [1] and related threads.
As a temporary workaround for testing OV5640, the patch can be reverted.

Link [1]: https://lore.kernel.org/all/aignTNlK5kCLmQ2A@tom-desktop/

2) The patch at:
     https://lore.kernel.org/imx/20260619073115.3778313-1-robby.cai@oss.nxp.com/
   is also required for OV5640 to function properly on the i.MX8MQ EVK.




Changes in v4:
- Switch EVK camera support to DT overlays for CSI1/CSI2/dual configurations (Kieran Bingham)
- Convert OV5640 driver to use reset controller framework with GPIO fallback (sashiko)
- Ensure correct handling of reset line (sashiko)

Link to v3: https://lore.kernel.org/imx/20260529132334.3333294-1-robby.cai@nxp.com/

Changes in v3:
- Add OV5640 driver changes to use reset control framework for shared reset
- Drop GPIO hog for reset in DTS

Link to v2: https://lore.kernel.org/imx/20260515111143.2980956-1-robby.cai@nxp.com/

Changes in v2:
- Address comments on MIPI clock configuration (Frank, Sebastian):
  drop the first patch and consolidate the correct clock configuration
  into the second patch
- Address comments from sashiko:
  * Use MEDIA_BUS_TYPE_CSI2_DPHY instead of a literal value
  * Fix a probe-order dependency related to reset handling. Switch to
    software reset, as the shared hardware reset line prevents
    independent reset when both cameras are enabled due to a board
    design limitation
  * Fix incorrect voltage value in the reg_2v8 node

Link to v1: https://lore.kernel.org/imx/20260417110200.753678-1-robby.cai@nxp.com/


Signed-off-by: Robby Cai <robby.cai@nxp.com>

Robby Cai (2):
  arm64: dts: imx8mq-evk: Add OV5640 camera support via overlays
  media: i2c: ov5640: Add reset controller support with GPIO fallback

 arch/arm64/boot/dts/freescale/Makefile        |  7 ++
 .../dts/freescale/imx8mq-evk-ov5640-csi1.dtso | 69 ++++++++++++++++
 .../dts/freescale/imx8mq-evk-ov5640-csi2.dtso | 65 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 50 ++++++++++++
 drivers/media/i2c/ov5640.c                    | 80 ++++++++++++++++---
 5 files changed, 261 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-evk-ov5640-csi2.dtso

-- 
2.50.1

