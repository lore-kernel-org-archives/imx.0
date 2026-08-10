Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6AD413D99
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373517; cv=none; b=LqmNQoCIAz+RopiHLxdDDEro2mJ9ZAtfP+VIe67YFF6A3ohgJfJxRr3UsJKXtc1gAq8/ZO5eEEWrMhTNLzApcPLsvn208O2Wnv9+2w/W/J4Ei/dD4KhdMGKYZ5TXevv/3dgY5L0FIU56CVhGplkPjDhk0uQDtqQFbPdW0+puQmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373517; c=relaxed/simple;
	bh=4QNydV7spsaEfA/iL4Q6QeiitR6lJ+BPeYG4Ij6Ga+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UznGP0jy4bW4zVjHgRcAGpPDpW5HQd+rG6AvZiTFBwgJcNeLcULKr9G5z+PAI9575Wq1utWFgMr2MSvmqKa6epuYks0Oz+QXaZSC7WDp3cwCCIMHCdoii4MMlN8g39cxJMZB6WvAlrXI71Vk1SlWuDJ2SNzZw50BtjmTbrHKzTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVQ1ypgp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TC/wJTf5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVQ1ypgp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TC/wJTf5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj9Lm1308574
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTJShaQ8ly4nCUgfAoU7CUotG9qknpirLcGSxiDk/hs=; b=RVQ1ypgp1BFX3scU
	OT8O+riaE4uKn+q9KFborw84tavN8QSApDN8x2eRpiIOghrkb2ntcXm+05j69IcK
	8rJv7zuF20n5XQpIvlu7SXMHz+3Yz2OipjwZVCGD4QIC61fWtcDmY9hwwz0oX/El
	UsvHaZ0nV6GGhgGz92PMrUzyATC87tcqln32NwrwP4zt/gqHDJN4d3PgtzlO/9eY
	LkTExkVvxFBGHi8OB5hpxq4KbPb3hQI2Ixjny8yme8MU7U0Wpdhlw4HD3cei3O/g
	8pUDUCm/XtnNqdQIwABalCd0Bsc543e4yy5OQuNmWYfK8gI0AA9GknCy39NYMjjr
	iQa4sA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqs63x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d28f8737eso38499451cf.2
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 07:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373514; x=1786978314; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTJShaQ8ly4nCUgfAoU7CUotG9qknpirLcGSxiDk/hs=;
        b=TC/wJTf5gYnV9hblaaVz+xEDaEInsS82c9SBDc1JTi8nr4tjHpf/hLniYmSE+touOF
         4eQchKo9pYSWZuTt/pF0o8sjAfMYtMf9VzdwyDApyhplhS9SH2naoCOYTIHdW2fdOdFl
         nsdTCbGxd63u8BcZebFL97uKASAhg1LapJjHLGlgVRYFRTyqQJ1T4BgHcvb0BRFQix8U
         PQ7Lwgs870xzIRd7xjwCVv4utg11rT9zQN+GmjSwuE28SSOw7cdarNXcxT6Njcrt2fzu
         SSp6SCGEDY3lY9oDPCcmXl2XTG6IFP7+d5J2GHpshWHLGAhQskkRJee7rCXgonqjBx3e
         BhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373514; x=1786978314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTJShaQ8ly4nCUgfAoU7CUotG9qknpirLcGSxiDk/hs=;
        b=NtS1PgykLjd4CuuzflpX4fR054vmlBrOWCDdQx+OlhcR/WF04Z1Eflk4rpbf2uclUm
         bzSHv6wWMvAv2rrax7TEdP6XJ3zWKCiPtBz9kkjw6QDm7mJ72oa42Xc1JOHYvPdfYeBq
         RxTFK58eyicpeKaJ4MfcSWzMBeNkQZWkU1cX+QAbh9krCaSu5hEi8wrdqS0dAalxHzrv
         PlBD3OGYeRRfdQfqZiYGAI12QtSlfHe7GXIbKVlFF9/gf1Dv7IWQlGfXEcvX9JqlOwAp
         pHU6uVhDf3EeFoLduigsQX82rGoE+1UMHH5wEmxyuDjdSpFvqIQSYUOSU4z2FRn9rJsS
         CboQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZh85UhPi4iKLE0MBGQNsx1tDEXy/GLBjjRW/dDiwJ7CofWrMGyR32jZVMzsM2AI+e8CQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzht49KxgFuScE08ECgs5qgX6/j2BGDYFX3hXQJELVghMd4X4x1
	a5erSMRK6KUVX62X1WsEBKMXf6gGCkX59RRYrU+/+sRLyPAp5WMNzN0+NwPNfzPgFDyQNwy2xXA
	Pt5jGzd6fs4vQeoWdNpIhRCCvpmGzl1klfQgpL4bj35HBZVD/4bZYNWY=
