Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7DF3A2E12
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 19:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280462; cv=none; b=r4Ua/H05lJ0XK3Ow4yHuaiVIE9Avc2lqcsnWAD2Y0vSvkjoqj9d+TkBCwXt0EVh5R/NjAav6BDmPwdh4zeXXUPoMT2kB76E7KWvwxyLrvE9zzDdSzxo9O/SnWYsdci3wfVk4MuNqocWg5oK3G9UnLNyBSrgvswKgMs0ier6YI1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280462; c=relaxed/simple;
	bh=v3ifKCsrwDtuvCvlwDYadGM1Uonf2WH1mckdOsVySyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCDohNsk1CBhw85GIsByk7tqasDH+DDydu4ez4BSr3aIbHPXq0cxl5ir9NYLNdUIy9XZfT1BWPyB2sOKRNioHbUhwHSY8JzpPVn5GyWcg/ZcU/w1PtiqRomXd7ocam1Pu+pN5WtoA0fpn8Xas+uAQkzkBwQ5N2l/DSPBgpG/0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPcw2XE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTAQXFfN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPcw2XE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTAQXFfN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhwEJ2168641
	for <imx@lists.linux.dev>; Sun, 5 Jul 2026 19:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3J7+oNMk7WM
	Q4KOiVM1+PpfhqlleI9nCGCg735LegyU=; b=hPcw2XE00hJiXGUlPJdzgAHVQzT
	3IKBxTpsdM3YltXY0Gb00tp8cyyqr2jLji+CKNDBWau5JTu+BreuyR01af4GFyfv
	ngpGWe//C62ZWMgkGJk4zSl0S0wOJ9lpQw3JAKnLg2fIs5pZCB7N4aamjssEjqJr
	56eMgt2RR1Wu9uGyx458onBujfZX4GqD+UxQKYZvfMFk6K6CooiLxTXLejKO9W0R
	0jkXD7cR55aEXj06BsfreVAtJNhMuxZgvDsgw5Rbn8a2yz3zzklaCOw3S6PIDyNi
	LSZAc2ZKjYucaa8JgIZQNxudHkYVpBDXyT4e5CmqkA1zH01od7f0TWn9fNw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8k8t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 05 Jul 2026 19:40:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f385887bso27832555ad.0
        for <imx@lists.linux.dev>; Sun, 05 Jul 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280459; x=1783885259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=WTAQXFfNq3LUPz1yP02U6FmtKNUZXYwrwaJ9j2nGH9KNEN2ti8yYVqNDTFQhcGaHf0
         W2pmUDuLFDkzxSb6BY4pJiOkdl8iSF5jUkC3UWD+J9Q7GouFC6LKfDHdbZP4q3rH87Tj
         4tEarL+BF3MfXxQGjeKxerbi4B+eoxXRHMpTVuZNjPmZqzt4rxdebdPb4b+T9naJjht7
         k6vkml+OD28B/AJp32iWCeT9FQOIvApq0pvWQt/QxLfOeTIUATZgclVGlWsl/oouN7Bh
         d0xkW9BTwxnrram+hOfWeXHdhTOfMwnVieL6LfUOZUb5bwHnrxgxPjrmEODe4nrmH+ra
         GVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280459; x=1783885259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=Lc5hH9GzYKEVOooxecwboowz0AtceDlzjEySy3Fn53r+BLcybkA4+qmfAxqmAXJKBF
         ZDKSnDXj9tIEJkXEiz+J47PWXRNjVg5WsnbV/G/4iDy6v8lnp4jLJWPgK9/JmqU+Tqwf
         sYLLvwOoFI6VlZgo/KWFEz2TFDA16GaXNpBHiTRgwuWlKmDp8iApgxu2jYxvVRxEdesE
         1/592ZxXg0XKT6zI81xw+nsiRRHOEeCE05kCVESdWe8BlQoMdkjzDwPY3e/EPwuY5QTJ
         uDknHW37vtOIEu2A28/s1bky7VAdf344GHx4xYz3Lo7chdBOKCkNHF9cfJsLwMkNHGwB
         fOsQ==
