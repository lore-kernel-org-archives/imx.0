Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD70350D5B
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484328; cv=none; b=FDa0WgQ+o65NfhDrXiHZjRyd4lr1QSTon3gGSULYLjxkr6/nQp1GAHiGPKCtTE4RQL79JEpEFUSDlAaG4jAk7vlRi3l25G+5BbjNLqyB+vWxEcNfK85gQ7TAw40XnVlXtVfLUY4Hk9Ukj98v8e2LaN1isX5US/vrPDwtuX0sZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484328; c=relaxed/simple;
	bh=u9n9l0NVttKMXo8Cm/QnZobv6JruCHoppeN1fvpKWko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJvu0wUulfrl2DU7LK/REUIo4SNfTXQmgGDo7wb8loZRQ8dCW1szr8zO6xvJXlsJTK0xZPZuOkspJhytqCVbFNJmYj17KyRmGf1FCmt98/49BhlpgG3tIrjz0xR07nLoPKDeEhjH6WLxcA/FNVMu51FuJ8HwBusI3EVM8jTG1is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNYomGU9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OI8ztHFX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNYomGU9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OI8ztHFX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9kDKN1889180
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=; b=pNYomGU9cmrs6cHg
	fm8oG9wabrJHG8o4uIhaWjepW3V1TVEebjIg7mp08EZYtn8SdNW6Uuf89wW0V/Wh
	9icN39epcyoeCiVslOAfuMGs68qB+KRESNcQvYviRtYxqnDTEd5Uao5EIYf/P5RU
	5ebvZcYuUuUlmaT96ibknCqGpJjviSjDF0ebQADOjJYDQkTaugHW6n/DHHEcsHt+
	xM9lFsXVWB2uDMLupEFXKs1NTQqbMLM2WhSvY6WZ9IJ5lKw8C288uiEsWmtLoKMH
	cxBOvUJaOtutjOeDogB5wzkGeUlV6mYLdVIzFSEXIuyLaxU6vkQcAaB36TPnyuFH
	p7e49Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ak54n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed7591799eso117769301cf.0
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 02:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484323; x=1767089123; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=OI8ztHFXCH7IxAHGwjTHYAigMNUXiO/Gf/ZeoUpfyJLm3CsEgpBYS+iyGxg3DylXEU
         0cfN2IayjOqKh/Kov+aypLi50TbWk+WjLC775Ca4YwfU4a7zQdGw75OtJqWcx+EenIB7
         tmLX1oTwl22echewDhhh8CK16b5lw5jMl51D+OZ7Jd4o5BWc4zfs9vfflVHfn/jhIv+n
         JDgAlyZf3hUOX7FMm/SlWus1pBbXuUV5jchzDZIoYIxUNtKXS6lOSMqzRJjnTu9I7U+0
         eT8lUhdIoq79E+Sb9RUE5We0OToNPHDCcaW3JnlY6pfnhg5WXll7Vh6m/uFb//rv3bJM
         zTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484323; x=1767089123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=gRxbY53pdLYskP+0OnNjFzslXJW6x1QJR6VWq4mCbN3md4/HQgU1n/XYr5Ci0Q5z36
         847K7XFPsiHG0Ds6Q+YOZcTWuBS6ijlupHTFz6bB1hz1bdB5eSW1QXRtoiJMIR2Qe0mI
         CwnctWjfDrcw+i/sJTrPhWpiEz1KBXdT9RxhCBmBqXbzS4x5K8RMuEyBAi88a3Zf7QrT
         J21yDAR1PxikwEb2dAK2zPWB/m2aAACtwVXje75gxGUh69HnsYcWVlmclMLG+BDmdiZ4
         V7uPhKVOnnl7Adg4kvoeqWD+h9HHGEYsQL+QrrFRWy9wpV6R/F6n/0POaPFm48+xYt0m
         bCwA==
X-Forwarded-Encrypted: i=1; AJvYcCUhbBnhAo3WfTPWmLMyO806Pt+3StsYjlGP2Cy7XHsmgaC96EaxGRqHaRm5uGkp5OmH50E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXOFtYCR1t5GeUbGI1s+/CsaxAyrYfPa1ECOW85YNLQF9Jq/Zu
	002xVcf/ZdDZRbSfv7Anq02lQYFguezzMQbfzjo1uHywB/vt+/zSO84vHTQNHO1hIU4AIlfemjO
	JaLwZflk/xb+eO/snVTi0mixh8plj/FRkUa1H5V7rPFqgkFr9EewicRo=
