Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3809D3D75B4
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352704; cv=none; b=JuxdWqsC5m2k6EyrzCpws4CPEQQIGfhp4w8gnZKzDiHQGhl08Gu9RGfHoso5kBCgnFA4emptMNmoyKBMOYHi7R3ZNGyo0d2FuoLsQsYXdnl1eYo5TOcfXION0Ye5oGTAKtYdYUQr4FdHTn9hvnc8gncNYvRQ8jkvnr47sCpIEh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352704; c=relaxed/simple;
	bh=cf9shCmrClBGUTh7dllsxEAWSRdwClRtpyvDEjdTEWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5yCHOzG0BRAe41p7d+leCXMDplx4cdOkToBdT8QG8h+rnlBunHMc5Pfa6//AZUkSEfG5+iqQ+K8NRWjhkCs/kA6+rl4E+NYQ8fzM1aQ8nSAyRnyDSADzeXDZtLVZa1evmzwCOxo8AZreP31yfBwJLsu2jScx0gfCW/T7yygxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUO/2oAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+zEeEXi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUO/2oAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+zEeEXi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L8LQxW2071403
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7ED+C1Cny/90pO6gVbhNn3JfkifwjCs1jXkp7NDh1U=; b=IUO/2oAZBKLaByPc
	Pib/Wdi6Re7jbjDhT2DcJGfxksVhV1lG/C8PBaWeZSqZZuDFAF8uVjdTmBMcoTdo
	aqHFel1CfsAodTf2kMAAegJ+s3iSD7fS2wY48DFhw918ikDLyTnprifVwc6h+TOY
	LV4AYAPkRoMvyPJ7+0Dn3Md0beSEQl/oy1aXPhHSTq4Pv3FHP58MZXIF4b4ppphV
	JvVKXyv9r1BvTUDJgWCRPAelxHbwhdccQRUeOx57wI6xAr2WSOLp4CvmDtuwx6cr
	ln+iKZZo6t5N+ji5qB4TtPDZn0FSXPonYCJ7oBgqJKgmsLo0bVRPqsdSLnXcf8iq
	WhOJZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r961gav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:38:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso162950801cf.1
        for <imx@lists.linux.dev>; Thu, 21 May 2026 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352692; x=1779957492; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7ED+C1Cny/90pO6gVbhNn3JfkifwjCs1jXkp7NDh1U=;
        b=e+zEeEXiR3JpnocoZE2gBOEleLKza1+Xyd76KbaLZOpHkHo9PXFG5vrlfNmoYIZNY3
         AYYxVeM4NBYcqjSPcG2D1y47hdL28C0lJO5MWrGEotk0tNgQqjLAEJAIMpASGUK117tw
         bIrFaI0A177nJr2Jm0IXtoi257GtuoLcIsuiabf5A1uOWHl3Vdlw3aoFIW+qMOCVyob4
         TsZTXPA9xY0fZbYwVXzuxhqR+/sVewDBDZW3HjKF1CyBLHZjY1utVsmeID57T96aK8X0
         puhPL1tFY9TybDI/YGWsExGdTeSkK8IpFXZS13RPrSPseZcNFLVxHF0CGHeWZGayn9aK
         WLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352692; x=1779957492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M7ED+C1Cny/90pO6gVbhNn3JfkifwjCs1jXkp7NDh1U=;
        b=OGPrtiuLrGEP0FBTBDth+I1qFqSPnnjs6reo78jfehEGi6By0Bb4Ficcwl3rKkq2Dj
         m96G1ApXwZpUPuw3Tl2xP9NUm/WkNwF7McssxfDh/jxbX3vFJYssYeJOBzQqwpU7CNf0
         YyRpfvs7Rip5UwUueyaSmjWVGIy9sSm8LlS3YKKjY2Ip7nJYdeEahpqxBSTiClwusq8f
         ZgVxDcThBC+bGgILhs8fP61V/lPqRX/7xtNaq+yPdG2mwX4XrMFMnggh9ahzyhGvyRpR
         iwqigW4FgAfoSEfWuxdkGb/fFoxmiJhm2SL3Juhg6Qinq1Kj3bvDsZDhwdnNXwDu6ANd
         kc0A==
X-Forwarded-Encrypted: i=1; AFNElJ/jkmxejJuIaJsjaRg6/k0v8Zj8OdZ0ncsglIsWdGgq41Bc3Eiq7zQMi72uIgyf6EBjBuw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMjswODDD0pMb10YgqzAPGC3UD5RSN0MZxHGoKWT+8f5xLXtaX
	QKNgUBZJ7sRGBY7DU8ZO4OMND5oc0kE7VST1QszVSVEJPjevAG81A6IJxEmgpRY6aUl4iILw6MW
	PctSVyRnvanIygvE6CPyXYsVb9jqyF+35AcHEhdIfgFBa6B3cuLy+XvI=
