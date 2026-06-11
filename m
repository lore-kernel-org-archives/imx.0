Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A933286419
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173041; cv=fail; b=M7OhBS1QUagZI4FTUwMc59FCUA2ceZ3O1dmBHNa5dkcKrm/oXaDuPZHjKVqQPqbN79cUc/62kOILecy8I9dvdcc7tB5y5aBBdJHPdzn5yk8ke9uQOkmmEgQMUrcNX/P0qpeT+qnumx8D1DHDzbv64DyaNdaVu3dcdHGtihZa/+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173041; c=relaxed/simple;
	bh=4NzK0wJvwQCDisLJ+uqCdFMF3Fo9gq0fWhSt14YlInM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=honXh9tybcboJpfWqe2rHbsH5oq4oF+E9iXZefTZdlbCp+1sCaLtlNbdK6OLapTyRHEIl75FTuyacKUExjx11YhDyNA2EsIPTR2zGSSOVRws9QKeaZiFEClke3MPh3yTfbKFHUPGt/g3EuFdElLn9K8FgU3QVuyzf28g2saB9KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fMrjkmWg; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fMrjkmWg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYxmO+rN2VMr1YsAIWGmd3DLnI+g5K89//OshcuFi9al4GhlS3pMWHQOfR6IPnKxri3Ako7ketLt0xWdi0tsiG0bF6lyJeozA+JoQFK34rgEvJZDCNTF5Bc2Dr/IHMI+msbEv0gaFuOCEpmNfeuv7vWwBbyfkR/vvpgLACZcwMsILwV94Lk/HKOqGIOfsyM3J/pg4GruRBpgMVON0H6TxwwOwrA0maGColUlq41KmdyWvJx1e18LP1ssNwRn+d2zGoYL0QvTJuosC/ThoUnlxoWxE3FylCJoRR8zGVcn8jqphxQ7lLXrS3CBMOLO6atoRiKyL2C3Tf0Hk3cospB2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tom5knbsb2H8d9htJQA0ByBvHM64e3kGczN3bpx9RAM=;
 b=EOAQOBbxmNWBMLmVIrJrldSfhyYmCzQGfJo98MIQUGuR8xwUaUzqdQZHc2RyfDGv/Y2g0bar/ffLoO8foh/HxQPM9I0FioBseIUtue47E9L7st3TVcaETkAVAr2pRaOtzdahi6JZvP2/J7AQUgpCxi0AeVLYZ3bX9kGaqPGiFpqoinIxKRWTGFXaTx/FKpmAafetd2r809uRXNIfa8cDXERVT0zW6+Evz0FwPuvAUqobLU+9LoIS50ATZqXWcYRviyW6z1nxW22vf72VS9F4T9HASi/NoKq9V9CzFzaLmKoJai7UuH5OkllEHBnsYRyqDOtqD+RU+OiUdcJRVoE26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tom5knbsb2H8d9htJQA0ByBvHM64e3kGczN3bpx9RAM=;
 b=fMrjkmWgo1TTBhXYmtBCedZeyL4pBbE5geRf9RzndbQ3w4XyAcUliWYZbRBw4RQxke+A1HspdXfltEJ+6mIABCxnVMXntB/ZvMjBQgUKpSHm9pemKMa5eUZPi5MdRlEJcvFnouI+HFEH+stCRhfGf8N0hvPId2VEOUlASeihMq6I5LOym1TeU+fYcHdPGwJJ7M6GgMBKyi2yg3csSY0LDDTc2GXB6yVFy3wRtLluQSfGf8tvSGBT/hfXJLisw9ZwVIXDnnXat2Jj42PpWQPtpIsIqb/36I4gtADxfg00u/Ffwleive2h+EC/rsL4RUgqjklvHHvqFYpqi7IG279FOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PA2PR04MB10333.eurprd04.prod.outlook.com (2603:10a6:102:41a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 10:17:17 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 10:17:17 +0000
From: pankaj.gupta@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	frank.li@nxp.com
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH --next] firmware: imx: depend on MAILBOX for EdgeLock Enclave driver
Date: Thu, 11 Jun 2026 21:07:13 +0530
Message-ID: <20260611153713.3173328-1-pankaj.gupta@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0098.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::18) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PA2PR04MB10333:EE_
X-MS-Office365-Filtering-Correlation-Id: 20376212-91f8-43e5-968e-08dec7a29d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	54rQ1PBKVy3+ENvVyncSztfjYfh1G2vlwOr4L7SzU2Sy0kVHYVksvLBduIU8W+b4ReXxky55KmOweLFDKlRQNdXXNe/QN/KoKo3sJUW8JxuMwL8xICX2lMrbBB9oSsEOO35agF9CRXdkTNXqiaIpfXdEjks1U00PDmAfyGwqHTLXOndNg/KRkCdLjk36BYS4RNHbs9xT25tLRs3sCo0azorqmfn8RBEPzDiaCrLAaPBtz6XlypLaN+YTYFrWjFDcpi3coRRE4PxMf/PiROPc6a5KnhH3DfqosJj4mTkqBr8dl3fIj4kX0v+ALRdHiG0aff9uhCSca6QN94yItxqTtj11OnvDdgjWFF3cTEnIklKHo27FTVnCa41iYqmM/jq4cNfoupS8ga0fJyqTNSWoOylgcVJaChAb0s910QBgI0bYwXyU8VShgh8w4xuTUmCgSCp1ZQC4zOsjTqrN9qXOQYynN8ByuCuCx4QaI15wFTI8tfYqUAYc782/Qm8EwHgZgziK9BTwUOdKrAWiYdJrk2wLidY87kzoudDe4N6G1lg15PaNMmsCpQelDDaXaniySvt9KH6LdTCGdTCkCq6U2L+RTTFFDfn8/ALD/ZIqnwNwbynaE1rrCvoDTzJwl7P7vAhOZ30fX/YW4iokbPJN/3Jv6smph+JlSNvUpZVhEB38tKoEdTwoyEQJgHIdzoks+XygbQEyyW7dmhVcTgObRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m2eYD8f00NCz2JalJ1EAic8xD/+f/qf3UbtHVXVQnSDT/3GGSrtYteoVTqki?=
 =?us-ascii?Q?qSuTjhjwpYmpWiNUyRBlaiGWkvGdv5bbAYKaXugl3JhU11xNf6CELI5pFSGD?=
 =?us-ascii?Q?lMhYYPvCKwLPOZa7GcDBMbsXo4bbaC4rKv38Bp1wC8Q7NVL9LtbAP82b8inM?=
 =?us-ascii?Q?FRZtPcnDQUe4fUEevRezdvIbl6lOa7uCs9C7Bi9Rqf0RodmPjeuaPG31xFEB?=
 =?us-ascii?Q?OkLgBAUIeJkeVKiWGrlaipNE+FpgbLSiif6awSuucHu3VA6NOwvr9KR+bxRO?=
 =?us-ascii?Q?AxOB2q8QgXd9qljLTBSdXRQfdFBR5HNaemYrDvYCOMkAA0bHQ0BsEh/JWM3d?=
 =?us-ascii?Q?m3PQ7ZtPRYnilKYxclv9DY5un5BhwLc9xPSdH7xBCK0c4gc7B/vcNcH34YQO?=
 =?us-ascii?Q?qjACTcIBVHYVJoS65xn1fVfc3MNkT++LGGHts4CnGT2r7KqgZtU/pQdWHFAq?=
 =?us-ascii?Q?khUZBMKBorsmgQVp+UN2tn1o7xPr6rVp86ftRX5e323t5cJArk0OSQYadWtS?=
 =?us-ascii?Q?/5v/mjCly1LwvnAO1OtQQ+d38+YVkl81Yxd/tsRxZTlfil30tHmvg6Vn/OTe?=
 =?us-ascii?Q?wOS/jmc4ON14CfsTJLPOladUfpc+esP2FFEf53QK4SxjUHyAvjxFRwqN2oi4?=
 =?us-ascii?Q?a2a2MqWa+f2GmHK54GRH2lchQlIMgoFm/aW2mQBuilKtEV8GYqAMLxzF9WIQ?=
 =?us-ascii?Q?42zsqBH6E/gLNu1JrBmkxo7UB4+sUeCOEwZA3g7ReeSbP1fZGxWURuwHliWi?=
 =?us-ascii?Q?cic2IdNjoLrGHAWY9f6gFzZ2tnrEgXRPZXXiXRHewpJDczPGfkFaGEHY0qQM?=
 =?us-ascii?Q?99KgUazlHYO64UJ9ipG3jQlk+4i/tMBe6/W9ky0TGPch+MZE5PGikPDWFx4v?=
 =?us-ascii?Q?EzDAR5i8rtRYAxD8YaUN4MehfP0S98FKRmJiKBGu+DwBTNxsLP0A5TlWIEA1?=
 =?us-ascii?Q?wevWjNuFtLacd1luA/USRW9kjkwYj1m82yJHDuy1CvLinBdTSPAYJJj6zcAB?=
 =?us-ascii?Q?ck0IhaaXMJ7imibHH4jnXPQavslMVdrd2RWJSzTzBd9ads8YeuBY85cPFiW9?=
 =?us-ascii?Q?+cPU6NyU0jhIRjQNrjfA2GPbWHaYrtm+BLUIhvn1R6xd2C8uD0ThauzqjYPZ?=
 =?us-ascii?Q?ynWG6qimLT8QHqyvjfG0L9giOwwUuu2dPr5s4FOujtQkbs8wzG3TQq27zNAf?=
 =?us-ascii?Q?kNqrQmrWa+Vu0WijCA9/WKh2UaQjiH24Vz/wgKH82zbgmWLlknsws7eE6RUv?=
 =?us-ascii?Q?KXX+s07cgJD/k/FAcBKbGRgAZA2UnXOSiF1jLao7Nskes0heTyrwVJ6Oxfut?=
 =?us-ascii?Q?LGexxlvH52iaoBqfn+le653Ke+zWxCsPXvJKWhoDfvAyNpnQBy5njRQlplB3?=
 =?us-ascii?Q?SEcMpe7RZNTfbNYoIc0Uw3Q8LjUO+K6yS+rr2f3LGzDJWbVS+o7vcKcnqYpb?=
 =?us-ascii?Q?AsLo99ztGKSVT1tOjDnqDH+7od0HYwAXQA0SuzVcUt4aQ7QYqtJerr2eb29M?=
 =?us-ascii?Q?3bpPGoEdJuA+lsNrwNdG0nPxU4XxWe2PS7+zFdJ2DHMo/P3jcmDaD0RuGYib?=
 =?us-ascii?Q?9Ix/8xKFS1FXW+prvdx6qzN9Gx4tS/p1cH2bogHpvD0jUlifn19QY3tTM8M9?=
 =?us-ascii?Q?WJyVmoQVc1Q3+2Rq+cdumS3TtCvtAUEfgviU5Pj4Z9rxjbAXU9MMSU5tEj05?=
 =?us-ascii?Q?UdRUpT8HYcefAn8TKPfSx15s9WJGI7wmcyMXVlJ3AoWeH/LB/XINFWU1U4g8?=
 =?us-ascii?Q?BVd9p6ZTfUzuC86Vv31xqrCu8NesH/i6lZgkSIoP2eIfHV/0foyO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20376212-91f8-43e5-968e-08dec7a29d57
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 10:17:17.4936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HrHBl+c43F6zNw+fSCSU53ksXZqXH/a8PTrgFoYkMNEfttskNMGRQP78s4fwsSwaZ9zicqjYhGIeYqS9yOFxAqN251jju7r6xuV7kxtEJGDPmsVtKXBwNSv+Pb+fdD4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10333

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The EdgeLock Enclave driver uses mailbox core APIs such as
mbox_request_channel_byname(), mbox_free_channel(), and
mbox_send_message(). The current Kconfig allows the driver to be built
with COMPILE_TEST even when MAILBOX is disabled, which leads to linker
failures from unresolved mailbox symbols.

Require MAILBOX explicitly so COMPILE_TEST builds still include the
mailbox core when this driver is selected.

Fixes: 0f604ef3b907 ("firmware: imx: add driver for NXP EdgeLock Enclave")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605270101.2FFpzoFg-lkp@intel.com/
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index c027d0fa4530..e3cb7f965e70 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -58,7 +58,7 @@ config IMX_SCMI_MISC_DRV
 
 config IMX_SEC_ENCLAVE
 	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driver."
-	depends on IMX_MBOX && ((ARCH_MXC && ARM64) || COMPILE_TEST)
+	depends on MAILBOX && ((IMX_MBOX && ARCH_MXC && ARM64) || COMPILE_TEST)
 	select FW_LOADER
 	default m if ARCH_MXC
 
-- 
2.43.0

