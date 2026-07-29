Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013007.outbound.protection.outlook.com [52.101.72.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB3830D418
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353959; cv=fail; b=Ef4gnIQ0rXtqHHXg+ieTmuoH7wQJ1Nce/OXWubRFwVaYgOfS9oWHwCBj8ec2u7rq/eanw0MM8g0wazIjGx/8OJ03/bmwinxlF1DGzxnQfcxzPsvvAM+cC78t4OB2zzrLbzMVzkPw892zcoD8JptRRughXr+NxWHmnyaGHBGar/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353959; c=relaxed/simple;
	bh=IHgcKgo1jWIn4fDOZZYqqy7xm3mdMPVkiM/b7CgkykI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ApWYVvw0aosgc7ZC1x1HWi1bcndc9xzZA/kV0q1uikEb+d3vd0tSRvlUX6ljcSwVeiA36B3yKj4i+XS/4MRNmtLGsJp6dHZCUicudCLSrPEobpCHk74eMI4oS7OCL3dquPgmmYzyQp+l8FU5Xias6H4ucmHxZzK/LAmgjgvGT1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MbjCQNFB; arc=fail smtp.client-ip=52.101.72.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MbjCQNFB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOjyoukAZmRgH1ZIrjKmCEzjUdwM6VqtthSP4ezdTzc+6jYNV7y71HRUd2n3STQBvkUh1IYgwozgmwMwBLknzOB30mAndqjxQhyxrmY3+N6cLwIi7CenR/TBCovmZQorvbp+53Ov630A5sc+y/FMrZluB93/XFnBvhJ7KhyYnkxQmU0wIsEf2DtdZyAYgwLQrT/nQUHn6lXr8Zy8IXjW24aSB7H/Oy5aODg6trYwBco+zoWYOVzuxtgyhG0sldSnhMW76vKFthsLPOvKS3if5+q/xRq1qWlpaPDiafGsMv12aBBvrF4o1cy5rbpBr+GYy8h92OYf+KC3r9MTgaDp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhnpA7z3am2vw4pVqNwBOjvHTMmglApojUH8ygzKlD4=;
 b=Y8wS7SHO/cqk332NXY/odAAe337USOKL66uUjxzkJOJH2j3yjfvdSaP1cCdMGIdf1bEo+t2qywtHDRKbxve7x5hG/+3j+qs3RLVCj8ydxsWekoWbcV6olUNWv3hbbRVYmp17NfZqCleobHJBCrzDiVUIQGXa1laUCRF8S5631P2XeOjjbJcwMJvSBFPQOoBrg53XQ/Oay2bVSOWBOY0H9ZMRw1fQBNAs+efRRquZt8xZiQUWsZtOClCowl5PqRKvoG3R7fDwJqeeYxCso2ubiuRCqAVH87/y2zqL4vKK9f0YHWR5LFbuPftM57I5smS95Mre9D5fG7IbH0N8CDlabg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhnpA7z3am2vw4pVqNwBOjvHTMmglApojUH8ygzKlD4=;
 b=MbjCQNFB4LnE5pBdgJ4wLYiq9Pdh544xLOpICL0dnAYxPWORyTsiz/vJ0h18ulXBdExnQ67CfW+CzAiZIq1+QCJoEUN3FkwaLssVcicNea699jukOqosywCHyiNK3HOS9h6YDvzAcCRWGCENWj+W7yLOnqJDM9GVkn4zc3ulR9ulYIdc88JUfg/uvm2zDm9BcpCm3hrr04x0lJtp+5OUxXLXP/EnTcnM9m3imCf7WQEUEzu9dn3cgwy+QotkrB4TrYTPQ1LWE56aOnCKjdwGLlQGH3MqhPCIYIAkEnGqS0NDGzluwCEvzFVCqXQX2nvudVKrnHZ9qYOohVgsZJ8vkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PAXPR04MB8492.eurprd04.prod.outlook.com (2603:10a6:102:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 19:39:15 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 19:39:15 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: MAINTAINERS: ARM/FREESCALE: Update for v7.2
Date: Wed, 29 Jul 2026 15:39:00 -0400
Message-ID: <20260729193902.537305-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:510:33d::31) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PAXPR04MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0616b4-80ba-4bbd-5082-08deeda91248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pJvtRJSNWVu93uIpjXezqr1QJy+eTyrchO2RHey63NXiE8Z9z6qgoX8RMtBZDuGFpUUjfwBORqD5GlUoWtyPuh2i0JhWdGy/gBTqQfpFbQ3shXGDxZxsyzUl3uhGNIL7N8O1z4XNi1xG9BL3hmhK4uG7NU/vexROJh1/SZsWFgzBTOzJzLLEN/6Zprkdy1HAb2MwAu/n4QCO16QMaT55a9y5ehSS+fZ9fhDFvTMyjR9b7BE99WAeAe9GTNQstW8FR/XHTYAqJSJfYQxFZRawsI6RqFSnv8jkLedteJiYt9EdiHpPnI626v+7EWpshLAzHBiJRwOzF/2gdmkj5m6GutHBWiCa5ZNHgghpgsgV6AapnI4o/QiVRnZ0Cb8l0PU1b32tAsUvqraN55NgLiET0KvkpIVM1CxpRJavCzx3csRmysx3qL3Z/Wrm8R5hJ4SOfUt5zsbANcLEP7Q5PicfouC9MycfR1tO0p/sgietPLLoKPvtfNpI+vmRVqbz4xUMwFlzQ4/ZhbmfTp8v2OBsHGj9TU//JNL0yfO81qF7w6KVzIJIlM4aILUBzSRhLVFEXmQuNoyPvI1Kz5KdPPent2o6er4o5eAMfpLO6UOTU1y6WS7YFyOzbL5Rl+4fzhLvwmRr+uWK933v0IIvO/zV1otNRFSopOHsETzmCdqdHt8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YMgZhiI/ewBT82kleBg7+42+3iJrK5QbB7Enz61m5E4i8abLok1GTEZhqLRI?=
 =?us-ascii?Q?+DgKVbz/sWmR/TsuDHkO+SjK4T3ipXC8iXQCcFqqCsa0mX2sznEpwMG7Raeu?=
 =?us-ascii?Q?pgl4cnL/fW8+Ej8IBuIkl05WBT+CvilN0s1ViLV1dzi+LWRN0iKnFZe0T73v?=
 =?us-ascii?Q?VbEI0zPfSlc1kLL9x7h29cALygr3eWvm/qQYZkQSznFJA4re/LMlKe6XmeVa?=
 =?us-ascii?Q?AFW3aA2nL8OAr//tnuQQuLQK68ljV5Joa4ayrf4waOnGZDASOkeuezIchyTE?=
 =?us-ascii?Q?IdpqahsHOlarfBzVLndcg3gMe7QkgGcumI5gLi9L1dQqmfQTxnH/exOMfh9j?=
 =?us-ascii?Q?9lpXdaduHAj2eLbNW+MExah7HA1F30QTgfR52Qdq6zESDEsqDunoCVPyDVcj?=
 =?us-ascii?Q?KRe7KFFFzB53H5voRZ629RPeDWEzS+fllXVpHWCgfIxiJHlWSRfseBu19+J0?=
 =?us-ascii?Q?B84ZLl2jjrettOCOH0s6kYEGtGVN+QdF0kxjlvZ8bNjo4YATUE5xCWKBF85E?=
 =?us-ascii?Q?WgUG4YrcO5fUVNJCniBiRTcBKvrb76Dah58KA+71YHm+nQ6der60uCei7rAe?=
 =?us-ascii?Q?LhIoZfjp9gVB0CtlK8ULhOxcr8tL0Uol1uT3ul5yj0pFlFr1sxFhtQqWyK5g?=
 =?us-ascii?Q?mEKDjrLp8I2RN7CNhqacZXZLO5ZrgW3cUc7j/N89lyfr0KErVvnbv36ZFVOo?=
 =?us-ascii?Q?duv6KzgzQUeHU6JqfHHk1lI/LfjKlBjquRTEh/SK5k+arsEgUKdeodZxfqZf?=
 =?us-ascii?Q?ICs8L4SIcU8A/NsmODPq2jd0WsRB3Hg5/kW7ILad9g05MJ3OxPG77gxLJtIh?=
 =?us-ascii?Q?sLDMnK/Dcrr//W0ddfyRplY43A9yVIePmgs8iSYMZhqIyjz8mWwt8TIf2FIu?=
 =?us-ascii?Q?N2kJ45+1DtRL1sA+x1ZclooIeaet0dx7eLx0P3KYnWLHu3i9i9ddwn4L9sX9?=
 =?us-ascii?Q?N8q05/XyDMRCfxaiidNiJShTZqZVwwIKejuDFVl9bJOXCdw0p/pREbZe/4ZS?=
 =?us-ascii?Q?aRuJ3hKOtUWJ+iVkC2+QVbZLKvBu6eaw7fPwytHSYxDu4R6QGbhLfWbXmiCU?=
 =?us-ascii?Q?nJcR7n87T1XkNwk2aq0vWXp8JBmdM6MQ8rFXKthDwTVWQrVytpeG13QhBoyi?=
 =?us-ascii?Q?054bX4PcuGG8w+k98eHOUeoD4Cf+mzIigjCcDKQbLnnzbTHDHDz+3a3D0SCa?=
 =?us-ascii?Q?QZhU2BZBtXAJl6cwWqQnsOWpJtGr8MT4z845Wu5gzDOTWBOnGhk8MKbX4o/g?=
 =?us-ascii?Q?GbnBDCDQtMFy9am1prvv9mdKkCiMUc/7w+ykerNubl1inFwc1An/6Vv+xiuW?=
 =?us-ascii?Q?zjpzktpxzjqCyJ1nnGqNGGFu8AKu4k6PgXWeDf2PQ0N5g9kCOWcg4KU620GN?=
 =?us-ascii?Q?QDoEProNTl9o2sD3A3vnaplxB8ih512880VEfgT+MlSkqVTaXasVAcV6C5mA?=
 =?us-ascii?Q?/L3gKvuDo5+Ef9rV3mgOju4kqlxIihLUa3rVY1v+/0RF+zXYe5zYoAQbhicA?=
 =?us-ascii?Q?/L/xwoDF+ervMl98GT63U2Db5yA7uQWRCbYNVryKp4Yo1XKpa8kzktcX6NST?=
 =?us-ascii?Q?hM0o7MaxaHOsyXmWl450DFM41UUJGTZFEtzQy3bdrRstZPNl5PIMiJM8suLT?=
 =?us-ascii?Q?rPYIAXhCwm4LtpuLjuH8DK1a+IwFijRhcFhxyoLKonHGu5vNFWvxV9QsJLPp?=
 =?us-ascii?Q?FFlvCQVIyIBvZ3QirTKXyHj5RVFNNyHt/+A9HKHXW2RAypDZ6439+hINpLV+?=
 =?us-ascii?Q?AnVMlnNIo/cVK5ajccnvp4/P6mYfheHSWrnsnYdl6sefp8bCz7z2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0616b4-80ba-4bbd-5082-08deeda91248
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 19:39:15.5560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUF+r59ihGPMi63sFtQKrz/FP1cXER85HvjEHeWDLTX6KYXXBbWJBcLK7Ho7x2QrSvFVjuqiNuUnhexBZsf5GcRSxygzibPH2k7Tx3xZEVbLuvih3dMLcad0iRxESvKu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8492

From: Frank.Li@nxp.com

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-maintainers-7.3

for you to fetch changes up to 645effc0984ba8cd83cdf31e5a29945cd40973e1:

  MAINTAINERS: ARM/FREESCALE: merge Layerscape entry into i.MX entry (2026-07-24 16:36:24 -0400)

----------------------------------------------------------------
MAINTAINERS: ARM/FREESCALE: Update for v7.2

- Merge Layerscape entry into i.MX entry

----------------------------------------------------------------
Frank Li (1):
      MAINTAINERS: ARM/FREESCALE: merge Layerscape entry into i.MX entry

 MAINTAINERS | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)
