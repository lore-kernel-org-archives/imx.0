Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CBD42B318
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373522; cv=none; b=SKzVu7u3WdVYhwxOffBO7wo5jxnVoX1P1wyT21XheLMSewZ3uPBs4ZQYlPHNC+12M9sf401rnln3nnsBrrkxIzlhONbvo1UOheNcfLkZ4wW5Z9LYakbteVUKB/lSfree6JT5NUO2/BJ3rxt7WjttT3369NyNuE0GCQ8a4EHxp/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373522; c=relaxed/simple;
	bh=AJVGyN6ABsrumW1cS+QhP8uMJiKdvZ4L17DP94TV7oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAKyVpose7uJ4MK//tPclp2FLb/MELuHHG5ma32B+oAQCQGA3APXrQzt9hwcW7l5q1vHO7mCNAb+kSW1LutdRwG01lB6gx2B1HC0yChiX+DhoopWZfTnckfu/BOdc5lX4PoNzDVmWAgczHJahA7WmwHrTbMMHSZbOCoy/rlxLtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ImZqAgwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTP9Y395; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImZqAgwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTP9Y395"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj0us1671300
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kTqFwWAy8gxz1MmUqc7zci3CtGF3y+5TmAl/jfQIgWc=; b=ImZqAgwNjTbYRndF
	Lb892AhJfvCwZs3t0nPq9Lnk6u1N/mrzwPU1guaeZL3Fpgu5Avs6XoQvzJ8/Xknz
	2eYfQB/asrZAoA1VF2GDa2CZvdPU7gTXRI17ExTK6+0rd4VtT+f3wRgCaGDbNyyR
	wcWhSfdml8kZJS88B2fAFxP+576pw8W4kJR3p77wNhf1rzv3uFDqTSuNW3xfUPKz
	Z+s/LARBMQEjcjfhoBX6n5cChK8yGCzyR45n9tO3CYXNwpl9xVrH4OAFLS17Bczx
	PRIo6om31kyIMEPOBcd+iEVrb9fnbJA79h+yGAfFjBHgNljf17Ys4WyLAbGzcNUG
	HFhsSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v2a51p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso172559485a.0
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373518; x=1786978318; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTqFwWAy8gxz1MmUqc7zci3CtGF3y+5TmAl/jfQIgWc=;
        b=jTP9Y395SC9I0knBlSrgrxnZD5khlFuU4KjX7jhL2Qb5fnZKmTBK+Q5eO4+kk/9pDL
         hxpy19HFpOU5RiHQ7NXBp06j8z/dvVDiSwFfNLBKhIdVAtG7JwvkTDiWY7AGWgWl5yBB
         zri5DvVUFClsUgvBpEkg5rQKc9ypn/bO3wh89fswO/2fXu3su1WsTLL8hKJBay29khZL
         nWTLPMDnpdMba1bgBEg9CTKJR5HaB3lLHy0yED8v9h+SVR3VVCL5HcEcbOfTDqV0Jkn8
         XFr8spWYNZ8MRfTE7o5UXgmmyorl5r2Cp6D5azwpYjK/IRmPKH6Pbek28eVUItlNtNVK
         vvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373518; x=1786978318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTqFwWAy8gxz1MmUqc7zci3CtGF3y+5TmAl/jfQIgWc=;
        b=sNOV1UqMppV84PKIMm2DfpAfaDOd5JbyWKOBEEopRplTkLNOsdl7/7SEUU/lA+yIQN
         9MipuY+sEuq4cPQykZsqMkwAVsFhqxDF6XUb54U8izG+oiqFi/iNg8N+StDEpA9+8yGL
         71KdIkA2ZZCTOdvnMuXp7FeTEhVGTIO/1nVBNpe4xMJBoHT2mymsjvgg9mJgHSNHKO3S
         g9XmcSPaY8cUtafPEGTTgYPT8IDDM8Vzyv712LQwOFb6ABsLQwj1PwhI7gEVhMz88IxP
         288eIC76VIXmQX8jLGkbMHoW7cJuwqyrEtfepk/uxTCcab9HM74fafh9xlGxwXHsj/DW
         7CRw==
X-Forwarded-Encrypted: i=1; AHgh+RpzzaZtH047M1OqcO2VKLyFn4IS7taElQOj4Cqd1Jwy/0Xyl1N5bFP2I4S89Xe2N8PoCrI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnKoKYHYLVHX5ylPPZtVyrUTWLiUKcQGP/E+mW9L1pUL2Jny3f
	xM/ufWL2sp0XBO8Ee8Q8LWlMqDdiQYPbP1Q1tZYknpZoidhuBZL+p+o/NISxh7xHZIoAc0SNAsC
	YzW966VoDBaQzxV32yrgkB+MBUVCsJFWaoDbMUPg/kjkzHUar3OEBoKc=
X-Gm-Gg: AR+sD12AI9SqP8efbynatSvMhOSx+i6UEo7mCjjKrUQlpDUfcBoQMtW1tddhWdIsCqY
	Dc+yFR7gdPS289y9x3P9PwSrbZThjGAD1FYTXmTaGjhLeCfz0PKAFCGR3u2HatTisNLcC9bpJW5
	kILz0765lQShO3tfhZpjZjHzU7FA6gsfergrExwrKxlumBsMrcPATBjUnixeA3jArp91e9uSH2c
	/PkrGqNanIEZavXLGI3uIvewV+bJUfeijyeIC6IEDv1kj9Vstps5fY5gswi/GhQC4HNWTC0aYsn
	LMoGbvWMovyDjng2wZlQgSsfuvTaHzKZ75sGDGbf8oJ2hhHHa0BBn6fMo/x3Qtaizy6Q7ZAKdIJ
	G1q87fDigULEx/mi4wbimjAvT7NrY/FmIU0FpZajIPxtEYk0d2ZHsTUQmIHY9wIsuvcqa+7fnEs
	3JcFiiem/ZvsRTDw==
