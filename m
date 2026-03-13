Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A5E3A6B80
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408613; cv=fail; b=UDRUGOKiM2VjH3XbmlxWrWakCA/Cs7nXe5VEtcha6iT2aHCXaO2J1KEnCyhr92wIOBfjr7kBH+AIlGxPLuPVMd0fGhWPw2PLQb8JriISt/ouH4Ko4dTlL5H2cohLVwvL2fHaYSsdd9RKWl0ALbAytVaS92E7svHsDaP92qhmIhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408613; c=relaxed/simple;
	bh=GANEr12AH5CrNYEutZy1k39tdDOibtpkCNHzoL0ioyw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eL+a9N9teWWbiUm97Guln+nrT1+4KO74PwNIN2Ya4kBSP2QnegyQUi9QSnxVIGmwLb/wtd4o315f8zpeQbmUdb5gYU0m0fjEuKdaC32SnSeDhhOGmwR4JhKuK4Ab1md3CR7p7ti5t3CZ31YC31YDNjtdrNBlZmK399LpGPdDG3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AoPdv2w6; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AoPdv2w6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RndqxGugoUHtQCx2O4i2U4nNZrKju6DlmELLlU/fx0WuyVh6vTtb4DvGV/oXCU5pAF5k+TOjo3D3DoNeFvcan/f6hbzUf8mu+SxEJIdqUdu3Bx42UproeV61DrqQTCVWCNox4f+u/igizCUfpKtqz8rCb5+wqPGFPAvMXrvE48HzyG4rholoPziyfDMNOW5SXI2zckfN5HQ1PIR4+kY8b3d27pGUi/P9PyqSUZE7RI6puzk/cVpf/nARz8K8PXb9clQ98DIFE+UqtT/fL7BIyIN6BcAYPB6GMdzgvrFCmYBQyzvnBJtRqVdNlItNBHFb39rbWRbyMTeTzO0zbne47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wb6SGyghHN+0s/vCBh3OWfNGR7GxydOXi2rdCIJZ3RU=;
 b=KjHvT2R6xOFWEdpt57cuGPgmd0qOho0MrVZICd/zI2OPMkZqCNe4IXyu47lHvqvIVZ9L8ICabYDFOFtef1ox+whqOptOfVAvba5Lva1Dp+UytUEATuuzCKnNUl8jIGFLzMQ796xTvbZAgT9lELTNhP8f+0hb5IBklNDaOeYpnjFDA1aB+j27WU7AP2nbvRMPJjCRdc7K0CJlKHtKWJwechegqpFA3U1+gq1366oL4jJlvR+2ysO7K7WPkk0EwD1LOeieCywMVbnGDhafFu0o/XKKsysLT6MQFVvSTVs6NaeWqltpOXNlzSwP094IDiEOONS1jxMfoyRm+k5CUrM3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb6SGyghHN+0s/vCBh3OWfNGR7GxydOXi2rdCIJZ3RU=;
 b=AoPdv2w6GI0c5LSaXww740MUsVDDzF7sWATOJgK2e6O/7kUEn4qS8pEFWUaHWnsXprS2rPnK/0Kri3EOILtfeeDrENxAN4ElIVR/8SV7RTIWyjmrvW9CfR851cuuZkKcGL3MPO6qRMrEx6O/impj2A5DpSqEFU9AFt5sloF0Vjf+8zFKa78p90IDHD5pvZ4/0u5jGp7d6cYCp2oa5RrhclGw3ffS0gEkHkjDETnF1vmZkbBl4QPXQ5mjFj3u+tUfQyXsB/CGhuf0n6+JCxF3PHo/C7Gh5mNNT7LZtp5xr9chBoMxYrK/JxRaWxRjwqd0BKXxF+YvJTxOSbQ0fAiGYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5)
 by AS4PR04MB9458.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 13:30:07 +0000
