Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D725730CDBE
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819254; cv=none; b=iVO1kJnbUhIMVXH0XIqs/PVXm4sTL81i/AxgnF7PwxecqqOy4ZDte+Xiill3jW3Y5Ecbf/Ex+TeOnVfaInQyr4zFS/XBfVPqxmG6llZ5ovmPPh26/cvGGYCJCwgmG/Pc9cRK1rFnHem5FhoNzZEbVO/aSnVAQxYmMn+IXyi8GB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819254; c=relaxed/simple;
	bh=GKVObXCXNC12fSCZyvL3ryQ6x2vBtI3uuvqrxKyzc6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=soow0r9A1hzZSRY4cBtKH5hcsdS5d1YZeTOQauiQqjfOy1+F//tdZcjHWTze1EbP3ZHCX6k07vZjidR7y8bwUfpzIAY2ByE41K/x7gI2mVVhBZqFyVYMArRZcTjGJ3C9wjxyXfpoEs44nSpmAnkNkfBfPW2yGr8uFmYDojLPz/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfYRj9j2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQq/XqRi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfYRj9j2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQq/XqRi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91LFn748470
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmrKFcesIbotTnCRANAIBkDX/JXuIv4RRLQRelQDe3E=; b=VfYRj9j2PNJX0xTQ
	LS8UojMeyGf/yFkKE15ePZh5QbzcuBMbCRXmrRZREehh/jduTzkUmLrIW5NwSjGY
	le2zU/rE39ze583tqUYzOTOKOfb6xKUNz/luf/2modht+drwAbuvPlMN0RAvsJlq
	7NrfmmMYIKhxeKe3xXmy9MuvIvR9/yF+GDEeh9+o8lfP+dKlFFYPh/5hO3wG7CkL
	UdRzl82RGls1uthJ8VO/55NlQyLreT3avHOgrxQ/LAxTsb+jqH0xTmjbyaXAy38d
	nyCMkMPm+Y3hkT+e1SaU3uBB0Ms8ynduzh+TunPZVet9OzWKBOZpUq+3tCRWsVX6
	kxIV5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t74qnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b20137a6so475661685a.3
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 02:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819245; x=1769424045; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmrKFcesIbotTnCRANAIBkDX/JXuIv4RRLQRelQDe3E=;
        b=VQq/XqRiNkH0vOuu5bB2621b3o8zScscgrIG91xyV32aeu5COREy6um91Sb1/+mKKV
         F4xKqtkcwJYOA7D2xkGAyQwGFQEycF4OYyfo5q3DM0DlUoDiCFnqntH4e0iU8vDV/D4w
         OQPHqXsiVhY7JxxBS12X3J5cg1Lgn8xkl8fw9rU/GfjGBo3ox6vqznej+DHBNA0j4E9c
         SlvilbZNwsdBoOslYcppvDv+l/N0qTdCJ/tXA7mi7v6ZBQ+rWPrBn5v/rlXLlwuEev/I
         RM88nOVIdWRuysi2yTxU0x6fBIIcEliKJ4WkIeIRKey0BIgraJ64f6Vsfsse2FuIp5a4
         Ei7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819245; x=1769424045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AmrKFcesIbotTnCRANAIBkDX/JXuIv4RRLQRelQDe3E=;
        b=OaiNpvrNO7/8Q8f7tATVb9b/z560tRskCBPUYPaPLlGDM8A0F7rPSc/jRbbFqxFOo2
         Dv8Cwo7jklcLu3HX6DUx6Fs+l1dqv/UURUKOrqrqzWtNKqeT4O6Rd2yEPlpsSums0kAl
         wrOiSZVx1tTHDXlQsN/WdOfnOxrV1dKz03snS7tvxTmFz+LSF7XuRmszWkXQu43OPlWD
         OjSw90JHys+z2l3VIVkXEOc4jve+DDbQZdXdDiGvAStk2IPjYe9ypyuEzhmAfOye/HXp
         csjLCRrE7eeZMXKETWzlL3Qi0/3vd0POGdbcH/Lh+LkBAW55U0z0uGsn83ooaxfnYhQU
         +TkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbgUVN/OouFOS9S3zWW1+6+T29K4a01vrJCx8Y/EnHBiHoAkSnD3HChG2IH/NtRnrIgAM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsxkH1PlEWigvIX+PC+Es171WYYHEiQcwSmO3yP8J/piBhgZzW
	jkh03klBG7ZV2c1zOMQHGt7SOvKbZqxWWzMuuYqo7Jw3RiUestrnqsueEwoXnulNyL6NXsbsLLP
	D0FSDOTJ9xUOD0O8o+39Q5zOJ3Vvkh2kczY8zqQIwP2D6Xil7qnPNbyi1IzZkFNI=
