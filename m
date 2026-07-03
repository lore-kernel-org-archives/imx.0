Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08003331A61
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 19:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107810; cv=none; b=DAcd/RiexATVdl+gLESH2wMYoKr3h4A6eRWt4H28ekWA5rrAjO0HSV8wIQ2Y6XLCnskWD2bq3F5fIHtr/+tVpBIy1lh4IcDQ1yLld99wVFvivcSTDOaswDBRCPL/7qUgmVJKTAf0Vp0jlFd8keEe4JULH0wvLivtVCvh5nX0wBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107810; c=relaxed/simple;
	bh=so6MW8lL0On5dP1UN+ooRHBEwT1W2FhfHQtdPS4G+WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEmCGa2RFk0Ueyymu/N0GiHgilQ9U65WC1WnL3hmw2UK9jiucR9j2NzfFKXffx0RZVJ8ev4iwJx3tK9ipXpTQQC2sBweo1+k63F4ll/SY1UrsDTVylN/1ABwTBz3j1t70HqQ1gLg8FPuW3THQLAIeTMOPnegAkWLpomT4+0qhLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOeTG4ty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gq4hSPgd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOeTG4ty";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gq4hSPgd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiLfp546530
	for <imx@lists.linux.dev>; Fri, 3 Jul 2026 19:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bn4n8Ensq4b
	2jWU5voHmUQF7/CVhT1UW+T0M+N3rGrg=; b=nOeTG4ty30vKw+ttbYanSVJ6ILE
	BTAP2O4+nJPij6iXWRyXJ6gBds/5MB5tBMGqFWh+/u8gKduK/0McbMFjobNCnuzN
	1y+6/ZZnKyZ62+pPM/DEC4Iylg8Krq0wAPqD6KdtuGk+Zdk4DKUeyMhiXbzJYdVL
	bIj/QJM7hN5BtusgbHD8m9xNThogT6wHKhQIkdOp/hbQypKE27fZgHchGeO+1BTT
	VPUpeh/bBZI59ScXYRgw65wzTgoMMnoJmFsZzRgRsYFyWaGGYCwKpfq4lPUztwV7
	wVHDf06/SCOxR42J2Z9vbHr4UhAdTAjtbJeXNkQiLE7+wIkknP7olxo/NEw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j02vks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 03 Jul 2026 19:43:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38108fb9d83so581539a91.2
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107807; x=1783712607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bn4n8Ensq4b2jWU5voHmUQF7/CVhT1UW+T0M+N3rGrg=;
        b=gq4hSPgd+SXQ+FNRPdrKKP9Iw1Zv4yZ1bU6y5vdQtT9oYqJEeS5FuU2NfY9AqJFV44
         sveoUJ3rs6Txq7hkkt9WlrENhGb3aFlTveSEdGnY8iFTmn46p7oC7iyhI3Qz0OQPAqKd
         qMx7tnir1aZLKLxmPlCGHCR0E2CL0UcWfF+EzK3ExsaZMpDG/nuP5UetCBeJ04+WxtH9
         axcVVasvMWJExSAn8kDvWR5xQHCJWuT6Sg4N1GWNltkIkccs+O/LGYGhCq1JYAwHJ7xm
         T3J0nMlAKZsVTHQreSbXTpnMUbViFuUtdVYXBfrN6JYlUIySq8D0R0okakgz7ryHHKWa
         0MzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107807; x=1783712607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bn4n8Ensq4b2jWU5voHmUQF7/CVhT1UW+T0M+N3rGrg=;
        b=hjeKvfJ8hEPxtYv2X6HBtWVZqEymIGiVnhkLSRPuxpsx4YnKR+paIQiXD0BUaqrKXk
         0YJfW9YX6UrC4SYSq3tz/jvaggwHfGsIZ4d8HBMs4tiSkO2HWE61RKkL9anR9Tqo80Pz
         SENHGbMX38juhjRxr1u4Ypfn4wlm2O787q1qCqp3qntSdyWfnVAEXHT2CifoEkUC46Uz
         8+tywQ3KvGC2lDKQ69MWMLCVh/z3rY+LrNWkca8ZXGK0iPhUKZ1HQ3RfL6b1bSJkdAW0
         nkE/qfqExYcVNdcym4ipDJMaMQF63sFgXevZZM7BO1glk3mQV7TYG880ZxZPsbouoKwl
         CsYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrd3jGJ/ClEeM42uGwCaFL+dtnFFPby+MLsbozMH1PLvUbuHcJyNYo6pka7BXBAvctyljQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOBtT/SzUDfbYMP/gunNALKUvaOnwDf9xH0ukwVEP06IjYsTWg
	QhOZIk7d3MV9XjaIM7x9EayH8PmjIr0/Dp5y4XBlYQY+xIDUt80GwwoofeJzxSuCykE0wrbui/K
	jTadr/ezuarlsvByreH9FmijsYuk7SuQrs3nAyflyHo0VFq5rQri/Ysw=