X-Forwarded-Encrypted: i=1; AHgh+RoF5pYl9u7zsfw+6yH3UpUqKRybXo+kHJKutAmdllf56U69xZ7Lfb0YTuI8sYWNZ56M1TM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSyfls4EO1IEGCXqh8XR7TegbzzXJCgHR3krHdxe9k0p/X5QaY
	deTT30SYt2V8nEwFdpHaKPil6UmxtjTKMgD8EVOyTIzyiUmUSM/ho9/1jE3cgaoByEcL1p9ACYs
	4Ejtn/r6TqW8WfUs7zTmUjTXEILLqwbDWTkucFjat8WYG3gZzWgUpO+w=
X-Gm-Gg: AfdE7cmE2S0imfUp7PB4tz3Sno8cSIa8H/Q85dssB91rAsaU2nXsEt/yoAA1tmPIbrJ
	vPcML+Kmh/l8pZs4ZMfAUDyg0PqPt7fialKX3dd7E+Nw0F40sJ+J1pVlzk+BgfVIcVL/cvGD/Gv
	BrhoekAfRolh5B/ybfw1HS/7YlI6WPNkpLV5kCV1urzGlDrWLnwEwVHaHbkr/hVRfF7XGlaBJPl
	ED2W3JEVfpQz2oVC49JXe5gKtLifzqpQRROD/1ZjkP37U0JD6kpdOh/YBONj53cjIYVA542mTmt
	H5dXJQfUD5SIfzYf2qSnSCrfT4hPopvnqjuKUn6U3iKYqqVuzp6crPkDjLYG+zhnOguJd55gdi9
	nMBcFQNkPJOgHiyIfzupwhtgedGLy69YGWfb6FA==
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369275ad.37.1783280458784;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369145ad.37.1783280458256;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 37/42] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:13 +0530
Message-ID: <20260705194019.2565498-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX0LOLsiubNDHO
 6Hxe8tldIsgZNaepJfdAvyK76qIvntaHJ+wnP5AAWfIPkxli6TA54PZh5qEBnszsIlViWpwZDCz
 c4+LFgqIvpxMplBQMjLNAE7DE7VrlCLrIRHNwArlmQmT9K5EiBJ7Bsj9TgOgt589aWLc7z5kLzC
 HMb06+6Ay8YT5akL+5AukW0qUwveImrp+zH/AyKV1DtXxr85q+/dIM95Az2GEZFooKiXmS7sFtn
 wXVy4UM3MmMizAQbS1tvhtcXoZpoqERzn3dx9fSOOa6+v8sxiAnMNNOD2G7F5K39TvdEKS5PNdX
 DaFYXJkVZ6uXNdZTYDL9NV9EIunqUUvBBsm+FdwSXknCYUSvXzTLgQq9564HvefFZmWxvIlXTUk
 Ete1xiAEb6NkYwCoy3gaedHWe+j05kv4Z2ZQsIcj0tbjGutlIRv31MWzoor5PRLeZtP4XXR5A/v
 wq4oYHZK07ByzNYUhWQ==
X-Proofpoint-ORIG-GUID: 3k2LroOCcKdWKZyr12jObpLZKaIkaV13
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzXPJElRoqGK9
 9gFP2ohOuXQ6BPpRAUx78PcQeDEV4Dw8dqRFXKrPfHPL5rciJmGNmTAS5vV/mrYoKwX4rENUVIM
 Tq1v3bKWAkqFSjq9Xo51HA0jyJtTdmM=
X-Proofpoint-GUID: 3k2LroOCcKdWKZyr12jObpLZKaIkaV13
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4ab34b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bc0a63457cd7..52c3381e6766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3013,7 +3013,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to assign memory region\n");
 
-- 
2.53.0