X-Gm-Gg: AY/fxX4KVMU2KQHyBmm9qqqTuUFUoYCqzJ5YN0Zhhik39XthAWY3en72c6HyhTppXKd
	bOK6LijWd3dUj8VPO7yJI0frCKrEqOx1mm6esZHnUyqsc5lW7uZmrOiknlIvSosZvksyT5oeBtV
	HSqZm0kjt03XFgTwpZpl/JUIIL1+1szH+G/LGmAsPKD+AfdKPkKivACtW2Zg4rbKPzRNNnxVEd8
	4AUYRQfWyhov2v9d9xUygEvZW9ZJOtf5I1U6DwBwea39jU0Vc0b60Dbqh/fJH+qZIEIsfUfWsf6
	YB1HiiAcUSnA87Md/9z1Csw5sOiEIiOMmxBmswnkiZkDy+k42wcLpFj6ZCSt9IOHGUTFxl1yEVN
	pm7cEzVB2WWRpTiP5AZ4R5Wnp0BH8lFT0+w2vFqLM
X-Received: by 2002:a05:620a:19a9:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8c6a670cd8fmr1467498685a.40.1768819244847;
        Mon, 19 Jan 2026 02:40:44 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8c6a670cd8fmr1467494785a.40.1768819244181;
        Mon, 19 Jan 2026 02:40:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:19 +0100
Subject: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
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
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GKVObXCXNC12fSCZyvL3ryQ6x2vBtI3uuvqrxKyzc6o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgod2Z0XeYN0hebAo6LmFskYdjL5FbX1EGXvo
 I3KG/9vZDCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KHQAKCRAFnS7L/zaE
 w6ynEACXUgdvUuKIyGdhXbkqmx6FYZmuzw4u+krC5x/9fU2AvfjEdoMGWsMBlbEfRgb8SD4b5Ey
 Wuk9beTVoujuYsJqtMB1kexe1ve0+ibT/ooleUNc574lFxHYDSAqFuhAcqN9lgVdJUqOL+I92Br
 IJndTOD1P84qPpzERNqfkix/k060FWZcyag6YVcDrgqR92RpHK0gokao/8AZbM+LiWbYf0CHM6w
 MIHSpKSjUgILEVeOGjf0JxqIUr1dbCQXtSY98u96NAqI/9XPeaeMbtTKG89yy3qeoLN7Z74SKGi
 05pwXG4l190xK/MiT/QXVyMvF9QMobxWIRQDdIAIh1VdILHSz0EAJU17fcMWldP95oK4zDsySzn
 tSyHjzvsArXa7WK8c9n7Z95ENQjXS6er7i694Ud9TjbSOe4gCyAX0cHLeWKfY42YH7f/0095ho9
 fz+379qIEV2Bu61EjCTt4S6FW+Q+pVfvnWhYI/Aml8gwbZRnnMouovko516RweLmcl0PNmQy75X
 8a8hHzKrmq9n8wWa+anMcuTdNX4YXMjgRILsEiuUaVLEz2PbxUcRjVsyO3yjLdmG8lwNImohj5p
 lU8lblx+dpgKKq6LdGtiqKBbciQ9Zp2iXfMqaiNkNyIGdlzIsH+r54p+7LWdt8MjW7ZxUNs9/U0
 SY+metMEW2Zh2Hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696e0a2d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GnGDLHjXiqABGLigSj8A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hIPXXXWYJzLDAFMmPYE7CyhwcB8TfYGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfXxCR+4qsECXHy
 Ax1NaAVwcjxFdmifGrkuhBu8ZQN4Bt0MqvCbTiYAqgsMigiXkPjynP/sPGLjBDcpYQ81mQDOsCB
 Ybc6vu/hZr7ZzEkeS4cL8SGcEsS/UTNadFN4hMkqsSNjDEkNx0ZvoxisA72QEKprSCwRvAiSxJJ
 z05O2JsP8hC3UcAHI7lSGzmhkrEzrxRzlHLTfCiSan8x6eSoIainIkI7YIhiPGo95qBnlL3XqTt
 q7p+FaQvtBhozyNAvsIpBIgUzjL1b3C5A0TnpVINeLuOjzqSZiFRp3JKFHeEw1LJAa/pCPQbDrq
 9gStqLppP+h1Io3LHcF/FReF1qEkqriq77kbhxKP7Z2CHGvYh6amDXBNwhnUztDDqQDi82gXRI7
 ithsWPb74nthvjLWf/kDJQqSeOj3F60zTZQQxYHKFUDxfnI0xmImUG2tCcmexXQKKhxgH9iyr3I
 /34Vefbx5D+kbJ4YLqA==
X-Proofpoint-GUID: hIPXXXWYJzLDAFMmPYE7CyhwcB8TfYGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/sunxi/sunxi_mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbus.c
index 1734da357ca21b249740e089698275507ea98a8a..8bc5f62ff258837d3f3b30cb84b60d1872b31c27 100644
--- a/drivers/soc/sunxi/sunxi_mbus.c
+++ b/drivers/soc/sunxi/sunxi_mbus.c
@@ -118,7 +118,7 @@ static const char * const sunxi_mbus_platforms[] __initconst = {
 
 static int __init sunxi_mbus_init(void)
 {
-	if (!of_device_compatible_match(of_root, sunxi_mbus_platforms))
+	if (!of_machine_compatible_match(sunxi_mbus_platforms))
 		return 0;
 
 	bus_register_notifier(&platform_bus_type, &sunxi_mbus_nb);

-- 
2.47.3

