Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2125266EE9
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108248; cv=none; b=DwKj0JbYUtn8IBf0xV0dlbYVqU5PCIjHggBgfDdQTfiZ8sw/J06KHr/ZY7wvRuYkfTz9JySfyxWGhLRwKPqqGp78lybvgonOn6IHwSQj5AZXCORUiJCO0YRKBZH5KErUBbmrnWP/zSJ57FoW75kq0k1DBYnOkUdBL7whxYPs+VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108248; c=relaxed/simple;
	bh=NWi6l4/8Jc3AuxfmSZP8tVGdvqvPdnyt+pTMQKXFWbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Az24llD+QXV/OQbxssNffjm6Qqxeso7RttJ94+PYldMe+bwGvCxIftz6bAga9/9JskcDQJxAYkCC+/5/fjJWOLvzvaGCySs6w+tu9uGzSXPMG4qgzTtXKSDafzvc434ECuP4a4maj4KdpQ5OF5NY/0slfIgT2KXMnZ0ALc/W2rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvyBZCsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpVJwte6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvyBZCsm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpVJwte6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiOEK676040
	for <imx@lists.linux.dev>; Fri, 3 Jul 2026 19:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=71ffIbujQRJ
	pACfwswiC++PljuSs1fWY5AHxmQ6jcq4=; b=TvyBZCsmUFb6XP0nyeMDmZUr0d6
	QfdM5q7XKtRLmhSCsR87R7n24zAgPbqwXHbQbpbBrAfJN/3BoE2r95vk71p3+CBB
	ObOCk69OylcINhIYVL4FrfDARu/c4LAUFcKEv/9v6uWS8ukaPAWQuL8QDl4PNDO6
	WjFZPBHuitcjlSddKO9eskwZfTMHVM8nPVQ4qxvV0m/4929WyXvRmCnqcdLKEtVF
	BRpK7IT2oKjC1GZwOGyeLt9zFZnQ6XcJ6WQmmdDcXj7k39CKJTR5ZgMjHxxCKGYB
	3+KiUYnJ/K88oHwqwdihUAZhPh+yEQ4A7N5sgC8Y0wHfiGLi9JI0wWQhoHA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkh9ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 03 Jul 2026 19:50:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso771381a91.0
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108244; x=1783713044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71ffIbujQRJpACfwswiC++PljuSs1fWY5AHxmQ6jcq4=;
        b=jpVJwte6BtW/V01sdwXRvkLa2XkJYO9LYpK6UD+0yhF7nrdNB1M8wpRS5MtDDGRPd9
         tGyWd22MdiiP75bu7v8ky2hbhG/fkMhGGuzF0gX3SJmrvHrahYHtUSb5etRomBctNgBU
         i+3lh2okiO7CJPTjP6g2wbxP8XjEJ2b18fgHOArfY6yDHPPBmPIxzmhWEHxYQurSmpjR
         xMGEAoYgRj9eLdQYTJ8t6MUaJU+YV87vC6LhT2rVXIPzzjrpv8E45TTZm2GWQm14Ze1S
         2j3w9Oqc+uxCA9eFxSVEV4lwziyer4K7VFphTaNVzwr6TPHt7Nnk27nm0eOYrTplDIHK
         NVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108244; x=1783713044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71ffIbujQRJpACfwswiC++PljuSs1fWY5AHxmQ6jcq4=;
        b=oOuG8h6CZ9mjUfYBFawN7CchNcJAyiwdioq1+J4wX/SUGi3eIphETlxZfXuxQFZ6cu
         LMHjkf6hgwfbR80MaDLvhv4ec/mXfDNj2Erf6paubBHLyQnbmiUdpzkQC6BnICQmpYNE
         TMWTv15rk8bmHO6eROxTWDf7kWKjZxEgv1PXkaEL6fVFe/bO3xBzCX6+BQQXkmf/fLK1
         eC0iOpgNwNYFWvp3gfFApv82rpkamiIUFoHpQQ3uj4aCj+uDNY6apraLHSLhxg7RzOwv
         TFEXZLu9l7RRyedDvV+FFdvoaivj1MH3DxcGhvcK8yxsWx8lmv0s9clZ/iiwWvRrOj54
         /o0w==
