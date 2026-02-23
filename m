Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D581B352F9B
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837597; cv=none; b=rGxdsKlgSHowjAQyQBfBYoOpQgnmgbFpFLS9o0dAzT/qU2P2amIaipxjFGv5wBQhSavLJM9E4X84NMoxxY6SXYvI9xlReSATmS93fcNpr8N4IEOLjonWp0s8OfOM0HxnHYjGct4e4ILjropykMY7foipHAtoqKVkqGeVOMc8120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837597; c=relaxed/simple;
	bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZnGyA4N8pTclZfFQZ1uQklFIbVNouB82lbFqYEhRztyPx7QqonAbTTCkVS1IXZAnZga6spnk0p7zPSpOLNdT5Azml/kZ/LE9nDyEB9D5LFIK3vngVLctMG6+1NeSxvwRYqWgvK2wWLPKcLDRtUpe9eYRq4x00QaTMjzr2PSzN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACBMi7vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIZugPbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACBMi7vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIZugPbL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLJVbC2608680
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=; b=ACBMi7vxntgULb5J
	Sm4Of+obwXTOgWEcFFHqcz7jBmTUkJDiJTEQFCDvLXA/xcEcfsWZIKkvpJx3ELvl
	M+erOMeO8dpd1F/M2lVedCmuT3cVHAdwG8QZZmS2AcVRcWyv6/4Yl/7kFgACiv3r
	M0KpB869Eqi5c0s0iM3GUF1eXjREy+S0P0H3Htf/nB3cUKlS+f9qvT/6jhR/OkHr
	fsgMbYD5aCnZ1yAy4IlZZDMAdcUhxMPZaHwE5V51cb8QV7WwcHHyMm+mNocI1oRC
	CCH86WbjuY3aVhL069J7Cb8lMrvMgNoGowS5OLxF1pedVxz9qHGw78HJEkTgYL9F
	EKUucw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv3h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3d11b913so3827837685a.1
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 01:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837591; x=1772442391; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=bIZugPbLLhN83/2HQr6Qb23NLVJjlY9vkCkpv4j4oNmbdpnHoT3160aV0nDoYQPxT9
         bfUKMh5OX92xEwYWnz+IMg1h8N0px9wL0yzsr4OlQwrNy5xe+IsoVpaOoEsSmyInOZCx
         QOFWRoSQtQ4nJRsyFoNdI/lWauoe/8FuH3vvXUdnEqvqXM78xH/l8eqEepkTC0/QYLDq
         OXZAKQpD+aFfO7p0KKPgYjx4yhk5H0g61hI7o0yAIrUuLj94pujMVICkggbrs0OvnRuk
         ELvUIkQmBd/1ZsHB9wsvoy1kTaQLhTAwXKPzMoCDb7+Vyhf51QTq0/IGJIw62AZ59R/U
         jXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837591; x=1772442391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=fWJaTXApkrbhCAPqrTkrpnbj3WIhnSiWp37jl1Nf9vbP8G3ckMeCoi6cf2LODATSjV
         hIEYMZ9Y8hZyayu56yKLYjcSVBFjKpZFJvTCsEvA5vhLuX0PeshwW4sC+4riJNO+h1Zx
         FF61u570/muxP2LuthjPUs/G+cgocUr6zFXCaQfi5fokAl4JO7JKarMn2oVruIBRGL+1
         uW6FakhYPGTKDCQLUnw+vNrgBh4DWMKpC/iy1v90+zKKMlG7miQkDjjO9lna5pN4G8WX
         Uh7w3GPnKKtRG6CRmmQHuwWTqhSd+nMDijbzwczpcE36wts7jAzdKn6dETSPBJXO8kuU
         J2Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUarJ2KmRGzYbfwWWun6khzPLkhH5ev3SMye1rgXLl+ys3NWMLEnIFx3J1Vw1/uHwz1MVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEM1H3IxXaPIdzSMMP9BKWORCWj68yp9uFnPYdskpyBFAsfW9z
	SnalxDao5AXQ/eJo/JZAHK3s1csL+LO2xAaNK+IqpKAmp8j84ojUHd0oXQkMYNyTseLkPS1ixge
	JilGgAaTrTv0ocwhoHYVslkVLgODmI4ikt1hmoQw4QLHo7+UYmmE4LTo=
