Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044F3A5E8D
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352686; cv=none; b=uF7n01yEEKfbCSRROULc5bst6UMgyHSR8Da4X+42i8mOfO0pTjuKG0I+SZteVHHxAmrv9LYnnAM6eZd7X03xOUmhb7fYxDXAc3HduBfRN5IEd3oO7jUcQAWtX9tdw5Ny3G3xuJBduBXuAgDmFDoma4cqs6KQ209Pacp6bcaKGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352686; c=relaxed/simple;
	bh=WNjV02xlopOt/yCOR6c1PBVV+f9PcccL6Myit6QlqNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpFvu38BK0igniSSZ3zl5HMy4/sFgJOGnU/xZIvfp5AyihaIRmzjwmaTmk+AYxrIL54yFLGgIB0nWMjqWLzNcDC14RZUdlnX5fcBcyT+qYoSIMKBGWxQJpH8iZGVukc6oA6Midlp0vjXPL+3PdxJA6dDX7sOF0IGdTbqzqIlRww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fw8QZ03A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQZ6+/ax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fw8QZ03A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQZ6+/ax"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2T2CK3816658
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JM5WrS8FsL7s/NkKefUF2OuGPRtsF5B5mOOL733hTA0=; b=fw8QZ03AavUTjU4Q
	S3ZEST3b2vZi66clxpJ7YbdOzT1lEy0sb6r2I1Ck3VOlZOg4M2Mztk6W82f4Kvvs
	jZLIPlVuoO4nlh7Wqs+/c66Ab49g+3nB89mZqp1gAF8ahSngzWbMG+7on0fZ9YlP
	96r5mc8tTOfipeRDNZsYPXCC8PdK+rWZbnqbtYn/5kAO/MBO4CryrO30EAeszdvq
	4MNvuFSZwHrrLa7k/HvIZsKbSBTRGeglcQQwOd4iQ34Ehsq+6T3FuycqAhEzco02
	gXt4uUtg8e4RrxkRcrjBU9zhs3CpOqq7eZvJiw0NZKgu57dsDcb83OskcsFqwSkK
	FOUi9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa19s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d890580e1so127513041cf.3
        for <imx@lists.linux.dev>; Thu, 21 May 2026 01:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352675; x=1779957475; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JM5WrS8FsL7s/NkKefUF2OuGPRtsF5B5mOOL733hTA0=;
        b=CQZ6+/ax2vi5u+muPxWsRFk9QlfizkR1VR0etmD7Q3xk5TZIoaFMhGoZwokXUSiUPi
         7N+RzwEeksAM54h0KqjWMIgW/IAOJAkLN0kCy+OFewq1jsgUdYZUkIsicPGADdYWJM7U
         RCjaIk23P/P1f/Rg7gOxYCD2cJBdyNraKlkYHT8vh5SI1MXxxB0q6qI9WDE4NeYs193N
         nR2pB4AtINuAC87hSVhnj+sNfIKui9vsfys6zZYtzHfHiRTQTIi4oIn77nI5U226vRju
         bUPt9/o9xYWhjMBJTXAJgrKxp/Ku4TWbI4O/YZ00dJ0wc/xewqHu9cKl4PxcGon9aKPL
         2s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352675; x=1779957475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JM5WrS8FsL7s/NkKefUF2OuGPRtsF5B5mOOL733hTA0=;
        b=kDAJN3MtzvaW0Xe53V9WmY2LjIo8ClDj4R6J4QdB/J0sek48okNH5Nzbt9d7L1YSLk
         bUVruKuNaTOHA2rigCQHm5xmirANkP01MYOhkSpeEf20JtjUPIm2DABDCUlm5G+iYXwN
         F0AoXJ+9TIjDHOrtWX47FEnMW+LMCtYTXoNYs4UKY/m33Hg59L9RcnWhzsFs1RSCEBtW
         kyjxV/7bGfmt7hcXKl7pBSbN4QJQCxnGKE1edHWAn8FnQC+B6CosekTroZ3rzM0O1Scu
         yScYrAxUfpg1P3qQEizCPAP3EEG1GfEsZfum9LKrqjbI0zRVbnzMDML1XYTIiEr0AB5g
         yjxA==
X-Forwarded-Encrypted: i=1; AFNElJ8njI5TSQkgiCk4D0OsKuhUMmVDWnBCkl/jxyg3XKSezCpoHQANc9S0B+emXTAtwtRWhY8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyxWsgjjtWSFIEB35vhr4j0mIoi3VcgLYiFcnIS8rVxawKmko3
	0ihrJYl2nwSD24egjm+a6zuHqb4x0DHaO6m5BvrhpuQUTTdSOJbMn9nl+dnstQPfG/m15aJBNhL
	IU/qfqmXX7k9+BdQfrDHjSxYiMS8WyeN5x5TUaFPpohHxdJG4Gz5n3sw=
