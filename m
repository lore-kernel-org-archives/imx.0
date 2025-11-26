Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CA6278165
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178822; cv=none; b=Kf4/R7R6JIR9HbSCYL2Ixvl/+2vNm6uK1ufP120DZHJ/Q+ZAxkyYCWx7gu5l6flKgGPkmueU1pRSInx72jHsHC1cZlivHZwHUOvOdahYIS+j0a9i1oC0Zl8za0GorR6CuwLiQpRme4LsKPM1tYTlmS7WeWcqNSMKITUI0+SzYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178822; c=relaxed/simple;
	bh=6DKEtQtDLJJQwsMG0FyYufP9LkF0morViykioS/EE5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ir/rLbzJ7hED3sUxW/5BE7pD1kgxVHKPe0r2gw8L/Mtw6BhYhWAZqejnkxUgFvSV5nj8J5uOJC4z0jnG6/WRWTdsvRjUaQ9XLC7UGWltZEI0Rdvl37BkxQvDXKZU4nlXsmiLNXVGLTjAiwt9Vb448RxFoPvb5atZXFmF50a/xFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8SSXyZ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPA1Bshx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8SSXyZ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPA1Bshx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBOOeg1850683
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JHqleQhItLHM4lrJ5sAFUn
	HOBmEniAGn/X/VpuywkDs=; b=R8SSXyZ2jt/e3jtjAV6E34xmlZUdhW48MkbRDR
	5z91lTXDoK5+JdOp5homLut9sjo+OL3vJHlDV1OPKAY4IRfEmfDdfV/9miY7SmvF
	jxzr+uMbWrG73B2+qC9Q4jbIE1XH+WbWAyFpmt3ePlJeCaGYDM7u5wObT47CjE4M
	1B7ANVCRzGxjiwudiN7tm8B0aG+07Dh3NZDMKGJoSjxGSQgXiEaLAFqURw/cubkl
	RlZ+AiK1AIiAf98g2xMb/9o2L5LqLet2RvyT6lycpACTiCnftg6rNC+SKxGA5TIq
	Xplk4z/PXZN5JoKHuua4d5tHtUXrbmma70H+bF9YL+3Ndyxg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0mss2cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b244ef3ed4so430785a.0
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 09:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178819; x=1764783619; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JHqleQhItLHM4lrJ5sAFUnHOBmEniAGn/X/VpuywkDs=;
        b=MPA1BshxBL5of2sZK7bOmknLoI8uqJPYsZ6lw0iQIdk1ZfZwl8GH098RT7iMZWMRfE
         8jx3y0pt/QYl5HT7Zp1/SdwgvlhejB5Ucjsv2NERDTO9SphAk4wOQOabwfO5Wm6b1rJ+
         gMEEj/a9j5p3ENr0D9EQG+iGwF/HLyUVWR3jkaV3pc5PqMytqrzeb5et94ESDMDitRtL
         JFQmUj2KQh6L+CR/7hUeff+m85CqNOD5+Q2RA8VwY6V8ShU4g7MBpMFYHRVaVQsfEVyG
         pvH433cFH8GvC9DvAJF3ndJrutryHORVkKs8vayXiCTFw+cfp69wnf9O2fxeETdRQaZb
         VAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178819; x=1764783619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHqleQhItLHM4lrJ5sAFUnHOBmEniAGn/X/VpuywkDs=;
        b=UX/KrPSkYHs5BbR2an7HhoVQA09HJ63oa1l7SLQo52tAVhrzBcjR/sDeM2ugNaZf8F
         ebuRJvp1IETeFgVeXB1DNYyVr7BbxD9PKekx73ImW2MjJoqqFqNhzi4rYpSm59ZlTCL6
         Pj3feYPQepOQQAyVnW23IaANUYCAnzzwooW0EK77+6WaO/t7miS85945PVmHoAQSr0vF
         9qmVtvQPjs42hKpykWLt4A851GYjnak/zGyUD3Pt6ARuynggfl/x4GopikEZsUbapsjj
         Ah8B+2QG6nIhh4tG4uzrPv68gZA6NRFVkVTJ93lE+WWqIyMKf9sG7BUilWMUzAO1NFwp
         wCHA==
