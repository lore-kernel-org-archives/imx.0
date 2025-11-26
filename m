Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C130C375
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178831; cv=none; b=szd7vx3W2Fr4PGtgwtqutUxzAe5usdw3P4hiSyi7FTopzQsTgYuexS6nN8hBly1sA4iuLfeyG+mrB1iKob8XQwqfnKRgDWb1z95HpCMke8+IBLjRu59/MNc+VsY+jU1iBUaJNwgavobCzc4zP0u+D3H5pyZI9MGePDGjH9IslYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178831; c=relaxed/simple;
	bh=pvkowGB42YgFOHad3W/lZDavbKmrMX9dgCpdtLR0vaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NUM844UGTq1SPz95mjQMOOorqpfxCGoatLdmn7O4fXXTaDEF64Xem5K2zx5MJ+yIkVfhtjz3z1AplDaAib2cvCVef3y0UI0jq2U4msaQzHv2+7jO6YbMoBnokjLqlxFiBr+n4xkwChPFpuaqBS1cptnO2n/xDE9Ont+JhNSy2A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IXkbEk+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VekKRzfN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXkbEk+Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VekKRzfN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNXv51849221
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=; b=IXkbEk+YGREtz/1U
	32bBxazLAEtjNXTZ4ZgbuvnCuIbD68OathytH6ciVnxPiaMDydKBquwUkSCyxu3t
	4mlWFrdryxYfgu37f7UtaY2OcQGySdzVHLWkBuaVRHOABiHbzKee8+RsgBZQh0sI
	uGTeCqSxV8hkI7yuCZOS8gpNNZmkgg7T17M8wQfyDLhLk2LYFw80cFizrZurJKNy
	gdCV2ak95JlDmWa8Zz1+KSfURicFkDBqZz9ovZzJ8NyFzbF16Z+lbZWecoorMjIz
	lWsFA4a9EEaDAyKY7Vhvwq1J5KkPdNQTO2qocc/V5XiQvZMCmT43kBoq+fWO3QwX
	3RNe0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0mss2cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e2342803so1773274285a.3
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178827; x=1764783627; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=;
        b=VekKRzfNMIKlJZigM2lN5KLcYOKI5C1i4UVZQVnf2oURFbNKpF6AvjrtPAcnf9ddpX
         PNvdzPj7wOx0zVGMRTiIzxNc+2A7IuZsNPxNkHlvTxM12v1MXjt9dX/F2CfHUflaz83a
         IaMKthvr1PZ8hAXTaFz2f8bgRaMpwm1QNiOe5Sf6et7pww+vPprHeyhUOilTrbtcQg7r
         WAP+smG/qXy87SCS3Lv/ZiPSr0nTt4E7WS/DqwIPdbs9Ol1CWjQtVjFNhA00mpg3Ne5c
         D+QZ4WCGla5x3pPx2kcLE2i91QpLTWg0qyuNKa2r5OiVF/Ht1Aw5OVq1kf+wcnSC/oPI
         KJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178827; x=1764783627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=;
        b=EcQSbbfIVdhFNQTRl2nf3XWhVY5ApTVyxsxlL0PyLwePDiCCtArYfhfDNmkSt0QOd4
         9dI7tvc/b93AJ3hCFAM7Fj0pUL0ibxeT0anMDbOkr+epVBqesYhLlcwcgk4KcgURH3zg
         4ltm9FWn98zgylMPbjoeHkFVeeg4ekXvTn4wBAmBdVQ6Sp0UDIb1EuY53HFCJ9U+Il3+
         dL1x5eSI+aO5GQt2ME1jEhAM4I3FpUxhLoTBXqG9JwWdsF2XooZGHzo+gmYaMK3f1Cjv
         H01v7wteAabupBXW1wu1Po0aFPvyC501S3CdNchYTLe4H48v87pTn/YQqGWxpVvRqZo6
         L8bg==
X-Forwarded-Encrypted: i=1; AJvYcCXpvA3OXr2iCtJNXtN1vHouVN69bxZJXyhuqclSOldajy07pg81xRS1YG9WxcLPSiI4QOI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWlnfv68F9103WUO8UwosPqBhXzmib/4fFm7BwqXeT78jt7Ltx
	2JA095Klgc6eJK8ppwStBKcPltCw2epBhjrLDhcdQLFLSNdb5pNzZjckyiRNAtgP56lg16HOjT5
	eNcruJttiWsnzO5kb4HWlnM5qR4gECUh6x/9d655kVXs5aH/UtY0k+3Q=
X-Gm-Gg: ASbGncuGNJgEOhYmAeSlG9efxKmI1MWnQ7f0aQINoHwhTUBAeEX1zZ3C9w/Jrr6h4VT
	ORobaSYKvDIlqNVfEugrZM7mzIVkaQ9s9idjoPcT/O/0+psOhOARFqKXBcQ0th6qElo/4bx6Ji8
	izrBX6OqJKv0yIs7R8a+hpv6EDuZ/gXvI7iOSP2rfTcvVp5JGQukeOzoY+8k/X0v9TeFWxvbgxW
	Xc5NO+3kxClu/JJb1b0RPSQDrOX5CEZu3xj7J+cQb7okhULJn83NShw2A+hSMbIUKN2BqRDSYvL
	+4oLDM8SDLyXUqYnUcTjyFdW9UsAJct/vVX9NgtcCdCNMecn4ex7Xp3jkBULlGiHStsKzbO1hbo
	rSiPyJYd5N9cs562Dmh3Mk6jkrhipZu6o+Q==
