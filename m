Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC173D667F
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539546; cv=none; b=lWfzLyt8BIwcrFsT8XxjV86iEUOcCNmKB24hxyZF9emmXVPaD+lgNF+XXduaplGuj1lP3YHDfDVxxshMszZQ9Kin/yHjaNJW04hkMdckfpXu/PZMOBzDHPd8LbE2h42l4QQMDzP37ozphDaKbkf0jMSOF/7iQwySCnM+PpMN4HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539546; c=relaxed/simple;
	bh=e/KidaL4wAeLOYzpEup79QBE4YB3GUvthnfa0Ew8sdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQHs2oHs9wQt+lwIYh9AIHork1jI25vxQcFYEyLLH3xQY/iqqXjXKjo/XwYF7M+ushIGDD3raQ/0QAxGr6nHazLGGrE0vnVZQCY45W7kQ6a0JJJ2lp2ggQQni4E2bXXUukqRYi64P46GdKERuTvC70hhqZJh0ycsxiGwSdTOEqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+znHmvo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACijdU6Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+znHmvo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACijdU6Q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7rgR92979977
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 09:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7yyISHBDW6HtabJ1pV9A/MMaSyWcRa8ODURQFtJ8g18=; b=Q+znHmvoeBFyZJiz
	uYyIo/u7JSU0yCc9yH/0dG9iBQoOzXGKf66qCX2LGTIH8vdhy6poPAKixz8wCUAV
	KTDo6Z/e0bN22d29hD6Ab5TbhyJYi5NSEcD7bDAXdKeg9Xnal8iSk2Ya6g8f/epE
	jPxQkaPvzUqHBJP7vM/totBYHOKQbJVgV6CI5Oo7y35sP3etT0a3C78UR+VUw8ZP
	XkUpepdM3SVL86oMT7rcUZ9K5pBGNh2uIHqe+KjQ0UiVsZPCkcQv2OTj5kNSvgOE
	gL/r4U8CuOzJa1KacsHYz6LQoZYRoab5n1oX2yg9p7uj2/RMt9fkip3uLlLNXMdj
	9MTabg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg0epw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 09:25:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso67198711cf.1
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 02:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539538; x=1785144338; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yyISHBDW6HtabJ1pV9A/MMaSyWcRa8ODURQFtJ8g18=;
        b=ACijdU6QF1jxhKTH9sndFeheVvroV4GsScD/a3ZYC32WzH1p8l6L8p27xk7E160r+J
         wIUg3qgktQuuco5LKf0mz9l2IFQBmDJJMrZrCimejjawO8RQNwqt/QO2EgtszPOBJO97
         jHlf1aN9QEFkpDNZmK5rxNixlqut1itoqOc0s4CsIe3JtBhyx3YPtQzsnq/n2DBjXAND
         P/vDzina3rb9907Bn5EC+UqhTvr6uTWEaMToXuiP3zVXW/40qm8MdEK2/QbK/HGrOqjC
         XaZitWqBJbrE7hrpAGt/HY+/Tiqf8wMRXKUb6LZLrO0ejwCEtVxEcVlHKsbBuFU7K1Rt
         Nk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539538; x=1785144338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yyISHBDW6HtabJ1pV9A/MMaSyWcRa8ODURQFtJ8g18=;
        b=OcnnSsJXKZaehZHqEBKo5EAeNnEcgdp86eDu/lIaqfgjuThz81Htc4xODdk5e43BsX
         ovES8I+6lDOHwqZqulJGNGRbj3jPPq5aC00n74tVqtzZ/nRZi93bD8nRXhPCFqSLEDXl
         8u2HKxnMNfPJEjUJP8ucOkiTNJQHsEVwb1PaQ2CTBsl+xafRrT38Jf95/wjEYTHtNRkL
         1OL/agyiKmxm+mbPSFQwGrSr3h3LlWohz1+FfA9NIpogrl+LKhkWexYoh1h5+GkRbNsD
         CJwmRYsHrf+vGh8y58ca58bc0yKJkMW+VWaw1UC5xyTxs5zOdGf1RE9Zt2ECMGkN6DBY
         s2Vw==
X-Forwarded-Encrypted: i=1; AHgh+RpdFZCyP0TiFqEF0Btht7tq9SA3wPrNjr4v9lgOqxfmSBgYxfaIoRxVWrYuCKjF6EhY0JE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2ryrAKRwy5R+Gu9xaAg2RXdH+YDephXAJB0nMEcILdq0Ktj+U
	lUsbvAVvx/mB8WfiMq9boX0nSy4gq6PoJiofIc8920/i49QJ2BTKFkaccPD0pjIqsofd+taE//Z
	LYo+f2czLaDWRyDE3ISmSWp1CB+D8SV9+c2qL5wlL6pfiEi2cA6gMzCI=
X-Gm-Gg: AfdE7clhoexAcJnH/EPgMYPmFbJhSOIpZlCA5G8FkeBeblgUUhkfEDnBkXU04lrfSdt
	34/xTUi4uraSw+S4Ns9UFFR2BhEUO8tilKC0Ol1U1SgOOi21lUxsYzovv5T4B4Gxym52BixMl3s
	5RFndi7BIEP0BHQROqeT4AjtCO98NYKyMebsxEzRrTlU6j2c4ACvfn7fZzTT2P9y+XUcDJgA0WI
	JG3mkFSDeLPH0W8gTbxV6EJ7mTiaPT5c5G1+2kcm4V8rUG4W91yQAITQzCF2vQGOoF00MtQHDdw
	Em1NRy3BIXRDj8CPtc1qB9UnhNdzLKZ7wv6YtW3DdNO8nd7JNf3G67S3guG1rEDf3h6YFgp2lpU
	eIxGyFOADDsrKB4SUHHvZObMLUXd/Eg==
