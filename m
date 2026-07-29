Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E038347ECCF
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 12:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327244; cv=none; b=tuoThWse1FnRbwA9x/oCXPumQL2T5qHn0qpp+2LnMe8iaGk2EE48uqMugCuGjJu7eoJUWEGm0qnZuYOkb9YfwgzN+2SodwM61vlDQpAg1Rf+hB3GnFzGETVsqQi0Z+d7UJ/QjAUtHVoI+mx2AZ+NQY6labzb/0VQcy93Eo58wmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327244; c=relaxed/simple;
	bh=G2rkEs8akPM2eJzvjsccdszXEL3DREHjcav6WAxVlpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5SjyF2okzNrmb8DJ6f71LhxX82fFsIGoXs9R04cXkjh01LjyLo/KIEDtH4Wzk6ofYYjDhjELZnrkRHAUb2kVxs51F5Vl005Itb2OFHy0ZXU8xPHo2fQb7TbvSqHb6F199fU/FPiGk85gqNBdMfkyEyD678onNZ1YeMXj4WCU2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgLNBW7f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXWjzKIc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgLNBW7f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXWjzKIc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBvogU1929499
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 12:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txP91yukZ1kQoDPyCm+pb6K7MyO5UEROTQQMIQ/rjYc=; b=AgLNBW7fwOpRdhYN
	thPVmCuY+/NSDyCtQ+z9KZPZg/55tjnmjuJYW6zcgEgN1oosu2dU/PFnDCymNRBb
	ADca1iwhuqr70L4NJt3+/bNZWcmYXNbK09xHQr8QDs7XMwdgHvn0SYGZtX6ElFLz
	BPawdjjy7Kf2A/moIay0L9hoQa7k8e/ffdYz2iUdxJ4HnG8h+vFRQEqa0JMPKYQg
	V8xZNYvTF8vfS1zduIUpXo9EQi50hdMtsqcuKr6Lrktscic/Bf3S9noR29nCS4hA
	nSuyo/bQO5guSzVkCiE0gYAqI/Uo7z0+b5rQtPx8HSYBQjL0bQ6Qy8MUQ6bwy+Fq
	ilHaZg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3xg1y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 12:14:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so724661cf.0
        for <imx@lists.linux.dev>; Wed, 29 Jul 2026 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327239; x=1785932039; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txP91yukZ1kQoDPyCm+pb6K7MyO5UEROTQQMIQ/rjYc=;
        b=YXWjzKIcymahvYxM0A8pmV4B6JAtjXb4ndBI8ClGcJCSHPAEooQ2cNzooZor0QKvfW
         PHw8kTfCD/seKdmC16ZDtTN7xXEFOiaIj/T0y4ZmH7hnMBytGOWFwTkY6qL1zIvknNjY
         bXDLkIwmr1+FSD+Hm8IHtTretnoI0N7TojvwHSjhVTS7AQ63Ufga2gnov+Q2w/MO1295
         JVL+VF9ox1jAYheKC+uP1Du6RlBCvIY80RYZ8hGG6KGLhPvUJbm1CtJ7GuSIKPDh7zjY
         Fl0rqKyRubBCzvUqnkDg1SsTTiZduaBbXVFVSz5J7CBEYaP7FgWDJ5EtNO0rAZcz639H
         i4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327239; x=1785932039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txP91yukZ1kQoDPyCm+pb6K7MyO5UEROTQQMIQ/rjYc=;
        b=Scmxs/EelJ4IspB/aP1P0QZlykvl0FXVHrXdLRj8NU/OH092Eat22DXYEIIloTRmF8
         CbONtfE0fMNFqAz+e8DQFWnhPGdAY/TEvE2fry1kFQR97+eR+3UGeffao13O9bzqnOUu
         UEQxBxxq1ar8MRGXGLvo85Ax8y+Ej3i8ExhCsDs2x01ttoDwC7pPWD2r89L0h8X3PTCP
         coEnIVTv8eWaO8HunMTVpl6YiqESrWlYTyWGbD2aQyZP7YApnD2/Uh9glpRvpDG+59r8
         Ch0a77bjPL/3xsoLkdiwGal8/ktlWriiV2Vol4gQ13TI8cLDtA6Mt6DxJSdlm9WMMDw7
         Czzw==
X-Forwarded-Encrypted: i=1; AHgh+RoEjAAMXxQRDZhdnLPXTyQ6auY1oPXrO52/OcyHbIm3GfSOQZGTyrajCloDZ2C++kf2qRg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnFdoEOvMfr5fYpyeDovWV9J9FrOBk/kSwKpKKkfs6pdT/xbtS
	3dtrDqYhnG0ActlLqlpLfI9ifOzV17YFMUN2asT1CaSWqwKIgJy84HAz7qrmJ4yIhmblGUeUmGi
	V+EIWPum/oCzFZCycIUsgnf8O3En9gQV/58viHMIDbyaZtSes6ryrz0s=
