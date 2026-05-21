Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8D3A59A3
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352684; cv=none; b=TvcIqquOL5xgffMIeWEjLVHr705r/CdkSwIzd9R5MC4ZfuXgEEZ/UCjGPii8Z5PHTRX/tyPhYLLFJuXxeI03oKqP7CU1187DgmC+MIaI5SougT6ZHXIWt3ElrZtnEcIfGdkwWABbqqAk5u574ZYyiOwHr4IIznfmVVvhP9y810o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352684; c=relaxed/simple;
	bh=rhXX0+hyT0zDUTxSmyLBrqK6ajNjs9sZyKq4hbamtnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LfR8c75kYsAxi7OVC0fCMKex++FZcoHhvn0icMkj87iGGflDo1bpWuWaK+0fl3VETVd6DTZfjS6AwXFrjwZjw69ajtM9Zf//UJqkSPFedN1yjoHn6y9ErL3l2VicMNig1gRj2Vri6KoIy9cYPHQAIDNsSrcc8czjlMW2GAHI8QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIhnv42c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q1d15bDb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIhnv42c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q1d15bDb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6mIQP1798612
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mItV7Us/JDJyeyXy2sVeXYfFBIriRxRMQ4skromGLeg=; b=pIhnv42cOOFiln8f
	kFw5jgHplGSpeAAJ0Cytn19IGKTikvaWlORb9ffXZ6Vu6Y9WimKHPGfsQlVUvOm3
	r4bvDYEaQ7O74cObcz7CYi4FCYaj1OrTAX3I102sgO8EkTnptUE1trvlPgXB2Wal
	H2i/4ZxWOWoAg17n8cO+twTraCfWmhHQh+oBtnyRiWhM3IdmAkuoLJ0vRZIZr69W
	Lf4XjW/ergPahswxd07+8tfRyYNu3cb0lD2jGfnZBtXLLaNAoj9GIOgXJ4pPo6cs
	8MtRrVZRkF5qCWDZ/y5hUWaZx07ef9B6dQUzvEQcK3vS1xjBbTEf+07U1Yhl6f48
	qpxkOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu4232-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f13da9684so75594191cf.3
        for <imx@lists.linux.dev>; Thu, 21 May 2026 01:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352673; x=1779957473; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mItV7Us/JDJyeyXy2sVeXYfFBIriRxRMQ4skromGLeg=;
        b=Q1d15bDbzhX71t+NuC/6wrihkCPgDUAg+MDeOCUAgvvm6avZlgbgZXZNo9/AvXi7Ox
         bhIbPNBJiJqOoxtBhPE4Vaz9uU4YkylV6zQUPMv4jSbzxNN0MijZ0thZZiUykswGTBhw
         WTVpzT1Ix4DhWBBElyqFJRj/FToywyu01ZYMvergCdhxRID9VIzzqVq6agHQVwKtIR5C
         cgqSYePFzqyvra36g8Ndv9W0bHtnzf8jSNySaUv9jY3L7nDFku7Lv+VndNMfM2b+Yaw0
         udtyUfcAjg5EsipeXUmuo6Y3hqCTWbKSpMDFX47wfCdNosvnc46ZebBgSgwMDBmjn6eF
         3zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352673; x=1779957473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mItV7Us/JDJyeyXy2sVeXYfFBIriRxRMQ4skromGLeg=;
        b=KCsO7r3DwPQ8eVR1ULu/wFwgafC5DvnSgiudZzAGTzE+KHGnR32wlY6ZPYYzj+oqEV
         nbQOgUzHvxIa+lNc6CZ8KtsZD1eoVgSamjOBY6opOmprYE5jbdCntCPxh9AtK5MW5gqZ
         eImO2xgWne55QK2m7YiVeDJSGJiYcbL0JZTV9QU5d0gdMH6Ct+fnPMoegscJ6WqEcawC
         DgYqLbdCKAsvN9Xy+dxoLENgRFWQtGmSktNVcLfFmUx03S08Os7LjPM5nPjHab84VtB4
         iIazVxC9nDR7nVJrKYzzPQK2f/RFuvrAxISX67mldTBKOhB/stMWTWHSCK6k42Qn+yT/
         8Gqw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZrA+EdxiLwFBO7SlsBNk4hGVzRjWL5ZvEfeYNbM2E5fXBUVdGft5e/ZVMh1/AqPGFnbw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/AszK/LeE1bAD/FVxrcu14OAjLIVTwbYhjYzQu9IwT1Y5W6hg
	v2LqOaXe/LoOiFBGaoaLb2d0jkQnC1oVKUwFM18QpYEELeV2U5TkNOGEyzSKYKD65cyQ08wikpF
	R7jYrFL0Q1TQjFbLZZPOkZY0za+tqx2rYlG9kYB6E7OKg4/M7KE1J1s4=
