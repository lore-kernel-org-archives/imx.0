Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B2433C536
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108104; cv=none; b=PWkYRLeu5+rGuWiwXdtGi4goFwqIXBWBN3+51rura7h/GUjDnz60O9izZXCwbpk0j/9EuWUgzNfpX5XH82RdJj/9oYmzM2WCUZZmjxHLrpfumrY+EoMP5mmjk4ilcgDqGpvi4mDEQpIFen0oVoWiVfe4jL1mwwkY8oaadJJInD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108104; c=relaxed/simple;
	bh=PUUEAh0o9l9vti9257m/CVSbH/19FudOK0Fd7Mw04O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7FiWOYfym20OPyfprfFsGmFojxqUlHAMjAkq8IKkcA2r/ngMK4Vcgzyf2M5Y9e1t+gUzQciVF29RP5CmVkQgpBNgP6vxJIClAStZfUpt4qSOrnBa+MasVvS57csgatBzSNSRIQS/0QGkHXB4+xqg3m+Td02+rhSMFPdW1s0pSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSL4OW4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFtMXrrj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSL4OW4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFtMXrrj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiOE2676040
	for <imx@lists.linux.dev>; Fri, 3 Jul 2026 19:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=05KKm/2fQBz
	iycvO0o5qtmP7hJCKgsH/Os/8U9RN5hA=; b=FSL4OW4sqkH5b5j9AIsw/YhH1nf
	ibgm5Unh2DNBArFuPePTEp7ydMwknI8hVtfX3hafu/sPH/fll/+Yol1Nt4cgUW3O
	Q2oC0AjaQcNbY6bV1u3Lrt7No3E1HH/aXPsXP7AZG4RXN8ivUpyMfu2BoEamWIFl
	NW3X3tStizixNie01eHQ9xV+jNSuNRjFoUEqBSXss9qBg6i4tK2kHk4NWRI7Hght
	D9IYQ+nKevxHW9yac3lGAA5QYlnpXFWRGBioWY+Th7V0jEKaJwNAXJ3PPQeJmZTX
	xFvGCoL556Tc+tATu/JtYm9O8HvYscVvC/BQqEq/B3XicM6VWsCrI2LiN5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkh9fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 03 Jul 2026 19:48:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37ca4367860so2245345a91.1
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 12:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108099; x=1783712899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05KKm/2fQBziycvO0o5qtmP7hJCKgsH/Os/8U9RN5hA=;
        b=YFtMXrrjoKCARwrYbEQn+oYFNpduG7K7Q2Q1gAoP2UyFNvaFtPMIVXLjYaGz2IRHXx
         2GBcRZevVYj+RMtgy61KtEoIXgK5YONSU3z28ZcIbR1ku0gbIigpvriYAvE1IAehc8XI
         SbeL9t7CwA9fYnVVH/LBz/zTBuO43kXioXL7uBnE5q4Mdu68UpxhqMn1qCQUIov2C+59
         bLtK+GqNCtOWsuKf3bhihIdNtBzVEBrxos8NgCH2dmX/rGNveiKBHsvauMdYXXItCiFx
         phVfEOR9++axCSMHjrVElnlaPVIAf3ue+lckRwEdF97vFMUcEOiwgumzPp6iodsrHovm
         7EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108099; x=1783712899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05KKm/2fQBziycvO0o5qtmP7hJCKgsH/Os/8U9RN5hA=;
        b=jFYnI3PBhGKJ7xW0/CL+tY0L4zUn0dScUCseti/IZ5sAl+L4EAfIv5ZLpcwsnrAs9B
         DYzctnu35/LJaSSMYnWc6CbN3cH3ON0L8ci6DVh3xIOwqgIbQgZdxzBn08E5rd53H6nW
         nLjMU6FFnMq+n/uOcfdT1TaLNyxqOYYjfiOWXaQ95MO7dGh0yBkrNYOWA6OvslWqwj6O
         igGQa57hqpemifpfiCcjBu5maKlTWF1b0O3IL7b3TycNCbIGJ9w5cXC6WCMu1wdS1/aV
         e3rO1CQQ1T+XllXujQZlWbqGf7zYzDxr6AMD6VV5M+V9ee4EqfBTByLDhiPcwUcexThd
         6TSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAmmoQV+8H9M0rYDOQpbOqSkhzurVv/pxR+JNObRArHRDHMCh5GhHjh009lsIrc+isQvw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJJ+Pq4gvmnlTYeuj4OkMRuIQTQ1YN4lTiuclUjZhNz6OGPZEK
	Y0SV6LDmuSsl/+GzPjdafaasKrSuwxWmHNqYO4enIzJ5UJsP4WtcWGHXFRHQl9cZCc5xD8aMkCT
	V+/qK5UnQFy/uq5UgLZrLStIraGYMQCAyJbDZBskAji4Ax+Zcd97E2oo=
