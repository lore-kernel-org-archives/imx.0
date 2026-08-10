Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB474052DE
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373515; cv=none; b=EC8uIZzfqqgg2A1i2zsnc533iZoDFc1FuqizKgLOiig4D0dxNhJtNkBAmk34JLWZcCQlB7m6OhrmWakqV1lTfK31XDobncVLCWoUB3vOFPnNlaDc5IBbjxagha7cDSJbreKmv1YpzTxmPZafu2EWn2ZVQ8MQBxACu9cMbTStE68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373515; c=relaxed/simple;
	bh=r7E8ZVmX9Up1oISda84Old2tqIxw9+NGvdtLAuv610g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ubtx5b+HJVIjD+plm1DlrlYfIMZ+oRvkNPcgj9hnCEFDpoEzrGVxCW3Hebe5L1Ylk70m9cDNdZ+HmYZZbj2wOQRPQuVuehad9cTVgh2tyK+cNWBRsaTghtI6tKphVlZFo4pmFbg08y1AHCkWazpk2zFbtnTgtXDybB90ixzxtrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0iBKJiv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeKQNLf8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0iBKJiv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeKQNLf8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACiv8i914555
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDFyPqw10Ep82ElDuZGKcT1q4iRZM5kCL+pWZOCaT5o=; b=h0iBKJivkSLJmqBV
	Y+JcftgGcaGnvzQ+Wfkzz+L9SNN+MCGpFTfG/92s2hjvMAI3O0QM8NcaHIxz6qTR
	UvbfhzNT5nqKVX3mIjF4GkZQQ3ASdMY1KSjR2zfWPeSYpy+FOjf2cwyEZqDCt3i/
	TiSrl8Jg3N2Dh1dx6ewpTMkb3G/SbYgF703AQPVJTJIqQukmhE1ruRjQqbaNOnnY
	P4APEQNESwMiybS3RZVNxizROrIT790tQXTyz0WnOqOCbPqCg7TE2FwqOMWYAM3f
	2QCbXSm2Pk2qRBxe100K5hgYc7IHnO0jpFDmxrH03Ima4IV+2BMkrtoqUagFkw+W
	v7eGxg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v921m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eac2620cb0so23438176d6.3
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373512; x=1786978312; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDFyPqw10Ep82ElDuZGKcT1q4iRZM5kCL+pWZOCaT5o=;
        b=KeKQNLf89TevLIXyG0VpOeNSYXE71aw66W3bAtq8X2mq5Z+bmMPmmt1AfLhB4n/jUo
         kqRhB6IYjoP+w51/XmKTJ5z6y8u4MeBWkI0ed2tcdcoiOBcJNHGF7BJ9kz//jAtwAxE9
         r53WnnRWaxeCv6H8pysXbO/zimMGkdY7AWUo+bug+aDmmdx6L6pdQnwp6gOjyWbxggad
         rWdToon9zK27ZPnnI6WfkwXpe/P2HnWhsiO3Sw7m/U/1kYaFZEV3D332HNVJ3obZ8LR5
         ECcv+aDyon8HR57KdJMkh50ApMFA+eA0ufj6g4U6PgVZdRdRW4PqqVjLUIkVeojnoiN1
         6mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373512; x=1786978312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDFyPqw10Ep82ElDuZGKcT1q4iRZM5kCL+pWZOCaT5o=;
        b=K/3YprUOb/tl5CR/kYJcfKySqUD4KncSALkDIuCL/hWxUCJ09jTAfKWtWo419JeDDU
         RsOXvX7PjKcq3bOAp8MQnO4GeW+5dl+veoJxqYR3GVpSBfAK+7LdGZR93bZTRVFRegOR
         /moGw02hi7JrIuKDQC0Tj6E5qszhuXGKdKGHhk/tQKIYjW1CFE8NMDKW/MjdeoPEt5SH
         aA6ov32JDOHuBT9qXeTiHD8zEGhbeM5b2nRD5wplEIA87p3b9mz7JpcC6apWnhwwdb9G
         hzOvXKsZPPSA0wP/RwyGjLA6xSQbI71ojWl0erN80N4AViKi2O0lKarDuwkDbYIz3wt7
         Mb5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rolihc2BZFNnWaFCZTHvsU9wZW2/hv9tUWafp3Nwgf6DSgAJi1w2MUcONl9zWF3L3+jpCM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYykUEPRXyHHqga4gok5Ek5yDmGy7+5XU8cY5ALIxV4JfHFjLD
	eljUNc94Vl+obzPwFa5+sQsuZpLYbbqEFWWgwmIUMqM8XCbkMnvkma03veD0SanBUEz6cbeFoD7
	+v8YAg+PTgN9fDbNgc5PbUKiahavyvXxhP9GIed7/ukdcWnbSKdowFjc=
X-Gm-Gg: AR+sD10g+QX2XuYpcBHqko4qrDyxR1dBzYW5yKASVfiUj2pgTmHwio1kHudlgfhFXTb
	wN9cVD0CjuWM4KBQYjF1WcNYu7zELbJTzZbnvhNK8wHIZSf/sSxCsUZpxNBMfutF7FwcDK4FoMH
	c0SedExypQ7OvVE9VJz9HlFu5jwToEctPQT4hc3DwD+Zy/SFipPS86R87Oirl5qsQTkjOdv7V/z
	NHn9YxGMC5xHe6qUJ+VU/ri26MT0RHse2xFj1Tn5kHtVpvG6ujWVPY8yugqM6Dfjhqf7MBUeKvZ
	ZrP+yCBR+oKnuHh7CpZZzp6dQfn3ezh/vPpJJaL17KNdurK7VvrhTm0ByUEsFozV8wiStFum8lG
	W/YC9mvBYBIpbzD6TK683GYwKd6cnNuO17rGaRD+VLsi/NQ1wxi884tYrRII5e30NJb+n1NW8Lx
	c+a7NlUFzGQkuzDQ==
