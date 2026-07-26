Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9497433A70A
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095149; cv=none; b=AK2l8LeZhTiDjdYgMPF3dFedVKAgoQxXWvZylAXRkuBL/5KrMMPHxAQp1Q5quc8roQsxBqJopeB7b9oaglzMXlF2fLIvf0bj/+GiEqtQwgq/Gib6UnOvctMSgQOe88W7cWXePKPRmi5wQLYCW1MIzYSLS8/qAyrd4iGj19sRZas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095149; c=relaxed/simple;
	bh=u7exUdyCprg8S9F0jxX38ipcgKHv/vnrTEoFU9vPkn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YfM4rTyE0B+AE/Bkbr3edSPsnFBaP6Ks2Pn4b/BrgDq2u89LvdQ3V91dT/toQezSKVtgeiiVIxA6VIM8kbkHYFOlpJAHtatZwHJH9+T2KK2ECWaBuqZZapB2DtX1OQIuG39/MVrmsx5VTNSRdJttFReeICf60lJGKAaj4J+LT54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0wlU7aH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9kaM9MM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0wlU7aH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9kaM9MM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6sSi720928
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J6+lcE074QQEAdQOuVNwreBseeGR/lrDSDS0Q2DJm30=; b=E0wlU7aHZ/ViM/pX
	o/1GtHfv72LS8z+4+VritNAV63YhzEuFfvEQoyNnGwisbvxYCGJE/XGwLgb1LVjR
	782G2tn/cV595VBpz1n2Qb0QkXkc7B5+wuVNHdgmZg1b636yJtn7HD+kYP0oXUMe
	mZV5H8rrk2hCSYREdcPOaEereLkgNhZlgLhFVkS8Iy80PO0oDWK3eSZnlOVscyn9
	r56npLDw3QaoRhUBFCRVGSxdJhsYqhw+FTaPYkefM9bxGoNglpQMb/fI+4/K5BFG
	ffCU/M94OqaRu1G0grgJ+P6/hHmC/SWKwMBYsy0pral3OhHLXjKBcQvVArcLJGvC
	901YmA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajkcj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:45:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so601720a12.1
        for <imx@lists.linux.dev>; Sun, 26 Jul 2026 12:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095146; x=1785699946; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6+lcE074QQEAdQOuVNwreBseeGR/lrDSDS0Q2DJm30=;
        b=G9kaM9MMHj5SY8KfAfMuaXng6eoJ+xmCeyUG8l5hdudgZiJpiL0tLzDCUqh8hK/3GX
         hL5jWPO16AyrjswTLiAQ/pDjYXV3sWuqEEkcsdg3MLBZ0yhTiZp4ZkpEYLlu+DPAKjHR
         bxz71HV6197Cp0Eg3IjRH5Y9fSu9qroFrIHyly8lSv4KSXdhJLdEQawsRddqCepSUCys
         hrvnam20HErSO3ZJvkRrs6SQG9DwLH2RdIBANde/nKMjRMqWlq/ELe6VslGYs14AJH6p
         rLzV3ADUtG/U8MGCp4M6xF31lYE0k6UOexzwhMgLF/w/LvmwI+okQpcbCLiqrLLvw5hJ
         u/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095146; x=1785699946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6+lcE074QQEAdQOuVNwreBseeGR/lrDSDS0Q2DJm30=;
        b=XpQlItZzUZAWFfQFE+WdVZRTL2bWxI0rgWPlT642fqHWeY3eMHTvRB3Y+dTmMEspZn
         b9TlJ5khwzeFWz/XOt0Vi+w+aihcz52CFQYynWFT+7khmlqMEyzlMcXpItw/ZULCz/9R
         2glOGTjjZ0REjiEXbP+mherZLVYWXOSoC62pQF7lueupO273PC5DxMM5dNfQtbY46Rn6
         blEvtyj74l5VbOs8fuvR5Xs69+POS12tCgSOSPHlnv2R0O5a0jkw3uzAtIAfXyCH6GJp
         5euoxlutQLCBsG1hh7CHnvMe08sU8Ped+hfKb+45bN70tIFtQyXGd42fu3aW2f5kU+yo
         UD2g==
X-Forwarded-Encrypted: i=1; AHgh+Rqg/y/ei4qKjyuYkOv5YBe1O7qFBtUyjwbE5JOdbUkUWFEV9c2qugccmThpqTOocaSjDiw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXHqi+Rh5vhlEPUF6XpLK7Z7kfvBCADAixzR+chCjc4swsayn9
	afKbzvfdF1X2yX7r+DyYQYS17OI2Ny4Uk6qXzMqNSmM5j6cR+ezp4Hp+dLkhi8urjYzHQ/zLnyq
	Jqzohf6Z1Jmd9sqqYdiP5JO/+nxetRacHjAtTbT5EHwix9GyqG24nG3I=
