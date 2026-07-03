Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41AE33CEB5
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 19:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108270; cv=none; b=Z3Z8E1877sp2jsFh2E4d2/xU/ssjTdqkQA59ZGX9aQ3UQ7wKaTheVOGXk0gtWaQOBdhcoL5+23Qj9RPlToefRqRBQfirVJZhoNxK4DWfVZKbr1U0IswF5mXgW0AfldnQprFDTwKa+m/lQejo1zuG4epE7owRl1MBNY3ucaAlN2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108270; c=relaxed/simple;
	bh=p+wmq+X+KaHWOD5gAzZaUE2WvSh9Mf7oodpAKuTFrxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxrzMKoWxaZtYd794AWyvGLmtQTpaJXPUk+cCiZ5TJtt5IXIY5XHzArEdqU455HongMW1BG1xvH6jgEt6J3/7PjJ5z2wKML1g5OS2XJ6kMApTR86rmjojfodv4OLk4mhcWlq4nbhUyMIZnxZPD6WaR1pAHHyeMdUqly5C6CuImk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7nQ7zZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZxFWG49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7nQ7zZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZxFWG49"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hibva494915
	for <imx@lists.linux.dev>; Fri, 3 Jul 2026 19:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pe8ST3hB3CC
	kwE4BX70lYuVQgCSkkHxWMCKtiPgz/Ew=; b=p7nQ7zZXx1dyH2mXz3LmtPkSnUd
	jisvgy2NTifLo08O3O54R98wx1vDjNj0Wc6nkxAI5QmcWaDX4R1xcGtW8a7qUW11
	pP1Tmm1qXYe0QSfC3Y/udjscZR+Ph2P+KwbQihalCCu0X5gayaM/FZiuNqhKC4dC
	bI5fBbUqwcvvYugwPT3aaoSQw4Y+2vA+YENnTjr5fTDu/vYApw3jocaRRE8EBwwD
	shcNAKkygkP0VARnjPMXCY1b3eOOzmUQ/fIJHpQK5JTNcblKvr+H9jiOiBxFD/XY
	k9QsTa+kZLp8Khy1haYPvPKdydK13icOw3hF3M3xr1GuNNJUog1AC7E7Twg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jytmn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 03 Jul 2026 19:51:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38112fd8b48so983178a91.2
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 12:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108267; x=1783713067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe8ST3hB3CCkwE4BX70lYuVQgCSkkHxWMCKtiPgz/Ew=;
        b=cZxFWG49njLUkzyX6DJYoLxb5z82DzWI7IGoIMWaXZjsjURp749RbuT2+u0+LTmoDt
         PICwn7WNqAylIZrZrLFYVeAyYWCSfw9aoN1qyvALZYeFzKEK+3dT9APpVsONjMmFeMcd
         pgJmnBZ30qYV8wiM0iBx5uN7hfgxPW8xXEWTAUd/u4IY0Ks7WJVBibOrA/pk9tjDHKW2
         Y3coldrzhwyrMQvr5j4rlxgaYPupI8y4xMs4KgzX7TyVwTxQgxnbrkOfrA4ihOscu3Ge
         JQMwMm/ZY4w94Xd1QeCpHMHyHNkb7k2+oAslod967E/gPbv+5RaEQUOAHrzWZOE3llmt
         R2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108267; x=1783713067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pe8ST3hB3CCkwE4BX70lYuVQgCSkkHxWMCKtiPgz/Ew=;
        b=kl46pk8bL70Yk+z2hPhquDD+2MySi2uvKDj0tgeZKZuZ0lfQ7KlHU81vWKMf26jrup
         uCpOCRm/zRT56c0DvGQOtMPmM7IFHNlbE4Tmjd8LVDuwShm+BEj7Nhrk91U2yrTOmrbJ
         bOZve3yk2UZ9jHzvr8kAWfKyEt56Tn2fCr2D9HVb6aXNkmkp1zJn7mvuGTkN45++X5pB
         /gQvLRcClFYp+k9wSlZI4LRVswxiLkt9bvxsX3Rg50+/gZOC6oBptrZTPcbJ39G0L3Y8
         fkh+EqkP+6BQe992uftR4W0ugaeLKQx+tS8gGRN7zLUIwK3KTkfIKofgUnJfZ7HZjkbB
         xhWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEaAXaZCRz65u6TqIpkwvPWH+39UiprszJndg6fdDYPQd7vNMOCn6CXdBQuxqFAZjcyOM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwDIcgPpZx14hvS62HKjqoPI5LhBlDB9Ky+xGIS5IB/rRVivQz
	xEtf+Ya4uy6JibhVRoLtmizvnwqFLDVJQmwTvpoaKpARmW+5Twq8hOM7+XF5bvvpkQ+UkfqAv7x
	/XcnhmAdUY+oZf/wMy9WxTblyTNfuaMUAjToUfkWPSXcQvlfvTfBB2pI=
