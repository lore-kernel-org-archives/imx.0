Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9273C76B8
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352687; cv=none; b=jiLJNS+Gqn8B/nL80sEhCBnY23MiGyCIXXZo0Y2rd5bOZKA1MewndDFLKhy2U7iqIuEA9b6fp1z5QCMoZLEjaai8bYkBQK1krZBU3wNncwYm2cGLVFDhY6l6K3dQ/LgGUp4lh/HByPmWbbfw+O6MkgkrLN36rWPU2HHasoOMHa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352687; c=relaxed/simple;
	bh=+Q36/R3+axSk26qNg0RKgcggtmrfBcF0QjetixEKu48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkeQqmgd3LJqsdA0LnpPZCJSRytYf/9oyfDJNpaQa4oda9tTa9dVWPPGxzhO0pFFrpmCvDeT+k0kLJ0+hGF6eFyVGFUf9tFrvf3tVQQo0hc978s/tcKzsZmxCG7tt0zT0TfIZj/8E+d4T7t0rCW7DgIQHyJMK8tJ15nsXUtvEHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWGFOeBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3go9px+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWGFOeBT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3go9px+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L8KNqB748568
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=; b=SWGFOeBToZLVCsfU
	AclGf01G3MMPajCTFPa2NbUKgtwHkcfo05wNMqK4mTngoJ19FiVJSJIsdmlsLRnF
	UTS5hflujNJKf+GLZUpXTmOIOODszeTUyzkDYH5lRyVCjrv8biyMBvDqKnyA6cUR
	B1MwZVtqtJ6ZQ5C8cKyWqtOFfriRbCIjY8sk/YdMjRplzi0eIV02XDAf9o+Mk7wt
	ypK1ptckarndPVVFRuQSzrpXfrh5JQ33mIO7EOBPTfQ409d6ZU+TxnRun3zbhUrI
	SbkBDVuhVva/nx4/w3KeLBtmaXLN1johEvs4uv4afYTH0Umf4ApQvWJmlzn0q0gL
	Clt9eQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6kjcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50edf01172bso30727401cf.2
        for <imx@lists.linux.dev>; Thu, 21 May 2026 01:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352678; x=1779957478; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=;
        b=a3go9px++TlBBCiDBFHYYKChulgPwTlzQGEpyC0MI2nzpPMwoYmfIhijbyStnh5ZJz
         +ubR018LGUHY52HXjvEA5jbeT/ll9H4eNIZW0C1HAzvO9ssgU7BTuz390CcvUDA7dgbM
         ZMxaStey5e0POXd4zbFI6mlLmpLKOZA0ANXp9RjcC7WzY8f0qoi6N8fdjRZgp6Ut5iTl
         6AeOYP2a8Q9itwee7M7oPuzrbC62UA93x3I28e5xHbSaCe5dZDo4CdPiz/xmTBaYLvHl
         rsUQh7Vgm8twblllVMT/wpymPFWMu6xHm59+B5FKAgrg7H9b/9ycL4dtLvCQOMvyhm9Y
         D8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352678; x=1779957478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=;
        b=UA6VuQ49AljMC6DZACpKDxt2QdcQf+sS2HeUTExYSJbyuFUN9j/gqYK/MNdN1j0K0w
         1EOq6dOdy2msETgjh492lYZD6IoBy7+d1L88Qt5lOjJsWMXMl0DadueynDwL7B5P5o8u
         4oODl/2a+woYOXmZ4Y85g487HZbr1SFVJXUQ+PEYtaWGdoJuD3NDUCGsnCekj6+2PchN
         sJq3D8chMtYtGDCJAcglW/xuFpcAsAJhoSMdW6wLY2DvJFUrII85xGmxCxZIVAFQLGHZ
         SnFqDMuXfqiffhKGoXL4dxAZZPyc1XIl5oPAs6liIFWJsjtQXunqCxJQ+AIWrEEE5xy8
         C29g==
X-Forwarded-Encrypted: i=1; AFNElJ+c3lMNAUSyoZYvYJIcDQ09Q8oSvCuGacLUknaFR3AlaxdRPnPfIsvIY+H3ULlqoW84Gyg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRhd3FCzyjL7CBNCzUFdnLo45UTV5Xd7Odrmszp9ZeFTtKZ0cu
	0B/D+f9dkfUepVRqlURxzRQNPDv/sdMOkrVBgBu4rkIGpbt0CNrOH6DNa6QzCZhKcvVkGNWt5B2
	ItJb6GZEbUCVBaNBZdEXybbHr+mqo2/wcNaluVOQtj7jd5ubtaWk1gpM=
