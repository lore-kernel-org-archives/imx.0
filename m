Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D1C3AE18D
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 05:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774504602; cv=fail; b=XXhHZGKO+cKR3uopDVcDq2So5SzTIDDwXVh3ObGeBXv9ogocHE52XsOTgmyrZJHGDPvZSltaEpNQRb3Ho0huQWqr6KO1SrqdtfeKBXSWA9i/QgZ3oowz68Fdt571R5lyNb6e2m3bLz8N/79H70S/Uut2OwypL0+mtyShE39Y3ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774504602; c=relaxed/simple;
	bh=zRtBxJdRxwmUk8r9k1/wB4gSaep1BnybrQxtXhqXQ18=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jmS4n37m7VXYxnxJQUnBU1wnZKXeLnWLVfdLBBR7ikeUkd4iHF3F0bQKd4Cb2ZYX9J/nqq/mc3uNNyVJm8uHSY2uURtM4ysvKT4MZwRrdkLKttmzCPcNVmYYvjddAXp90W0NtvCVsAHHfFsre9QHAK28nxjrmKXrCVTAJxv3tZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MRiHhlsT; arc=fail smtp.client-ip=52.101.65.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MRiHhlsT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nprFCOeF51hKmwPqldQyBJl2bbdvEMCG5LCiFaIi/HPP9H+YG1zsmlBGJjVTssxMJ9yJUtM2KQJlPz6uF3jbkreOsNYtfrP2VvAiHuVp5M2YEv+avnir+isLOEwBghRmFD7aIaVYuC/N79KpOFkzIuJ4NVfY73mgW7gNfwcbp0cQaEHH2ZHcfiLEevk/3YSFZcAPFbRraIsxpDIIS8f6CLXQ7QZqYaupZYFfZZfoPoZjAMhBFiqnDXC9bLN0/pLzqtC4a8xaE2gIotVlUEIKa4IWusVDlMjmNSRc97pZ3MHPfy4/FfQWZZKTBJZ5wJ2XIF3kBqdkDepdFjPVIOevJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6rW0TV517vAvNS5s3RYdTceFSZ/Jz0VH7R8KKmSeaQ=;
 b=AFCjjtvUtlXXfadEcyDlVJdZMBUB7qvb8la19pGGPt1K05d+XUZrgD+b4tDuRfpBLpSOod03Qoh0IitRjyTfa0P6JtoYJDPpVTEGc66D3TQdd0GgK1IEhTSpWaiRy6GDIQo3SJSxnheXFGCtBuImXwOvqX94ZXHepLXbvkmpKtpjtp40cVNm5CBU0JlsacUXmiL7HLi3WV6u4vdTCRKQA7hk9D9+9cu9943SaY+6RfDzjWyBO/hLUsxKn8B3usyy+xRloBZPyfCIu/owxs48cGPY/ZaaV/kiMrd9GVYQtdX0Nel4Z5gCTigTKREWyxo3/j3LdxXx/JgF1OsGWhlnPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6rW0TV517vAvNS5s3RYdTceFSZ/Jz0VH7R8KKmSeaQ=;
 b=MRiHhlsT4x7fThWjFZlt1HYQPyGscbad4fswO19sQSwrpjzPeBiEn3jSQBSymGWiccexncvDeHBDhbG3POTdhIP/tCnBRXmMdVkNE3k1o/uY7wI2ISyWsxqThyzhJTmkRla+oWBGnR+xn+A+xwU6hyIWxHOqb3IuZtmodrSis1xL6TbyV7+VC517y+yTPPpPYj5on94mZRWyaimM/89G/d1yjKLr+awm9QFJ+0HSjv3RX5fePFgTb3+S53UMthnWIKjTbK6UUW+QBOpguk+HFhrszfOw+SIQtXseLLA+veqScsKISvHIjLb2CH13TNHv7nMFvQ+MbQJk0an/hHb/yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI2PR04MB11195.eurprd04.prod.outlook.com (2603:10a6:800:291::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 05:56:36 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 05:56:36 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: imx-rpmsg: Add DSD format support with dynamic DAI format switching
Date: Thu, 26 Mar 2026 14:56:14 +0900
Message-ID: <20260326055614.3614104-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0172.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::18) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|VI2PR04MB11195:EE_
X-MS-Office365-Filtering-Correlation-Id: 02fd1920-f75f-4e0b-180e-08de8afc70d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Dv6+bIyZO+PLtpUThtDtdLSsUSysoQNQC89C+gLRY17nakyD6eAArO4LGNGp/5Rsu3SswcJxlBEFjRwjz/F+HsUFQNhA6DsE0PeAIUPWK5S8lJf0tw658xKSIsXNTBqKIeqEHiYLP8LvQHFUI5FZ5h2u/kxHlw8VKQTO40DbG0oj1Qn7Tjqg9O2/F4Xa6arx1cgkvHdsOUX5wwdJA7fIyNAwAHXxlIXFJayto+DUNE9tHRWmQWSCYZxZmlGPDRP2N47Gcxuet4+YYYabaYrttRqFx63jQFR7brRaexQfNKlj6uaXgKc3oHH1dINLw2fm8hYKiA3OaDRtQLSLjuvi/zeTIGYchr2o4urNcPj/dp3GxKvIO+nDh7eM//V1UZzG7+myylfzLaP9oRiPDQErRBy5HgINbAOH4NWjake1mvSerWi01cANQZGA6aOCQzrdQyFwu1yWwuSJs1Gbq61nhhODxn7uoJlEQvseg9BmSXds6Eb9CKHEJgIhlIGH5gqAe9o66Jesv0hp/CdQcjG6SXQ7liMytxyGwvNAGesMquuiZLkMTVlHiuyzNaT8dzEBmyRL3Ihsh9EuPh59oSEnSb/RY02gYLMRWPSflzlRyoicELiRipnA8DfeQiNUOZ9WKHYlycOJXFWCMgujYWq+U3n6CkYrzYQlGZ/kGzHdzoHHmfnVZzomv2AqeglKdiGxBpYnOAIxHz4pZwPNY3Q8USjpY24uidxIdZICh3yWapQqbKgyyEwP5xncDsOFLpOTEx/33obSxuFOTfPRJ+Aj85bkfiBE58hzp9/IaH9Q7lvbMK4wr8Nukg2UViKLkUoM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tYXoXl85f7RcrLsZJGfuZwEZFYqccKIXxv/KumfzODa5rDMW/gZs67j74jG8?=
 =?us-ascii?Q?oFjGdn3EGoUl7yuAH/ecyI1qqrbQC5sDDXfMXgGcx1y2nUA3Wf0UQ/YxiTj7?=
 =?us-ascii?Q?fgHshDneZMXLCBChNAv/I69Grf8nZsLNud91axUwLi0DjwP9QvroyYRDCeWs?=
 =?us-ascii?Q?LAlELVTZKHcHfAAONcUPbW+Fks2lizTBQFqKf9dBly7TelhwVSLl3zz9dEJ+?=
 =?us-ascii?Q?QXIcW+RphM2Jakg9QsldUiKlTOC2qQBjYKExmLbPQ0c3HlVpSJ8Aqn79Mugd?=
 =?us-ascii?Q?Ms5shn+WMmmV7So4gRlgHNBmL8ctFLeadp8KB2PczCioXszCgjm9DoKXrmaZ?=
 =?us-ascii?Q?fJ4mGA5WejIQADTy854Xa34cil1/dUX1iZioKagXnbHLfcXasN9Ksy1RWfbX?=
 =?us-ascii?Q?gRi/IOkTmSBHSC/sAGVW1lpTZWAKLmx5ytcYAR0gBpDX6/jZ6Q4otvASlXDv?=
 =?us-ascii?Q?V4prd38eOCqNtaGsNgdUwtZNSNZ+24x1WQ/n8y7kiOFuPKz8viPONvLN08ZR?=
 =?us-ascii?Q?jWLaS/KqfwSkgjwS7EeLSdtpteMvns9qOU/qeWXQ5RJ7Ti/Jd52jIrewhTUF?=
 =?us-ascii?Q?Rz7amcJxmIe0O56iXAReAtlLjMbhT/eB5du0Y/kz4D8W0jNUy0fS7tzmgyfE?=
 =?us-ascii?Q?CUqRANZxInl3jLD4abIZMLAR/4OrTSvZGpJS6h4ItAexV13xo+lXdTGTJEBe?=
 =?us-ascii?Q?1W168AiI+euB3VP76Pzd1SfUFv5/gef1SzLpwn7WsrJLVsEZdcmsjtlDjbfj?=
 =?us-ascii?Q?PoVBrdxJPlotR7+jlCariIp77vr5wxVF7HwT/iVPoPsocZ29rWISpQE1Iqmg?=
 =?us-ascii?Q?q8TNpiVdAa9XSU9HI9r3GEOz51F+nK/BA5GhHoYkXlMhRumxGYHgfDIDLaSa?=
 =?us-ascii?Q?Ug+yl/NgLRLGDwiAAg9Js/Q2EOCkbY2v/FmV/BOeLWxEil75KVy1Frlzjpa5?=
 =?us-ascii?Q?W7tD+3XpAoRSXOVkTAyxrCXXZ0iQK5fGtAa6kSTbfMS0mK6G0jjffAVTGzzH?=
 =?us-ascii?Q?a/0rztlu3t4bQzymPnLVpAoX/bPXiAyqFHHS7R1carhx7fRbalngk4Vfx6aO?=
 =?us-ascii?Q?DjoVDeSkavZWYcuucI4a33xipgBsF9htMvpOFgNXRYQZHq2Av2ANvqVTj5ud?=
 =?us-ascii?Q?1bb1IK4huqUfLGFeeqto8Ja4YxKCZ6tkNglAa9lXFjlm3num2ILKrH8Liv6C?=
 =?us-ascii?Q?+Ax9Si2HtkhWH5+gyqmnYNOoyyx2yFwSwNL/voPpwE1BRqkQGp7maSZIOgnI?=
 =?us-ascii?Q?X6sRMMwETA3QcdNihUmBQKJLvkNk+GYV2ifdUlup0x1k/OHEx9IFm7J3qoD0?=
 =?us-ascii?Q?Vw/HbKBkDbfaOBkHmN5IMoAcnhU1fAiEH6/UBay9W9CQKktmrVwpzHb8lYK0?=
 =?us-ascii?Q?K8UBvIXpKdpECM0K25WW1RwQW4+GhK36HfQY3pYbcSCijbbgw3ioggdeABGX?=
 =?us-ascii?Q?FysBM62IarUTMC7P7ZwBzjnRvXM/XuQ8ElHX4MWSlcZjITC+g1UbrOx7T8ZD?=
 =?us-ascii?Q?AYRsnPaR5WKFKXahJFPTg2xkgAooI9CVdi5bj0tv6GOMaZpKTtlBhOtZ5+tC?=
 =?us-ascii?Q?Jt6ZRkt4WhDaV2ZeZFhvg0DhAh+4DHETd65Zraeof6Ncz0VqVWdrp+x40HjH?=
 =?us-ascii?Q?sjHP1UqzhyjtL2EeG12Fdd3ppBcvKz8kn6Ptspn8Tz6IaFqXm8peZCrXFP9j?=
 =?us-ascii?Q?djQkEukiyVMRi9CzHD8Li0Z1tVqQrpbpi+j9N3E+goey4kZr67pFEj624zPc?=
 =?us-ascii?Q?nB7XEi/nJQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fd1920-f75f-4e0b-180e-08de8afc70d3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 05:56:36.3447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4AN2BQpT2vUZ+DELpHMfeqbm9rEvQQ9/1UIGHInvWEVkexcmlNvq7vAOPcl7P9yFbuDUA84J8TV+Sok0HBRdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11195