X-Forwarded-Encrypted: i=1; AJvYcCW34bZxy0Kc6R21grcVwVWwqfUy7MywvLEobohvBeCpQgZEv2Xiec1JlMvJWEHhf/L4uos=@lists.linux.dev
X-Gm-Message-State: AOJu0YznZTPS3/Od2PFp9Q2iiemGfb2SXedqSLY2tagItuoag+okLiS5
	4IGiicTfMl3EsgFUh3sY42so4JAIk6bIXS3Z/POMhfgN035rhXyZZmSLlBU+KBDzj5iiJZUxAvz
	I6tMDaO7LBS0faHr5hR9OVdQRBteO2AHopaPoU5RaKCynCmfBTt9i+lE=
X-Gm-Gg: ASbGncvz1bg3u8BiX1MFCegMNRPzzcH5Y7me2An/5lrmCpgl6zrL7nQ+4XrcxLsfUDr
	FkjAtPKdsV97HwKWNV/MuKtr25HX0nGySO/CeZVdixNtCN1EynAqJe+eeGs4oxcDma30gtK34C1
	RB1zlDzn5OQrj6rfB8EebIHdLf/XvyZqhRylLcq++hAeGRl8/6Phpnwtwplpke6W6OorBHD3k6v
	Puo5NiQHNqkw0vQNNwtbim0XM1FxSmx2VG0qaHpbuZw7NztVkNQcU8lJuSFUXy6JqXhd9vJGOzS
	VlEn33rVY7fMJSPFmZ/NMkwsxjU1ft1j//MAlLVvZ9TJ2Bihh9U9OX1/xfTz8RDb+vFKa4MUE0j
	U1nltgMQSvquVaK2eC34PjwKAqXXVPKfDog==
X-Received: by 2002:a05:620a:444b:b0:893:b99:711a with SMTP id af79cd13be357-8b33d1ee4ffmr2610289385a.19.1764178819436;
        Wed, 26 Nov 2025 09:40:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECdUlT1+ot87WedYm/WP1Oj+nm2wC2UhUR9096vkFJB9K/7pV51iXl7gTIFt6VQQYJU9OozA==
X-Received: by 2002:a05:620a:444b:b0:893:b99:711a with SMTP id af79cd13be357-8b33d1ee4ffmr2610284885a.19.1764178818974;
        Wed, 26 Nov 2025 09:40:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/8] regulator: Use container_of_const() when all types
 are const
Date: Wed, 26 Nov 2025 18:40:04 +0100
Message-Id: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQ7J2kC/42NQQqDMBBFryKz7kiSxipd9R7FRRpHHdDEJiot4
 t0bPUE3H97n8/4GkQJThHu2QaCVI3uXQF0ysL1xHSE3iUEJVUipbmi9mw07CujbA+KMgbplMLM
 PqAQpLawuXmUFSTEFavlz6p914p5jmn3Pt1Ue7Z/iVaJAIrLXspJaN/rhY8zfixmsH8c8BdT7v
 v8AIRuGjM8AAAA=
