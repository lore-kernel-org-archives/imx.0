Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504F734FF40
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484318; cv=none; b=nzS9y+yeEw2S1pyBdHxdTrFIEimM4+efyZVSHZvz1fEa/WgQ/iQGhYsPCimUFjkS6aAtRUO0jRAyvDe9lStTPEZKmMCVGIaVILLToJ6MiOXvUEWdKihx+NFTgVcif80OE+b1rnG81GupL9JMrKnhfKs/wiltUVU36YYGf/VLBV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484318; c=relaxed/simple;
	bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DT/Z8K+vWxNg3P75Wvnqsa6aEcwj4KV4D4rjo/vkeGmqyEwomAZIgNQ3lcBY3bzwIAOuyhAt/SlBPwfZhB5THqhF7OE4LwhbNCRlwy6iKv24fUj6qIoX5Z3wv8AAeiI2JqO3RSX7NqF+SNEdOd5wQuZ8AFNAgQysQeYm3K5eO+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neYf11cp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1qn+H2U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neYf11cp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f1qn+H2U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2dMfS2199053
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=; b=neYf11cpzXgmFemA
	i14grOLM9x9385mdH+Uh9QeT+MPfvyVfWpTuR+OhOefbLFoWd2Ccp2B3D3rQ6Sc/
	xMeEZE2k6ST0z38HZ8ODBIRROdM1dDtDH2ToaCMZFo7nJyCKfVqNaecIxiljVeVB
	fBEVb9TvjRrvD8Gj6RR7MtVIv0oQDUqsr2HNpiQFzL36Sg69HRt4qlumtNEXP+hI
	5J55+A1r4PqXc/XgTzc8QJ1PfI9XE76eKBGbwg5j4I42Ugp6a0TfgNUxf9ng9wU/
	Q/gsoLVSdDuJ387PbmOBIZfFuPiAepkAgadBDqhWMtE42A8yYi+keMNlCKjpEhOs
	NwK5/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwurru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09693109so88914521cf.3
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 02:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484313; x=1767089113; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=f1qn+H2UDepbR9rVnMQxTQ3CHXLF7Dj0lICu9L4TrchxILheYl1ZTw0DfSzN1p2Qlm
         p9+yIwlGPd+7Ecwtllxw93lAKTMvX5+3BnKdHTH87SodyK4XbABAVCmMIhjKbH/V8Ul2
         NN07eA/Kx4iwCl1SIygjT8K/mgpqhjKF65xXOu6TrFF//HnIW/KlT/fCk4cC64ZHDp6b
         Q5wwW70VMlDajTEhjPtGC7SPnc5FGIlHLd8pSFB9OYaVC8zGrMfi2C9Zf2fCzR+L6w31
         7fvpIaILwBzGhQnafvWg6tYfmmU+6AgzhXVRkq1bmn4/FnDZOq8Z82mrvGKxIYbDtZod
         7ZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484313; x=1767089113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=F+Kh5GxVwbCc2bkX2HN/BkCQLIpi+26ZqNGCPNtJtVnQMwJCjqE5TdmyCG9bJDuTeI
         QtIdoPU4/oaaz/BOe6ZidO36I5zk0hceSOTcpNdgNp9AF7hw4YgNOnJazpLlcSYOBqv2
         +XUNZGBD+18SEhTOCI/rF/e0umY9IJxT6qpgBMawSHnYVhr5YPnQ2C2f86OVm+BrDQrg
         weHBgntI2XGxS657iOYZOUi89a2TWed37y8ttbYv3SwQwJ4jxkjkp0dhdQLp0PGOYtqg
         5R6yHTmYqGhpSYKX4t/aFdaFC0R4rrkHn6BPUd4s8akDezqofxws/Yvh0s4DmJmt78pA
         xXXA==
X-Forwarded-Encrypted: i=1; AJvYcCUUZMmaeAt31nhXU94352TpkhIynu+Rs9aH2Us01pH/XfTL7ahbYx6JNolmNA/nIBjnD1w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJeuT8Df/HuyxKFmtyml88mdl+9o0uz7ODLMr3BwDXhvpG0ea5
	6Tp9GAl6Q2UspPTNHvF6X67f7i00Gy+fFSK3s0rEVfK+R9vYYB/4xTPQqGXIkYb1WSImOk3nb9x
	Gh3dSSpOJiiTrZI4B3Kk+/uKfzWpwM3yWfrvY5s9Uz5kgj6hEZ87ZyDQ=
X-Gm-Gg: AY/fxX4bTdMm6Z+gWie8TjFoa4ApDxYRm5hlyzrqGhGgdz/zrhCfyXY8agWlSeTWDQH
	N48ZU5Wmzrg+rGzfgijDQYTQWqQ5T0jxuNsky1Utzd2DixEEE/sBJBxu38BuB5DqrxZg3XD01gf
	dgcsUxJU5lKnJAIRGaFKcsvphK5X2O4lVtOocm8V8VZnR6txfht58rmPscPrdJeBuRiXYYSBKly
	4C58tLTnzUd0IsNUhp5X/njvOvC72xTw7EQizCR2n/kqO0HKmXH4qo3qarw9BUwCjlH1NdNZSaB
	R6H7fTUWt3KCAXuGzMOisNVk4NbiaE3sH4NuH6vVw9kQXN5+HFvJJPjBe2NKV0T/xX5+IVNJNTI
	rLFmKrXRpX8gJ5dF7nhddI1Q7HZzMqlfcwp9fa90=
