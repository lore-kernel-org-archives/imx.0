Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D4A408006
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724443; cv=none; b=S736jlN95FRlNRo/YQHhzpafrWDBwU+Tjn2BJkIyZHax3z8YnSyxOEEuF4lADPH+ReLWlBgEgjgi47pppAGqYpHpjKe7zj+EFs8aU98y7BTIQ2pClHpW3bYHuhr57FjFjWE+0I3F1q3l713jpAUnzfyTu6nyh+wEGoHvW6hIU/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724443; c=relaxed/simple;
	bh=uU1Fr9CywAvFxzuC6Bl5zMISX54D90vnS0rD7BYCHEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tF/0oGBw4XoNTbWYAJqDt9jweZM+lsv5iKYTgBCLi2cHzDhZ51FiM7MDeYiACtfxkb6MU3cIWiDpCVPsf6Ah2bYCfVD2mxByhEiOdLrR4zgk1Khl7j69nkdtploxT2HmuvWaZ1c3pm24lpYJ5DHCVyz7WaoBn9kdA6fhVNEy2o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3a63/+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcNRSXtT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3a63/+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcNRSXtT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72aQ82163920
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsri2EPN9pY5QDvkjI4fd8dHK5CB1Dy3Xc4grAMl3dk=; b=O3a63/+IxA+EjaKg
	JhczbaptnwlswGKlVyWvfV79oZ0KgKi0bTGFNJk/kxCyF7mjkMbxf+IRd+r55AZi
	GXomEMUi1DqoikHCTXPAjdrqb5Ame8D8+M1BTcrlnoGZNfrToyafFbjNRPQ2zwaO
	4KfhKoM+KaWUEcpS8ywRhbLGES/ncPAMK0oyJZDgf5lyYxGU7SSiPqxveHceEdKx
	yJ3pc9q4r02Gw8jMiTN2QMkH6NuZHGf+hk/uKmGbuIXR8ABH+pgRX/a19EIS9WLM
	6fVCVyrgt9sr3cUfuSRwMDTtyQbTS2qrFv72TDwNRNFbPtkn46a3Ggi4Go1D0EVz
	NGg4Ow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjghh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:14:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a19f736a1so52411251cf.2
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 02:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724440; x=1783329240; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsri2EPN9pY5QDvkjI4fd8dHK5CB1Dy3Xc4grAMl3dk=;
        b=JcNRSXtTnE6TmErBaBIk3ln7LOpke/lfk01na5vgcz/2mMwtltDiu/YElxbV3NTHzG
         u+SXKoRpBUoND/0EuG4kdg3g+gvvSdww9J4FCB0pKW/eoaDYbWqigbwQihH4kZTqUCW5
         SWoeNbh7hn06p8hs4K8sGH87KjPiAdvOAsW5aGXxi3AMCyZxuDWoo7n6WyUckK1g86xI
         Ze0UUBHvQDgoejS2WZqIChhF/0DXtegVpMQiIG3/2nvdiklSCrUOi1D4q40P88xqOvto
         xkSut8yTPxXsN2Mg+S4VAdnOz/5arH7QyfS+a1FAIENgpq4k0/0R/31WVdEDYDbtVZ03
         2u5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724440; x=1783329240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jsri2EPN9pY5QDvkjI4fd8dHK5CB1Dy3Xc4grAMl3dk=;
        b=paAm4azfzVNpUTIzcYPUJd8bnAxmTvtDHeGRScQyMwXajFtJLa9JQxnOErmko+8fDA
         mxoX0KolXoQ7L7JX7KZOaGRSBf0ANMxaMeO79tKou37+4qUh/oV5jvTbjHYv2tG5GC8v
         MOLUkhITo6d08iqpWLFe7pBGHW0t2DFu7RXvs646UZ2h8sQScKoL9oZbzfWvJlLENR3i
         9CEPtofQmo4tqdcXlO8LXKr2W/d/TH1b1TIK00jjo1ivzuKEfgFlIWeDcRp6saOoFJ5X
         MGBJnX62MhvzlCm0Poc/QmeP1PHonwQOXUhlSRbBR/0/8SQJTzPlk5ERQNI/FmCkAkzo
         M+7w==
X-Forwarded-Encrypted: i=1; AFNElJ+KBMhRDW3DRXr+5Pa90iqCRO2ZCN7O1uVGgXKG796UIXP8HjL72/cM8DvGGoe4hEeg0fQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdLE/iaVaAywV6q4DiEa6iHQEJ/MhCKxVs2ULVDi4q5wpeFNUX
	0Z7T8QrEZpF7DKtCfOOD6acVDpOxhWpNudN3liIv+7FmJ5YaQ/O+pqD+S59PSpHaYbHCtx/cih3
	idDkf5iRCRfAtjIbKRkNvyeHqUVOuG05aYNRYykMeWwDpPsONn2Shf+2Kz4bC1ENfjA==
