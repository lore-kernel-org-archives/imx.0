Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01E24266AF
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078486; cv=none; b=PSI5k7EF9wHMkhVOtWRz6TCppp68bIyWqIAr7IzsJupGlmnvd1R2O/VfdUXS+slsUUjkUoaN8Fxbde8oWKstcrjlD/HcZFJy/LEC6LmvOMwcJO9u1hMNAdyWJJTXSh3uRE9uNeiDjSWv1zp5VHCqB3ChI0IzZIEz3nRNKiwYCP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078486; c=relaxed/simple;
	bh=05p3WSQeINtZKVSYvGmsEKNVBC0B9Jn9M3IpPDE6QNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hdOGvfEZoWOknzYfr1iQar6tejXwQTStGYTcrF43YeBo8yy3WZTfk8XhvoYj1B7SkR/UMXwQms8pesTQyQiIp17/63PnKqSmiCOgf71TzvQDoYaKs0gIOCwGXrzSPvGqq20j3UZM95+8fUalideIG5RVlAuShlKpvN9GmNElgLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nh1XT9t7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzUqb13e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nh1XT9t7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzUqb13e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M963W03463701
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KwC9/5DR/xlDmwacOOm4dJ0IPWsgd23ip9EROve8gMY=; b=nh1XT9t75VOthVRX
	HMtTxcv8+fy7GpWb5N7uCpSHEyd1Y/aSEqbNLDJSjAqoXDAn2YgViv+zHUfyfxsH
	qemzZ4c9sJjaGYMdZRKy3RuT00v+irO9T31lICxXr+F4xjWibNhqwlQK2xzAaevB
	r8o+rR//5jG4v92nwiMj3vKXnqYlFFvfEOVjn9Q6NxIv/nCpNf7n5Y+zuzb8Slsz
	p48GytUmOoWEYg9Rqbuz6CS9R+rRTFrKdvvk9utR5YOrofAcyrwatKkD0g3RV3LY
	rDMRuCxCpLRnLczuFuLa9y45978+/NDVZg9UemE8QuAFn9TPDUCXJcuUBjATYYbl
	EzkSdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu0653hf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c538971a16so245572885a.1
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 02:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078479; x=1769683279; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwC9/5DR/xlDmwacOOm4dJ0IPWsgd23ip9EROve8gMY=;
        b=PzUqb13eoOLr1f3XBi09dWX0nfSTWUXrBQDIMcJzDZsRr0DwGdn/faoIgaNBMXRhZl
         9O8jEV4WMsVdWe4HLHLn+sFsrZZpgNgTsQh9jveUSCigHLxMJquBFXY6VmivKtCOMwIh
         r/dVShYO9DFpDyELj8npCpNR3/+omjo63Ml71qq6nS45jwHviFLAWQcKuz2L/pcN1QE2
         YTMK5pAJSm2DgPzsqoQVZ9PgUjK14nEQoyUCm++EuksRwPfZA8zi5Zok3GMnDQ9CH59G
         GZlK4j4m9duYb6BWbQbo1SUsaLO0hU09TG036Z0NQJaIwpvfmrL+d4KPEHDL6OfPn9u0
         hrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078479; x=1769683279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KwC9/5DR/xlDmwacOOm4dJ0IPWsgd23ip9EROve8gMY=;
        b=OBcpn6Sb7ClQwSaB8Z0qMsnLUPr97gRWVfiUt6zETHtqAq42ojizUzgXTZLWr7Skdn
         784bplO1qRaMvm6p3dCYRIQI4WO7BEpNlY1OVcAhhzDZEUTFUc2uE/IzyV/3C5xYaje1
         MXJ5ytycU6R6TlFavH7GNamFRH/e475qGcjy9Na/F1+D0aNPrxSa9GnCHlrqNo2p4W8G
         so2RPauWa5bgJKB/x7P6GNN6JgjzMkKv7eXlcMsOcO5fAXFoe9hSuZUf5CkQnuM1cw3z
         XtaSLNrWHx0BKMZUNuWPxiXTMOZ3IoLhXmL3f5oZVn65MtadiMkpzfU/iWcFg+l0SmVp
         zwQw==
