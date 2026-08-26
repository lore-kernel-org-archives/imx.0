Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02F33C0611
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739923; cv=none; b=qjpld6hJAgrhkeBS460ww9qgTktjHkLf4iE0nvCW9ZiclW2wa+5Ogbf35B4WVKHsIj4IeMsb7SYLC7eiVdxtCVDrvU8ThHOLk+fC67FnrchlsMt7KpAXTicuaum7qsDT+u16BHkZ5W+OPv2Z06FuBlzklYVTHf66ziHiXyUItc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739923; c=relaxed/simple;
	bh=I88GN/uYqwVC9eoo9jy4m+SRM8GxwidDpaTvvPqK1mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ruk8ymq377RgfUCbeQn1aw+WE9upP4aP2Egg/3Z7Yk5Qv2Oywkmer6ljqrYVZFwRItMUOXBthL0LzwQodSRugTy2kuh4ftr78aloWRTmVlj/KJGdV26VrBTlSVUk+VbXkERhWtlh+gqixIsaewYa5PraQsNMzb6NX1JVqDKJ69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VB63ATLQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLownYED; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VB63ATLQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLownYED"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH5oQ425211
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJO/trXKlZ/xBjAP/7wuREYwh1l8M0R1QYvRGNz9d3Q=; b=VB63ATLQh1rIxSTK
	34aWxsiZ6QQyZOXcCfvXu+ptD9QteLtPIarINOeBNbLNhF8cCKu6KviKlqJoy87z
	+yLzBqOKXLVdXbMlCUeS7xk0tjcB5brZTna7RM1bOXBpHiaM+8atqQTrksJtrJLZ
	6uMzb3t+Ym1kqQyFM9GkOZEq8VZdbc6nvnAmWZJ7Gvl7AZzeHa6Upp3bHokU4nUy
	smit6pykgqIh5gKKpyObaJAVRy78b6Wl/jpLNVsnh9pvASSsi/BKAYPtWltu1jca
	P6uWaZQGV3dp2M+3zNdUOneiu2UAdu9T4FaPssbiQdYiPe7ChK7xoxbZ9uuYtvmN
	pMAU9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceudbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:25:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so1618021cf.1
        for <imx@lists.linux.dev>; Wed, 26 Aug 2026 03:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739917; x=1788344717; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJO/trXKlZ/xBjAP/7wuREYwh1l8M0R1QYvRGNz9d3Q=;
        b=TLownYEDPAr9e61qoVgxLfw076ql8Zg2jHPye+ue9skhkv3wldzv4C1Pd5T9EP2LF3
         m8hKikdlKtCznqL1vT73MEoObn99niUm7BPmNBH79VRypB5EqCaysHckiPm+861i+GFJ
         vL29x3zWxggWON9EiyE0Jm4UsMHC8rB5TD+soT0bgkDUI8RBUbWkvthCECN4alxVwr4Q
         iVQjhkzl0BXhba4i9kfhib1elS/oDwS/v/xL6+67d2JabsIGtkmCPwsyLG6p895H2dvc
         SMFcpl5vyLkAk2eWUGsblWjHQ/W3c4No27Qwh+Dn5rvoW9Y5Bn1k+4nuY21t+7wOWxqH
         WNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739917; x=1788344717;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJO/trXKlZ/xBjAP/7wuREYwh1l8M0R1QYvRGNz9d3Q=;
        b=aw7tR4Dtb+cUpz1AvL3OYYzOwbIW/dXHZ8vFnwNasjLEzJhZBjTWs6nRQ6veQ9hiyC
         RsUhFA93hYA5VB72Lh/VJnQDiwKSrj3D0i/vEsMytP6P4LV4F7IQ+378Me0hxeGIlOUk
         IhSa1VYebr6bEF/7QARQTKwO3AqgvR3BJtu/EN8FsIF5c5na05A7K2I/9Am2QNG42M9u
         Rvatc6GlCN3Q/7Q8kqDvXz0jOH0NiyJx/0eIBbQTOlRUzvV3sVyQscchtWJ6wjmgmRcL
         FvjIekCdcmpSKzsocIMPHmuiGYq+A9fQc4u9Ch2+DDPr9d9JdtB4wv0JWRJWK2tW/Uoi
         P70w==
X-Forwarded-Encrypted: i=1; AHgh+Rp8nIiuWtm5qv0/gnyLcUXTgWKv8Dn7sHdjVcQUxePFQ98PToDWKoxbEsVdOxaSaDpu+G8=@lists.linux.dev
X-Gm-Message-State: AFuF++lkIQdWbTa6wNsY2OnSGvZhK+5xsSdG1xCyKPLArbeXdEGNBaXo
	92GCFLkWhqDbhh5vsU4G8m++uevcAeXGlR8XXT7kLGy9INSfBQSDTLoHRzhnSZrKyBQXnJsMR6v
	YVNsnsliGFbpZmagkLv+npbtYp4VqN7586rtKzjgvD8SAE5vMvZitIJU=