X-Received: by 2002:a05:620a:4496:b0:8b2:dabe:de42 with SMTP id af79cd13be357-8b4ebdb0549mr1021001185a.46.1764178827478;
        Wed, 26 Nov 2025 09:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZUDWs7JiLSSF7ArWfRHkaAuwTyK+QSHjFarP5skIIj4AqiWmo9YleaDZxRWKvb5+rueimyQ==
X-Received: by 2002:a05:620a:4496:b0:8b2:dabe:de42 with SMTP id af79cd13be357-8b4ebdb0549mr1020997085a.46.1764178827001;
        Wed, 26 Nov 2025 09:40:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:09 +0100
Subject: [PATCH v2 5/8] regulator: bd96801: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-5-7ad3408d6f29@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pvkowGB42YgFOHad3W/lZDavbKmrMX9dgCpdtLR0vaY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt+qhcdHZT1bVlP+KvVAUFrdcV1FOsogvx2/
 PQmEEsCxTWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fgAKCRDBN2bmhouD
 19XsD/9iNsNCUzdvVYQCqdrlXFz46c3uzDS/W95FVBCYak9EvFYa8wvG/SyoqmfyzqJ3hZ30pLK
 Nqxuz7x4oAaguorR9koog8fcSQdtLEvhbLV54bx2qy70JlZqK+Pl2GR6iXhe4/JS2BLIIkZQEy5
 iKVWsQJ+PjirJRXjfWw8OpLXiCqWS9kYT9Zus7Z3XWn4TMoOeMJtboSBCIX6ZBFhomKz0mE2HEn
 pDOdv645GxGl9y1BNlza5oviDZJyIrHoqxBhv77iufU5u/SScJmJiv9BpkXcHZ5hxPFPvRUkU0w
 NSjzVvQjh5H5jz4xa5CjjzuddZ3ExOjI6r392yeVz3KNLwQ6tGJAGvmGTPb3T/XvEOlbhMSbWHx
 LsNuAnaiw6FbEMXaYwzHgUbMaRId1U7hufR+rJIE2KZfPMQiHrTQzarB3Tiu9OdGByRgHtlSudz
 FnLBZsVHjTlFbfIfPQLqGVOERHP7N3k2wn1PzKRrsp5nrl7yJVFUWfTrQiVgF4XL9M0CktAj3xN
 PCWl/QBXd0b7YvKOIMHu9jXLii+TBPB80HqOJUaeHx25qA8J3QaT/K7e8zMjiOeh44OwyMNGixS
 91o+Bzq4oluoS225GxO8nUBr99gpFCf3Iyqo1mqzzfyCUC0Km2vYvLbw9ZgN7+3O9Bgf+sBeffs
 UGbhlyD8nWsiPFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: VH3yncrv3gICKZEX3TFvrlrDBPxxu6QU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX5oeia7+tjoTP
 VuwtynypRthfgMYikLpCebK68jV7iToWhSNtqxuI04G/9KJbFEZ8h1kEbdMuckMmgKrvVuzUMBG
 C+Vk3Y/60hGa3DM1Oo1HYEUDV1GWhlzVJce6/oyjgmIsV2nNY5tBp20fQxAhGKYWKA+ERYYPynf
 jWA0spG6rVrytwexSvRHh51mh0Y82b/3ZnmDhnHohFDRANvtgcQwqTrpcl3uY00vrwf1zDXrd1f
 HLu+HNgAJOYKreBDP9rA5WpWI3eQEC6F2h29JNHY/BhkPijo/PadunZhCFy8dr+8CnO0JSqgMJw
 fom90camECNdkoB+8AhVzfokODxUfpuqfHOxU8PEGqPn7c1osfg9USDjoe2bzf2BOkGASKbwT4a
 k9UpTDxv1V3HJu9MW/bYTqbjSSFCng==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=69273b8c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: VH3yncrv3gICKZEX3TFvrlrDBPxxu6QU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/bd96801-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index 24d21172298b..129b20c33bad 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -337,12 +337,12 @@ static int ldo_map_notif(int irq, struct regulator_irq_data *rid,
 	int i;
 
 	for (i = 0; i < rid->num_states; i++) {
-		struct bd96801_regulator_data *rdata;
+		const struct bd96801_regulator_data *rdata;
 		struct regulator_dev *rdev;
 
 		rdev = rid->states[i].rdev;
-		rdata = container_of(rdev->desc, struct bd96801_regulator_data,
-				     desc);
+		rdata = container_of_const(rdev->desc, struct bd96801_regulator_data,
+					   desc);
 		rid->states[i].notifs = regulator_err2notif(rdata->ldo_errs);
 		rid->states[i].errors = rdata->ldo_errs;
 		*dev_mask |= BIT(i);
@@ -354,9 +354,9 @@ static int bd96801_list_voltage_lr(struct regulator_dev *rdev,
 				   unsigned int selector)
 {
 	int voltage;
-	struct bd96801_regulator_data *data;
+	const struct bd96801_regulator_data *data;
 
-	data = container_of(rdev->desc, struct bd96801_regulator_data, desc);
+	data = container_of_const(rdev->desc, struct bd96801_regulator_data, desc);
 
 	/*
 	 * The BD096801 has voltage setting in two registers. One giving the

-- 
2.48.1

