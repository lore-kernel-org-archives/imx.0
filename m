Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5011F2B88
	for <imx@lists.linux.dev>; Thu, 11 Dec 2025 06:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765434058; cv=none; b=HsDDYT5m3SNTCo9sBEhIXVqJDtmGREZDk1Bzje+Gw2JRg9OmpJSLx0Cn+jPpzS91hYFPmarH9FyoS8aH5GKX1wDu2cc+YzyNzwRQ+agcuRjlOvEdPjoTwaQm9pptgqFp6TEISH6JamBrOuwKjBHvkElj49sJk+oFX+iLFeFViBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765434058; c=relaxed/simple;
	bh=mdWvByNAhC0SjDpLoND+534giav7RCsuMpNHmtWgixo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWwJe002HuEcYsm9icBTlGd2qEVocWIXv0LHfDtP4G7kGL4GS+HBOpjXKG9BuSDWkWooOlCdSHcsNnvxXLeEfHdFOsfFpcHrh+etPRlFJ6nsFkFQhOkf51C1imYognCedgrpcLtBSg9xammmgC5DdnsronF8AQmUfT/GjOeMjIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNueAxJB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTz7Ozni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNueAxJB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTz7Ozni"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALSnsO3563935
	for <imx@lists.linux.dev>; Thu, 11 Dec 2025 06:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLW8nRjZcblQM+p+/5/nc7lgZe6nsGTj+I19/7BCO5M=; b=DNueAxJBjjaXcSGM
	JO+03Bj20iK1DEm77+O1eRsdpUsm9+BR+6mB6ygFdj0DzLv1LQbqCGBf2lqYXWHs
	bLlY33N5PZdwIChhSLngOPpnTmIxs5d1pWxhIOZM0Wk/JaKLFFhApRg2Bx78XPPC
	WYJT3xCfVQHyjlU5SajnahfStUyznFQ5BNegpHVoUeRpDLAG4VWs8n8mp0KggyK3
	73d5VNxRHZNATCFTm68xvQB3ovJMXwY2VxyDh3Upgpt38TE+XhglEmx3JyboHkxA
	qhKoMN35MKdilEqIp9FBVG+2dqfdJkDc1Um6Vo98ljeK2gu+LG93nikiR0oBmjq+
	NYkYGA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygtfh7g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 11 Dec 2025 06:20:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-349aadb8ab9so1245658a91.3
        for <imx@lists.linux.dev>; Wed, 10 Dec 2025 22:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765434056; x=1766038856; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TLW8nRjZcblQM+p+/5/nc7lgZe6nsGTj+I19/7BCO5M=;
        b=jTz7Ozni86cDDLnp4bdHx93RJLC6gyvueLaVLRh/35OW4Hz5pYe4BC4TMiu8KNspsc
         pHiP2gSHvUS+zz5DERfaYR7gxshew3+5Un9imBoGHN04/8NoiE5VMd9dfUsZKpJYRj7Y
         M66tN5ghtEh/sd9hmJJukskXRGXVwAqv/Dj8ABGZz9+rCNml8DW69tAGIH6Ri/GMEXPC
         +Tnd9gFL23DnJasljSZoH0bOOmYd80xGLj01uR8ZJkym2NA03+vRGEXn/iXYEGid2sm8
         OLm9zvzmni6Ga+NrQ/zA8agLgMal/aljGEZ7OC+6NmcyjAh8l07mDQ6KLjTgOfnKzzPi
         oAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765434056; x=1766038856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLW8nRjZcblQM+p+/5/nc7lgZe6nsGTj+I19/7BCO5M=;
        b=lYLYkdzBGfM7XHQj9a7nVVUWDGuFbnrPYaFTDDiBMSG3JkQQgCjmmUGmdEB33P+P9R
         DPAG5jDnWlbHqnVMvX9ySzQv7pd8WVUxobNXe1dV20VimlnrQr7pcucDWkL4VoMLwGYR
         3g5heL8URUyZspTuhQmSU9y1u2o914krhjqzU1SnDSCuBMBHzWq+fqA8H8axXdAaWUOA
         v5HGtEdS9U5hFvEVvmPPFqoSLHGq6J2Pr2dji2LhllwTr2T1qNEm/UE302t+Gh6twvki
         BCbe8wmQSLrjqdCmnXR11PrKNeQdUNrNrboaHWIhQS5wSntaMkB3Jl+vA9lmZRLpvj5k
         pA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/Ws41XY7nZ+bC6MJZY3JufYat0fmnVLYQPzJYOAUzyJYhuINpoqs3KZxbz4jRWNRXybc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn4sCbDztPMxHThSRl9toHiCJWW+4MABlsjFBCSAhAaWMm8wXF
	u4ueRZc79EtUhm/b79CzfA02wKtE280ehzchQrGZYamN3K3D1cLiDpFEqE6xiti71rUdxr5AYve
	EwTskDpmNp+QR7SCEG8ZiB5kNDDZOpa8iXEyW0s2OojBFzqkyHxL/DIo=
