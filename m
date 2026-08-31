Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF9C3D88E1
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167495; cv=none; b=Risabp3RhCBGJyDTtPkJkdx6yZNemKrC2yiUTOU5ggkFnIE7l6ddn0dRCjYY16OSPVU1M5F1fs8ZmBTGw/iYYdSlzomIuSlVf2YY13LyuD0GeJGTtZ/VEAzLdl+GoSAApPto4jBVZ4TIekrX6/TI6UhjM3RFeMJl3Ysp9RiZkj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167495; c=relaxed/simple;
	bh=wACfMGJ18cylwFY5eH2Nn2T6G6UKm6Fbj9mzSfm1oSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPOit2V9tU5BHvmHdzF8UmLibiUnIKsH4BZHvwHKr25+Biq2+8AFIvQTVnMrEC7tpMuyrVMnF8f00XV45fitRKWSBhdjQwJ1aynrQn3HLZz5ixR+JQdBaX5AMeARL10iUYAuhnwJaAgXh2qnOnYTeQXvcCKjdVox34Zxw6wDBW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3AV5lWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FM9bZURk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3AV5lWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FM9bZURk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xHK24081405
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 09:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOBwJphAd4cD2oSNE9q8Kd3iMs48r1qUtnTODQfgbqg=; b=j3AV5lWMlFbf9yBb
	kfH8H9fSkW5REqUOSF4Ve2qmLG0N4cSJSm1cGni1wylf/yAJo6ZO8g+qAiHMTvMV
	uHO7avN4YkLHUr6/y4hjGhpUiqpxG3dsgCx35fkSqCDgvEu/kk2I9FCvAluiHqIU
	639QDhdnXce+NTq+bpUoiVTbgq/Py1k/jft2dXt5U+CW/5QG1sDuXxEJvstLYdkV
	Jic6At52RCVj1R6lqoiwF33ZpWNNc7Pj3iVQ0bax8Z0RHjXsaMaD8XNlLn2F3XIb
	ccNBrgxdBWfWGNv2imTKFygKzrjgqCHdvzqjP2sN+J5h9OaYAdyfWFLLUBDYAtu8
	aRQWBg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h1wa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 09:11:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so40136065ad.3
        for <imx@lists.linux.dev>; Mon, 31 Aug 2026 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788167491; x=1788772291; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOBwJphAd4cD2oSNE9q8Kd3iMs48r1qUtnTODQfgbqg=;
        b=FM9bZURkLUHNzC3q43I3eGYUKjpcKln1p1D0ezgdcrHM9nMianaledSYTsnxtBMuSN
         pfz8Mk7wmWvtfzcVFWw+A3wWQVcth7ttOioX7P6fr+99MS/VSij4Nz4pRXS3gHPlWhr3
         BJM5XFPEF80O0rTcD44EEAEgJp+eIK/d/MD5rmAGhbhOoEKv7f4oDkzA5rwy8IAu95q6
         pWtSXxP9uYPT+P0Yy9+fxvTF0AfQ7W3ohbuAEnNw+3NZ3zFED+WhH6G9Ke45OYRMJp/x
         exK1ls4Lq/bhCSRKFCj1ySOO04j81be5TTW+StzyP/ETHOe2nA8TqYZAqA8yxxer1DJ+
         kyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167491; x=1788772291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOBwJphAd4cD2oSNE9q8Kd3iMs48r1qUtnTODQfgbqg=;
        b=bJkXRFJUw9+sIEMWvdS4Wuu6O9YFUSXOEjLidjgMil+FOaFPDZ9liraIxZKW4/ItDj
         yk6RPvyVx9co/JIjgKBt8JNYyzjSTx3yQXfn+53XMdmeaNS5gzaS/05Izmq9t46KBcQF
         BrHJWE+Sbe9L70OSTZ47BulkrfPaLhDlMIpUzrL2YlqXu/YRo4jCoaden70SLiN8+/YA
         0TBN2nJplrLx90miRrppRSEjzKPWPX35005W8yyXbeW/Ih3jVoCVe+903c+mpQTwqwrx
         acvyTJAzPulrEtfZlf3ihx8O124KFfqt3gUeVqXYjw4Gye9LtUu7D9HYxB9LhhWHA2YV
         AQpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKP5SnqECFEW/CRxntOCQKB9MGyGpRDuk2+ubzRLQ040Q6uHA3Motoy5HJV7VtpQQegqY=@lists.linux.dev
X-Gm-Message-State: AFuF++nS8OfMfQdPODiIlyxz5704xJVtif4pKz5ZOpVG44/9xHE/H26j
	qYzD9AQXK4a7dK0mEdiznO3yOQK/gHUwN242MhmjSDRx4xK3lFigh3GSk6smp0++pqEEqHUgaHf
	Fisbgio/YnadPrY+iXtntjfs98unRROlczbS/8eMaduAFYDz/PXFQGIg=
