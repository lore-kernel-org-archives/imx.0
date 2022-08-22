Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8E34A02
	for <imx@lists.linux.dev>; Mon, 22 Aug 2022 17:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr8y/VWQaHV/DSWUxQJXz0yVAzW4cAsuZGH0oCsYfaNTDgxkDlYdFHWQ4aqK/u0AmPtxSWPT+9OCdLJ86X81uVQtdZpe91ErLEsECY1QSDUJUhwvGlVeQUPKaEP4WTiDFgEj2Zn6lZ66EsEQ2R4BxM9QP5EwWyukQxKe5zylS04sMfE7hUHd2tyEbe58PFq4Ax0F1wxkCj36DdBTCGJjE/6LPSpHIddeZHDNQbFcuMEGIXplmxKEeA3ybmrcLV4sWf2cKYhkxMXLqH3Ma6+VsjR+AMRP6w4Hb1MPVkiIcSaJUI4vZR+lVKdM9v28HUJmsMg5I0vTy3hCnhZUgH6yuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHhiC5QsF+JzIhG6doRHhCQtHC9jdJD///6vKdKxEAs=;
 b=R3BjHW0ZYeuMHjPhKZFSVycjZCITZhcQvxqiqXfe7eHb876qR5UCfEjPi924hAKzm+ZM5U3rdNzs6aqSGnOyWI5re/jmPbpxPSpeW2PFSlq8a1/NOiPOcSJvtj7HE5Tk8yXuHOdeY+nRpzZnqTRd07kEtEWzKzHT2HKWtngcDU0QEHPUZsAQ9w2rq4Y4StExZoEykRPCx08vrNquG8/vK09y7kY7RJCKMUxjbe+/PFJoUze/yt21xWA64SJUIiYNJmsS8Lkl/2u2jAX3aJb0DMGm4DM9oqtB++RJpQH7v3CBC760WbeZHsBd+BO0/nEhGdHW1WFJUTMhkbxFpud/2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHhiC5QsF+JzIhG6doRHhCQtHC9jdJD///6vKdKxEAs=;
 b=Kqk8Xs6iCzWcWzJxJLwjXJPNPfp7wuGnCOVtpMtbNDOuXZ91RFnAPuzHkjyArOtB6GFc45rUG0F+J4ZHl7T44zrGvJb5twSOpnDAdysJ8rv3Yssi+XGEJQAfrJcOr40bD78NWn1+vm8Q7sWaHGpLSyXsRbKatJby2EYi6AZCpUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::23)
 by VI1PR0402MB3790.eurprd04.prod.outlook.com (2603:10a6:803:24::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 17:53:23 +0000
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca]) by AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca%4]) with mapi id 15.20.5546.024; Mon, 22 Aug 2022
 17:53:22 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/5] dt-bindings: firmware: add missing resource IDs for imx8dxl