X-Gm-Gg: AR+sD13Twr4ImOMRdOc8ZerHisusdXtbVbz/nbLhtTfoJ1w3ButO/dD/rVzf91L/HMg
	5K2FpOedvt1Q4mCJYLNG16qZWmwelAS+6FSn/PDt7Ujd/VQLhAfnSx/7tjBx3pjHqVEqOPBDn7/
	z4d5/wZDM4/XneH7pdlRaA5eVUaAXsZKTSBIPXcYO0JgWN5wwP/14h1PDFwVHVXTxWrGK2UCxoA
	GRxa6AligdK6reBmdLins4zGVAlqrzMKXhBOVJ6tOf/saMbLp1Lp/x3DKznfd8n1V2E92HoRnbr
	ksEOGVtTmI1NLy03WeJWFazl36/Xc3XgmYIOteLtcgvc6QDnTstaa9wBS44ZxZVRZ3HGErzhIZM
	CgSjesw07aARfPy1qR6ef
X-Received: by 2002:a17:90b:57e3:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38f296091e5mr5566780a91.25.1785095145653;
        Sun, 26 Jul 2026 12:45:45 -0700 (PDT)
X-Received: by 2002:a17:90b:57e3:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38f296091e5mr5566754a91.25.1785095145112;
        Sun, 26 Jul 2026 12:45:45 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4105998a91.8.2026.07.26.12.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:45:44 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:45:14 +0800
Subject: [PATCH v3 1/8] drm/arcpgu: replace struct drm_simple_display_pipe
 with regular atomic helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-1-cd5dc89858c6@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095128; l=13083;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=u7exUdyCprg8S9F0jxX38ipcgKHv/vnrTEoFU9vPkn0=;
 b=ZZ9Plhe5vhdeps49o98fJZwGYMXe7qfovRpPLQtu3Ndk8ZaA/xZ5h5iF+eVEKTBGql3NdYneD
 e8qZB80aBZwDC1tqIMZQu2S2jeS6nDQM6Y2Hd/QRPAINQ4pNhlPy2B5
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-ORIG-GUID: YJJm8GPvN4mGxFKU3xj5WzNZTipZZSZ8
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a6663ea cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=f2ANGF4ctf8G8blR-OgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: YJJm8GPvN4mGxFKU3xj5WzNZTipZZSZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX4jq6y1CU61H1
 cwzxruVKikKLW2hZaQD3ZmNGfPPdysk87CtOLplsFqneg1WyeQ5Rtr+m1nenGsR2/NjmcT1pxcl
 vgL96mlMAF0aWboN5E5eMIIn+N0EQO6bT28pB6HM7yhacAIbB0c2JvAOzDN8BsJhA5M1Kh+HCH2
 nzjf6GxlGJHiTR7j0nn18zmJuA0FFw8hpSE7oAb7BlpYFu08CLAJmTcgBf9Dozwg99/vxl/2piR
 soJK18aZ45P3SRVB22zAjrVgMxfJ0TkNO4GbbbCLgAsfFEPbhU3LxchiQLEqlxuruFaI3O3BdBx
 P5IXqqSfDEFeNpg2WqfMTzTG/FYi/ubQ6oOKahThG4KgPGVxAuGC5xqA4XmQ0e0/ymCSzGcrfM1
 9ncFqDEsQwQIssfIyrUL8/1greFuutsf79PrLYUNu7T8Hl73+mY5+nGy1LH20jJM3yCDpfdOMpQ
 33rB7CiZ/W56J6rXI+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfXzZj3HWs8vt4f
 YRRRJStr76vRoXpLEGBUTJQlMG+oBzocjM916ytfCtViPAvNZH1RaKvCdMP/SF0pycZR68PMSmy
 NS+MDe/HebucsXQhgrXiDetbipcin7o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200

Instantiate the primary plane, CRTC and encoder directly and wire them up
with standard atomic helpers.

Move the simple-pipe callbacks into explicit plane and CRTC helper
callbacks. Use commit-local CRTC and plane state in the CRTC enable path
for mode and pixel-format programming.

Handle missing remote encoder nodes explicitly and take the CRTC modeset
lock while reading CRTC state from debugfs.

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

---
Changes in v3:
- Use commit-local CRTC and plane state in the CRTC enable path.
- Handle missing remote encoder nodes explicitly.
- Lock CRTC state access in debugfs.
---
 drivers/gpu/drm/tiny/arcpgu.c | 201 ++++++++++++++++++++++++++++++++----------
 1 file changed, 152 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..19a943f5f792 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 
 #include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