X-Gm-Gg: AZuq6aKRdi05ejEJ4VAhpvXaqDGmKgFqcOz+KKRwLPIJH56RNiYPwLXCsUpNWjTe36F
	XFO4hQv5Ln5Fg+y9iqMsfxle+ViYTSGlQUxBLJel6umjB+kkHhXborQNIOoFFHC7yF1ziPfKOn3
	1dAE8hLANKt7QrNvWX0uYKGGrKNmShiBcdRJ60ZEUHGd0Rdf0SXd9/e4Vld4CXFJc9tDt0BanhR
	J/zxtkNTwb8lXNNBtPFVOhk2yfEM5Dw6iTa1adbCTb6WQ6/qW44eJnOGnw+ZcOl56A40OrnhLvT
	gK+DfDve+BBQyFJosdyMicx7SmjAlHdn6fCPHvM9/8Reo1Lu3DxMv9uRat3SRj9XHrFXDpHcz2M
	1Y2+zY+pUzjYEh6s+N9FZK7d/z71PYX34WhOBwO3nrXxVVaqYyV73
X-Received: by 2002:a05:620a:450e:b0:8c7:13b8:8b55 with SMTP id af79cd13be357-8cb8ca6e6c6mr944317985a.46.1771837591247;
        Mon, 23 Feb 2026 01:06:31 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:8c7:13b8:8b55 with SMTP id af79cd13be357-8cb8ca6e6c6mr944315985a.46.1771837590759;
        Mon, 23 Feb 2026 01:06:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:56 +0100
Subject: [PATCH v2 10/12] i2c: gpio: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-10-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh5L9W4QURdlXv0MMYDy3Wx+w14PFc5E2/TU
 a0C5IUrGYyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYeQAKCRAFnS7L/zaE
 w1AvEACvwcgSdpL3LU2XuYTrJqc2aiozZlmvj3/1Ie0jMcJEH2AK45frU0bCSRvr2gqCa3Ii60X
 6WLZVGY6RlNRcdxRXLRSZBvSE0Eoce6hkv6Q5YC3L1/cw8bbzrNV5usBKi4oO3Zm99AILawCmwd
 zJ+97Zpcy7O2/PN26x+KI5d5VP1+tngkzEvNqH3Nla9aCUt9PpyjL1f0AVJJb6QVS+Lknv/Ci1W
 GHiSaZ6FFGvYN0mE6bz2csmla16RJ5R2WSSWG3wGVcWhwECiQgsRSByzTQO/NEgkl6ppgN7lCU4
 8vXuo0q0t/6Z5pjWzh+HsqehjDvdQzAhjip0VqM4lr7bjbhfjxeHbYytbLQbTwk8nQU9WeTFJza
 B0agd251nKKlp3X2vDs/zC3adAlD6rqXJG0Rekke0GvHOmXCHDoGI9G0FHspKYH1R6IQESj/atf
 RFAxptAGIlRdEyhIssjv5tEk8tNpkgV+aOdxx5Ww6XJXcURDTdiVmts5AfQFkdMd0GVo9xAeXih
 xNbmcFwpHrWa5hjOt896Lld2Iw2ooAPt60qFvm/35aEkwP/nPU/SgLJGtHB9Hevf1KvleecWkwg
 odc4uoBYOug8l9+6L6rue9mcvWyrA+2VwZWcYKw5+CK210buMCsqUZJkbIZDwejQ88avb1U84yT
 HJ5aTEt7TNzEmWg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX26Y1dsx36pd8
 LDRx6D2g/4vZLBRlvkuSNz0gCpdkgK0bURD9mCFk3UOPstqeZ1DTyI9m4z0m8cGBiMoH9TjTafG
 jVZBH012/xFvYkmccvDvIvqPXKO/Er+hq29aPgwfYhT14cD25x9EkpHvAiSULOePbWvsqOCvwUI
 E9DWgCM88ojv5QG3nPSR8G8EQHPVx/FHr9zPN7iSSz3J2XRNN40yUWOCRIvVD4W2ilmwjudsgzw
 34hlL+9gY8lHEkkq7QO0o0bAsngSBEHZ45UwkxB/4/E/YCAOGfqBloWRMhXv/3Y7zrgSs5OgQjF
 EtdBc5y0B5UiMf+3gcDct1mwwX4REcDlXs4P5Y3VBSVzQQf1tOQ/naI4PjzoWuQqsz5k7Duevwe
 J7OuIdZcctPcoVsOdRxob3BVo7WJ7nh03/px77BABkZNW9SDSSzA0DRu7poEczuIlN09JJmGGNT
 VF75PghrE3cG/3HZkjg==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c1898 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Phg1id-qkUUnRn8ms8WXfQoSLvamjQ42
X-Proofpoint-ORIG-GUID: Phg1id-qkUUnRn8ms8WXfQoSLvamjQ42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf15c402e71096ccbb99f5a35bb479..78f8bc2525be6d1fd9a7907df4c253f33bbec9f0 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -425,7 +425,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	adap->algo_data = bit_data;
 	adap->class = I2C_CLASS_HWMON;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	device_set_node(&adap->dev, fwnode);
 
 	adap->nr = pdev->id;

-- 
2.47.3

