Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC9C33439A
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 19:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107834; cv=none; b=eTBr2LvZMFhZvoCJvjNb0fWqmFd3MrynR+2JJ4hg/AlrK3SOaF7kbNnqddXnsXZFkae/ca/DEI7ZY4hpUn/7fJiHVpWZHRttp8wgcnxaNeslPVlgxrkpI2nU0/Yo72uAkLuC7Y3Ep6MAL5ulplTEtQRTeElXGsCQXKphL4FiVq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107834; c=relaxed/simple;
	bh=zR6KGG6/ye/5BvzdfcDU1hVmZYmoWsy3oRIIdPe1Zgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAEjex5fCfgr6WBB/iysh4ZfNPe2yajySqeXPOahA8lYz6T7uGft14XeojsR0AjCywY7HttojS1khgosC7ZvvVuGnmYcp68h7TFniS7STj4qBkGfOjuQkGpXcqw6mRyFm/z1ipUlkxf2Dy7UmBQs8FzOTH1SqNIk2eD6HMsVj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0ZwbQ4F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgTbr4QD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0ZwbQ4F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgTbr4QD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hibud494915
	for <imx@lists.linux.dev>; Fri, 3 Jul 2026 19:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qmmZAG95RTp
	/pup9Fv8our6A1N5cYoYLphw9GF6qKjQ=; b=g0ZwbQ4Fxp8RSCKppF0JkCpG46m
	IZL9lgpKtB2MG98fMp2Eetk6x/jUKWM9B4iLr2cyr0TggLUR42uycgR+HH6LVl1q
	qYaTOQFAA2HFvhnn09kA6DLClNJHb0JXw09KSUoMXJMm+0bW1nLBMzPxA86Vo40d
	IgZgqc0zloikkecM4YZLO9hc/3NBCSgblYtyVpg9UiwAyDqhm5Ayk0BIEVQXJ7vL
	wiXAZLl3svEFwMdtZXugflcoEO4rEJtFXd8dSRtQXTMK6SSN8GIzUnCNLmi4KNg2
	1PW6qN7usOBiMmNv3KbgswGU0zdTnq7gADJCvnJBxW710nhoN1OmKi1P0Ew==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jytkwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 03 Jul 2026 19:43:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c916d17dd43so1326917a12.3
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 12:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107831; x=1783712631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmmZAG95RTp/pup9Fv8our6A1N5cYoYLphw9GF6qKjQ=;
        b=RgTbr4QDraCmdjHNQuMS0RQy5BSzVTUIOs0r9hsFl7oi1SQVBCXBLfQcrz2qhLsGdG
         C/GoRfGm03rzjv1meGQ4ZSov+q1wMuKnTFuvBovdYw9e6BlF+cHilQut+p3tls2gxIlM
         hfLtUrSmyH1x7RViqvMWprHl5c569HXSm8+bPLVfRwxUtSjYkqfZ8pTUP/+CntIfpJbe
         5dkJRs3l7O6rk3ngV39E8J+riKW7oMJQz7oGssS5u2tenSqwJr+K/gU0/2JjEUdMus7U
         o8rbYvB1hecRcn0sg9Z3VIa72EvGuXe2oF/QYlir9RLx5oOM5bQjx84FX5yYvMJurF8X
         2Z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107831; x=1783712631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qmmZAG95RTp/pup9Fv8our6A1N5cYoYLphw9GF6qKjQ=;
        b=Km6Ru1yrgt6fTfN3zOjih/r0QrIgEcc2J//wb7IVEltM52STUpp+1aQJ/hi4KmLYsg
         46MijYPPDrDyhvx39r8mvObC6NBApfY7435+th9Ht/vKik59slgEqaVAoA+m7dHY5lhH
         LEvifnDPp0VG89Ufr0A1KiJbLkQtvRU5wmxaPNdYNZGWV5G7+VSkg88xtELebBlvq4Ic
         pVOVvwF0mCbKKt+W8CnUEqpI7QW5eNCBvMdBOSni3YHIFDPFqnyjk6Vk4cfMKLNbk4Ug
         KiakMtvJfOQWYFYXTym44QQuBQrZePgT+Motmkj0xzriW/yTJmI2Zo4OokWAjDiCn+rG
         eVxA==
X-Forwarded-Encrypted: i=1; AFNElJ/z+dAcUHZhY87GNONMoDgmvW+9uZri8fsiRyQbuLNinIyrn28VxFSu004XemDQwnfbX1g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgB61WKATXxX33BPH5fhgFhosEhC0PgxHi+5caUTQjsFcmXFnH
	ctRrxDp4W+Je/jd3erEKwOMYVHy6qMAWiBua2/hO7GRkIGo7uR4HwO6cAGhIv3HqDtSSktbNkIA
	Yu+R1GT5ptBaIJts00cnf6FEGAyRlZ8Gq2Zjz8qcwFLkIm8bcGgKp5YM=