X-Gm-Gg: AfdE7cmZaTESeKfbyN6XY9tawMRuLximKsglv84G73IcnMpDqzC8fD7B3/wHKX2m0AV
	nzWjNClcrc4imdCkn5XgWDiS+DOljw3uahqX7ExrsO3tUtmZtIlEX8jXTduYXJEp7iKIeZONg86
	fiIVsVKAaqzfQBra8LfyogJYVDnzjCXlE9meWBpypAkplQmksFjOdGjrvsVXLJIlZrf32yDNjti
	kSUl2XYcgh93XD48YLgGyZWomi9cHx/Gp2Tobe+MBy0geYQl+ZFgfXxSiH35lji5PPjnniEf0Gp
	W25+rIP6jfoQcEB5h65Ru3pskIEQFJ8RpcvogbGETq1XmiPDQBT5Rro550p0H/PsuRle3eqCK1A
	taEFQsGuP7+OQK2awA2tfxTkeAa+5xd21b85obQ==
X-Received: by 2002:a17:90b:4d0f:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-3829f4e8432mr819405a91.24.1783108267280;
        Fri, 03 Jul 2026 12:51:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:381:e73:3c2e with SMTP id 98e67ed59e1d1-3829f4e8432mr819306a91.24.1783108266647;
        Fri, 03 Jul 2026 12:51:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:51:06 -0700 (PDT)
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
Subject: [PATCH 29/42] ASoC: SOF: imx: Use devm_of_reserved_mem_device_init_by_name()
Date: Sat,  4 Jul 2026 01:08:42 +0530
Message-ID: <20260703193855.110619-30-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX8x51vji575TB
 OoLw55njspCf1i2nH4bwwKCrfmSeZLLL8QI81L90U0Di4p/5EqVf068Tu2d9lQXyBP/5es7tQWC
 dPE4ABNP6dd/9/+DALxq+HMD4XxT3h18LwsIcsrAx/I2haa6FLbOi1YVmtQ0Wuh1sLqpLoc3mh8
 PXFS5n0oRPzzeLzhzGt2DSZLsLUDNfYDBFZ5Gp938sj7p/yS2uKkllgfnoGy2TNRfiMTR2hqdlw
 GmFnJFKYGRQosSKSODn15S9BLA9Q1HWDnCml+nsFd9191FP7eIkrRFicx4OKDPDU5T+XGXLqKjo
 Ipz6SSbTQfV4nOkAnIBC3SIC4ae5N1M3rKBvQCkV4BNJJeaqVZXECxNIjFhmuIGbjK8sO63A5LC
 DaGmKl3m638DGPGGbN2S6baeBgEbBy4xEfHE7Y7SWEkyvrIDW7iiP9FkM1A7rOA9sKvcXHlJ841
 suPjI+URx82hV5RpBVg==
X-Proofpoint-GUID: cS_yVn6YKoOVJD_YzNbPNAo1EzUCY4LO
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a4812ac cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3WP4xAbIaamtf5A8kHQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: cS_yVn6YKoOVJD_YzNbPNAo1EzUCY4LO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX9rqtoxU+78ig
 HP+zMxzFUnqlLmXsW+y4Mab4iSJV4Np/STLnucSfXdwDi/P9buaEwTOo16ci5uH/p4cu7vyAptF
 UlCBQbn6S6SdsLvN+EXaDAMCoQV9JXs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init_by_name()
instead of the manual of_reserved_mem_device_init_by_name()/
of_reserved_mem_device_release() pair, letting the device resource
manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/imx/imx-common.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 7a03c8cc5dd4..29314022c11f 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -330,9 +330,6 @@ static void imx_unregister_action(void *data)
 	sdev = data;
 	common = sdev->pdata->hw_pdata;
 
-	if (get_chip_info(sdev)->has_dma_reserved)
-		of_reserved_mem_device_release(sdev->dev);
-
 	platform_device_unregister(common->ipc_dev);
 }
 
@@ -362,9 +359,9 @@ static int imx_probe(struct snd_sof_dev *sdev)
 				     "failed to create IPC device\n");
 
 	if (get_chip_info(sdev)->has_dma_reserved) {
-		ret = of_reserved_mem_device_init_by_name(sdev->dev,
-							  pdev->dev.of_node,
-							  "dma");
+		ret = devm_of_reserved_mem_device_init_by_name(sdev->dev,
+							       pdev->dev.of_node,
+							       "dma");
 		if (ret) {
 			platform_device_unregister(common->ipc_dev);
 
-- 
2.53.0

