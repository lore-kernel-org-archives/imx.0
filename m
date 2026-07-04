Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013E2571B8
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 18:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783189980; cv=none; b=SuqbgpOXGLP+1bC/18VcP/gVVcI01WYUjM4PJC8q72MY7DOt+vsjdMFyCISpkbW8EnAPxeVehKSU8UXGenpeT/o51k1yVMNeh62IPlLWcgwVmS5Jke3qqnlCxL/XXilKcyf7dOOl3CGshXgx/2vY4h2g3aVuCWRVnrkAnu4K7Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783189980; c=relaxed/simple;
	bh=ZBckuX3txIAWgfa7laBsW3ynqRXr57quONUZ0OswUhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3Q7kYK7yZVF2d8HHLZTlx4EZLsceiF1Z5Gm7sE77JInxWvbsn5kXiYBnlBGCcbHnqGl+ZF051ZLWKO25XAG7sbFo2GwoZ1MASV5E7g43AHABGaQzBTrjNig0KMtEnN8MM/4ftVOG7FpoYKZcIdcH8kMbzlbw29GdaxMiD4t6Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMvlZI/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GcZnDoqY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMvlZI/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GcZnDoqY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664G8UaY3236251
	for <imx@lists.linux.dev>; Sat, 4 Jul 2026 18:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ttm/7fm0Amr5YNq5qGHZbCjSuHzVM8tYT1SDU8QGDHk=; b=KMvlZI/BAGdkRbPC
	g4ZIOHQiHU6hWIPh5Xyk1zLy8YjJRzKKQ8XvMI6bfVxnghFPZKFzMyNCXHQVnYLh
	CpqZ/+AAF8wlJkPYwd58iNQLXFzwdZFIxpybyiWg2LAQYA2wMZB5Igu2MDLJjIh3
	2MlbaKCZEkHHerTQH5LcXL8V5TIMkSQc0apFOBcJni38UEsDNAAjj0xVykLSTgVb
	zqR7onBwTqwp6lznxPUOIxN1iN+t5D5W7XO1ZEf/uUbb80VQW4JdAs1wk0TFLWuR
	qOpgAbSlNa/p0eFNqRUvnHImfWzu7nhZbAK6rh0ZXmecbvahwLNXC3ar8iwI1eDi
	WKzCvg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgh7m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 04 Jul 2026 18:32:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88d7a75507so2524001a12.1
        for <imx@lists.linux.dev>; Sat, 04 Jul 2026 11:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783189977; x=1783794777; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ttm/7fm0Amr5YNq5qGHZbCjSuHzVM8tYT1SDU8QGDHk=;
        b=GcZnDoqYH6sg8iahw3y3L66Zuz0VLU7PbN5IlyF9xj41N5HJoyB98y70vztXWDjxUg
         Z+f282ohEE9Hxe3/BVKb7AwLpYosp8nTRBcIF+piOOZGAT3J14h7zD6m4rwTp2Ty3kap
         S74cnsRD8brQ4q75LWmhRjbeMvDAqC1sqV8hjM3Jk2fAuDieQDh6uWg+Q2uL8uHw4lW9
         ht+NRdehZhUiKWAdTmC/xamQ4Z7025ygj3VsKebHp5EY5mjoycrNQEIzyKUlAAeZfGH+
         AO+78kgWczeA6UUpN8/lfiA7QflmNqO0+1+In5q2KlwK19RQCXTWDNh9WcBF+FY17hwq
         2mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783189977; x=1783794777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ttm/7fm0Amr5YNq5qGHZbCjSuHzVM8tYT1SDU8QGDHk=;
        b=oDTboHd3CwLQBw1YLq1TtsZttZKUGEulJi/njCZ6G3Z0C91pCa3V+PL0Of+BWt6lm6
         /hLS6Ejc/BdD92FzKc6wc/I/A1oYLh5Sj9g7YDCaL1GwSjt9/6VgAfFnE2k1Rs+TW/oq
         OpHptEKImeB0k38ukdwzIeO6Su9FBDnfYCsieHnVFLFaZTN3bE+9qUvbNlvk63DSHdV7
         o1ctMeoh84PfIAN7QJ+Ra7vCIm93ecC7OSnsxCkn/7T36sXuzyxRRoA4kMcEaD1F+/YN
         m2g5P7h4rL2h8R3zSAl7riaH2CVKpAD+ckIwbqlnnajFTggcBNXpO3W4yMRYPhVY4FcP
         UWog==