X-Gm-Gg: AfdE7ckLvPZu0HW/cGKq2TKncVjV+6dzmwRVgEWj4Em9q4g79PO2J+xNIApqytA0Q4o
	uxUkENU+h5UfUZLEE1xW3Yp9WKYks/eNaaVKGKcza1GY6xD+dLs/AZy/beDKTNgpF8bgZOgTIeF
	/6Yth7aJHo7Byuz1qOKTMoGJFsaqOP1x2p1MW/F1UOyV9EtMB/cspqnIZ1nlsG5/nroQi1H24bv
	3hn6e7c7njFsSnQ/3P3I7bVTZ1N1UJ6zuu9wIYFrQrkWCLrT4mrTQTGR3rRcezC6rO4bvx/KyPb
	K/lPyE2nhlmero2Xtv4g1VSK0WKnyrhXehuFznO1fI8BBN08oW3g8t9K4h9q+cD3mX0WNnVv4Z6
	vu04GTgMG7jYj0b2G86twMHqWm14UaJJozFYOuA==
X-Received: by 2002:a17:90b:5106:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38112340885mr6288971a91.15.1783108098248;
        Fri, 03 Jul 2026 12:48:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5106:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38112340885mr6288938a91.15.1783108097697;
        Fri, 03 Jul 2026 12:48:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:48:17 -0700 (PDT)
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
Subject: [PATCH 22/42] media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:35 +0530
Message-ID: <20260703193855.110619-23-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX6BQC+owGfwVC
 KLSwY+R5/1v6Y57ERqhKTeHl8jBj5DIb8TuKLofk3YgZb3fzfddgCTUYmd68W+NDBYKUUM9rMVf
 s1snzqx/+3nLxwsjhKkJ1R1hL8yXyscvhcAEnCi8xSEdHafYPdrbdNxY9EDd43UXgop0d6XW9pW
 zDT4NxAgDMzzXTS+UsRoyoAVO8RKClkAxfFS4mdN5QqvghEEow4yCLS9WBdMRUI4MFyTM1cqHji
 79DUr4cAYG7PJA5FvwVboS8RGY5oaQrDNxkhhMQ89t1/eOjEiAFLzYHhOW6kl5+nk5KXeuQoVRO
 bgV9UAzcpGyeQzp7VRE75A00BeyN2V93VDiiqe6/MR9eyj5cGlmczBbZVQ0BA1lN/GHA93es0jg
 5iXSZgzIJHXaYbYevRAd+zX/fQLKh04KN40c0wwNLROFVJUIJGTKIlYdXgzQ5orCLthHtJ00HoY
 7nsfmbQgJNmNjHWVn3g==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a481203 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gqQKJLWYzfjTGvuwkdcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rSKemri4_Sd-6IDN-oY1IVVNuPYGsHo6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXzdS4c45GU+ic
 uW6Ctqh3nB91QX7b13R8ln+kvFDDInzAljaAdZh+NvmxTyISJcfzLmgVO6qzMsKqk4Wqdmj2/D4
 7eczXD/jxoNiAdfSXW+vxketq3uHrA8=
X-Proofpoint-GUID: rSKemri4_Sd-6IDN-oY1IVVNuPYGsHo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..557bffb2c2f1 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -888,7 +888,7 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 	dev_info(dev, "4GB mode %u\n", vpu->enable_4GB);
 
 	if (vpu->enable_4GB) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			dev_info(dev, "init reserved memory failed\n");
 			/* continue to use dynamic allocation if failed */
@@ -930,7 +930,6 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 free_d_mem:
 	vpu_free_ext_mem(vpu, D_FW);
 remove_debugfs:
-	of_reserved_mem_device_release(dev);
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-- 
2.53.0

