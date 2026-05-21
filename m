Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC43B1EE4
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352675; cv=none; b=FImtS+ydmC/OroEKUnfnMKoyj2wQdgkyvnOLcvrvERNEoNj4ib+VncBs7tglXVCfls7IfQmHu+Ake8DB9fczm1GDEpOzzMvXRHe2j5Ao/5e1GIGs2xcdWppCQ59JnfuXiMUegNLpbI+3g4+ZkLW1xh0/zxlx5PT2isX3MZldLE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352675; c=relaxed/simple;
	bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pE+TM7awIshVz5sTTRgtTRnBbU7dOqIspnQiS2/ERxlrSS3NUONwYhU81J1H92T4CePSvp0RiqsYzcwNcTw0sx3Afsf9D+YTcFA6fmHfxM9/WqcIyv07smFRRWLg3unIno/ODc02NnhPyL69SiV9ubTs76RyztyEcjFkoLsOINc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRPupizu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wf9H5+Fv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRPupizu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wf9H5+Fv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L75KWa1798416
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=; b=oRPupizuUBUdYvM6
	C+TBRXWoDqeq04lMT5LC5gnHBmWkZFvkLch+YDhkUB+DEO4i2vSSrV1JDPGbqNxV
	t1PSwfXiomrcuy9ojdXSTxgyhkCwD2bRRvyT47pfH8NaYPZpchnAojnsmnyAb/+W
	A9AVuQTJ05rRYqB0I9TvxUhiIofA/ww3vBzm4nbKp/IcA2Do4b2fabK4nhXKfVMs
	d8YzfWA7c0utoGv21YBxZDEeqwtPVng42EXkDBjGOAQUrZBVJuMbbE24vFeuSdua
	kgqySIUA52PR235UhK2Ioc/mPp+u1RK/AYUpwZ3Do0aHFh3nUBh34KaaDeHFCVr4
	9JaSgA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu420a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ff0bef198so164811781cf.2
        for <imx@lists.linux.dev>; Thu, 21 May 2026 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352658; x=1779957458; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=Wf9H5+FvxBbF7xNnyFXE1bWjKaxkzs73nW2+TCyA/Z2AJC3qvID83oR/YxjhhdfdJV
         olW8TgKNXk/R4Y+SXT9GuxoWWakCiKs/8oBpHCRwKHdTFLdWMubuyT11XZIemJSkIv6X
         +1JAZuX/SxhqJwMYjdczjlBi+bTibJAe01mnwdf8S1oFW14u+pBrZ6bW/mjzZSLchXIl
         LpN40bb2HmtW04DwHLx//lJ2X2/WbNOf9NGz5ZOeSiFh94jqD8oXhpmPHUnH538ewx40
         M2LnibBvdL9AOqSeW+hrNLBrEPUtD9f1GFN8WQp2K0flgaXPYry0Ek1+fXtjW0oBKJmh
         xooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352658; x=1779957458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=RnFf9S97XE3/15SxB9S6fANIEb1yNt4zgAuziWXhfpVnPUA3xeL2Trt1hRPUoomiMI
         Mryz+HavDuri9pWK3YlaKOsWQGxHnnZMDIoYPYokIjx0uc9w+wVV5Mg7ljbkQfLgHVy8
         9dRQJ+gieMXf1ipjWCelpcYnT/4AzB4/PCZKodwZjfvoqKeoI5yCKC0yj0rJ+L4BmNTg
         R/w8pnMLJNZLHUdv6UzGRpERIHrrVDduDrUa8O1RpEFlWFUlsHRRLTHrLevelHs/PT4d
         iwK3JZXHYaoooGyhU0xwfMHB3xDkevFlt4ZTto8vJ7nxkISdzB1Kwcw+QoNtFdEaZ1L9
         NDWw==
X-Forwarded-Encrypted: i=1; AFNElJ/1ci0hQgdjCj1kAcSUi/iUHV+oePNQYUbdR1W4uY5cpUgaA1Qx1y4ZGrAWiySBvgEQSTo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDurvM/D88l5NOWk/oNHKO2GcxbsoeEQu0/BE1m+bO36lw9/RX
	XtfWvLkTnx6e/M9wn94kW7oHobgrER+AmyJ+sYSk/KHLWJHMCriQPpnuhbKd6L8NNAE1w7X27Iz
	+EFH3o8rZTG//88s+qOXoogFpx9jFQw2kFqN4yMfP6Vgs0bkOxm5B3io=
