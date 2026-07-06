Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9382A4D90C7
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341965; cv=none; b=W6Ur3X/lpoHPi/5x4pekOJLjP7CrSaUO2d73Bgyycb0kJtRDkiAw6sRh2svOwsALJRO5ZsGrYNx1dh7tZ2vAFUdBdKNjtc63xN23HwTy5SUigPlO0KispAThGKb0u23LCecM0vsNlU79riKuHMoV8U9M2KXIZDt3p4lY75T+bEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341965; c=relaxed/simple;
	bh=myAnAqwQCy13zr91xzLXDTsphXD+fJJQlPI5uzrj/NA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NvfgVmbP14M1JSNydtpxxgF/XqCMxBYCBa8Bcc/p9+TDj52TimPent4zbTQFtasIxVQS+RBdIoNoIgnhY5TVedWIVNiCmTbUrNju90PYYJHUmMVj0XzcPsiQabOgtiynWUuicIUXOvVIMbhmmYgv+FY1M088pjCmLP1oMj1YOdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PEZWyDId; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAJ0w0Fn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PEZWyDId";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAJ0w0Fn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOEY218528
	for <imx@lists.linux.dev>; Mon, 6 Jul 2026 12:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9S/mbrIgVqWqtPP8kmV/asLO7TrMZg/IRbAXVUcN3IA=; b=PEZWyDIdayoRJtJf
	Gm4yCbdBU/Kg4fCwmLvwa54Sk0sJfN3hNtb89B8sTjEQLLb7/NQP1FY2m0eE9nGh
	LdIH/gTsiQ+Wzh8wjGQ2vHc6+RNH3gineRvsHArNGv6/67/yH3ZhWSQLygU2RVUT
	al+kCmSgvmGNhPOOJjv+KVucWx0X4EB21idu1fTE9R/CSLy28ScyY72eHbaYuWhC
	OXDuIkhJVtUuTbzjXakzMsNOMrKY+8+Fw06v1ma+AuvP7I8BiqHsyiSSRZ6WD8YC
	NTN026qYSv+N5mknEhi/Fn7IR2T8k4UjxvMEa3K6XaNFaf2HCmxgQwNVgUCgNKtO
	dPmBYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs93gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Jul 2026 12:45:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e53b8a302so278872085a.1
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341935; x=1783946735; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9S/mbrIgVqWqtPP8kmV/asLO7TrMZg/IRbAXVUcN3IA=;
        b=DAJ0w0Fnu7U9G2orX6Im7Z7/u0hhNvXHKp4P/5XEebQw47ttj+mpGwllpR0UfPIAYt
         JbHL4HFQyqYyv/4B7RoGtswXaaMAytg+8LbUndHS8oyR/ZOch30fsz8ST356fNt5G0ry
         hqXcy9k116Bgj+HqoUMfW8P48nCmkGbmDHCP9FjC06TlR5Fu64XaEukEE5Kjb0Nd7i2I
         MSkNGAjEIhWhtb9YRHTgaw8PRDBAE/oktTc7PIMd7TFz9VMZftXQ6U6AtkisCr2C+qUi
         DZrye23RC6KcYR3Rt41OABCXyJR2TvcfXHAYYzQomQOaaHuOGXftwgEqgZavLBP5EH3g
         458A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341935; x=1783946735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9S/mbrIgVqWqtPP8kmV/asLO7TrMZg/IRbAXVUcN3IA=;
        b=nlWEqQO81ZIGJ0bA9CXfBvXelubVYP+RC1dQ1/sDl5KNkMFGPznFKmb7WS+Vn85blK
         4AWJjgr+jYNLaAVu35WNx+26cjigA2uBv++8HLB2InAT1JVuSytcfk0FzOGkspq3sLl5
         HAVIuR0PvHTDaz8uPua8mh6qTwjMo6t8NReXxy9K3HHC1qdBn1BtVbxgqw3iEmZpGCrx
         fbdqUSUq3HxW+zzPAyUFYizK4ozCuPE8QoUkoBNDDaNgmOzPD9jeZdaWC16bfF7oxChz
         +8xaUhoGMw7SJ2VeLyMXjnSt9TKIjVWE5LR+MfAEvPg0ysIZXxUNgwnFox5AAKeXzoru
         ZVTg==
X-Forwarded-Encrypted: i=1; AHgh+RpZvz1lTNlA+Qh1ZEUimK+9ylHiZMW7ecnaqHh+d25wInoq9B5alvHqdbJphakd2zRrLns=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKyt/igvMVj0lz6jOGssWDXuCvdIBj/uFayo9bjThawdGMf80T
	WQnVB35veYVmdq4PYih/Q7/CyFOXR0KM4NzSRCWbYNh2FO5rGtXjWT/5Hg+MogOB/Z3VmahpTvx
	bVwrhhqxgEGsK7uQYRHgI5rm03+5fePsr6bgrflINFFSnJ8ejuQD3ezIczcn2peU=
