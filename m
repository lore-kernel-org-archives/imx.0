Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772393F54BF
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192621; cv=none; b=mGN8Y7rktFi7C0idSIcLCrz+/EVEXfu0s6RIGkekLLfsLxPhzDPo+KXmuXVCDt0bZHpCg4sWuklk9gpGemW0SEBTaY6mppMW8OMbdGlKtYicJT0SRxtNKgzrpiQF9hs9xVCzroWWCDyQinaN3yLL1DsZHiwV/xJ5JfwUirx8bbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192621; c=relaxed/simple;
	bh=ERhc4h2BzyHq4SLA1KLZmwEBYZNamx9DmYFgd02zfJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXg5/618ts2TjdsU1jH9LDKLKwWbk8dbtSAmN30YdUMmBWcieSBHeyFhMniqSSY5I9L8k2A/14qp05t48OuEXUuYP5C5CyJdQjfBXpIpIWd2tzWaofFcruH95rFzevmsrGjGUGNsFFoxliOcT17ernu42pgmxXb8FN8/iyR09bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmdPtyHr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgcEiPCR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmdPtyHr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgcEiPCR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DPU22193550
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iNA4KkLXptEcrV9SWqVHRxO4EssLZecMFzgSPlpRjI=; b=jmdPtyHrCF2ywVB5
	hrIupyUZanurfxmEAAZZ9jT2a9GiC7DNBF9beXbCihI0oOgPiHl6BO02ffL65YC3
	Ml8DHtUml5SlEAFpiJH/Dtb/oMSdbQmCltUTV0UCcBQzR6i2nSupZUHzgs53gvpf
	0CuwKKNG6m/2oUZwVF1Fxj0qGjRKn+D5sauSFkjNF3N0YaT04xnKd2NO1uwOBkIi
	7jGDbMssRNsnFvcksJU8BVY0/XvgQQMlH4mgG3CboAdbQk/WVYgn+vnXsWdCZfnv
	1lr0LgmPqqPkzSGIBnWZL8F3BCDLwKEn+Jq16zrFVDveUw8Rq0C7x0JhFggTEvZv
	UBiZwQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf0fsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:03:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacf17c7e0so46096035ad.0
        for <imx@lists.linux.dev>; Thu, 16 Jul 2026 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192611; x=1784797411; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iNA4KkLXptEcrV9SWqVHRxO4EssLZecMFzgSPlpRjI=;
        b=RgcEiPCRJoEYdg023JECMQaygFJjplKrOd3zj2qw7wfo2VJcqf7QbPb8FOuqzLZ6Nr
         takUkRjmZfQ5cZpB71yj6bGm5yPeWfTQzh6/0HlLJLpd0cSAX5kkD+rdJ7WOCMFeuyRO
         uWXmD3kyH2RawiZY9tXfpqzgQZrNmSLjOjX5118S2CMDAE9rwl9MOm0SCLTVzNs5sAuW
         q3M6xJjAxLnlXd3G7KkSOb0FNrORKORMTH0x8W3atmYc1EU2eTEgwk9Ab3VWAErNnYT6
         fmcE3ybfZ2U4UhJ2ZiM+2Acfu9cgSSQS6MciCoxfbSa1py0QCPpKvFPRCTALJW/ccudq
         +o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192611; x=1784797411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9iNA4KkLXptEcrV9SWqVHRxO4EssLZecMFzgSPlpRjI=;
        b=a9dHMBKmT25r41X2Mu15Psy1bmyX/RJMzemMzv0YalNz0SO43/ox5DroNUVDDvNnoA
         Nyr46vecek5x9h4m8x8jV6+RkUSNLvK5jNlF14+B4BBFk/r3qXtjhv8DCyZNipst3NxL
         Q9LbNyJQvO6X7qL6sQk1AfIpQApUNegEawq0pRWAp4PFkIpfuTCxVRxnct21DQ1Wu5+i
         ge31lzLdpdUV7FfHrrjhR/rs3rAf4383UzFHg7Wy+OLteD53NlGzT6L9XNrbvTMV28GH
         6zTKY4CtZUeYgfXO2Oz+cjOQhNooAnVACRQrSJK0yWrJWJ5e4DU8fgyJPtWVmygnZoQQ
         u91A==
X-Forwarded-Encrypted: i=1; AHgh+RogQZUs5QoCcDd6EpOhsd0Rqvz0NwyUHvSQtu/FeZZoGd5hwlR+64HhJp5AC13PKIIpusI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg7UOJtqSB+EmtREyV2ROHNhFnmxJkUbDolorFezvMna0P6RhU
	XwnrwYd145A0LNtyLVHl35U/74ewJUbkDrjWqL8JFg/iYQLSpYrbf04e9MrPW0TGBtEYxTlWl6B
	xXuUu0zet3fIA995JZ0IxLDvat7eDbPJ5T78CN4ABLeXj4DvpbJVZuiE=
