Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0646B341069
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178835; cv=none; b=IBqn/LHgOOqjfsoN8AfymUH0TBwIYW9ktoxIixEz911LM96j4NJFZdNmZF6Pzr3n76CZjtoRntlD5CdSbHAl3BUAJaRzxe2Wf0BQhsxwmax6x/yBMgKIGC0V9PImi0+A0RvS4qt3ffOOGdUvgQw5KCa86YTaK42dKlIEKYyCp0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178835; c=relaxed/simple;
	bh=hmZwf+gqSZxGRRmKDKGj7wIJ5dnf5CYeGgO2dqTIhtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BV3eYd2sI19+apno4sZOZYWTEEKmaKjhsYWJ22q5jabcPxar3r6pzpCUjg4xmcX+4rtBLNxq5E7wlWs80HS/ymIN3iGYf2AF5b2uDmwvB9uNeykJrtoIVaaqeIUHrNJh/8LgAVvIX/vQqrwDE+fEq45LM3hYjWBXONa2X+kqhh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+BqSqmb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqLAsyLW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+BqSqmb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqLAsyLW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAsjJA1700277
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=; b=E+BqSqmbiaNAb7vw
	8UW6PwH67Z2RGFducWxuBNS8YDwBtvrqrchDotx7GR06oGLdfLhpM/c6AvzBBTsc
	XcA75/GmWOL6oR8/Bng/iHomcrsNI8ZCyrj4HciJ2MxKFIpxS/2Kn96oKZ6WtgRV
	cyUl1tgNA4c00CuhzIm+hR9Zv50ayRnihL1A1PfNZiTSyTNG8CXjk0koI2kYfWG/
	6dqbgFbjg7APbtTU6PyONswxE6pd7stYlDfKhAQ1DYNn398VdubOPedw7eosAZ4H
	4X1M4JUC0q08CjCsmlgYDzbjQT4edkW3/mItFU3q8Fg3hV4sJ3EMOefxsucNbim5
	M+odng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap07a13u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 17:40:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e19c8558so1535726285a.2
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 09:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178832; x=1764783632; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=;
        b=YqLAsyLWZbsxi5J22BRixjfrDFv/dLNPxaVrx/6vhFd3hafzSIl4qrdnF/SUOXSf7I
         Nj+9i4aM0kLdaqYNkbn4uQ3HNYT/89ds/pY232TIdA5Iu0H17oKoFcKvalDKAt3dRrtr
         4C1uY5iO0uDnDPpfuVdP4zfXBqdj9ksSOqBDvTkFbwOY/1XccYi1CeYwqS43E84setS7
         7pnsk111/NhR8M75+8ati26Qvx+9+df6pnPfWGVp749t+/7c1/n/aTtEPHzD0Xbcznsl
         WJNyo5/GQI9oAVGjeG7+Uw0Sm9kapJXpMNfQpxaRQO5fQkGurLUFE8zbTRGmYmcvx4mo
         VZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178832; x=1764783632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+CNzxCmRqCkzPCZPo7wdwLbBBFP1ERFX65HRTQOL9Xw=;
        b=vsj5F+4/hTxvzvMvmR0ZgsvR6AYrOHcDK/p2IBG7j3hyIQOPD31E/XiK2WBzoqIEwn
         HmCvCrM0Ivbwhniy4MwROIdN3b1DK+0bKnWPjOuxKqqArpRY1FfFrnPcKl7kl6CKVq/g
         FTthLeLzc4bMntEtu3Y3ZNbKNI8TNpbuIcV28EmRfsceH7jzt3aazNmi6ZCxBTnMJjE1
         r98H74t98rP+8hTxnsA7sBbEtKRBtnD2yhLISy+mv4DWHmG9s4Yl9uZ7UO2tMof3jiCH
         8ZFrDG3HA5OoWb2sMAaBXbz2IECBfkteh3/OKwztZQZuKMBDQVeaWQxw+7bT0Xn6ZmjL
         oxVA==
X-Forwarded-Encrypted: i=1; AJvYcCVMQ1AYMqRTXowl+WdaIXdnSMBVOzibRmOGs/9MS8cCzNfcEGG9ZHb7Mzupc/ZYTqHPiBA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnNjFL5OiN4BlIRN8tkQrecvWK2mUQ2RRjLsqVOz2G6dsu+2d6
	0Rgcb2PUxu2Sil52ZrtlnNXhaC3nK5FxyLb0pH04RZQAE3BIk12hZx5czz0eiIcJ+RWlI9Nmpff
	iT5156KU901cZJbXStResuZrbNieml0xUcAuzqAQ0EJPmKrlzLF+T74Fw8LiaYas=
X-Gm-Gg: ASbGncvxgjfuGZu97ubDrOv0U0hcrIV7xEZg5CFbgE/UQuYciWsNl1/K8djn2vRJmHc
	XY3S7HdNCNW7VlcWd8gv4Ij4sNkhK07g9iWbYEWpINvXZJD0nd/WvQCQ4l0joMan0+4eEyHGl4q
	4uwjUjsAHDsAQMiwuO4/nzOD7dBHhkkoPSZwr4jCdGsmREVVgOrESw5XLTQHrNnXdrekiiO4t8j
	gUzFgcVVlEBvzgPO54QQG40ZzlZQ9zSkNxqLtY+/6GC3M3TdhRzYwaXL1u9AdYfFpMrYfjQ+oGL
	G6QYFkTblZtXT6sjBePFK83McCJVpsAHEosE/Y4bdJ0olwvOj+AfW/ztGYuuKLlW1Jb/yjE/bEg
	BnSyNLMBlnHASUTYRiyGrIUxsbieokpISWw==