Date: Mon, 22 Aug 2022 12:52:41 -0500
Message-Id: <20220822175245.222691-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822175245.222691-1-shenwei.wang@nxp.com>
References: <20220822175245.222691-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:74::47) To AM9PR04MB8274.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e8::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b43034c-b138-4fae-a5ff-08da846734a1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3790:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L9NwPp/R0O+uSzTVvWysprbj7Jgx+nOynhey6Oj67MO+BA0gfLur5CKznol1UrZ2UD/v1kpZesRK8X/mgYoPIrOrbkZDfOQxYacKIG5wxNW2dEehLZG4K5LF3dyUHA8r/LKo75sgj6SVk6Vi5Jq5m8jBM+81g98f3XszL/XcPNwcsQIsfaWknugRCEbMjOx3risB6EaIDMxdycYpTPidttYCVxYj5a1DrnNgZzA+0WJKXl7pw4LjZ8PMuuJo5wbt8i35C5DRXljidJR0h5FO0A4lOI0ouFNAKijYPO9P1rkPwYPzjPEOP0E3WImvNPGjyfzAO5vh6ZtyzNTZYYl6jcri046gjrhqiCPd5tKz8odwEMbPNXRcPtTA15ncF8/pkHaelqJjncfYgoQ2ZY88zolhT2Wvy0N75DZ8VH8PA4L+oZN91DBqyloBUCz9QaNVcrAoyZn9vSl2ScmuZTj8gPd3Ah9UWM+PqL4ccnJVRSOgSufs/Bj35Q2UKdCVsEv3ki2xld3Y6ynVlwe16RFzUdMdJwmfAdh7QP6f4WQKO/gvTicLnkvewTOGOZ2sJsjgSzxb9xflQ3ZEfmdkMlej2qsf3ZMBeR3fTOmnmZ/Hy/V/EZEMHLUpxAc+TV2xhwHSkmncDR4GCcoz2wl9cs8eV2JmZCJzBiOCKMqwIoXiRL0fEHTnrApcL+lM5u19i06kbaxwnHBtC/aBg0zcpnseoA2hIH2DLnZ6bSwLmjVBBGU80XX/2p95syLJ0E7sJylkTxwn2dFmb6Oeiw/GmCFo++8dNcTA80NstLvwLpS42rc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8274.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(36756003)(54906003)(2616005)(110136005)(186003)(1076003)(38100700002)(86362001)(38350700002)(6636002)(6486002)(316002)(4326008)(8676002)(41300700001)(66556008)(66476007)(66946007)(478600001)(2906002)(52116002)(55236004)(8936002)(26005)(6666004)(6506007)(44832011)(6512007)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RA+StlAVshA8bQF6WjgpT0F5Gw49kxCAeB4vE2b5lw8xOPFl6VA6paDUPHsz?=
 =?us-ascii?Q?hdWeXBNR4SgW0auHJYgC3F92qZYwspqZp4xI1wig2XDkFRX5kRYGf/uPR2KD?=
 =?us-ascii?Q?9Mzek8DmuxkdEhrndWrK949RVM6evhJ3ZdIhHagSREuYbOp7MYUxp9OhC5n6?=
 =?us-ascii?Q?kdWUDgNYChnIMO3qVg+IM9lHXK0geAMo2mdsiDeyFS6Rzv/i+ME7jJnuzBhh?=
 =?us-ascii?Q?WtGLtBtKNkCHuE1N8v3Wb0wzMXbEpqQxPhXRSjy7VY+YSe3BoPJo1iFNdJUU?=
 =?us-ascii?Q?GTSfu4z6jh8ZQ/LagOqr+J6jYgZJDu58fP4Pc88ckiMW+luC7wnI0o4VrMlY?=
 =?us-ascii?Q?1vSChTb0vrU/DU3L3tDqBQ68LU+5oSu9f2o6dEr8ci5Om4PJsNR4SFAUk1sK?=
 =?us-ascii?Q?+9AxwMX3oQ8RQun3zwUldPe3W5Bh+iS5kNBPc7LyX9X/d4A7/c1TetFe4NVz?=
 =?us-ascii?Q?IWMFTPJm0ECFOFDr7IsATkIm1dpdEkpdi67ncE4iVqQHeXC6CfyBrjhXz+0u?=
 =?us-ascii?Q?/XpSbvAj04J5/7QICifM6qpXoG2AYDHvLnxKifXVoXZN4nYGMRkqayjN0U2w?=
 =?us-ascii?Q?2saOYfVUP9UcPyDmwj23WYZEyB4pKGmSeRRE8zp0Q6JDpxeKxUcPCeZf9ODV?=
 =?us-ascii?Q?RZs6ls2gab6ph0GhWdzQNzJfKKU56SrX8cRZuZUGbBvOTH+yw/6cTiOVDMIa?=
 =?us-ascii?Q?CnYpD55IlRe4aIVHMLIy5zDUipvF9Qmi8IySj5yjLjE6UtsCnhsU8cfJdLeE?=
 =?us-ascii?Q?jM21qJ7yslr4WxEqx2/4mcdEdoZFQtqTLppK+rXGmReRjrEDQjs/ETGHoZDB?=
 =?us-ascii?Q?sCh3cva2sumHmI8fN+PIRHQ4+5XQ0ic3UECXxBAesQfvYG3WC68TGQY5WinY?=
 =?us-ascii?Q?47Yu3Oeq9nsoDIOLY//5GVHkdD9i/2d65RgppV9+txmgwgrqW7qvJOBL0hvu?=
 =?us-ascii?Q?2irrFvTS1LroYXZ5NbNKUjsGBSSDqYSW+YpLgm6AWsn9tz8dK5Rn1Cs62bVa?=
 =?us-ascii?Q?5/lEDT8+toRX5rvrvOll5Ugpv6ru03DibZV/+yMfnlpQr/VR3egfDhY82tbR?=
 =?us-ascii?Q?bxKUizxAfzAKFA27ozB40/e3331yzLYin2PYg3aXUVHmzhJn7opRTGvI+z8S?=
 =?us-ascii?Q?0ChFvLFXhhvqWT+vLVI0R+ZFCJVz+etewALsNGfLoURPjasxBkSTzs7ig8RF?=
 =?us-ascii?Q?h9y6zBqwJcj4axJCEieoa+bfHRz055az71LMh9lEpI4GlbVqcDJSXYZQvCuX?=
 =?us-ascii?Q?4Wwc//842V5we1ZwGW3jzkkk9vwqtDzCN2VshcbWcgTrdoiM4GmFfEGs+Tdk?=
 =?us-ascii?Q?6fLO+V03eb9u3VDzYrzVmn9HBjENCNCiX7ofGe3M7wHdWIg8DgG0jCaD5I3k?=
 =?us-ascii?Q?2cRip/+UcS4+WresU0/pZ4Ud6UGB6qf/Gel8aU0gZeEImWct4M0/Sw3i/sPN?=
 =?us-ascii?Q?EywnzskfgmetrtblBo9ACVIxtJU+18Mx+8yZc5J6zo14m1lwl+ZcsEahaZoL?=
 =?us-ascii?Q?nRUCyZ2r6uQj7yoy5AId69yveLWmiYSqyn6RsRCy0j/Mo46w1izLBZs1kAos?=
 =?us-ascii?Q?c/Nsn0UU2hQc7XHmboEYGE6B7qy5Wu6racUpn1fH4pSjo1w+XzBNfuQFHBP8?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b43034c-b138-4fae-a5ff-08da846734a1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8274.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 17:53:22.8977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tY6sue/Ny+5+vhDOzR70W7VuQsoqx0TZT9UHxt5ukdZbByeA7QRwx7Igu+1ySryQa/vAVajq/JKfwKSm2f3JVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3790

