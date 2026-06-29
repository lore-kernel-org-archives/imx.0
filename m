Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AD53F9F5E
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724400; cv=none; b=pAUGGx83+csKqlHmViKRYMA5adrEzJjbbPaSqAJPVPdqUdbM13xnqAZZuoswciXExgmt9vLrFBW3041KJji4CAOm084O4zbrsIvleWI5Rc6yao4/Wfz9G0TUdO4zxOkIzYTw300zAnyxvAl3Sx9koW0w7iDBJxLJ222fdvEkpgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724400; c=relaxed/simple;
	bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8d1NYQI2KhQ386ZUOEyL5Y5kxdo914etWk74xFo0Bsyv22JHVsQ36828w1yqrS6S6npq437r1uU9P1PD1mxfJ9dSkf/LL9x2q0U6YK68l3ejcjaVxTK1jmLk5cAKvgDJS8HmU3L7QFaaD58LdNnFVf1Ch8k8c144R+jUEx3F98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e49x9dge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAy3GHy4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e49x9dge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAy3GHy4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8wV082391253
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=; b=e49x9dgevQ3cG9iG
	Lkj/IXiDOCjyRPpFLYPYID7dhrpbk+iSA5taIkgY6Mlrk5ptpQhi2PCxrS++NyCr
	j7AIY+DUsDYgCvBLNbDdOX89qLG32+hXZcZDllrLWGMryBTHjnyqgNouP+DK9q8G
	A5+RTn3AlDL3xbGZEV7v4QPykHh9MOpwOzfBeycwCg/AQFQup+OivOuL5T2kudbr
	SR1C8Lsz7aiqSc1djzkUXOrSMEcAJgQgapxM6Hv0zohRVnHKFEus6/p/zWUMd9GZ
	NinwucbDLPW44K0sEoc/+mwMWA/J+LaGL4B5oMe1ojSSmc6BGaRJI4/cAH5OwyD4
	gQ7JYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw822b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:13:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5740so139228585a.0
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724397; x=1783329197; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=bAy3GHy4o6wpXQOn4W3C+EZOUUfxT2x0Q+tM7uNTKJTWOPCTgsvsP+wgwDrJ4M3/Bx
         k6j2K+1xM4JeGQzcOFStWCsOaGEgzDkmfSk5hl140fP4XqzZoCWR/uB5DO5DsD8NcLf6
         DEPhY3Ck3skWG7GpuEPuSWWdhKdMoBvehufcxTVhib5UxsK0LxM5nhAucfzZ0aAIu7LZ
         5ZffrDGRK5G6TUSuafMPVRlI7Pk8c6ItgLT6841Z5RyLm74VJY0lhnR6SEqYJTXISflK
         3tIqjb4LUaqnmqCf7pyMbCVGVOtGXbd+jxLii8QGmnPEkrvLDPQvSH6bIODgqdnmoHJA
         MmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724397; x=1783329197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=RuyA3ezEnmqcLJ0lGsFJBRf6O5CQEJx35vj45OZuK4zCanyBsf1hJG7vns6rt4TkNy
         Z8WvgQw8/PlHi/8lGWzHvCZEbt8BBd0D4tO21i4uJZL3NgP62QTtlIX29rTmtOmZTQwQ
         Gl6XCfquMiS3pxbXIaNXePq2v5aPgpi4Sz2Ly7/3AoZ2Yp45FvmsLEq+ccBZhvowvs/p
         nolnWXALuXTsR2wvJERdYkRRtQW8kXcq7c7XU+1CcIIAMgdbI88K7NrH4ELsbsJDmWB1
         37iLzUoy7lgBsy0n4+d7If26/aip9pl79mQsjEI7c5UPubov11Q2a/8ZkTExC5/650sG
         vpDg==
X-Forwarded-Encrypted: i=1; AFNElJ8DB65supc0m0aqRzI7q1MVMqN2JqLKHhGF3TBYt0Uc0hE0EQp0aY6YH6IIyq6j4gYbsVk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5eaW8D/qPAv86YlVZ44T2VgLU3A+HDssGemhqtT3juDLXanQb
	zd4tUo5AVs//PT4ZqkuUNbhf/CCLUz29krNqDlRUD5qtfQUZutSLEEbME6za8JfXARkEU2YBAwm
	OjAgEXACBHaJg80NIoiobhjsEGek79TJ5E6HlSz+D/y9P44sotVbnAgE=