X-Gm-Gg: AR+sD10WtOtuGrCahYvkLQcjSH1eKJZHs5g7xTGjCTShFM1SgOY8Uzle+2wa4R90wpH
	VOE463+5HF8apOBikbLZdpCubUn9bM9hcnaafGCmUK2TOJOLed24/02AJzmGZT0gx5z1mg3kJyA
	mS0/4tWaTxtgbhwXDT/Hss+npZ0GLyab/EtX+IA0J7z/ICjFuT3/50qACeYKk83HEQ/ryDlkgUV
	I1aCFx5mt1UWwyx9CjuirOGjohpRU1Ql838VCxaoiaTDUKsA1PG048OkV9ijUUpJLPnYEpYRB51
	xe/Om58SuPyUkcXg0QgSJa2JM37H0womEG34qhS4IxmxXBMDh7Dm11AOSNPmflCuFB4sff4p6B8
	ZM0DkTmnijWZIAkMrHBF3yOK5
X-Received: by 2002:a05:622a:aa46:20b0:51b:8543:cbbd with SMTP id d75a77b69052e-529d6f6db71mr44778611cf.1.1785327239007;
        Wed, 29 Jul 2026 05:13:59 -0700 (PDT)
X-Received: by 2002:a05:622a:aa46:20b0:51b:8543:cbbd with SMTP id d75a77b69052e-529d6f6db71mr44778141cf.1.1785327238610;
        Wed, 29 Jul 2026 05:13:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cdf452sm106406166b.14.2026.07.29.05.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:13:57 -0700 (PDT)
Message-ID: <df03eb18-6928-453e-971b-681875e9cb0d@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:13:55 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
 <20260723-rubikpi-next-20260615-v2-2-47c5add80114@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rubikpi-next-20260615-v2-2-47c5add80114@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfXyJ6hE83OtJ2Z
 XFiCj27JZ0kQz1/vdA/i529spDwpq6F24a4wJ8NaG74OtExxIWtzWN7TJPw39w1RY8FwTvwRf0M
 1d/djG7yk/2MfCLunlv8DWc1im2hsrA=
X-Authority-Analysis: v=2.4 cv=Opl/DS/t c=1 sm=1 tr=0 ts=6a69ee88 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Wdb1h0LgAAAA:8 a=cV_IwbTCVfHGfDX6aFIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX/6EAHwVEsAsW
 gDO7CLUPBW0JDaZdNgE85RiSq7VBa0lw4sLxUqJ8JtKmdjWbFliUA5h+v+vLz+4UybratopxZCC
 I7M5+sP15rNAUAk7AreoPydOqEu5wC0fhyK09on8SFGxGP4oVUW7Zs3BkeU+JkJk9z2gRMg7cMG
 oz+j97fNgZPIa0EbTU0TVrlzy4MnXlj/zaEJJk5P/zgsru+y3E4n2E/vIr6BZq9sTZGkVLCcc4p
 XbVRqu/HkuVurR5lgL7pJMNPu+JJu+Ymom04y/t09glOSYD8B7epWrPaGpK8/EhvPqRanR2K3nD
 MxaN0dup1S4kcRyLAFfA+Ee7mb7supD1AUWD/uHsWTo7t5AyFDTlrehlZFTdIQ8lIub+cfTSuol
 Ko12CBqO+ofUXW7/lxplqSy5RnZ0PBmyZA/vswILCmExRV6duPN5NU69YEWML5t/u4V8tqprqv7
 lbABCWyqzzNroAefRkA==
X-Proofpoint-ORIG-GUID: TSfhlqZlTUMvceDy2kHNU87cRRIRNpqV
X-Proofpoint-GUID: TSfhlqZlTUMvceDy2kHNU87cRRIRNpqV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290101

On 7/22/26 6:12 PM, Hongyang Zhao wrote:
> RUBIK Pi 3 ships without camera sensors, and its two connectors support
> multiple modules. Keep module-specific nodes out of the base board DTS
> and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> sensors.
> 
> CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> overlay describes the 24 MHz sensor input clock and the three sensor
> rails derived from the switched 3.3 V connector supply.
> 
> Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> and associate it with the corresponding sensor. This lets the V4L2 core
> control the LED while the sensor is streaming.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +	/* The module enables its three sensor rails together through PWR_EN. */
> +	vreg_cam2_pwr: regulator-camera2-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camera2_pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;

Is this (and the other) regulator on the SBC, or on the module (with
the PWR_EN pin just being an output to the module connector)?

Konrad
