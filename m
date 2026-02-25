Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827803D9020
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772037658; cv=none; b=eN1oO5Ctuj07D9I1onwZ08pWPuYiS0jse2YvI+5/Vf8v7YbiBsmYh7UaspMQRSuIfOp821obI8HHmqPh0D1E3i81CUUjQcFZY8P8zxbMBgAkGxHknsttFslEzoT7Le6MbPtFpQAL+CUXwvSzCOTFXR8k16W+17OB73IMfniBUWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772037658; c=relaxed/simple;
	bh=fg1onnz8md+No8HrMWJrdd2FjHskuWmMxJA94664OhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0iRqKbny0fSorJDQpjwXtlhdbsuwZPsJx0mVRqxEmsL15F+OkV1p4cD3GAbGsMgDSRxStx2r8hvjOKUNKm2enbofQ3zlGI1E6bgdP898pj/ADCFsVcgMzwCibJGTPV6ogo1mZ+xDOIZCoLDofglyqti2MF2vqtyTiYAwdDuhXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McWIVGyi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McWIVGyi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483abed83b6so34075545e9.0
        for <imx@lists.linux.dev>; Wed, 25 Feb 2026 08:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772037654; x=1772642454; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBqFP7Hzw46CSYhpPo7qadiVR6MSgoNAqRWTUg+WnDg=;
        b=McWIVGyiL7mMGJN1zg24yfgYnKycNknAxjFOj51eXY6CKbqM5z9CvBp/Hh+atCh9xg
         zwKOa706mXF61SOJmabyKaJHlTAnM/pGOLJ8tj/UqHRbYXWkBqgcPyzNy9A0zQM0k3GX
         Wcsd71CPsIeckqqrajQqZorSQMCn9VaqmzfYN17IiCHdtPHbQn4aO1/n1o5jujOnw5if
         9H4H9u9ThSQ9R3FcTv/aLFj5FKPFpspW4YNOuJkuTFXrXWWNuI17dve4mH+6jT4pmUvn
         PvsR75xkH7T+o3ws9c/9hAWIqf9JB99UNVCUbEkk7VdWIBKStnzMq9kgkoppLL70qqpd
         xueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772037654; x=1772642454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBqFP7Hzw46CSYhpPo7qadiVR6MSgoNAqRWTUg+WnDg=;
        b=QtYOTyaK+3GXqELv1ujXWiqoL5T07veDVio9fu9m7fUZzR5oXJVQYFz8v6EBAi1f2n
         65x9/nI1vFZdODTo7Fl5jvQbkU9V7V4idE5OFUil6036kb9OKJR1pj7DSDb4HT2MKRDr
         3+ZV2jLqLbHXIkNRLGgWpwz3eagNbKF5AaZipK0SYKr40nwvHoIS8lPceSyx/vxtlfXK
         rPyCXAYWZXsVY4ToFEEe07lHwmxl0aiJMJ9+ssFchPgC2Ia9j2k9p+/vo3+SoaAUKp1h
         UMjsfxm3K9N1IJSqrjDPylevPxS7OnQ39Y2ybCCEhRueJ+kzWZDWMLZ/G/5yeM6GskdL
         QlNA==
X-Forwarded-Encrypted: i=1; AJvYcCWBcUaU/35IWZyCh7VcvERl2gSPBiTJnlEaHetV+eYeCmrIMDyx7ObK7weJfhyRcrzlYJY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjeT7dlAjsZhEVE6u4fjn3S0K8n3iSXtuG2w24pyX4HqKOjuOa
	4D0bzcnHsP6WBuL4KZnhwGa8kGMRR/3Ywb2ezvegJAMROTmEBpa+TgO5
X-Gm-Gg: ATEYQzwxM2/tCGS7KfMG3lMwDfjQ4GQxWjIrCTjDsKvFOqt+QG2beFS1g02W16tt2zu
	vkOk7XRBOmeRrf//xzt8KcXd7Lq+4DrufcUp/KHRZktY314ztzKn/69tx85AyMYvB/GN37mQmjq
	MS6P/5AASSMuq3gt0FVCLrLBPQaKc2akIJro4DZuUoZsjkUhdlyreGhmX4gv2Yy5mtZCUmJwZYy
	+uLnnyysmSRQPFStFeHKFvs0BJTTRizBF88QWjGL8xk+LDMMIO1NUEpfq96fphCBOuaqjcs5f+A
	wGuPYoFRkTrvehqDdLg+5AoI37lkiSuSIKJPMlNt877XYUgMpPz+F152yUMxUnD9eOmXh4X0/eO
	C+A+c+QD/ZmJs3qNEDfU9pMk5NU2Ldqz6j2uArjpOYueKpOUUz73LXjrGCZlexIroEwkjgmGhJ5
	Cby7iyLG/RVD/8f8psG1+4b2s7o1fLHvzmwa9irEuOlLDfkoA/A7XYKmf6Vxuy2L0LjCRguOJSh
	LXNfC/a4KS6Qq8UK1BKCQ==
X-Received: by 2002:a05:600c:638d:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-483a95f5a62mr252604165e9.29.1772037653504;
        Wed, 25 Feb 2026 08:40:53 -0800 (PST)
Received: from [10.0.1.128] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6854c7sm183843845e9.0.2026.02.25.08.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 08:40:52 -0800 (PST)
Message-ID: <4307232b-1df1-412c-8105-d9eab181b493@gmail.com>
Date: Wed, 25 Feb 2026 17:40:51 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix unreachable platform
 prepare_ops
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/8/26 12:30, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Smatch reports unreachable code in imx_rproc_prepare(), where an early
> return inside the reserved-memory parsing loop prevents platform
> prepare_ops from being executed.
> 
> When of_reserved_mem_region_to_resource() fails, imx_rproc_prepare()
> returns immediately, so the platform-specific prepare callback is never
> called. As a result, prepare_ops such as imx_rproc_sm_lmm_prepare() on
> i.MX95 have no chance to run.
> 
> This is problematic when Linux controls the M7 Logical Machine and is
> responsible for preparing resources such as TCM. Without running the
> platform prepare callback, loading the M7 ELF into TCM may fail if the
> bootloader did not power up and initialize TCM.
> 
> Fix this by breaking out of the reserved-memory loop instead of
> returning, allowing the platform prepare_ops to be executed as intended.
> 
> Fixes: edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-remoteproc/aYYXAa2Fj36XG4yQ@p14s/T/#t
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f5f916d6790519360f446f063e09d018c5654953..8c8ddbf995a46b01627d15a2eb3da0b72eee6285 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -617,7 +617,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  
>  		err = of_reserved_mem_region_to_resource(np, i++, &res);
>  		if (err)
> -			return 0;
> +			break;
>  
>  		/*
>  		 * Ignore the first memory region which will be used vdev buffer.
> 
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260208-imx-rproc-fix-843dd1031b5b
> 
> Best regards,

Tested-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