X-Received: by 2002:a05:622a:2b43:b0:4ee:14c3:4e65 with SMTP id d75a77b69052e-4f4abd0dc28mr219101191cf.29.1766484313511;
        Tue, 23 Dec 2025 02:05:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEV+mwTcQ3wuFKlGzRImOSBX3IU5W98ElI3KLK7HMccseahW4yo+ZXWeG07JWxNXrTGTWcIBw==
X-Received: by 2002:a05:622a:2b43:b0:4ee:14c3:4e65 with SMTP id d75a77b69052e-4f4abd0dc28mr219100631cf.29.1766484313078;
        Tue, 23 Dec 2025 02:05:13 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:46 +0100
Subject: [PATCH 08/12] i2c: mxs: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-8-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlDjj4ADx2Rb3xlfAMnQkHbo+sz4ovgjz28L
 EWnVXIoR26JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQwAKCRAFnS7L/zaE
 w7tMD/97LcD5KIQOMf+6WEJ+Lz4Y1Sw14f+up28X7B/gK/6aOiM843NZ/hmzVa9bU64MhKZOtBj
 Cj79x6oDhbT1wV5CJqYQfcYVaggsb9jL7HAJeRIwncgaat/UWFl89z7CgFlrkF8v61h8TIaHNHX
 GUOX1GeUxGIYLIUhSbr0QRtiV6I8Y5G7NJDpEaKMez/2WGcT7J3dNyrvJex27vt3odTYWAmh1Re
 bUw7Szu+9wntv0yye4mU5MvTAagH8Pylg8fuqmausU57fvsxHKxY7ek7SJp639qLc4V7va+dRTD
 92Im5KhbVTPWmFi+//r8mEVUUP3aw6uhqzNvYjQNmBbN6O2NsQ1vhRv0UscP5PFPpUozR8Fwr0A
 GG3km2mDfVX+8hHy5Z/wncWcHzIgzSIgQMl/3/kvDZHfUbj7WsjgORc9MBuA0tVLmquG3SsMKI1
 MBTSirX1b0D1OnJgWIwT7BczgYl1iGQex/916YxS79M44kbMtaUPiEs/owXZpbkaeRl8UR7x2vt
 kGAtUZZM/8umqo40ZDE7R/Htuoxp+ZnmnOnad7LAQni7+SPyaQtQekWYayRzl6qTl2bJ10NLg1h
 uxTPPwxTWHIo6DnUtqr0m1Pyc6annr8KyI3AFwgncoMmA+c2ebY8I2rh5rWMU6Yfrftzojk2Gxv
 8yvkPnkIMS093Rw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a695a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZBRMoY1RY0NPWYz5CrkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX2KwhR816kKDc
 Y+bVz9lplqZIcJ828L9IPJ2ym2dK/LQDXhirBKsXMskVaQeeURID1sPPP3BAVF5XwLxHn4zCU/0
 hkdLrHUstj9/SUss07i81fIdj84Ihk7cQpvpRi9Oj3Xt/EwEV2EZfjlaYGnDU7pkWU7lMcn1OmB
 OA3vAPewjc2gbZDLi1FL2GBgD2db9mEKn5nTaltf1QqI3eyZnup2Zgd0biUmsA5+y6ih48Zk7TZ
 0zC9jmF1oMz4doUTloDWkazbhromrWsNIkjhxcFjUGijNPx9rNUBTgg59Qup9rhLNopHpDJvePx
 Gv/V9JhWHgu1IKVP+pdwh7L01FKiBtCdu2fMojBp9nXEpwe9E3RnpGINBJimxwQ68TXjW5+eBfv
 IIaC1GhWi4DVzyzESlv5XZj0G+BU/WC5D7t7tduxTXL5M7EpLIsmY/AY63/rg/4WSJrufdHqWdx
 UKJmH9inuMPA5937zjg==
X-Proofpoint-GUID: -xBop6ztnxmP9IMcMGUfkF_KMGuFB9cE
X-Proofpoint-ORIG-GUID: -xBop6ztnxmP9IMcMGUfkF_KMGuFB9cE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 08c9091a1e35151bac8d4adb80abdbd29a62b95a..bfbd96ee2f483cd1dd872c3448eaa6a17940d70f 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -849,9 +849,9 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->algo = &mxs_i2c_algo;
 	adap->quirks = &mxs_i2c_quirks;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	adap->nr = pdev->id;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->of_node = pdev->dev.of_node;
 	i2c_set_adapdata(adap, i2c);
 	err = i2c_add_numbered_adapter(adap);
 	if (err) {

-- 
2.47.3