X-Gm-Gg: Acq92OG3Rnshy8Rh3kyAItZ1E3eFh5pV4fwn7o2sKQiiwdtdpXUt3WukLoAaNLIBTmo
	+7kmiMqFbOjhYheRPbjgylRdhmdX7/16JiG/xZTxVxdYwpLMTaYPkDAIIafEfnO+INijnn5klcH
	vxb/kfNyXlJO6XpZAlK73x8g39v4PP7EwPvkKIe8WD5hWgmeveJXDzQ8obj+GjHqXSqffw3cO5B
	LQzAZi83vnqptdRh+v/5Zwrzs6xKyd+nRSggNIgrQhgFjjgPjWaZUoo8xHpASoyx1cv/c8Ruuum
	kfNprUDyYwEgYAof7gDNP5YvfrFKwGZs82FBL1B9Arprr+FFOPcWDmzZRlJHoYdHnNb4ciB35jQ
	5/vpcH7Pr+0LMh/5VPfRsQfz9r255qGb+2pNWq33eoXJO1ntLLYw=
X-Received: by 2002:a05:622a:95:b0:513:103d:3808 with SMTP id d75a77b69052e-516c545476dmr26297341cf.22.1779352677931;
        Thu, 21 May 2026 01:37:57 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:513:103d:3808 with SMTP id d75a77b69052e-516c545476dmr26296871cf.22.1779352677380;
        Thu, 21 May 2026 01:37:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:40 +0200
Subject: [PATCH 17/23] net: mv643xx: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-17-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Q36/R3+axSk26qNg0RKgcggtmrfBcF0QjetixEKu48=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQr7v0D29hL0tmocOaZkm4AyCQrEw14ql7mO
 8tYfriVLeyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKwAKCRAFnS7L/zaE
 w366D/4v5c+pUzv6avtkL6q+xKqdBL9umLghKhBQ5kt5mjMgzYly3eyiiCgjeCEwSWWdfTYN6t8
 MDk5oxdf4dZTDqe/p0EFtWy4qVPnsfckF5Mgtv2EfrFY/JmTxCrEMhvKl6MDM4OJriNxylX3tbW
 pqSlkS5Mjcx2c79ZfHLJ4QNgy63fKtrYEP8jXkM/bO+zd0VvWHV6OJgGTp1uNfEKKD7Zv6W9jXs
 I7NhKYZRcZud8P5CCUTX8ofTjAVM6BslN8K1m+1TLzAyAQoFdnTaP33aW6oTG8rsJsFtPqJ3QUy
 wl7xZWHSGDbNFObyxHawwwedXKh8ziJ5AlEss80+ejJ7Cuj4qI5W8oSo8Wwb4/vbNVIzFAn+uyH
 zmH7uZ29ujLcnvmBxqZIGFKjQiaMTKwjmXQIqwL9bFwKLahbDsLpo0+FNGfYHYmkqwz6KIUrLh/
 4dRzbuYGCsoGuw0Oql6O23EQLf/YjisobOJzrHLLyRC6qvueCdjZm4rjiIfBL/l3WA9rNztpXgA
 591GvrhcF2BWHdz40g9Fm376D5h1+nFi/hxT753Yk4qZ5tHoInYYJt67skgbVjixR21R4P3G1VO
 BNHf9MuUxDhXR8xWiil5e2yLVNEpIh/547GqRXAJOq2vGoV9XerYZFXgnsgia4YoruDBFHM9Hcc
 iFPMjG1LS8Y1p9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ec466 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=deS-VIKRvcGxR6069T0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: lJ_eYn_m7NLOFzu7A-DC8NF8oQeG-G3C
X-Proofpoint-GUID: lJ_eYn_m7NLOFzu7A-DC8NF8oQeG-G3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXxgPUP0cDmTNf
 oXERliBG/EFcvInytWnpM44W5UvqB5MLTmZDjUm/JFjolPn7b9Aqei5qYgggPsa20mTasWgzUnf
 4oBfsdaNwdKwHeyXRPCvtbFUTNS8tHd9lOtOynB6jj4ZRvj/o/9oNcHwYio80/qmlpl+WhZrskv
 N9l9NQYMCm6+r4Dy95saH1JxmzVhHv1yZ/SyHZmnl1vtljSvij7cAEHIz+b5dkWRkLOPHg8y5/5
 KADlYc+CteKTo3bIwx49BQfdK24u9m4qYYUZdhjO333TmhleG9xzBLVLiYqaUXdskUxwYoVVgRu
 pyUnUnarg7INZBG8uDaErFy2iBg/mfTpNx480bsB0EiZ+jpNlGHH8cm9x+Cy5dEooPNI17+WtC6
 7nB5ef+4ROpaM5gKWDeEyf1ZcIcGUx3e6FG30cOURm/j+2H3HvUHQHdSnH+yo4wfaZamRA6Jr1O
 cFkurEfKQLXeObF2rcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 1881583be5ce2e972fceb14c2b8348280c49ad1d..9caa1e47c174c9d7a161b7f2e2ee12a829b813d4 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 		goto put_err;
 	}
 	ppdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-	ppdev->dev.of_node = of_node_get(pnp);
+	platform_device_set_of_node(ppdev, pnp);
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3