X-Forwarded-Encrypted: i=1; AJvYcCV5TAQt894U2qIEA8sXSd9wDSRCSPheBOAH+hRN5JYxWMFUbG0GhZg3riW5otgIlcuL2Yk=@lists.linux.dev
X-Gm-Message-State: AOJu0YztYjlDpl+pKU0v1yd7Ub9Oh8gRvNj1P9klJo6v6ebDykxVx0F8
	J2VKUuRR/+yz+st/WxqatfaoPzJgwQDkJYUnHIbPLKm7pUHIguOiVAQD/dX/WCkGWImGjBBJb9C
	QSEYyd0K497twLOMTmktRIAV4dhMHc314AxzEBpw9EiQrbZtoOtLCIk70/3zJ9wJCVw==
X-Gm-Gg: AZuq6aKX82A6xIZdXkRH/0JGbTK4Sn7oNuQDaYkI7JIy/FbBr0gFeMhrx0pfLt85pMs
	kCooyAv1dhwzVUVPRn8y71XUevngl3QBpGmE7JWEoBzy54b9TQXnLnTQLOSijPOrlCowHCccWie
	WPDeQgxu4tLS6tVP6ATSylE4dBlXu2UqUmpAZFVP2Rhp8j5XAukPa1yTHyhrn2G6lL6SRyreBsx
	gp1jJdqlTG38Ox+SzsMfL4iYsLTja+V9Z4jTZ3W/Kxwr7KGjsjuJlRvxHl3KflKpWwDPg3h/iJ+
	x72dSxRhKjm3Yyg8IGTRucA0glyWWKEQrEDtNJYVkIBgnKSbUSGZWwmfcOMt+tM4LMngugUGhmv
	8oGS3tLKjFEu/C8X/TOaXvQhDEnzmoAq/0A5QQNClrudnHDAoay1Y/z/Yxkd8nFDMCLWWbXrhmA
	Zn
X-Received: by 2002:a05:620a:19a3:b0:8b2:77aa:73c8 with SMTP id af79cd13be357-8c6ccd9b1b2mr1001004185a.16.1769078479450;
        Thu, 22 Jan 2026 02:41:19 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:8b2:77aa:73c8 with SMTP id af79cd13be357-8c6ccd9b1b2mr1001001485a.16.1769078478975;
        Thu, 22 Jan 2026 02:41:18 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:18 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:47 +0800
Subject: [PATCH v4 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-2-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=1338;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=05p3WSQeINtZKVSYvGmsEKNVBC0B9Jn9M3IpPDE6QNA=;
 b=rD2dN5adAIxAGRJ8S8E2CUYLxHGTa+3f/kXvrE4lm6mRaajo/bEdkmlR06eYX6tVWEgBumgqK
 LPdNEc+/gziA0P09lKs9ONVb95cxLTNqqoMB5/nwLd9f5NiVaVkzyhj
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=6971fed0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=E-b4n2RehmlEprTZI_0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FpOclNbME32_OemW0PHyW4Y96mqmMhCV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX20yRWk6iY4sy
 YFhlmQjtbFdW5RMqrWAZkWcRZVXXJD4722kpdVfjEKaKSEGTmuKGje86ggTF+PBrBw8Q+4zOUpq
 iEv9pljRqcjciHPKnRp9pM/VAz1jNO95D4DT9tMkXOrzfRVLMvSXisQLzGGYmtpGfTNrU1bj+0T
 ZVTT/PyhN0FdVQoSeo24ICkKJDGzrHzjGlKZIbdlEhtiuAzyTvw1wuC5TrgSfwXujAtU3tKHRKT
 //Q3L/L4b4UagI+RrzOJVj2ZGCN5a+XGjEDfi5PxK9lrY+iTZWuwJD+4badbnYUZ0nhkuhxYLYa
 pLVkcwkHJNh3J9SL+SIVEHmJb7EyFwwy3eSK09Y387cx3kKKHeJVtyLHHfmhwkxiZyUajsvb9eh
 MJZEErQsqWZlSE0AshdJ5y+ViiccooFIeCXXX37jSqh8aqrguLQy8Um13zh6HkI7OiVfOMO5ONJ
 0foYjbGQElSkAfL0T7A==
X-Proofpoint-GUID: FpOclNbME32_OemW0PHyW4Y96mqmMhCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220076

Add the sm6150 CCI device string compatible.

SM6150 include three clock:
bus: Bus clock responsible for data transfer.
iface: Interface clock responsible for register read and write.
cci: Clock for CCI core operations.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..d3f87da54fcc14a8f808f34c94551583d8deaabc 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -249,6 +250,7 @@ allOf:
           contains:
             enum:
               - qcom,sa8775p-cci
+              - qcom,sm6150-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci

-- 
2.34.1