X-Gm-Gg: AfdE7clNAXcH504mICLXOx/6KsBD5eb7Ur5dA009v2FYw3LWDVeQBQdPhxO4CSXT9zt
	/Ki6ekv8O9h4B+m9blgaBWXf1EIL8X04EnzC0yif8KJ/mx492ct+gQA+D1cUG/flA02tmPjAg7l
	gIgFQBARhzffdV6GglmJJiN9nMuNs7v/xRc62TaUNO3GedVxbHCMkwXn5CgldW9J9mwjFF0qlmZ
	mlunls1RPwP6gqT7/ySSqb+iYN5yWwKfzG+dNevztpk/BHQoMV0pySBAJDdSY9FVWKmcInrIA8P
	sXi8HHfXjoXmRfWDRxR9FAiIHdf4V7unVIZdkuTO76kf9Hszt7HfpPoK2mE5NXjE9O5xg0W5+AH
	oxDNb/AW/14AyoJfUNqVe
X-Received: by 2002:a17:902:fda3:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ce9e9ada87mr215357885ad.19.1784192610940;
        Thu, 16 Jul 2026 02:03:30 -0700 (PDT)
X-Received: by 2002:a17:902:fda3:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ce9e9ada87mr215357475ad.19.1784192610502;
        Thu, 16 Jul 2026 02:03:30 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:03:30 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 17:01:58 +0800
Subject: [PATCH v2 6/8] drm/repaper: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-drm-simple-kms-removal-v2-6-1133a8fc3785@oss.qualcomm.com>
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
In-Reply-To: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192560; l=7829;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=ERhc4h2BzyHq4SLA1KLZmwEBYZNamx9DmYFgd02zfJM=;
 b=BatRP4ZlOB9sgvvfbYOlQ/D1wW3PwwrZ6A1gMipy1O2m71Q4YyK+bKZTb/u3/NYEQiEn6Dhv6
 uZCR4AWmSRVD/lNWPgDwsLkctZsl2PnzSt6mINbJ4PIs6X8p3eiyZg+
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: HSw8bl3nbdKvlX3gdtWsklfmdS5ygFdL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXydvKrsP/5pyk
 imkOHaLFwse5x9GquJPNpDQapHqytp3J1vm7fep4k1B/PQST2BM8Kk87Oy67wFVgF7HaqUBa/cD
 gEnsKPOxKVyPhTAkhWtDVjn4EGSm5JVQPAyfYr8aL517xFKezvEHly8zu7dxHJta5UUME/CyYwO
 JmKdeGXWygRNl9zxmrl7qx+b6uPsy0Dbw+MlAxWkzkAST+NAnFrpKHRtA0wCPklCJghUC1UXRIa
 j/eD5VphrfFWgbX7MAbCnuz701Dc3UJCD8gdn6h3tl9uHIEU/M3yYSijUgflFA4OTa6nEQqO59Y
 RmJ4ryy4ULwlzn8ytaVH4N7Aqz0KTK1czgUiOS7CpO0TQXRqdwLUD3rcdyqO0al8L9TJrmMoDfF
 QDV1zGnLsTLvU6YGYwijYnqS3SNem6tK6cKFHWQWq7WOgJEybfVEH+ZtWKIWM48TlHJXlYCUC4R
 DOL/EkwWxULMx9P19DA==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a589e63 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rSXZLFMjQQqjKu18WoMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: HSw8bl3nbdKvlX3gdtWsklfmdS5ygFdL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX5LSrHYGX0U1J
 +0KC6ft8+ytlruV7h2uEnjel4/piEgAp8UHvTnuGI5TQ0XtSKa41yW4n/BMd+Rzb2Dj1rdlzRDo
 5/mdCnxyawOgpZ1l9jzeu7X5+J6haiU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091

Convert repaper to explicit primary plane, CRTC and encoder objects.

Keep shadow-plane helpers, framebuffer access handling and no-scaling
plane-state validation from simple-KMS path.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/repaper.c | 132 ++++++++++++++++++++++++++++++++---------
 1 file changed, 104 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c8270591afc7..7057075161c4 100644
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
 
@@ -827,27 +828,84 @@ static void repaper_pipe_disable(struct drm_simple_display_pipe *pipe)
 	power_off(epd);
 }
 
-static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
-				struct drm_plane_state *old_state)
+static void repaper_plane_helper_atomic_update(struct drm_plane *plane,
+					       struct drm_atomic_commit *commit)
 {
-	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
+	struct drm_plane_state *old_pstate = drm_atomic_get_old_plane_state(commit, plane);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(pstate);
 	struct drm_rect rect;
 
-	if (!pipe->crtc.state->active)
+	if (!pstate->fb)
 		return;
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		repaper_fb_dirty(state->fb, shadow_plane_state->data,
+	if (drm_atomic_helper_damage_merged(old_pstate, pstate, &rect))
+		repaper_fb_dirty(pstate->fb, shadow_plane_state->data,
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
+
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
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
+	if (crtc_state->enable) {
+		ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+		if (ret)
+			return ret;
+	}
+
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
@@ -1102,9 +1160,27 @@ static int repaper_probe(struct spi_device *spi)
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
2.43.0