Add the missing resource IDs for imx8dxl.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/firmware/imx/rsrc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/firmware/imx/rsrc.h b/include/dt-bindings/firmware/imx/rsrc.h
index 43885056557c..1675de05ad33 100644
--- a/include/dt-bindings/firmware/imx/rsrc.h
+++ b/include/dt-bindings/firmware/imx/rsrc.h
@@ -37,10 +37,14 @@
 #define IMX_SC_R_DC_0_BLIT2		21
 #define IMX_SC_R_DC_0_BLIT_OUT		22
 #define IMX_SC_R_PERF			23
+#define IMX_SC_R_USB_1_PHY		24
 #define IMX_SC_R_DC_0_WARP		25
+#define IMX_SC_R_V2X_MU_0		26
+#define IMX_SC_R_V2X_MU_1		27
 #define IMX_SC_R_DC_0_VIDEO0		28
 #define IMX_SC_R_DC_0_VIDEO1		29
 #define IMX_SC_R_DC_0_FRAC0		30
+#define IMX_SC_R_V2X_MU_2		31
 #define IMX_SC_R_DC_0			32
 #define IMX_SC_R_GPU_2_PID0		33
 #define IMX_SC_R_DC_0_PLL_0		34
@@ -49,7 +53,10 @@
 #define IMX_SC_R_DC_1_BLIT1		37
 #define IMX_SC_R_DC_1_BLIT2		38
 #define IMX_SC_R_DC_1_BLIT_OUT		39
+#define IMX_SC_R_V2X_MU_3		40
+#define IMX_SC_R_V2X_MU_4		41
 #define IMX_SC_R_DC_1_WARP		42
+#define IMX_SC_R_SECVIO			44
 #define IMX_SC_R_DC_1_VIDEO0		45
 #define IMX_SC_R_DC_1_VIDEO1		46
 #define IMX_SC_R_DC_1_FRAC0		47
-- 
2.25.1

