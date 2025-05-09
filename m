Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2067.outbound.protection.outlook.com [40.107.241.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960CB26C389
	for <imx@lists.linux.dev>; Fri,  9 May 2025 06:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773028; cv=fail; b=iYoJJCKxmyMB3D99GfbF+ysl4oalhRni8Is9TI3inZ1nK9GuDC1DXtPj2bOBjtAwfKWyySZp7wAtTrAI26hpafVfsSrYXd8pwDe/VQ7qZOtm1plu8RrX0bP7Vbbb9JqfGCQyf2i2EGXHDFLo+1b3yP74ReVYk5zhJmkXZNhZFqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773028; c=relaxed/simple;
	bh=d3Ho8WpB66kdYR1qTQRN+41SeKzdId5hsn5rh9W5BPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lirSC/AysMtF0hrp+iSlkuU+kMLtrUbOSHxRHVDYPh584Xxx5aShpyNYUjEYnRmEXMbuCYOQcxkmS4YOFXM+dfzVZeLzCi18x8vonoNnoNFTn0A+aQorsqwBGmUs1gEsQIfeEnWI85vvg80/J24RyXQTKo6d5TMCS/C+MV7uTxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GWPV3u53; arc=fail smtp.client-ip=40.107.241.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GWPV3u53"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tci7cFSaNBvFvYjFCRzZESpP9VDwWDvEf1Iv4D5H0OQryjxgWIHjgeQWU26ljl5cZIU01xexpKjNsZke4jqLE1bTmRWRTPR5mqa0o3nuARMhmNM1izU15AvSy36/0MHq+1LdLcY+cGSA0f9DsZKD64pSuDc0v6gTj3cRLrdbD5eFrhLhOu9dvHN2bxuUYrVSg4rmg6njFd6kQb3mFYzE4GYedXcpfL8W+qWfrPfT93GAkZ82Mnn+sptWDXr0kOS2dpsPgIr7MfcEU2zdVRESzw45QK3YjTubMwAnknYFuyLc3S+ltxqfU5KLceqLUs9UKXtjXmIk8uqACLyTyYDWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKbv3WWiu8QkRuvWqYWi9ZdWE7iXDCgSxnaZVH/eY2s=;
 b=gSvh69ADBNVOzootbaa1/Sn43qX8Nz76EP3UJ/DrX0amcKckUBK92HlTXeU2wYaauUMEKHVbeHa8PICHv53IE03j4pdme8eLzczd3RFnRpd+P7+A233rb7TwdX0ljVaytK4inHXqYERJmSNa2AxrViZ8/PbXymY/fsptt55s39bgoPjsQd+cWLInXQ2cRN56uYUib0/dzcffJuVPVJlXxJ9Kp6nyvtuCFfvT0VdFB3N7z1eRvPtFAUO7P8sW77n4RuCYpm8lqgTq01SjREyHbDZYlAklbBHyI/L/EvzCMtav84hOVdnksaVXoYcFs3UuWMViCV3cc5FlQs3rP//3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKbv3WWiu8QkRuvWqYWi9ZdWE7iXDCgSxnaZVH/eY2s=;
 b=GWPV3u53MEAlTGzqMwbqNlZfAygJKJ0disjWczE9zzhBnwkGDm2JHLZTirJOeUS8nvxnm5mxa3k7gLasmCTFmeih38oyFIEVH2ij3xcfC9H+SzC0vhKf5GFTis1q5+RETUM6vQFn51ZIvvhewZfaOUL20ttZKw748IS1J1o3sRbc7WaSUA4yfhxr02XNlHMJ1cg4wQmX9RrLcNjZBI/1D4WUMybbAEFRdN6CsQsApk9vRuhoYg3zOaBxjL65pQgtVIYopbHx47SVMQURYYNFYktGCFVMaW01wL4BNbcl2leO1mJ+MNQlpwaIshUpcrgIYMxgBg79UvVB5P+c9cqorw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7763.eurprd04.prod.outlook.com (2603:10a6:20b:246::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 06:43:42 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 06:43:42 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org
Cc: swboyd@chromium.org,
	heikki.krogerus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 4/4] extcon: ptn5150: Support USB role switch via connector fwnode
Date: Fri,  9 May 2025 14:45:26 +0800
Message-Id: <20250509064526.3767729-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509064526.3767729-1-xu.yang_2@nxp.com>
References: <20250509064526.3767729-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: a86f8bfc-ec99-4cd7-643e-08dd8ec4d6c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M9l9B9M3UtbjVuxvD8AhkLA8TixTJJlPg2azp37hA+TOhns1ZcCRubd/Y/sP?=
 =?us-ascii?Q?jnvjkPKnFxgXDxq30zkb3yet20UORcMRQ3ftg0EzAMUjSYWoKxTpWuNmYirH?=
 =?us-ascii?Q?bSR+mjeBV8iOSmyMRXZh20l91/3ipYDpQrCtWXTIdQH4kZdPcwHKvFFdoszg?=
 =?us-ascii?Q?zER4xYpaji9YnWbuCUyTTtOZEaoAv6YuPTODW+CE3j3Orud28zy5ij/Y8Wrm?=
 =?us-ascii?Q?hEKPV7dxt8591FvaxA6HQWttBAYryjVWLqFz58Jc0NYh+Zwv3Sv5WM9B2YkC?=
 =?us-ascii?Q?HglbTqaaFpM7whYhSY+A/B25Eoci/FhBgHkwQLcrCaMPM0jymmM/uk3dBJqA?=
 =?us-ascii?Q?EVZp6BEC3+wwlrttvEC6KFCxUcxMRlxPjz0vsqVbepHV+QLu33guWApBQSWn?=
 =?us-ascii?Q?r0T/DtqEp0qxTpDRVA1JihFAkqW9OGtvAEmTPhPrY5rXoCzvIxOPMAeLa/DJ?=
 =?us-ascii?Q?Uh9WKHQhzbsHELPieIslwM1WiEO+qiYfSttZxAgbSdZpgt4GcxUvFNNF1oG6?=
 =?us-ascii?Q?hyQdqPnP8Tu7YJDkkIC9TA/4o1LbD6uHOVQ1WdioeKixsPsSIzW7udQxnGp4?=
 =?us-ascii?Q?c594WOwhrVZN3yHAzV4MiwETlKk3rDnZtwDINK5kbT6a3mmLt4+n+JBJyAST?=
 =?us-ascii?Q?Nk0GOINWdskCy1glvitgCOk7AL2jYXNd4t0dzNy0FKtm7TpMVoWy7sGNIezy?=
 =?us-ascii?Q?Pld4fIEYz+W37FCFpXirC5EW7R0jh03QQdj6QxJSMA9/cJkqVkkyIKpCUr7o?=
 =?us-ascii?Q?SBqCAoRwi59co+JCSKEZppYM2n8ywbbh1jNO/M06s/ia0tQzKiCAw9jwxueR?=
 =?us-ascii?Q?TzGXi7xu8giEL/xfHSnLZ5Pp0DTCcBjosXll0TnEyuI7wuiuoFAtgzApyaPc?=
 =?us-ascii?Q?8Su4ZJQm6CWBrgKcfIGq5Gigxn51mjS4UdJuqLxJ8SJkw5rX/Ubq4jK1cwcV?=
 =?us-ascii?Q?StKhmTWIGHcW1uWGiTjnYYoTTp7hShpYvgdmKFQQWcsjHJpjHDtY/+0lvPxS?=
 =?us-ascii?Q?0bgLtC73pG09PTuStfW6aUNV1G2m6J8Lyu6OGwKwlrTdkeSD2NgMR9AYoVv4?=
 =?us-ascii?Q?L4fhWPy1VScwtk3E//LdWFr1uBzaq7KUfyFCzCaBDR9BjCDLUGdBBbxH+3Eq?=
 =?us-ascii?Q?xOCy70P10H/2b2uFFOVivdP2MDTThYpQ+ZBvkywAza6aARXRaoOCnmAQOw6V?=
 =?us-ascii?Q?UOFgmfzF2LxXuMcOxFBe1W22N6xRTrO4dGeZvEbyhVo0+pifY0Ry1nBJoc12?=
 =?us-ascii?Q?MJUnsUdExc7HHQfN2MrTNo8iCUi3Hrf4gjwGMN9R0W/2dXGHtZ180h71EQxr?=
 =?us-ascii?Q?AUwYlI2P9nHvKn0jLFaUpUgOY4szHVQno+wr7JquHUKOedR2NfCen08xDlCU?=
 =?us-ascii?Q?Q+dta3kJA45rSbQNqrK/QuXR/P0mQ1aJw95OVSLfeiwAi13IcmfQ3EEalPLa?=
 =?us-ascii?Q?YQI6V3vrat2g/n/EjjV+NjSooAymXEjhlA1jCLBqsyT+sVOa6pBMLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j5LRS9IXxG58ZbbUdUz4sfle9OHv+6+NzAuB9zxfZ7mX3rFAa01YHqeBNsT6?=
 =?us-ascii?Q?Oqzn6suHiMhVXhAVUvktFxT/4P/F+gvJugfLT12ioVwyPAloq3uO5jANw+p4?=
 =?us-ascii?Q?lYwNkoif54tAhY8cNrddXHpQlqejyn9wrju2Qg6oxHeUL5zhX5a5TMZggl93?=
 =?us-ascii?Q?lYrdK0sezyvQrqNS6zgrcMCSRwOWHEw6jE4wqBa5BDrFofl/qyvvk51mdtFE?=
 =?us-ascii?Q?R+Axtsrz32JE7A5ZWKjVQdwL6DXSF0PHqeBUx9q848zq6aKNGwxcY9QTn0f9?=
 =?us-ascii?Q?yTedjsWBL3tEJfFqpLZPRNRgBXCjNG0+1NAWeGJD8tkPgXT8zodwH9v9gkQN?=
 =?us-ascii?Q?ivcsU4M0cM3S0B5d04qDRdF6NBJLW1tzQMovlx347mRsuPZrGZr13h7zeSNN?=
 =?us-ascii?Q?1niCGTuhnvD1EFzbkoTATBSHZRPlelAmit95fSYOy8i60wm+HLTA6PWphTjy?=
 =?us-ascii?Q?9xyQq2rnROpEFoVyi/MWPWdCdtPH55Yk3q6/Q3VhxdQHg+EKpRyVsJmCKd4+?=
 =?us-ascii?Q?fPoE7Khw8maCvgEIX96WY05VZk8duwNo/1yriQy2GvSFQZHft7h+FXTk70Gh?=
 =?us-ascii?Q?iHH7nJSakS1k3rCZvp+OCHWnPodcoM1Cw6tckA25cqCrIHxgyCTrqSlJK+ge?=
 =?us-ascii?Q?zCkRHQzgrYGKfLPTeiDPPH4+c6YWYib4jddhgUZ1w1sFp8ajJvXiGUjjpZOZ?=
 =?us-ascii?Q?CrHAq4Jq4KW9jLwt+fjH0qQhYjGtJ0QaKXU8pI8b93kAdZLd2IJB8JDFFIhk?=
 =?us-ascii?Q?DHrTfF3oBXDMSaO1rpLu759HrDPH1fHAN8GlJiLSa9xVsXpV+3qV8WHDGF2i?=
 =?us-ascii?Q?zE2WbLB4dgnAxD/JJl0cUsSuTKsQGrmw0R5BC8Qy29fAbyN32IYS0JLmdPxo?=
 =?us-ascii?Q?mWdIU1SSlnBKrjqYt5tiTj8tq23hptzQVw/vD6LGEOdWQGX0SN19B0hSG7gd?=
 =?us-ascii?Q?U3rf4ersEJRhGbyC3fzfgDI/i8Ht0mX2frOgK7Jev7CvKYBEhxtn/DoTQOZ3?=
 =?us-ascii?Q?OjTarISaijldW0GyN1QP888wsSbVfoSQfdvU5LB48WlE0lu+abL9aml5ANxY?=
 =?us-ascii?Q?o4KobTl6vsOWc3NP61N4OWw8eIKDPbEXbAiEZ6YU1e5g+sTEfh4vRD3r7Eoa?=
 =?us-ascii?Q?dupKqsrSrpPDtI/TP6gAP3ZGOGezjNkIxsJ9a4N4zCKJNspyVmy+/20NP56K?=
 =?us-ascii?Q?1w18dkaN9sVK4vIvoX7n6sGd21ZzjFpXd7SQp2jHH8LaG5mKOlTdPxHdFmq4?=
 =?us-ascii?Q?PMkiLhFH7+GdfJimvZhzpYKgzcGaukURO0hiaPhm9MuiQNUVy0Ry0o7zDwPK?=
 =?us-ascii?Q?Q6ZrQjfnkH5egaDYVxA+aps2jLtn00T8RykwrlgH8w4lVbeuI44NpevZOumY?=
 =?us-ascii?Q?zDxsEKMISlYHhR9DKtiqOv7LmbMNIF7NX741O2Rb/G6pyci5udGRxyrnCB0P?=
 =?us-ascii?Q?9Qd4LEtfNEwDUh/cSM8fnx2CYwNQXjfWr8ZkmDQbJj0gfGMyDuD8hklIoqd0?=
 =?us-ascii?Q?2jkcOC8Lp4Y4/aHk7lFEYIAKWYjzIbfsASCyEOYL5BuJY8e3Ut3k952faR31?=
 =?us-ascii?Q?+zsve91rqV+qJeIpzmqy4lent2i6zHbMyKTscnO0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86f8bfc-ec99-4cd7-643e-08dd8ec4d6c2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 06:43:42.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: En7dC1ZyeSDHzNQH35efCioIswg/s06r7zLoRCXB9ZdZYGaOWe6dfTSJh1AoDW8E/owz2MlEv67uz4JfOwnmfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7763

Since the PTN5150 is a Type-C chip, it's common to describe related
properties under the connector node. To align with this, the port
node will be located under the connector node in the future.

To support this layout, retrieve the USB role switch using the
connector's fwnode. For compatibility with existing device trees,
keep the usb_role_switch_get() function.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - no changes
Changes in v2:
 - improve commit message
---
 drivers/extcon/extcon-ptn5150.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
index 768428d306ce..f33f80e103c2 100644
--- a/drivers/extcon/extcon-ptn5150.c
+++ b/drivers/extcon/extcon-ptn5150.c
@@ -352,6 +352,8 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 	}
 
 	info->role_sw = usb_role_switch_get(info->dev);
+	if (!info->role_sw && connector)
+		info->role_sw = fwnode_usb_role_switch_get(connector);
 	if (IS_ERR(info->role_sw))
 		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
 				     "failed to get role switch\n");
-- 
2.34.1