Add hw_params callback to dynamically switch DAI format between I2S
and PDM based on audio stream format. When DSD formats are detected,
the DAI format is switched to PDM mode.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 48 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 76a8e68c1b62..40e0043cfe15 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -30,6 +30,53 @@ static const struct snd_soc_dapm_widget imx_rpmsg_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Main MIC", NULL),
 };
 
+static int imx_rpmsg_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	snd_pcm_format_t format = params_format(params);
+	struct device *dev = rtd->card->dev;
+	unsigned int fmt = rtd->dai_link->dai_fmt;
+	bool format_is_dsd = false;
+	int ret;
+
+	switch (format) {
+	case SNDRV_PCM_FORMAT_DSD_U8:
+	case SNDRV_PCM_FORMAT_DSD_U16_LE:
+	case SNDRV_PCM_FORMAT_DSD_U16_BE:
+	case SNDRV_PCM_FORMAT_DSD_U32_LE:
+	case SNDRV_PCM_FORMAT_DSD_U32_BE:
+		format_is_dsd = true;
+		break;
+	default:
+		format_is_dsd = false;
+		break;
+	}
+
+	if (format_is_dsd)
+		fmt = (rtd->dai_link->dai_fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) |
+		       SND_SOC_DAIFMT_PDM;
+
+	ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
+	if (ret && ret != -ENOTSUPP) {
+		dev_err(dev, "failed to set cpu dai fmt: %d\n", ret);
+		return ret;
+	}
+	ret = snd_soc_dai_set_fmt(codec_dai, fmt);
+	if (ret && ret != -ENOTSUPP) {
+		dev_err(dev, "failed to set codec dai fmt: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops imx_rpmsg_ops = {
+	.hw_params = imx_rpmsg_hw_params,
+};
+
 static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 {
 	struct imx_rpmsg *data = snd_soc_card_get_drvdata(card);
@@ -135,6 +182,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S |
 			    SND_SOC_DAIFMT_NB_NF |
 			    SND_SOC_DAIFMT_CBC_CFC;
+	data->dai.ops = &imx_rpmsg_ops;
 
 	/*
 	 * i.MX rpmsg sound cards work on codec slave mode. MCLK will be
-- 
2.50.1