X-Received: by 2002:a05:622a:5806:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52d4be1ab03mr27753851cf.9.1786373518195;
        Mon, 10 Aug 2026 07:51:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5806:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52d4be1ab03mr27753211cf.9.1786373517789;
        Mon, 10 Aug 2026 07:51:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm22489661fa.36.2026.08.10.07.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:51:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:51:49 +0300
Subject: [PATCH 4/4] gpu: ipu-v3: di: report an unattainable pixel clock
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-imx53-fix-hdmi-v1-4-fff9b1b17f25@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AJVGyN6ABsrumW1cS+QhP8uMJiKdvZ4L17DP94TV7oo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeeWDuniPTM7aG8qyd3SuSyxN4T3e+ikAJWC8I
 5rfNOm136aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannlgwAKCRCLPIo+Aiko
 1QRbCACEWOb6JNOqxsn82iOBHRW8q/uQaofmrqxQRemzL4NXdIOQdzJ1B+QcB6YfmOh0AiJElgX
 vQ3NGPnp880zSiX3vPetajSr8oI1v7lRGW3EPKl/xn5vkxvVKLCJt4La2VKHhy31UV7rTBrdDPO
 BIJ8J8ZvVSlq/oWe4b63AMCfm4j1u0Yr6fCCpQ+FS5QTux+jqVasFHOX36lLE4X7y1BegpsKpvH
 s4OIzyMHPrptSM28z5ClQ7ARSXTIzGoF5ZJJrFqpKEMDxYnQ2rExs2TYM5hDThkZFiGcnp08Lot
 Q+i/4s/xBGVsPHWKyPQ8RBh8BUUlEhcbv2CtQafRVRFbOazG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79e58f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_XsFwZo-ejPuOgsMvnoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: deDxwrX9K19lGywW13e5mCuTC58TwUbF
X-Proofpoint-GUID: deDxwrX9K19lGywW13e5mCuTC58TwUbF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX35fSjG/iJUK9
 2bHR4Z9o+2IOjqZRFnPGlnknlWCrNiTbSFIg+b6An/kJiH5H8pMlTLbVg0SqdqFZ3x+5aeRge7L
 S5hLDX0/EG8C9CfEdhPiw3/XapTFVy4l2Y/B8H8GhlP0t5ZTRp8lr0o0J9NM30YlTJoRv/5E7wQ
 Ih16InUwQEzLSQzytX/tvIAdrlsPDH5NKVO80+g/B7uQffJhVTFkhfKAeUmGNBO/rTfYTv4G81N
 yHkYYk/YvON8FTC6aVn4b/DJiBw+hdIKP4+MQopK7K8Mvccx8yoOwdYkIIVFIsXUr781H58Rm4A
 OOAsaC37d3WN+379+pGT0RdufQRkXKmW+IS5sXzvaL+Wd3eHAXUaQJtLktbTHQB+ekK6ZMB+Efr
 yg2IjaTQDWPeKAmpmfL2IoGocKeJLkEe3+hVUBUKHVOxWLCQmhaa0hv+lrJEWAjt4vB5xL1ZPKs
 lqKlTLZXBWNZxxotWrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX0di/AZH0XBCh
 HeSKoaLN02IJSPJlGCMEqRtt6uCeyvSik89BU1hxRONmBiZIbmjYI8A9mXBUFG9wsTXteTZKVZ3
 TmSpG5QTNyZNyrY/qLsicFVLs+IaF9M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100128

When the DI cannot be programmed to the requested pixel clock the only
symptom is a "flip_done timed out" ten seconds later, because the display
never starts and the IDMAC EOF interrupt that ipuv3-crtc uses as its
vblank source never arrives. Working out that the clock is at fault
currently requires rebuilding with dynamic debug enabled.

Print an error when the rate the DI ends up with differs from the
requested one by more than 1%. The CLKMODE_SYNC case is skipped, as
there the encoder programs the pixel clock after this runs.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/ipu-v3/ipu-di.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/ipu-v3/ipu-di.c b/drivers/gpu/ipu-v3/ipu-di.c
index 0a34e0ab4fe6..c971c37356f4 100644
--- a/drivers/gpu/ipu-v3/ipu-di.c
+++ b/drivers/gpu/ipu-v3/ipu-di.c
@@ -497,6 +497,22 @@ static void ipu_di_config_clock(struct ipu_di *di,
 		clk_get_rate(di->clk_di),
 		clk == di->clk_di ? "DI" : "IPU",
 		clk_get_rate(di->clk_di_pixel) / (clkgen0 >> 4));
+
+	/*
+	 * With CLKMODE_SYNC the encoder programs the pixel clock after us, so
+	 * there is nothing to check yet. Otherwise the rate is final, and a
+	 * wrong one only shows up later as a "flip_done timed out".
+	 */
+	if (!(sig->clkflags & IPU_DI_CLKMODE_SYNC)) {
+		unsigned long rate = clk_get_rate(di->clk_di_pixel) /
+				     (clkgen0 >> 4);
+
+		if (abs((long)(rate - sig->mode.pixelclock)) >
+		    sig->mode.pixelclock / 100)
+			dev_err(di->ipu->dev,
+				"DI%d: cannot generate %luHz pixel clock, got %luHz\n",
+				di->id, sig->mode.pixelclock, rate);
+	}
 }
 
 /*

-- 
2.47.3