X-Gm-Gg: AfdE7cnbEZOHvqCFZxKEQEYzz3agqyLo5iqsB33pjUIpp9ykVmfPge8IK5p+W6bS/7I
	JxHJ3fAiki/NoaYW4rW+AO/30ZjlBs1LyCG5T30TO234hwDx18VwyNZt/aWkUXUldQCp8e6z7vv
	GxbF04KXUtpcmCYs8OsGOwgN9gdIRA8AnmEuytGJE5SQrPUnPB4HBgMFxbqQNjA/KXpORjgihOf
	/yEWSZfNViRsRLWeyQR0I7QYIjK89p4TzjXrCJCJo21ZABMk7u+MVUVUAiHUMcA3GQPFTSSWV9G
	T50MZuvA+HHUTNzqt2zuQ/gkXCtBVokULh0F+G0vQ2FCkWzEQi4Nh0njUZ63oLm19omjsRGaZF+
	/qpw2u5AesRR2RwJqiDOeXBBUXMG0AegR91hr/g==
X-Received: by 2002:a17:90b:48c6:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38280e98cfamr773030a91.15.1783107806465;
        Fri, 03 Jul 2026 12:43:26 -0700 (PDT)
X-Received: by 2002:a17:90b:48c6:b0:37e:2005:6507 with SMTP id 98e67ed59e1d1-38280e98cfamr772970a91.15.1783107805852;
        Fri, 03 Jul 2026 12:43:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:43:25 -0700 (PDT)
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
Subject: [PATCH 10/42] drm: pl111: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:23 +0530
Message-ID: <20260703193855.110619-11-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: bv3Nghf--FYFnKoXMrwjAllg5wlczzb5
X-Proofpoint-ORIG-GUID: bv3Nghf--FYFnKoXMrwjAllg5wlczzb5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX7zdcNw2z4GyX
 Sr29mO2AJm0rnn2n5VpxfjCJ3XCI+BUdOHW5VZmp8uikaUUrja2lbdRTIw8kzFZHfiQEm3OYgT/
 MA3aCGeLGDM4vFV9NgA2JVhWS7Kzi2o=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a4810df cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ih0ztwYHz3j8HjU85xEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXyrmMAVBFw3rB
 S+BedoTWcGIFtEewkx3nrJ2SuP8gkJTNevsCZxSCLU5frZhMxdp6ZiUWFbs+d41f0U3pAD/cETt
 KlnedYRuoXDy1jA/SIquHs9xz3ZCOIlz/GkeXnU13qrkrNne2D8U55he9Cefj63pvP9Lz+z9m4C
 jzHsf6Jkq4/TRAgNmMIi5sBd5ywQ7fx9ecq/wvXbkxw6dMprozjAl4pzBzj0Ap15WFTgPWeJTjq
 VHcYVDdYJ8ew3Y5bWtKKgnSXWxTu8FXKvcb6iCQM0fENZ+bhsK3omV1cMhcibabA9HVhJNpH8WR
 y3zrIPJgYx95MkZJQnI8C1HosTjKrLx+tZbJ4r8plC/0r8tZVyCuwDoCgzWhvaX7hSJV+cGn/nw
 9mC5jyGo06+bn609ZfZZzhq+fVoShD68P3kgKWDTaZwzBYJQMGR8TLc+bq1PsZPan5BtE8hHmRM
 S5twcoEKkmieIfdLLRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the explicit of_reserved_mem_device_release() calls in the
dev_put error path and pl111_amba_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ac7b1d12a0f5..25ce37a4e8bf 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -254,7 +254,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	drm->dev_private = priv;
 	priv->variant = variant;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (!ret) {
 		drm_info(drm, "using device-specific reserved memory\n");
 		priv->use_device_memory = true;
@@ -313,7 +313,6 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 dev_put:
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -329,7 +328,6 @@ static void pl111_amba_remove(struct amba_device *amba_dev)
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 }
 
 static void pl111_amba_shutdown(struct amba_device *amba_dev)
-- 
2.53.0

