Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFAF331207
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107642; cv=none; b=pGk/Voc2jyEXAXXZzM+HL4xEhzrwe7fPVJ1zbrbCh0g5Wiwq03Wsb+7ell1O87cN6DE1BJMK+BvKcNqWnXAw/VDgdscvn+hm2/eQ91TJhrEILroq0sdoBAZhTOhmFAB1PDTvEIaVIugzVJBs1fy1FuanexxzaNaDh7obQaJiXBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107642; c=relaxed/simple;
	bh=jjXYiWKnVTz6swCS/K2CNzKIYDZFmlPxmp8hx4XenwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBaIdJz7BkLvkC9jccZbVI8RsFXE3CzB+brJBK9zGzPVp/PvRRutSkdjFJk+i7WxWl1H/fJr5yKxfwh9YOUks4FGEYR7s9yEzFCn3q0F74Lo6LSgcVkY7+/L4ZvwVT57qvCInE0JSqdAFCU/kbtYCjzC1e/d+njQpQusovFX6sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8ZGLy0x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMgH8ysQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8ZGLy0x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMgH8ysQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiPVD545518
	for <imx@lists.linux.dev>; Fri, 3 Jul 2026 19:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zR9XRPc5AVu
	codt4jcddD2QULOfOq2FWZnJr+n7Dti8=; b=J8ZGLy0xXXuEjWJGW3BRjxYS6bM
	3+dbuT5zbOpIDAwUtNGrTXtoVnVWOwNUo6eIEA3DECCTEOtiBQ1DMFD0phWfoFf2
	dZFkiD8S7fenOGLkh0uuwz0ZkVjPa2JedzgOBGqFoBe+xMf5ZHKUOiSR5XFIcwzg
	mhGkObWbnIWinotY2TsclIJMO3qilpuGC9sJY+SB7NtO+LXzC21V17p4igcMbF62
	pjaIAo6TLB7y0l6+cDM1nurvPxHtA5vcKRXylW6Y4a/iQr5UqazN6A1IsYRX+Vhz
	/sKeBg0qQU3hsuEMTB5UiS1sB1Gi2oxTql7R/jI1L9tJWier4ElBv2IRhgQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682btqr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 03 Jul 2026 19:40:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so749763a91.3
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107639; x=1783712439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zR9XRPc5AVucodt4jcddD2QULOfOq2FWZnJr+n7Dti8=;
        b=IMgH8ysQyH3Z04Q+rZG/w1FrRSfv3/ZBlBCv294O4CLOll+3Kax3ThHwOKZf6gTLi1
         IGqPG6Lg3H0ZQ1jnqOSH+zp6d3Apr7bq9JuPVYzI7MlHXVWiibC0b8plGu8FFHvWyHPd
         gMKpP+mAI6d2jinH+zJ89FVbFGD8R/CE8z8t4wenCc5UKDySbaTJJArPL4IYJtKHRnHs
         X5YMC+smzkbBY21YEfRHQzf44BoF48BYFoyIs1dL2yymmFnddvf8XdOOGdgD9C2BgRNw
         Q5coxKxnx83SAUs7rDVTUSq+yFm7GwR06YHsqJVxn7uSq6FIHf126rF1RCKWnF13vNZR
         rgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107639; x=1783712439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zR9XRPc5AVucodt4jcddD2QULOfOq2FWZnJr+n7Dti8=;
        b=ThkAuyhREkdZpHG7uP3UZsNsDYauppPbINMMVX7cNblEqVWLSSya6VBAsXZnnVtK9w
         tpMS7iF+joIpjcNnQuSl/I1x263jo82KKqaFjK8Qq2+HhYkdOt3V75Z7N51wU365Em5U
         kBVqlnvGOeBles7U3UCNlcD5hboemDqNlFmLwwNDuEnfPHPAqK6nh9n60m4jnwYeCNib
         w8t9J3w0BlDVb74CnL81QgCWLXGHBEq1dTBb7FS6hdWZkQuHVrP0vMNAmNZ8cRCFbbbp
         JWSCTrVGYcbB7mB72JOBQLXpqg1mWe8gHCmu3vWD1PAXYDAqHtuTxV8Jd1eyNn0Y+d8V
         yr2Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro74kYDogkzCuoaEffrsFx04xa020G+MGoMlY3rtdZLN6TpEfgfMSS60SebrEa2x697WIk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFnqdDCWvwwsvHYwRLd9ZB+wGmgU+eeB3inDZq/EoAlitwL8i2
	xUirDBMyhBpbNDNx8wm8+9aMxSEX5ON0gvAQde7Une+1Kcdb8hhJAXmA4hQrHJo16ixT0xVF8NG
	2T10g+iSoS36u5G/kpPN8zVKvHYQdUQeJXOyTwYXIEkPJkcXTczU5/5I=