X-Forwarded-Encrypted: i=1; AFNElJ/prjY02JJDiM2e6nDf4s5GlE8HmTecoF4I3mkyQaijzaGOK108lwvkSmUlgTtHW81E+cM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFAbYzebCHr93anTRGHQK3TlQHCZ/OyP+2TwzYLepiNuerqUVV
	W8ZjlxtOEp4zSRcYvMUGlLalz/nW6v56m70bUGjBnsPbWOaVUZ1FjDfio1ZvDhimlq7yjuYV5kb
	V64g7/UPOFXYM4omviQjhJATCQ5VWRy/JMwsvs+mTR2EVhO9D77RAOAQ=
X-Gm-Gg: AfdE7cm44VW7/Y8o148ytRYC2cprjW6pgclDiyuXTIHPyTv7JwGqaLN1I6ztJG7xUeX
	+TfvYdU+9mX2vKnE5lbZiTDedocEe2C0sKC3vQ1VNFTIs44y9wdC4CMb8XpzXOQFnH+XBDJ3OOu
	Kjrk58IUFNHq0zNsjVVzaO6Fmegbiat0Eq8eZyTjwGFPXvrQJl9wKzdt/uE7kf3Lrs/I1xUpQM7
	PStsl7w4u+9sHGlj7zkAZqDVsNYeZJLcdPi/nS4cdodu2fgOiVeNIr2Zgl4BAIpBc7PSK8B0T8e
	QUq8/rsd89/84KkacYHGikxzdVST2Qmbe7I0HbtiFlkAVlFPDjO3Bd6yyp2HX5wF2xFxkKLIa6F
	/9NVwRWdOeOxydRWtaZMKhKI=
X-Received: by 2002:a05:6a00:330a:b0:845:e873:4248 with SMTP id d2e1a72fcca58-847f6f88bf1mr3891507b3a.56.1783189976906;
        Sat, 04 Jul 2026 11:32:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:330a:b0:845:e873:4248 with SMTP id d2e1a72fcca58-847f6f88bf1mr3891475b3a.56.1783189976356;
        Sat, 04 Jul 2026 11:32:56 -0700 (PDT)
Received: from [192.168.1.100] ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b6057dsm1508437b3a.7.2026.07.04.11.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 11:32:54 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 02:31:12 +0800
Subject: [PATCH 3/9] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-drm-simple-kms-removal-v1-3-b4e1ca053623@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783189912; l=12402;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=ZBckuX3txIAWgfa7laBsW3ynqRXr57quONUZ0OswUhc=;
 b=CcD/bGc8N1fmpUeIAF1DgOcRu2w5rkAIDVMHiLPgTjWBMB2Cr/5H5zbeIN+QE6UHLIN4SkusI
 ddIQkvZ0PpPDGax+ynKj3ZJ+UsHYNrpUI0x4wQabe61C0XeadfBIfqL
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfXzXAnf73z4t3v
 +hlfVyOaIw3SZ9XjMIg3KXazJxQxZxWx+8zg7Nl87/1iEcy6t6MBITTM71WBH9aS+aILKbr5Dx1
 CY2IFj2ZYLDftoSDZN+F1bWniW2UD3w=
X-Proofpoint-ORIG-GUID: ws7zw7x9iQJPF-E7R8t0hy8SlcsNim0J
X-Proofpoint-GUID: ws7zw7x9iQJPF-E7R8t0hy8SlcsNim0J
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4951d9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mQfPNFbHEbGQ-wo8duEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDE5MiBTYWx0ZWRfX7jyUoi29Nn+V
 +/a1o8UBS3rnGYp0cnNDq49HGburf/+5QM/0odOemjFaw2jhOXJAav3QzthrMP0FHPWxHVUHIyi
 5J5l3oHF5S0QBsPPXiNVJWEdtCmOHfSjiMxxF3DMZIrmhLkdCgE21Pm1Ou6jGAHsb2Rk8iocl3T
 RgLH46+bCXe4YYwD84CuLNRekl/T9lkjpFdw2ZUBXLNMJZMBc2XTXkDFaitxxLxn5Sug2Lno+gg
 UwRbkEykOubMi+Ghm/w+AcrKA/8U8/KFTlyur1RzbsXOaTZJ9Za8TyYjnU08y+tbUSbgs67whfJ
 uTePa3TeJVwt9C5J4WRLUyjzHCyp9N0Yeg4qmJSnBgZSQvUA7jd57igexqwoRbbI4McrbYbr+OZ
 K52XpsWko9FOfz8RFfBNfHvmx58qIYYKtOEIAbqMXRiw+CNVtVs8aDQkfkBuzTb3H90Bb+a+cpP
 3d7/canCdlqnfyYfmrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040192

Convert i.MX LCDC to explicit primary plane, CRTC and encoder objects.