X-Gm-Gg: AR+sD12VJ4Rqtco5nBaKaP/9PaDee1UMSSfY3j7ljksqhNf26a1FsNIqJyMMfvGjStK
	RzaAqILrDHxnyVlcbf34LsPBeaz4K/YURF7cYk0YPK1wfAHjkPIe9nbYZNBHq918UQUVjZRe8fv
	W2Eja1Aq/6oCokRuAXzOf54iIAuk3bz4TGCBus0hdNqz+8l7VvXwgAvhPHt7UK1spfUWDhad1ei
	rehNEoXNmNBmRBe3NJ1k+4ohLlOLfZZPS5uOochM4dvZ46M10LILsqRQpNSlDhksvyS6vDVmulg
	0LFXgrBRTJQseUG4TDnwCLc/5AY6QYKKXbLzY5VdBWldejKQyS6um8uqAMImdiZ+4got0fL/Mgs
	XIsxaBdvj32QQBbh8x4On2ehSFv3mo8G9cA==
X-Received: by 2002:a17:902:ef4e:b0:2d8:d4cd:dc93 with SMTP id d9443c01a7336-2d8d4cddf80mr261831695ad.22.1788167491441;
        Mon, 31 Aug 2026 02:11:31 -0700 (PDT)
X-Received: by 2002:a17:902:ef4e:b0:2d8:d4cd:dc93 with SMTP id d9443c01a7336-2d8d4cddf80mr261831065ad.22.1788167491015;
        Mon, 31 Aug 2026 02:11:31 -0700 (PDT)
Received: from [10.217.218.20] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm32564294eec.7.2026.08.31.02.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:11:30 -0700 (PDT)
Message-ID: <06f17ae1-6d42-4a56-88b3-9f5568f6c9e6@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:41:19 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i2c: at91: release DMA channels on remove and probe
 error
To: Shengzhuo Wei <me@cherr.cc>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Wolfram Sang <wsa@kernel.org>,
        Ludovic Desroches <ludovic.desroches@atmel.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yao Yuan <yao.yuan@freescale.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
 <20260827-i2c-dma-channel-leak-v1-1-271d4adc03a0@cherr.cc>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-1-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a954544 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AkmRZ_q-vRwkFVX3bY4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3OCBTYWx0ZWRfX6EZgI40upj5r
 G1qhlOjK7kZ+NavW5sQmXZag4JCiembnmBLjz/geqNmrvi45fe2e178b64crpcGT4NE0U12XKuO
 rDOTXJp2aPPSTPbVEVYNq7GJDSG9+4oYYYnTejPLFwyMfzo4iEA6Sy9h4ifWAUA/h33DZ0Ni7lb
 2mv7SLEPQrmlHVbAhyqOtnv21THvLonUtl1rcDaMhtRz6fFgQ+XicwE37sdOOjoq7eatCfZxa8X
 1u7fWjT/L3pg/S579Vj0Rt0AbTd5mCILJK8RzaMstJsppN4LlThcV7ik48z5x0TrzZfR8i2MbRM
 iJQ1zteWkc7Jwht7OP4EFU6ZMtZgw/4mCXdEkqO0DfB6ACyHCksffqF0IaMNaMV7gxRQSb26Nkl
 i7UXUx8xLDKcdTgg1K6chcxFOc0GORq3sPWSpXZyxZSpvf3TVhxmLIgRv4aEWR4Jr+HvudYl3in
 lTEuXZBQLXbRfg9k/xQ==
X-Proofpoint-ORIG-GUID: LZfMyoYE2_atidKRDMeHoZxrbFSIgQU0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3OCBTYWx0ZWRfXzMqZt5hRpQ1T
 /jOTJ1cCtxvHtxR7I6RZTRi+ojlJNtWYcdxG29OyyCeAocdKrZn4Xlr52sT3zgr9z63NbJUSXTG
 ubwQIHVUtBWUn+8pPX/PpaZYSItYvgY=
X-Proofpoint-GUID: LZfMyoYE2_atidKRDMeHoZxrbFSIgQU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310078



On 8/27/2026 9:13 PM, Shengzhuo Wei wrote:
> at91_twi_configure_dma() requests exclusive tx/rx DMA channels, but
> nothing ever releases them on driver detach, and the probe error path
> after the channels are acquired (i2c_add_numbered_adapter() failure)
> returns without releasing them either, because the remove callback is
> not invoked after a failed probe.
> 
> Move the release into a helper, call it from the existing
> configure-failure path, the adapter-registration failure path, and
> at91_twi_remove().
> 
> Fixes: 60937b2cdbf9 ("i2c: at91: add dma support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> Assisted-by: GLM:5.3
> ---
Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
