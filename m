Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C069F14D6E0
	for <imx@lists.linux.dev>; Wed, 26 Jun 2024 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719433554; cv=fail; b=CPWrH0oWi9xADLhBylBrtzrvlRjN9fOQ9CdW93LQcRnsOdcJM1AEMVOvtOmDMOfhMFyZU6V5OLpWnuxrPepyUznrI/l7R0Pxz2b2tcwPdy+RlCFxhli0up0Ui+KwywtdugR2S7LeSbrJ/T9eM26qrMWo09xeLEToUSBeyb2LYSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719433554; c=relaxed/simple;
	bh=7vw1fDQuLMjpVY5u/eA7wRoq/i5GIlJ8PWBDbwfN+zU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=E0NvPLjOTAKs3xJxAaVpHeGCMEO5U3cxl1gs9sd6Y/aX1nvZXGeAXM2SskQfKzqJHe4R0fNIGosc4/yqy6miL+L2Z1AcpQTv+rXNrp4Vagvyf7SS/YBpU6TAuO9misMwoGzRgGljs1QgvELPWajVy4yZc1aw+1hRMehrjr66u40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=bTZPnyuH; arc=fail smtp.client-ip=40.107.22.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="bTZPnyuH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j597yJ4Abw8r1MncbVf9pAWroc5i3J95e7xbyYMGYvCWKaqKYoOzG+JKjaqD58PAXRmt1BLkcwWH32w7gEFvPJYzxqZX0ISt/Hd0YkH0N1MAYTyYsfsSSIoPxnPkR4GA/vG9JCWdh7YrG4ymOsXXyEoQbT+S5Z+IymIG1c03sdpqbGNae6KRZbmSnQZVyrp6PZoMGHDjxzDhk1pssoi8IFjjaOUtqQi+yVWm5/luxNMhDSBDyTAU5T59OD+jO3PMoDU0IPOqYxx1P2IseQb6WiuBY5xhZW1yPWBPFU4v5DFhFnC9/Hqq0nXHjKsgkhVLQnTiJq5tq3ELc2YtjpuOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vKVg0WGFlrUhau0rluxQqabf91OBRZdHdSX6r0MQO8=;
 b=hrdrLhSGhLmmMKU2iIX1lF8cENUcNMMSoU30/VcIo1i0/SBBAuh4bKUAa86ZAKqf7YnxlYYWCPr4pTuwdDAA+Ndk58LBeJR8b8Tv2JQU1Xw2Zkf7/ZiSTgawrG9KSPlEIxtD3khFS4oBeFA2bReiInIgg1h6eNePGo2RSGdC/SOQT4VFl8x2csN+g9Ys/uj69hwtvVanmbYA0vRc3s3TxftKUs1N3u7z/JZ5qjOPgdUuNzmMSFtDbmI7y2yKIpedO4qjqaI6Q82yT5CqTY7I8yDuiAqPmNtKGUZoeHeTA0OpsAqLKwhpjMFWCR7kROIip2GJLsjeMjRi8P5h5JGX2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vKVg0WGFlrUhau0rluxQqabf91OBRZdHdSX6r0MQO8=;
 b=bTZPnyuHS5DBgnbc4fm7lyzefgcHpqO+7gmaq+sv2NzXRmf/N/ny29ypGBNJpb0+YF8qla7kKTFkG0GV9xuUMQgfLP+oMkaXAJ78F9Sgk8RksYxdhxN5RSouXIOFRe8jRr2HsBK2JgvrZTlLRLRfrankZFZ1GRbSoOEs+5sPgEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB8012.eurprd04.prod.outlook.com (2603:10a6:10:1e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 20:25:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 20:25:49 +0000
From: Frank Li <Frank.Li@nxp.com>
To:
Cc: imx@lists.linux.dev
Subject: [PATCH v2 00/13] arm64: dts: layerscaple: clean up some simple CHECK_WARNING
Date: Wed, 26 Jun 2024 16:25:20 -0400
Message-Id: <20240626202533.2182846-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: d470aab9-2f0e-442a-edae-08dc961e2b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|376012|1800799022|52116012|366014|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?09yBPyq3TuYJbL4ELBKenFTz+0xvn7Nt8cNvOCGSyYyZr3utMyGkV9XwnRJa?=
 =?us-ascii?Q?rlA11T5pzG2nSUJR3G7MgsUJT08iA26fe8Mq033o/TIL6I/Z3humfYhpHhBo?=
 =?us-ascii?Q?UcFMzF1kVBZIZqjYTWjITruIKUoVUnpc5f9DWRZwzce9gv0A2+kQRbu/G+Bg?=
 =?us-ascii?Q?M1z8Ag2uc2Wk5g8/cTeZXP2pMYpxzwI+6oNf9f6fUJpJvuCpTdUgcp5KSZrD?=
 =?us-ascii?Q?mx9d9dcl24TiWNUAQDanpI8ienC2SotDyflGb+fsGe9VmtAKbdJ8r9kRF2it?=
 =?us-ascii?Q?vWX3P6sn6mqhr3Xq+6LJPlY1Z2DnJETUdPyU3FTs3eEO6ZTkC9/mGEpCH2AR?=
 =?us-ascii?Q?LYGYiuAEZHhd5JQh/jj0gfpjWZpyE7N4lk+T4+6Oine8OxQFaN+Fw++cA1eq?=
 =?us-ascii?Q?+sy/Dw5wgJvSmNjLz16iaPGievQYKlWevgsFbB71I26+UnrISZa7SB9EHak1?=
 =?us-ascii?Q?fqznBVPTQNZvKxtEBvv8N+GHjBsuD+ypDPdUVZ2xFM4KDd3+6TIoDer4QvUn?=
 =?us-ascii?Q?I6ggCn51gDtvdRDroX7RZgWAuHJqrqx79D1eKHIrJw0hZLgdnPpaAADN/9Ik?=
 =?us-ascii?Q?euOsYfwao8dpt594COvF2lOIPiCssKbjgh3tQIh6G5v7oUgC8dqfKKe+yfzN?=
 =?us-ascii?Q?9bp2dCfWIq/lIcLQH91yQmxFRv5WbbYLaWCdNL2HN2JAfvBIOZYETvnhl/dG?=
 =?us-ascii?Q?x26PTl4Sa6+KwfZxjTTqvFljdgG+lYIrAISyxEZWuE/+Csyxe6WTn9Q3t3Fj?=
 =?us-ascii?Q?E/n+qqNcYF0OkdzwVTlKM8OrlVh42jtH0G+dOM5NOgmcS17IMNGe4pQLcPzy?=
 =?us-ascii?Q?3oci4D0PufuDaE0UsbNEKvCKFbCTwNd9yQxtW6JTKgGdZDLk/fteqIRSPc+r?=
 =?us-ascii?Q?eXXcOdoikXo2P1CvXAh8G2TCPdeB728qC4K44jbg2NEoMg86E7ML1HXy1Chs?=
 =?us-ascii?Q?8PMBm9ekGlD/ZrggCR3rabLR9lhWO1tcSw6jrgJ15q2DsgbSAaHisbx+PoTK?=
 =?us-ascii?Q?jxGa5TeYHbbrETi2RLLIn+K+dsyqASl+tsoNCcZpgYTvDXQyKhwxb9TsX+vU?=
 =?us-ascii?Q?VzKr5e/9eZZJRdJepieX1E6gTxQVbXFmfjwEIydEn0T/SErQF/NE+3BOgXI4?=
 =?us-ascii?Q?69X2QL/f7n4dPPPKOmB9kbPTXleI1VzCEfc0Nz200BkajVIHOV6vRhCqcdHV?=
 =?us-ascii?Q?fi7FHHyYPvbeZvVlAif4u2R19n2tX5JfLFMn0cw3EPRIKiVaY+FqUq1yflwJ?=
 =?us-ascii?Q?MBUPLogP2u6byOHCQn3ANZ5ODN05nHy2eQWEDITJD/fxTHMRGzhcoMgg42m4?=
 =?us-ascii?Q?rBGpz5qN9PHWU3L0lPhP/xJ32tevIla7mQTIIO4fNXvQKuqTtQaZGyAkcrPT?=
 =?us-ascii?Q?6db0GCE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(376012)(1800799022)(52116012)(366014)(38350700012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B/vRvl5v4dalFqreNu7lwmrjZep+QqGfzGfQgVrQri+qL8/OX6A8vgEDWVRm?=
 =?us-ascii?Q?eiXfE8weOzLxEcXAxL5xBumqZKQXbtiMJ2E/0V2zAcb7utiGblpNknx1Kg32?=
 =?us-ascii?Q?sTYf/o9WmYOjt6HtXODuSuViI9SZnUejMw4cuNd09bTbj3ILlxA1a/WgHtzD?=
 =?us-ascii?Q?eRvvw5kzGUwUprRHCBA26vEDsIp3byJGTA/m2ixATgy2xlv3JlbfCOplpLhM?=
 =?us-ascii?Q?FB7MHJqKmulHAj31SfLNYfVGQWAh36GWyqhH4/lAKLWd2FyvWigaInrBXi+B?=
 =?us-ascii?Q?H/O0EG5Vxft2yJTx7xYMdUG5pmWF0jwNdVV2JGsFmWfaJ8puqAHRlbSmq5/2?=
 =?us-ascii?Q?u554nZLoY1ndnkOD78RjmbcDva4Ob0Cws1sWOU/D0+g+ZOzCPmUt40YJJ62n?=
 =?us-ascii?Q?TuIMpDUpqIA9D5++0OdpoTbhWd5KaoYuqceeWmaxraWZRmc75dUMT7Nk7uFq?=
 =?us-ascii?Q?iNnk6RXsygnh8sS5mzlY7CbOX82cQXZjZ0gbSewjJ+rw2EhGczdAuRsOJi0G?=
 =?us-ascii?Q?weD5qtpE3vMI5C4gbZZlIazJfXRJnQd0Skm83cMnP+NKOETjpufnAbAELkZ5?=
 =?us-ascii?Q?oqDL0klI1PmzkjLhWVxZl4RYfvA9G3sWa64t45R3EkorW/hTFE80BK8/MIQX?=
 =?us-ascii?Q?V+xY7RHYJ6c2tTNbCyH+rY+oi/Vy0Hx3OiXtVZ4olQgXtBluKSSNXu5SimlX?=
 =?us-ascii?Q?B0jveXyvGWxkv1xWS/3cqCnfE7W7K0Wztgmzx/gb2HL2Y4mgC5CKhSocCtzG?=
 =?us-ascii?Q?2KrnVUSG3Z4MXjCC0c8Tvt5AoIRXW7Y/Se/ROQJN3f2m42mpWhK24vDlbXyX?=
 =?us-ascii?Q?NMCSq/d75XM6pAQOgAQfM2x7Pk3zWUFasSsdy6hJA08cYROjpXwkkv4ZsWeW?=
 =?us-ascii?Q?e4WPMioGfrL0P4aw7kqvYr33WPtinJsb5YmpW70a25eD79WdJNIf3TgUPV/y?=
 =?us-ascii?Q?IWlUzqY5w+hPutN143YmNgVjWkWoxFsWp6H4xeJGLXHI6oIltdY9gwb5b8tL?=
 =?us-ascii?Q?rd6DlzUFKp4RIUXKswjCqwX4vzB/zF6snqJEFiVxKM7fTv6y9BNSQPO99oDx?=
 =?us-ascii?Q?9/Yl+N4IFcMDJLSvmAkk/4z8L5KntLL9DsnugpjV4/ufcDROHWxlhO5wrAtz?=
 =?us-ascii?Q?yBwbNcw2riivgnCQ/M1dKaIai/3vIcKN0OXy806ER9Boy+FznaOtjIqFi6R+?=
 =?us-ascii?Q?G/ifb+P4KN7+P4ujLcb4JNUb3J/mx/IOyjHmDJyY+QfpK5ZzBMsARnriOO0v?=
 =?us-ascii?Q?ikfY526vOjZHrsc2jiCYb47OFd2sCx7NLxlBJlgQU/gB6c2WNA8jkXEhyb7r?=
 =?us-ascii?Q?tIGT8IXohR5MvsDLKqL83oMjIErEP2ujbduzfof99VzT7cN53kxWxqSW32UE?=
 =?us-ascii?Q?FeP2O22S1T4qwsu4O3XwIJJOCtyC0jbyitgAruyKl62a5xgCisuFp+9fcREE?=
 =?us-ascii?Q?GgQNI833wk6snTVwoias4zNsCjJtMYjiXvnyduZ/oTWhDptM8P5wigbOl6wV?=
 =?us-ascii?Q?7oPVuzjnqxBW50fGFR3g1bRUdtChpk36c8ipojhALjD1Pge+Zbg9MOthQR0t?=
 =?us-ascii?Q?ZmnL8C/Ue4TosuYIlgcOj0vu9x3bwXWhjoQ0sVC/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d470aab9-2f0e-442a-edae-08dc961e2b06
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 20:25:49.6481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfJowOu4UoDQk+EZFauB9kgWTKznPKtni3Y/RSqBAtUoBTcLVmtpCNXU21MWlv3QKMuDFL+5lcz9QeNLEQ5QzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8012

Change from v1 to v2
- Combine some similar warning to one patch for difference ls chipes.
- Remove arm64: dts: layerscape: add '#power-control-cells' for rcpm
rcpm actually not power-controller, it is wakeup controller, need
better method to fix warning
- Add aux-bus fix
- Add pcie irq order fix
- Add rename to rtc fix
- Add thermal-node name fix
- Add q(b)man-portals node name fix

Frank Li (13):
  arm64: dts: layerscape: rename node 'timer' as 'rtc'
  arm64: dts: layerscape: add platform special compatible string for
    gpio
  arm64: dts: fsl-lx2160a: fix #address-cells for pinctrl-single
  arm64: dts: fsl-ls1012a: remove property 'snps,host-vbus-glitches'
  arm64: dts: layerscape: replace node name 'nor' with 'flash'
  arm64: dts: layerscape: remove compatible string 'fsl,fman-xmdio' for
    fman3
  arm64: dts: layerscaple: add #dma-cells for qdma
  arm64: dts: layerscape: rename node name "wdt" to "watchdog"
  arm64: dts: layerscape: change pcie interrupt order
  arm64: dts: layerscape: rename aux_bus to aux-bus
  arm64: dts: fsl-ls1043a: remove unused clk-name at watchdog node
  arm64: dts: fsl-ls1046a: rename thermal node name
  arm64: dts: layerscape: rename b(q)man-portals to b(q)man-portals-bus

 .../arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 13 +++---
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  5 ++-
 .../boot/dts/freescale/fsl-ls1043a-qds.dts    |  2 +-
 .../boot/dts/freescale/fsl-ls1043a-rdb.dts    |  2 +-
 .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 10 ++---
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  2 +-
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 45 ++++++++++---------
 .../boot/dts/freescale/fsl-ls1088a-qds.dts    |  2 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 18 ++++----
 .../boot/dts/freescale/fsl-ls208xa-qds.dtsi   |  2 +-
 .../boot/dts/freescale/fsl-ls208xa-rdb.dtsi   |  2 +-
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 18 ++++----
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 14 +++---
 .../dts/freescale/qoriq-fman3-0-10g-0.dtsi    |  2 +-
 .../dts/freescale/qoriq-fman3-0-10g-1.dtsi    |  2 +-
 .../dts/freescale/qoriq-fman3-0-1g-0.dtsi     |  2 +-
 .../dts/freescale/qoriq-fman3-0-1g-1.dtsi     |  2 +-
 .../dts/freescale/qoriq-fman3-0-1g-2.dtsi     |  2 +-
 .../dts/freescale/qoriq-fman3-0-1g-3.dtsi     |  2 +-
 .../dts/freescale/qoriq-fman3-0-1g-4.dtsi     |  2 +-
 .../dts/freescale/qoriq-fman3-0-1g-5.dtsi     |  2 +-
 .../boot/dts/freescale/qoriq-fman3-0.dtsi     |  4 +-
 22 files changed, 78 insertions(+), 77 deletions(-)

-- 
2.34.1