X-Received: by 2002:a05:622a:2b49:b0:527:6d4a:1970 with SMTP id d75a77b69052e-52d20a7bc1amr264405151cf.38.1786373512058;
        Mon, 10 Aug 2026 07:51:52 -0700 (PDT)
X-Received: by 2002:a05:622a:2b49:b0:527:6d4a:1970 with SMTP id d75a77b69052e-52d20a7bc1amr264404441cf.38.1786373511644;
        Mon, 10 Aug 2026 07:51:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm22489661fa.36.2026.08.10.07.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:51:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:51:46 +0300
Subject: [PATCH 1/4] drm/imx: ipuv3-plane: do not advertise separate alpha
 formats on DC planes
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-imx53-fix-hdmi-v1-1-fff9b1b17f25@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=r7E8ZVmX9Up1oISda84Old2tqIxw9+NGvdtLAuv610g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeeWDVybdK+bajyFR2U9qOC1Id33rHVYsMqrqR
 jGBG/sFn9yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannlgwAKCRCLPIo+Aiko
 1atqB/9Q8iKGctDO3jyDeWnHHP8qLR6BFfYSRKtvv7cIX14gCWNXxKcaDHsXJ1Eef1sHbQjrM8i
 rC3deEXGiUV1610r+8ro3YZjtsVFpED1MV73KjDSHp7skOMTFskWtM7zZDr42w+VZ0Ym62vcyQT
 4qXT/xUsZE/M8EQixz8cx8/TqdOSl6/zmqjGSBjvPKu0Zv+I0/DDIvKgx6eamKtOp9/8Nx7N8Ml
 Mmisre1dwGHWqBxx3hF2Ub4X7iRhYUMTLFuQN8vMlaB6nPLiqNnVp99lotDQ0emD9PXrNau6OM2
 ilucfD44wB6zE0lkddulgXdP2fC9GQWxudLWE+2Bv518op4D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX0yg4kInPozAb
 ZeAXoeKiTS2hG9OySm1ru/bF3+T2mKzDCLpPaaoUnxPzh+/MhhVo18MqF21juwQD7UfX0tgPADr
 /cT8NQoUApFQXxl2spKBz7PLtbZjCbs=
X-Proofpoint-ORIG-GUID: 0NjNpOBJYMjROw7ySP7ipevYSf0coblv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfXzDWLrRFg6JtL
 0EU8L/kvcJ81PA1svkCSLEv9mv4LV495YeuyQVY/Peia6BTS8B/iMmxbyFYSesbZBxBShPqi4Iq
 NkjKjvP6ai8UgpcHhdi4ya8meJP0HS1atwdCElEEAV0bM1n8mPhBvDsyF2cHfpaEsOAFA0zoYJD
 SivDiLBvkB25pzFh3QXw+eY/c7R3V4oEkspuouZLZzpcAdeA1VcrzuAx3yVU6JoAIQzSBOzPPF4
 6CV3kIUPeUxs45bK/7sJOmZ9a3iZ7s5WlU4JTrM0zra0ZVMETVGmmKOxYj/4oZqoLrYcR/t6TCW
 gaDdLECKr7mv2KiYaU4MMnh3B6TxGPtgOeKRCao52izUqetnC3Thol3riHTfP4TpS5keZoeWDSF
 KVEce4r0BDCPPr4Si6FSu2AwuTWddQAhtk6cJ2sGLoom4DHhc91mkjJdnqbc+/lFr1opyj5LtnK
 VYS31F0X2fyuy3DTJDA==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a79e589 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YURt6oeoqR9mFI1qLTQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 0NjNpOBJYMjROw7ySP7ipevYSf0coblv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100128

Separate alpha formats need a companion IDMAC channel, which only the
graphics (DP) channels have. ipu_channel_alpha_channel() has no case for
IPUV3_CHANNEL_MEM_DC_SYNC, so ipu_plane_get_resources() leaves alpha_ch
at NULL for planes on the DC path. Yet ipu_plane_rgb_formats[], used for
exactly those planes, still advertises the six *_A8 fourccs.

Userspace picking one of them gets past ipu_plane_atomic_check(), which
never looks at alpha_ch, and ipu_plane_atomic_update() then dereferences
the NULL channel in ipu_cpmem_zero(). On i.MX53 this is reachable from
any client scanning out on DI1.

Drop the separate alpha formats from the RGB list.

Fixes: f6b50ef14ea8 ("drm/imx: ipuv3-plane: add support for separate alpha planes")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index c7ec09e557c1..a0fd39eebbbc 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -96,12 +96,6 @@ static const uint32_t ipu_plane_rgb_formats[] = {
 	DRM_FORMAT_BGRA8888,
 	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_RGB565_A8,
-	DRM_FORMAT_BGR565_A8,
-	DRM_FORMAT_RGB888_A8,
-	DRM_FORMAT_BGR888_A8,
-	DRM_FORMAT_RGBX8888_A8,
-	DRM_FORMAT_BGRX8888_A8,
 };
 
 static const uint64_t ipu_format_modifiers[] = {

-- 
2.47.3

