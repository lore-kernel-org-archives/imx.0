Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80041.outbound.protection.outlook.com [40.107.8.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E6C4A02
	for <imx@lists.linux.dev>; Mon, 22 Aug 2022 17:53:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWJIuOx9Q6Ln+eGdOH/uEQNRkI90G9LwowusR/FaaOw6wUOAvClJO416+v5gPnHI84D01IrMajz2vd7t9xzOgHDB4YwU5/Bzoe/FFYFyKTz9d88qWjjz+himrT8iqpw4TmFincbZFWUvES7U38WvDsiCPVFNtAmLPvUwq4iylbQLtUrLaqoF9UWFxuZHqbeiXXw0Ale4RsDoJCsNLxE6TtIt3r9xWaiiRaUOCawHDffBkzBSrEkjewfAYigi35ZPor6gJoHC7gNlQfV1KWEHbF+czG71Ee0VnnDcsKlFcvlzVStBMCLZ6Z1NWvZ4UkmAGTebyjMZ/Ndtg71Cb3pkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PZ7i2t2MIKTwxEybY05L44KbQTChqNFvulgZvvzr5k=;
 b=SSKrNTGEpasBs5gbMaxA+QaoPnfaJO/9b4NRvydBrmQZ3uhCmhXa75tjTRgS+8hhOzGZOvs9WL9RfhrKf/ODM+4EYZ0rYxFl8BaW9MWzsBacnPy1VUtVw9/ZwBJDCDDCv3zfy2IPpKkTjtbyNtq620zfXUiyqcz37b7Dm8VXzahTPndpRDZXVDjtGA3ExVUgrAve1ms0URLyO00Kup3HccUSYBb9yO9pQpODg6lWb8F222I+n/5XmJRENPq89b8DYCJB8I4QYsK02f/hg3h1FA4ZvMOv659erCtmOIb+nTY/BlxueQUnjViOA1SvcCupWmdK2x9TvWfuIcI6lVI/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PZ7i2t2MIKTwxEybY05L44KbQTChqNFvulgZvvzr5k=;
 b=EL29BFlJ4+NIKpeD1XTRXErDmSD+SOq99Q3MkAXUMWpc+NguPwMI2x4keg/j7S1GuVJ27xY55EcU7fzcy7fats1COO8Y0Ov7D8ffprFlKXzw/cT2BxoaTvci6hVVSXoZ8AJfeCqNW7n+ivXo7mblQi60Q1tA1gv1LBBeLmD4PR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::23)
 by VI1PR0402MB3790.eurprd04.prod.outlook.com (2603:10a6:803:24::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 17:53:34 +0000
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca]) by AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca%4]) with mapi id 15.20.5546.024; Mon, 22 Aug 2022
 17:53:34 +0000
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
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v6 3/5] arm64: dts: imx8: add a node label to ddr-pmu
Date: Mon, 22 Aug 2022 12:52:43 -0500
Message-Id: <20220822175245.222691-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822175245.222691-1-shenwei.wang@nxp.com>
References: <20220822175245.222691-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To AM9PR04MB8274.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e8::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27174d3b-7552-406d-19c6-08da84673ba6
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3790:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vipe5XO1jEsHybowW1I8WsuniilZRiFFCDZlcSdOMsOF1XBVe+5UWBo95y7S2AKERU5wYYJQ8LHgEtLGet08Pn+AagMEvVwu1QJpU1ifMioYB06199O0TEo569jKWI6Q11wk4POVg66EvtdzkmxrtHVcjCNvhZeVwWe4bWoxZaM8X0uwLdv6IE4HXlUOlKgcgnAUTD1r3+N+e2usAv4f6IQFETITpLB2YxBiSqEDCDRX8HnmY/ZVRppT1QRsKwwM0ZdVFxmjjohvB57WO1UIsibJi6TSI3YnxUbhRYNWNv5LLjbDcBnZIJyUuuocX0+PUAUNM6+vx2jflcxh4tDBANZxIg18qtrfsAUKOMMrjpvv/WO/vfEAhL+5zMbU8iG07qvVEjWUNVlnhJ85TP/Tna/v/g5NGTCkFXmVUgHReGsyjJCZJI7b3TYJ8qAHFvCzgcylVggxPwygxX6f6RiErZMhmRtcIGN6hD28ekg1+GF21OSFnusi/NWMOtRIOS87yu6Jh+NCW66I9TapZAHnCPqo/YIy5B6vggWTL2Wj3eFD38Wscb5Gdrt9tOd0Vyzyg64BDfdw0WZ0VF0z0koZoL5cXxgdMkh8qOjXYrAWVdVRcqpr/o6Yco8GnOyQG24WkLKHVksmIOcPkYht4ugCvSZy+Zl22kVEyYVcyhABorh3TPJRE2BS4pakDUU2Cp+oL0v/b64WusQcL8+CqY6hzJoVyEDiJibHltFTQRAbmoqErDigIux3/ksX6cJek7FoNjcxXoaym2tGuCa210miXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8274.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(36756003)(54906003)(2616005)(110136005)(186003)(1076003)(38100700002)(86362001)(83380400001)(38350700002)(6636002)(6486002)(316002)(4326008)(8676002)(41300700001)(66556008)(66476007)(66946007)(478600001)(2906002)(52116002)(55236004)(8936002)(26005)(6666004)(6506007)(4744005)(44832011)(6512007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?acRRJ115K1PN/Y0hME2Jiyk3DvrEFai7LeFSU/p+e64ZwlfyvpGlTb0DrmxJ?=
 =?us-ascii?Q?/Kj6kTGhhLXzbm10ekUSQ2EZMALHCCJk4wmqxJsQQ56s6SV4lodM+myeybtM?=
 =?us-ascii?Q?FBcq/o4kbk6IiCuQUSPoh6HyrYP8RgA8OIjNJQ1flu0cdAEXGGaK0dsI3hNa?=
 =?us-ascii?Q?ujaO/4b1oab6b/SEr27GQwGvDhv9n3kyc/p70Jib31ncct1YZYQvkSk7UZL4?=
 =?us-ascii?Q?DsVcA/9vw7mbubTNulMWxX2vl582TboNVeJK1iTzwXPYjssfo1RVdvMsKIS2?=
 =?us-ascii?Q?yX9OwhS17kvck+VLOD++sfIqqU9yO+C/EgdTwSXnES6ONjehIVYjKn2U2fq3?=
 =?us-ascii?Q?mP5XV966lQ7++k1oHfl/dhHXCM6rOEQ3oHeJHWBVljnoxsNAjn5u0xgcOUtE?=
 =?us-ascii?Q?Bux5LpnVEyW+4FQ+ggx/iRForS0/+z2VXrx1iAbUZSSpTalbOrsCjhHRpa2D?=
 =?us-ascii?Q?C5IrRC090T7Eev6XnshYtbnCZOnb/YfVI8NMUwa4kdN0kXdmaEpX7ARcfoNF?=
 =?us-ascii?Q?SbwtJPaa06sCVOP5U1XY03Pdbh+pxDxVEIRFQZsY545wTB1R7euKCe47DoF/?=
 =?us-ascii?Q?iqcRfPPiv/BBbrOBS4m7Tc69h9Pr0uKhWYTOuVXBHd0qtySl0/IESEPhQWKr?=
 =?us-ascii?Q?agkMnlQJLAkr9Wr3lIsp4mexTqjOcC1uuno1T3d4DVq+OTyFclm4GUQpMCCM?=
 =?us-ascii?Q?CzFcULByQ2K/3lWgItNnt+yLnBq8MfgNynywO6B+Y9az7AMVaEeCDaMK1Clu?=
 =?us-ascii?Q?h8GkYHV/d0srwK4qmQj/G8d96GWoGcJk+kFKc775gYcZUXb2ZD59bCMgh/wG?=
 =?us-ascii?Q?DDp++yfGLSjEmeT9VvFOHq0Fkw0WWtqs8u/iJq8qSDoWyGNBCQ/2E8uaT6Pn?=
 =?us-ascii?Q?PXeiUSRPuag1oyIEKnbpXtPxZy20s1qwI+5r1ad8hW7NTzU0TuodLBvIebCW?=
 =?us-ascii?Q?FjznU/Jj0kk2+Q+ERNXgjER1b5HzTPsE8MMOYmC1hSR0/rjTAT+nG7I43lm2?=
 =?us-ascii?Q?Ei8/iNmfzj5rzPQjIzP5fuFzAZiXsQfIZVKWoJ2+I75j+8MNPzJ2FXnxJubP?=
 =?us-ascii?Q?D1wj67lRDPM6o7OrMElEKB/PjNLWM2EO20b9wsz5sFm2FNFgGYcFgh6AFQn/?=
 =?us-ascii?Q?rbc4Xp/oaqMZmfpHq0D9TEo+S9HDfHlF67A2w/FjWFqu5SE3GfY+HV3gC+Bn?=
 =?us-ascii?Q?HgOUmrUG8ZXxiriw4aL+FXUH1c1o//DzD2WHac86PoX679ncbb0l5mrYVmz9?=
 =?us-ascii?Q?yKMLRp3d3zrUXG/dFKEcrgEBJm/srelaDaDkUKsQU+PN2GPg36U8oNomLZlL?=
 =?us-ascii?Q?v9KCmk1OrBnn+j8QfovFQcCgY0Jt7FSjjiKv54ykJ3JcjXi6nXuqI46Oys4z?=
 =?us-ascii?Q?2S2/fIcL/1IC3Iv3ZrUjdu+GpBGNRUx75n8ra/fZ2priDA1jSncrupfquUbS?=
 =?us-ascii?Q?0xNCEBx3HOdM/HGb3onHRlp5eC/vP4SSh0AcU2wjMaf35+6334lqaW3BAeI3?=
 =?us-ascii?Q?mq8kdsyU+ykCJ64fXNpVn4JXniR+Xn8jpXgKw5vXAMotpaXjIeLGWjEttdPN?=
 =?us-ascii?Q?Y0PGU3WrDhNsfopq9AroaHHwJQZ2jyZ9Ce7K0IVjWO/kUyEpkzgmsjcN0jX7?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27174d3b-7552-406d-19c6-08da84673ba6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8274.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 17:53:34.5929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAQd6gqcmx8U9pR7e4vBuZHeKx63ayWta9+p0xzIDDRYUzEJ+cva6Jvn9iiyX5DNKcYDYE7xXRYs7CBOZU79yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3790

The ddr-pmu on i.mx8dxl has a different interrupt number.
Add a node label to ddr-pmu so that it could be referred
and changed in i.mx8dxl dts.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi
index 8b5cad4e2700..7d5183c6c5be 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi
@@ -10,7 +10,7 @@ ddr_subsys: bus@5c000000 {
 	#size-cells = <1>;
 	ranges = <0x5c000000 0x0 0x5c000000 0x1000000>;
 
-	ddr-pmu@5c020000 {
+	ddr_pmu0: ddr-pmu@5c020000 {
 		compatible = "fsl,imx8-ddr-pmu";
 		reg = <0x5c020000 0x10000>;
 		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1

