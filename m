Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBB52D7DC5
	for <imx@lists.linux.dev>; Fri, 28 Nov 2025 04:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764302571; cv=none; b=FbnpzAm/qYYFxBpfJ72zXD+1RHxL3boEAFtYjnKtJn0h871p2tQWILJ1ca/bthw/KaPAD/JxAKtjImsm0j7/E0zxEui5VBp1LmOoYfS36uURJ+zB4hF6YI+kqtLpJlqSTp5DruQ92akqyhiI1u7zgfzPO0EvEBifjtPPjz6qFI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764302571; c=relaxed/simple;
	bh=g3LRNLCrYXLZC2Jel5BppEoAhXanY8wJmV/cSMYtpus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jIIsY0Ma9hkTpkwR5ud+efMqX5thdtIfCQMKIExb373Wpz4Ty6gIPNoHU7aTFM1XEH5L753cLA8Sa3PtsPp1elEL7SrDZLKVIz2ajnjEmhP16gV+gHCQuDtOffsBrhpDv5c38Tjf8w519DnHXjAGUfc22obDlh9KJjvU12s0XUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuF4foGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQDOVokB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuF4foGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQDOVokB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARLbZmb2146617
	for <imx@lists.linux.dev>; Fri, 28 Nov 2025 04:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Km90EERVGOkwzKkKYlpxgw
	75D/tpvcaDBTOSh7gZR7o=; b=WuF4foGbEw13346JmgFws6thH/j7S4NYllX5/s
	QOExsn7uEIkXUTMsGILsOV08ofSHcvunbLS2mQODf1mn/c3LIMM8AiVQk6OnYlCG
	qN0xawy2pZfv/XxlRJrR2+BStX7i4Sbbs32EenxSKQF051wlbzyT2KWfzNNq46Yn
	gyByZBPUVwUKKSse8QsMKJlXG9/QdO9BjxF8MdhBxk4yx4+X9rtxD/z3CJE9Qa2c
	nFrhxq3kFdsrWKbtSvsspETn6Yhh3/NK6agmMcQ0FRCmo0RAkf6yTpn26qkUHtWw
	jzisjA5H62vYLVjbFo6kIiKCUGpIxRTdDfpMaw0TUl9jEMTQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5j70d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 28 Nov 2025 04:02:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88237204cc8so43985616d6.2
        for <imx@lists.linux.dev>; Thu, 27 Nov 2025 20:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764302564; x=1764907364; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Km90EERVGOkwzKkKYlpxgw75D/tpvcaDBTOSh7gZR7o=;
        b=fQDOVokB7d5bD1TprpaI7Evipl2OrQDRMmjxoJP1q2LGhqpc24tpgneRBlDDI9LsT4
         1vaDviKsz2SR4Gz9FAplyL4PZSHT3raZ9Gr0MNzIA4A+wLhdPF3kpA06428qGnBscg7B
         AUHHOhmQ4W73NlDzb3c8VIZf84CO7k3bWA62FxtUaTa0Tjkde1DUuCibwHmAbfptqf8P
         CtHwElW4Wn8adivew2Q9VKViN4xtKw1MHzefHAvU99Pqt4uOELP8Y8IctTuJoa5+X9uk
         dVRDfKN7VuvZmQLsRfKJ/b0nK6T5gqfMTj4CBO4uXRFPoZZC/eMeRhwBa8ImwfNMJqns
         JT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764302564; x=1764907364;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Km90EERVGOkwzKkKYlpxgw75D/tpvcaDBTOSh7gZR7o=;
        b=hDd89QGKuWLxnfuLOwvN6APuKwYf00h5q9RZLjIfut65XQqWSvDKdMKYyPYEYYpPEL
         2AX6L70G/qMP2O1fp6AZWd9/wxvzETO3cUrxprA+mxm0PLKG2yggLXWggMvN/gYvSAhy
         mtCjTdRptLMHEjrj2Gl8VRj616Va5TtT8n+40ALWCQnEWh3ihClyG6Wx4Fw++fZPzGs8
         AEnUJTqe9qbEPbMHa5F3jyl/P7FzmDC68LiddAkCB9YaxsJltf1zl+T0KIcdLIiV//SC
         P9CE3MGZNjvCqxjcNDFUsPjIS8fbgdla/lxJ/Y/aAhxGlxC5p5JRiL7Ke1MBsZW/r6WX
         RX+A==
