Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3CF41378C
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373519; cv=none; b=BcVIYze/NQpLqYDegdY5jxYgBtvdtgVgZdtKlXqB/k+cAppUveKn/KwssztDyWglR0w0XYz3PiU9C3IPk1Mla1zKs1irRqZpZ46P4gM8bDhsr86meF1J+WJZEp/eQFRYCBNwL5T8CZrRD29KzVDs4GZwBD6lzCQR/tuR50xsZFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373519; c=relaxed/simple;
	bh=7lyUVLekb6zlqpOSAGMVtbpV+Z1fQct7CYaiDbqLUpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0tbDUtRu6om6LY1k+xKuysTLy7gtr+fRTkHcoDladSHV1XryjzrO7FbACPxV7RftBoSLTfq9nmCbcKYIJEw4MxhA49ZEvgFxOHGwv2XOLpWg3qnheb/C2th9cPdubCGdIyglQoQoIFPSqcaZ0jaNX0S45cPVtz2/xB2fW8E0CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbbvljsH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAGWDftw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbbvljsH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAGWDftw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjr091597951
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqPA7hXcyMthrwG82uXYojOfmSg9zyync4goyZRZBhQ=; b=nbbvljsHFd8NaMv9
	60Ymbv+2UWGawpU++nYS+S9WZnBDLS/7oV14ocm8KpwPO4TDMCc/qcOXyrrG9D5b
	1miWShnWj0qWH3VQniFaVj5QfYFZN/VBH8XhOA/bnJ2b3wcObKT3Th6P8TMTTeYG
	3TGxGNJg9Qkfv/eNqg3wuVaRtOyvCLaVYargiDmRDg5U6+voU7YRysiwmC/hlJLP
	jvhwUDdsz0JSYOaxY9LaeSt4Sp0sd13XbMujRmBMiLD+NDqVKcJKBhwB4/ynaRuw
	UPR/joELBkeS626z5LSjRN0yqMdJbd0o1ApYpNRlQ7vISG3RNP1xSK9hTxTJmgzN
	5UthdA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6t4du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52cd0374265so38703821cf.1
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373516; x=1786978316; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqPA7hXcyMthrwG82uXYojOfmSg9zyync4goyZRZBhQ=;
        b=dAGWDftwtH/YHYmhVefHzmnd27bakBStCKsK+NVXd4yDgom41golqOkhNJ83AeTggQ
         sX0sJwAB2jfMcUCrP1u/awToUJTNIWhANnj1jXT3h/RP0F4+2vt3cOr0zOH6+MSO+ePd
         Lr/Z4Pr2ouOinv9nbB6q+i6cWjbMR1f9Fk0UTb2g5MCV2sIO8s0dZ61jCpj+aAfblLdt
         wgCgHwhIG/BMfVuCFcplRj0N/+JXXGIo40YwZ/jQ06UejIfMlkzAQpxgwEz2VNp4jLX7
         tixu9bw5OOkrJLSP5o2aGuE4qCqUVkH2dTL6ZqBGPgznVuQAc6Ion+Uetn7y+7rw7v6V
         zGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373516; x=1786978316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqPA7hXcyMthrwG82uXYojOfmSg9zyync4goyZRZBhQ=;
        b=bTbOg9sOtFEJq2086ueqQ6TGwDV8ecirJauxHQ+XQlzAp1OtnZmPs5wQfFoTttTBk7
         ABfjZkvTObXvlmvyjPoVlHkLxCiB4XERLnoikpuZauHnzJFk1x16WLL/fhpHUOql3h/3
         PqaINCMsvWSFWCotj0J71yGtECzHqIZQELILTG2qY2UBQnwizQIQouFcEixHsn2vSYxJ
         i++7Yld5RqKzbtMrmdxD3v6wwFuK6I10C0uQB2rIhvRIkROODRTy3XhZId87AmBaEVin
         ApFawHAMrFEWlEHzqOp1d11Cr30u+lkl/WwbYaj8dGp1IspYV7tSBqw87ViDVccR8oNv
         F3gA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9goqDBUkXem+hueINe8l4HDMq8wwz0KAWWGMQPEyGL0UFGxrQT74rJGx2zq6UYi0Kkac=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCig3ulFbAdCVV6+ogyMwncsucoN2ocot4rwEmxlSR1bPtFyQ5
	/so5+Q/Ln3vNH9lVwAKR2oJLCJE7iL2v/jPEcSiFRQDuJ6jiEKuJnDK0DYdt+HHzV6QS8XZ3PfA
	Q00y8Kl34T5AIjkAv+WrcCWGFbkaYYrL8dQ2gM95ChDVJ90dYnxuiLLM=
X-Gm-Gg: AR+sD11SguA/m8lMQ9J5aoBJcz/xX66+4H9A6N1aMYSD3wX1Ow8qkgewrjJA+jFDkds
	oWUisB/w73WLs+hmNT3AMQnB8g9+QNbh5twc4difdnMXDPgJsanKdU2+LAvAnkA+64/J5O4IBX9
	H72iU6ENxY6PoKK829Zt2kL5zWMRKbgL0EVyFv7XEg+7NP992MvQaVvKqSoRA8pFnT8oPQuZA0h
	1x66qlflZSCjL7Cm6VdL5jdfv8ZBcTLbDEtkCAvrRbcdyUhYHRFBVGetKSXzUWMBCci0Hwxr5ws
	SysEhpk7eORux3DMEtjiFxFf+tgJqOWp1ycLZ6ZASsR9m/HeweAoALGKv8KUa5j0xDGxZ3u+fn5
	zjfX8gPHxETk3Hv7/3TA9ryTkn+w/Y9NCpNGwUQFDVHOUbICzUXq+a1G2DVTwK0XS02erKqovas
	/oFsWWYeIVjAKwOA==