X-Gm-Gg: AR+sD10ZSPtKH0ZKJFAFeno1v/0GuBza9wV3AxRgTiZ4VKp+2vgYHzit2EY2gT1MrCQ
	Rb8wvYa1nKb9RH6VzwFErRcoR9a0mE7RcUGEu/tOn6yloRBHfvFD4aEOGD+ba0TbuyxTQaosKEV
	0n7Tl5zfLp7PaUG+XfM0ffhUS9x3G8ZR+j9C/0H9a+Nj0KVhUBY/9F5PBwD+skDiss6OgWWDCqY
	Z7q4oRBhnA/9tDV3bPfg+/WBKosStAW62D8eUu4Lg5QhohBTUuvZ5m3t9ERrMUIiyeGEqcsnj1W
	/Ow1zqX6qJ0uUhZboQ7llCCjBnp6NQjj8rWqdWirJz5SpywteI8OB+8ILbKYKfwAKT3Dsdq5ewh
	mXCj0ECw+dCLa1yBHtJhzktVUDFacxBQvN8IywbD4XJVbWsdh2gRIO6QcOpl0L4goJatSJsrmYh
	g/FI4OQeXgneGMcQ==
X-Received: by 2002:a05:622a:58c4:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d20a50c50mr250088851cf.33.1786373514108;
        Mon, 10 Aug 2026 07:51:54 -0700 (PDT)
X-Received: by 2002:a05:622a:58c4:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d20a50c50mr250088001cf.33.1786373513541;
        Mon, 10 Aug 2026 07:51:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm22489661fa.36.2026.08.10.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:51:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:51:47 +0300
Subject: [PATCH 2/4] drm/imx: ipuv3-plane: add the pixel blend mode
 property
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-imx53-fix-hdmi-v1-2-fff9b1b17f25@oss.qualcomm.com>
References: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
In-Reply-To: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4122;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4QNydV7spsaEfA/iL4Q6QeiitR6lJ+BPeYG4Ij6Ga+0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeeWDajN8HOrxXriFLb5kPXKQed7DBCYPlTJEJ
 6eIFR+YSEGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannlgwAKCRCLPIo+Aiko
 1WDVCACsjxkK997hWtj+NXAjCYxxBz2W6w7JaFqnwMTnQ/6a7fuwFDQ/RDQt/KSf0OCi2oUXplT
 o0PnrMFfRFPX25OQ9sxayIMVGb6M6261clcl9AQbWCBRf6vXz36soQ85Ip9v0Gxct33+c7IQ3Bd
 T4QLf6tDW4GDzwdFAlizX/BwMnM1k/7zjHyFa2W/MdTkm4TNJbmRzRzeO+V0b3GtLikKxebyiQZ
 t9GIeGES4E+xy3S7VSDpw0F9/ZVmEKhBA8HRTYl3QBmR6hQEsVakMphFpuqW1Nl5SJd3CphA32T
 V94et7o/IiGBQPQYmnDf0RZBiz4tmOooj6n8LGfkK56WHvkn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 1CPk73w3VVb30r0vNQCnnyqLDRxynHSS
X-Proofpoint-ORIG-GUID: 1CPk73w3VVb30r0vNQCnnyqLDRxynHSS
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a79e58b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5XQbaQfSCqgvYuQxrhgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX92IGsnrX5Ar8
 8frJts3CbM0Q3QxKQL7H91pE7CGpEkcA+DheUlsGim4sKkhMWwRX40Ym/VNDVX2AaTgsVYmLYKp
 K4GA1QyV+GKkUoYbJ5pU8IHZg1YxKIb9MS+Mtcr/vPmbj2LR1TcDByR6VwOU5ngENE9CxguzJBZ
 RdydEGSvPLWx6otpTjaIV1d2mfFo69BRtmQMoLsVpISl5FazuQF4CzEOsaBssftyVa5dK29T7Yd
 iUolP/7TYjgFLDV2fTXd46sFpgL+LeqjrEbLyCOSQZYv9gH/5docaLedM9BFv6Nn2bFf7YO8bN9
 jknVIHHvU79KQFgoE0JuIchFmFgHGrcIqNwEdFDA/zgwkiZAF4n7i2FFbBGeF5qDf3isdzIwAwC
 RuzAmUdKJHMkY1DNw7Het3WTHl0VtapNGppBE33DmQqfU6X5x8mA3kv4aWChlzt0dgj/zB6q7p5
 pirokQxD3FEJ1tMi5jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX61Q3abbyi5El
 sWcqfqnpNYZ2nzsOFwEOIJ/vRZuIX4hOb72vaX65JrUYsCF5R3EfFgXnLnxnYg2Y1aYWZcoA8VW
 r5VwRwf5ugbVJd86TNWoysy1kAezIMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100128