X-Gm-Message-State: AOJu0YwERhWggibGd7ejvO5jf6mCG5CfNwAXbP3nm/pg3qUmb6FBhl/K
	g0d6Y388SqDlq+bcZ+N2AgqD+IgRGpNFZtHImn/m+ZvWa1sIbACZ0myOl1UE7zzT1VfqmL+y66b
	4iWzJhIzhlSw6A2aRfPLpD5PE3AKeDGYglSmAQNlY2vWqn6/DtXXGpBs=
X-Gm-Gg: ASbGncu2Y9MCbaIn7WmJ4O4BjT7tqeQUGcwEvftDKt1qt8aIHvPke80/1S/939dJ+tE
	xdr7wUAzSu1JXupJW/0MUtOwnFjQ0ipnYc7eDuPP5MRja/lsO9mQBB15nue7SZxSKH+bckfxYLu
	P7lj1i5+zVjH6KD7qxU/jyHHN+/VsMyocud3RIuELZtxAlrceMFR3wnzWa7DONSKCh1iotAyc1h
	+2+CMHjtboSjNw0EFP3rfb3eNiCVJocbaT7jL+2A3qpCY140I5hJ/xLhrwDN1YtzZUUxPActG/S
	uaKJedRJOK93I7K0xRRUtFdsnrE1ExkkpXVipyXWFwuqcOAk5Nk2S5fw8pp3e2M/FJ4moi2AuAY
	kmIzp2EW5UXyBf9c4ufa/0ombgOSu7v6s3SUKKfRXNjAd+kCKxM8cgDd6hXbCq9J9gnkX2RuLeX
	xteH7TT0l01ZU3fJtaWAlbYAI=
X-Received: by 2002:a05:6214:c61:b0:880:5b9a:72f2 with SMTP id 6a1803df08f44-8863af15c67mr188255336d6.20.1764302564205;
        Thu, 27 Nov 2025 20:02:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPiaceggIXXN4PLsZBK/FQj5IB7TH/SWuQbD8CInf1Xf7tRDsFVrV5L5VeyLZD1ApkvAk9aQ==
X-Received: by 2002:a05:6214:c61:b0:880:5b9a:72f2 with SMTP id 6a1803df08f44-8863af15c67mr188255056d6.20.1764302563776;
        Thu, 27 Nov 2025 20:02:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b063bsm889609e87.41.2025.11.27.20.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 20:02:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 06:02:42 +0200
Subject: [PATCH] ARM: multi_v7_defconfig: enable DA9052 and MC13XXX
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-imx53-qsrb-pmics-v1-1-a96f43ddbb59@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOEeKWkC/x3MTQqAIBBA4avErBtITYyuEi20xppFfw5EIN09a
 fkt3ssglJgE+ipDopuFj71A1RVMq98XQp6LQTfaKqU75O2xBi9JAc+NJ0FrdAzOhzYYByU7E0V
 +/uUwvu8HCKcxCWIAAAA=