X-Received: by 2002:a05:620a:2909:b0:8b2:ec00:7846 with SMTP id af79cd13be357-8b33d1d100bmr2726795885a.28.1764178832020;
        Wed, 26 Nov 2025 09:40:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbqjKB2O5sFoZAhlM0Xp12Fq79ZAX/1usQXGn4gK+ya5/tETRvn2zPSCy7xw2177LVeVx2DQ==
X-Received: by 2002:a05:620a:2909:b0:8b2:ec00:7846 with SMTP id af79cd13be357-8b33d1d100bmr2726791185a.28.1764178831610;
        Wed, 26 Nov 2025 09:40:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:12 +0100
Subject: [PATCH v2 8/8] regulator: pf9453: Constify pointers to
 'regulator_desc' wrap struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-8-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hmZwf+gqSZxGRRmKDKGj7wIJ5dnf5CYeGgO2dqTIhtc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzuAy4+4pJL42G4NnFpgzf5sY9W3LscY+MVSN
 MQ99It4xk+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7gAAKCRDBN2bmhouD
 1+EED/0SBwYzE7RXfH6kNNQOVHrlmegqHI8oD3Wp8oWC/rAteI3V6KVnUlW+pNM9N+/eF3v1WOw
 3EWld96KEMWs6ha/2f8+6XHKUvA/y1NChDfhXooLoxhwu1OJSWOcmeV72joeqc9m7JdpF07zH++
 x0SxMUUvB0vIqq+d+EfZUPhvxxyYJvntH6NIAnl28Ahtq9Lcwar4OcgDzcOi3LscL7/p3STeT6Z
 FdXMQuUaSc8gQUmed8XJ6APlO0OEP6ZmcvNBaSr3tqYgurmKrzIjzOuqS5MubAZVOBRZ2BlNEUl
 dVGG7W/BB4SjLtFiy06wBW/aiu8nD5yoyNEWCXWDo0iSuyll0f94EuRbu2kTsQ8Jm65woX+h11G
 QMbbFTFA7ZbgrBhMFl/6KsNCISAYRk8l1kxIhLct9zx7f3f2Bv2ilaxH943wU01Y3dTQU0O54wY
 0mqqzHGwM/yJp2z7WqEBUFSJOIdJnEZnU0PQlpI89/LO1WTOzfbHfVpBbFBtB5AwjKQbEXKSEF5
 DjyVJ5SL2O/STz4sPT7fJ2IECzJpiBrj7vS8gUi7zHzxsavZHHYXTqMG/VLMGbommIyvwE+07Bn
 rhXhx2v4M2fNmRO0oEtu2b+3tEqB+RcyDqXVIp9Ax7tdzcZDH985n6PgnMcf2/fKQMYiWyrxGKK
 vSGcM6CkTkD7XaQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=69273b91 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: rUD3NiC3dsH2D7SdP4ohGkdFfGzSeHhQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX2qjzOxizKtjd
 z7cbHN4ZZieyee+9YRzx/boJapPpNDpdk/9Fqe2rVYMT6FwzIfchLNN+L92fVNziKaYH5uB2ry0
 xL8bnHXJjZEoDI/GJGuuXEqVPhMfV1Y4DbTzCFzpGSXVglAmAINypkt9irWIV9+HQZ0GVbzHS9B
 oBD3h+tQoJ59Gl7BrRnJJvAAO94m+WdCs27RMkKZ7K6BvgNTiW8iXvsBEIhWrrKkKy8lHgSPqhA
 YN/MDMq2GDpMDxfjLbxjU1j2VqScZWn9nQAT94I4jcZU5WPumxMXcG+yrNZuaBFCXNQpKRnzwhP
 ogPszPULkCcORKhKWOZHHxyaciVqOkSLIVJwSSGJffIOd3jPYqXdeWZ9Ex1opnyAdTbSp7/tBOj
 1iti4wGrEyy4RkCg/1KMFfpsU4k7xQ==
X-Proofpoint-GUID: rUD3NiC3dsH2D7SdP4ohGkdFfGzSeHhQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260144

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/pf9453-regulator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/pf9453-regulator.c b/drivers/regulator/pf9453-regulator.c
index cdb80f9d1bd7..779a6fdb0574 100644
--- a/drivers/regulator/pf9453-regulator.c
+++ b/drivers/regulator/pf9453-regulator.c
@@ -538,7 +538,9 @@ static int buck_set_dvs(const struct regulator_desc *desc,
 static int pf9453_set_dvs_levels(struct device_node *np, const struct regulator_desc *desc,
 				 struct regulator_config *cfg)
 {
-	struct pf9453_regulator_desc *data = container_of(desc, struct pf9453_regulator_desc, desc);
+	const struct pf9453_regulator_desc *data = container_of_const(desc,
+								      struct pf9453_regulator_desc,
+								      desc);
 	struct pf9453 *pf9453 = dev_get_drvdata(cfg->dev);
 	const struct pf9453_dvs_config *dvs = &data->dvs;
 	unsigned int reg, mask;

-- 
2.48.1

