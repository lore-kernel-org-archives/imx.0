Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1DE33F375
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176353; cv=none; b=j1VhFkROBb2Bfrc6/A69RT4h4MY764VoEbf1j0tx8G0OnYybw9oFj8gm8msKcUYCjzOj3VPnX6rkQQn/SNfTuHytHLPCkh/0c24L0SaBdzoto69SuFhrP+Xmk7Zw1lO3yEfIgfLpxrDiIaJ6P79OZTTlQ5b9J5f9jRBNcSqgTc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176353; c=relaxed/simple;
	bh=VUNpL3jXdgc3MZUwnQFvZgDT2ptHwcLxGJcoxf3oJiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CODTB13gVGCyf7P0OPk1EC5Bh1nNPYSOtTTPCDWCZqpVQOhwgRTp/ohqVn283SGIgs7P3RlLo49asoKKLU+jX0pe/rztMvwQZHzqs2EKmZV2Um6GhhahEpB2CDzBb4oqkrmzNNAUGOV4pfPpkokQyPNXZlywqqomhsaXGNAM+Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJtnp3o5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpMiTUYC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJtnp3o5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpMiTUYC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNjcp1849374
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=bJtnp3o5V63hX1tu
	jYvWzgAiqf9H5wPFkebRqHUZhN5rcKodQfnumZqeRjeC77uV4oPw1GjrlLvHS6dn
	7W4ZiVWQ79r50+0pXDWqPA9ao0ZRGxYo5uwixoMiVLCKkvMXPtRk5Yq29VIpy9s/
	4rwAj3JZbNow8hAkTqn72qnLWAzAfZDQAE1XTLRSUGr8oKMUwugjYQjP1cWMygVd
	Bfe1PENeOnmrKjQXVfI0bZ2nE9EmykSStASroZj36N6HLMbCWtTr0FxnQfRC9jcV
	FfWgL9Ezqm3CeGTpGztvw4b3O0FgVoYL6+i02b6qLEWNRjMl7liCs040DQARP7U5
	0M/7Ug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msrxee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:59:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-882376d91beso189673476d6.3
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 08:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176350; x=1764781150; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=TpMiTUYC4GJQNOFOsfh+pkbqPpHU4r6uTzVlMgh5iBvYzoUq+uPD++DhxzeRPsVuwd
         sET0FaLm1QMM2H21H2sy/eQnPxZyU3J3l9RwJe4ffcp4Pti+C8BDxQpdXlK4G0cM+0aL
         i+EgpgDA0zsBRQxzh2bas28lMk9DwzAFSikmSNOlzPIryI6nZydgkRKNtGZ6WKVt98rD
         cBnDAgGRoRNc9abMoNKxCWcI7QwkOLsHn3WMko6EHvO9JCg2mGZ7dPJllTBF75YC5x7V
         wFNrN0+1bLQnkZtSi0ZJTqenEa16oUGjcYKrN+BUhC1UCPZTfpZpvDnWQaXJUXVpAqvQ
         ThUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176350; x=1764781150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=vUlJmcIXV0xBNS8ecgQfrsg9YMownZbol9vSOJGoPQQ69zSh/xbr2rSa1SEjfies/S
         /9RRJu7mOIsMrf+uVFEiMIZjjOLWrszpQFiZ91ArDWdXG+gKD2PiiSmqx0WffKV0YtAg
         XlTaCNpMv0JoJ8UnKcha9o5KuPJm9TmtcCLAt4T0p+VJ847v9fkNyazafXe9zRCm+EJP
         MJ8cDiBjjhqCabkRgEhVo9B/rfIwKfcg2pmLkpINpnX7cLl2+PIOBQSQ8kKkvxqgOupm
         OtpoLAAWd2YxolGNNJWNq3PEXowbOohUo7+EM7yarp1hioQ/dHKaJl/eaFDHFGHA4egn
         CHYA==
X-Forwarded-Encrypted: i=1; AJvYcCXxKKCjdpVnwRMi55OfM5G+PO2pbX0TpSpUHSiIxfjGlL+XhKvu3YTbvSEp05TjepWFyNg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWyw+rgv/g5L+/F8g8ZVJQJob9FtLQB/GQ1h1BaUxGBMfp2uVs
	BcZQZXNyMNsLbZS/eNh5SWZnY8X/bI6mTfACNlfakZFUU0aUHAWDWrSD5GQvyPvl46lfV8Lbx8u
	jLcC5FywAwZHNeQe7pMw8LRQ/krDx8lR7RkJz2Dx48CE6GUs3x5UtiYQ=
X-Gm-Gg: ASbGncu1dDWhteVtAqdrRqHepu2mXuo5u1oNqLcIzk2J7xdBiX7bM2/LrzJODj3amhW
	+YxqdAecxoSDldrevPtWksTNaJztWLjrsd7XnIgn3qKkwTM9VyVnea/m+EUmB9oQPehoq9+YrJ/
	XQBXCtLvADwolLX5Ll2NH55YrpUlUAeo+QM1lBkBy8RHE4yj/S7SJL1yKOzxJIt2hLN7C0M7le0
	H6rAt75rLtOI0JjE8gg/QlYlpfe0+tYdKic5pO7LNnb0yr6JKEtM89Pat3jOj89sMc0ASmmnsLh
	wEl56aUKBnuDlfNddQFyZKRw1U9YTYr9UHiJCdEBjduKKtC6WW3ykxPfJBWRjc1Vu+Hoi8mJVlp
	peCoAcjSmCJZJjHckqglN7s5DlS3bmEkahA==
