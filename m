Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E551397
	for <imx@lists.linux.dev>; Thu,  4 Dec 2025 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841654; cv=none; b=meKxZjZidr10UCR7J041IxlxJ5Olw3mloMY1Uhsi3uH8h96UtwdgnBFhNfJtPF2uKpyfR59Wa5A+MVLyUwFLLy79TnrijvYvC9Ly3ze1QQeTuWnnrJjiPL1qOhzSd4w9hqkkDWMItwIah/XiPH4G593oRP4ND0EeseV4vkT+nzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841654; c=relaxed/simple;
	bh=JgdK0y9s95PdSwHIdz94K6nzOEH69wp51lC2/c1r+ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VlhJKb3F/8EFKWnFwAQj7A3y/8UjCNvgikcU1NunvX1gfiV93egBT5sb5Xhrzc/pn0L8WulIlcVotMaEYD3esBsjfnTJyiyRU4kaIee0Ucq1jRiggHu918yNX/NrBBiC8JzEOcyeXIa98Czbu1kGX7J6BJD9VxRbxBwO7zP+cs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2SR/SmD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EeyBEO88; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2SR/SmD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EeyBEO88"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468cvO551462
	for <imx@lists.linux.dev>; Thu, 4 Dec 2025 09:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUBfY5jIY1RcuIaYXy/4WSKR4pFxd1tabpa2Ll11nlI=; b=p2SR/SmD+5jskdfE
	NhJBNg/7+rTeMIaxexwvb/pi9N/rbxkNnXPtljm7hFYwK9bzYkagQXFy7FbSq86t
	/pNErXxwuO9vF6liQsqVRpxZBLsPMxEiwWQuOusYb4vKe+exA6RGIebkZVN5I2xL
	Bgruh3zseW6yNvkjD2ae3++7tKRdcbXgzUMfeLHCbEPJ9gZFO7c8wWdJNNYsU8iP
	XxpPSo6QYO1b06IdqOL1OASdmIFTs6YCnm1OggEMK/KTSSVLRUNlmUGsS9oROQTT
	UsGZyEY351Nyv1vE0FZ2f2OWVwRW8vdurF+vsFcNQsAfvwlpnL+XI71fuJbwG/yK
	dpuM2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmdbkty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 04 Dec 2025 09:47:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b17194d321so85150785a.0
        for <imx@lists.linux.dev>; Thu, 04 Dec 2025 01:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764841651; x=1765446451; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUBfY5jIY1RcuIaYXy/4WSKR4pFxd1tabpa2Ll11nlI=;
        b=EeyBEO88UP2Odd751OXtho5Ng6TNJliPsOkVm1PS8FFde8kKvH2eFZN9AxS5e13QS6
         9attMnaeSeIeyk8VXNe8j3hGvy9YGfTsTwp4ERgJeRaeFAL8wckTxwSYhoiMu/BRBA8K
         NXEZfXQK9TA7Cr4yKntYIGN4qoUqo4uCASiMkyb1Ieu6beX65qxrN6EcaN90EbP90aGY
         RkoASa1eCirZfRXgeOy/rnNyI5C5W1zkGJSC8oO3alqG4TJ7rAT0tq/b/pE0AlhL1vqO
         FGLLy/Bd8xFlz2d8Uho+qpOLt6xVfZ1dtu8I2Cic5I/gjtvXJqyppQVRvy7Wr+RjDhL7
         HTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764841651; x=1765446451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUBfY5jIY1RcuIaYXy/4WSKR4pFxd1tabpa2Ll11nlI=;
        b=qnjFErbh1hyst8ZA0kWUe4SvA64J9/btV668Cq+203McpD4qDS00ScNqCpRcvLtcQd
         hWopxT2eSrtp/1ixdzIVv2+ZpJg00h+E4ab9ft3agQjzn4yqEw8h8NTKsBA1olmWgSxh
         NK+2fltFUhzVXeCOJelvET1QKEUxxgQkCY3Fc++8JLZTl38nBv335kOnbwSjDKhrmNcy
         wM06HkUuTGLe1dO3YiBrSemYh3AeeACPxMoOk6Z2OXFZa94UXsLLtF5nQn7/M+upY7sp
         WQ7D7a8O6ncpPaqFyjL/j7AsgGkQI2qSUt22MMby0f05UJaxPnx9TiP+uAjus/TGltfy
         T9uA==