X-Gm-Gg: AfdE7clrCT3BMmDfHa7gpiJiWbC56fGWDcDclFbzUH1Nmm6xRjkCsjrLnoXdABJJEiT
	LZ37mXTZ9amxr1Md6raezAytvXUE17nWt0b+PrRMCvETNQ+WVSKsRmbSDd/qti4xzN3Nc5ZOlAS
	tOSRCiMhMhP/VyRA76gmVJZ9BID8JNS/PhhB7gltRGzA+3XxkZAXIxsUpqhMPskA4riUcP46t7D
	/XdSc+yBef8JZC6MZxAfNWPo/PaX+1Nsad0tFPCJdWzp1tB3GOgLcjfCx6DlWhgr8/aZdLyA4/p
	EzpT9Ri4TDWJ3YHgvxEc7PhWxIwxoUTGHPCq7eplPfwv0BjW3qfyhq/IMiaidXyfXEKAlo3nOmR
	QHx6CKAnW4OLOZ5bXR659DanifBNpXkI18IfzSw==
X-Received: by 2002:a17:90b:3808:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-3829effb428mr834272a91.24.1783107638327;
        Fri, 03 Jul 2026 12:40:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3808:b0:380:8b14:d8e1 with SMTP id 98e67ed59e1d1-3829effb428mr834169a91.24.1783107637623;
        Fri, 03 Jul 2026 12:40:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:40:37 -0700 (PDT)
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
Subject: [PATCH 03/42] firmware: qcom: scm: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:16 +0530
Message-ID: <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX6ALCpIKsTgPk
 /t9P9JJ/T7SX3QFQSr8CIrqC7dQGy4thjwy6WBrkvlZOLDZjrReiieZKHHFa51BpIs9VFMdpfPU
 LHHbicoWsfUMX/jI5THpepAAhIVfJU4URv7e7hbp5piPNOb/B2r/0v36qcOZGl/6TXIzBebN/a8
 BYJ5R3kSKii6W4mJJnzw49gBRZb3miHOJo0NQ6CKIawtFdbGXnUNOdAELcVQScc1RHG5PJhl5hw
 iaycclLL7tIV/dozd/GBdQtTabEvdn8+Vnmq8TrTgm5/M/wAWHpwSAEDe+OMIRgMb85RkWjDTEa
 pILhaosm6rbprJwJOFwuG9JmshENdJnDWWDCbnnwM8d9W51P7xuldm2ExjAKPz1Q+RfhXjVhbXX
 nYSZnkOd1h6+Mc/HwjP3m6YSnQ8NKpNIwBzTkB30Ua95hRedDco+DRRh3O6QTtkbpHmBVd/vu9x
 LaBEsGtg2P+km+ERO6Q==
X-Proofpoint-ORIG-GUID: 2GRoCJd_yiRaewLjbG-zo7eJ5ySKMrcm
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a481037 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-SVse2xkFbf2KMwQCVkA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfXxi3KZxp4q8cX
 L0hvi4iTx0ADSXIMOQaftbpOFvMdUSErxsnQYajNObTngMrc4EnkUvZG/tyrwqfjzlkdUSHGtUi
 jIAzgP5N3wjdZveaQgBWkl0FP9xHTHc=
X-Proofpoint-GUID: 2GRoCJd_yiRaewLjbG-zo7eJ5ySKMrcm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198

Switch from of_reserved_mem_device_init() to the new resource managed
devm_of_reserved_mem_device_init() so that the reserved memory region
is released automatically on probe failure or device unbind. This
eliminates the err_rmem cleanup label and the need to call
of_reserved_mem_device_release() explicitly on error paths.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 26bf87247afa..0f9559b9cc53 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2779,17 +2779,15 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(scm->dev);
+	ret = devm_of_reserved_mem_device_init(scm->dev);
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(scm->dev, ret,
 				     "Failed to setup the reserved memory region for TZ mem\n");
 
 	ret = qcom_tzmem_enable(scm->dev);
-	if (ret) {
-		ret = dev_err_probe(scm->dev, ret,
-				    "Failed to enable the TrustZone memory allocator\n");
-		goto err_rmem;
-	}
+	if (ret)
+		return dev_err_probe(scm->dev, ret,
+				     "Failed to enable the TrustZone memory allocator\n");
 
 	memset(&pool_config, 0, sizeof(pool_config));
 	pool_config.initial_size = 0;
@@ -2797,11 +2795,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	pool_config.max_size = SZ_256K;
 
 	scm->mempool = devm_qcom_tzmem_pool_new(scm->dev, &pool_config);
-	if (IS_ERR(scm->mempool)) {
-		ret = dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
-				    "Failed to create the SCM memory pool\n");
-		goto err_rmem;
-	}
+	if (IS_ERR(scm->mempool))
+		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
+				     "Failed to create the SCM memory pool\n");
 
 	ret = qcom_scm_query_waitq_count(scm);
 	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
@@ -2872,10 +2868,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	qcom_scm_gunyah_wdt_init(scm);
 
 	return 0;
-
-err_rmem:
-	of_reserved_mem_device_release(scm->dev);
-	return ret;
 }
 
 static void qcom_scm_shutdown(struct platform_device *pdev)
-- 
2.53.0