Keep no-scaling plane check and GEM framebuffer prepare callback from
simple-KMS path. Only touch hardware state when framebuffer exists,
since atomic plane updates can run on disabling transitions.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 178 ++++++++++++++++++++++++++----------
 1 file changed, 130 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index f52832b43aca..d091dc562098 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -14,9 +14,9 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -102,7 +102,9 @@
 
 struct imx_lcdc {
 	struct drm_device drm;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct drm_connector *connector;
 	void __iomem *base;
 
@@ -135,14 +137,13 @@ static unsigned int imx_lcdc_get_format(unsigned int drm_format)
 	}
 }
 
-static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
+static void imx_lcdc_update_hw_registers(struct drm_crtc *crtc,
 					 struct drm_plane_state *old_state,
 					 bool mode_set)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_plane_state *new_state = pipe->plane.state;
+	struct drm_plane_state *new_state = crtc->primary->state;
 	struct drm_framebuffer *fb = new_state->fb;
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
 	u32 lpcr, lvcr, lhcr;
 	u32 framesize;
 	dma_addr_t addr;
@@ -188,16 +189,16 @@ static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe *pipe,
 		clk_prepare_enable(lcdc->clk_per);
 }
 
-static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
-				 struct drm_crtc_state *crtc_state,
-				 struct drm_plane_state *plane_state)
+static void imx_lcdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					       struct drm_atomic_commit *state)
 {
 	int ret;
 	int clk_div;
 	int bpp;
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
-	struct drm_display_mode *mode = &pipe->crtc.mode;
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
+	struct drm_display_mode *mode = &crtc->mode;
 	struct drm_display_info *disp_info = &lcdc->connector->display_info;
+	struct drm_plane_state *plane_state = crtc->primary->state;
 	const int hsync_pol = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : 1;
 	const int vsync_pol = (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : 1;
 	const int data_enable_pol =
@@ -231,34 +232,34 @@ static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	ret = clk_prepare_enable(lcdc->clk_ipg);
 	if (ret) {
-		dev_err(pipe->crtc.dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
+		dev_err(crtc->dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret));
 		return;
 	}
 	ret = clk_prepare_enable(lcdc->clk_ahb);
 	if (ret) {
-		dev_err(pipe->crtc.dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
+		dev_err(crtc->dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret));
 
 		clk_disable_unprepare(lcdc->clk_ipg);
 
 		return;
 	}
 
-	imx_lcdc_update_hw_registers(pipe, NULL, true);
+	imx_lcdc_update_hw_registers(crtc, NULL, true);
 
 	/* Enable VBLANK Interrupt */
 	writel(INTR_EOF, lcdc->base + IMX21LCDC_LIER);
 }
 
-static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
+static void imx_lcdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+						struct drm_atomic_commit *state)
 {
-	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(pipe->crtc.dev);
-	struct drm_crtc *crtc = &lcdc->pipe.crtc;
+	struct imx_lcdc *lcdc = imx_lcdc_from_drmdev(crtc->dev);
 	struct drm_pending_vblank_event *event;
 
 	clk_disable_unprepare(lcdc->clk_ahb);
 	clk_disable_unprepare(lcdc->clk_ipg);
 
-	if (pipe->crtc.enabled)
+	if (crtc->enabled)
 		clk_disable_unprepare(lcdc->clk_per);
 
 	spin_lock_irq(&lcdc->drm.event_lock);
@@ -273,17 +274,18 @@ static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
 	writel(0, lcdc->base + IMX21LCDC_LIER);
 }
 
-static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
-			       struct drm_plane_state *plane_state,
-			       struct drm_crtc_state *crtc_state)
+static int imx_lcdc_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *state)
 {
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	const struct drm_display_mode *mode = &crtc_state->mode;
-	const struct drm_display_mode *old_mode = &pipe->crtc.state->mode;
+	const struct drm_display_mode *old_mode = &crtc->state->mode;
+	int ret;
 
 	if (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES ||
 	    mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES ||
 	    mode->hdisplay % 0x10) { /* must be multiple of 16 */
-		drm_err(pipe->crtc.dev, "unsupported display mode (%u x %u)\n",
+		drm_err(crtc->dev, "unsupported display mode (%u x %u)\n",
 			mode->hdisplay, mode->vdisplay);
 		return -EINVAL;
 	}
@@ -292,27 +294,42 @@ static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
 		old_mode->hdisplay != mode->hdisplay ||
 		old_mode->vdisplay != mode->vdisplay;
 
-	return 0;
+	if (!crtc_state->enable)
+		goto out;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+	if (ret)
+		return ret;
+
+out:
+	return drm_atomic_add_affected_planes(state, crtc);
 }
 
-static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *old_state)
+static void imx_lcdc_plane_helper_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_commit *state)
 {
-	struct drm_crtc *crtc = &pipe->crtc;
-	struct drm_pending_vblank_event *event = crtc->state->event;
-	struct drm_plane_state *new_state = pipe->plane.state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *new_state = plane->state;
+	struct drm_crtc *crtc = new_state->crtc ?: old_state->crtc;
+	struct drm_pending_vblank_event *event;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_framebuffer *old_fb = old_state->fb;
 	struct drm_crtc *old_crtc = old_state->crtc;
 	bool mode_changed = false;
 
-	if (old_fb && old_fb->format != fb->format)
-		mode_changed = true;
-	else if (old_crtc != crtc)
-		mode_changed = true;
+	if (!crtc)
+		return;
 
-	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
+	if (fb) {
+		if (old_fb && old_fb->format != fb->format)
+			mode_changed = true;
+		else if (old_crtc != crtc)
+			mode_changed = true;
 
+		imx_lcdc_update_hw_registers(crtc, old_state, mode_changed);
+	}
+
+	event = crtc->state->event;
 	if (event) {
 		crtc->state->event = NULL;
 
@@ -327,11 +344,56 @@ static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
 	}
 }
 
