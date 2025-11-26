Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E530504A
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176354; cv=none; b=ujHZJG7isg6fjjqVdgRwn73eI76gc2/o0QsGNRuL1NCfzSUDNfDbvQdbkl5fu3y2tEJfjF6HPXslCG+nTALdQe3RDopZH8SizTIWum1mxPHwWlIO8bLiUX4h0StcqTwfCNUdGgb9Vwmy/o/JJcBL/L/tRoTf3OkVy47nuz0FT1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176354; c=relaxed/simple;
	bh=DUpWNqruSQhmXQP3XRdoDV1aijYo/dZHk2b5HlvKVaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbMk8MMS+7bNIA4rY5tOTm2Lul0AcJ3fOD0gkyh/fzNpcHimCwG2xKJbWrQiZ+3v5X2aGG/kVu++CAEWBA1fImag8/6MPW5mCzILjppZ1RC+tP+uUw+l0iVUt7StuE0wOtoIrJWm6rs+8mllibZ2RLxDXrF2sHsUKg1VT6w508Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X35q5+SR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IfJMCoeU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X35q5+SR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IfJMCoeU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNjcq1849374
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=; b=X35q5+SRUu5nhVNv
	1zmNuSiT1HPRpGizSPsrY5NYHWp3ZjBzehGYpR3GBB8ib4KPx+Sy9gEnePuXbmjn
	2t4/LaQlF6SZBkv6linOvnrqOCxp278jlgsTIyGfTPCRAav8apErqplMh2Ss0NM9
	BGKmSz+a30/OhoR15Z05/Xit/3ZiciiMkco9HzK45GSa1H9yPyZaQrYIzqHy1kuo
	RKNp05MNN2CCD8C2/DYbF8gnwOd6fo+c1iQgil12EpT0S5tTPifv/HifezvGLICf
	t3SpS3sZ/wWiMzupwPGOLk1DMw8TKI5LR7BoPg2ezGdGfzWXlvE6Q3AmoW36q3WR
	Wu9ugQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msrxek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaf9e48ecso1394011cf.0
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 08:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176351; x=1764781151; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=;
        b=IfJMCoeU3hbUBLDTPB7niYrwEZB1pSoHkBkRSekSxtZFKfBEk8pLjf1gtefdcimZBo
         9Q99Khuc0SRQG3afttlLcSANMtQovfU/TzDNnC3ujQjh4ecfGCgeHMzgmdH+dyeZko4+
         E8ijdklJ4OubTPPvoWVd/JqghpvOEgG0SBZ7bf4bAeds4pyIx7J4uL/pxcUSaVAeOIB6
         wqxRVTPrJea2A6INT2oJCQlu3QvSWNY+PIsH9AIi/vpGfTqUVNUOcA45U48FXWV/rXSH
         DZaq2CCxzViR2E3/89LKfqu/wm97FKQ+PPGu3ZtSaDYh5K5CKIVePPUHIyiEGYnelvLA
         Skng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176351; x=1764781151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=;
        b=Oipg+bRwtvhyjVjCGFLlqIN6WJt2c0oDunQAEpbaU3m3t82K2I2BkElt4CuhL/sh1c
         Qq1LncwNxAfBGag0ZDOo3zYVoSXg8qXxgvvPDZbqseUvwtK5SLFiSAeDmdMuePJRo1KX
         0y72HKdZ/Qe9e2+rHlh+GB0c3vdDhf34q9WRjieEZvprpQuckdfZjlM3CD96POYEHLs0
         RC/8cwpbbv2pX35Um/gezpIFLbRvXgfeOdSokQn0JHQPuKChgeyE889lzuni6Bag9r/e
         T0V1+XQxVByOht3S805GR4fhKWkj7PNk8zokk32j6u2sO/gCt9kzyZb9tUQBQIDQaqsu
         wl+w==
X-Forwarded-Encrypted: i=1; AJvYcCVHUIBH/H8jyKxYrDoE1tzH12TxqiCKZBu2UIucFVqPi4ZHQz3GUO9M6J66XWbARxTEXhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8T9mMzs9Imfq84gdsslm23F+sAPLuTXcIEDUsSgYqqBCVV2ex
	KE3X+yZKUZvEL+0Gr6gvJ1w7iHpbh8eJPTaQ9agysgwihs7lDS+GEYXJApdeMsn3+pvgp4njxEF
	pVKtv/U9C1c2YWnE/Aq3Qs8Z8QzNePACgmkPGXYg/WzVLDQtLomhqpnE=