All three IPUv3 planes advertise formats with an alpha channel, but none
of them ever created the "pixel blend mode" property, so userspace has no
way to learn how that alpha is interpreted. drm_mode_config_validate()
points this out once per plane at every boot:

  WARNING: drivers/gpu/drm/drm_mode_config.c:872 at drm_mode_config_validate
  [PLANE:35:plane-0] pixel format with alpha exposed but blend mode not setup

The DP blends the foreground over the background as
fg * alpha + bg * (1 - alpha), i.e. it consumes coverage alpha and has no
premultiplied mode. Planes that are not part of a DP flow have nothing to
blend against and ignore alpha entirely.

Create the property accordingly: PIXEL_NONE and COVERAGE for the DP
planes, PIXEL_NONE alone for the rest, and honour the resulting blend
mode when deciding between global and per-pixel alpha.
__drm_atomic_helper_plane_reset() defaults pixel_blend_mode to
PREMULTI unconditionally, so override it in the driver reset.

Fixes: e6245fc78b65 ("imx-drm: ipuv3-plane: allow local alpha in ipu_plane_mode_set()")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 43 +++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index a0fd39eebbbc..bde5892264f4 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -291,8 +291,32 @@ void ipu_plane_disable_deferred(struct drm_plane *plane)
 	}
 }
 
+static unsigned int ipu_plane_blend_modes(int dp_flow)
+{
+	if (dp_flow == IPU_DP_FLOW_SYNC_BG || dp_flow == IPU_DP_FLOW_SYNC_FG)
+		return BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+		       BIT(DRM_MODE_BLEND_COVERAGE);
+
+	return BIT(DRM_MODE_BLEND_PIXEL_NONE);
+}
+
+static unsigned int ipu_plane_default_blend_mode(int dp_flow)
+{
+	if (dp_flow == IPU_DP_FLOW_SYNC_BG || dp_flow == IPU_DP_FLOW_SYNC_FG)
+		return DRM_MODE_BLEND_COVERAGE;
+
+	return DRM_MODE_BLEND_PIXEL_NONE;
+}
+
+static bool ipu_plane_use_pixel_alpha(struct drm_plane_state *state)
+{
+	return state->fb->format->has_alpha &&
+	       state->pixel_blend_mode != DRM_MODE_BLEND_PIXEL_NONE;
+}
+
 static void ipu_plane_state_reset(struct drm_plane *plane)
 {
+	struct ipu_plane *ipu_plane = to_ipu_plane(plane);
 	struct ipu_plane_state *ipu_state;
 
 	if (plane->state) {
@@ -304,8 +328,12 @@ static void ipu_plane_state_reset(struct drm_plane *plane)
 
 	ipu_state = kzalloc_obj(*ipu_state);
 
-	if (ipu_state)
+	if (ipu_state) {
 		__drm_atomic_helper_plane_reset(plane, &ipu_state->base);
+		/* the helper defaults to premultiplied, which the DP lacks */
+		ipu_state->base.pixel_blend_mode =
+			ipu_plane_default_blend_mode(ipu_plane->dp_flow);
+	}
 }
 
 static struct drm_plane_state *
@@ -593,8 +621,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	case IPU_DP_FLOW_SYNC_BG:
 		if (new_state->normalized_zpos == 1) {
 			ipu_dp_set_global_alpha(ipu_plane->dp,
-						!fb->format->has_alpha, 0xff,
-						true);
+						!ipu_plane_use_pixel_alpha(new_state),
+						0xff, true);
 		} else {
 			ipu_dp_set_global_alpha(ipu_plane->dp, true, 0, true);
 		}
@@ -602,8 +630,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	case IPU_DP_FLOW_SYNC_FG:
 		if (new_state->normalized_zpos == 1) {
 			ipu_dp_set_global_alpha(ipu_plane->dp,
-						!fb->format->has_alpha, 0xff,
-						false);
+						!ipu_plane_use_pixel_alpha(new_state),
+						0xff, false);
 		}
 		break;
 	}
@@ -930,6 +958,11 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = drm_plane_create_blend_mode_property(&ipu_plane->base,
+						   ipu_plane_blend_modes(dp));
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = drm_plane_create_color_properties(&ipu_plane->base,
 			BIT(DRM_COLOR_YCBCR_BT601) |
 			BIT(DRM_COLOR_YCBCR_BT709),

-- 
2.47.3

