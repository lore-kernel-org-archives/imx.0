Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667993382F4
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 19:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107883; cv=none; b=egwk1aiH28JGfHez09ql0s0e54Id2A2Y88X1vMrEZVGc047DvyvNrtyDamPFV0I3fHc6YXytimfsY+L1qSPHen+7cNEKABEntT8tUz2uyzWBU6RSoYBK47zaMixcd0buqeA29uSX5itcKFEvSzRier/8rCBlGmavJRB1ovIpiek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107883; c=relaxed/simple;
	bh=9VHUN3wrrOaDoWZFUjd59Z16/VB9m0n20/OUvZSYBsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDpuNvT5EwfVbQop8cVkOqceBnKMPlhEpHaEuJD01HcI80OT4Gqs8DrUr4XkySENhw1S+EObcmjAOIlaED4oK6ndYJGg0f9o6Ieg+WF+XD3p8E9zlT/E2Be/yjaDbzY+D9Lq9L95kYnqhtj+n0VwfYUhk5nFZPLWQZZ6cVe4VBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iY4Qnsy8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GepotVvP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iY4Qnsy8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GepotVvP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HjBIW685981
	for <imx@lists.linux.dev>; Fri, 3 Jul 2026 19:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lv1Bj12YhLZ
	GN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=; b=iY4Qnsy8abrOAIAfFH+8FxIw6mq
	Qv62w0poHuMw3XeKHTxiiEV2i9vgpiWUQnAMxg15qwpuMbCD5LHMmPAbxups9U6+
	8Kxg3VkqFs14Nvi5hRkCGUDPNnOZSfE9BVxjERFNOsf8El+epCrhEeCuyT5bWuEx
	xVZiMuzcNy/l+EOoJk0aX1Nx3Nv9PBByY67N2PgW8n4JUwsFXE0n25h4bFlL+ioR
	1v/6f5QLgOyzaQa8dDpqtELNoL7m4lg79GgByHgwIpYh0c/MZ5ZJFB7t/TSt75zB
	Hq0jvgAaxsGIXA6rrVFftF0Whkpojf4qBmtL0jrhsU2GaWU1Wh0ht1sDqrg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qckey0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 03 Jul 2026 19:44:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810960140eso1449434a91.2
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 12:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107879; x=1783712679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lv1Bj12YhLZGN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=;
        b=GepotVvPEAlS5gNCeykvmtd6yaPLRQ0+3bLHoPYWaSSIj8hG91buHD/vXtApBffaNl
         vgfqbsUr8ktzlM/kMr8Au+dhN39BE50rZ8Wi9iHa+dmVtuV/Yl17ygFLrcIL7wB3hK7t
         PJyBu203i+ToNwFjUyVlyq1JW9cEsVoAjM52+6FYUiFGp3rKGNeCEnqDHAEDZHNdRvZl
         U7/QKv0Lt7txRbFKhVclfGvnmTWlCDfSYlvxs2CJj2xQ3fWClMDveyWU9UMIZKn1MGla
         /2xHESMYSG0ns37rpHKuVnivjhULR4tKU1+Vzvszr0w11wlPLTwYo0Q/kyItjQ/4qPOW
         mexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107879; x=1783712679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lv1Bj12YhLZGN3CgybKSi/9TGsT3eAHwNaLR1ZhFDGs=;
        b=P8y4b2M3sRHh/FE7h/t6OvG2BPLqJgTIOrlckbfox2BlZMM9ujSK3LKPfjz1lQW4QL
         dCQLGL/u2WKIQmlA/lcAtaIjCRiwtXVceuptFsANC5B+LQGmnoZ4ApEcMBvDmMF7TSZO
         XNYiqHDXncFeQMFPLZPe94wJh88oNNk1kkjv7QrTMrNwgBjh4RLnb9QmO5amxnRpnO4M
         wHCh1bfCJqrKS6TvGTyTGSc/Utg4zZT7Jc5vC6q1gXxfoyacoFymHDkAotJXXQg1DFft
         a6KDha2UzUig6pUhy5XsoV1k0eEbjWNC73ZJ0P2sIMFi1uMHAoadKcJanTPfmJKpP7S/
         3dbg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+OoI3kRkAM6+OMJ1ZCds3O6zqUJRmQtzayMWFiJyDUO7CQqvl+S4/hQsajGqDrjDDn78=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpn0X42Hv3n52Zz/SSBCOMr5QLy93MapUQwcxtL/c4rNTPmzcc
	98KTdDHbY8YhsO0iB60XrVIjbgz97EVfQU/cNSu3+QdKnH1WozemstyM3qkFUwUUSpX/zNxecoj
	vrZqIYBKYxAn3YCcg7V7D+XwQh9IbiRvQyR9s2pag/HrEEiYNzQqEFLI=