@@ -17,12 +18,13 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of_reserved_mem.h>
@@ -52,13 +54,16 @@ struct arcpgu_drm_private {
 	struct drm_device	drm;
 	void __iomem		*regs;
 	struct clk		*clk;
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane	plane;
+	struct drm_crtc		crtc;
+	struct drm_encoder	encoder;
 	struct drm_connector	sim_conn;
 };
 
-#define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
-
-#define pipe_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe)
+static inline struct arcpgu_drm_private *dev_to_arcpgu(struct drm_device *drm)
+{
+	return container_of(drm, struct arcpgu_drm_private, drm);
+}
 
 static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
 				 unsigned int reg, u32 value)
@@ -115,9 +120,10 @@ static const u32 arc_pgu_supported_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
 
-static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
+static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu,
+				const struct drm_plane_state *plane_state)
 {
-	const struct drm_framebuffer *fb = arcpgu->pipe.plane.state->fb;
+	const struct drm_framebuffer *fb = plane_state->fb;
 	uint32_t pixel_format = fb->format->format;
 	u32 format = DRM_FORMAT_INVALID;
 	int i;
@@ -139,10 +145,10 @@ static void arc_pgu_set_pxl_fmt(struct arcpgu_drm_private *arcpgu)
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
 }
 
-static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *pipe,
-					       const struct drm_display_mode *mode)
+static enum drm_mode_status arcpgu_crtc_helper_mode_valid(struct drm_crtc *crtc,
+							  const struct drm_display_mode *mode)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 	long rate, clk_rate = mode->clock * 1000;
 	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
 
@@ -153,9 +159,11 @@ static enum drm_mode_status arc_pgu_mode_valid(struct drm_simple_display_pipe *p
 	return MODE_NOCLOCK;
 }
 
-static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
+static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu,
+			     struct drm_crtc_state *crtc_state,
+			     struct drm_plane_state *plane_state)
 {
-	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
+	struct drm_display_mode *m = &crtc_state->adjusted_mode;
 	u32 val;
 
 	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
@@ -189,18 +197,19 @@ static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
 	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
 
-	arc_pgu_set_pxl_fmt(arcpgu);
+	arc_pgu_set_pxl_fmt(arcpgu, plane_state);
 
 	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
 }
 
-static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
-			   struct drm_crtc_state *crtc_state,
-			   struct drm_plane_state *plane_state)
+static void arcpgu_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					     struct drm_atomic_commit *commit)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, &arcpgu->plane);
+	struct drm_crtc_state *cstate = drm_atomic_get_new_crtc_state(commit, crtc);
 
-	arc_pgu_mode_set(arcpgu);
+	arc_pgu_mode_set(arcpgu, cstate, pstate);
 
 	clk_prepare_enable(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
@@ -208,9 +217,10 @@ static void arc_pgu_enable(struct drm_simple_display_pipe *pipe,
 		      ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
+static void arcpgu_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					      struct drm_atomic_commit *commit)
 {
-	struct arcpgu_drm_private *arcpgu = pipe_to_arcpgu_priv(pipe);
+	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(crtc->dev);
 
 	clk_disable_unprepare(arcpgu->clk);
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
@@ -218,27 +228,21 @@ static void arc_pgu_disable(struct drm_simple_display_pipe *pipe)
 			      ~ARCPGU_CTRL_ENABLE_MASK);
 }
 
-static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
-			   struct drm_plane_state *state)
+static void arcpgu_plane_helper_atomic_update(struct drm_plane *plane,
+					      struct drm_atomic_commit *commit)
 {
+	struct drm_plane_state *pstate = drm_atomic_get_new_plane_state(commit, plane);
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_dma_object *gem;
 
-	if (!pipe->plane.state->fb)
+	if (!pstate->fb)
 		return;
 
-	arcpgu = pipe_to_arcpgu_priv(pipe);
-	gem = drm_fb_dma_get_gem_obj(pipe->plane.state->fb, 0);
+	arcpgu = dev_to_arcpgu(plane->dev);
+	gem = drm_fb_dma_get_gem_obj(pstate->fb, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->dma_addr);
 }
 
-static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
-	.update = arc_pgu_update,
-	.mode_valid = arc_pgu_mode_valid,
-	.enable	= arc_pgu_enable,
-	.disable = arc_pgu_disable,
-};
-
 static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
 	.fb_create  = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
@@ -247,6 +251,74 @@ static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
 
 DEFINE_DRM_GEM_DMA_FOPS(arcpgu_drm_ops);
 