X-Gm-Gg: AfdE7cl8+g41mbCWg+L/+QBp2qB10a+5KpbiO39VPcMAxe/McaK5B9UcMj6Cy/ntA+n
	k4TlFO7sSRGQ/dkwn7pAdXtb/50UqkYKo3pWH7WH/y7c1wdLKIvfWul8V8cQXe14yhoT6DnnRIn
	cR945t6i2+3xxFibHJQjCXxKlaqS+TuszoZ5sbUvykCXs2PP6ytyARa99x5W59PohGmqFDG6sWK
	QMGkei+p1MyP8Mu2Q/19CGXbq18qOFK9nqJ8DLYr6NzIzMq5ih1sQwHIxGbJ18QyM1mX4m/0yIf
	ambEZpWNWJAUW2jwX+qeZzcvvfhpuUM1dfAqxrVBaGhKSsH25htwsQ3BqKsckngYgGFTihjdjYa
	IG+u3D4deK7+zavuhTApmEGgYERHpJJxdKOm1tc0O
X-Received: by 2002:a05:620a:2601:b0:915:fad5:90a5 with SMTP id af79cd13be357-9293e5df82cmr2398876585a.54.1782724397491;
        Mon, 29 Jun 2026 02:13:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2601:b0:915:fad5:90a5 with SMTP id af79cd13be357-9293e5df82cmr2398869885a.54.1782724397008;
        Mon, 29 Jun 2026 02:13:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:29 +0200
Subject: [PATCH v2 06/19] powerpc/powermac: use
 platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-6-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcMDhYRt4vSVXRm8SXMUBqWTN4fu9NU0CYjk
 RvsANfN67iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3DAAKCRAFnS7L/zaE
 w2NXD/9lRtVJg19v8VXQmSDry17OwgjxIADNStd90IU3BJymBaFn6uKZlSDyZNAN61Sv1vUpYbt
 gBiZxsoOwplweM8GutmD/BJ4zH6IEJMTok8pVeRaVr95QvimqKpAltLt7gILbF61IqVety3vnd1
 ij3JBKhpmDwxAakI65pteui/qIS4c+gzd4hTRcSMc6FP6wrIWgiA8PU4iQRn1O8jrO2fwKeIl0G
 g1X+9ujm60pPVnP2M0Hyk4UOS959i0RZuvrm5p6C6bsrc13KQmbqakL75sPmziGIKPRumLqWUCc
 ppKaIrOem114J+vdybIf2FJZbNg1RE4C+ZWaCjRdpimkp39y0fLLliI2lv7zGYEBvBnGgHglZ0H
 mE2dakd3ROg3q5D7/wKq7kzPGL9CuaHiniuR6jmAjxDDb/uLkQ2gSzR4LmrwyOrh2gMcRACavuO
 cAI/1JjBnuWS1rfCL3Av1cRlzGu7kl49WviXJV+CuP2Jt8roh9+0MyDDotAzxC6TP6k9C0iGw/Q
 HeTDr2r1C6sTpUzIoWxW0F2LlnG7VPkEfDmf/M09bcfa27HdRql+A54QzgbdrR3Y9gHdrDMQL9X
 Rdbqm4kG80vtQFKa8yhYV4YHJkNd+sPtTieuhhmR+XGDVwv15BymMtt4OytoRz6kns0PQy+M5Sm
 K9bZdIkgQUPvSxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX6W0suubgY9+d
 u6mC0DcpFpO6pGBS+ORkYerReQrlduDYrAjCcqMjmcAtgYlbh8P0KsFnvokU7FAciVd5JUEeR0V
 D0LBf44iBo4bO5sM+P/qF9Eu+kTnTfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX0Yvs5Oyc/AnS
 Tbh5nI5VkTOuDyPE32Lju+LXnA6Gbs4jgQclEIzR5XBqOV76Ob7bg5+2hrPCGyeauazMm7uVrFe
 lh5SK5NTnxanloUtdNPXl/rqP6dfCVHss6Pmw4mzVILBgqhOpqDXzemD1iXewdmnt/NwHTtiRJl
 Mdi1pnjqVhl89mfnTsgYNExnB9Odmgtdn5qGjBsWuaJF1BqjcnJA67jwKtHdWNLQZYjDMWOQiXn
 EreMuVRy0U29EQ3Tje6ed2P0SQZp4cJlAKMPkR1MM7iavcjgDawmX9BoJmWKKVhUK37BUIViURb
 3bE8wICRusA5hegVKTN2gQ55NbnNjKixzA01rDTqH7r29qZoOhnPRrb4IQLTNOnOM/tlaOW7A8O
 K7dq3yOUpVrt60ZkQ5yOnIJq4f0BCLFUob/b/bOp8CamxdbmMUqcGjayOgrcZMCZD7TiYx/Gozr
 17l0RDuCbusPEikFvYA==
X-Proofpoint-GUID: USKjWKfEeDg2hyNGRpCmGU8SrHdkQGj4
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42372e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: USKjWKfEeDg2hyNGRpCmGU8SrHdkQGj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

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