X-Change-ID: 20251126-container-of-const-regulator-20e240c45b78
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2146;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6DKEtQtDLJJQwsMG0FyYufP9LkF0morViykioS/EE5Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt5v1j1dKWdNgdHT55iyox07jOOS68HcIRhW
 7B/0lBsblKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7eQAKCRDBN2bmhouD
 1403EACKq2Mwl6E/+tWaSR1Waj9G0BRQNG4tZPiXH/xW6V37CI1hItFhBPgS7JOLlfQmKvNDSUn
 x0VFPLuxHCOXT6zsXy1yWd90EJLYT3GfxImE6mZaGyA7xMffKOTKZbTC/iuTKi08K3ztT35DNhv
 yTFhTjIcH6AWic/wIdtRog1On9Qd4Ln6yfX3oihlfAWnGEC3ouPzRpvislZcOdYjhSGoUq741P1
 DiBKFy6YUnMOygJMNwap2+HmmruhVcG2ynjEDZWmD2Wpe8K/Agnlg43CoODuNOGHWvPnjGqc/eo
 upZ0zyNJNMsqm8hZOxILpixlyobCv8Khnr1iAkhrKYDb8u/TITwziN6xXyjBPrl0J+BaP95A0+K
 2yILPHP9kpTtWfCBtMzdTfBl+KaEry7J4qpSjcSgNv5aIdMLIysmaW9K2MuAuORO9GiJ+bNFevB
 6uwLDk5r+UCjO3b3PrOI4oGRO2a+X8Qxh1uWpo+wLGb7F2cAOLbYR12ehVxU6n9Ioc+mKhs3Zl6
 hrw7fg0MrZCK/ZcONldLLZ6gHY89IDvX73l6eDE0ewVF2c9vrh4SLO0x5L527g495hJA2/xHjx5
 1oWAVRQ+p3nUk1+K95Xw/roitwp+3lXc4cGNxsvbctMotMw+aS19zk6tgP9ylMpuJL0q4beABGI
 DRgd8q7pP2VLBVA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: uSoS98kiQSVnBZl8Oxkw8h9rixc5162c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX+g1mCqA1ZKkX
 p5zSlGzXgE2zrP8EGLPFDbf0tcegi0EQ5UyZmKkHaZXHsLqmYjbpW9g7DXpCv+3tl91oSaPUgEe
 4l05Hwm+TI8olkXsvP15UmfV1Tl+vKtxrNgjsMRg5ANa297hhqljE8lnqcogmstL7k1YWmIF31N
 4dDJK91kjhqSjVU7r8I7Lj4zB7MNP4+CENRIhYvKIwk/TfYaYjI0J3kNvhGsCV5ENK5FM12Jk3W
 ++sKfjzmtqx5psdvGPHiyY3PuLhS/hRpxFLgXw1BkV2fKDpBKDNgFYvLSkfbAOhwlitNWN58cLh
 J6yBZJEtXMSWGmyGiU+JPiTWF1Ye4OYjhf1n1jtd45BE22YjINYpEHvxdZGIfTzBrqjMtW/IAzW
 AJicydeGs0wRxS5cDOzvG4YqU0xv3Q==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=69273b84 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=_fikr7E7o0wGUBXK8CcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: uSoS98kiQSVnBZl8Oxkw8h9rixc5162c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144

Changes in v2:
- Rebase on regulator/for-next, which does not have pf1550-regulator.c
  so drop this part.
- Link to v1: https://patch.msgid.link/20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com

Use container_of_const(), which is preferred over container_of(), when
the argument 'ptr' and returned pointer are already const, for better
code safety and readability.

Some drivers already have const everywhere, so container_of_const can be
directly used. In few other drivers, the final pointer can be constified
that way.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      regulator: Use container_of_const() when all types are const
      regulator: bd71815: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd71828: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd718x7: Constify pointers to 'regulator_desc' wrap struct
      regulator: bd96801: Constify pointers to 'regulator_desc' wrap struct
      regulator: mt6358: Constify pointers to 'regulator_desc' wrap struct
      regulator: pca9450: Constify pointers to 'regulator_desc' wrap struct
      regulator: pf9453: Constify pointers to 'regulator_desc' wrap struct

 drivers/regulator/bd71815-regulator.c    |  8 ++++----
 drivers/regulator/bd71828-regulator.c    |  4 ++--
 drivers/regulator/bd718x7-regulator.c    |  4 ++--
 drivers/regulator/bd96801-regulator.c    | 10 +++++-----
 drivers/regulator/hi6421-regulator.c     | 10 +++++-----
 drivers/regulator/hi6421v530-regulator.c |  4 ++--
 drivers/regulator/hi6421v600-regulator.c |  6 +++---
 drivers/regulator/max77650-regulator.c   |  6 +++---
 drivers/regulator/mt6315-regulator.c     |  6 +++---
 drivers/regulator/mt6358-regulator.c     |  2 +-
 drivers/regulator/pca9450-regulator.c    |  8 ++++----
 drivers/regulator/pf9453-regulator.c     |  4 +++-
 12 files changed, 37 insertions(+), 35 deletions(-)
---
base-commit: 35ed371beec9dbd889bf2ff2afd6cb549aa32805
change-id: 20251126-container-of-const-regulator-20e240c45b78

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