X-Gm-Gg: ASbGncvAPtA6Q+4jtWQ7P8XkIobBcRwWX8lsjjl8oY3VlWtawlr6Jw/3RoANtTNctNZ
	+bAOmBAQdvfxbBoaaN9G9RR/7Ufx3bf2UVhzWInrtC9WoMdXFRsNxqKmLOOG7eihCdzwXbXRlap
	ul9BuahqId6Du+gE8DxEZFmAAp0BHTQLYKQAHaVIetE99xZlporH+82Tfi4x6U6nxE8NJ4xL+Ta
	AwSgTTbVFjamZprxB/sreFRNpLOuoXJHn99eTAQ0S79+cHIVlEbO9A+xchGq9NIfI1grbmCYe5w
	hdUFTlDex3VB2mnaO3Wb1UMIkp0AwjEzUZv2RNlOMGxCGvYgFQwyUlJ6Qh6GF8gw8JWy7LAATR8
	7ZKqFhEgmcp/mttpvKON8s3ia4Lhvuwp6mQ==
X-Received: by 2002:a05:622a:1308:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4ee58a61bf6mr244308551cf.8.1764176351363;
        Wed, 26 Nov 2025 08:59:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8lB1Rhgrq3S+danGiNjlWNKu0BDiKtqnkZCNEIla7vkB7GqUXjzDmY84VeQKHPci21vEnkQ==
X-Received: by 2002:a05:622a:1308:b0:4ee:26bd:13f3 with SMTP id d75a77b69052e-4ee58a61bf6mr244308101cf.8.1764176350933;
        Wed, 26 Nov 2025 08:59:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:46 +0100
Subject: [PATCH 3/8] regulator: bd71828: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-3-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUpWNqruSQhmXQP3XRdoDV1aijYo/dZHk2b5HlvKVaY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHTv3KzXgz4HC3zgQmbgCAciN3i+x1qbR/Fk
 TALu82gDxWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx0wAKCRDBN2bmhouD
 10yND/9sSVKKn7BpioaP9g6rmdgiz3FBDy/AGVkWcEImTalr/rjDKuV0Je5AgCxMxPjVFcRwASz
 6wAKseFTTOZvUmvSnqGfxSkmnSO47RFaMLDR9zkFlXRzYnS/v2G3+oHpe89wllLln5/zl/LB4cn
 VtTAxyHlNT4gxgvDL18j2VJhWVJh+WovUiB9owuIQygwsCR2QgGkzcy2ghkdYzN3FAei0VyPbTu
 vpb6A1UDl+ds4r+61ParpSzxpPHjo7kOqadOae4HQ3D66GA/uAPSDwwMNTl0fCuhpJp3jPgldVX
 Dtf/QCHBgUdkglHn8PXWLf5H6Z7W92+Hl05Bx3CHMBL+OAvqX8gi5OkrQy982RtXkzUDDaZciCp
 Z4Pj4z6viCaUB/tLBEsOs+MJmxgCBHAeuwRmpEktaxvznMorLi9HAE6nWzrDregCl+GCVPj2eJg
 iu4cOEYMgSCstrm+DCwNN62z0WUlzTb7cXMnfAHb7xgkINGlFrmRHbkhtXX3yNU0LpRpj3f4bUK
 RUnhNQVvZWqsa56TnDVJaCKm3BEtFb0YA+bRHTsAuPi2EEIKBxR2umBlIS86vyuf81C9PiShqlX
 UrKN2zH9SHsgwP2MXK2Qu+50QeIQ7lvhsZHu5NGJ5SmxC/3KrqSmUAmbiLp2yZWDuOHByDn80wL
 oWJpXWQt9nvGMqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 0eF4FTPRMjwQ8U8JUpeL4Ap-Nchm2I91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfXxeZ7ireeb1je
 2eUqyvXyGqtV8e1/8T/PoKRUpI5y5blOSU7wVOUd/KF1Kbwl/cPG7aIKVxqKfJF1+Dncxf2er10
 f1Hh3C6HmcPTA/U7BYODQR0utN8PAQ4jbPZrLXsVWFkLgj8Vg8MZ7QO1bLD0GlaVutk1tSiMtcN
 OLRJTXIFx4SYh49O2T6oGaMa9dXzPQ45pzEdnEEXUmc5xX9+jLeFcDZ0gHSb9Q9Se0HFSw+XwvQ
 s8UnCDi8hPPmOevfYzHzMnyYlnGIshPl5f45vW3WmhTUaNoRILJTw7gw5mvJRyog8u4hpaGWwmd
 vs1yEKQe0cWguoMGtFyCcJVKsQVrrQT0w5/21sX06v8g8/4fKh2vBNd5pVPS0JmpKmluqaF3mX/
 ay/Eu77TUVyuU5aBdF/+TTXOMZd0cw==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=692731e0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0eF4FTPRMjwQ8U8JUpeL4Ap-Nchm2I91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/bd71828-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index dd871ffe979c..87de87793fa1 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -95,9 +95,9 @@ static int buck_set_hw_dvs_levels(struct device_node *np,
 				  const struct regulator_desc *desc,
 				  struct regulator_config *cfg)
 {
-	struct bd71828_regulator_data *data;
+	const struct bd71828_regulator_data *data;
 
-	data = container_of(desc, struct bd71828_regulator_data, desc);
+	data = container_of_const(desc, struct bd71828_regulator_data, desc);
 
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }

-- 
2.48.1