X-Received: by 2002:a05:622a:1650:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4efbdad0501mr93971311cf.44.1764176349905;
        Wed, 26 Nov 2025 08:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErBnHpfn744afixM3E2g1It17xfT+FfmSgDWhqDDmm7wcZnjLFgMoXR5FHu4Z0fr4SV0TEWQ==
X-Received: by 2002:a05:622a:1650:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4efbdad0501mr93971011cf.44.1764176349506;
        Wed, 26 Nov 2025 08:59:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:45 +0100
Subject: [PATCH 2/8] regulator: bd71815: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-2-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VUNpL3jXdgc3MZUwnQFvZgDT2ptHwcLxGJcoxf3oJiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHSY6WydZE9KNyD+CnPH7zWuDEoWof3fnfdW
 iIbYj9M3/aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx0gAKCRDBN2bmhouD
 17Q7D/49mEg2t66KhjK0643fF0ogQe7s2j4vBij03DGs/YvbwTJpSNL5Lyi0ASig52sbv+hefZ7
 krUNF8gash9QMCaiqpRfStyJ1eN42Hb7AIjy6q89cEWlMHJJRQZEI7aEraOHiAScoELINAe4vZ9
 7sWq+IZjsKL7VeGHBxsugUnornYakD7qwV4BWySvwhDIUehdd6ySorDcfRjrecnVnLYoKlSk8ar
 7V57tmOXumHlfYAOUH+naOMGHt96AYNe1UImqYgaTLQWPV5ZMKYZQFC/Gnl9JXX+N+56qwBdkKI
 8SRJL50VPmtiDRovpCZgirizdrQGjNJpUITVAN4rHcle9zIaZXKfZpKyeeZ90p5Mw97+TkH30eO
 CsYAXBg7iK/DtVkziBokGv/ltrakEvyhc3M4+P6xDdm7TfKEL0ZVEbTsGMeoY3cI9oKaVh57QYx
 s7U6r+p708lLqKmCLztNT4XmHQgAJUVgby8vO1yql0TXf/9+2RXqJXp0Un6BqP7pTORGMPXv5zw
 +wbkt2YXS5SUPKUGhcmr8ACx+Oob1V7rUmG6Hv/EFicchNuU79RyN8HMAIrNa7aoG/eIcWufNIq
 lotaeJb2ys+gGpA0aAsd266GQuRSuy6OwgOOZqA/qM1kfKsqEwBljv0LYus4/n/Ep38XFB4ILze
 /Opxx/NrKZtVu4A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: XGiiW1tiEufyPz_xhfZHuyygSSO0iO61
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX+zCvJlLF/Ytb
 vWOoFHi2Xo3RQPonDHzzO/B2hcjH62S/Zn6ZDDZEyWt1t/DDfK3WU05FDtYcSxgqkSfmaqdSKZI
 tBcykrb4eWK49nZb1qd3ez3FhIKCcJyeeZqkVW3OKR+7MLvFeVRTZ3yHE7dMYqADicnoZfiP0nk
 z5XuXBL8y7Oaf8ikb0lJrp+5pnCcEi5xyRVrfbrWFruIzw6JuOTpDUttmnVjFcUZVw7I+EQ3vVB
 WDkvMWfWMUOpPaUQuRUJZgi2jkkQ4Ug+A8ObMCyFokKw7i3JinHLc1rJuwS7oOxL3weNxFDZHNv
 7aX807MIzuu5jvhl3rauQOUC9KjbLGDe+Xqv7euIOJlskU66mdzcDM0YXbOVxonKJ/epJg0tvVP
 CXGyRqA/dlXG1wSDSooo+REdKkY5Yw==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=692731de cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: XGiiW1tiEufyPz_xhfZHuyygSSO0iO61
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
 drivers/regulator/bd71815-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index 79fbb45297f6..8da57a7bb2f1 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -173,9 +173,9 @@ static int set_hw_dvs_levels(struct device_node *np,
 			     const struct regulator_desc *desc,
 			     struct regulator_config *cfg)
 {
-	struct bd71815_regulator *data;
+	const struct bd71815_regulator *data;
 
-	data = container_of(desc, struct bd71815_regulator, desc);
+	data = container_of_const(desc, struct bd71815_regulator, desc);
 	return rohm_regulator_set_dvs_levels(data->dvs, np, desc, cfg->regmap);
 }
 
@@ -195,10 +195,10 @@ static int buck12_set_hw_dvs_levels(struct device_node *np,
 				    const struct regulator_desc *desc,
 				    struct regulator_config *cfg)
 {
-	struct bd71815_regulator *data;
+	const struct bd71815_regulator *data;
 	int ret = 0, val;
 
-	data = container_of(desc, struct bd71815_regulator, desc);
+	data = container_of_const(desc, struct bd71815_regulator, desc);
 
 	if (of_property_present(np, "rohm,dvs-run-voltage") ||
 	    of_property_present(np, "rohm,dvs-suspend-voltage") ||

-- 
2.48.1

