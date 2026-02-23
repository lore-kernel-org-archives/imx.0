Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7AC23F26A
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853877; cv=none; b=YWyjVCEp6P1xqARBkoRl4M5GtKbO5I/mo42fPiZQQYU/qCfN3ekVzgdTMrfwIawxfEzA6AMmNUzjSdBv+7149UND+eeJB21pzlo5row4hy+tdSP+Ru1gPTqte54EYfoLv9G9haAQbzNdg8SD1NlJ53CikRUqnouEFXDXCgbn3YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853877; c=relaxed/simple;
	bh=+XjiWoNFsFPVem7xRnzx6aq0i9FMhl7HvhAWwW/w6SA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UeHBSe0ryJEJLppko3VTUrnc97UhDljZwX4GAtBJdPqLJUdy2NyoO43QA4/nOqR7d/5Ip93Rl9DxHzqPRAKu/Mn7LLDrxSGvd0gbnZO6TdcsJgX8jDLdD7wRjVzxOSVIJ7Zbzxs3Ais167LDfIouzb1MIoeWezCAspDHu4GIFig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzKXoOxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qq7icofH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzKXoOxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qq7icofH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYdqr322212
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=; b=nzKXoOxi1bY4uY6f
	tR5QifCU+ODEzdpPNtpBb30VXXdbcFX5oPrIf32P+RL1prGWNb3WkWVng4H9wU9n
	RVWix+32OD6W/2RCVs6sC+7UEuzEzYC+kdAiGc4/caAz+S8XOBMZmg8w/D926Uvr
	sWKrRRYqMAB2cahVvYOEGd32s9WEF3hRoRGulqAJAqA9/7TeXNWzDB/OfdKE8gDN
	in3i3Aqf5bi26oi0UjSuhJ9sa6zQd7hdzCWDkeDzHKQDFk+QYcJZR83JC4+UnhVX
	sec+mtHcIBvBsFhgXbQztpfjJ6SgiXiQ7WnFWx8jQf2+7StJWGOcPFgfsQzv2EdH
	eeqPcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0fcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:37:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4b8e9112so384389485a.2
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 05:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853874; x=1772458674; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=;
        b=Qq7icofHkrVc99xQTd9kvZmgfC9tIm0U/c7DkTosPicpoUyzsKnFpOuLjxE1SlkFlO
         a2Q/KQq2oLUTdUW5rbad4oW7grZbgLIrLql9lyxEpl8ZjtQ78LBkM/1J0EB8+DJ+wepm
         e33CmCsALramWWaM7GjhAa7OiJmfkfOaoT/x18pHkT053duHdgpxgs/WKqN078692b0Q
         s+fvzPMwzthp5gjqBEd8YcZjYCXzSHSgSRwGYmaqrbtR2yWv3SSzuFXjrCn47HzMExbE
         XzESFmYPu1HNj5XzpjZcm3x6yKMb3MITUho2SlltUt3h96F26Bo5JvEcsj0Q+LS5SC+8
         R27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853874; x=1772458674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=;
        b=sjMxMLYgNUdthHF6Uaax7mGvA7hLYCdmVZOi2l8Yyd9YJQ/Dy84iDEecQ2U7nNo/wR
         c0ZMxUwcTnLX0ufOoQJuvUMCwFzosLJY9+rGEhb9kcpoHi7FYKxYBmpsmvjWVBJmYF9f
         YHgb1kd+1EUqyuhHFDva8BLslgT0/HV4fEy/CxBOPA/73N26njEffs81z0mun4d5csHY
         9m9qgjhyWdF6yQA+Cpryua56Wk6mMz2d1NpccZtpsZB5PQSUpKJnsBytV5msg5YJypt0
         OSDSNHhI6xtnMaQ09meSdDl17Gsxm8PxkxbZucQ35qCPs3z8CUOG5sF+JZUYjvGbX5pA
         UBXA==
X-Forwarded-Encrypted: i=1; AJvYcCWGPiSaZcLR1BxJrFFspAlAe5VsPt/qphOmGTuZW6L7ORAsEq+fse4tY1u8Gu70nb7FAQY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxECh2z5V7aHeZ176r2NKfb7TZgvLeVhbFBV6AytG3hHPoHk9dE
	k4sCmrEPvLqkBpMG2CzEK+Inxu/DihiqAgEcpW03B/L8q7qO2kn7Pj6z+zQXorvDo4r3yOiqiD0
	NF+67x2nQiDTLavd6BRkBQbwkCeU0sGuSG3ZF+d9GU+lLCssih0s/6EQ=
X-Gm-Gg: AZuq6aJLOl9n9iyqeZinHlBSi0PRDIWBdN5DvIWZl6Dj8Pv2e9SexoBG+gFuE6z+kKI
	p2bEtRcIjTuMYVJ11a3GUBXA3Z95CFPQ/7u1XIgLp3YNCHT303DeWAJtnHQW3kWP7QhgV3AD81j
	GCoyw5ABD/AMn3lbV7yitJzcfsCmKsZ4HVLlb5teW1G8SxxKsI2Y0mmchMXiQYRrDpRyt0w3J3H
	gJKONLZPSnxHKGySNt0tuov1ldRfKPZsWFU1qR4WgPmBNRMl5Pab+B2hQv493EN7/VU9kE/Dzk9
	KjJYFqlU8wjkWnmQNMpwFpZdnmYNqhJt+fIDYZ+RPRsg+dsWH4/judskCHyqJLtc1ywNKTnYJhu
	PL7o/2yJeDtekrt8eqltkok6/IdmpiymQ8A/tmos03ujPnsXspSo=
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id af79cd13be357-8cb8ca65f6emr996162485a.51.1771853873869;
        Mon, 23 Feb 2026 05:37:53 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id af79cd13be357-8cb8ca65f6emr996158085a.51.1771853873383;
        Mon, 23 Feb 2026 05:37:53 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:20 +0100
