Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060A6392B66
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078874; cv=none; b=rugRvVUYRlqUQRjVlKUfaODe85QsJ8mtkSzWEO+/gdA3s/vBE3xS7I0OAe45RXUB76EoEjxlSdZRjkH9tSvyDs5IFytanH8dqxIHDApr1gurzDZU4q1mUlYhnK2QV8hSi/WzrCOmbFfyNRqQfEgftzLE9Hb3LXs1XwoC26rUd18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078874; c=relaxed/simple;
	bh=I8Vgu2r5M8y2he7cvzYIotPPGMHAHXOfqg87h9oOn/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbf1F4xQOIpjnZ1MIJeFApOZv48xKT1HZLgxMJ3XUMQR4xSXoWkU0OsrocCXSZQ7FkIOQi3BSi9/jbMhzTuEvgaqn/jH53O5UwV02or22ss0Plf0ydtWSytIlEHzHW8m4t0/IuusSJU3+nRGAb+shRSY6r9i/tlBUSvqzuu902A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9GFPg6K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlSfIPpw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9GFPg6K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlSfIPpw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7Wruo788967
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fn2DLbllwBRWCyP89p4f6qJZOYmaYmMa0wM3w2CVQPo=; b=P9GFPg6K+o4NQaJT
	sz7Uh1WmDz6hOXq43d+1iZ/omCGeppt6pV+gsaCvkkJp//2T3LeabmA8/1cw5RVQ
	oNCaZjNLl0vOPxtgtVz4zv9DhuJ/DJkzbiAm9ciCsxe81oE+qgwxpC9F5fm9M2Lq
	axnDugCqa5CzJjcI3hsI2MzX+Du2R27fQKYuX9Jdxf7wXtYeXfIR0g4Efc7rMGB7
	wMa8AIP7a+G4OFK65Ff2ql+iFRhieN2+jVv7CQyY6k0CSPIsxMgy5+wC26pJ5KkT
	opmnBSfu+7FRkmK/XQydkK8mPHdzJfs33cJS9MGGGtoIuJOGk2Gqv7PvfT9mJqjc
	NpYiyg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6p1j4pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:47:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89475e062b0so24281316d6.1
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 02:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078858; x=1769683658; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fn2DLbllwBRWCyP89p4f6qJZOYmaYmMa0wM3w2CVQPo=;
        b=MlSfIPpwUKhLxrjHqeAMy+1rmy/ndozJ6fBBpeALGcFB6SRAEAA054K8902moEyukR
         aHNCu3DhodKulzlfqfg85IyOsh3kFxdle6BDKkb/OEYPycgy5q+lotTklLTQmYLwahU4
         oQkNSB7r2u5sGBGmxUcrfPwYrBc8c/go3Ei4O1WC7t11/Vtj060/yfJ8lUoYWfGEMiRE
         YdbHXv8kRirawOiYqOvEODeZZWA85gqit76GX4f9rM/Jct8KNWEEh6aKODrvvZkLgtHE
         QCYH5CVcpl1I0J0QVM1BzosRla8NFJRI5bZdenpZbcbuiLg9ZJC6WOlslXcM9cijovcM
         yQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078858; x=1769683658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fn2DLbllwBRWCyP89p4f6qJZOYmaYmMa0wM3w2CVQPo=;
        b=mtD7ZreTM7xahIdhskG5dMWWVcQexRagJJnol4ZJ/fQI3D3rxWKlscOPd98+DJ9Udw
         81VMSydV6sHDz/O6yJ2iVQ3XGJVd0MiDYot6CUuqrG4CQ88c95qpstbrsAShtSrfoVat
         4rC2yXoq++49ZEFtpQPsBYCyvSJTT+rAFgPSBNaMCqcicAqlntKuhBRrOCqa1bnIzeiU
         7zB5YZO5N9C7Cz+/dCLg7+sXHRj9kiNCSz67iX3j/HUOc4lp5EcmJZdLI+VMMNEVH9XW
         gbhuhRm1kT6qwzlodkJjS/ZB0yG4M+lG4Ds82+kYYJ+F6NrlwBs2gOvR75wcNn7UdNsm
         MapA==
X-Forwarded-Encrypted: i=1; AJvYcCXp4ggwVaVN89aUIosVwUireg/FUwG4OOBbJitlWVt51jWSC3gB4LULH1WTRrlet44Ymx0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1UE+UAIXSBX02pMB1qcZaLgz0rnXK4dbxJSZx5j+LrDQLpkWt
	mrrS2bUnvhsMliA+1ibPTBCo9G4k+pAEKu/qYrqSL2GPwi+nra309V0o7MJMpaP+eb25XfWEnFO
	AOd2jUEAzNSMz7jV9CMvX1EmAk2Tq7FBdzt+zkylQY/mZAb/DKhZ1pwo=
X-Gm-Gg: AZuq6aK2aUmUnXLSWedqeejWuGymY5yUsP6ufkN+na+lrXAhNuyeMqCwUc3l9kyhjbX
	9PUpZ8z+xbdAJxClGWAZeeKIert718moCz06TyKPagZcHxblX/e9Q/Ke6PAvH5UQ4sjQfIPkcWY
	+BT91xmoLQ8K9HkOnsVbe2WB6wXD11dlUjwpfrmyL5mFcP+fZjYySpyA4Bf+dU1lu2XvamPcFez
	ETf+hYET/fn/1Vvq/gpFPHnoLQNQ73YUv5quQ6Fowa+hg2zpI2y5ZcFXhXNgKKseeaqCDBaWJh/
	FBwiIDDq2J9cKr7ciKX5wCeEy/a4+Cb2/Y2695QssZNU9cykcJOW8Hg5Vugbwe+OLiwVTuaBhEs
	rqJ/VtvrUwS0fOG7a5clQDPPuRHy8IElGe1Y/DnxaCFKlEBwQravY9U5hn9yiN1wkMxZfczeM6g
	==