X-Change-ID: 20251128-imx53-qsrb-pmics-532fb7ab4b37
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g3LRNLCrYXLZC2Jel5BppEoAhXanY8wJmV/cSMYtpus=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6am3CPWJ+JR7+q4mkormEXPxEc4drhozj09Xcun8mdPt
 Pr+vCudjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiIy0b2//53tm9IW3TX7Hpy
 5ZVnf9Iku9eYpUtL9mpvVTu4z2faW9GbvTMOb9TvCH0Qut5QMen3ptW53mW2cUsCbR7Idzs1eSa
 eufzZwSY1fnr8dY8m7w07889kxVe1Oki0RYkHbf+Yeyq+qJv7x5L8goXfG17vkuB5nJr0p2ilhp
 CNsYyDkWORxK9b+c9E3mUU3Iy2EHrtarspl9P6eOr/i74q2xqiA/jfCk9eNqHiqVS6ps6tNvV5W
 2v3Ptv/srZ3W9oJr7mXpc07rsU8Yw8odFy9zXJT3WQdm/dn+fk91y6ewDOlo716rkzX46O5u7wi
 y28HF6deUMvbbJB0i28h1yPvlo9V+qHfwv8k3Z4RpeYEAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 6XDzYEf1xg5ciqS7MfBu5OoVmICWL_dG
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=69291ee4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Bt1r0AIcz5crCmy9ufoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAyNiBTYWx0ZWRfX66kdGIyLOzLS
 F60qo3cztcjz4KLOxSBonuSd+Oa66s2dT/549JlHZeR5mF9DyOmchQpMZBcFZ4NuDYxEw/jK3C4
 9iMJm2CKS878zkt0fHXSs0NuT3cFrUxyjjteLAFj/ApXp9Y6HhMSBCo3Utn5m3lV+DTWiytcbMR
 8awuQG8ebvYdRt3sVD7ZdEp1+RplayJjjw54UpjAM/94PbhZwt0TGpdymbl5basXa6z4XHDsNgy
 0dbaGCKDK3rGu8V1pbP//qwMYOpOwbsdmHmnYzQp3sN6nbp6PcUtsiQ/3YIe14h5+Vk4g7g8ELj
 xWBPKoECd8/fUCvfsBMs0E98AbbkX92FwaCC7OfuKh75iP5UVKulUxXhgWM5Awhz+ctxpavddfH
 FDrM7Exjcgu+Lnt93/SxVVpv/XtLFw==
X-Proofpoint-GUID: 6XDzYEf1xg5ciqS7MfBu5OoVmICWL_dG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280026

Enable PMICs used on i.MX53 Quick-Start Boards: DA9052 for i.MX53 QSB
and MC13XXX for i.MX53 QSRB (it has Freescale MC34708 PMIC).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 7f1fa9dd88c92cf04e3b1d9c05166d0f407b3f65..7b12bfae76716bf092b3fb41afb2178ecd148e24 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -598,7 +598,9 @@ CONFIG_MFD_BCM590XX=y
 CONFIG_MFD_AC100=y
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
+CONFIG_MFD_DA9052_I2C=y
 CONFIG_MFD_DA9063=m
+CONFIG_MFD_MC13XXX_I2C=m
 CONFIG_MFD_MAX14577=y
 CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX77693=m
@@ -633,6 +635,7 @@ CONFIG_REGULATOR_AS3722=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BCM590XX=y
 CONFIG_REGULATOR_CPCAP=y
+CONFIG_REGULATOR_DA9052=m
 CONFIG_REGULATOR_DA9210=y
 CONFIG_REGULATOR_FAN53555=y
 CONFIG_REGULATOR_GPIO=y
@@ -1026,6 +1029,7 @@ CONFIG_RTC_DRV_RZN1=m
 CONFIG_RTC_DRV_VT8500=y
 CONFIG_RTC_DRV_SUNXI=y
 CONFIG_RTC_DRV_MV=y
+CONFIG_RTC_DRV_MC13XXX=m
 CONFIG_RTC_DRV_PM8XXX=m
 CONFIG_RTC_DRV_TEGRA=y
 CONFIG_RTC_DRV_ST_LPC=y

---
base-commit: ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
change-id: 20251128-imx53-qsrb-pmics-532fb7ab4b37

Best regards,
-- 
With best wishes
Dmitry