X-Gm-Gg: Acq92OFvHC3mHu/N9xYClAyrRTp4LCnZzs5vw2/e6lLKsKxQm7JW0GxBZIep5343OBA
	mjAulxN/KVtUdax4+fCPLwfB2de2KkOLKcpo0O5qFaSjaprmNi/4KxJOBn52fTTRjkv5N2mBSp1
	CxuAsP0q4QhmkzI4VU5cJgtxrwZ4hs4CtiECgD8gjttBOuYEX/bnrMKqNAbAuyu/v7ULaWvGZs3
	ukluJ24xGdBKMl3XHeuVXVraUJFfKBsy6fpbpwKQ6meEXYZtJMFGMGkwy+1D5jfLNaBeAnj+ID6
	X/+E/c3/9tqIu2Q4gVjGXtFbHHc8wK77rPTYWwMlgEmoirYBdU+vCw+sxQVuISLuPTVjgLUGQok
	1een3LpKzxiApNsnmC5bD2QtUKOIdtulBukblETnUWs4F69sF5hE=
X-Received: by 2002:a05:622a:8d17:b0:516:ccbd:b65d with SMTP id d75a77b69052e-516ccbdbce7mr3052261cf.11.1779352657798;
        Thu, 21 May 2026 01:37:37 -0700 (PDT)
X-Received: by 2002:a05:622a:8d17:b0:516:ccbd:b65d with SMTP id d75a77b69052e-516ccbdbce7mr3051531cf.11.1779352657364;
        Thu, 21 May 2026 01:37:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:33 +0200
Subject: [PATCH 10/23] powerpc/powermac: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-10-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQnEHwHhZxOm6og5sHfREaEn3pVgemHlMmE2
 Ln462RL3PWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EJwAKCRAFnS7L/zaE
 w4YED/4iHLiHraTFNT8eTjPSn8I3ryTe/Zd4SzuN5PRYsUIg9SHspeWL8niwLubp8yoGgz1/xIH
 mgqX+8k3YyBoruzZHfbfsU97pVxIqztUPt/J3U/ND/wGvVjm02llmMqEulqZ1EgJ6G+LANtbEYj
 rMysNF197bf7mmSPH2FODOw4W9Gsl4Yq3+ICTVsgy7RDyTu4l1hebLzYJhxDn4dgUR2z1NK9W4l
 qzPmq4YDWFZhPumNaH3HaXzTt9NFXDJPIvCe5d7YHkngQELPf6MIO4nn+c5XXG+DqsX+8iTJLP+
 dtYp3uSsjNalAli1B+mULXlt6uzCo8M59zrPN01SPKz8oFPkGUdu0+gTOlYw0tlfJKNfwExn7Ku
 XjHd1mfDAehACci7mB3Pi644ZwR6730q24pIE/1mY05HKUHjU1nOghP/dDxGjeFKkmE842FNzv2
 CZTZqE3yiWV3bEh7BKyGcskYnVOGJv0JhDMdj1CiXCtSPerZVQuw/tvG90ahwqlUQ6U3u8WR9zM
 0uJaaumx3vqqkKd8NOyBRhGEoPlNbxoAJyiegjzu17lKqTb+jCLA5EO98/dJq3EfI8lgxWpL9Bv
 MeOYehAQ7eitsh9mBaZwqpKU97dJTWkzP4HCc4KLZm1PFyGSdHodKBldbDujP9SsX5EnRFjTN4l
 fU+hp0jLFamhxfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXwf9UtDLb5WPi
 WxhifmxkNtNnhiiGPaoLxJyZ4GJF9cR0PoZ2utUWsGtyEUxWQz6xaKFSNPI3LsWA1OmpD99hd3l
 xF2PTBJAJy3F9J4VZqDSpl3pigeT4BJUcnoW1TjAu3kNMhJow/C/mRaW3+R7BR1orsPzqMLi1L3
 lVQYMAKtSf8ZHK+6/5DcTYo+vs0+uyefrVmwZGADygEPjIDO6F11M3WBy6q9mQD0ImA7aqW10pm
 gl2OT87QPq6dMMzL+Jrk+4fZUhlnJ35ofJ4307ygIdelSX4kDsiqUvqhTbgHLrbf+nzbUdpw5GQ
 jWMpgwhsfiXIipC/NLq/J82osH9QbWKl54SUeEokjHcw86hYu9AB1ISJXYDyIE0b4r7hBgLR+1U
 ICczYffl2dbe9p3dVp00tpg55fapF19I5HPC7dfJYAwNvchv8VvUAV/PlOmUlU0eiPeypEOxOKw
 QkzTYxMDm/q3ecPkitQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec452 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: pKm9sPLJ3pZXoR5drM3TL_ATP0COysja
X-Proofpoint-ORIG-GUID: pKm9sPLJ3pZXoR5drM3TL_ATP0COysja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index 973f58771d9636605ed5d3e91b45008543b584d3..a175a32a222bab4cc7400f6ab6071f5630db2cb8 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1471,7 +1471,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 		if (bus->platform_dev == NULL)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
-		bus->platform_dev->dev.of_node = of_node_get(bus->busnode);
+		platform_device_set_of_node(bus->platform_dev, bus->busnode);
 		platform_device_add(bus->platform_dev);
 	}
 

-- 
2.47.3