X-Gm-Gg: AR+sD13Z2wQ2XgEdV9YFY91oV/Kt4V//6zljDF6uBvLTc2IIU7E6pssJgTPAkIIBvV4
	eYwrUnrTz6or19xIZDFXZbzG6CrVelq5K1hmxaCdRpRCBslGtG1TQUEeC4YsFrqNKeIvsXd9D6X
	hjvmzTlPkRZxmn4l/GAx7VahpD++ypGv6q+Cqz+jiHEPOFnei77pYTRGBB8dniGMLNMQ1+WiEVV
	HTKTCA/xvh1K4cyz1nVdMllBfV5WsKoNrQuCREf1NbxgfDsyNKp/iylXnnGXEEwxaFnN5SRJXVN
	5JzDjwpDtXHHZTa2ZYCTNtt4BWA+WHD9/HA//nNcQ/p7QQZzRufEo2FTUvEhZE6I1EtEt2Vxybe
	Ns8neB34DUPSGFamL/KZJgrVh
X-Received: by 2002:ac8:5d14:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52e42446072mr39442121cf.5.1787739916912;
        Wed, 26 Aug 2026 03:25:16 -0700 (PDT)
X-Received: by 2002:ac8:5d14:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52e42446072mr39441781cf.5.1787739916424;
        Wed, 26 Aug 2026 03:25:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b5e5esm3137249a12.4.2026.08.26.03.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:25:15 -0700 (PDT)
Message-ID: <c61f297e-3a42-4b23-b341-0f8d97d4b78f@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:25:12 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Frank.Li@nxp.com, andersson@kernel.org, bryan.odonoghue@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com,
        imx@lists.linux.dev, kernel@pengutronix.de, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, rosh@debian.org, s.hauer@pengutronix.de
References: <1ef41a49-dcf8-4252-acdd-f7f3c1210c55@oss.qualcomm.com>
 <20260825111300.578054-1-hongyang.zhao@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825111300.578054-1-hongyang.zhao@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8ebf0d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=RF00TdSWAAAA:8 a=CXY4OXtTAAAA:8 a=EUspDBNiAAAA:8 a=TEp5gEa_GWzzUIBBXKoA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=_nx8FpPT0le-2JWwMI5O:22
 a=-bjYFdKVujGyJWVmPOR4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX1kaQd9LhM9vv
 CDiMGLtazb9yCKSBRs6Qpz1gPD3lJV7WPPuTijMtt8yDivnkU80GtLVw/ty0pvO1xnptTXMVVr0
 5cLs/vFq/MSNyYUAjSYehMaj/sw2PII=
X-Proofpoint-ORIG-GUID: cRDFiZgRny9Q1n_qPgx5iCrRtdg4-y8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX1ZqYCArekEXv
 AEYWOwM5rLWzmndtuuoyVkwJ+lrBt24g9NI+9yilHgiOCZzIjH/AWaf4kmEF9FpkEezwL6l3zKd
 xvG3VonfSfzdydEwrT+//0vo0zMlPfpmgkWqno6H54wNx4RbvsbVnxJ4Q18q+eENySJSb4+Sdb0
 RAX/eClfKbxAHLrdoYWiTTf5mZpX3/nZQOpCYnDOXTbXLkEJw0JE4bJHlqrNBSmIkOm70T7xzI5
 fNGgXVrCYZIHQpRSFz87W3nnIkASu/hisX3gssWbio/ZveTuI1n99PU4TxmcIH7wwTvUFupl2z4
 vXWM6AfpgAw3H+3pCf4y6eXaUQLSS400ROktvAIP4m2wq642xAG9XhTsxjmTY00WnDOACq/q78L
 wpYgSWQFqziPLmWz2XX93FtgZtphQaj5mqYzazLYhzTo4i/XHQoMxb1lVZmatfJRJ+D/occ9Lj7
 KXJxQK8WhyHf49m948g==
X-Proofpoint-GUID: cRDFiZgRny9Q1n_qPgx5iCrRtdg4-y8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

On 8/25/26 1:13 PM, Hongyang Zhao wrote:
> Hi Konrad,
> 
> Thanks for the review.

[...]

>> No reset GPIOs?
> 
> Yes. The RubikPi camera connector does not route a dedicated sensor reset
> signal. It exposes PWR_EN and CAMERA_GPIO, but neither is connected
> directly to the IMX219 reset input when using the official Raspberry Pi
> Camera Module 2.
> 
> PWR_EN is connected to the module's ENABLE signal and controls the
> module-local power supplies. CAMERA_GPIO corresponds to a pin that is
> not connected on Camera Module 2. The IMX219 /PWDN signal remains local
> to the camera module and is tied to its 1.8 V rail.
> 
> Therefore, there is no board-controllable reset GPIO to describe for
> this camera configuration.
> 
>>
>> You should also have a reference to the mclk pin state to make sure
>> the correct pin function kicks in
> 
> The Camera Module 2 provides its own 24 MHz oscillator, which is
> connected to the IMX219 MCLK input on the module. RubikPi does not route
> a SoC CAM_MCLK signal to this connector. The fixed-clock node represents
> that module-local oscillator, so there is no corresponding TLMM MCLK
> pin state.
> 
> The Camera Module 2 schematic shows both connections:
> https://datasheets.raspberrypi.com/camera/camera-module-2-schematics.pdf
> 
> RUBIK Pi 3 schematic (CSI connector, page 13):
> https://thundercomm.s3-accelerate.amazonaws.com/uploads/web/rubik-pi-3/RUBIKPI3-IOB-V02-RELEASE.pdf

Got it, thanks for the explanation

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