X-Received: by 2002:a05:622a:1f1a:b0:528:3142:d466 with SMTP id d75a77b69052e-52d20a920d3mr246432101cf.41.1786373515735;
        Mon, 10 Aug 2026 07:51:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1f1a:b0:528:3142:d466 with SMTP id d75a77b69052e-52d20a920d3mr246431491cf.41.1786373515360;
        Mon, 10 Aug 2026 07:51:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm22489661fa.36.2026.08.10.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:51:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:51:48 +0300
Subject: [PATCH 3/4] drm/imx: imx-tve: probe DDC before claiming the
 connector is connected
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-imx53-fix-hdmi-v1-3-fff9b1b17f25@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7lyUVLekb6zlqpOSAGMVtbpV+Z1fQct7CYaiDbqLUpc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeeWD9jjTXdp/CoYzaPsKhbyUM9+TRBy79PDfc
 XNO7eehHrCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannlgwAKCRCLPIo+Aiko
 1WPOB/4hXVGf/LzwhsVzCfMkzOBW4qjN/Ris2XQ255uOOa/LZjSJgMWkQVFfI+0aN2uCQGqzWHH
 4YQDal7J8s8zS30byb3gcc844q6FobFk+COFnofwcmZdJ28y2Vi0A2D1V86Frfq1s3KamI6jzdO
 R1Z6W0tynrioBOWxrcHGooKizE4yYiDsE/ExS+An0PoigjfeniNSsW0CGoYCRBbk5omAmriH06B
 V3CcHqMmV3ekT1hTga+WWyuEBPwqDuHrriCHNVUMq4jRHuObKlh7var03UcK2QaSbUpDjH43HPx
 I6eFwO/UtgiAybX2jJSdJpn4PJ10kpXUz2Utw0BgHGbFrFcd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX+IIGFLqxX9br
 drPmzh8gEP37wVp5e/7erAX/vHhwmkwh8wJgimvKAXVbBY7QuHEBmIt1ANXXokaJGKigdA4Aynj
 A/IjApeql5Rt6j4/FnNTdHYM7x3/MM8=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79e58c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=f-i-my0U1ELCb1aI9soA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfXxkm9c+yHh5V7
 nBdqdK7xhl+DWFCZZizh6KqsOoCWUXKEykqEnzcLffht/JNtFxP5Ck5eEG2IY/BsyXPbeldBHrx
 +Q3kCubQCYNHZupQD2HFDK/TjkL2AkL3TaXhtOCMyBJHdoFdq7oqYg7cfCaBYeqt9kAXq/imp/1
 qCPyUs5Mngs90QzJB4kMi8vIf4Ly7F8zEiZsBYhOt79WgRBSOn/VjtjvfGlz3kef6SsxK7Kb8p4
 2BT+VXKT0qr41ur0OZLq05V8Spo+46jiGX5dEV+UZi5gIelq4+16pM9E5hPlYY/tPYfeKvN6EmI
 BYFXENaBZ4OXXyy4UyX3RU5ctmm49LlbnS9kbAbcTaf0yIcbq/XrvhsLGFt6EHBh7JzZaOtO4A3
 jpnfoBg7BDk2ASHj7LVDpnW8b73VezV5EeDLfadou0nsoAfM7jPp07BrLbIWdnFVtsa7kXFwwwo
 PfWoaxKPLcGGLExVtAQ==
X-Proofpoint-GUID: YRTB4-HD3kl1KNyiFlsvRN22pvApAA2A
X-Proofpoint-ORIG-GUID: YRTB4-HD3kl1KNyiFlsvRN22pvApAA2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100128

imx-tve provides no detect callback, so its connector is always reported
as connected and always gets the drm_add_modes_noedid() fallback list,
whether or not anything is attached to the VGA output.

On an i.MX53 QSRB with the MCIMXHDMICARD fitted and nothing on VGA, the
fbdev client therefore lights up both CRTCs: HDMI on DI0 at its preferred
1920x1080 (148.5 MHz) and the phantom VGA output on DI1 at the 1024x768
fallback (65 MHz). Both DIs are ultimately clocked from PLL4 - DI0 via
di_pll4_podf, the TVE via tve_pred/tve_ext_sel - and every link
propagates rate changes, so the TVE reprograms PLL4 underneath the
already running DI0. DI0 stops generating valid timings, its IDMAC EOF
interrupt (which ipuv3-crtc uses as the vblank source) never arrives, and
every commit waits out its full 10 s:

  imx-drm display-subsystem: [drm] *ERROR* [CRTC:40:crtc-0] flip_done timed out

The TVE outputs have no hotplug detection, but a DDC response is decent
evidence that a display is attached. The connector is already registered
with its DDC adapter, so wire up drm_connector_helper_detect_from_ddc().
It reports the connector as disconnected when the DDC bus is there but
nothing answers on it, and falls back to unknown only for boards that
describe no ddc-i2c-bus at all, which keeps those working as before.

Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television Encoder (TVEv2)")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index e861b8b9d8fa..11ac69561eb8 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -322,6 +322,7 @@ static const struct drm_connector_funcs imx_tve_connector_funcs = {
 static const struct drm_connector_helper_funcs imx_tve_connector_helper_funcs = {
 	.get_modes = imx_tve_connector_get_modes,
 	.mode_valid = imx_tve_connector_mode_valid,
+	.detect_ctx = drm_connector_helper_detect_from_ddc,
 };
 
 static const struct drm_encoder_helper_funcs imx_tve_encoder_helper_funcs = {

-- 
2.47.3

