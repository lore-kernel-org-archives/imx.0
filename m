Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9984F3ABD82
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352647; cv=none; b=gylOqaSuVtEYVEVM6TwmuSKdaF+Fe/tV8Qg0Sc9uNciAM1D78PYKE+Zko7Ysxjcmq2r7ktG2u1uU1+n9Xzpyp4puW5SAJSoGP1mgF6k83iTaIbfL3VXhaE0LB+rb+o6133/K6P2032PJ3M4cjtl5QWZ/tdvo0Ip/OFR7RZrOgWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352647; c=relaxed/simple;
	bh=d5jcui5x9J+nHSVyJps5DuSu5oenM0O/Al9uUGEdnso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5IxS/E7HMVQ+RnilIUJ/snyPc1d5in5EtEtM2w1Aec4uqAHBnqKlba2xWchox33NQXqq9pseWxgDZmAZ+FWuFn7Wbgr65uYrgWbgxTetDdaf2I8W8fc+za6P3Ooxyd+zh5/AW0GMFfJld/8nDnrHNgYOc4rBKZz/Ohj9dn815g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SdjF4a++; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/mpkDCB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SdjF4a++";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/mpkDCB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L7C3SP3680415
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jemJMg1mPxTimQgHduXv2Tk1YXpvQTVBHPayB9K7NY=; b=SdjF4a++R9b8Imh4
	M50gCFCW0es8kE+PRhzsu2IUk1csQfkF4V/6z7xG3YVTpjNfX/FdQgJw91FtGDmp
	k9o+F9H/tC9kwoUMlnjCMAzagYOfOb9z4PpX90oOtPpjcMhtCJ9oN4Zi67xTunYr
	RiCN3SuaU53vG7krEpjKUJicnQdvkOsKxwNxHDbUGDL3G5h0Tu5B+4wjQwKDL+gO
	Kg3xPNU14w4iBOj8Va9vS1r1drJyibztFx7S8CVulTr9f+zLqNV6/DB/o/UCj6IG
	dWnVFr2hOHZp3MU38CH3ubZG3lkrooNxrIQn3SErxclSxBUFc3foFsk/iuC9/aeO
	3iX1kA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j40w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso163308571cf.0
        for <imx@lists.linux.dev>; Thu, 21 May 2026 01:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352642; x=1779957442; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jemJMg1mPxTimQgHduXv2Tk1YXpvQTVBHPayB9K7NY=;
        b=B/mpkDCBY72fo8Js+fTsYdic3VcXNU71ISfKcVNZKi147XV8i83+hv9kUpXlAZolCM
         3vrD0B900wPJ3ALjXQCOVopMOzOJ8o6g9B1Wi7+QI1tQfdRW/g3hFKgyFi4YtYuuvW6f
         R70Ghqtl12pz1j9gqdSQ4wpXejUWTZo04y98ZOYFK2orzOW/PDOfjqZR0ur8QgrxYVpU
         ca2XldT8fj0oa7pV1WptHLV1ql46WMrKMP+FOifoAkzG0oMUMfUFw2bBb1RBrqxtrFko
         nlF9FfAamuSZVIPcs0z+qfxuZWIRazu6PniJ7Z88wOHfVqVkG38gHg1OJ+bXn5K2bSC2
         j0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352642; x=1779957442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4jemJMg1mPxTimQgHduXv2Tk1YXpvQTVBHPayB9K7NY=;
        b=Y0dExUuybaHh6P+LNow7GFOXUtqOn3IHM/kRPHnLNMgGGYAdEVDHyfRsqPDK4dDtjm
         FpbY/Z8fIFIqF3sUYj6QRVVjCqNSe208NqRNRsMBXgcCzUAWSK1z40icqzFO6W2hUI2a
         W4nZ8Ao78ygYNs7KBbEJOSH1iK+P7o2TnhMoQiPll9cA1UhiDi4o5t9qfVN+aqXd4AV6
         5SxevYLF50JsRag2CrPoFiQnrlB0EMGloKRKWfkkst0ekRQv+0HzHjcwYJsJvBhFRLaL
         EaRUFmGOg1arI2Ic9HDkQdFpJJwM5WuzFLAGmwyjZR/K8ZMSmzQSvWb6gMRoHEwZ1Wo6
         WnPg==
X-Forwarded-Encrypted: i=1; AFNElJ/oElihh/6J6/aHWsXgiYvyQLArbqFL+hrg8NqgpiO1gdgSoPzKp5b31D2XDluGN3YcavM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWEAYAcfcG64B/1ouAT2eIR2t/i3VTRtRe4Q3dbMvIAYRMwLfQ
	53QF51hKFgLGqatKenyPe+QNMEA9nhq5CmR3/YEjxoJ1empSD6OWjP3J/2WYBuuLNDBTRcS+6/F
	i49xkRoe17Tgr/Tf18NHyhyXOzarcwMj7yMuHiq/SVSGVnKgL2ixfoUY=