X-Gm-Gg: AfdE7cl5uWNGdCK0OeI1r7BmGl7bZhFpVB8NCSvNnz1tE9BmhTvDaOfQZKzqULr135m
	MTL30gbZsQnW09hlGupNwDH8Fhwe1W9oy+XF0zddCgAKeHjuM7FtUON3GJmd/ySMykiADUIcgkB
	STyJDaDZORafNaluwrXXpDqyEdudhJrzv1VweghM4egM7FJX3H65eWMfqAUJyQVEZyMS0EseW4f
	KdXKMsox0VYxnB9jE+EjbbkyVzky43NKWaCsKjCFA16pEEwBo60yfQ7xrXkYndD8lpN9yCFWmqj
	7hZM+DlBwTznc+0De1mtS1t/+FDHF4ivS3rwsvXBZZzaZnOObB4lL9xU0HuBKEfJ641El8DY/UI
	rDm1rDWGD4mUCDVaDTPsrpspfFdgFv9vrpkVEzw==
X-Received: by 2002:a17:90b:2886:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-3829f0074b6mr775669a91.18.1783107878950;
        Fri, 03 Jul 2026 12:44:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2886:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-3829f0074b6mr775603a91.18.1783107878394;
        Fri, 03 Jul 2026 12:44:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:44:37 -0700 (PDT)
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
Subject: [PATCH 13/42] media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:26 +0530
Message-ID: <20260703193855.110619-14-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: fq1eRyxBJvhGme7JeqTDYd6k7dfg_ItI
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a481128 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iFm4xv_JmjgOdRhw77YA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: fq1eRyxBJvhGme7JeqTDYd6k7dfg_ItI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX7Zqq59J6OeDn
 3PtupPZQFyg3plykM8BnhUCOM/UDz6Hikv3DbdYf3AwqR/J5IMLTP6QizN4HcRJH2q8RihwPCaa
 /F8Z+0HJXwbKhVakRiRh43PzolkDMqrN/Rg9PCR0q0GiB1Q04LbUJST7UBXoDG9RjEczA5LV9y4
 Q0QXnVcoM2qVrfECYTCzXj/cZ1CT/vdu37jfZL0aXcZlfk2e7uLnq7ju72q3B73uUNmMls8SLsv
 ntdv96zaOvRQUJ3ZmMXZF5zAtYMghP3k4SusowOJKcqP0Ghbpf9pkSyeakJBm+teGMf3JSMTIB8
 AuF6xyDRW0wyaqm5XiyKUGN+7l5upiwWyLKRfMETcSWj2X6nyvUo9ViCTE/msYEOEZkvzFfK96E
 ol2j33alDLWEnIlnR3G7X4JXFdfb2TWlGF5uXqkPSQN/MhY1hqH8nW/UupjOoYcF0Ym+vjOJB1E
 dqS/bCF5YCB/HiTrKdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXyTishAx7Zjmz
 XCwtrFUp01w5Nv7522ln3uch27qK7/FRU/aSPsLDlIhgFM9sjz/GnXRbSHBemNAWtWDWVrD+DR4
 op26eF+0Ceg7ehykXP0iPWF/AZcFp/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..6786736c8f07 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *video)
 		return rc;
 	}
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
 		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
-		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
@@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		goto err_release_mem;
+		goto err_free;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
 
-err_release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 err_free:
 	kfree(video);
 	return rc;
@@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	kfree(video);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id npcm_video_match[] = {
-- 
2.53.0

