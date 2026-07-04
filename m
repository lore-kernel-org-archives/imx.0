Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97430568F
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 18:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783190006; cv=none; b=tXURAbg5WR1LltKTbyCJVucrc3wjXmFM3KBovgurT83e2MJfy2e2jhC5PV2svO8ayj75usnCVRcIJ1wsgNFb+BpfmflBrQX9YMwn0oB5AT91MFh1KcFTcb0ffVmzGL+qHZxo6OVp4MUR1lFdZwLo+IZ2jwDN0gi89uUkTjMdOFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783190006; c=relaxed/simple;
	bh=X0UwoE9ZxeInLb/TsbQTXm8HFa5R2/0dvM/cIQQ4UA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FqTLu+ah0ycfvVmJT3LtKyu8NuPaMrETozXPdqrclqZ6X1wzq8PcoSDeJgAFTA+Oqt8jl+H6iuUl+Y9KipPfZhDjjDPrlyYcKC3085xzp8hYMq58QbyslrTCmG5DvQRfg7/Wi3BcDybpbmRmDVyAulbncuI28ZRBtHm8QMpYGIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAoIYFLi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqfEr1jD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAoIYFLi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqfEr1jD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8giA3236676
	for <imx@lists.linux.dev>; Sat, 4 Jul 2026 18:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9o/IQZq06TE0+/STQz+x6iRc27qZ5OMF6+HG6X3OyU=; b=JAoIYFLieW2sulob
	8aKS9YKc17lyfb7CkmeQiYpno8SQEG5nYVlB2llF6oJ6jwMVnyQ3d+KGfvB4W4DH
	GZyHLai4/8DV1JBbnmoHe90LsTRqlQS3Nu8VfpFis3FvhONuKHSAhKid03HvVmcF
	BR7uU3TTQPutgDXECfOEHCyox2dbQiV7g+MKxnrcBmUQcur2B8CxZSmdFWoJJYmG
	TJB4Pk9pQPuqNJlT9bQxqfANLuIW771S6dai19iy1YU+s2AVfvymkJk6qipOrE1y
	b1+ByW4lEXfIKKI6m+ZVxSF5QLjt831FP0iy6aX8qC91V0Td7yh/ILPUkmBNWF3A
	ykGHbA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgh7n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 04 Jul 2026 18:33:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8479586724eso1232312b3a.2
        for <imx@lists.linux.dev>; Sat, 04 Jul 2026 11:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783190003; x=1783794803; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9o/IQZq06TE0+/STQz+x6iRc27qZ5OMF6+HG6X3OyU=;
        b=GqfEr1jD0z6qOj3WzK7W+550vxAkQ7a9TPhphDZsdGvBLD4EOWunFrytIkyDpGzexy
         wvrAEzIOCf7WCDP5mjit4CLsL7ukXixf6gs0cb0jbzQ+X88dp11Wxn//ZjXIdoKS0PL3
         3bSfmTTRsPmpDNdB23DDVTzj+TFApbDeiP1Mc7c7ip+feDo9Bw0gsagGWZ9VU9p0GaTq
         ype8wAqRQW1HibLOC9S/HBTC3EYbaS8/aKzCUuGWm1BGugepxGm9D4cV2383ANSxXrCT
         9nCo3/BqmO8xP+JlftGkmNPpsF8taYT2oRHRcO/M9eBNlP6z3er0v+eQQBWQI9/nrKVg
         eCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783190003; x=1783794803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9o/IQZq06TE0+/STQz+x6iRc27qZ5OMF6+HG6X3OyU=;
        b=W25nVDPFJEioozTczeHMDuHm1sPtit8j6/8ZpoDG1FWuuPxmjnneoSyjVdOMhX2vhj
         fJWUMxWoGMLg5CpjU6jtNRIRM1jNVPO3sSPwPE9kvNxsPM3VcRgNRWby8EsKAJrMUN43
         srteWxSRSTx419PhiTncuuLMU/k+tL+C72YFcyNh0/um1/mHINmK6PDnaQiy7uhNLL93
         gXapMTipdHd48cjBuVibPbOdUVIN7t8BhQivaCiiFJbYXSBNUCIn1MeLZhD4HOvJkV16
         Rfl/WFK/xRqQ6CMUuxE0PDUsGuf9AesRrYYxTBf/Tnnj8bbaGPruGkjlTdybvnqW0flq
         +SHw==