+static int arcpgu_plane_helper_atomic_check(struct drm_plane *plane,
+					    struct drm_atomic_commit *commit)
+{
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(commit, plane);
+	struct drm_crtc_state *crtc_state = NULL;
+
+	if (plane_state->crtc) {
+		crtc_state = drm_atomic_get_crtc_state(commit, plane_state->crtc);
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+	}
+
+	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						   DRM_PLANE_NO_SCALING,
+						   DRM_PLANE_NO_SCALING,
+						   false, false);
+}
+
+static const struct drm_plane_helper_funcs arcpgu_plane_helper_funcs = {
+	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
+	.atomic_check	= arcpgu_plane_helper_atomic_check,
+	.atomic_update	= arcpgu_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs arcpgu_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static int arcpgu_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					   struct drm_atomic_commit *commit)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(commit, crtc);
+	int ret;
+
+	if (crtc_state->enable) {
+		ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+		if (ret)
+			return ret;
+	}
+
+	return drm_atomic_add_affected_planes(commit, crtc);
+}
+
+static const struct drm_crtc_helper_funcs arcpgu_crtc_helper_funcs = {
+	.mode_valid	= arcpgu_crtc_helper_mode_valid,
+	.atomic_check	= arcpgu_crtc_helper_atomic_check,
+	.atomic_enable	= arcpgu_crtc_helper_atomic_enable,
+	.atomic_disable	= arcpgu_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs arcpgu_crtc_funcs = {
+	.reset			= drm_atomic_helper_crtc_reset,
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs arcpgu_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 {
 	struct platform_device *pdev = to_platform_device(arcpgu->drm.dev);
@@ -254,6 +326,9 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	struct device_node *endpoint_node = NULL;
 	struct drm_connector *connector = NULL;
 	struct drm_device *drm = &arcpgu->drm;
+	struct drm_plane *plane;
+	struct drm_encoder *encoder;
+	struct drm_crtc *crtc;
 	int ret;
 
 	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
@@ -285,6 +360,30 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
 		return -ENODEV;
 
+	plane = &arcpgu->plane;
+	ret = drm_universal_plane_init(drm, plane, 0,
+				       &arcpgu_plane_funcs,
+				       arc_pgu_supported_formats,
+				       ARRAY_SIZE(arc_pgu_supported_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(plane, &arcpgu_plane_helper_funcs);
+
+	crtc = &arcpgu->crtc;
+	ret = drm_crtc_init_with_planes(drm, crtc, plane, NULL,
+					&arcpgu_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &arcpgu_crtc_helper_funcs);
+
+	encoder = &arcpgu->encoder;
+	ret = drm_encoder_init(drm, encoder, &arcpgu_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
 	/*
 	 * There is only one output port inside each device. It is linked with
 	 * encoder endpoint.
@@ -293,29 +392,26 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	if (endpoint_node) {
 		encoder_node = of_graph_get_remote_port_parent(endpoint_node);
 		of_node_put(endpoint_node);
-	} else {
-		connector = &arcpgu->sim_conn;
-		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
-		ret = arcpgu_drm_sim_init(drm, connector);
-		if (ret < 0)
-			return ret;
-	}
+		if (!encoder_node)
+			return -ENODEV;
 
-	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
-					   arc_pgu_supported_formats,
-					   ARRAY_SIZE(arc_pgu_supported_formats),
-					   NULL, connector);
-	if (ret)
-		return ret;
-
-	if (encoder_node) {
 		/* Locate drm bridge from the hdmi encoder DT node */
 		struct drm_bridge *bridge __free(drm_bridge_put) =
 			of_drm_find_and_get_bridge(encoder_node);
 		if (!bridge)
 			return -EPROBE_DEFER;
 
-		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
+		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+		if (ret)
+			return ret;
+	} else {
+		connector = &arcpgu->sim_conn;
+		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
+		ret = arcpgu_drm_sim_init(drm, connector);
+		if (ret < 0)
+			return ret;
+
+		ret = drm_connector_attach_encoder(connector, encoder);
 		if (ret)
 			return ret;
 	}
@@ -342,7 +438,14 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 	struct drm_device *drm = node->minor->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
-	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
+	unsigned long mode_clock;
+	int ret;
+
+	ret = drm_modeset_lock_single_interruptible(&arcpgu->crtc.mutex);
+	if (ret)
+		return ret;
+	mode_clock = arcpgu->crtc.state->mode.crtc_clock * 1000;
+	drm_modeset_unlock(&arcpgu->crtc.mutex);
 
 	seq_printf(m, "hw  : %lu\n", clkrate);
 	seq_printf(m, "mode: %lu\n", mode_clock);

-- 
2.43.0

