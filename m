Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C37350D4B
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484325; cv=none; b=l75paYh2FfVeEMsuB54M3h2lQ36kZK5CIAs1hHlrNa0ruj5iYrfAcBBjXR/1f9YJWVF2PiVqWENo61oKLckqSy2RgqzEbgE9uzEwjjP35TAByr7z8YDg6sdePMYwIDoXq/8HAdSn6qZ3S5JPJhhtlQX3MpK/mtOJ3fwBAcyv6ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484325; c=relaxed/simple;
	bh=Kz3aoETjpXt/sy8S8XSk2Nfc0c3D2LQVFEQrK7qt+cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SjGY7Fk4DfIBX2FGqQOINUdY6kQvYMnsFFA1zbzav0GKYMnNS0mkuehXVj0TmNMcwsYt0QJEskMQzqGmcfM5Wy1LpsYSLbXaYLZo49kW63CCukR/BCq60/wLkS/1S8d7NmrQMvllUNTVqKtBnCYQpAHgNiAUO/hK8Y4AhPu5aWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pogOhgER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcHXA0Ap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pogOhgER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcHXA0Ap"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9bgtA2041230
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=; b=pogOhgERHMDldIkt
	KAhEDEfQfbo81lUnBP+JJYv8YmjHQu3ASOwq2syL8tnlHWf7xY9raerg4qvN4u7F
	jQ+T2OdTMuBz2x1zwTmH6s2kkqeXBbPOBTpQ+nOlPO4h+WI6sX0xZIA/AuW9uYNe
	opgpoMkieUBaqC4C5mFZ/m7bXyfvWemFDSKuB/XXQLoEqeCBLJagRawrw1rAtZFA
	GxaQF43ozUaaNu3B3GOrAS4DKMVArFToRyCwSd+Fcr6w31/mIPZg2koLqiuDxo1a
	xJ1P13mIpYGxOwoYb01spCOOFodqQZJgL3wKDyEMZrc4Gk2bdVwYIb3rpeBzy9W1
	akZw0g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkb82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ceab125so123788321cf.1
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 02:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484319; x=1767089119; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=;
        b=WcHXA0Ap1YrSL6FNyvEEjf3aqvtg7GnK/b4zbFotKH5KcpUVR1PVC8qvcNNW18hI/D
         HYbzN9ljW6jgTXywBv8JeO/3/ZEt+Qt82X2IfWGG8qPjbXYSPf+Q8c4/UIfoUAZd7uSN
         RfRTkXNbCOvueAllS9QYrN/zCDmEJY9dNOjDtaBSrmkh8lvqtybTmgjtnoR0xI0n8BmF
         40mNgB+LIEDFKzot4eALcD6Txfp/2KtKUkSwOhI+3AbUHmKofRbg042v3ouBzH0fpgHK
         9IcjKyOMROn5y1t5yL1mgeQ7itOU9Hc0lUosCUprwpS3HThqUnnbOcGsr5DbjI3iMOHS
         uZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484319; x=1767089119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=;
        b=RkkMo5AmxstT++3gTSMCTNBwR9K5Xd+PrU00Rb/U2C1zEY23AQyzdExr2lFps92cOj
         KqMEc2KHF7XYriDMq4815bzSWc0ciAjU9xVfq1XKNTH4U51d+FQd5lPWl3HG/RNQjz3n
         5zAwUj92GxXy1fSn/2q0wU1hWBO7opiPjd/MYR05Qs5xU7eGJEeursSyXsS4hmYWF4pX
         /9lLl1zvivdvEpJ4aEIsCpGY5H3+t9pmFFten0E2pmGsI6J+j5ZX3db4QhKJLyr5X16f
         ampHhIKIX7BgRNwkk/6EHvqmBZ7zA/TbRYKcg4vjO4dN9UEwWUWJ+BrGghAu8fSIOoda
         5YFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Z4BmZp6Gug+kC/PYosiqXEdx83LQxcs8yrBdcsfLY6oojUUvDNg8RgPD6Qx08wiM6Q4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqZtsdLXvj0LkpGtoRxAsTtfPhd6tYLMHLgcahKoO+QLFUtLsg
	Fk4912ryOllvgA+IhlgHgB+PEc1sZOjQ1axi0ak3EyMJA+jPiWOr/DLhDjwN3kPmyQJg+VuLlfB
	I8o5ccxmUMIgzJXQv9OImpyy9hzgtBjqdGmlPQ7zMjzT4Cx4mNtK0ykE=