X-Forwarded-Encrypted: i=1; AHgh+RrJab9VmE8X8JL/or0+N7a8NeCCoK/ZjCSMANT5YGZmVV7rc+gH23DWEDT3G+dYSD+MqC0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvviPjU+wGH6GXvh5tlovMAaVrSXC6VJJW26TmfIB+FuOI/hPK
	81AvuN7mQUpRisN48k3sbMR90pC7ZsEiYFcD9iIsD2sG+tAgjENMjZ2Xhx4U0d/PO1pywoMSeik
	adrCW5qR5+/4F0HnZ/0R5eqSZfisChBE7Bzt2kHTHhJj885zFy+0Fp10/ouQ764SCsv72
X-Gm-Gg: AfdE7cnZdmzSq3b3swmr9m8PxMLjE9cURPhiJo3RydS4g7zSgRyxtYixso/Jsw4qaoh
	JdGGVQpArs+waErz3Ow/exdM2RuKamlcALIsAp5HNaxge2GyMSHX6QJvSnS3p2BXbs9Xogfksif
	IXIP7woPCFQYobenfX7h4CbbG4ax/pm7byMQAcEmo/FFU9z8Pu3VSelZCT6RTDYsMm4y6Zw70U1
	NXmzT/D7M1zwGAq2vyNpaHfimFuudil4ULa24Wj9Kd+ZyxaibCtC8JQGfQAnDPlrylEavxvnMIK
	4PoFnIWyKf79in+o5qhCU2HpkvStlWT7lumrOsY3FkyvBBXjNZa8OKenWDTTPEErDsRxp9jE1Eq
	VisQ15D41OdE/mt+CYjc7Kxo=
X-Received: by 2002:a05:6a00:1399:b0:847:9518:a6fe with SMTP id d2e1a72fcca58-847f6dd54b8mr3903002b3a.26.1783190003089;
        Sat, 04 Jul 2026 11:33:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1399:b0:847:9518:a6fe with SMTP id d2e1a72fcca58-847f6dd54b8mr3902984b3a.26.1783190002572;
        Sat, 04 Jul 2026 11:33:22 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:33:22 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:16 +0800
Subject: [PATCH 7/9] drm/repaper: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-7-b4e1ca053623@oss.qualcomm.com>
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
In-Reply-To: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com>
To: Alexey Brodkin <abrodkin@synopsys.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Alex Lanzano <lanzano.alex@gmail.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=7683;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=X0UwoE9ZxeInLb/TsbQTXm8HFa5R2/0dvM/cIQQ4UA0=;
 b=3r4r5kIqIqgZijf/Kqr49p7Qlhtwg622PqfbalukoH6sC56FcuoGH9O2XainORoxzzo+57CBd
 48iBMIor2dOCYnCxiNIqiB3V0iSu79Fbb/lbiQqldwHfi0N4kpAgnXv
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX41Vxzemk6IKB
 tL/5R0T3ZoRHFoAY3qZJKkBd8ufVERmaNAIPEak5U/5lGGKSJThrGRHvKApT7GKBhYo1NaEexdI
 erGFZopssBeRa95tlEF6IjK2HqGIIYU=
X-Proofpoint-ORIG-GUID: eZ3K3p1wQebSLAfPUfGGF_c3khPlxYbz
X-Proofpoint-GUID: eZ3K3p1wQebSLAfPUfGGF_c3khPlxYbz
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4951f4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rSXZLFMjQQqjKu18WoMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX72TQezmXW1Sc
 GLxBcss1bB3P8PfRSbXnnJRy7kYcRMbd4EE2lWdMt2Oph3e+v9Hiexfyh+3c9MGHn4WF9Q3dMbQ
 wqR7/6osc6Vd0HWKvlSKs2st9Nc3HJQafg+U2Kpep9g2XWj1koDE1eKOuBRdtyWFQVpY5QJHz92
 rCrt8agWEDvyWjgAeqUUZnnQMFuu9iie1jxuiNqX7+oebNl8QSNfyY8T00eq2GWWHcs+PlkAAGN
 hJvUAFrQwqONOX2o9vLmqgJmHIRfdLACkrvblt3qnOL9XlzzzMr4Qxwk3bxmal9fFjOUD5jbxrI
 66pAscC8qZeeTdKbaJTxjiQhJbWAZRA98ENqDhMEtvHoBAOVNowiRkAOqIegZA5EtFFP0Q07+nb
 yRUMcS1gFBmcbWM7qTsnRy6LBQcp8HaWp0ZfnFll7LcfLMCq8SUvA1pQXyLiLXnuNkT/gLMujn1
 vyC+k5P4JQCIhXPZj1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192

Convert repaper to explicit primary plane, CRTC and encoder objects.

Keep shadow-plane helpers, framebuffer access handling and no-scaling
plane-state validation from simple-KMS path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/repaper.c | 130 +++++++++++++++++++++++++++++++++--------
 1 file changed, 105 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c8270591afc7..23be9c762803 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -22,6 +22,7 @@
 #include <linux/thermal.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