Subject: [PATCH v2 5/9] soc: fsl: guts: don't access of_root directly
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-5-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+XjiWoNFsFPVem7xRnzx6aq0i9FMhl7HvhAWwW/w6SA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFge4NKs5b/HhZf1FqytouviECXWv4CCayjyG
 d2GXKvSbGqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYHgAKCRAFnS7L/zaE
 w+AnD/9o82yUVcRX/EDQ8/rDuhAdTh2ARj4bZyZcBUwlc2QItKJYUxWDovnXoZAIJgHTPdXvkNt
 5jY1LxpMojb/ytP1LIZVcjj4CZeP576Vp4g+okrBBq0flZsfk+pjYhYudU7x0W+DJU8R2c6tMhR
 eg2aR0FEEY7kI6pdoUzDoLUp0Lnkw6maSVRVOD38LY/rOsdoe8H3w4pccAPnL6HkTwAAI9sRemM
 stnYdqeTohQktd73UDF3oyLdoQUlNcIMWGCdktfobl/DsGcWX8DinfBpx4PVxFwinDExsX2q23/
 FE5ho2KZlH1ccbvjFOugOdsnRZKYUHFsH8njc441CExac7ECXdL9lxKXh0DHGxPix4Se/UiU2RY
 48AucP0vyJT+EQUWm6t/KFhx1u0KsB0S/AZB+4anFOiTiCQdwi9lfJGE5QnfghNVwv/HpPyRaFQ
 GAkMfxvZ+klkP9uJQwDhHBMSsO5oOuiiYOx3H0/rP2uVjHhwEb6vNv1+7OXvvR3sDIqRONxFVIY
 sZQy7dQlB0NJCSPTZS5iHvBq6b6Px9ywpt1pFp896x/238b7PhE6HZdhE4SrNxaOx7/IcXkFEfp
 Tf51sYJdhHho5bc+m19NDDMTXN/fgysqxUXUF5QJliJI8uQutdcsY3juWrvuFIw/tURqSblK3aF
 tSSWnHAI3hqqIfQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX/MBkh8QVUwmM
 TuyseiTLqD+8s0AxQsxQ5r2ETYrPaIibNMS/3h68uoWdBa95vqgly4TD6BNDZv3KHnYCrjTXpLb
 HGF1/zAEge7zDUd1MwoWMqplId5n0Uw//9FfQjOV4Dmq5MAOfME/YiEXElmrPWWKFiWu4iecpKV
 FyWDw3LG5z4iNXA9MfRGRIshZOXSLEB+IlMrzCrKy10swj4sz2AAPanqkYL9zp01FU0Gt97Uehb
 12+ZbV+j7liv01mfQ+AzBQlygMSy+Zt3rP8zKf9MwlE4/obubeQN8K1Tjit3OVzhUaNvrev4zkV
 Qa9IBhpgX4cf2wphHtIzVUuWVbetr3uJsuZJPChQ3GGdZ3ukeD3W24mx63fHxRi/pVetP9R5O0N
 H4/Eyhe1+ztgmyrWd01jc6XDmywF+cy3vYwV7tAFeeWN67/ZnVeGXrztBWEiA0AeT0gY8ZuJoR6
 DxBVQrjDPn2Efi4K8FA==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c5832 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oxzWnGEk1v-FRkq7efsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: CkP43PBB_zvlqnpqGNcn8nEWa8YzeJYD
X-Proofpoint-ORIG-GUID: CkP43PBB_zvlqnpqGNcn8nEWa8YzeJYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/fsl/guts.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 40afb27b582b1bbea004ca91b96d0a998e7a6582..9bee7baec2b9b3a548b16661f9ba86db2b982910 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -186,7 +186,6 @@ static int __init fsl_guts_init(void)
 	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
 	struct ccsr_guts __iomem *regs;
-	const char *machine = NULL;
 	struct device_node *np;
 	bool little_endian;
 	u64 soc_uid = 0;
@@ -217,13 +216,9 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
-	if (of_property_read_string(of_root, "model", &machine))
-		of_property_read_string_index(of_root, "compatible", 0, &machine);
-	if (machine) {
-		soc_dev_attr->machine = kstrdup(machine, GFP_KERNEL);
-		if (!soc_dev_attr->machine)
-			goto err_nomem;
-	}
+	ret = soc_attr_read_machine(soc_dev_attr);
+	if (ret)
+		of_machine_read_compatible(&soc_dev_attr->machine, 0);
 
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
@@ -267,7 +262,6 @@ static int __init fsl_guts_init(void)
 err_nomem:
 	ret = -ENOMEM;
 err:
-	kfree(soc_dev_attr->machine);
 	kfree(soc_dev_attr->family);
 	kfree(soc_dev_attr->soc_id);
 	kfree(soc_dev_attr->revision);

-- 
2.47.3