X-Forwarded-Encrypted: i=1; AHgh+RrAk5Q0lLtL2UTA9u5s+WLH5CxQtUsARlYZPvx0VP4kK1DdwOomyFIuji+3aBvWvqGStqQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0+Qp9nTDpabSGbIz13rQZknFsVifH0PP8CNu5xPorAo3M0He9
	2/bz0ocFQW/tQG8NcKzvirnaSx0oEnMAsro4NvKDx6cjk7eZJJjFoELZ/D8QJW4kuY3L6Zf/i19
	RPuxT/BDAIC1UzSYwBYRp9CjEZzzWuM+99Asvfk1cjA+YpFDG0xzb+8A=
X-Gm-Gg: AfdE7cn6xem0p78kgsI0+yoxOALoxEd6Ibpi+3dOPD7/AFy5YvQsym/s8CULsGFGwZ4
	+WwFRwIjzId/UrjrJHaCQfLEFAAUnC5vOOjY5U2AJTVdiH39fy8CJ5y4gN1aPB4wGINzxXaCF1O
	Q7mK+rrIhSDtySrdvEkqE3Jhxe3F5z9GN74bmI59M7BAqfi2wOjZ9VGTMfRZmIWtv4PcP1IQDgS
	1O7QVvTn8U9gMbdBlkm7Nlcyg7TE5CeYnt9mhA8pW+z8livwB+ooZaz2jdcSn1aUVQF747Z4u1G
	jYNiL37e846pnmd3//Rd7No7xkz+fP5ixRfXEQFL5UYLS4VbrEO34j6ObdbtXf+E+VAsHuYbGnm
	7udmea//BYrTxvxGN0Tj2libhRWsMmS2SSuuRHg==
X-Received: by 2002:a17:90b:1dd0:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-38293b9946cmr729505a91.20.1783108243299;
        Fri, 03 Jul 2026 12:50:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd0:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-38293b9946cmr729426a91.20.1783108242651;
        Fri, 03 Jul 2026 12:50:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:50:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 28/42] ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:41 +0530
Message-ID: <20260703193855.110619-29-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX1Z7JRGEcR3xv
 0BWOlzjOx/SnymCe4CJ3A9YK5LkHQl5JaNJ+0yh6OBjZD/fnspdPz/h0HItVvesw1Cidg/x5bHv
 0cfDjx1JExpXhu1ahNfDA1ycgKy2OVmUNIxAvV3xKyKRdks2SXlceGcAaT23uDPVJdSQQKV5bW0
 ayLTTeWpSDROHyhKJWwdwb4sFl7W3cMgbw3cwXkf8qjoZo0t00+nqACgFZdftWVFET8ekwnzfUT
 tztQdHZxc29szy3Vo64bRDlgRf/jwk+Z9XSnxpcXgkOaXaWeI8KGIhd+AlEt3ao/6IjrQhl65ro
 tpfH2xuT1jJLBIMtGHsjA7xzxBxY8bRqQ3OJ0EKCIRzxM6vngCcerxzhYDJX95hEYjpBlHh93NF
 Mk+7c29DaKJd2O9C9bqRV+VS+CNLsGvEByYo88Hfd8rnYgr6K1TiXQWkj9ylB7pnY+s5tLhnMFJ
 QVYZCMCTtFduBGSrWog==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a481294 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=vpwXisbvDR7QvT6TCt8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: CBhCRG8_rYPX5OFYIRzxMFT7QQt1IFnR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX1EEFe87fcnH8
 9Ja6fbR78GtXxxMAdRHJewY4haABcZfxDH8YhgDTNGyxWt1xrylwiJmd2s8iIn88a7hze/I7LUd
 f2xXCfPyXtnVG/C4Nx7qJCs9ytu0t2c=
X-Proofpoint-GUID: CBhCRG8_rYPX5OFYIRzxMFT7QQt1IFnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Replace the hand-rolled devm wrapper (mt8189_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..04baf7d9132a 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2421,11 +2421,6 @@ static const struct reg_sequence mt8189_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8189_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2439,16 +2434,9 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       mt8189_afe_release_reserved_mem,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.53.0