@@ -38,7 +39,6 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #define REPAPER_RID_G2_COG_ID	0x12
 
@@ -65,7 +65,9 @@ enum repaper_epd_border_byte {
 
 struct repaper_epd {
 	struct drm_device drm;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	const struct drm_display_mode *mode;
 	struct drm_connector connector;
 	struct spi_device *spi;
@@ -622,26 +624,24 @@ static void power_off(struct repaper_epd *epd)
 	gpiod_set_value_cansleep(epd->discharge, 0);
 }
 
-static enum drm_mode_status repaper_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
-						    const struct drm_display_mode *mode)
+static enum drm_mode_status repaper_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							   const struct drm_display_mode *mode)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 
 	return drm_crtc_helper_mode_valid_fixed(crtc, mode, epd->mode);
 }
 
-static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
-				struct drm_crtc_state *crtc_state,
-				struct drm_plane_state *plane_state)
+static void repaper_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 	struct spi_device *spi = epd->spi;
 	struct device *dev = &spi->dev;
 	bool dc_ok = false;
 	int i, ret, idx;
 
-	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+	if (!drm_dev_enter(crtc->dev, &idx))
 		return;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -771,9 +771,10 @@ static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void repaper_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *commit)
 {
-	struct repaper_epd *epd = drm_to_epd(pipe->crtc.dev);
+	struct repaper_epd *epd = drm_to_epd(crtc->dev);
 	struct spi_device *spi = epd->spi;
 	unsigned int line;
 
@@ -827,14 +828,15 @@ static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
 	power_off(epd);
 }
 
-static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
-				struct drm_plane_state *old_state)
+static void repaper_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *commit)
 {
-	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *state = plane->state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
-	if (!pipe->crtc.state->active)
+	if (!state->crtc || !state->crtc->state->active)
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
@@ -842,12 +844,72 @@ static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
 				 &shadow_plane_state->fmtcnv_state);
 }
 
-static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
-	.mode_valid = repaper_pipe_mode_valid,
-	.enable = repaper_pipe_enable,
-	.disable = repaper_pipe_disable,
-	.update = repaper_pipe_update,
-	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+static const struct drm_plane_funcs repaper_plane_funcs = {
+	.update_plane	= drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
+	.destroy	= drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static int repaper_plane_helper_atomic_check(struct drm_plane *plane,
+					     struct drm_atomic_commit *state)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = plane_state->crtc;
+	struct drm_crtc_state *crtc_state = NULL;
+	int ret;
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	return ret;
+}
+
+static const struct drm_plane_helper_funcs repaper_plane_helper_funcs = {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check	= repaper_plane_helper_atomic_check,
+	.atomic_update	= repaper_plane_helper_atomic_update,
+};
+
+static int repaper_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					    struct drm_atomic_commit *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	int ret;
+
+	if (!crtc_state->enable)
+		goto out;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+	if (ret)
+		return ret;
+
+out:
+	return drm_atomic_add_affected_planes(state, crtc);
+}
+
+static const struct drm_crtc_helper_funcs repaper_crtc_helper_funcs = {
+	.mode_valid	= repaper_crtc_helper_mode_valid,
+	.atomic_check	= repaper_crtc_helper_atomic_check,
+	.atomic_enable	= repaper_crtc_helper_atomic_enable,
+	.atomic_disable	= repaper_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs repaper_crtc_funcs = {
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs repaper_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int repaper_connector_get_modes(struct drm_connector *connector)
@@ -1102,9 +1164,27 @@ static int repaper_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	ret = drm_simple_display_pipe_init(drm, &epd->pipe, &repaper_pipe_funcs,
-					   repaper_formats, ARRAY_SIZE(repaper_formats),
-					   NULL, &epd->connector);
+	ret = drm_universal_plane_init(drm, &epd->plane, 0,
+				       &repaper_plane_funcs,
+				       repaper_formats, ARRAY_SIZE(repaper_formats),
+				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(&epd->plane, &repaper_plane_helper_funcs);
+
+	ret = drm_crtc_init_with_planes(drm, &epd->crtc, &epd->plane, NULL,
+					&repaper_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(&epd->crtc, &repaper_crtc_helper_funcs);
+
+	ret = drm_encoder_init(drm, &epd->encoder, &repaper_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	epd->encoder.possible_crtcs = drm_crtc_mask(&epd->crtc);
+
+	ret = drm_connector_attach_encoder(&epd->connector, &epd->encoder);
 	if (ret)
 		return ret;
 

-- 
2.55.0