-static const struct drm_simple_display_pipe_funcs imx_lcdc_pipe_funcs = {
-	.enable = imx_lcdc_pipe_enable,
-	.disable = imx_lcdc_pipe_disable,
-	.check = imx_lcdc_pipe_check,
-	.update = imx_lcdc_pipe_update,
+static int imx_lcdc_plane_helper_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_commit *state)
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
+static const struct drm_plane_helper_funcs imx_lcdc_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= imx_lcdc_plane_helper_atomic_check,
+	.atomic_update	= imx_lcdc_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs imx_lcdc_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static const struct drm_crtc_helper_funcs imx_lcdc_crtc_helper_funcs = {
+	.atomic_check	= imx_lcdc_crtc_helper_atomic_check,
+	.atomic_enable	= imx_lcdc_crtc_helper_atomic_enable,
+	.atomic_disable	= imx_lcdc_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs imx_lcdc_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs imx_lcdc_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static const struct drm_mode_config_funcs imx_lcdc_mode_config_funcs = {
@@ -369,7 +431,7 @@ MODULE_DEVICE_TABLE(of, imx_lcdc_of_dev_id);
 static irqreturn_t imx_lcdc_irq_handler(int irq, void *arg)
 {
 	struct imx_lcdc *lcdc = arg;
-	struct drm_crtc *crtc = &lcdc->pipe.crtc;
+	struct drm_crtc *crtc = &lcdc->crtc;
 	unsigned int status;
 
 	status = readl(lcdc->base + IMX21LCDC_LISR);
@@ -387,6 +449,9 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	struct imx_lcdc *lcdc;
 	struct drm_device *drm;
 	struct drm_bridge *bridge;
+	struct drm_plane *plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
 	int irq;
 	int ret;
 	struct device *dev = &pdev->dev;
@@ -428,23 +493,40 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Cannot initialize mode configuration structure\n");
 
-	/* CRTC, Plane, Encoder */
-	ret = drm_simple_display_pipe_init(drm, &lcdc->pipe,
-					   &imx_lcdc_pipe_funcs,
-					   imx_lcdc_formats,
-					   ARRAY_SIZE(imx_lcdc_formats), NULL, NULL);
+	plane = &lcdc->plane;
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &imx_lcdc_plane_funcs,
+				       imx_lcdc_formats,
+				       ARRAY_SIZE(imx_lcdc_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret < 0)
+		return dev_err_probe(drm->dev, ret, "Cannot initialize primary plane\n");
+	drm_plane_helper_add(plane, &imx_lcdc_plane_helper_funcs);
+
+	crtc = &lcdc->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&imx_lcdc_crtc_funcs, NULL);
+	if (ret < 0)
+		return dev_err_probe(drm->dev, ret, "Cannot initialize CRTC\n");
+	drm_crtc_helper_add(crtc, &imx_lcdc_crtc_helper_funcs);
+
+	encoder = &lcdc->encoder;
+	ret = drm_encoder_init(drm, encoder, &imx_lcdc_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0)
-		return dev_err_probe(drm->dev, ret, "Cannot setup simple display pipe\n");
+		return dev_err_probe(drm->dev, ret, "Cannot initialize encoder\n");
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret < 0)
 		return dev_err_probe(drm->dev, ret, "Failed to initialize vblank\n");
 
-	ret = drm_bridge_attach(&lcdc->pipe.encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Cannot attach bridge\n");
 
-	lcdc->connector = drm_bridge_connector_init(drm, &lcdc->pipe.encoder);
+	lcdc->connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(lcdc->connector))
 		return dev_err_probe(drm->dev, PTR_ERR(lcdc->connector), "Cannot init bridge connector\n");
 

-- 
2.55.0