X-Gm-Gg: AY/fxX4o39HX4i7NO+sDnIgEANJ9geF2w9KuI2rAbVZw0U9DF7MVtC8UPiy+aHeoR1d
	sLMGW+dM4WdMVffcWaYbj/SntW1bXxyKmFspsjFQ/iCHBcGElY9xPJfepAmz6OqTw4KU19CmHd7
	U7fKGx5yxtrltcdHbWLFvuhVjwqpGsXudZag2fykN8zD88fDi7AGqq5HsMOGHwkwv7/spv87bCB
	3Xryi0KBdeB171K+4fCPqPSfkaA2+jCPJ9/YVTO1EsvIwxGWuRD6TdTKTohyP2h1UaMkExUOwSc
	xChJyaJzPU1+K4Kvj8C8KljgO3TrfOUihWYaMfpTG4NEY7sHe5/ohTtXt1ZmL/rvZ3J2qDBnP5N
	LSAcDzJYXuKap0TKeHmqTRuTKckvVKFLcmUs1a0g=
X-Received: by 2002:ac8:5d10:0:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4f4abcf6addmr217340331cf.6.1766484321916;
        Tue, 23 Dec 2025 02:05:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAPQdXabO5HBaTiT6yIeqTveZgwhLdZJOCpfRWZHMPFDQdqtbIjCybotRp8NqedBYlY0yHYg==
X-Received: by 2002:ac8:5d10:0:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4f4abcf6addmr217339861cf.6.1766484321342;
        Tue, 23 Dec 2025 02:05:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:50 +0100
Subject: [PATCH 12/12] i2c: bcm2835: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-12-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u9n9l0NVttKMXo8Cm/QnZobv6JruCHoppeN1fvpKWko=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlFig4OCqbxOtJvNGtfIbNE5836C9HJloutE
 T8pj9i2Pw+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRQAKCRAFnS7L/zaE
 w4IpD/4iRVCZ94Vo8mTST6iSvQjGBf2bMAdM2sdO8w4o9GMwNc2H/1vL+dj/sJmGFW3ePed0xiu
 OfQ8nOIpF7LKB1HNC6A2p1obt3zpQkIBePM2r725XHENMEfMGe4KI4hTHD2qQaeYaCNiNi7x4d+
 Ssw+DtyKoTz0V0ATqp2TYb+xhLCALnkXb2kbZCKri/E/wDTrVSkJ7iwnVd0I/hH64yhhp/bMQdf
 tyR8jgJ8IQSpOspV8wI/4LN5ZHqgJoFPQmSeYARCkVCgmV4Jjiu9aVSmx2Tf9JBhzh9HAEgs0iE
 vPUc55CRahywqI3FYD9ar9avHxuIXWTla+1k9pf9oWPPKJqkB1J5Py0js95A/YnDt14rWHqL3U3
 iQUNnnVgLUePs01mhCJzrlDLzsvp8vi8iJtLSFnbhn14cIRKCydCtuyM48EHFXuykcgBuaAp/5R
 7Ryrsdqbn7Rm1QlW1KkJG6yBUvzwvQpALIULi7KogZWXNUO7vwt3/vlD+gu6InnaPix0uk5YE5n
 5nPhxNVwesXk7baloi+fiEKV1fMwNAKpinZ8Hsp2YSkiFNtu43iqbM+QssSjicD4V/PqAsRwlUO
 WmaWgErClY91YRNy4LEpJl/v0sdVOlBDfHWqqM40YZpouviRqrDs7+RjycNbZYbLKgIS7iRw1zY
 WaaluLh5VAM/Hqw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX4SakV4m5z+Ql
 4aDstr/CVysZbTMrZK7OnjY3zb9VLKlvc4RxDpb+yIbOjxQCWdzdZB9aYrKXBDdiWnE8/wdMIzZ
 hWB4qAhzsmrm9Gft6KnQqYTcam49DZZI9iCexIb5b9AhFy1Y9uYLRhwtqNLqc5Lm5L12cgIBXvu
 5qRQOjeJxotg6mCaNISnP2P8HiOH93LWr5abqJrwcZ7rQcKPCQdp0qK5lwRLGbLjE1a+Q8QTLb8
 2wYeOXjpadcs0GkXCrPvIqoHw6LZOrC+CGuWLXNQmSQYuEhhtoXResnt0pqED4RtIj2jMoYF2vV
 8h7tSFrFkBLnfzUEUapqxsi2n3aD7NXiF4/SjNemt5CIL68iTrK6vP+qwbCEwd5rsTm39nmXLjX
 TIFRGZcP5sbElBeYaL6vszeSJcGEzwBJnzuxEJW9+xSmYxaH6kFpWrqBAARf8TZvrco5+8/5iqs
 h3i289Uz2+Lxz/VtUtA==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a6963 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=w6fcmXAubz_WdynIYoEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mK7de7MUCIXvnCd0yqDQVLpyVtnR059V
X-Proofpoint-ORIG-GUID: mK7de7MUCIXvnCd0yqDQVLpyVtnR059V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-bcm2835.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 0d7e2654a534e92a529f27fdc049812359678522..4f7e4a178b33fdd172657cc625a34018b18f88ca 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -474,8 +474,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
 		 of_node_full_name(pdev->dev.of_node));
 	adap->algo = &bcm2835_i2c_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->quirks = of_device_get_match_data(&pdev->dev);
 
 	/*

-- 
2.47.3