X-Gm-Gg: AY/fxX6ULsTQP++5wFeH6P3apUgd+0wTbQzCWviye2fnHeN0EZtFM5e5aEdWILlzfMY
	7wXNBtScCTUxTP0SJzGoWwlUyMCaxk3GDuCp8jMkD2ry53biY4Ak0tDlLFkNmIJP1vIWqN95RAf
	v9uuU8j82SvmRGD65ZMqhG2rSu9bVjTdEtBIk9uUgvW9W++S1QSfF48tCHc75CXTzaT8ujcghty
	hmJQ8Pj6wy4zpp68tmn4vcgmfojrzyZUFDoiRUCTBPRgzBM3MgLbW8fMWp/nYjKvLAy6ktIQCJG
	m8SM4QpQaFxafHTT/yym+xx8k5aFh1u/Q8b4Ih3eOKEv6CJPN0cbhdTp0+C+6xNY/R7ZQ2fvY4q
	LUz9Fw3rIq1Sr2F0fCdLa9ojOeAoj5RCzw5JbN/A=
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr198669081cf.35.1766484319022;
        Tue, 23 Dec 2025 02:05:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IForFIDGNQ9njlDz41j98dh92a2O0U2qbhfYixKg3bKX3y+MnR1F9NI8gPqNhBANugj/T2Qbg==
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr198668581cf.35.1766484318613;
        Tue, 23 Dec 2025 02:05:18 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:49 +0100
Subject: [PATCH 11/12] i2c: nomadik: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-11-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kz3aoETjpXt/sy8S8XSk2Nfc0c3D2LQVFEQrK7qt+cA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlEH8yQsYMAv6ooCMosuFd7IzlZjLcxciyOf
 UQM5iCbkxyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRAAKCRAFnS7L/zaE
 wwKlD/9mCvI2m04rBS/yTO76hF7LJmURZqComcwLRaJTxRw5Kj2GccDWLLba9W/EeWkgaY878dh
 mlgpACmVVjIj/prfsLX7VwnEpPwe4rki5hI3MGdAWPuOBB38zZjTUzpYhocg1jLTgeQGLQxmD2q
 CV4Uj9tLsSN03FmctRiu++tKRNFBOXMsa9K2Z3RAKe13mQwAxnJ5+8Z8HSgmA/JwZZqx1jRM8Qn
 bkWBgiK3t8ow0wq/mNyfLGgDNJc62hmdViGPZLJu412tx2uphiRhRTDobCLSQ9SZcJl5pGKTGYQ
 mHi80IJwOzRfDVKh+DstwfULzzMx4mgWRYr2BY+ktS3eabzeXRUE9aOQTJXFHqfqWILuhuWh/Tk
 PKLcv6/sCH659tOUBfTrwdR85pZbH1LWlXu6e0T7R3wv0TShScYr0aKotIF1j566ak4aqWasiT+
 sC4scVMWKAN4xMEFEaCIRB8Evbqcmd828SbMITuSWbD36vA727i1aE0Oy3V+4yX2Pe3jshJeQEe
 seOtLCdT9PrqO+tbQNx7JsOdrkZk54nPY6VxGMS+AUwQVbaFwbQR/kFLjgPXNFXdtEF0gTLW+fq
 0IaCwqUzHvnG6VJ1Gjbu8FYvHGsSYI0nbDwBTZkeLnbv6lKgiBUMxVS7r3oojb1ZN3OvLhNfYZs
 l4zyIT96c4hbKgA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXxKCHGRiA3w+/
 jerF9pMSUf2i9fF1yy6WmOzmVva5X08mdzZrhksDjho0b/CnSMqpnuRdfTLk9EmI924l286TNt+
 /V9GLSmKxrKlkaUmtgv05wMvXsBPoZu5e8Me01RRidrjHX0Rlwg6/IaYXYwlvHBXUK/umowttdy
 RAsSnr6Sd+PnE4aRBukfFw7XuYudh1XsJNlFXniR9DWqQmqPS4u2A4M+CILLIpeIGKt4ZUSLHsX
 Gyx9q0pTNe4ZykeUinop9OfCpjKn/598jDwutk+gv366FVHOiBqOghOyPyJGiWkwI1NOnYs1YMK
 mrh4TgPH9ZRDh2NpQFJoPL5Qexn7fKIenrCpMsPeWcMvvRVqrXYEg/mA8UvooDJxio3V/ytiY+Z
 SyIow6KP9gg2JtOOJ4XAWRnwJmsoVCVdWMiFfXpHBxnV164AKQbWZd3HAc5lJVJSGw0Y1+sG4fR
 bdFz+wvWlOD0uFfdx8w==
X-Proofpoint-ORIG-GUID: AbCOqt66oYQVdMPdGQfDt0CScT5SASlG
X-Proofpoint-GUID: AbCOqt66oYQVdMPdGQfDt0CScT5SASlG
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a695f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tIHrhau139UvCPJ7cvIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 19b648fc094d9748a0cce4e35f350da35ee25505..133ce90941ed596ba2e6dc2d9b368cebe7ace3a3 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1147,8 +1147,8 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	init_hw(priv);
 
 	adap = &priv->adap;
-	adap->dev.of_node = np;
-	adap->dev.parent = dev;
+	adap->of_node = np;
+	adap->parent = dev;
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;

-- 
2.47.3

