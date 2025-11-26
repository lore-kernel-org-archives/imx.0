Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684E6340DA5
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176359; cv=none; b=JKfZgTEIy5lJwfSVZ5pZ+e9hBCZUOCPQtZcVQDJEZSp2lWy30GxGpXXZlw7VAK1HYlLCYVrTWMrdZKtCkQBSv3ZB3m91g2jEfhNLpgL8wRjmwZEpAOns0m4cOGKzFXAC/1y0QLdD85RuMoukL5hv47Ma7VbRDxdgg8NEPJMEHrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176359; c=relaxed/simple;
	bh=F6pa/hBnZb7Gkzh+tLhiX1+7lOKGS/rRVschNyVww/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qV/PDrwA7pMav+ML/Pdisnc5GtBDbiASWJTZmZUx7On2f2GK7+Y+7yq8MIvjMJbWcmi8fTp3yZFLKfhaweCdPitrMCa5UqS3PQ5q1ElU1Esvw3qLRU9ddWn6GWQ2CLX6QNLJxExoWdfhZGt93VFztrJBXqAVYYBeqxF9JO3cT/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bE7ZJFbi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwsqhI9+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bE7ZJFbi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwsqhI9+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNXa71849232
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=; b=bE7ZJFbieUXASyQ/
	uZbq3dFeXJysBXbv1yZvE+5yJi1LHWQPYNn0rGmzlUxg6xY34f/osbFiYQRcdNhb
	XvXl9n8X8Cs4yTR8YmOmJFwXb99oAmAf8QJ0rKxtgnrMxLziU7YKILVov4/xEXyw
	SAzzHVzn74aK4rOAXiTFqjkTMMhwpBgNOJ497bth49kkJc77Y3iU1V7Ao9ocP0oQ
	jGfimarR6qq4sd/2PpBSjJDQFRPZnJGG82J+AY+tmDQ0n6XJ6/9naHi70MqIuW/h
	YJ8RU1aKMCDU3wrDtoJ9ge6Q8bX6iJ9f+RFUvmeLuNCW/d+TR94Bb70pfdOlbCv1
	8E7qWQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msrxex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so1218601cf.3
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 08:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176356; x=1764781156; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=bwsqhI9+f1SoX6DolGlxYn0azJGr13r1yZcYYhhAN1Pn+b9szWZwyLtbC0NDCpMKtI
         iTkmljg34LPkSgMI+IcVlWtO5WPHa0lsXW/dYYsExOU7AZ17SjonlRd/iF8Ncty+to+Q
         3kMmmlDofusXjtsQM68dU8aj0ef+x9rB3JxRIrwrhEEo3Q57FIURT0sOZYQ9srd2TX2o
         3WHk++ll3M6fggRM/Niq17n9yp9iN1XR1U8wtbVD35gbfx8KdibO4eO2BcWmJQZFsOLC
         2LDJlIhoeoLaB8Azxm2eJTU4PrxIinkE+kgUy8i3eqqwtCVLXjH6yeSLe/5Pmpdmc0rM
         US0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176356; x=1764781156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuBdo4Df7AcVAGzqPD11S2PZNb+g82HKKFiS0s50Rho=;
        b=ldT2iGR7Ms7PaME5w6kZmh816FTrXs9dbGLzWnrzeETvNNOdkc6fqQxM0iwbo7x1gP
         flMhfsMU95zVRyYtNoCVJKnXFM/arWEOla1x7XIfzizxyqzTrew2nUjoUQ1kCu5012jA
         AdoRkBMyedYYHnkqPk9ohVpNnepfiNAtjuoiaoRRcdNLG4gzpTcNZcdP9GSmGckUcLGo
         L4ZViWiz/qPnUw/kzcuZUVHOBM2aNpTx/ECDvffAKxa3uMCUDgqoptDf84NqB1yg16pV
         kl8DYzeD8IQIcwbDddP/6lOAOOrI7p41+zaHek11BNFMhF8+FOQS04V537/O1FYak9u4
         AEnA==
X-Forwarded-Encrypted: i=1; AJvYcCW27xHmgkBlWJDqBmLfmfEUIzLqwh532kDDQI5aN/8vu/++bbHzcqGzS0y8QBum+GLojBw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzvnq5hEYyhX0racylc7pY1ggUMZy5uC6OOcc+hGkFsFhnyHT1
	ibXjw4eWQoRVMAXd+1oRS9Un5gHiThk8XubNOFXXM4yqj5I7NYNjP3zkYrHOKoTgs8eF0eEtmLr
	J5gupUeeCrqYlW4Y9sYfV+p3SADC+CvQVBC3vVgO9uAo1YFOlTB25ySs=