X-Gm-Gg: AY/fxX6Rumea5niFMAC+s/2fKDVYUODnR7jgTA1MdUpLzqc6AmGMbZtDEGYmHav+uG4
	jUv3l1Mj1oslPfOVF9ptNIW3IC7YSRkb+CajAqVfCTw5qFsc0c1Qo/3Nk8qMaOrF3RtxDX4dL/q
	NL4De+VhsUjabefKiC5S7Fz3DCkQ55HSY7m+DkKZDSxs6UHso8DNGD/xr254HYcItaIFdfpFaSL
	nNql+LE4V72gy+OVMTkTeaG/e5/nq87wiT5e0FnDrre4PjS139aD09eBGNQ5M275oa+Tc0l0YuH
	bNcPM/DasoWKJDJ0T676UJCroQ3KAfqcanRKnWB3Y5y5EBrat39TscO3lr1o4mf+IgvjY24KD8z
	7ichvuk56kY+8HHOlkc9/0OrjNMQENU31AwuMig==
X-Received: by 2002:a17:90b:3808:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-34a72808e70mr5353597a91.6.1765434056151;
        Wed, 10 Dec 2025 22:20:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6+rtMSx1jj4c1CLS4mg+VkC/MYsYdnUQDFMI59fT7NRENzX5kAbQlIUO3MPVG5cnDe3Y+Bw==
X-Received: by 2002:a17:90b:3808:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-34a72808e70mr5353568a91.6.1765434055674;
        Wed, 10 Dec 2025 22:20:55 -0800 (PST)
Received: from [10.239.133.66] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a926b1a88sm342683a91.2.2025.12.10.22.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 22:20:55 -0800 (PST)
Message-ID: <12888de0-1475-46a7-a594-bf7166227eee@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:20:48 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
To: Shenwei Wang <shenwei.wang@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo
 <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        zhongqiu.han@oss.qualcomm.com
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=At7jHe9P c=1 sm=1 tr=0 ts=693a62c8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=2dfgorC2ZuphLwAT5hIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 0wM2uw3EggdyDXLnz0MWteCK_00Ov1bn
X-Proofpoint-GUID: 0wM2uw3EggdyDXLnz0MWteCK_00Ov1bn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0NCBTYWx0ZWRfX/vgdaGtHxFcE
 7DIjs2/7j8+ahBDgUodOQVEHfcFLGG96thdVm0XrWQs2R18rGgHe7iBaXBDmXpjKgTnqG0gddOS
 rKgVORe+D9Za0+iqv3cANpE589ZgpY7kkGMT2a0QjcHtJ0BOZSUZfToy6JnOjqH6tfgIT2vfDFQ
 lxOcMYI+g0yGEqZkE7VVWLiS7U1WCFa3SPJ8rzt5Qu4q7/3kkP+usg0dZtxA8mQ7yERhmbcF3aU
 pTNLNNtqpKPNcI2V+oyewsLc07HGm6GG761jgDahJgnesx8JCuIPhIVJGbzNi4RS1BtvQ8eDfbp
 ODBg3N0t4Jg3Pyu619Ch21BetH4cA1EVinsrlj4LcBLQBgJtJcpNb17pamuOjjF33LiU7oO/0Sv
 vZonH5sE6GeoTxyFug2nWuf5DEKQOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110044

On 12/9/2025 7:33 AM, Shenwei Wang wrote:
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
> 
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   drivers/remoteproc/imx_rproc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3be8790c14a2..33f21ab24c92 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>   		}
>   		priv->mem[b].sys_addr = res.start;
>   		priv->mem[b].size = resource_size(&res);
> -		if (!strcmp(res.name, "rsc-table"))
> +		if (strstarts(res.name, "rsc-table"))
>   			priv->rsc_table = priv->mem[b].cpu_addr;
>   		b++;
>   	}


-- 
Thx and BRs,
Zhongqiu Han