X-Gm-Gg: AfdE7cmpVITgZguv+v/6C3Jc0E8h4omHXZBdBAhG6AMTo4cQ0Ouk7H2ssYUYqcp7SBv
	YzuhHoy+tXnuXkohSU22QIqi8CJ0SiE1PhdTr3wx4HtmJX/+h1DCtIUHJniBpkotbPK2kQxCzVx
	1EeopuXpq2CB9Vhv8V+RKHeVT+E5u8IlBxsz8K8hDkqcenJ8Wdl4IEt+1E42LHiUcBKAUaIu3Um
	NF/Le2CJdZ9slAcMREvg/D6IgOQ2Wie7qFcCs82IJaiD3czVZD7YL5PZt4mBtfSrl2/QqfKXBm6
	9Q21y+hGb9AeZ5IX5sJsv96lWle21XhP28gd9HXmCF3tNH9tcFf0t1ERXk+Ey1e9yYO6EZcY6tT
	reiXvbDRueSmJFXDaVFjJ5hKUingXK7DkdzkiDQ==
X-Received: by 2002:a05:6a20:244d:b0:3b4:8717:1c21 with SMTP id adf61e73a8af0-3c03e4e09d3mr691135637.35.1783107830580;
        Fri, 03 Jul 2026 12:43:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:3b4:8717:1c21 with SMTP id adf61e73a8af0-3c03e4e09d3mr691085637.35.1783107829862;
        Fri, 03 Jul 2026 12:43:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:43:49 -0700 (PDT)
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
Subject: [PATCH 11/42] remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:24 +0530
Message-ID: <20260703193855.110619-12-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX3Uaj0fH/P3I6
 Eo//61I7fBWdhxxlV1GGtTp+OYHHvGtl8YNqxtMcujq+k7zJnP0KAUbYrlWMtcd7sKxgkkK/1Js
 M8ejM3ZyN/lkyiAnqbuiW0QEQWnvwdjptR3MBQVAq0V3Q6S2BZgw9QbnUzHdmvKOd2NDBjyGor7
 H6V1SA3nQKsMXPiqdS8tAqfo6fbK9qWl9UvdxGzEYX6th4S041XRP3PREd9HHJpISQT3hCOld54
 xAMuj7Sz79IlsoNNLv6ggCFNpxrf3SSkPZsvowACBTXP06uPDQnAabA0nwIAtK2DaRQUgJ2vS8z
 vDBNX9q4ulmweNduRjhUG3pYE89Ud+ewgwRVzC9INFbokM9IS3JnP8wUoLOEPXHm2m1eQdk/61z
 wplIiIBaLNdsw9ati6MHpbOq5E6Mj05j4/JiyVysIzimTzq9m3OXpjE108+vdi52OjROF73UD8m
 08n6VJZ1bLhgwoeCMsg==
X-Proofpoint-GUID: F6wDoQH5e6gGC_shiuqyqlp2KraauuDM
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a4810f7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PC9_zsTzMDnykp_yU_MA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: F6wDoQH5e6gGC_shiuqyqlp2KraauuDM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXya+j2xRhnYVt
 Z3fB6Hqi+HMmSwydhp8UAneCd88KsPs0mo+T/6y8zc6V8tBFJBHO8zUN3WGmT87qecaFLr4ieQO
 nmrj5eCmXEEXIM9Cm2o82wivk5cMDuE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically when the device is unbound. Remove
the explicit of_reserved_mem_device_release() call from
scp_unmap_memory_region(). The DMA coherent buffer is still freed
explicitly there before devres releases the reserved memory region,
preserving the correct teardown order.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 85a74c9ec521..a4387649ad7f 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1027,7 +1027,7 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	int ret;
 	const struct mtk_scp_sizes_data *scp_sizes;
 
-	ret = of_reserved_mem_device_init(scp->dev);
+	ret = devm_of_reserved_mem_device_init(scp->dev);
 
 	/* reserved memory is optional. */
 	if (ret == -ENODEV) {
@@ -1060,7 +1060,6 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
 
 	dma_free_coherent(scp->dev, scp_sizes->max_dram_size, scp->cpu_addr,
 			  scp->dma_addr);
-	of_reserved_mem_device_release(scp->dev);
 }
 
 static int scp_register_ipi(struct platform_device *pdev, u32 id,
-- 
2.53.0