X-Gm-Gg: Acq92OHPNmfYldIB/TIMuHdzxQRcQdep5CEu2v6jgIZwQ2ChHukr00IgfJD7hho7E6U
	Xg0XqyS/0mcT8z03+kHbKTguz1VFTS4U64v9iAqw1Q7Y8YZtBVd4GtVhYeYesrCr8aPNqV/W03k
	CPjWSBgKbPagByTBmf0r7meJS3fPhbHNl/PRzVbyNL+3sLxIHnisrY4xZgtivsPLO/54ZSojsao
	5Vac7jKTbT76t3zF8yVGRgoHgOBdxWRHjGJM/XRH5SjmnfWJo/c2QN32owL2s3JW2ORMB2CAc+5
	f7CRaeThw71euyH4mNGqV8IXlqSd3KBnbCZNpMEmFxO3wf6IQwuaErXAdQ4S9jteOBg7gKgEfrC
	uVKpA95hC3nt72Oer292VoS0bLtZIdEXXxEW4m6PWrlIVd7RNbN4=
X-Received: by 2002:a05:622a:4cc5:b0:512:e813:7ceb with SMTP id d75a77b69052e-516c55d2560mr24462491cf.46.1779352672423;
        Thu, 21 May 2026 01:37:52 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc5:b0:512:e813:7ceb with SMTP id d75a77b69052e-516c55d2560mr24461621cf.46.1779352671784;
        Thu, 21 May 2026 01:37:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:38 +0200
Subject: [PATCH 15/23] mfd: tps6586: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-15-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=921;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rhXX0+hyT0zDUTxSmyLBrqK6ajNjs9sZyKq4hbamtnE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQqDmHIVs4kdm5DllgC1wieRn0dTfi40w5+0
 YZj3nANwgiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKgAKCRAFnS7L/zaE
 w81CEACP1pUKe1vdi5szoShgJ7SlWvqPeODf0sDK2lq5ecuRIcOXCXNzZANxrv7nwAPSjjaTXDf
 Ww3svzj8ZcTYKA6TPCVub0Oa5ol6XfGL66UF49JUULJIk5xWhEuKXb/yZNVWElkqXaxDfQYcDxu
 SB3Eox4L5eO7dUyanLTruaUo6Yi5irnV8OexBKV7aFuTkSxuwwYuM/tOHsLq3X/GIomwiJfS6TO
 tEfOkkat1q020En6KN1pwOWL1Q1bpgj+0gYD8ycJOmEeuM8h8xLAq6M14A/c9jqQwNlGUuGn3WT
 8JoCR4r/5354fbl6mLc3BZV3VRO+FQMyQ//h2nMuWisORPsmjDieTsEMSHiB4ewpHGCP/Eo9xK3
 wvD/6hoCy+868y0ZzjuNXghfJvpA2XGMVCZ/NOM5+IqDHYySNcAN3WH24riQ+zmTlh4GEFACNYF
 Usy9BXy2VVrpSbYL8ZrFf6HYadDdgUT+Z6+3AnKzX+hs37Gx48+YYdSJgdIifqc8JU2QKqeUHk6
 cWN8RMlX1URpAS9729ac6Xia16DdH/M5dwauw1mEDiDsx6TadFqnvQqbHwklcUEuewuVBqmstNv
 dHs16McDSCRVSViWlOG4sDYHx8HJ7rXWN6iSalNq6n+mFMdL2s3xB8SS9TRiBXxSAoTA+op5dA4
 PTIIcqPqF9OzQfg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXxDCBv/XDp9fj
 aQrdRjfMt8wsSy4pUhu2FSNkaeJcEnPeNFAsR7sSCkR/yajfWpOXRflPVkj69njzAar009Y8mj0
 qmqjrBWerpHeP68LkDNM/i75b9xsxSgGxq9hbedHukSz4tjokzFeHl4X49W2frJele466FPr1NO
 ZgOnPjpImzH9bvPm3rGiLl3iTiXIgttDdXot+/PD7ZAWVvetImMXlc6keBXf9zXTzdKgwG6wJHM
 3Tqp1OykliA4/nzRRKMfzjriecEDkD419oO8dU4hqyU8eW15LZl7ziS5Ztv5b4OlWXZSYO6/SrM
 YcOi25/PRr7iTGtefQep8iYMN2PKBi657Zt6lz/GcsVjZOVTI/vAbkJwc4ejoEp+Pssr0NEnbdw
 c4vFnl9BrDjLDbmfKS3ijhX7qPn/IpbYEGqG+TvAIoegRGFpRgpmFWUYtrNcMYeJk6LbTPQJr4H
 0NdNPW1sSqrmI386C2Q==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec461 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ESSmVKC5p6WdXJfq0SwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: DbHkogjFPt6G0DwwKvy7Zp1V8_G7oQrv
X-Proofpoint-ORIG-GUID: DbHkogjFPt6G0DwwKvy7Zp1V8_G7oQrv
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
 drivers/mfd/tps6586x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index f5f805446603315ba76ce1fc501c908f1cec0d16..3cfd2f02b62f3cc370e0d970ec2643b638fd0fec 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -397,7 +397,7 @@ static int tps6586x_add_subdevs(struct tps6586x *tps6586x,
 
 		pdev->dev.parent = tps6586x->dev;
 		pdev->dev.platform_data = subdev->platform_data;
-		pdev->dev.of_node = of_node_get(subdev->of_node);
+		platform_device_set_of_node(pdev, subdev->of_node);
 
 		ret = platform_device_add(pdev);
 		if (ret) {

-- 
2.47.3