X-Gm-Gg: Acq92OFFLGrcJqBkwaWgxULcXEgIDrR4fAxi9nc+ZfVzVQt+vKb3F/xSIcHOpmjOxxV
	me6pu+NBXEBENntbw/s3B3KD7XVlv+dcC8c4SNnp+S++iwIf45Z7gxbFhd97N3rh4SsNgH+ghwh
	l0PPeyPv9y66hk7+wOclqfYPR9ueQIdyTfruspuZoriqcMGDv6jDMMmo7PkRyw7+VnY9dOeOcvY
	fDBfSTZjwJYQqQaxctcq0WtXqzUVQ4G4yD+HEn9HT7cMEc0VfR0z6ld3pqEoIfgYuoWOvapv9L+
	dERXVqtFQMQOMBVKCVE3rTp90tLEJnQ+0QWo72ENhz3xpXFzsbDUYgNAb6X8FrJRf9m7vo8c/YX
	OWzgklcZp1+ncNW9tNm2QNFaR4ppzz5HHfqXH3aZDLPGKdGS/QXE=
X-Received: by 2002:a05:622a:8418:10b0:516:c92e:68a0 with SMTP id d75a77b69052e-516c92e6b34mr7156591cf.60.1779352675201;
        Thu, 21 May 2026 01:37:55 -0700 (PDT)
X-Received: by 2002:a05:622a:8418:10b0:516:c92e:68a0 with SMTP id d75a77b69052e-516c92e6b34mr7155691cf.60.1779352674619;
        Thu, 21 May 2026 01:37:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:39 +0200
Subject: [PATCH 16/23] slimbus: qcom-ngd-ctrl: use
 platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-16-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WNjV02xlopOt/yCOR6c1PBVV+f9PcccL6Myit6QlqNg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQraq494NpNjsZdM6B5yhOMPpc0+cpQHRIzk
 BziCgGQMEmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKwAKCRAFnS7L/zaE
 w4jTD/4l8BoivhRf297UcPlBF2FNgHn3SoPDZT2tcoCJ4pwYH2iOy+vtLErAAScTa0i+1UqBq12
 r/vnG58789VM/bZsVlX58HBBULss6RrXsI0b1xw8EkCBAbZgWviONlZkPl0INnnV/NQary8Ou61
 HS+Z9Bx2tUipQMxu1TR8k81/EnWgFAvXN2yn6rGm6KlEZGdPPoy+xyAPIudQCSPKNiItdIQy4UW
 L69otnhA4ShEQ1sNMuTK8FbfYGh60eKt7KSdIYr0joMsQqIDzR9lXGYSWsm6AkMFlZSeSDfPzec
 cbKOHBaPD/LZwggKavKmoyvpCN4R/mhifGK8vPPc+GHXXtl4NtFIzFPGDF+P09BUDdBTekpHXKF
 QdwNV1cr2r5NDEAGEz3fzJwU8AlGjoP67Fs3SG1KKOHS6JGuLDV5XEoMu2ujeF9D0wftPdbBnXE
 0XaON/q+Bo68CpJTJ/AKWzJGEasq8K8q/cZQtsbgg5p4M4Mc+Lh2mtvDp4O5yiWshRKBIKs5vvC
 P1+9Sr7JULlC9oNSLKd3qQazCwSqYr8qkLS4hpmeKs22LIastCqlnU5Icf8DpLIDThbnJftTd8D
 mlxLqdCStPGfHY0hJWWilamRC/5mefu2XlUg8HkNToEyOLkmMsb2VNO04VxVf3nl2joirLMPZcg
 tH1KDuWnTXUMHCQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXx+HOTRwrcoGG
 v1cul2pX6pF2hb685YWn0nFZY8rNxt0f9V943uwwA7tz05ZEjMojvjTETc2hs7GNAVlDb3JaJHt
 t5Ylnl4IS5YCjmlwT6RD5Qg1Lb8w71/SlzHptM9RKM6DoYqbz7vezwM8kpxr2ycQmtf/rPCsqMR
 PzL3AtrQ1EdxY5Yymr9dDo9Vy/BF44pHAubVocPqN66Iq2VkXTHF6NhvkiASwb8ZM6Q7NxbY/xX
 pwbOH1tMIhdb/J79W+d+APFFGnfKHs2DhbQG7zRJ7xgmXOhximb77rH0NgNiKRtYq6eHAr4qRSd
 hGpGNmcOdRXN0lZoXxEF2moSS73PBKn1ow0btBs1qr+R6/qlPDPyqhZ+K/VfdAV5kOC5BMImdaQ
 TTFUN516/4qipo8KSpYI799gPIzctRqWRDGl21CEYRx58GxUaFfz8Ezol3YBQMQogPWYSm3q9M1
 jQ1yWdFFcdVJA285pHQ==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ec464 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zjndn8kAT0tTeq3eajEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: e-PGCX8PsKE_6lQYBrgAt7bn_qWq7tRh
X-Proofpoint-GUID: e-PGCX8PsKE_6lQYBrgAt7bn_qWq7tRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 428266949fdd07ac13c5553bded891225c6e1a16..70f06981533237cb5de47a855462220050f6d82b 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1542,7 +1542,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		ngd->pdev->dev.of_node = of_node_get(node);
+		platform_device_set_of_node(ngd->pdev, node);
 		ctrl->ngd = ngd;
 
 		ret = platform_device_add(ngd->pdev);

-- 
2.47.3