X-Forwarded-Encrypted: i=1; AJvYcCWBM3lgbdZACVPqkMtAP/JB6VHNYTIfoPjnn4sF7/eCEi53SDEyrE8nrFGLzZkQBZdMYKQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuSmTz++EzYeScpAdCews1fXgHRUKMWVY0Rx8kPe24WXe7mZcF
	Al9WrHsDYozX6wbcy4gsniCqmRHyroT6oeGEHGdiIBbv2en1kHvdr9I4qS9rutTKgJKXb1citbh
	TlkgO8Z7UfXj3ZhdOPfsBk8229FUnHEApnUv+vwRvlEGR5Ae3rdEyEDw=
X-Gm-Gg: ASbGncvd+vRnxB9WsEhNAQ9WdSjBywhT6a0daZueUHqxtX+2T0qtVAeB/vgb3mJ9VVL
	K7m4sjsE842l0aBkBHogCYwv2MoCPfeCHenurx/dScOHn7UJRdpPuzyJ0kHRwyDGMfX2u0kSnMa
	sBo8zN6XvLkXs6N+fgTFpF3NFdaxVJRTOqxQJo7b9IFeEesQbPh3SpE19+Z7Ydsv3q41IVuJzR8
	H11+KVDdTV1GSdWyKymImb6gc98RPVFAOAtK2RylsvIjaU0stKc8O9HD3xyU8XNLsYpXSzd3Jfg
	fdDWLwXaVDdjtNXUPhnld48Y5wvvU7ERxzhK8OppPejiDlXkmZDeBlfKjAvrDFQyQDVfnTCkQMo
	3zC81v2MFe8YdhLyFFtYF3QjfAiI79hAa0pCHzQrLHIurn6dcIS2UZGA3wLc2sjA5NX20x9+9ZQ
	95NFSo+JexSzwV
X-Received: by 2002:a05:620a:46a2:b0:8b2:598d:6e98 with SMTP id af79cd13be357-8b6181f1c1dmr276409585a.58.1764841650841;
        Thu, 04 Dec 2025 01:47:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdWBTmtoknkMH8kz6B2X6j3KiGmUlXyUbfopjsR83o2iT6J6CZDZRB/IJn43+50pjA6xjPVQ==
X-Received: by 2002:a05:620a:46a2:b0:8b2:598d:6e98 with SMTP id af79cd13be357-8b6181f1c1dmr276406085a.58.1764841650129;
        Thu, 04 Dec 2025 01:47:30 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6feba575sm4180081fa.21.2025.12.04.01.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 01:47:29 -0800 (PST)
Message-ID: <191ee8f8-b48a-44be-9b2a-3690a362c541@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 11:47:28 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imx: select DRM_DISPLAY_HELPER as needed
To: Arnd Bergmann <arnd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251204094635.1030724-1-arnd@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251204094635.1030724-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R4yEFnNhbwBkVeQU2fabI-94Hujnl_2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3OSBTYWx0ZWRfX19xB8epdngZ6
 1PVPJl/YBo6BpQQJmScu63M76DFSnQwJbNYLHlqHkXFXFzpAmYEoCDl9LSV+a1ctVJzdg6naVWT
 pnPHiFzF+fD4FYRB+YfUCG/AmRWOBvRd90OzPi/LRY4yN+MQhTrUc5JgYgxpe81IwPLJCJJjn60
 oOQ5lQI5CsyBaBZycrn/dP7wUZEdMnuGjWymvBa0R6MBZ/HzTfhsWs7hGQYhyWruANcNIEcE7wC
 NcOl48aw7BJBFzKtxaJABe+AGS3M1WCk86ZbKWRhLNvdaSRsJRoD2F9yDy2UtFYOe0+8QTKYXZL
 y6Mcnwkn6zhlgj3lP9d/e8yW+Cjk1o0eJY76kbNCn/wBhczJmigF1/lT0hpZM3A+pkzB5Letcd4
 UnzCTiL+1Xqmo1wRH/Jmcw0DUxs7RQ==
X-Proofpoint-ORIG-GUID: R4yEFnNhbwBkVeQU2fabI-94Hujnl_2J
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=693158b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=t8mZWZZekR3hrNGy9_IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040079

On 04/12/2025 11:46, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> CONFIG_DRM_BRIDGE_CONNECTOR is a bool option that turns on features of
> the display helpers, which are in a module controlled by the (tristate)
> CONFIG_DRM_DISPLAY_HELPER. If the display helpers are in a loadable
> module, a built-in driver trying to use the bridge connectors fails
> to link:
> 
> x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_bind':
> parallel-display.c:(.text+0xcd): undefined reference to `drm_bridge_connector_init'
> x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/imx-ldb.o: in function `imx_ldb_bind':
> imx-ldb.c:(.text+0x224): undefined reference to `drm_bridge_connector_init'
> 
> Select the DRM_BRIDGE_CONNECTOR symbol as well, to ensure it's built-in
> if anything needs it.
> 
> Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