X-Received: by 2002:a05:6214:495:b0:880:5883:4d23 with SMTP id 6a1803df08f44-8942e2c8ca5mr306938806d6.16.1769078858036;
        Thu, 22 Jan 2026 02:47:38 -0800 (PST)
X-Received: by 2002:a05:6214:495:b0:880:5883:4d23 with SMTP id 6a1803df08f44-8942e2c8ca5mr306938546d6.16.1769078857539;
        Thu, 22 Jan 2026 02:47:37 -0800 (PST)
Received: from [10.111.168.218] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89468d65eebsm47770826d6.30.2026.01.22.02.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:47:36 -0800 (PST)
Message-ID: <613d77cd-1ccc-4a5a-9090-ee4d65d3e4c5@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:47:27 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add CCI and imx577 sensor support for Talos evk
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FPMGkulEadvPFk3F91HNWB1xNeMx0YE-
X-Authority-Analysis: v=2.4 cv=N7ck1m9B c=1 sm=1 tr=0 ts=69720057 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=BqitQj2KRPiQZ0QKAcwA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: FPMGkulEadvPFk3F91HNWB1xNeMx0YE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfXw+b2jy4MZtNr
 4FsELQMxwwEJ2/KuqAWrj+yG8jabtzdDJZUSV2QVARY9S94FYImJGEV6nzUSBrpnVJymOgGIqnf
 r0uMEhhYecyjDXSzxO5oPAxsGcJw5XjREPfwbzqkN1VFnDeTZqIF082wzwETzSvfgMBHZagzEHR
 fWYS5JKk5T28y6/9Jz+bOmDYEs1JDmjhiVz5x9UcfJbFR5Q5A/U7SRPnfWAzPomheqg1SDGxrZP
 HAy7WUjTc0zVhZYjre7X+Ty+WrZuCddn1kJWqoYajGLzjaX+9QaF+MqWSDypBIeekYlq/Ul+BZy
 /t02w/1MHoy2unZ3yacISyCB1wKWqvb6WF7O/i7FmK4kdV9ST2W1OIvKFy4FDPWCXp4EviIl7s0
 /H3YC28xU290Kl+GrccGRQFVlufHwsmYAyEVRKJqwFXrYROBhmP1lAOY13gZUP4qjVQVreNbXNK
 Z0KXRazd3sYhNisswSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220077



On 1/22/2026 6:40 PM, Wenmeng Liu wrote:
> Talos EVK is  based on the Qualcomm SM6150 SoC.
> It lacks a camera sensor in its default configuration.
> This series adds CCI support and enables the IMX577 sensor via CSIPHY1
> through device tree overlay.
> 
> We have tested IMX577 Sensor on CCI1 with following commands:
> - media-ctl -d /dev/media0 --reset
> - media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> - media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> - media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5
> 
> This patch series depends on patch series:
> https://lore.kernel.org/lkml/20260114100043.1310164-1-tessolveupstream@gmail.com/
> 
> Changes in v4:
> - Add CCI properties to the existing portfolio. -- Loic, Krzysztof
> - Modify the incorrect dtb install configuration. -- Vladimir
> - Link to v3: https://lore.kernel.org/r/20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com
> 
> Changes in v3:
> - Add generic names for the CCI clock. -- Loic, Krzysztof
> - Split cci node, removed double space. -- Dmitry
> - Rename camera dtso name, add detailed description. -- Dmitry,
>    Vladimir, Bryan
> - Add dtbo-y for dtso. -- Rob
> - Interrupts cell change adaptation.
> - Delete cci sleep pinctrl state.
> - Link to v2: https://lore.kernel.org/r/20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com
> 
> Changes in v2:
> - Modify the CCI dts style and commit msg. - Konrad
> - Split mclk change as a separate patch. - Vladimir
> - Remove clock-lanes. - Vladimir
> - Add mclk3(GPIO31). - Vladimir
> - Link to v1:
>    https://lore.kernel.org/all/20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com/
> 
> ---
> Wenmeng Liu (5):
>        arm64: dts: qcom: talos: Add camss node
>        dt-bindings: i2c: qcom-cci: Document sm6150 compatible
>        arm64: dts: qcom: talos: Add CCI definitions
>        arm64: dts: qcom: talos: Add camera MCLK pinctrl
>        arm64: dts: qcom: talos-evk-camera: Add DT overlay
> 
>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
>   arch/arm64/boot/dts/qcom/Makefile                  |   3 +
>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |  63 +++++
>   arch/arm64/boot/dts/qcom/talos.dtsi                | 279 +++++++++++++++++++++
>   4 files changed, 347 insertions(+)
> ---
> base-commit: c8a4a774a9b0d2c86593492625874e27e9cbc9a9
> change-id: 20251222-sm6150_evk-8ebed9e9f3bc
> prerequisite-message-id:20260114100043.1310164-1-tessolveupstream@gmail.com
> prerequisite-patch-id: 065fda916d7faca61113e1230fcc0ce3916442fe
> prerequisite-patch-id: eddd1b1714715707d386608e4f9b24396f51cd44
> prerequisite-patch-id: ae777d7e17e32afc36fd1f741bb57ff0d3556841
> 
> Best regards,

Post the version5, abandon the version4.

Thanks,
Wenmeng