X-Gm-Gg: AfdE7cleNdfRoq+qE+PW6aI13+JrlEF4LbJlWcqEXreUlpUIbu/1kdjVLynMjyeGLjy
	OjPXoQ/HlxhrkqgxL0zh0WN7I5pFN1k5BGefyxWVZ0EI9XVzHjSoW+hrAxPG8gebOb8rpvIb8PX
	zxpVe8K+O50ktAaQAPWx12P+Pa0tGvvBx6BLbXC/UE4S8q00RYGBNQ165MeVKbdVn3Qhx2cD0ZO
	jpJLZ0cJGu+p21bE7dvM9E7Yog5iPCgFwwq5rmy2/Zr4n2OCGiaw9Dts98YpEyS+OW4q+YLX6LG
	2i3UUDzPuZ9uJ9XRYju3rBcTZM2jnBYti60zcfoK1T/Nl12t2KTPQJMFttKsjsHIJJMTenUTyb1
	d+uWq0OgPO7Ob8Tqf4W6Yp124ORisT2CQ85Cqlw5f
X-Received: by 2002:a05:620a:268a:b0:92e:755:d962 with SMTP id af79cd13be357-92ebb5d4187mr48765685a.38.1783341930425;
        Mon, 06 Jul 2026 05:45:30 -0700 (PDT)
X-Received: by 2002:a05:620a:268a:b0:92e:755:d962 with SMTP id af79cd13be357-92ebb5d4187mr48755485a.38.1783341929743;
        Mon, 06 Jul 2026 05:45:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:25 +0200
Subject: [PATCH v3 13/20] slimbus: qcom-ngd-ctrl: use
 platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-13-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1030;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=myAnAqwQCy13zr91xzLXDTsphXD+fJJQlPI5uzrj/NA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M5z0Ug8HOo/mkHEdX5hdHAVCCSCQf4Zf3oX
 n3oOYxuHpOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujOQAKCRAFnS7L/zaE
 w3iPEACZdFohB8aZuD4IW+KDeK1lug9YxM4fLxuZ9O6Yfb33xfInCQVl2ApM5yjOlYR1aCd0+Qa
 AbVaSInI3iaPi+SncEH9JMf7ZTeRmER/WgArjBmflL+CIM7gxLSQU6xLWGauYhQcgoT1sTgEB9Y
 dpaBCfKeYebINsFU5fXn3qZlFgPcwdZmhf/B5Xaqrzgev8Nia3f6SMW97i5ZEbJ1h28CZk9ZgJP
 9RrwhDRTVnaeug7Ijoymji1apZrmeLx7lOhjnkCGfWU1TaiNKmD9k02kNyDV87OE3sfgIldLUYg
 q3QORtezKqe3rjZ4tcZuK3SWxhXWnH+8XsmALd9gO/Z1sKlu2aNRuw+1VB6RyeiYwpzdpW/DBLA
 49Bb3wFrM1kV8E0mDSJwkFGZxFntMCoOMzdNpwfy1pgqN0F1w9EeBAITB0EpppPvfmP1oXDxj9Y
 rc1Fjv7Ynb3T9JjeP27MuOV/9qSxIf+yRFC10bWS5y9uwjhG65wQxbKen0HeyfOX0EWaFySASEl
 dU2UpVJHwYe1sFJzHyEsuYDOzfI2jkOt1+X6qHmvI0pROFoHdTZqwqdKNc5nrfE5rqfAKcyBojj
 cXlCgI+BzXTtkebexgsr97tfEB9ov7RHoUHR+zYPli7W0sLhdqgM3IOYnY+jcAaRHOC6xkOGXTj
 WJkCB4LVwH2aUgg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: fBabE-vv7IULSUloV8SogSQSS0_turIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXxsLnD9djpbtg
 63pshu4KLZEtSd3+vPGyq8gkEJN4EQlnGKBwMK9tvsNTgrnfPB0n/M+erphgeAZ5jFPupYyuGpm
 ynyvf7ETEcUSMFcnxCjoOhoQ230IfSpniWsjWh3zbEJYt/KiPJdqY10d87ImjOJ1OtMmKOUb2jT
 EV8vVemBHT7JssnQJJ2Xv5S4YKJ4p0hph+tJcmJWU5Q9PnLp+Pb4y0sgxnbG29eRFcPUokq7oBb
 K1TnzMmLO78MD7lKDbJEYKhtPHT/+Kq9r4BokJFZ+KYKP5KT3F8MhlrzacIJ30uUybcb49A+59h
 fDO3mP547p/iaOxmNbvTFWmaLnDqkbcR5e1Szx6NO1/fIR9otfdTAXML1hs182jv6oNpn9UssMg
 qR4ICn090yF218BoTVzDB6RQXGE0ujuNbhtVftnzgdViVnji8LAcUNsAtOSx2oBbszBThXqekVt
 nyzQZLbAjnzseXTN21A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX8+WWVsZhew8A
 2kwE5odbFSvcGk3vFI7baxmHOTYmgUC73k/XCki/LODrtUtWPo16lV3Yb+HA4GxhDp5RYO/UcLy
 CN2nVsQ3fxVOtpuR3kABPRfKQvli0nQ=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ba36f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=NrPIdse2iluhyRvnZrkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fBabE-vv7IULSUloV8SogSQSS0_turIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Konrad Dybcio <konradybcio@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 3071e46d03beaaae2321e858c564b512c22e820e..6e89415712ce1a7a7781af6bd0eaf0d6879da52b 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1539,7 +1539,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		ngd->pdev->dev.of_node = of_node_get(node);
+		platform_device_set_of_node(ngd->pdev, node);
 		ctrl->ngd = ngd;
 
 		ret = platform_device_add(ngd->pdev);

-- 
2.47.3

