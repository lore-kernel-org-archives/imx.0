Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D034C128
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484304; cv=none; b=qbMAY1oVWj26VOI1y4pLflPvisWZgtKe4Ka4S/oKhHNtMblZuLROkK7XeykOzW7Ac5aRYYgQ83qG3sRTzgPuu1pN4taVFeYs5eKbUG0EHpwA0BKShErpIAxyl7CpUmvZILUCcOCkLN/LeKoNTxphcTJ9xT8+G9BKLWtnu8x3mSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484304; c=relaxed/simple;
	bh=hf4+ULdK6Tdx70XShge2syYlIjQYGUsU9b67SniGPyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBJPwyWs3h/BUr8vGrl5gypPLvBSXUFsIwyxlJhADkxlkyWA2HlA3/2eg+I/uM5xZWekfebk+dqdtuzwH6lD3C1b0cZGHEOvmd6vHek+gUU4seemPpNZ9MdbPjQnVkOX5GnUV9zyJ1G4UvTZlhwtzRUCOOUahr8ToSWG27BdgTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pajerv1l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCl++3qj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pajerv1l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCl++3qj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7YYgI4045106
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=; b=pajerv1lDNcrq7oF
	mQmcbA7QamlpI260lXdeMqWb5HuiGh8vx2uVdNJXoeJPkXbo/80d4tNJxKyqiGE+
	G8zAnP+XVLv+veOTawhxAaR/oat8TAB41Xd6WtOxJJifr/PVcCocFulHrAcoCFsr
	AQd3SVwAhK4FRc7quYsHVRgdxtfJrZuMc1SmBUsXBV59XehNxvWPgKkHhzP5MrCo
	6piL9Dfm3vOgSin59nFrOR5NwVn28Lustl+9xFSDanXLDZ/rzZDsW2qFLjRxgFn8
	dr+uwvgTiF5wlSvk/3O2qy1OoVE+R47c5OQ9vb0qoNTpS65ZXGBcO9sGIMSbtazj
	iIvkzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha6s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09211413so121328241cf.2
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 02:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484300; x=1767089100; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=;
        b=TCl++3qj84bH+KiH3ruDay4NUTzHtbjmdLa0I10hEWi2zU1cPB8MNbK5n31JeWDIYt
         P2398c75qZC9EC3VjyeKlD1rHnbWBa37wUHYigMPHyEkEq5DtO9aOfuVTrFh25AON3h6
         e0EBTva4yHkB/4vaew9PiuYPN3V8coFTg/h/GyqYLjlf292m2O7H95QZeJ6y78/63GTj
         1rPEnuQ2r08wBZRj2m/iQxGEa6UyepF6PAHy2WuCko69I+XdOtyrKmr11w7emdajWHEA
         3gDE5vJi0Za45Pt3gzHLer8KAbKxJ3hGiWrA/fJQ33+2yjiKctsaLPod6445F4reS/R4
         QhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484300; x=1767089100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=;
        b=G1mFCO/yRwY+f3zxxGncKDZmSlCV9xctYbGfH7Cu9zedVYf1ix7iKYT7eQJrmSvctp
         UaPiIyE97SSGKJ8w0NBfIi0kbHawQhvC24lUuydvwYteyzBOmrrV5tdWsCJm1V/a4kuH
         zg/BACzdKOVc0HrRP4oYRRPL+y5MVjfdpNXStlzLZFXa3B4Nm9ddfD9tgIn6IH1daJ0o
         KwKsc47oSCvHr29eqqcux5OdYrfhBsupAoFJDx4Gok9zc0yRjVK9iIUXF1f0Hr77OPkm
         29V8sxpdlAzneAPXjK7YKABOjHUaiUBYcu/z3zEVvZu3e3A590oDOyALNlZY+0wTbh9P
         oNGg==
X-Forwarded-Encrypted: i=1; AJvYcCVlnTBO1VlUnzCZcDf02oV2nTT1pbcmQbSSAjJpQnmQhrmZ3YClxP7KcKTGij+4uJGYJsU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyibSLi1oxuAnKvtolsa5a/qOvhb6AcMiohl4Vqgns/etWXnQ8I
	cyYZv5COiXJyyTKG67eDu9j5bF3N+AxdnSgHgppfq+hFJu2r7wd3W5eUsNn8vgx2hepSOQOTwhd
	1JWbaQUT1GbHQtPuTOTscWthYbtx1YnFthbHJgQASh5Ptg88895KxXu8=
X-Gm-Gg: AY/fxX7JCKWGM8eOK6JByyK9CKr5F2/Np1ov7NJ2CycakvH/XZWMi8lnWIbag3wLS8R
	o0hbRjajZ27rxE8elMyhW4H2gMsvljDELu3YXZ7wuAi8bu/pFBDu20hSdNOO+s6SWGc+Az/1r//
	vDccPXYtb3LKgoIRiKm+abV2QeqtdH017KHXfh7g81TxCdPde9eIVMaCXIqr6p6l6UESGb8JAX5
	bBR2f2AsyWok5XvTivorALoRLHhG9/hsUmkHTTjCHZd51v/EyD726XRMZZNQvdmPjIod6WPEuoJ
	Of5j8euy1LRjaTLaP8BQMw6KwODE1kjAVljN1HTb9rZvvaagOGRZmnhHv9XTsp8Xb9H7dmFHNls
	5EpYSJXQjYiexszHXjPUwIhDJ11s45Vf+nZY67Rc=