X-Received: by 2002:a05:622a:190c:b0:516:5019:d27f with SMTP id d75a77b69052e-51fbf8bb3b7mr165219621cf.18.1784539537819;
        Mon, 20 Jul 2026 02:25:37 -0700 (PDT)
X-Received: by 2002:a05:622a:190c:b0:516:5019:d27f with SMTP id d75a77b69052e-51fbf8bb3b7mr165219341cf.18.1784539537361;
        Mon, 20 Jul 2026 02:25:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:51 +0200
Subject: [PATCH 4/8] net: bcmgenet: use platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-4-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=e/KidaL4wAeLOYzpEup79QBE4YB3GUvthnfa0Ew8sdk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXel7DPUjBAYpcf7niyv0je5wGjcw6b2KYr8sT
 XuTSwpcWaWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3pewAKCRAFnS7L/zaE
 w0tjD/43qo3abkR30JWubh7GVIOZEwMy6gwIxxGEFh+64tlAWfcLqoTyNpfDWe9lZeBbZ1iltc4
 zfcV7M5oRVFE0KyZ1Yiwjib/cZWQi7vhxVQ0bePCjlyvllspMWyUfr2/SK5xFC+j0/xnhBPSZlR
 9+viBjtr7I4qZYIhZm0nDKPPboq2KqPcCQVdb2n0a1lqMrj56FTzTZy8qRlBH6opmKTsBPUpdah
 YLEWRScnyMfdm23dhcA1j3g0+OXu36onH8sy1uxZ8HS56kcQKURCK6m18b9e2VwiDIk5akIlAKH
 V/USnZ6vRpNl9XMir6bi1QFnNSAVYa3aSWMKPaJxEBtdaRbfDNNHlw5qYfeLonJF9XAEw0JQC/b
 iMMQCIj4eH4u1UrMdLCmzYF72Xw2Scjcnet4fqyBDvs2XgopXv3XXF9gVioCPtg47IwWemXcXjE
 23HIm9UdkNPKhC0YIr+CQwopylJDyKj9XiX62XW3GlesyySsJMBx9wxHwjPr0TesTOZp9LJGAMX
 kWuqevBo1tEoLu92X/0LJpXlKqOFqSsW/M3tCXsvF0fRgu8DvU2Kyyl8AoD1vJsyeN8EGBj3uiN
 KP5T0cPG/maBIKrbh5yP8+K9raSK9x3Zyxd32E+i9tJZK1Bm3Dj8ahaq+83dmJNnSW5e/7yRqQs
 rTNxmSOpcUPV51Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfXxL/XsaJWMDAQ
 IaGnGLhGLjAP+8JHECoqmD8MA+867HbbemOr3F6x9FteO58IzMKNTmdafE/CRp52wuh/gT/qV8Y
 lKEOd3mUglxAJpheiqIsvxZw8GeqxEM=
X-Proofpoint-GUID: 5efBenU9w4LCABwwgpMy_P8qpFhTjw_P
X-Proofpoint-ORIG-GUID: 5efBenU9w4LCABwwgpMy_P8qpFhTjw_P
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5de992 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cykPYtnZiOmdoJCT1yAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfXwFqOQpvC7V/E
 AXKYpgMcGq58lbgNr7u5MHkFaeeoOfIfGftZR3i3jKzxjOAt8MoYj22PR3eJ4mwOvEjs+mDiwgJ
 FHoeA2n5oZypvw/iYpc07vMreNEOpbcAbu2Si5212KCURz2ZmPIxoWpwFG0EB28FCByf9PEqmU2
 GtRXpv+7pQ3fVM1tvvy5sTxfonH8KBdJCphv1z5OcBFmCFauUrOs/L2hs3b0RI0sTWtM2pTuWdR
 mHe8UCUjk4BcoLgz5gZW22hipvDp99PYTdNXmA/GqLIV/R4sax/no9ZUVmnqn5mz5R/F99ftcN1
 I+m6QbGQO7S6IRSRqRm6g/l1bHjd5fpZeNw1z/n2emWSURwR7FletwQgjwO5huwhFRyEf31ONpt
 4oDPHJNvx1p+mThGqhIRU5lJF/vw2/HVYZrsoRhjsgqoKq1Am5T6MSFeUxrLJhJyDNR/OIMf2ms
 dXLPk9UbthzlW2Hda/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200104

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/broadcom/genet/bcmmii.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index 0f0dbabfaabbce3469de79af91d7731b8476709f..6f471723bd53f454e4b0de1716977b4382013429 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -492,7 +492,8 @@ static int bcmgenet_mii_register(struct bcmgenet_priv *priv)
 	ppdev->dev.parent = &pdev->dev;
 
 	if (dn)
-		platform_device_set_of_node(ppdev, bcmgenet_mii_of_find_mdio(priv));
+		platform_device_set_fwnode(ppdev,
+					   of_fwnode_handle(bcmgenet_mii_of_find_mdio(priv)));
 	else
 		ppd.phy_mask = ~0;
 

-- 
2.47.3