X-Gm-Gg: AfdE7cmdd30OxB9CQmy9PMWym9Ds95D8UTKcFbM71Khb4OYjeUyz2e8E40HrHcSwO7J
	X0Y+bXLY5VBNCp7bhCHXq0GKmZatLoNFz1fzSuCAoOAP+SNyu2XtAnFtsG6TofQWyffpMdJqJ0r
	MFatV7zRV12+/MhdC2xA36/OyxB6aTR6mjPY6ZoZzCsZrrx31Ltf+QnHnVv0CY7iKm9+9FGKypt
	aW9cUx69fETD5dc0XCHgQjatYkqsTBER3BCstVLv9BGMP/CaLsbhSyZIC9h/30wNxu4mSm8H2Xq
	EPJV81neWrXAIj71H+JtEFbwLsILvcylpsU/dIcy/XV+0q5Ad+uqJNLpYN7gDVpz0UW+MCD7hQL
	gIIb4eyqcJIQyWzG/bu2VUGJd1W6YIad3tsk12RhU
X-Received: by 2002:a05:622a:a50e:b0:51c:868:899d with SMTP id d75a77b69052e-51c08688d46mr5705461cf.15.1782724434247;
        Mon, 29 Jun 2026 02:13:54 -0700 (PDT)
X-Received: by 2002:a05:622a:a50e:b0:51c:868:899d with SMTP id d75a77b69052e-51c08688d46mr5704721cf.15.1782724433603;
        Mon, 29 Jun 2026 02:13:53 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:41 +0200
Subject: [PATCH v2 18/19] reset: rzg2l: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-18-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uU1Fr9CywAvFxzuC6Bl5zMISX54D90vnS0rD7BYCHEo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcVVV4ntsBNkEfJYpWCbBlNwGjTzWXksVf6a
 B7aYJ8a6BWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3FQAKCRAFnS7L/zaE
 w4lZD/9Z00RoirT9cBP1O1TRPSZsV/i898PwA1y+V390LSkU0nBecvgm7et96y3iAHLoAbhwMId
 fCniVeDmYthH6LI2ZiS9IIqGiBvDjXeEAhdyEvMhzBuiPGFdp8mFz108HQYBgy2lUI7+XDx7Af1
 rMkRf1MMt6X27j78EZPbKvJxROug2ur0kEKUiFIfs/I/zk7D2EvBDMygGK4m2zrcyre6SfLQxaK
 8I4dqrMScYY8SOluQf/60QUYHV/hnhOpo04JNaLAyIvaMYd2Qe7n9BJjsaHXDQbL4S6iWyJMT0w
 BqfC+KJWDZDMP4dmiJ4zbtlsbfN5GUKj8+ZiDylkn/8gD9sz81zDrsSjahp6yn5UQoBGWd42Ndm
 pt7oPQmw6Vk69Bw55koR2LRDdmote7WmzKfDN7d9l415NKsy5TKIx+djbJyZOmNCVzd0UgtIB82
 zeZHJ5d3OfaC/hM/UMDugPFDzimkz8aB3O73Y5VGjZhxNSsYmkmWn1HMPcgS9UEtb2YcsJk2gWk
 m6fAyae3Lps827xqLL5DFo/eAY61/9bJ2bKTNQyB9JP9FCqUoc1quDYM7MzqjaYJPn4AIr3mbvN
 SJ+j1qcgCh78X6wsSW5E7LlwrU8gDhIQbjdeGn1HzcP8Z7PDSraWAf2hXpcezPNeVEgjZ+BHkGk
 q8nixFMcHJHjozw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: RSg-RFoZb9-hOBJHoCGHBLMCVoZ4MSbu
X-Proofpoint-ORIG-GUID: RSg-RFoZb9-hOBJHoCGHBLMCVoZ4MSbu
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a423758 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX8ebv630mOJ9n
 1fzeidpLEPE9OQYI2VlfjjCCJ3urwSNRSXFTYgPbo+S0dc3CHgraD+3LQ7HAr3hR7KecPwYggx6
 cpSsoaEMkxnkYhNz1Jzjn8uv9vre/uQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX6zVEWK5oUEOO
 aeoNRuy8s8e8esSYF4FnKGyAGyHb3nNz+42mogGu2WVNHxEPXXTTue1Mqpf5q1GwhlRfMifaiXZ
 /z4lUwM+6nub+jY11tjIQmh2QIXdQAbrs92ht5zclFmYtgcEsVTaC8ARjf00dwoUSbdPm3Zij27
 ryFls9RjJ7OVe/wzYKhEpPeDU81y6HiDsvz94sxa9TaGJa8bP0nz0XKXEIL4VhZSFMTjOS3+7RR
 ohkV1Lkcrg5MG7X3ob0naSWP+h9EAA1BPP+UrPSCRX2CvzWZEAskVGPyk5WlVfnWQ0E1HTewsxV
 TdSADOP3lQlEDM3xBNoeScHxew8tRpPp4exEMRZT3FDrlvJ1quvRaGzi7030v2Tu8aBGDdVBmQy
 d4jjiXo1gBBPIDtL0vYwPtPwSpTIssM9wcTKrf8gCgyu3u2Dx4LTibL/VmnkDhrG0jpvcAL8RN3
 xw01hfWXjle28OaSsEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
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