X-Gm-Gg: ASbGnctqARJQROtIKi9L98myp2aJQpwJWvaLdk1tTQgOCEzqRQiaoafTGR1S3xCJGiI
	h02fxw9UIU8TPf5OJD2R1ve7jWev5nmNTqKCQY6CUDSwXI2LS5Ebef6T6F0rlxN+868TyBeNVCB
	wdT9DCa6yv7Yvnqf8KYE6uT1pjr+yKgvGc1PWAbC4litpVi3uEhzmzTLO0z0J/Mdy6SQTTLBZM8
	3ZpC8ZXsUoYkdT1uxweCx1AaZ4kp49Eojq7vzg/QhlBrKjPIbKRQIF5KS3hUAJseSue3V1JxYDp
	cBcuU6UQOvZV7sVpifD+wa+NsSsC+UTzQLgjfhWYXj1LG0lLM5C8nRhTIpgjUfYK8IPml/mkiGW
	wcT66qqZKOrgbDWPtKDC3VjRHQfgM16z20w==
X-Received: by 2002:a05:622a:d5:b0:4ee:19ba:d778 with SMTP id d75a77b69052e-4ee58ad46f4mr280143591cf.48.1764176355727;
        Wed, 26 Nov 2025 08:59:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbl8mU5pugMLdfQ2QpKnpUut5p5RybtVnYi8n3iBTFPdWBvXLbhyoNwExNjjmB+G67NM+G6A==
X-Received: by 2002:a05:622a:d5:b0:4ee:19ba:d778 with SMTP id d75a77b69052e-4ee58ad46f4mr280143281cf.48.1764176355354;
        Wed, 26 Nov 2025 08:59:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:49 +0100
Subject: [PATCH 6/8] regulator: mt6358: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-6-eeec378144d4@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=F6pa/hBnZb7Gkzh+tLhiX1+7lOKGS/rRVschNyVww/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHWHMmqetzJbHOIwek+/YS2OOoLxtr/oKpGB
 iWlpMG8/oqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx1gAKCRDBN2bmhouD
 19srD/0edvT0P4QY5aFENvleQKhfKFBzcXVW7mxUBamOidpj2W8rqPGlganIzFaJIxpw2amT2jQ
 oYZbmj1prpf5k0tFTG56IPoA/NM14p8E56OU6+7ySCBjXrhTOFJF8pkr4do4yP/IagOym3WD86a
 z44teVg/DW8X7ZsY9OPkl8bGjm/TtzwIGVZrJ2K+xcsnjVkgR475lTmuhCM9x/2X+YAZFpCnfqE
 xz8dSLFLyM46GMVKACPpOmS0u1diRcpMiLMi2ntKgPGD2trF8IsPb3z2g6W+kQf2c73i0ovRGF0
 IuIRYDDvVX+INcGMAi0d4bqJFjDwpSi8Vqnx9oIg2P/+xHZNnfRMliYMbkUbAbbMmu9tRLkx8OM
 w9EjZ9S5Pnxkp0kSXfrvFyl7ARPntdCnO6pPeiQQUbj+zMC9CjEUchoTYSmdNDE1G0bH8dqwWlb
 nFN0a/zNX8jGppMwl40TkZbd9Wr3sjCbg+yticeWXJnF/Y2tXyd48AoY86dDju/jV4Ce2/j4udj
 1xQRzSRPFUW3v4RCZdUjQXAV+Bm0CNBLtUV/MoVGRunG+K0PP3iaKjM/Ac7gT9+psYRAlGpJhDI
 tKF1tyxj7nD+ONz9HthhboQbSelL6h8ck9qO7zhpeBnt/nWv9ruTiIZPwSlrdXPdgy9K3vm2BAu
 am4OI+eGYdNuThQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: tcTKKvU03KKVw1i5ictbCl5W4_v5pXT7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX7790TjK1zn8I
 9OGJdlXmGgRdu0oVfc3MTB4cBfQXfNW6F3mtKHeD2oJdmuYDQrJUFWmFoe+eK9WE+QMFbz86rUa
 khOd6UeDBlLQXJAdX4p9PuWbZGFlKuw2wbhb3AknV8AEOcV/KiHvVqBmBlnZYPSAg67JUpZ3asR
 zQBsk9OnqpwGxoI16UoTepNkv0ezy1vv/GhEfxwQ1SRpl+zJdbK8zz/I5njhlLAWaW7CmU8D1si
 IA1LiAi6Vs09yO1B3RwOP8ZbjSUPC2epmhorOxKindCHp4So6MWQsQC/c5Bcu6N/AxDe4LuH3Xd
 Y0I/mVAC3UyFvu0gQYX4aOCj3iWbxEteu+sXN+6sIWNuMPYe3R/mD59j8vZVZqYEBz4VXONS4++
 phAO3/tUV6JA6YOfpVdnLjadpT/yeg==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=692731e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FqRRrX31zAmjg7hXLkcA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: tcTKKvU03KKVw1i5ictbCl5W4_v5pXT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/mt6358-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index e4745f616cea..2604f674be49 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -31,7 +31,7 @@ struct mt6358_regulator_info {
 	u32 modeset_mask;
 };
 
-#define to_regulator_info(x) container_of((x), struct mt6358_regulator_info, desc)
+#define to_regulator_info(x) container_of_const((x), struct mt6358_regulator_info, desc)
 
 #define MT6358_BUCK(match, vreg, supply, min, max, step,	\
 		    vosel_mask, _da_vsel_reg, _da_vsel_mask,	\

-- 
2.48.1

