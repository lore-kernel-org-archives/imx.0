Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A6B33F363
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176350; cv=none; b=u/jUXQxRHmsgdzxATy43ezn5StyP6cH9f6n29t+FH1yejg9ovcXljJ1pXyk8RN8tiW/wljcodNhV6RO7Nxm/Hlg6cD5dfRLBPD3C/dyopraeqZgB6+LKWfwEIVBHZ6kUN/dPTWPHgKC9LgPaTXKjjqITbF8ztC85PQ69avSx5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176350; c=relaxed/simple;
	bh=dr6WqtS/bpFjdEo0usIvlPJ4wJ8k+8HUl6fldIV9bRQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dKyA8/hBmDurVYmXsDL+Scf3wiow0jUHstXWqMhx4q3G4gxqqxLMiqOeRmLWJMZvY/ow0Q/vDS42EEIRO3QeazmxS8Bs9zcjLlGOQjuHVwrPmp/ZeetHAMDFW22bv36viOJ6Ina/2baUqOmQG2viR5ouia6hT2RuoRRcCo9lrdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQ59DLbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3hPO6s5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQ59DLbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3hPO6s5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQG5fQF1235385
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=571T91Yns/GXDbCZXJCZJV
	Kpj2F/L6rprUSlimgvTII=; b=JQ59DLbbe8DsShNH1ip3MYbKcLU4v32m5b+Tcj
	yUflWtfua6Xc2gRsjlWDHuEVGUvVtXe/tyAjpCovQ14MGTu0EHT/nQfD0fOXCg3Z
	pqsfagaS1AUNT5BPGshkecUHfOhdLvL+JnvwIkAeyopmtLgnZu1zv4U8HD0ejPyl
	6fogtqNFkV6omPdOYgPlEp+yxd+LgAzBRfVAgw7Ha/ud8Jqbf+Nj7MZfUUOC4tcM
	tqNnCv3NlymWWc4jtw5QLn/HpTLw3xvieZrssfyOd2x0aqzO4xTuf45zek011HgA
	Fc8ub0XBIGt2urCfQKeFHIrMDNAb7yXDh+dPWDgHxJ0axtPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd41mwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb6a94873so752711cf.0
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 08:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176347; x=1764781147; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=571T91Yns/GXDbCZXJCZJVKpj2F/L6rprUSlimgvTII=;
        b=d3hPO6s5RPqtOp4/I31jjEmv4fLXr/EcApjEdO9MBG6K32QpZ07K+nj35b8a7UY/Zl
         Y4KV7HpmG3S9FPShG3UE1x54esl1Bem1lIqpo0j+kSrJzsx9LbVIa36cUOhgDGS0bjSv
         qITDtto1rcYlQ2cTI8GnQjmvNGasMxYapkyM0ilokb+WWp1asfmG8F8AIX22iQaHcr/S
         aYDUMRdgnNEV4oYGM25bcl05K1/V/bf0XG9HrSsJdXj34DRKRp8nV+PKQTyIzkhh4Hv8
         a2lIWtlE0a6CMXFTfXFEmqHQcLb5o0IyduNUWvqIz8KxThIiygpUWOPo4uoh+6VU+2bI
         8e+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176347; x=1764781147;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=571T91Yns/GXDbCZXJCZJVKpj2F/L6rprUSlimgvTII=;
        b=hkptXTyZsDeXEwzNsbYfobnEQKvaX3NfVJ2w2vsjSbi/HyjQbgdOmAs3ndSwG/t6dy
         2/JQX9SE0Yv0L12LpXDdMpBsYEHd05bPGIbWypPsmFEEEhpFqIRFwjsdwxQKq6CMIrAd
         eDo4dfvNzzCz8FEpGnO8bMmHlDLOhOvE7BdqEjBYYBIbCOPrLQ18Aa+v2oXNUxY6vpsW
         EL85sEILmQFENKrCNI3jFHRQ8jrJxXH0lIWZk0ObTSc1R7gDZOlsNI3fJGPTUxONKAGI
         5JUq0cwqpNH1Uk5Sxqtux/YCZrHongw8CclruzoZfpITQHvumxq2i+3ALpW9neZL9glw
         ++0A==
X-Forwarded-Encrypted: i=1; AJvYcCXY834YeyBUIehwfCF6BLurUB5wNMf73969tGlrorfgpsl9WAKf3hEFBOQHy95jNmzyyJo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpcypyGXE/2c1lqRRRJPgoVVHkLjfoTOB5GzUJLI7IF500radO
	EiRuSfsxwfzFxyhYCnJruQoJO6KBXL+tEAaowEixrfKqln1c7oUmEklCy+y0peHWnl/MZ+Gvr7u
	8/ePdVMj6hS7tR7sIYtAOOanKc6vnHKgtSD0lvjbaf36PLsRxbqTWz/M=
