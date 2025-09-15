Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C2D202C46
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 15:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757950827; cv=none; b=sHaw93CE9Px8qRouuTW6TSApd/StLJJQawkFWwmWOJRQ8q1SM/FAjdq+7E/uetDf553w60lyrvQ0aw4Zd6ecv7oK/fAa46QiDfeKygzL8gheX9gfcjquPP+nVTwctz3JqTyonL/WChCU6a1sMTW1ObHvtRYEbqoNcVXgmT39Sc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757950827; c=relaxed/simple;
	bh=82L0x2oMofUwCXJw/yoY61w/+jPiOevKC7hOK80hFRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+YwGx2SWVoLUx+x0lGuqvSx3IgRQ5sYaVICcNgZinZZ53ZyByWuqFoaa47/05GzsjW7EOBA/bAn2L17p34qZejsajAe74upCjF68FS9j/qhWjgTvkaDC+aZopJPibNvaPMVJxhe5L9QLcPvXtbw5E6rS4A/1yqTuRGizM8le1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bhenz6b9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bhenz6b9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso8763543a12.3
        for <imx@lists.linux.dev>; Mon, 15 Sep 2025 08:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757950823; x=1758555623; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CbGW74Hx6FChjlot3Wj0dX/C4wldujvmwSh9HaBF/Dk=;
        b=Bhenz6b9/HxhNHYeHEI89C/h6trK/n3Jp0H0rDk1R2pCEawXiUT8w67NxqAAHkTFQO
         RrkcvXdFZ6yWb3uJOE3lDxBb8F9qvfdh3EejBBFfZ51ANEkMNg2g2QYjK7jzeVJTwoE7
         VrsiiY1ArQgEBBA49LiQ+serp0e8UWT3U9OxjrQisGk4ZnESzrvxaH5fytQmuMp67P2x
         nOt5juYbl+Q+W1F2PV4l6r2NqSNnJi5g5n4GIsuW2d066I0Lc+OxKInDNs3KZ78ACwuN
         AEnJnjDoNPPHEftPU1wn03XwWmRT8TI8Dyma+ir2yzXLWAbajltwHOfE3NXBPHBQLTWU
         7qrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757950823; x=1758555623;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CbGW74Hx6FChjlot3Wj0dX/C4wldujvmwSh9HaBF/Dk=;
        b=VV6iB25SotQQcj62TZYHmVTHObbo76XP+LIDgU5cktsCUxLfrf/7xMNSqPAx643RxP
         +Xue80d1+NBj7vZey7OULFZ2wQvrRj5HqdYSV2X1Z/HQPHdL4+g7QsMm/+9Pxg5duLP+
         bKvv3YRrPHQ9gqtWwpCn8NUOhR19dSTpna6sSHUI12MmbdfWFTYkQqc9OxkFzaDPmyw1
         sJCkjIWoxNIeEcUrTiLnHyK4JShR4sImP30Ks8RkQnMypJ64V6avZ1FhaVUTqEW0UEMY
         sXlY9ntzv7yuPwVaOwFDHXzgJvOJc4tNre8yAZH48mcF0ETuWXA37CuSwfZg3pBQz2vN
         yheQ==
X-Gm-Message-State: AOJu0Yz879607PbP+a1OcTu9SvN694f1vGny4dB4MgI5RrTtkt3LX+L+
	EtCLPTTdDhIBfVjJrJVRu8j5pWKc+KYq3C9Q9zjiiclwZte2vtHCyBQBB2P1O2om3Gk=
X-Gm-Gg: ASbGncs1ncrmQNQeXdSF7P6W344/ECRgMlCykPiaGqyRj0r6547tlwq7vPTaoFslHA/
	+3sithLPXMb3Snt50pBEBs/gvE4YW8O3mQ/mMQTJtGcnIe8moh+NetGgt48Z+ZbDsXM4NJ5z4wB
	9c0hOUadD5Q81Rt1ceuWAPUqGx9zhnHH4jMvgLBzVZHFaVmVRm4BI3c2UtGb2vkb59Z38tMHuMf
	chm8ybA/2wiPWgbFEesHDfwb6XAVAw2laNgmCKPb2XBkNPDZv5UcfRgJXk9SDoG7Yg8yPZj8pFq
	21ae2ZjzKpizzPbhSzS4CpKTexxujy0NVqALC1E+HuOFeuxFftoszSKCKKYv3q+a0KbXSvPQXH0
	IpxnWu7TCQJH58Iu7swSgA2xJQPZymIN/
X-Google-Smtp-Source: AGHT+IFaP0APFcnnHzepInFuNe9QRhF2cHCwrhbwHtmb3MUXGYc0B2MoogMChIbOb59TPPzqTW7arg==
X-Received: by 2002:a17:907:9444:b0:b11:4d6f:d7 with SMTP id a640c23a62f3a-b114d6f01efmr309182766b.16.1757950823214;
        Mon, 15 Sep 2025 08:40:23 -0700 (PDT)
Received: from [172.20.10.3] ([109.166.130.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm568146666b.81.2025.09.15.08.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 08:40:22 -0700 (PDT)
Message-ID: <aadda4c7-a5b0-458c-bea7-59f1e983c1fd@linaro.org>
Date: Mon, 15 Sep 2025 18:40:20 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dmaegnine: fsl-edma: add runtime suspend/resume
 support
To: Joy Zou <joy.zou@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250912-b4-edma-runtime-v3-1-be22f7161745@nxp.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20250912-b4-edma-runtime-v3-1-be22f7161745@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/12/25 13:55, Joy Zou wrote:
> Introduce runtime suspend and resume support for FSL eDMA. Enable
> per-channel power domain management to facilitate runtime suspend and
> resume operations.
> 
> Implement runtime suspend and resume functions for the eDMA engine and
> individual channels.
> 
> Link per-channel power domain device to eDMA per-channel device instead of
> eDMA engine device. So Power Manage framework manage power state of linked
> domain device when per-channel device request runtime resume/suspend.
> 
> Trigger the eDMA engine's runtime suspend when all channels are suspended,
> disabling all common clocks through the runtime PM framework.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes for V3:
> - rebased onto commit 8f21d9da4670 ("Add linux-next specific files for 20250911")
>   to align with latest changes.
> - Remove pm_runtime_dont_use_autosuspend() from fsl_edma3_detach_pd().
>   because the autosuspend is not used.
> - Move some edma channel registers initialization after the chan_dev
>   pm_runtime_enable().
> - Add clk_prepare_enable() return check in fsl_edma_runtime_resume.
> - Add flag FSL_EDMA_DRV_HAS_DMACLK check in fsl_edma_runtime_resume/suspend().
> - Link to v2: https://lore.kernel.org/imx/20241226052643.1951886-1-joy.zou@nxp.com/
> 
> Changes for V2:
> - drop ret from fsl_edma_chan_runtime_suspend().
> - drop ret from fsl_edma_chan_runtime_resume() and return clk_prepare_enable().
> - add review tag
> - Link to v1: https://lore.kernel.org/imx/20241220021109.2102294-1-joy.zou@nxp.com/
> ---
> Changes in v4:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v3: https://lore.kernel.org/r/20250912-b4-edma-runtime-v3-1-2d4a4f83603f@nxp.com
> ---

You have a typo in the subject, dmaegnine/dmaengine