Received: from DBBPR04MB7819.eurprd04.prod.outlook.com
 ([fe80::334:2a7f:2afb:e243]) by DBBPR04MB7819.eurprd04.prod.outlook.com
 ([fe80::334:2a7f:2afb:e243%4]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 13:29:55 +0000
From: Robby Cai <robby.cai@nxp.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 0/2] regulator: fp9931: Make vin-supply mandatory
Date: Fri, 13 Mar 2026 21:31:00 +0800
Message-Id: <20260313133102.2749890-1-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To DBBPR04MB7819.eurprd04.prod.outlook.com
 (2603:10a6:10:1e9::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7819:EE_|AS4PR04MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfa63cd-743c-464d-39fb-08de81049d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|52116014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5eN7sXlKsk7LMFv7xglcaIpGkLfd/3C45HBCBAeJvmom8SS2SZolRo9QfG4TKsWjnxhvQdwDO9QaFCS4NL3ZUj/Pd5QOBAhdttv4lhBC2bOXdsHcmTVqxKZQ5Kqjoqe+Y2lgpfl6f2W8Ma+6cNec3RQv8xgXXtWANsb/eDGYPNGWSRSJWuXkbjMWjAm43hr1tMWzR8+bNvn5AMBFtVti3Yjg0HgFwFw6dx5YIU7D0psWD1EVEbB71U7dUQNFFSsEHAhSQt7/W7QIGKwjeV7YcOHW3u3FxBeaX9slI70w1xKM7FNTTpWV19GZqnIKJr5juG1pN+MtzCMPjklsBM5e9j4FlV01Tww2eBPtAAFoowaRlopfhEYNe436aTMddNQinI3oIybEKVlkGWlVuG8FPrGp/IloHduqKeEh4QsXeZFtTTD6auXM8wSZRSiFSgdMSh5f8PMiu76HtRyln1QXfLn+9G+badVdosxjCmiBAaKpTrYu0wH2n5uk+25mt22mJVv3gMD9sxY7XNXYemPquL5sWkCI7wmMGbmj+BMYfg6s9d1GsuSoFw14J6Qo5rbQVU2vp9zbPtc724GxQNICNGDmzmK9qnVEkBzOuWthtnOjxVkYaAiJbOZil8RD0hNn9/cEDWQ7VJD4wPUYgMTbZjDOwZ6Ga5m3L6lcUXZn1QukLMC/Sld08ICQP5OA/NCaojK7kcrsfcod29tS2rIWWeYlSlvYRXxjVzMAnNg480cQxxmkEqmzQdZteXWLUjscYKH/Bud7w2q1EHxkziKet0jCAWnJ4eDkX6o5ZsmlDhk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7819.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(52116014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xPdcnACAqciEL6T7Yc0y8/5QlhFzADZOSW64csrB44pWoQLZEaM67vO5L5/p?=
 =?us-ascii?Q?/zrTXQonLtGDEZxO4DfM69bJxuq7ZZUZmMYcZ2JGnC0aNpQkpkzyxWxM7yhb?=
 =?us-ascii?Q?cdDOxpIilqYC0mP+nM3/riXuThQ4HGDi4OT42DWnHeeMt60TdysjgfqSlisn?=
 =?us-ascii?Q?XOBsCsV3OToNgvCd76pBKps28V5k+uiUSRrqiRfSfbncEDoOdaHbMkA1Iy1K?=
 =?us-ascii?Q?8hpechoG8j5yAlvPgt+mUSfr63zi774YbyGTqVtCfNLCxlWC1++b6VvcgX5a?=
 =?us-ascii?Q?SERemSGso7FpXmEoLgKVHezuhSL+xriWgERjzHMxIyv1Wg+hT/8hidjfIqAp?=
 =?us-ascii?Q?hR+PmdR6qS2MGwOv77Z3fj//DaR0pVgONRbnJVoVMFMpM8lKh4P/RCJvml5b?=
 =?us-ascii?Q?uzcbCal2gqnZ/Q5qjIxEidosu6m2/Rnz/moBsLOlrm4JoZaymwOdOBTwx3Az?=
 =?us-ascii?Q?j1HvsdP61zDBOvEKpAodNuX9zka9SMskRkChLPfHB85h6yfi75quJSknPRqK?=
 =?us-ascii?Q?UDC/GqDine5d3ywJNcTZRgzf1K3SWNzSS/cDsFIuFp/h3ZW25Is+KhHPKXgo?=
 =?us-ascii?Q?uiGzzMH/il//UtfWS4hrB5opKz3v2Ev+5FyBGSaa7w99prie/mnaLBp6u6Ma?=
 =?us-ascii?Q?RHrOlBQo4ty+8XTwxghmhWxV+xaKOMD7T/mTcXjf4p6n0dHW286DhjxX17cU?=
 =?us-ascii?Q?acqikBVSo6vrPu9/BucAxoy7XWcq34bu5BIaGkbz9PmCSjvcshled8hsv5Iz?=
 =?us-ascii?Q?0SY8tVAKdnoofcMIr9P9pNHHq+HJjwIrr0g9RQ/PzWdATitdP4tozNU+PH2D?=
 =?us-ascii?Q?hEatH8Tb5JWFvtqehVHi7xQI91W7ZNLN3Uu3wshLQwHWRiQIhvu9MEtSe5ch?=
 =?us-ascii?Q?06gdWfk3Pl//Z5UWD2J3tROIJIzWOdjneqiMCk3MCa4djNVysRR2aokhOoRW?=
 =?us-ascii?Q?ntOs4q2vMFvzV4VCaQ79sKb7OGG/OKFIpowYMONKCfxplfz7twqvDnYvAf9Z?=
 =?us-ascii?Q?Q0JMzQqGnV+OvU1FpSee9xRC6EZHeOyd1hfi/14R+2/QjfHw84NR7TPABiS6?=
 =?us-ascii?Q?o7RPxNEQ4/0T63/H6qQpIvK5JJSGvDI7gRr1PIX4Dy08kjemZZhLIk5W4Sa0?=
 =?us-ascii?Q?XwRB10TCKXVE9t5HceM8osVBxuZGz9YB4Cm8i3ajU+Y91NmaNC/jwVHzypOc?=
 =?us-ascii?Q?ttRDoLTkXZm7PK5eB9NhXAmTdPTLjH4f8POpjjHdt1r2F/IRMbnlwVCeyrlQ?=
 =?us-ascii?Q?AFsqlY6Bw84DweSnmvNtb1sTTtOHmfY+7ZkLgcFduIR6XR8GBvO8hPcdZ/H1?=
 =?us-ascii?Q?zHLv9Y9dnXUo0Gdz5zRIFJNLVoz3ZK3cDcwM7N9GXn/uCqX+wETJRqM4PkPC?=
 =?us-ascii?Q?KCGjyemzzk49GrjAFOy3RUVaCeNs5gVEG1luLFHE2WeVUGgkb9Uty9ngS01R?=
 =?us-ascii?Q?kuOHrAS0CdEwhqs5LOtEcxyBLden//K2+TKzTTc0lOEwDuShGm2jpckWVoks?=
 =?us-ascii?Q?XDdveb5ryeOi3Vz9VP1SHlYZEVO6o7ps5bfv0bOM8LVTK1KzsApqXuhCiSHR?=
 =?us-ascii?Q?fySMwvuEQoz9PxrJL6rJiIB/goQZ+KHOagqJllNLiZKOdFowTxakPCjSDwK+?=
 =?us-ascii?Q?6Wvn/TrMv1Xd7LS5vd2r9/z+uNiN+nxlRjbJHQ544Do968N3w9u/MtAckhXZ?=
 =?us-ascii?Q?AQBSVXAYTvSI15iq2uwEmIaZj2NKP3TDEHaxwqVMjcrYTN3aeeANj73yJSDs?=
 =?us-ascii?Q?o49YCOLQUw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfa63cd-743c-464d-39fb-08de81049d2c
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7819.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 13:29:55.3482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FIVjNKLcPRI/uq0ZSws1RzDRa1oUTJ4bhREXTa2Ou6Nh2JdisbVBwbrg3NoKbf4YwnEwEO2TSn3rG1sXVgxrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9458

The FP9931 regulator requires a valid "vin" supply to operate correctly.
Therefore, the driver should treat "vin" as a mandatory supply.

This patchset updates the binding documentation to mark vin-supply as a
required property, and modifies the driver accordingly. As suggested in
the reviews from Andreas and Mark, v2 switches to using
devm_regulator_get() since the supply is mandatory.

Changes in v2:
  - Addressed feedback from Andreas and Mark by replacing
    devm_regulator_get_optional() with devm_regulator_get()
    because VIN is required.
  - Added a new patch updating the binding documentation to make
    vin-supply a required property.

v1: https://patchwork.kernel.org/project/imx/patch/20260312040148.GA4007088@shlinux88/

Robby Cai (2):
  dt-bindings: regulator: fitipower,fp9931: Make vin-supply property as
    required
  regulator: fp9931: Fix handling of mandatory "vin" supply

 .../devicetree/bindings/regulator/fitipower,fp9931.yaml         | 1 +
 drivers/regulator/fp9931.c                                      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.37.1