X-Gm-Gg: ASbGncvluIsKHorkLG4OSiLZ2wof6XLJg22u7/BaC9ukbOKUqKUqlAy4n5zEt3I5Stp
	oMoS8RUIHvBIdWOY7C8l3o+HosVZ9t8Pi4RUv2nwrYdhY/kaHu5thv3X6b6aJIOjFHAA3Z6dtBY
	ScPzt7F7UUhMo8iPvMlLgmxUNxXApgK/BWvkmqfi87Q6LeeJi3UokjZL26Uq2f3v9ts3GNKKg9j
	SFpsxckUs0ixr21iJ3LtGdR9ws/eyJFtU19ezs1kszCcwYQalSU/69ZvL/aHfZra0qPneeU9rEo
	6dDXj0FGwIGVXHQidAvwh1kw1ePrkVBZh9N/Jpq3YUUBAPVoB2WTvggfPN5/GNvCNXddP84tsRQ
	GU6ZhQr2l8dCHj7lVwhv0aKF1Ei7lKPfsvg==
X-Received: by 2002:ac8:5d09:0:b0:4ee:4aa5:4bc8 with SMTP id d75a77b69052e-4efbdaf1c19mr88698551cf.64.1764176347000;
        Wed, 26 Nov 2025 08:59:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdnJkun/d/4kQjOv6sC0rDNJSC/2LTobAKsQU8sf1RJyM/1taMifWVGAHyXHLUEUdmsXsp7w==
X-Received: by 2002:ac8:5d09:0:b0:4ee:4aa5:4bc8 with SMTP id d75a77b69052e-4efbdaf1c19mr88698231cf.64.1764176346568;
        Wed, 26 Nov 2025 08:59:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/8] regulator: Use container_of_const() when all types are
 const
Date: Wed, 26 Nov 2025 17:58:43 +0100
Message-Id: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMxJ2kC/x3MwQqDMAwA0F+RnA20oU7xV4aH2kUXkHakVQTx3
 9ft+C7vgswqnGFsLlA+JEuKFbZtILx9XBnlVQ1kqLOWHhhSLF4iK6blh1xQed03X5IiGSZnguv
 mfoBafJQXOf/9c7rvLwEckbZuAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1994;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dr6WqtS/bpFjdEo0usIvlPJ4wJ8k+8HUl6fldIV9bRQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHI22jyA/haKh1/EYHgFbnocnQQfp2sDLq+e
 wMhp+5SlRaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScxyAAKCRDBN2bmhouD
 1/BCD/0ZTxK0ZoSEIluzNPiS81uE0LuTbNC59xZKGGtvs+Le9tHkpLLpvqY77qjtz6BvXtlkgfE
 NUjscMOB9zoGdZgxYnJKv1FCpYCBtUIoqhBtVMlnXWKtL3lUTIvbkbSOCa59Xjr5LuxCrhg1g9j
 QQcbBRxhfmrGF47nJEAtyrQy2HJoArSsTH/F8Pm+t3erHKuHt1v/LT0JMRrnd+8dGpAbJhNtjre
 c7e2yed0mxigh/CQ8kvu5W4cutju0w6YhBaRXC77Vjw5Jcbs7sI4RF+FU5nG811nNjkTAvj2aei
 j2tliG5qS+hMzV1EcBbKh32T6FLVCYpPKorZu0ZUoTCExX+fTNwg48ZB0FzQezk2/id5f5APESZ
 HSXFa0gYEO0TZrCe1n8PVtGGdRMhjeDEa7p0+SbOQbyNEBGeZ33lIwJbSWsgkDws4KnXiM5vH4m
 uYultzCuoniWvuvBy61IQ3NBYuldFLeUpz7EV2BeIJtN3Kl+fQJboWmI48ttu1ZBbSpKhEf8Lha
 k9PbB7XX+DPqYxFsoGhX0GbTjDB+Yt8d6M9oh0yrpOl6Ebq4pYyDAeKDG7H2Ygm4u+RUItFaGhT
 oXWYa28pwCAm8k2ISY+wORLO8pz1DiPappuN++Y4bi3VrmP+ID8POAZL/wHFXkBDF7PK67V32Ab
 oeIYCtbH3Z3PiZw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 9738r3IpXDdvsbsJBf4arzsHiKwrPET8
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=692731dc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0c1pNNYTX5jJfcLEs4QA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 9738r3IpXDdvsbsJBf4arzsHiKwrPET8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfXxKU2TQTh9ipP
 rVVaWmDH17uayT7df+fsuCvDxoE/6AWVR2DdNZZx0Dbjr0bbSK3mSfjXSW7nXHTnNqmWIFH4hQf
 pBQRgPMh8XIloUe3xQb7ceI9aHkC57mkFNhNb4oSgzphc9YjRyPGyt6rbIMgZp9r4vpDtwYvniZ
 5yoP3MOBOoEq2wrOoXYlW9d0+Ht1A7CZ0/XMX7jvefgR22nzWAyMKh+/5Rm7eAt7suFi6OLTL+G
 styjmjYk1USFX/v7jHjNO6+uc7zR4W53v9vKIhRT2NrB7ta7vHaqVTzGz8nVw1UhubN96fwlqvF
 +pszFdahUUqgzpNaKS2FmAuZ+9cvYBec9Hm4GB/thwYGEe33pMhcNrLvcOXR1YwbU8NZmT/q75u
 +6uzIomqOu91TyzjYthSTD8qELgJdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260138

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
 drivers/regulator/pf1550-regulator.c     | 24 ++++++++++++------------
 drivers/regulator/pf9453-regulator.c     |  4 +++-
 13 files changed, 49 insertions(+), 47 deletions(-)
---
base-commit: 353fda3a1168e7e38ea541c14c4e858c78cd2018
change-id: 20251126-container-of-const-regulator-20e240c45b78

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