X-Gm-Gg: Acq92OGt1KbGzpYlnXq6Qiy9ZzZd8qKyfu9qNI+OFj47K5z2HE6b5qs4aZtYhVmjZeb
	ZHIMxQ79WHa2sDiuPOKCQpVLlhRA0Drxs8g2zvw9Jdw8Z/ESnvIaJEZpr+yseOx7fE0iezsTE+v
	iejfHOcl1h1lL022FUwLsyJZs5FYNKcHfoDLnzLbNDyIQaB0cy/1gD8PqJxeq77NVhNXqHc7Gop
	xp+HOIYu9yzNRcqEJ9CxCNpmRczQv6voHHHCvEUW2HB9CyDBpdflLtLyfvqhDztWy5vtStzsu+K
	KRpFYtLdV81O+SEdf/coc5Kf707p9n25+Au/FeacZ/HURcta8hzDTYj0q8TaDtvtAgNvfLwt+BY
	2svNcE1Zy6nyQn8wTAjNlacrlT8etgT6L7hbEknOEfcAoLDH4emA=
X-Received: by 2002:a05:622a:5e0f:b0:509:35d1:ca3c with SMTP id d75a77b69052e-516c5473bb5mr23806431cf.5.1779352692525;
        Thu, 21 May 2026 01:38:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5e0f:b0:509:35d1:ca3c with SMTP id d75a77b69052e-516c5473bb5mr23805721cf.5.1779352691987;
        Thu, 21 May 2026 01:38:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:38:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:45 +0200
Subject: [PATCH 22/23] reset: rzg2l: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-22-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cf9shCmrClBGUTh7dllsxEAWSRdwClRtpyvDEjdTEWU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQul5EJOx0VeXQl+rdgf1QZA4hwOrkTVMgH6
 yr7/2L10RyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7ELgAKCRAFnS7L/zaE
 w1fqD/9lXR/uJB0CDw8VfjayM1LHzrTL1T8ynf3Gvgcw2Wtn9tGB8ig72R3fTjK6WO33qSEx/Ys
 +DCcJwVRX5FpmyL+09qHtp+CXL2UW4YC16WWYephi3sCxLJYuFoyb0JH/qN0+ptGq2NeUfc5gKD
 c87044Xi5XQfAFUNj+hjqpnGkVuOk+BHO11vfS6Q8Qp9dMc+im+ZIHnNojx+MQuPpl+XYxViSi5
 m7Rj2JVyScch+ae1y1O1HDXqmgEtRjEFQ8a1sD1VvWz2dr99kOYf+zY/IVl/glBQAVwK5z39J6Y
 qgkwghvhKu3mh1nMh9qGm874qbqYvrxoyWXEu8eTHpc/Ee4EkBGbZPg4Re1IF4mxzF091bMDQMo
 /Na9rNRS6DIcjYW25qVbWTQ8cWto2C+ane9qzP+6H2FwuWKGXf7zxfdfDM3TPaXbkiuSREUX0DL
 06JFNxIHD9jqtIQPTE5wqBpn3JpyYNrvD3NT7bAO6xxMF64VHPng/cenB8YeEULz+TKMLm2WP6I
 3qbyN8Y0E19QrIzjS9oym6wbxatwoBWsv5FhinU3N1knXnOpdbjk1GBPGrQJmqiKJ2BbqWBZQbj
 szuqipQoXHQzf2mDXj1TB1k0Y2uddMXfhNG+eK8UlmCeTMGG9uCgSfFKfoJlsE4UUsheZ3FN/M4
 W3hz6QKvE8P0Q9g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: TB8SkGGImacEGMwHGxovXTA7u8WK6nHN
X-Proofpoint-GUID: TB8SkGGImacEGMwHGxovXTA7u8WK6nHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX2aO8/+eh75P0
 QUqnPc7jYJV5ia1eMV+i7qyJy+ZoIxQur7YdsO7ZKapmWxPHRMP4DtH9VIzZ0WJOox4pUZibRO0
 n35031UKvRhCtxSQPbTCTD6g712ShQrJ8athmZ9EsqHCaqiMff0VPWxKeg3+bAdoEUHqEYJ+oli
 AwxmIjCM5mP2oxo8hgs97Xfj/Ox/AQxsSMUfHNSiJhJMOwfoz1H60dBqAoP1X3FdYnZOloSQ7Yr
 njbJi9bXQOn678luvyPmXAfGy1HKscxrpvg1yt4Sx0GIQuOhusgI3qqe9nIlqI7ZHTZr9KU89rz
 xX66zwPVSRjhNaw7VfVo8XuoOlLMNLi7JRXac+dP3HQ/bj1MQlXRaxPV8gmi/w4VgWSy9GbJjos
 wByQxtn/T/oiJ5pXAb8FSidVEwJjnYnKY+Qdgqr5UUTJrGovAJz/Wh5etRtY9ldh1/QwLNr26fP
 sJf0oB4uO3HhLaurA6Q==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0ec474 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index fd75d9601a3bfde7b7e3f6db287ec8c5c45a20ab..f003b360629c90bb37ed0ade7a675b5b0f28fa7e 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -249,7 +249,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	vdev->dev.parent = dev;
 	priv->vdev = vdev;
 
-	device_set_of_node_from_dev(&vdev->dev, dev);
+	platform_device_set_of_node_from_dev(vdev, dev);
 	error = platform_device_add(vdev);
 	if (error)
 		goto err_device_put;

-- 
2.47.3