X-Gm-Gg: Acq92OFWVhUITP210zZM1dsn3l+TQOBmkygvXz4Z/hZI6w1ha2MBizS82YSZq8WPhy6
	37cpb4k6tHlw6vVgpYUyrjhF7bdX4OVi7aVjrc/fiBkxWx7+jc5Z8oKh6cIeIW9Hde6L5kjiIEE
	yAxdzbwNVmsNDdgMAMx0boJaxEKult/MWAUXtpq4j3cGS1u5/oFRU+8R6WvDAHrC51q7dj6SSOa
	xWKJY6sBTQU514mo/89tfOVUBXlPln09EEP310hIj1umX0CQ6aNHre5a/fNZg8kTVacEwbb1zmw
	78l+kOb7AyvhyoRrGKHBXp1z/24I8nePSTUDxv/3VWDP66qS0APC9+mfJ3x/BLCo3s9t4ZnvQO0
	fJ+FtQ/+8YaUN4q+Vi9k8Mup7QyBOrE4OJYFEYEZlmfGJldEyoVs=
X-Received: by 2002:a05:622a:2590:b0:516:51da:ae52 with SMTP id d75a77b69052e-516c555a195mr23279961cf.33.1779352642393;
        Thu, 21 May 2026 01:37:22 -0700 (PDT)
X-Received: by 2002:a05:622a:2590:b0:516:51da:ae52 with SMTP id d75a77b69052e-516c555a195mr23279411cf.33.1779352641766;
        Thu, 21 May 2026 01:37:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:28 +0200
Subject: [PATCH 05/23] powerpc/powermac: fix OF node refcount
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-5-88c324a1b8d2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d5jcui5x9J+nHSVyJps5DuSu5oenM0O/Al9uUGEdnso=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQiYCDxIrOzFNRB+zSgbriyAtuSvWozaQ6JP
 bdrg27xjuCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EIgAKCRAFnS7L/zaE
 w7SsD/9c6wDjuVBS5Sm/VFhqZkK+tS0GvHXg+zY0D2yyFaXX4voIhl4oa6+psFsIHJX3kjbj8gk
 2NaBcZj5v5qpmW4jExZj22fpTdHOKFtVnDCK+8UF2T7u2gqPrZwH7Y8YQBBFHmQGJLOoPuLHZSJ
 Ic6H+lisu1XnF+Db/iCRftzqK+Yj256ww6xHyvHM0eYPDKNcHh5k24Vw+F5NmEuz8DDwWPy314p
 sKpJutaZQ4VvhNThPdbll7B5GU2V9eLiV6uG3hDBVj0rKkZETI0tpdV1i2MNBoLEEmjm9lLgtxS
 H/iU9SJJDHlslkgKRK4iIa6Givk4naromKliy+6A89h5XzhSVPELLtqZVPirswCcj38GXkDDNhx
 XdQFVaJ/Sz0+LeyiysiFYFgpV0q2SxNzEgM9dj/cin64KeXZn6O/32f8gdOxs4tbIcgBGZtHonO
 wlf4CnKF8bhdmRMTSssJYsH2zxYaYoK13u9LnsjPAmWUH6rRYorVVYEj5qcJh4TgHv2isVLkrU0
 DrfnkK2UlqMZmTEfCWPTz4USoMsl8R3ve3p5uaTZjKaxhuvE8U0Ok+U7ZGIMSMm1Y20I+yP+qFo
 WCb4cP/9+Eh3SybOcfnPyGnHxIFTEkX+zZNkZvRTcLA1Ik/aJdRAh+FEsokxVsD6vhm8fvFsvIk
 p1kCeIIqXvMimtQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ec443 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lFaTzyIiLygvDfm8gxsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4e3HtOL5MebR1qcY42JioHw-YlrXsul-
X-Proofpoint-ORIG-GUID: 4e3HtOL5MebR1qcY42JioHw-YlrXsul-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX11I3HeWBgWdD
 /bBte31+LiR+60bDe41/bj3ofv+RImlJ6yqFagtHEmclndEsTrY4rLIbXRTYqG1UCxve37RbUOW
 Zj0YJBp3N2JMSqT2YvD9Qik8DrD8s7T+4qJdXxSc2DokGp9MuGM8ayisdNTpb8Et/zn9zyPMEjd
 Uy30vOlx6WPy7Z/aL1ogAl8NJxHxYKbpOv+Pk+TW3kgToBfFMYuQdU834L3BSLItVr7YYSH8O/t
 zpmjQAMa4mBVeTn0HwuVTjFeVgipqyPDuNxsSceZX0RSE9Gu2O959PDCYYcygcYXND/CvxvEWou
 UbSDb+2Z/XWDYmP95QbOJLWo4XOzYEKuaD5rweymc7qmxoElsgdYEcMgPega/VBoO6c7kN97Xn6
 45I3zZXW9BtcPXDyKi99ui4F99vQNeZ2d/Q7oFtCJCWve3ISfvNSFpnUcLJ/ZuRhW/zBjyQsUYr
 i2Va4PGl/n4GEfJi+1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210083

Platform devices created with platform_device_alloc() call
platform_device_release() when the last reference to the device's
kobject is dropped. This function calls of_node_put() unconditionally.
This works fine for devices created with platform_device_register_full()
but users of the split approach (platform_device_alloc() +
platform_device_add()) must bump the reference of the of_node they
assign manually. Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 81e5d8646ff6 ("i2c/powermac: Register i2c devices from device-tree")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index da72a30ab8657e6dc7e6f3437af612155783d8f9..973f58771d9636605ed5d3e91b45008543b584d3 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1471,7 +1471,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 		if (bus->platform_dev == NULL)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
-		bus->platform_dev->dev.of_node = bus->busnode;
+		bus->platform_dev->dev.of_node = of_node_get(bus->busnode);
 		platform_device_add(bus->platform_dev);
 	}
 

-- 
2.47.3