X-Received: by 2002:a05:622a:1a9c:b0:4ee:208a:fbec with SMTP id d75a77b69052e-4f4abda6547mr210630031cf.66.1766484299934;
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqs8aoS5bfuwJD+WoHohzfrk6zAuOj6uBm6rrybCJgzMO87KV/ByX6nI9XDqN55s04/NcSkw==
X-Received: by 2002:a05:622a:1a9c:b0:4ee:208a:fbec with SMTP id d75a77b69052e-4f4abda6547mr210629761cf.66.1766484299529;
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:40 +0100
Subject: [PATCH 02/12] i2c: qcom-geni: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-2-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hf4+ULdK6Tdx70XShge2syYlIjQYGUsU9b67SniGPyE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk83XYxA2nG8trXqlh/POQctyaBd55aW/HEx
 yqR05jcKWWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppPAAKCRAFnS7L/zaE
 w3K/D/9opRkZjX4lgmsOo1yyv8mXTtQbojGRw/+sWzvd3iklh7WtTGjjQw3irf5Q/NHiK0Ok7KC
 kTHtJHfu1jtbiCWCLHsJW2aprqmwxz0C3zjImvzFKUGd5EoTKhclKs6YpK6ejenbPt1crczvXsX
 DVbM0dp6qLrL83SuX7MnQ8ZWhYWn/pF233Q2eaDd/+QBVDVv3gck/FeJssLvB4N7h0CHawCHHEr
 GMGjxoeEVkiqR7aZITY5LorSFUmsIb3NTEUW3FVcWFpycxbRw3+p4wFQYDR1Ny7qGf2ILLmP/CJ
 U9LomEhmQZRkee/72jqKH8bo1FbfKP/P+VYyoUdTf4t9dOUL2U3LeMh485sQPqDTLq8Okh56v3s
 17XlETa8bmybd91T3pFrmxIV2mnuw7a1zsS5YVJwj6KqHK3T2ooXJwGCTBxcQCeWOdHttolsxuh
 puUqOv93aA/MSveDWf3ExFCRarP9b0NivMt85zgYH2M3WpsgSGYB/cAv2xSTgvWRw1FTwfaweW8
 ZacS/HhQPG3qxn2ZvGDzr/5ZHR65afrTsHquJQgEXAywgCExHGubbx+ijVtEDpPstDX36W2N6wm
 FRfjvhcCvUOisaTzzfyUkgcH50RcSIerJmDE+fwZ5XmXSwNOKtRL0ZivPRm8xYr+JtY7NIKtny4
 dfzPrDpz43UP7mw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: OTh8X4aLTmhQYBqEkrOU1SFyjceL2ZXr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXzt9N8vwyGGpY
 FCewQHO3Y7dToS6QKMViEBXlfbNqWjS4bQAVd65HLPk3aDohR8irnszqVCWXervW4ctVF00H7yk
 8yXwS3nMJbPjHg0+jXoBE8F70rHxZ9IMD/QNUDZ5Phj6MdzXBMdo5qHsIW/tKbT8m4gfYl8Q2bT
 jAIYY1XExGGfwxMADTeGIckTr7oO8DyYOgBhdMsGtGhDQ1HQDQ7C+CDqO7iX+OS3f1ZPPK08ZHZ
 6lb7En1v6XAbwLCW8zGJUSB6d78Kq/laH0heDwb05C0NtJrfaWAPYcrqZXo0upv3c/BqivPeV21
 UE9PwSOP+GYDoGSjCu2x8GIIlEn1Dl7fSVesOmC6Zj11Fg1dRkfrD2nSUYaZm2xgvnLQ3bkaKXh
 0TFLZAjMHlIbXUQsfG+mRc4OMCHVK1/sQa1Y6lfS/IG/Lh6E2NjZ8Vhgd11V7KIxz/IkoH2Z51+
 B+DC7nKnCFJDQ/PO/fg==
X-Proofpoint-GUID: OTh8X4aLTmhQYBqEkrOU1SFyjceL2ZXr
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a694d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GyXxqrRC-9zytgsE6zAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 3a04016db2c3222cc6c91386f8904921014a3f90..389fa49f0ba7e657d97a94d9e27f5d916d1ffcf1 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1038,8 +1038,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 				     "Request_irq failed: %d\n", gi2c->irq);
 
 	i2c_set_adapdata(&gi2c->adap, gi2c);
-	gi2c->adap.dev.parent = dev;
-	gi2c->adap.dev.of_node = dev->of_node;
+	gi2c->adap.parent = dev;
+	gi2c->adap.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
 	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");

-- 
2.47.3

